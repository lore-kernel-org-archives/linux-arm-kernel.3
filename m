Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3682CD343A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3KiKQ7J1YhGEy4V5AW2fr2heaf9v6dJ/SRBQ8mnN0A=; b=ejwcZQ4J6QW1mUKwkSq3DRyWgm
	GAMs75w5PcA32ZBvgfm2bi6M0oCqeZEkOBp+W30Ct7Xf2NKtMrz4Fyj6A8aGfTE55SU8lVxlv/fEt
	R0tfUC57Lgd/8u0BuqvKHPKe4vBUH1X3Ixign70OUb8+bdAoo6S58toBZo5q09T6sIOhazPc7k7DT
	PhoMBWPiH5MGnhTQ3dNLsEHyr9LFEJnvDeYIGjolBaV7nXhZ1Lj6FO80BQEZ2FXh1HxQM9bATRTgp
	4dvLinL/Z/4LjPl1qaFDNzGxzlJ0b/eRPKziaHpqVzbWrU+5eqhdpqoRgWCJSTNhClU+ATRWxWvX4
	taagRilA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnZ-0000000Fqzd-21Kz;
	Tue, 05 May 2026 10:14:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnX-0000000Fqvf-1GtJ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 10:14:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=w3KiKQ7J1YhGEy4V5AW2fr2heaf9v6dJ/SRBQ8mnN0A=; b=MBZWIRdDNycAeV2amCXuv9SBOh
	9D6wsRE/m5wP2v2P4LA/+ZiyU69/8lrL5AfmkGPVGfJUYkqFtaBnKC9QACwgJD4YPzdK9b2uq+3nh
	gzeD7Ub5UD0wQOFbEb2m8TSJH7T5guacMgLAfRYyOGReD8V3AX5No2T1knbscmjHfBRprD+BVO/fr
	qAIdr6FvRwGMW+0FxkpiefUQa8YsOnyRk66pWQjUZ3UfuqryCymXIoGS+Ho9zhAfJuYKeHTKoUYGY
	QRPS7HKJgZKbr/EkCZFRuRH7CqrOVy9hn+ss59cEOj8x4Fs4CY2FDn530D7bx2Ursa9U1SsQ28nwj
	lpHle0tg==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnU-0000000D9Xu-2YHy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:14:38 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-834da62e52dso2413270b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976074; x=1778580874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3KiKQ7J1YhGEy4V5AW2fr2heaf9v6dJ/SRBQ8mnN0A=;
        b=IV4SJ394sqjXv6bFXPohX1ZA1PC498Hi1Zr+pfr9R5OTpgXTOA3PtSbQbFeLUhEs04
         7WPPDuNP8pp1zr/8sYAf1/bFF6VGUA2jxH4EVYlJDs/h/72WZvrzAjghT/wc7qL9VBvP
         aD2sYF7xDLc3+94NluVDkV2gpYhIB/tAxsd3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976074; x=1778580874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w3KiKQ7J1YhGEy4V5AW2fr2heaf9v6dJ/SRBQ8mnN0A=;
        b=Ycs5WcNfvjMy1HzyJRmMtVaoHZmcKBwEB5TEYNmehZd+GhHM1RZh22uXlBxrhyNgiJ
         jB2Ro5teWZXLvdcUmu6Xnpr/DlLV3fTmT26Geu67Gj4qykOzkm7vIQLjQzwtFJftofLi
         yntG8u/nTwoQwp14R2WzZT87BhZi7IZAY9hrMrp58B9r5p9aeX+OJbuygMdOseZH+SCm
         pzJFhnmMRZzx2/+CW3f2xc6T8v0ZTLTAkL7g4AMSpcO/g3A/ED3zOLAvjwRww3nWm9qr
         FOHE5wFx90Dfd8ECVQn4aZOlrsxW0ey3Cid3JTIaR+7jZSMr08UHNuehmwRvRHCNC5LP
         K9Jw==
X-Forwarded-Encrypted: i=1; AFNElJ/7u9hHq4H6QNaDNjiBw1f9MBXOOGJZIuXRn/gC4XWS54fyooqKehRxAdwEP7iV3RL1ggEc3Jom6qRNGFogG4GL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+z3UEXNk8vWt2EbJ9Unpvd1lAbnJYySTJuWkGjZqRZYOuQU95
	nz4qde7Rs8hFyy9Cqm2dV+gRswQdtBl/n3w3t4UxT/9ZBFsR6OBCOfDUYUhv08c5aQ==
X-Gm-Gg: AeBDievMZItU0wGEnEuwezYJX1pgguhzl5KT9Qk+ecf8/rpgygsaX05zAXrpcRHUNM+
	2Qfbm8qY7p+v/0oO04KI7vNEfatl1IH30Bul2xMTVj3oB1EerGp8PngB8gTyv84N1raBHW0ddAV
	Iy85bjJdZm2xwBqKFFlMUlZkgGqRtox8OBU9YuC9BzOA99jmJ9k3YCOQja2DtYbqh9S/9YuKGmO
	dFfaRB4Pbi5eYh/hjt+M6DmZZEFRr+5qEjpbCo09yBH2tAe172Uoi6pdnYIPgmr+eqPEFpxLVxh
	WChIDYSNM26N9CiEF2RCX5TTY58k1g+Dv8Pyxw844JlTwYukwdZ6q6QErKF4Ync7tfbpfzZVfgQ
	h3inJ/Y9QvxyC0vtEsPw2Ac56gjfLxwxEpLBa/Mc9+0xjXLr0FbSOQRsIzZCRdMoTE7CDtLjm2Y
	ghow5PrGqowYlK6FKe5/frfiRTdVJBuLUbWQdMaa17QKfHd9BueApxPNw2zAER3s7NjdMPenpfG
	af/tB5PqpiWu+yf4Z0=
X-Received: by 2002:a05:6a00:1249:b0:82f:6b94:99d6 with SMTP id d2e1a72fcca58-83921dfaa0emr2465583b3a.5.1777976074570;
        Tue, 05 May 2026 03:14:34 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:34 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/16] arm64: dts: mediatek: mt8192-asurada: Add CPU power supplies
Date: Tue,  5 May 2026 18:13:56 +0800
Message-ID: <20260505101408.1796563-7-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111436_691844_FDB04912 
X-CRM114-Status: GOOD (  11.60  )
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

The device tree for the MT8192 Asurada is missing power supplies for all
the CPU cores.

Add supplies to the CPU cores. The big and little clusters each have
their own regulator.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index d08ba6aec382..a6543bbcbfd0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -299,6 +299,38 @@ &afe {
 	memory-region = <&afe_dma_mem>;
 };
 
+&cpu0 {
+	cpu-supply = <&mt6315_6_vbuck3>;
+};
+
+&cpu1 {
+	cpu-supply = <&mt6315_6_vbuck3>;
+};
+
+&cpu2 {
+	cpu-supply = <&mt6315_6_vbuck3>;
+};
+
+&cpu3 {
+	cpu-supply = <&mt6315_6_vbuck3>;
+};
+
+&cpu4 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu5 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu6 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
+&cpu7 {
+	cpu-supply = <&mt6315_6_vbuck1>;
+};
+
 &dpi0 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&dpi_pin_func>;
-- 
2.54.0.545.g6539524ca2-goog


