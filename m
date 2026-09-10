Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64A6C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 00:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sY14puHb0GhiWCfvvltTO6BX6TI/MIMm3GI5Q8Whaig=; b=PWEken/KN/rvv8nfIeZzxtPaCh
	e/UrHCm6n33koqpPR6VHt+f9VDECMCrpMsPUHqLl5P9j5QJQC60sJ+AxcijsIhrPXszMGRO8jVwSp
	a7f7oj5Y6Ya9TO9NpnJcUWDo6e9KZBhx26QH7I6SYbKAMc0pOj5FqHsFQ/WVYeEnkc+OMyODQVyDa
	5DPHOIYoGuk/pgHkwiRmRzlJag3Fc0f1r5KuCfqirtFo9/2KL2WatSBrZVeV0irzNDAclrQOx7vVg
	/S3mx6yO9NeU87BrvWJuT4cgVlbEvyxguFXoOpTPCin2Ji8bfKa4ky+Fhv7ly0FTEV3WhO3Ahz0+Z
	uzJjVRDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4SOk-0000000D7fi-28Ud;
	Thu, 10 Sep 2026 00:12:14 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4SOi-0000000D7fN-1n5n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 00:12:13 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2db22383fe8so7611215ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 17:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788999131; x=1789603931; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sY14puHb0GhiWCfvvltTO6BX6TI/MIMm3GI5Q8Whaig=;
        b=d1DGKepeeWxpSVXcWPWqgD5FUmqin2UeS6ypeWpQ757nSybf4SWLl8VDh/90fHOqZ9
         DkJ4hhCvcQZ9V0uryOATurS6OX6PEYw16yR7i3tL7Jlh+/fDZL0sbcNOOBTbhyJulgZI
         gvg6kuyI2DSyvtoXhdLrNqf1AhsMYvwYwh8wi4UflWTJ5/FzoPeXth5QwT8pK3jQRQqz
         u3PgfKHHgUSAUj4Ubbnso4qv8ezZcpdYqcEfzqfTB932WfNJEJUyMEc7vayxANZb50N2
         vIX8DloNfyz6yqFCc7sn6Yy0z880JjG/PHFdByQ28c6U8Tl+uf1JCVpe+S01cx8+n1fG
         W9xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788999131; x=1789603931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sY14puHb0GhiWCfvvltTO6BX6TI/MIMm3GI5Q8Whaig=;
        b=eenMLLV9V039xExk7u5grE4Aj90Q+rNw8vBuI5UO31LXfqYyDkXODeppAj+eWoA/Xq
         l+BjhbGOcSC+d8URedy7BWX3m8u+h/1Xt95x82AuBfK17Omul8GRf3q+Ric9fOKljpQf
         mIMpf6AG4bNiCKlwlWyJPSMJml5ZDG45+GnPcerSDMB3ChFO+giTJPEhLXqCmOFYgWMk
         04Tdmju7e2iAsESgUZPGp8seA5+ifVDscrRdbE4wyhRGgZ2JS+PEgn1jpAuEiA0BOfeb
         7EDQPNxOuvWF76S4k1GXUWk367/u38Bek+EpQYCBSBTvAMpa9wSeWqLYTSM7M+SP2CpT
         swGw==
X-Forwarded-Encrypted: i=1; AKwUvBzTGsCwvPFvLOO0CFqRy/Tklb9zZsx8DI8CALLN1/VohrSdkGYzd/EtoxlfhhwfGYyJbiuW+DhI8795WvYp7ZMV@lists.infradead.org
X-Gm-Message-State: AFuF++mXTilfTjlQvOlGU+8By2Eu5q6OFQbRR2yN+g0IpkvRIeN4IzbK
	YrzlSuFQM15QNGx6uSMmmCR9cxwAVu3rm1S+QkihLu2esUWjo9yzZ+8Q
X-Gm-Gg: AYBFou3ooem1C+VOvDLl7tgMi7je3CUMV/ZxKSJ8yTlO98baYTduffl4DAdkffG2Nq7
	BVpYYSLgf8TCgAyScwT+MplXY1oOSBJu95saJGWK9WEiGippLAchUyyxFPyzWxInG2VCECUre9R
	rBEBgtFtTGDx5hf9qPous+3sc1IXO5qLLjSbrlBTH3bINNdNrDBdnn5rrzsHezPfucLL6WrCAdy
	U3/qcSZSMco8D4VbetBOuzCRk/+bVFjbFqdiX9l4Ej3bDB0ClFp8MR+30DU0/cHOdmNncQFRQKK
	N8mMLBYKhkggD+36PK0mWImQpWNnnubA9naI95Q0cv2KfHr9/Dq9+djI4f4/E/U8QwwqYKVhuE4
	1wunBfV1Tg+65NC1aOZg1d/hyw+bfOiSdAWI3JXkLRIcMAtyJ2DMqCsHz+5pwlm9/ha3jTCfy3k
	8c0OzvgpSxLzwBvIn5BbcYtQ3ihDwQFsQghHx/GljRq+YEjMKpQ1o2rTMnF6SrD7IyfkxdBQkhM
	p1ppk8KXnZbBktTXioId98i/wOySbqHShXwLWxe4j+tlKVnZPBHysIMTe0tGpwOxVQ/wv0RFyjw
	oMTut4QeI5TJdN2e3tbekInwZQeptCah3yTRnMvNUMlt2MDrgw==
X-Received: by 2002:a17:902:c402:b0:2dd:143:d5 with SMTP id d9443c01a7336-2dd07de58ffmr54838165ad.22.1788999131634;
        Wed, 09 Sep 2026 17:12:11 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149cd817sm79825805ad.72.2026.09.09.17.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 17:12:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] ARM: dts: BCM5301X: AC56U: add nvram node
Date: Wed,  9 Sep 2026 17:12:09 -0700
Message-ID: <20260910001209.116465-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_171212_468436_70AF37A6 
X-CRM114-Status: GOOD (  10.34  )
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

Add it and set for gmac0, which is the only GMAC used on this board.

nvram size found from a random bootlog online.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: fix typo.
 .../boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
index c80ac16ad949..9ab618a097b1 100644
--- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
@@ -25,6 +25,15 @@ memory@0 {
 		      <0x88000000 0x08000000>;
 	};
 
+	nvram@1c080000 {
+		compatible = "brcm,nvram";
+		reg = <0x1c080000 0x180000>;
+
+		et0macaddr: et0macaddr {
+			#nvmem-cell-cells = <1>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -92,3 +101,8 @@ button-wps {
 &usb3_phy {
 	status = "okay";
 };
+
+&gmac0 {
+	nvmem-cells = <&et0macaddr 0>;
+	nvmem-cell-names = "mac-address";
+};
-- 
2.55.0


