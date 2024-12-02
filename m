Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 984DFD4979E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 03:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LwpNUnjMlFvYQmQxOKj3RBcYwjK66Q7pEDvGTCX7zBM=; b=meDyG8rhyR99upAVRXwDNcy8yt
	w/9t/BQaEIJsvdulpIQ7ryff3JNb2rDYJJLNR8LreRVf8b8/LA3lRG84LXbLfMje8KmyaC+vPDaWv
	n7TRa7N5pTMySfBs9ww6LDfGkfmYMfyHGCbdbE+J2gVPCz6snDuA5FHppYzNGghHkIhxofZ8LWPXr
	sp7tcvAdSPpSTazIK/5w+mGT0DUe67O6RmDcF1nxvzONdAlmYp7bNhcB3cxIwgXXgRPjK5eoy2HjR
	P9PYD1htMIDzKU75DMn7NBCdqEKwenQRDsZtbdn8RTH5JVH+mkiZDp9wiRLKYSw/R8jW4JOZ4ik2h
	NFmzEDTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHx9l-00000004xIv-3BVc;
	Mon, 02 Dec 2024 03:31:29 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHx0D-00000004vFV-0TN1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 03:21:38 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21583eec308so236075ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Dec 2024 19:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1733109696; x=1733714496; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LwpNUnjMlFvYQmQxOKj3RBcYwjK66Q7pEDvGTCX7zBM=;
        b=LLs0cd4YED626Q469rSvFeRwlMmWYzZ2YJqamnyWza/tXZchubDP47xvJ2N+w4NfwY
         ia22gaGNqtpXFWbiy4/RXlyq5CU0DKTdPzL1d4B9IIFgKE8HueNpK85+lT16JNWZh3ge
         yhepYL1w4sMZY4fxu6ktsIi9RZkx766CDDk9ff42rg1UaPXmiO3TNp7d5dy1jleiNZP+
         Cm1Gvwus57E0AwCxtgveFc06RitmSqXg6aEKiA+c3LwJtEo36+kq4c9l559XyONVKIBb
         QnZVuueUpfZZJXhXr3SLM5srbSFA47JclC/kJU44CGI2Nm4hfwOlTKY9mOd+hdvJ/I9G
         ZcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733109696; x=1733714496;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LwpNUnjMlFvYQmQxOKj3RBcYwjK66Q7pEDvGTCX7zBM=;
        b=cD5LoxPAtguBAIeYrmO5xdk3KCgxKq8poo933Zpf9+0rlH87T8EcYLnkOvowrlAysn
         pc0CeP1wDI4Xdihrac6Feha6rfOLJxvvSNeDTeBqDFmlAgo7RtMqBUGj2PaKt2DKm3LS
         lvEhzitcp7wm/SwAH9H52NnVd2KkW2fLHaMfdygmU4VFDmiqFy6CxKfunly4CV1r2/45
         JnWYFHsRyt1byg9B2pVI6iozGYS5DJrKPL6xU8NLUSWBY0jd69S9HyC/aV/dpX9ZrFiq
         1Ikis5QGS0zjUN4bDGtrQXRST68NNHZdcUvBt2YIjXigmNR/dTc33Do4HyMeKGBlYNW6
         fdUg==
X-Forwarded-Encrypted: i=1; AJvYcCWqez6iwm+BUSnS8pdOsmFYsaurTpFqYRVSEZ/1afyk2qKNc0ZAFEcUsXXwTQa6yLcnRoNdyw/isG3jajzZfDnp@lists.infradead.org
X-Gm-Message-State: AOJu0YzqHuUBdiU5a+RsOqK1GWkjxR7A5duEWItQdBJ4qYQqd4CYBNh2
	REwcUpfZOYUHGIU+lQchGJN3UckXXl1TVRcHRg0xoBoOr2MLYU1dpyx5wjfUtjY=
X-Gm-Gg: ASbGncvzf+ZgF65k7dMCN9KgyN7UKJyiOeAGzxJrN7wgfzO7N9Yl5+esp2XVMOy2Z6H
	F/eC0+Wk4ZLmDPKC82iLzRic9DPxztA1ExkzFysNieFMnKogDlNYwfkTOurcgdm6HlY8MxX2gLc
	L43lXfrOCzCNW1AESv+77u5nxFpoRoOTK5GiUchUlGmW1ldCZJJDGjtFVks7qI04dx5QXubvZak
	tscWEy5VxLGmx1J62nG0n7H4GW5VpxxAaNRoi14x+QTD+oYrBXnwbnCWtg6rR0HFFeBG6e9hxOi
	6VWJj/VXInhimg==
X-Google-Smtp-Source: AGHT+IEJN88pnwqqXHYSIyic7eyBMjw0obUFHPnwV3eN7HNKvCq55lxxoodclMDswm8TKyzGp9aVVQ==
X-Received: by 2002:a17:902:edd0:b0:215:435d:b41a with SMTP id d9443c01a7336-215435db4a5mr63665425ad.1.1733109696542;
        Sun, 01 Dec 2024 19:21:36 -0800 (PST)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21521986004sm66305725ad.184.2024.12.01.19.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 19:21:36 -0800 (PST)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com,
	dianders@google.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v4 4/4] arm64: dts: mediatek: Modify audio codec name for pmic
Date: Mon,  2 Dec 2024 11:20:35 +0800
Message-Id: <20241202032035.29045-5-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241202032035.29045-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241202032035.29045-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_192137_151745_E56B0F72 
X-CRM114-Status: GOOD (  10.97  )
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

change `codec` in pmic (in mt8186-corsola.dtsi) to `audio-codec`

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index e324e3fd347e..cebb134331fb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -1276,7 +1276,7 @@
 		interrupts-extended = <&pio 201 IRQ_TYPE_LEVEL_HIGH>;
 		#interrupt-cells = <2>;
 
-		mt6366codec: codec {
+		mt6366codec: audio-codec {
 			compatible = "mediatek,mt6366-sound", "mediatek,mt6358-sound";
 			Avdd-supply = <&mt6366_vaud28_reg>;
 			mediatek,dmic-mode = <1>; /* one-wire */
-- 
2.17.1


