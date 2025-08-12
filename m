Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9E1C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 06:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6UYaNS6R1D8Ckv6wEelMONWEOHZ7DrIKmkHFZGHqi3c=; b=A0oCyYuppq0DHV4QdqmQvN298j
	0KClnefd1KT5y/ur5NTCbTcY16AwwtSXkwiW4VA3XWdQOMYi6CmPs7UghwCcLEUVnklJEl4pz89bl
	QP5GAJwDcVPf9ImrCurWDIIJRmKr2v4Z+LHYd2Kgq/MFchXvqt+oIFzRe5LC6xuGCvW89fM3dFzUq
	oGb14GNFBp022jGTSwXhTY3wv3Y9CRnSU1cO64NL2BqTMhq+4fN10TWwYHrSZ7qdrRIxrv4YyPQvv
	En/IbiFC/HKAhRwP2nclugU8HA8sR8phARL6SAX54tjpKAQJrXDEVU5UzaVQjqdFeN5TwSdfhbS2e
	N1qwuhLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uliLk-0000000A0j4-45aM;
	Tue, 12 Aug 2025 06:19:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uliHJ-0000000A0O4-2zdv
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 Aug 2025 06:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=6UYaNS6R1D8Ckv6wEelMONWEOHZ7DrIKmkHFZGHqi3c=; b=EtNfVqVX9auzmt4uoo9EbQ1zva
	9ieP0ruNoGHZkOjpLa+4WllNcVNFQfUOnfU2jqJPm2vBBo0EelS+AlWGHtC23P51fR0+KAL2tzdoy
	zqIXOftSxQw0Sx5pOCOtxOj6amM8Hky7gDXeLelqPJNpL0ckAGBdGxXCw4BLXd4SpMHE7ZFQIObra
	RGV980jQVeBy3vCh2iqkXwFE1sYYPvWYy7DFq/i8WLLguCvXKCf0Z38f5q2rHwz++XzYsjEuYWwIP
	1nWH19bMdg7CKCGOdka5yNj3S+lRNI+AUoJfKdwWIn9PfrGbcnhbzRANNr75YymFClJ2tnKveb3zl
	uSiudqHA==;
Received: from mx1.tq-group.com ([93.104.207.81])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uliHG-0000000FhYs-17Iu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 06:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1754979270; x=1786515270;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6UYaNS6R1D8Ckv6wEelMONWEOHZ7DrIKmkHFZGHqi3c=;
  b=YNbObYSUXD65JpNNO/KGatnaxwjER3DgGPWd1n29neO670jHL61Anymq
   WR+1axGG1Zvh1isWLA9GyUWcquBvvIsyLwfbXeNYjAyNyAc0FbZebALFW
   jf9aXL61BH/ZzkHkTL/EhVSAa/K/OFv+MejIbjl0E3Wuko55BYCUV4jwR
   PFWXYw6CMJ54nIxuko+Rf26G2LclsXCAT5/s5BVXvMg8GQBp3YFs2EExY
   MrNyNuPkUU1cnx0BQjvoYjgmRCwJfygXrfjgr6ouLHNncwduWrn0kOIeI
   6PjdknOgZqtk66kb02R+dCKMayHDKvln0wcoCGh5pwv89lpBeQYNDJrGS
   g==;
X-CSE-ConnectionGUID: WDG2uQONQpKJQBzRerWUJw==
X-CSE-MsgGUID: cL6rkPBfRyCdak9cj7TLIg==
X-IronPort-AV: E=Sophos;i="6.17,284,1747692000"; 
   d="scan'208";a="45692354"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 12 Aug 2025 08:14:25 +0200
X-CheckPoint: {689ADBC1-16-AD8F5F64-F0EACAA5}
X-MAIL-CPID: 752597014CB5397E9668695A756D4105_1
X-Control-Analysis: str=0001.0A002118.689ADB73.0061,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 07D67165897;
	Tue, 12 Aug 2025 08:14:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1754979261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6UYaNS6R1D8Ckv6wEelMONWEOHZ7DrIKmkHFZGHqi3c=;
	b=pHx8zyjzAR22NvuN/y5hbVSg0PnJLGjbrseoKIy0Zl0sXA8UiN1vnEbytNEZIFkAaNE4HD
	ABR3BKJhO+wy6mt17wFL33bsmQfh/yD83Qhfa+CMN9E6SaocXEHtc3+JY0bfplRnK3xD8p
	msPrXlZ4gBdsknH1y4IusFq6RILRm9sGn3Utt71JmKgrYDMhMdpyPVz31jHA52NWrZvnZl
	uGRFEAcF6sp7Z5H3FrS26jC+1v8BUrpJuqTGerdCjz8Gba+70d9NzTC1FLUFG29xMk/j4l
	JtZyneByVLmlz/OVDWufxuC0S9NQUypIYpeF739hDL0ZRROGQj2f6SWehrS23g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] ARM: dts: ls1021a: rename rcpm as wakeup-control from power-control
Date: Tue, 12 Aug 2025 08:13:38 +0200
Message-ID: <20250812061339.102616-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_071430_805021_75E7A25A 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

Invoke power-domain.yaml if node name as 'power-control'.

Rcpm actually are not power domain controller. It just control wakeup
capability. So rename it as wakeup-control. Implements the same change
as commit e39f567e1c38c ("arm64: dts: layerscape: rename rcpm as
wakeup-control from power-control") for arm64 layerscapes.
While at it, also remove superfluous #power-domain-cells

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
index abb3e5ed7e027..29105773add7f 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
@@ -924,11 +924,10 @@ qdma: dma-controller@8388000 {
 			big-endian;
 		};
 
-		rcpm: power-controller@1ee2140 {
+		rcpm: wakeup-controller@1ee2140 {
 			compatible = "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-2.1+";
 			reg = <0x0 0x1ee2140 0x0 0x8>;
 			#fsl,rcpm-wakeup-cells = <2>;
-			#power-domain-cells = <0>;
 		};
 
 		ftm_alarm0: rtc@29d0000 {
-- 
2.43.0


