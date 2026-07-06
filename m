Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 642F1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nE3XF9TJ3rEGOneChwFEqNNIrveo5+lTJId+Q3nPPQA=; b=ow+nEC7HuHC+0Oa8EC7JCKmkMw
	6DJ4uQIlDc06C2IkdkonPjH7ABch7GhPn4gpmGMV/JTUYM6CGmllHcEvJka2FyRMgrXyZsui+gUQB
	cvSkQ8+RJq64VGnWxw8Y7vS4wC7xaUz23bCE0fMxgPNzY91BGgwB4slvYnY6p8AsrXZyhlEQveQOz
	/UypjEK3oWM59hQ6CP6wR2GyQbmtVQFLAqRpmXNfKfZ68s2EjqaFK0toISMyfN0nRvV179IUa9Xef
	zubheXyjOQwDW75+PI8Le7Z9k15tjrWgIj34npfVgWnO+qtn+6vFMmZBoE1OCCoBnQ8oPxzX1d+Tc
	VYgRXBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfQ4-0000000Bynw-3ziS;
	Mon, 06 Jul 2026 09:15:16 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfQ1-0000000Byl4-0Eld
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:15:15 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-845ea8924a2so2719802b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783329312; x=1783934112; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nE3XF9TJ3rEGOneChwFEqNNIrveo5+lTJId+Q3nPPQA=;
        b=fY/NIK0zWOKrgsK/Bq6zECQeUb6vARUa9yDPocoTWUy8T8z78r8YG/cajUTJZ9SaU7
         R0Rf06SNFlbxW0qZa2hPKzxuAnEPHUQuMg/8FFJmGggC3XPagH8dKV37GDixf0H1lidE
         CJyOkJTiJfWlybMhTaC4rDgAJuY59QEpoodz/T0HMobWTUXd0mxZxGSrRg7WtEJq2HDL
         TwMJaD2yj/mP2bkcZMO94jK4T+2xKyjQnFJ1C0EEy7z20Ifuz3dYnD1LfNxXdeOwxFfG
         4ih8U4aSWsgcFTXNorOyggwv0fGtnjzmJRUBAlzcToN0qCqp10n8DBKkfipGyLHCu51r
         SIog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783329312; x=1783934112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nE3XF9TJ3rEGOneChwFEqNNIrveo5+lTJId+Q3nPPQA=;
        b=GQzWbgESCMdscQ/qRZuHzCjIMf6veG4JwKDelkfqmT0EnW3MvqBKhqzLTLm4+N077O
         payg1Z0B8y+Hq3kSY1nuqRrva8dOvwWBm25ogggddwWtj+pW7hlDgfoeMA/v9yRvxOaQ
         4h9iOIrJhPtSwJ+gm1gAXJBZGEnQPaBQ63TgDlgAJjN6kg2WwseECnB9oqbmg/6HoVV8
         MvdLjXH5LyHbPw6GiiAkcof0GYwjJK+3ceEqrKJnma3S5D03mwYb4P9Vz3Xe72oYCBFK
         RuEYj+YFq0cyCuCBLpnFUnCq0COvPUvk9ckeAh8LnXqvKFA5pnujR6JOb0Je1Q9ZNHo2
         Wt8w==
X-Forwarded-Encrypted: i=1; AHgh+Roq99dOSLCA9w1OGgDHATCG/NybBKCnob8yVSOlX4SO+O6GXoNI41V4nB2T8oYPMHnZ2IgTGueEZhu/aR19CXp4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7IdySRWZoe+m6PSuXJaucCoocXfGrTXd4kfP5W/UlNQ0UaK0V
	j2mze7dkENqp5RmIvas0cFAovEjb3wshMSpNw/Ffw1YMMgEG/CAU+KVF2ocemeCpjdE=
X-Gm-Gg: AfdE7clotMLKOOiW1heecztr+cTfo7McNXBCT8bu3HjBl6B/4dVocQNeJpYEN1M3H36
	Ai6Qeimn56PFZEp8txynNerxvuKH6hgEuzFdT3WSgEoZOU52+uVcQTLhIH5m7542ZzSR1IvGUkP
	bsb5F0d5z8JMBOFL1sAJYeAT4ylxv5eUPFN0MO1CQwWo81zLLWZD6ySm5wkSL55JmCYJU4eLR07
	1fwsUc2J9oHUXoTY+WXB1pBke7QOBqjOSLLpJ5syDPbQofH1AFErH+ZFJKUAAER2Ppt8N9ZyLUU
	mNxpM34TyTZzrng84KvnT4O3Uba/Bq197o4oqnOoNrHKp2jN+QWbxuZf0jm3XhVdCfOW9CssZxj
	tnXiLyqKuMfYGndejKHHwj5TX2qBB85JmsuT1MC7TPWYXBgEjHaeBOKyq2T+D3sLFBdhyNGZCeN
	doBZPi00CMPwTwvHO6EMKQ5eEX
X-Received: by 2002:a05:6a00:744c:b0:848:19f4:3b52 with SMTP id d2e1a72fcca58-84819f45421mr1984897b3a.38.1783329312352;
        Mon, 06 Jul 2026 02:15:12 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6db29d1sm3445963b3a.53.2026.07.06.02.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:15:11 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Date: Mon, 06 Jul 2026 17:14:42 +0800
Subject: [PATCH v2 2/5] dt-bindings: arm: rockchip: Add Alientek DLRV1126
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-rv1126-alientek-dlrv1126-v2-2-ff3176ca362b@gmail.com>
References: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
In-Reply-To: <20260706-rv1126-alientek-dlrv1126-v2-0-ff3176ca362b@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Frank <Frank.Sae@motor-comm.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yanan He <grumpycat921013@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783329286; l=1084;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=hEAydHqntdYMnlyAwKWZtU7FCzzrJfeB5kFdTHg3eh8=;
 b=oUIvb0p8xJrOQfktVGkGTJAbXV6vKYwxR7zox/cjJFvRifrU/XZQte3H1tZqxq8jemi+Qu5h5
 kI0XpBCrB7QBLc9+7DAvO63iyOniB4dnpGDfjDqMs9cydUzegylaX06
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_021513_500818_E47C2397 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

The board consists of a DLRV1126 carrier board and a CLRV1126F core
module based on the Rockchip RV1126 SoC.

Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde18626d..9058f2a461d5 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -162,6 +162,13 @@ properties:
           - const: coolpi,pi-4b
           - const: rockchip,rk3588s
 
+      - description: Alientek CLRV1126F SoM based boards
+        items:
+          - enum:
+              - alientek,dlrv1126
+          - const: alientek,clrv1126f
+          - const: rockchip,rv1126
+
       - description: Edgeble Neural Compute Module 2(Neu2) SoM based boards
         items:
           - const: edgeble,neural-compute-module-2-io   # Edgeble Neural Compute Module 2 IO Board

-- 
2.54.0


