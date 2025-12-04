Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F50D216AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 16:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aqAQjayzKkiK+UyokaheK11TIpMBdBsbzUQ3poyNPt4=; b=HO5tY2KlkE6KDGpi2vfh0X53tK
	RE2KeKtgOd6EzuNZidxWMZ10DI5U+v9epv9B0iKqHt2HCjh/Rw/BxtSFpI8vaEUxmboA5IC2CPe/M
	DJQHrwTg0WPNIJGxCcL7UZwynMeXAMuuPioyrDvXmU4jDZdGnARdQHeb79c8sWbxh36UewyT4BLn+
	IIrmggLMPRADwGg5jeYg1vHRT/r8kfs2bo0BlexJk7X4wgcI/qIxlKouiz/YtO5FjdFdrbuJxSTG8
	huksiQ1g4mNKTglEyqXvXnZSrh6W47w+DJEZ/0GrVKka0bmfrBQjcuIfuPnT/Ec81BlF8jCTQ/22s
	oEKQ4Utw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCPm-00000008J7N-0Zq4;
	Thu, 04 Dec 2025 16:42:46 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCPj-00000008J6F-19fW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 16:42:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-29845b06dd2so15737075ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 08:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764866562; x=1765471362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aqAQjayzKkiK+UyokaheK11TIpMBdBsbzUQ3poyNPt4=;
        b=hM5ICf+TQXjLlk3mAl8/NoUZsFeeAZV+taxOo5VxHGHGr1SC/iDDi63ylUWEiIq8lI
         1EVmgbS5LNZNGL7TlOAxdavxPIM5R1NL0J4/5FysnLGYtWpuIopcn7mNuTMDwQ5WQV8F
         u2jN6eK5UXRi64kkcGiHK2WMnALeyrcKo2ph8a68pilZ9u75jleZlvy16vudY2B/4MfC
         ZxfBex4/oVqXuNkMdPfM9vHtSewRewrn400mbiX76q9DAm13R2S9x40JC+LZygSqzKAn
         JmJa+QCgsmmutpw9Q3FlptkSzUpbBwsD8jZd4LuP5QdNlrTFu+go4KMsYwIGmQ3Cuf+y
         F40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764866562; x=1765471362;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqAQjayzKkiK+UyokaheK11TIpMBdBsbzUQ3poyNPt4=;
        b=KTFDP/1EWvtCZfUITw1D0p69mMaDldcuwLObHqPGesgvn3koRLhYk3s9bZDYpUiOry
         v9D80Udy1GTAeZDZAVIYSSYlLwqZNLL6YjEMuzqgO8hKErlWwnXVMkZTTY+63QHXwg8a
         6rbZBC+GeccQwr9wSFh7FWzloYaYLbA93bP4ZozC2sVHU5PTA2LqBW3hwtdHELc12BVO
         De6G9SStUSQu7vLb23QEPc/vMuF4cKrYn0ztphmNLKRbEROY3pB0/egHYmtwWDZW/y3E
         hv00+/NAX5iYwT6XD83KCscI9k2IZCuDOCyp8yoXmdX0wFfQ/UN/jzfGQE+vcXTRaYIZ
         zaHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU84JX1k4d0rN9SFJHyZpl5Ws4fOerol8EPtszXwXUZ2OgOUtstyFBYBUYtPG1/2P2J8a2a1+B6GFzNLf24xzTE@lists.infradead.org
X-Gm-Message-State: AOJu0YwaPGiUdKy81NSU/PKLFNsUDzO7QWjvTp/mGZddARawVlCDGIE8
	sTTKaqYou7t3ggg9mSxOXQkQXpEEwytm1Uc9DtjLkzTK5bpEWDH2dVSQ
