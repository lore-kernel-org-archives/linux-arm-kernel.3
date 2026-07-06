Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C25C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 19:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IuhJj+HUo5Ktaz5cJIt67wPPHXjsVKySj5VwgZdB+yw=; b=MnrmGufUepDv+DUb8IavCPu8fY
	SG9mNhrdPvPPJskQDlVh0Osh82fh35gLXpD4iw13VnIusUhtoOVH04wfvX4rdvQNyX3YhYjLjfaUY
	VDg2HKtTZpzdrlUi9Gbm8c8k5b3g16ucfAX9xXUJLCiYcYvWOg0EamvQY3e+JPLCZqmNV/wM6G+dE
	YbmdxgvCYk8sgF2T1bsqfI09tvYT/OPI3JvoCx8ZCuClzJiEsqdDfnH8Ec0aDMepR4OqUyYGpZq4r
	XWlB4b2ML+PIx5i7FZfKSdK3rs/2LYqLN3Xvw6rfvNWne9lBgobIRPYvbJKc5wlXahS/sLZeRUCTu
	/Gej4wVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpTN-0000000DVDS-1ZDn;
	Mon, 06 Jul 2026 19:59:21 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpTI-0000000DV9T-3teb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 19:59:18 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7eb42a2f5feso1239207a34.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 12:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783367956; x=1783972756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuhJj+HUo5Ktaz5cJIt67wPPHXjsVKySj5VwgZdB+yw=;
        b=nXN7ZZdcG4/G1WPj4EANs4rT/v2fTLkp4h2TBa0WY9r43pfB5Ejb4iERs0ALG7YYXT
         ctg01IYqwwOXPzFGNJAKqwkyeUoFiHdHk9aUEF5l4RAt7ON3SNv1w4YWyVQsxzPzDh6m
         TRwrSjwEmaZcZhGmMEgIj9Mx9KiFiIyqnAKmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367956; x=1783972756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IuhJj+HUo5Ktaz5cJIt67wPPHXjsVKySj5VwgZdB+yw=;
        b=Q1xCmlDEV7JLz28aqb0hVJSXlnmVT/qhRP3JegX5s4uGeinXvKgy6M5CiSFLtrFMbd
         7kdu9SWtN3v5qjmagztEDdLclbS8Lyu2r/p3Gq16pARoLSbqU1wIYLaKoN15sDRNBSnk
         xcbH2dgFYUXlV1fW5czybXK9Buya+DUD66lGiK+MqYUiw5W8etmTgcaCAh+7JiSi0DQz
         5+G41ii7KsKOxMRnh8yxm63cJu4BRNrDqfFAKZWgBCeZEXcsquf4pQfiWgZkggGcAprG
         6zZlpwUbWo+MFKl9S9hGWb1xiF4F0LJpBTAf76uz83ptPvuEi6gFp3NLAKD8LYtJRotR
         kR0A==
X-Forwarded-Encrypted: i=1; AFNElJ+MPESiMjS5VBidm3+64XlJ1qDShEFZJ8X8hF7wEsMpTxTHQ8aUamBxRGn2v4bT2X5WsEsV408H39FUi8YniX6v@lists.infradead.org
X-Gm-Message-State: AOJu0YxeCMeemLjUyZEqulDO4b2BXLKFPqMteAuPqwm33Q/nPTho7R8y
	/kbICSEG7WF4rPrftIObzRfZCNsJOf+Jt0TxRanB7SF6opgIgrEG7CdF7t76dzWK+w==
X-Gm-Gg: AfdE7cn5ODVudoaj8nwZPh9vp84wsyPPIOOagCrkr/NYBW5jJ9FPCCyGIMgAruCAczV
	9aaOfoEP9sGj4D22vwBq4rNSnPOdyzILj1Ia3iyAc4coWtfyzJXDTHIlkDpDmiTCYjMbmp/EMtd
	B81wMjjRa0bHgJwq+ZDJ4XD91Xl72U6/ISH21RoPJ2k3eOfMittmkIviFdTxBS06GibmDL8TFsI
	ZWq0fPqrk6C1eScJc2Fd4gnnBnTGNtN4XskGXLsftG1Ban54HMcJXZ3q5LESKVDEXAaoUfzN9I9
	tfA6vP0l6PYRT1YkEfLmn3vAD3v5B42qZlqfsDTpsNpkrYUEHMwUuRfagAyrjzhytFTe4syBvN3
	IxA3lHdF8itnhSCuT8+WYsoW/VarRWlyG5zEkzmyWBo1V4XM16d7sjnArpi1iiTfnx/r8A+q0QP
	a6WyTUjT0=
X-Received: by 2002:a05:6830:6ab4:b0:7e9:dbbe:5afc with SMTP id 46e09a7af769-7ebb23d1703mr1257460a34.32.1783367955684;
        Mon, 06 Jul 2026 12:59:15 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7eb542d017csm12161834a34.8.2026.07.06.12.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:59:15 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	huang lin <hl@rock-chips.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] dt-bindings: pinctrl: rockchip: Add RV1106 compatible
Date: Mon,  6 Jul 2026 13:57:59 -0600
Message-ID: <20260706195818.3906949-4-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706195818.3906949-1-sjg@chromium.org>
References: <20260706195818.3906949-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_125917_171870_606642B8 
X-CRM114-Status: GOOD (  10.17  )
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

Add the compatible for the pin controller of the Rockchip RV1106 and
its RV1103 package variant.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 9b3cbeb54fed..81747bb53056 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -51,6 +51,7 @@ properties:
       - rockchip,rk3576-pinctrl
       - rockchip,rk3588-pinctrl
       - rockchip,rv1103b-pinctrl
+      - rockchip,rv1106-pinctrl
       - rockchip,rv1108-pinctrl
       - rockchip,rv1126-pinctrl
 
-- 
2.43.0


