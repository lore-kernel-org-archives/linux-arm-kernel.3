Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19DCC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 09:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AckmueFcdt0W23SueItleJPhRc4kKUpsswgxRfizL5o=; b=yQoLpJpq/WNeSOVFFctvVY+Gvq
	ZVWTumco+Lihn9UsAw7UPZKmPO6mU2JaGXMzBvybhywmYR04264bqOOVTLgzGPWQ1vcxI8v1HvGBX
	rMIDZqg1O8lQcJkAWvLwnX8foxp0mynGY9ILM2n0luvJBj2uLSKvIwjs0Zkj3ZuEk9vQYQPyb+Am7
	MaM7Iu7CYMWp05VIOFGXKPw0CAUeZp/GQ74NsLPn9yqVmSn0JygdxBmisE2AhvwioiuOTcvWRk0dD
	uhaUG/o7eTOpo6zHfWV9JrX7FnyvmD8rBI1sIHjJ7qbktFGA68gndLNTVw2bbiC/2TQL3+qsDVHX7
	9MMn9sMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25Zv-00000003VaI-2Jzv;
	Tue, 08 Apr 2025 09:49:11 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25JC-00000003SH5-1b1x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 09:31:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744104714; x=1775640714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AckmueFcdt0W23SueItleJPhRc4kKUpsswgxRfizL5o=;
  b=NNPnQ4DwkLVVdCTXtf5isgUKQwJ6s5IpqkbL77jSh4cKDnqYy+6PVWER
   G5Y9t0G7alFKmI1U+HtJtrHqf5kvzuAwLtYSR9YHAxpAf/25PaBv6MMLH
   ioIibIygLBLgsVEKUQpAEe+n4nD3pfOMGeeTGqH2wP5tPVURd5waC40pY
   fJrToLG1xbsY1olFJQSc6nkLS84bDKRoetzLw0EJhiHkOAerKK9VY8RWI
   yiKwp0RQkZv6aBY7uO+8l1N4QDAud9oaYgjR4zWM+MFrAkqgQ941VkQed
   7EeIc7FeLSxIf+QXPlUUiBwPXxHDEvonXAxZs+tASU9FBy3VcJXLpQ3Qd
   g==;
X-CSE-ConnectionGUID: 4FoT1ObOQFGxPd2lIWTCQg==
X-CSE-MsgGUID: EskZjJRaQdGXBz0LN5/6qg==
X-IronPort-AV: E=Sophos;i="6.15,197,1739833200"; 
   d="scan'208";a="43397420"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 08 Apr 2025 11:31:53 +0200
X-CheckPoint: {67F4ED09-1E-903EAEAC-E04C76C8}
X-MAIL-CPID: 98DAD71A01D231204733A360F0E25679_5
X-Control-Analysis: str=0001.0A006368.67F4ED13.004F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E9ADC1697CE;
	Tue,  8 Apr 2025 11:31:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744104709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AckmueFcdt0W23SueItleJPhRc4kKUpsswgxRfizL5o=;
	b=Ra5PtcIJL3Nr2bC0BZs7PGuW1Nrg7fnXJbAbgemcTjfit61ZJX2gQKIAOcGuxpFqUNvIO1
	SEGBMWGIe4e+9xoxmNhRxKWXXST6nGkRcP//hokUWpk+0aJO209salYAu5eHAbCBVrp1YG
	aHXvwyjFLj4k6v1Mvw5CID1pzCNNAlTrwv4Omfc6IXgPOTBimeaufw9GjxE9NdlXvc2mET
	wfhcnXxKY7yam0Q5ZLQIgW6ClqTauGTZncbpXepVjd31l45ssZ4PzIKYR8urK15of3TI7v
	XpQxl/mpcku8MZjLxD4qLNF1xjtNLQnuEyoWh34Q4oU72n1IvmCSizeix0CDFw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 7/7] ARM: dts: ls1021a-tqmals1021a: change sound card model name
Date: Tue,  8 Apr 2025 11:30:54 +0200
Message-ID: <20250408093059.551700-8-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
References: <20250408093059.551700-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_023154_720714_764D001A 
X-CRM114-Status: GOOD (  10.52  )
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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