X-Gm-Gg: ASbGncvPYakaCUgWH7yvs4OdBHhy1VsZ3RnJ7PlEweZUdZo5UvgP4AL+4sdvhLOUxek
	PZiOvEw7Fid4d6S2BfNKbaHskd3S1ihWB0Zt4rdzP4OLLFZoJzWma+htoBY33iDtWk7Szsl2AWf
	vB1coFwER33bApmT548USDaxyvQFgcgZ6RpZqrL28urMWDCYXwFrJloOQM7Q4sKRuaSpDTqKs6+
	HbPJHsN7kFPpYIdPWSw7ridC+HGS/3rtpjv8LHV/U5T9+MdjsXsLRX++6A2GyDxq/eu8NvwTjD0
	qXI78mGuCDPaOmZQrxX4/BpIKEnGjQEaV3Oi6NLSy3D7o3D3Oi5DoI8lcKftbf5+DIxh7GD79mh
	pLbMXr5Swjj88As5yh/4hwbQuUXASMv9Fzyym3XyJz1o6f+OpRtqILITQnAWLdOPofZLSx1f4da
	aK4xyakYONTueBcBVb/jx/leTVt1CQBVIO4UKeSAcuNV18FWpaaQMHS3bPypOTvZME3lNtW1Qy7
	t8V8M5Dzh7Q4aGbrqxRO80RillGc0pT4ds=
X-Google-Smtp-Source: AGHT+IHmL3NdODN0biOQSZv09OUmAKp6RXCeEtSR9fQ8w6iCx3oooNzpze9mqTtVMIc2Y+Z/hfgp4w==
X-Received: by 2002:a17:902:e807:b0:299:d5a5:3f7b with SMTP id d9443c01a7336-29d684764b1mr84258175ad.53.1764866562008;
        Thu, 04 Dec 2025 08:42:42 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (14.250.194.35.bc.googleusercontent.com. [35.194.250.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49c8absm25090275ad.16.2025.12.04.08.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 08:42:41 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de
Cc: jserv@ccns.ncku.edu.tw,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ARM: dts: integrator: Fix DMA ranges mismatch warning on IM-PD1
Date: Thu,  4 Dec 2025 16:42:28 +0000
Message-ID: <20251204164228.113587-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.177.g9f829587af-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_084243_316480_4818089A 
X-CRM114-Status: GOOD (  10.61  )
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

When compiling the device tree for the Integrator/AP with IM-PD1, the
following warning is observed regarding the display controller node:

arch/arm/boot/dts/arm/integratorap-im-pd1.dts:251.3-14: Warning
(dma_ranges_format):
/bus@c0000000/bus@c0000000/display@1000000:dma-ranges: empty
"dma-ranges" property but its #address-cells (2) differs from
/bus@c0000000/bus@c0000000 (1)

The display node specifies an empty "dma-ranges" property, intended to
describe a 1:1 identity mapping. However, the node lacks explicit
"#address-cells" and "#size-cells" properties. In this case, the device
tree compiler defaults the address cells to 2 (64-bit), which conflicts
with the parent bus configuration (32-bit, 1 cell).

Fix this by explicitly defining "#address-cells" and "#size-cells" as
1. This matches the 32-bit architecture of the Integrator platform and
ensures the address translation range is correctly parsed by the
compiler.

Fixes: 7bea67a99430 ("ARM: dts: integrator: Fix DMA ranges")
Cc: stable@vger.kernel.org
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/arm/boot/dts/arm/integratorap-im-pd1.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/arm/integratorap-im-pd1.dts b/arch/arm/boot/dts/arm/integratorap-im-pd1.dts
index db13e09f2fab..6d90d9a42dc9 100644
--- a/arch/arm/boot/dts/arm/integratorap-im-pd1.dts
+++ b/arch/arm/boot/dts/arm/integratorap-im-pd1.dts
@@ -248,6 +248,8 @@ display@1000000 {
 		/* 640x480 16bpp @ 25.175MHz is 36827428 bytes/s */
 		max-memory-bandwidth = <40000000>;
 		memory-region = <&impd1_ram>;
+		#address-cells = <1>;
+		#size-cells = <1>;
 		dma-ranges;
 
 		port@0 {
-- 
2.52.0.177.g9f829587af-goog


