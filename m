Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA40CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 08:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=skj2iu380j1PKL/xdlE3SsAEeiyHxzabmaPPRXEHU2s=; b=pWyxAAE41B5NXxD0PwkqHZ6CyC
	IE9txLqH2dGqPRozJSnO6gDQZkzxMz2nhYZfjO2A9ADrh8FB2nqjL05N31nwtaZerPDpn+BbxowE6
	2Ch0vNvMxUGedUI2fsMrhk6tQ1Ua3XuzakCUW8mRLftbwdo4EiC5C0cT/2SFZ5EQP8c5MiE3Fax3R
	ZwWVs26Ixe9BGdJCt6NqiPVdyiW73zPUid4quZGovb1dcvaD+cBnc2OrSBNSperS6fWauEmuQ/duN
	Jyrd2dHr728UoK7tIdnksbwm6XzvjvXjpX5+7P6rGdLWPcHSCeTj6tDqYBXJxaehCCE/clI4YfPXD
	v4ZYdPIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJGB-00000007Q9H-0sG5;
	Wed, 24 Jun 2026 08:47:03 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJG6-00000007Q6U-3cfz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 08:47:01 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 98e67ed59e1d1-36d8b644473so629964a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 01:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782290818; x=1782895618; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=skj2iu380j1PKL/xdlE3SsAEeiyHxzabmaPPRXEHU2s=;
        b=h/IAc6nUnibPqgyRlpOzBRP0+St3cauSzYzgvmMEHkIgsIOfmtzg3Cr+0YamBBh0UJ
         2cdWoDhWhFfFFPauNpAsh+km5ljJmt/xq0mYkVgD2QB2ccvUkOlBFqCsZ8vEBVF6u4RM
         h/t8j6BmaYaAbK2e6uSkzHmizAXbpyyXK/7ZQQpWkLwRzT4uJOetA4aNOf1ANSISluj+
         FIrP7umsUcnlOrhjk7pEDn3UWx2TU1+tjHGyHdzCpMncDGTrT1FEu+lse+ZQ5lZP46wA
         2gPzXKCJIPeYeoO5TQhr/QXs1cIom8hECb/jx8ncyBgSCk2LQmKZcMz3vZwy8o2WjQ6g
         u3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782290818; x=1782895618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=skj2iu380j1PKL/xdlE3SsAEeiyHxzabmaPPRXEHU2s=;
        b=FFGUU3Rm64tgWyYSlHGza4qFbZs/zDhn8H043ZLFxY/HUCtrgbrC+5KDvv05iCnMRM
         Sir87tnVlbbIxEnYtTXrd0zEt1q1GmaDUWB+x7YNW/BEbeTdgAfmYCMN4J4uENOCe41Z
         D9fcglozagAlMypPvM1nXEPbiedK9sMXkHelqYrbqFm9Jfd7N35xn3yYUkDSHH2szfJe
         V6K33e+Mw8n/yqmcHSiw2vofE9r37PvXzDpcR2uQOdsJLYlGNzxfI4VUeBjmZOdgITE1
         DScBRqDmMNbEPF/W++2rE5KmdXPeZ0YTvEmpR8aJ03FKAq2bspJ6KZfa5z0wlW8Y1JYM
         x5rg==
X-Forwarded-Encrypted: i=1; AHgh+RrMZaAy5gaokmNjE0Qpymw6qShGgPWvzGDt0h00uoRV+twZ+XsEsPOevNBdppK2SypC1XAyp2L48zREWJrYmQty@lists.infradead.org
X-Gm-Message-State: AOJu0YxcG6XH5fEOOZZVI/gczDwXzVGD0eGc93SQwb3716BEUTPpfPRH
	hE0lxbW692Vs0ykMHIRB+4Dm9/2lKBqYAf3DhDwgo78au7edq8keQBT5
X-Gm-Gg: AfdE7cnU4caWT87GNRwOfbF3cechnLQ7HMVZTNy4iF1LhynQjiSl3qE47uMMk9p+Nzb
	yoQ1272gF75XLKDc/w1vspn/jIR7OT/okPGNk0X55LrN88AJaFMARp4kGQWemJYScosCWRFACU0
	g4IxeWvg/9BbLpxJnDrgIQ3wEa6AtLdQ/BvkHaPtkGf36MVVLduWyx5whTc/wbmpJqe+JFYyaX/
	/VJSQzcBhormL0Cvx6zeRANwfMNMDAR3CCunf+LhWd1pmusbNJWmAOY0mwIDBfkjNYkOY89w7yO
	uo6fdZgpi3U0+1MCnhAF/jt8F38MOPI9J3RSI7Qrwg4uZIAwDAIJ2cUm/hvsfltcr4oAYzb1ENh
	M0SnpGEbFC8nvlq7ZMWzcs3WJ+/z9webyI2kNqNX4BTlg7/oBGD+6tx4v2iPG8+0qRPL9BhIv6Y
	kj3fzLBlVlQB+MJ/jqx2Z6LDKN
X-Received: by 2002:a17:90b:48d1:b0:36d:8e6f:8d9e with SMTP id 98e67ed59e1d1-37de428c345mr2433079a91.20.1782290817925;
        Wed, 24 Jun 2026 01:46:57 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3d152f4sm2138146a91.14.2026.06.24.01.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:46:57 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Wed, 24 Jun 2026 16:44:40 +0800
Subject: [PATCH 3/7] dt-bindings: net: rockchip-dwmac: Allow 9 clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-rv1126-alientek-dlrv1126-v1-3-5aef608a3f64@gmail.com>
References: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
In-Reply-To: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yanan He <grumpycat921013@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782290789; l=790;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=7ocGNYRnYoq9maF2qAH3laNWa/8XOoI4f7GpRXsmMt4=;
 b=uzOAy6qn4x5/EXYbBgpWhNj60Kg44wCLTm0qHhvgeTMI+w1MXiBW2yw05av0FmzEnKcNPFl/2
 lhmTEwFcLUWDNbN0W8PzbS2ebsv35H1x8pduzk0iFDXlOiBZFmhJT3E
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_014658_899416_EE194600 
X-CRM114-Status: GOOD (  11.72  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

RV1126 has a separate GMAC Ethernet output clock used as the external
PHY reference clock. This clock is described in addition to the existing
GMAC clocks.

Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 Documentation/devicetree/bindings/net/rockchip-dwmac.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
index 80c252845349..86a7e83675ae 100644
--- a/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/rockchip-dwmac.yaml
@@ -71,7 +71,7 @@ properties:
 
   clocks:
     minItems: 4
-    maxItems: 8
+    maxItems: 9
 
   clock-names:
     contains:

-- 
2.54.0


