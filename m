Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95047C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 14:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srwM4VsZ3yBl7ZsVSs0wHvvduH05/skwoi+WfoH3Tmo=; b=ip0Tl2vQg1210Z/i2wLaGdKwQ6
	wB8x2DZf9m4CxhE/rqiTHa3c8zPBRrEr6YTBqW/3XVtUkZM+AL0ZLnr4gcczKeeuIJxftog1dJ8Iw
	dXfE0LgdhULti7FNE2WLrgKXWtnamF1vj78g0fWmlPaj1oy/I9tbbH3spcTIZu7e+rQz7ic4RGCL/
	D39ZsgP+hLAaYSkhpHQn9RgnAe8HbmMUGzxPMvZ2cDKzK7Ep3i7+NUI0WnQQUwuqZKkCxRD+pLZCF
	F+ikwaWtemiK5h/81CqnJueiHYGGASTy1bTojRJtYwL4UekxnyiZv4PGosU/xys8s5EeeVwfQLOMR
	pnLYsJOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txofZ-0000000BHNv-1F3p;
	Thu, 27 Mar 2025 14:57:21 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoR2-0000000BErS-3WHf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 14:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1743086541; x=1774622541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=srwM4VsZ3yBl7ZsVSs0wHvvduH05/skwoi+WfoH3Tmo=;
  b=aui0HEVKp5NeKdJxzHC3T9sGq4vah9aq1GHnmTpKB/soX01vgN+o/5qM
   ikdmxUHn7Rk7Zbvxcm4HZEicZxg7RmrQsJeBfUOD96wZMtsL7fOSULdlU
   krBczcRRMRLQ9wAuSuLI55VJbKNqed0VqbwZ9IS5l3J3bVWY3mN8P7rGc
   hrlTDur0q7Oq23sH0py7q7klIo6DtICSRsaULkMTiXavP7XnRabpyqd4t
   kXEFpDWF/WdvwjspleAI/ErykHktdd9ilUUBAMxhrc7ok1cPJd1cnCuGe
   bvMpiR7Wg1XfH13jZTN2MIMhnFhwirwD2PldiXhDcR6uQBXSX1KN91B93
   g==;
X-CSE-ConnectionGUID: pS1I6QmnQoO+BIuMOgiltg==
X-CSE-MsgGUID: iFM4zChRT5e9kvjR21TWOA==
X-IronPort-AV: E=Sophos;i="6.14,280,1736809200"; 
   d="scan'208";a="43199531"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Mar 2025 15:42:20 +0100
X-CheckPoint: {67E563CB-1D-903EAEAC-E04C76C8}
X-MAIL-CPID: 94219BFC4AF9ED8D941571B08335DEB8_5
X-Control-Analysis: str=0001.0A006396.67E563C4.0009,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69A4E16C181;
	Thu, 27 Mar 2025 15:42:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1743086535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=srwM4VsZ3yBl7ZsVSs0wHvvduH05/skwoi+WfoH3Tmo=;
	b=iaBD9b9vTEq2NAOOIK5ytG3gc3B/jeqSt17kFp2XUUAvYSbfRn+rdT8CfiweucE6GH+cCY
	SXEbXx0GJih0T20HHB/TRe4CanZwQfcaFHDW+YXFAA1tVBCqbda+090dI+KbWLb3hqRc5M
	iWJQk/lb8uoYx77p696vrjzIgTrxqhhwjEls/mVR/B95LWi8sRmblnA/J5MCP9Xr/PFbpz
	5RTh5xaVZz3wtqvUzTlRYPtLZDf0IxZ+1S0Iq4H1nHS6BrPAt3MjJ5biYltytMiNPf/x2B
	n4JSyFNYRpcVojUcLNpQWdwMDrOd/qsoDHeWCtD57xTnWEgGQeCdP7YNNRI8Hg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] ARM: dts: ls1021a-tqmals1021a: change sound card model name
Date: Thu, 27 Mar 2025 15:41:13 +0100
Message-ID: <20250327144118.504260-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_074221_187095_8CBF7F21 
X-CRM114-Status: GOOD (  11.78  )
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

The card name for ALSA is generated from the model name string and
is limited to 16 characters. Use a shorter name to prevent cutting the
name.
MBLS1021A uses the same audio codec as most i.MX based starter kits
by TQ-Systems. Adjust the sound card model to i.MX based platforms,
as done by commit e6303798b6ac4 ("arm64: dts: imx8mp-tqma8mpql-mba8mpxl:
change sound card model name"). This allows sharing a default asound.conf
in BSP over all the kits.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
index 80dae0c09542d..5606585dd5607 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts
@@ -157,7 +157,7 @@ port {
 
 	sound {
 		compatible = "fsl,imx-audio-tlv320aic32x4";
-		model = "ls1021a-mbls1021a-tlv320aic32";
+		model = "tqm-tlv320aic32";
 		ssi-controller = <&sai1>;
 		audio-codec = <&tlv320aic32x4>;
 	};
-- 
2.43.0


