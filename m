Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEF7FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hukAoBkjzE/JQZiJOlkn+RWEhZuaTeJUsZGO9TflGew=; b=gauBa+5uu3XNhFeahwpMfBZF8b
	UpF7Jv/JuwlPYMUoW41MII0svcthga8KJYcJcXQ5Q3YyY5J3PpyCVcYemeGWdeW2WKVtN5yTP4uxs
	jFUwYiJq64ZNEj5cV9dgW5KfMvX3eDggkby3Ivt0PCBafrb7LntntdHGBCnfXiKeP/VERHD1df0H4
	86dDHj75ZYDjp1zU9XGm1iILZ2UhTGa9C4FmH7ZHg8XZZS0evujjGE66D/C+JPLMEH54JFBxLRpPW
	fH4g6ShWIMLnR621OLVznCwbHMz5n6Ah8bkc5+oYcvX/bJop7qm0luvuZL450FN0aScUxlvbkOtMK
	hINjochQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCny-0000000Fran-3G1S;
	Tue, 05 May 2026 10:15:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnv-0000000FrU1-3QBj
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 10:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hukAoBkjzE/JQZiJOlkn+RWEhZuaTeJUsZGO9TflGew=; b=MYOnmbRAX/KbGTSF48O66TqADR
	lm/38RKDKRz5zVsOuN5xNRtUAgn1Tfrf88BVxvXAm0t9UZeqz2KN5BOKopSck0viirt78KAeZQm8O
	OLodYRpk6YUvB9wP9mVOqkF4PmMbG3KykbLtLTmJnDgvHBuQZjMuQpuEAyruDFh1kuGQPU4iQY3jv
	+Rry67K+3Pa1WT9nE/65ZamzSU8xInljj/fYL4fm1mMX//zDdXIUyUXhrD3UHfeGvtgNttBi8AHE7
	XZla6IjU/NrhL9pTOdm9uKUoXzTJuLbJFY3+m++rbxH8CqofNXoE5zcnEx1N+p3C7DjA4BUCte79n
	DXCdEwLA==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCns-0000000D9gk-16ZT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:15:02 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-839dc688d6cso40556b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976099; x=1778580899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hukAoBkjzE/JQZiJOlkn+RWEhZuaTeJUsZGO9TflGew=;
        b=BRbqDJRpY6tgNRPAZjRPYPiPUQjQqS1sEIKDdxRi0486OOpIfzMBiHy/fOjfEtUs1C
         ivhszcJS8zqcxZrLnOOn5itSVCrv6FGyqjIsSNOAuuCeIzfSNTY65M6kdrJrQyROVqfj
         TkNgb5pNfXP8IQN1ZmPvkz3D/S2pdLS1Ht2aM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976099; x=1778580899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hukAoBkjzE/JQZiJOlkn+RWEhZuaTeJUsZGO9TflGew=;
        b=XfcYa7xDUNcC4W/G6zOAv1GDJZJf2jd5V5/cWqUj7qBZud0K1p+QCQsEqdeXFkNr4y
         C9z5scdTdoZcVbvYpz2TDlrIUZS9krJN1zSwlqRQDoRLiO6BnubFpksO97PVIcIucVJj
         NzntCxAEOghU40ozJ7PdBOcmwYv3wbJPp1ApP4NAQhN9crbPidWXN0rEJ3nsDDrD8XWX
         yJnPWexaTkWyt/lyzCpuxZfxE0uSnntAagp2AwXYMPOJzACyOsi/0+B5dXx5T7Z3os3d
         cbzIsZEVDy9L2UmmlNLU3ch5Kx33d7PNZ94oDKjRbKz7WWwdGNelBct5S3ZuLZelTtMX
         nBvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0qklTprqPGK6I7SAYQXTaxVn7JDTYHefloa9W3hB8yFqM/1p4boHP69GrJInjC8Uxg35Ja1jW2vEJ1Gu2kgsV@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd4SaiUFd32NNnriTOdzrSZpcP13Sfeq0X/wjHnW+fsEpHuOlI
	oe4w9Eom64X6hl5j6auyfYG0eI49vy8kmpKGZKEhwIGH9ZVhk8X1aRzbnhGrEr1rWg==
X-Gm-Gg: AeBDiesTZDPHvsHtzWfCpdLO05idaeCsNw0+Upf4sEnaLi+VD2kkvYM5IEwn3ir+ZFi
	iBzc4Yfml2hrhISXwFMU0Hmcvj7OGzuktbAOoQTy1DeJhtg2n/KYuHUqFLvEfTRxu4o+mXW6+JY
	HbWv+UGJgPHOxxorbWULBQQnvu3o4CA7q3GpHfQVzYSgqlhKn58DFghyKfXCxFh3hutSSaUZFp7
	WbKWXEBoQl4bk4KX9i5Vs3D1gt8PMaI2HYzhvJLB8mmtjD0AvbiHGiImpm4eWAlNipkDHrFBOe1
	DspHWHd0alIOr+1MIVTXIWoWNxW4+hiFRNpSn85A/Dy/li6dXM4QQLMCI4D00wRBdYM23oBgkBr
	RSj+94o3J2i2w2W9XBdjXmmYb0fIs4ZMrfJ1Fu8ni+XrfCvfeKh0oYufSqr6Twj7byjKa3zp4ha
	E+ZPNV6Xm1ECn+e5ApcGWrg3XOcNwasKDUyTBJxLsu9h73ovYwjPb5kHKPTUMjicB+c9Pl/W3jS
	MxYdtvVNflt2UaQK87ZOtX6iATCNA==
X-Received: by 2002:a05:6a00:188e:b0:838:127d:a168 with SMTP id d2e1a72fcca58-838127da456mr6444355b3a.17.1777976098759;
        Tue, 05 May 2026 03:14:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:57 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 14/16] arm64: dts: mediatek: mt8195-cherry: Add vusb33 supplies for XHCI controllers
Date: Tue,  5 May 2026 18:14:04 +0800
Message-ID: <20260505101408.1796563-15-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111500_300750_491B393D 
X-CRM114-Status: GOOD (  13.25  )
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

Like the dual-role SSUSB controller block that encompasses the XHCI
controller, the latter also takes a vusb33 supply.

Add the supply for each XHCI controller. Also fix up any property
ordering according to DT styles, i.e. move "status" property to the
end.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- New patch
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 62e2d7616f20..ca2bb367ee68 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1622,21 +1622,23 @@ vdosys1_ep_ext: endpoint@1 {
 };
 
 &xhci0 {
-	status = "okay";
-
 	rx-fifo-depth = <3072>;
 	vbus-supply = <&usb_vbus>;
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	status = "okay";
 };
 
 &xhci2 {
-	status = "okay";
 	vbus-supply = <&usb_vbus>;
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
+	status = "okay";
 };
 
 &xhci3 {
 	/* MT7921's USB Bluetooth has issues with USB2 LPM */
 	usb2-lpm-disable;
 	vbus-supply = <&pp3300_wlan>;
+	vusb33-supply = <&mt6359_vusb_ldo_reg>;
 	status = "okay";
 };
 
-- 
2.54.0.545.g6539524ca2-goog


