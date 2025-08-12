Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 561BBCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jZ4gc/Zl5lzZDEjUwdPD/JiqefAjh6ZunVQqiM20mjs=; b=iIjOJXpU5aD44ia3KPS95hnN6j
	UI5wceUUStD9Ako/aaA80+MgwZSqu+KSshyGcuCkBhqcaZITQIVMRRaO9jon0Zo78O6ILQAMIxaOr
	COONjqBO6Qsd4l6lPrQISZbb1XJnFetd4pA8dz7yFjY6vCRTmawZAKMyZVZSnurTWAH8HrpP55xvF
	P8dB2VL30Gv4dK6qDscwG3Gbd5GKMLo4AdDk/1EwcfIvVUnfNfxDmomBpmvvpssJ1uf5vCJT0+XVC
	EE6kFus8bJ8wvt+dqtu0ZLnF98JsiPx+KxHwJtXbConGHAZKs0qwQfkT4YbIgCA/LankO7Cn8gBfH
	tOt1z4Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloHs-0000000Alva-21Ih;
	Tue, 12 Aug 2025 12:39:32 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkqf-0000000AJh9-3Q0b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:59:15 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-76bfabdbef5so4320985b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754989153; x=1755593953; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jZ4gc/Zl5lzZDEjUwdPD/JiqefAjh6ZunVQqiM20mjs=;
        b=eedOBn/2xfydnMUe2KAp1cZC6kXIlpuDWzQ0izGe8tfMoStzNbb/xmK00+43OvnDGD
         9Tz5RRi6OBpZgoitxCgV/nB2yFH0ojz2M4Ul+Wa8DnWTQNGEe2oz0vIibDPfjTsJSHtD
         TwckhKk/Lw6SF9pdI6TfcRTqP0GurFoI6d9Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754989153; x=1755593953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZ4gc/Zl5lzZDEjUwdPD/JiqefAjh6ZunVQqiM20mjs=;
        b=E53WjxWaBq+IXxTOs3CRYZsQgxaqqMXkkoE+3EURb1YL87uz+AxN9wWMvminedNdrG
         3J67R1hfXNi7R9v8F4RuCyLQejKqTE8G4ETXp55vqLzZfCX3g8XLGpQHPkKd+awy1/l5
         wLmJFxcJb74xdRpvMRQfVQAOAhWpxfCKz8MF2IFZJjZQ9uDiQjT6W1RVVBqtRlGF9evG
         2A7olkaMoMAouO9THSdRqEZXvQ6PKET1MuxcAWapHmgSELrbieCloQNqJD5lGiGqamZS
         ns52t/9LJaRtlpln0wEc7Nv5FXULJY1RRTExGqZkOHr2UDFU8lJ9hInjcJB0hjS64OY/
         crdA==
X-Forwarded-Encrypted: i=1; AJvYcCWnChzIk9vULtLq8aGI9XFid7Y1FZfGaGrBa45tOLk8qx3PgngTlTlPlT5lWojKR46nC2tZ+YcHNMZjn7TyJrI+@lists.infradead.org
X-Gm-Message-State: AOJu0YxGyY8lZmBy8/s7ApFC7iF93EHsGYBcZOiiEpToHYRxsCi3hZMj
	j60uPIk+2mAdNGto5yI77Yg3gg3PCOVl2T6WSKO/ZttdoI5D0tCk5rMqTr34/UXb2Q==
X-Gm-Gg: ASbGncv1XVbL4UF+/mjur5q0c44ffY0WMmEx3lwC/d1BG5deuzuOuJuK5x/VhTyq1GA
	3bfpwqNQh7IFiv59mTrx2//+YPToizUOJvOq3jPXNkERYKWggu71/70RaD/Nv+rlJ5hzO2lcJ3a
	Trsg4JWg7znpY2NIuQgP3DpasDb9hRn1UOO/626KByOwp5PuhBFrJtvoQ0vgIVKz0Caw/JmcLJV
	NbqUCD42TtrOX6hMrAJwlvJQ4viBUZdS79euOxGmqFKUhY0mOyzXVAPWrsG1rW+EPUD+snOvBHW
	p6rFxE5QQ03uhWNHSWUosJj19mF5q4kbugt2JCPxLc7ZlVh34QLDddGwp/RCZJG3mL1HnGwGJUw
	g92Bi/7+KmLhzJcpWowU15HH3+GR6Kr+iwklJqbmn
X-Google-Smtp-Source: AGHT+IGXDOk02fIlA5qGSfKYGJ9s90O7hcZRHRwO1X5CkCWLtg4wt+uUNkT/Lzp453pl+RrYTnvzDw==
X-Received: by 2002:a05:6a00:3c94:b0:76b:8b13:e06a with SMTP id d2e1a72fcca58-76e0df53209mr4119372b3a.14.1754989152945;
        Tue, 12 Aug 2025 01:59:12 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:f81e:7c91:8fbf:672a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bfcb26905sm21989442b3a.123.2025.08.12.01.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:59:12 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8188-geralt: Enable first SCP core
Date: Tue, 12 Aug 2025 16:59:00 +0800
Message-ID: <20250812085902.3309160-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.0.rc0.215.g125493bb4a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_015913_854365_E765BA12 
X-CRM114-Status: GOOD (  11.00  )
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

The first SCP core is used to drive the video decoder and encoders.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index c5254ae0bb99..10764786bc21 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -164,6 +164,12 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		scp_mem_reserved: memory@50000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x50000000 0 0x800000>;
+			no-map;
+		};
+
 		apu_mem: memory@55000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x55000000 0 0x1400000>;
@@ -1146,6 +1152,16 @@ &postmask0_out {
 	remote-endpoint = <&dither0_in>;
 };
 
+&scp_cluster {
+	status = "okay";
+};
+
+&scp_c0 {
+	firmware-name = "mediatek/mt8188/scp.img";
+	memory-region = <&scp_mem_reserved>;
+	status = "okay";
+};
+
 &sound {
 	pinctrl-names = "aud_etdm_hp_on", "aud_etdm_hp_off",
 			"aud_etdm_spk_on", "aud_etdm_spk_off",
-- 
2.51.0.rc0.215.g125493bb4a-goog


