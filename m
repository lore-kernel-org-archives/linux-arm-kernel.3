Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2460C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 12:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h15otk3ApxPlz7+e1yUXssJQT/RaXRzBb1z7TnhPPnQ=; b=bCZ2QiU58K/0vT9xEbS4y4T5ia
	9KZxrQ7eDwNn0iuM3uNJhRJa3eLvzsDBXHPrsxRohn13FD8Ig4kJdIB1kV3dBcbYMw9aMRC0Fmapd
	4kyAT1t8g2qz8rX1ZfLQPWb6Qmsq6noQzWHUF3bUSaeGFAVME701CrHDYaggNZNRjD4BRqanWmjej
	URfFfbx5gAenm3WpgTGIJx0Pr8O0gLGGEiqsl0vIZK/K+ZDTJhLk7gPpZ3BB6knwbBl9wGKvMpPvx
	BRi2Y+LuIn6oDwV/YY7vKNujmThB/1eh3p1XlIrYjLu9ktehKj/mF9DOvYZaUie91ml2XBw3/mwRz
	TLfRwERQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCs4-00000002RVY-1rst;
	Wed, 26 Aug 2026 12:36:48 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzCrw-00000002RSd-09b7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 12:36:42 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-49978908b35so5785685e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 05:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747798; x=1788352598; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h15otk3ApxPlz7+e1yUXssJQT/RaXRzBb1z7TnhPPnQ=;
        b=FPzFBX7YA7yORGPF76J6qhBCDfLfVuTCFiIz6buJhdr3T797OCaR3Kl4uwdGlCKZ+k
         LBhFpTeZrqFpWiYdt8ezfd81bwhN3BWqdAWPc2WaV2pkxlJTEH5LhfHqWTOAXZ8BpVhF
         5B4DvA9LePiqDbTBuP/DAkc+nAGeNRj6tT7RyGwlvDFrdFsx1xP5TXN4MbDadKMaTTUq
         0AogbU8Ycdl1JHYORFoZHPaKbUPNAzwQBFZyfLOOBSn5EyoTDVOgX50LXpHSILVR9aZl
         GvbAcRwkOpDGpdaiRrh3nr5xLuoRRmlhP/tMpqibseWqih1I83gpg+2do1xom7nwwqn8
         t8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747798; x=1788352598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h15otk3ApxPlz7+e1yUXssJQT/RaXRzBb1z7TnhPPnQ=;
        b=f8PInd8X6hTjSkIDJAm5MgFkYsk2lFlLNx/Ka13hfihSRdYLVjBFT3LPFCdy1R4UYq
         T9LynCn6jjboNU/SnEO6utQ7qr50/BuaLNJrcA60dODOQLqAQmiPkdEDPsoA9rdjVzvd
         +w5Tys4bGv90b7UQxsLd+A40F/nbjFhIKX236B0sBFDUPDOCTx3kA1Klhpy+Erkm02/p
         rJSlE/8NJTQmZQ+ivLDLnHErv32Ek3eFTLaQAiqika1TQfQNz8rgGHHZmiKVj2heGBKG
         xYAEBuoSYgS5/UjE5ZI89EFmCYA+ebMS5fc2AKSvRIzRiHki3TjtaGWBgmF+1elJt61R
         rsAQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGpzPzXRm8399+cap41iGAzBk3FnK7nSRCBr/pTyQiNgiT8RJKvotKqhnA4yhSgQWdz3jRwgajaaZ7BSCBnvqJ@lists.infradead.org
X-Gm-Message-State: AFuF++mK2uEdWubq+ZYC+d/bp1Hzbx+qX4gzgd4F1t2YMSwv1I4jFzky
	mW9m7z3qM0cDv2SsSbLScJvaj1F8YMidaHPGPe+hZv15EID9qKJdP+B4kO6XKg==
X-Gm-Gg: AR+sD13OM19zz18k7nes+k7rkB1pyuyvJlNW4xzcnXYcY7mdNrGHEYXjPGOygqDfEdI
	XR3n00iRcpeP1V3efAJfH2mn74fLadVveXNBf+sT6cKUISBiXfX6lZrJjVUGG7QGdV1a1n2p7uv
	Z3nSU0BbIMALNJe7Ps6Mj43/pCAulV8mEViSwKKUamGOEA4g0M3JAFhsP10L1ESBBfXijoevU6B
	gO91wzWSELgflCqGh6A3YuNS/l48lnFwBfBalG2tpgI+A50Ulu7EHzQAX4IxSSfD8+Pxb97MQ25
	hn0IHxKVD7Alif8UwWmG2OewFSJxWFPuzyuOf3uZcLAyQr0ej1mu4YAYkxB6r9YOnEbCY+fAz5I
	lMQm+Lj+bKoT+Bk1VnO+8Xo5+X3Cs4lgD1jSUZZ0d+YUK7vXwoCKtbQX4igdsDYsC33BhLOOelW
	PbPN1G4noAD5efkng+DMbg4Xq1sIpR3rEaTMvQZaYRrrRwYKJLE2Rwxsts/+d/2bBixkCgRLMCR
	ucBMggnH+6AMKGIVhRS+RTChrYMP7Zt9Kib3b4Eg4+Ui+g=
X-Received: by 2002:a05:600c:4f55:b0:499:78b3:7b36 with SMTP id 5b1f17b1804b1-499dc720beamr60889245e9.11.1787747797933;
        Wed, 26 Aug 2026 05:36:37 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc977692sm26009465e9.6.2026.08.26.05.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:36:37 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Wed, 26 Aug 2026 14:33:49 +0200
Subject: [PATCH 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3576 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-csi-2-rcv-dts-v1-1-bcd8d459684d@gmail.com>
References: <20260826-csi-2-rcv-dts-v1-0-bcd8d459684d@gmail.com>
In-Reply-To: <20260826-csi-2-rcv-dts-v1-0-bcd8d459684d@gmail.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787747795; l=995;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=39cuXfdfai3x2o9ivWHSxZIa8pSWnI/ihkiawNHpzqs=;
 b=iZynIZGdWCEmQV/WG7vShRwpR0bcPUXqeWta922VAcZxqHnUei8WHxNkN9GrcPAI7U/Trm/yZ
 JmiSpCp/597Cqv+EyunJrWOvfHd4hoLMDMSZ8zHBmKoYZX5tAfF6CDQ
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_053640_136662_BEC3AF0E 
X-CRM114-Status: GOOD (  11.07  )
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

The RK3576 MIPI CSI-2 receivers are compatible to the ones found in the
RK3568: the register map is identical. Add the RK3576 variant to the list
of compatible variants falling back to the RK3568 one.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 8bfad0fca3b7..1898f3787a98 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -23,6 +23,7 @@ properties:
           - rockchip,rk3568-mipi-csi2
       - items:
           - enum:
+              - rockchip,rk3576-mipi-csi2
               - rockchip,rk3588-mipi-csi2
           - const: rockchip,rk3568-mipi-csi2
 

-- 
2.43.0


