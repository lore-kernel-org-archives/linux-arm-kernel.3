Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A634FC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 16:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FmVpDCANpDWXjfc77hOC3nlqo3wLCB+cB+2xYUcVaDA=; b=dqYZTb/F0On7nw1gUcHKyBcrwH
	Rmd2+iP1ryir5NXQOM/YAvDMak1yroNURlI2f2qh5EPWC//6vY1NIkN/splk+tRk/ISyURZ8qPeIE
	58DgnrmAYvvfybEHFzMk9YmoNcKNRtpWLMc9YrJWUn1hmDFN2rZYxQA/N6aTteuV3YSH3h7kv5qma
	9GBv+RWqfzQBsC3bDzRj9QYuEcvuUjfPq308zhTphRM/9BgDmr84c3kUsysYX4KKP/PL7C267Rx8H
	DYnu4U/Ji+0uN3ioxeQJoKSZoqM9VAE2PzGnOffmaHBAPZYku6wgZhgW9YTLYNt40puUN4o2ohnPh
	K6TO2GMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z2v-0000000EZcC-32jf;
	Thu, 24 Apr 2025 16:03:29 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tmJ-0000000Dfd0-0V64
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 10:26:00 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-227c7e57da2so6613725ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Apr 2025 03:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490358; x=1746095158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmVpDCANpDWXjfc77hOC3nlqo3wLCB+cB+2xYUcVaDA=;
        b=JC9uoW4kSaCTWO7B5OfhVwr3rNqvfDx09n1pLRMDXyB6KXj3uC1OZQ/3CTbi8tR8gF
         DCvy7msa98A0LLJLftnYtj8r4933/jA2Hp6Z+dtY8YvaQKueLyBcra7eRi6Fg/Mk+Oq3
         tIqySEdhZlVsvnTlN76JwRlwxkVpAcR+7SwoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490358; x=1746095158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmVpDCANpDWXjfc77hOC3nlqo3wLCB+cB+2xYUcVaDA=;
        b=tCyeD0Zom/RrWEz0xbmf4UOTCd6EL4sN8WnydNMkXTQjyau+fZnUzbmCBgc7CHkogY
         pDtXn5oHI34KgFzSrhwuf/xsqpwpHrIepKu6+DJe/eT/0MmsGXPjOi5+Nd9iJqCFnMt8
         7jcxkGeKI0JXSbrx7xij33CL9UPx7R+M2dyavhDIU3ibphZ2uVYY2EmOCsAgjFpRtNX0
         JDJQnr/hXDQ3BxRByjLPyPlhvWPQrDmPG3TIX9aabhJARZ5ib1A8FqAQDj/g5pB9Cc+2
         4ZFEiDyuPF/VhyzBUpty+mxEPwqcgGJGopJ7ce+FnjLY/sW626TF8xbTY2haDP/6tg2c
         Lmvw==
X-Forwarded-Encrypted: i=1; AJvYcCUbJ5mExMq4WIdpBZaBtERtuzG9eZcG+w/xXYYeRhAPYhYPo/sczyanSX3SCfMB9/ut7h/qmmpNlKUu3ek1Y3Lw@lists.infradead.org
X-Gm-Message-State: AOJu0YzPcqaH5zzLkZ9+SZLf0WULc8Ea/chXykaBq1ZU77A+LyWzbVRT
	oaSv+t+bGUmVnly9TFpbNMjrNToXs7VhQgWH0qGvDVU5lA/4KbtCu30yMJu61Q==
X-Gm-Gg: ASbGncuTM1mCSKxIyclRE5kT8ffm5Fw89cUN4b0y8b7bGrehiI3uK67RbVJS3XzwsUb
	rFwCl4WtfPTtFSVNxsYTaUO0qSRNNVNDHDhRLtolMyJ3fW/wJjNFdeTZnftgQlQD/rREXVOW2az
	IaJ4VjjlCu+OXehZENHajKlCDeiNuTflIaugNLbL7RWMfNzsDVO8ysWQ0slpGp7K21u7JAuAgvq
	SSzTGq2j+AD/K4nSUyG5kuNeQOn/jx+oAAU5sBok1hWBZoZ7IykxX1x1+vvtHzxr5ZuAeuUj7Mk
	4xo5mx5P1odrUpaZjtIcksbuvRw7JxRuFZfNUGieamT4sBJB4kv+MLhRkA==
X-Google-Smtp-Source: AGHT+IFNUWW8GiZ4JqKUF9pP/L7lY/ZM2afy9ZsZUC4Qoy35aYMkl4OZHCBcklsXj7mBYosm+Ajr0Q==
X-Received: by 2002:a17:903:3c48:b0:229:1717:882a with SMTP id d9443c01a7336-22db3bae48bmr32665265ad.4.1745490358416;
        Thu, 24 Apr 2025 03:25:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:57 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/13] arm64: dts: mediatek: mt8186-corsola: Reserve memory for audio frontend
Date: Thu, 24 Apr 2025 18:25:06 +0800
Message-ID: <20250424102509.1083185-13-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_032559_164177_2854DEB9 
X-CRM114-Status: GOOD (  14.50  )
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

Some MediaTek platforms already reserve a small block of memory for the
audio frontend. These platforms reserve it at a fixed address, though it
is unclear if that is due to hardware access restrictions or simply
compacting the reserved memory blocks together.

Reserve the same size of memory on the MT8186 Corsola family as well, to
align with the other MediaTek-based ChromeOS platforms. This also helps
with memory starvation as these devices sometimes end up in low memory
conditions.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index c864ed495702..b139588ae246 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -161,6 +161,13 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		afe_dma_mem: audio-dma-pool {
+			compatible = "shared-dma-pool";
+			size = <0 0x100000>;
+			alignment = <0 0x10>;
+			no-map;
+		};
+
 		adsp_dma_mem: memory@61000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x61000000 0 0x100000>;
@@ -310,6 +317,7 @@ &adsp {
 };
 
 &afe {
+	memory-region = <&afe_dma_mem>;
 	status = "okay";
 };
 
-- 
2.49.0.805.g082f7c87e0-goog


