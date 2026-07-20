Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7216BC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 09:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KdohSLCmhYYN5xFaerOht1QxlaqSBPNXnoi96FiAJc0=; b=Klr25SqiE/qKx37qkT9Oxu3ehJ
	p4hTGrcWCMqVajULxfUtUh8bAdpnf8KJXvsyntk7IqIMATf1s+eLot28HRRO0KOCPoGMZZ3RmB8N3
	EcI0BeadYRoL7QeZRHgoTtPeUzWLIxm1P15Wu1K98v6OqZCjxovzn1a7FZAcmCvsIarqyDJxBKU1B
	GGIQ+YuMXrmL+CI/Fkd49cngnLcQLHcbS3EtUZKOzKUOdjBBr4tORqjJ/4eaisFmFWeqP0/Fwyj4Y
	uUM67qaQMPH0t8ynL53cL4NDx45LarYGWaG/g0WVbCeTUUTcFcD99fcid7ZrO7ORk5d5UU/2CnONI
	WzdM7X5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkIR-00000006Ji3-1Yzy;
	Mon, 20 Jul 2026 09:28:23 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkIO-00000006Jgl-0AhG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 09:28:21 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38df94d4dd8so4604814a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 02:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784539699; x=1785144499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KdohSLCmhYYN5xFaerOht1QxlaqSBPNXnoi96FiAJc0=;
        b=XG4eihar4T/zf9ajvRVz/F0koj7nVu0ShDJi0+TtG4RA0TdMSK3bTpX7ZSbqyz5JKI
         MsxNtkWbwbshoBEPjA4cN1BoQVbuHdpwKz1bixL8Z32VE92f3DFWPXURNQlhtJmpJwNI
         osyZ2MejCGG01x7sFP7vjmrgYc80GG2/NrXjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539699; x=1785144499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KdohSLCmhYYN5xFaerOht1QxlaqSBPNXnoi96FiAJc0=;
        b=Cdgz7iKrusxdGKE84hFI+6pBr/SZpSWmaVAVtmRZaz0VaSh/mjzusfVU7b3Bt5pNwI
         GJJCMV3pOdLIf1bWRxF01FPe9uHii2o/MRocHXP+Ndws3zoTRkstvzannAleobQc2zkR
         kDGP+2/MDwAAHzE1/maKZp7LXF+kNOGEOlwfSv1u7z//4VVd5Y63OcbPmZOOC/eGwR0w
         wxs9RSfpvlmFfaz5RroEPWu0h+tw42kbV+oj2BsCWkewGgQtAD93R+9i5MKfvmRQy+a4
         bb/dhl2Lj/QzcxUBSL6hXB1UouQwK0XFDmimn1wrO42vhbyv8pQudaywcl72woRM+Q+X
         Yuvw==
X-Forwarded-Encrypted: i=1; AHgh+RrmyXwL4nFBVyTvjhEsfeU9Zxsmr5STTwzvIiTLmfwABbVHTRSPBt5KvH0HovtE9vXIUFzUcDxm7JxsAJqgLnfC@lists.infradead.org
X-Gm-Message-State: AOJu0YwBWpEODtosNP29DhFxjUeBweWYde+07A64BvakqsSDRrPo4tff
	nInKj17U1aPGTxOMhyXZJhZZdtRToZ3X92dOtBYywo2h+9dgzUhJrLSGBFjTgniCUQ==
X-Gm-Gg: AfdE7cnA+TvYmX+Uv/vtDlnBR0/exScxqFpcom2hDim2fwtAF+K/Y/s+YkuPL+k60VK
	T0vlDpvNxfKuvy1haPktyxL041QbU9ts4x0X7BiGIq5YHy/SooE+12ffQ9eDdqKdmw/WAKlYrb6
	j74R6QgIg05TU+bDbWsvEI5xC/gjpHb3X4RFMN+E04KWBKFgAStKhN7efi9hqLP3B+bP34O2SOW
	VKimCO0p3Xdeq6b6HrUEVmuw9KlKjsdYdpqSEZnIUOFxSamAz2Rq871s9gvkwNUW85o7ccfG+ch
	kF5WHy0tV0d18i4K3U79dJPE/yWugMkb4WBLJodA3u3LQMSvEToGfDVUcFHCcf+Bl0n2kWMHtYf
	ZqFB1bqu63NtNyMztFw+40t1UX/iZ9TSlgbtdpWLP9A7eWJG8RhtawFRIj8MH6y/G2mDMIoW8Np
	hJNMyUeHtQ92fvmLHHWEpHFpbft5Br9tvFMRL0UBmO+MsvQcdHeCI8u3qNZiM=
X-Received: by 2002:a17:90a:e18d:b0:387:e0db:bc29 with SMTP id 98e67ed59e1d1-38e4b57ee17mr15411812a91.41.1784539699255;
        Mon, 20 Jul 2026 02:28:19 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39de7875sm7342610a91.2.2026.07.20.02.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:28:18 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8192-asurada: Disable mmc1 on Spherion
Date: Mon, 20 Jul 2026 17:27:57 +0800
Message-ID: <20260720092759.1831105-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_022820_114395_E4C4C409 
X-CRM114-Status: GOOD (  10.57  )
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

Spherion does not have an micro SD card slot.

Disable mmc1.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
index c02edba73eaf..0b976b09d47f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -64,6 +64,10 @@ &rt5682 {
 	VBAT-supply = <&pp3300_ldo_z>;
 };
 
+&mmc1 {
+	status = "disabled";
+};
+
 &sound {
 	compatible = "mediatek,mt8192_mt6359_rt1015p_rt5682";
 
-- 
2.55.0.229.g6434b31f56-goog


