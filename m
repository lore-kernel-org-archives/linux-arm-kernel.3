Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45816C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 06:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sr+Nipva+MMpw/BZL34N9U3TlRdkIHSSqX24CZFONM=; b=stSXqGFIUuouFmoegPTdTD4Fll
	4gM2vDIyvQkV5IQKkU5b1GNy+tBJY88GnSzSbW74eHuNZq2WAY2ypbjbSIEADYSwwm7WWte3+lAhE
	mot9eeG/3dioT9Vz6EXHFXWWgtJd49p8RLN75XUtRWZC2EEbtEqf5e4zI+FOFBmBZ19aPDr7Btfij
	hOUY757g9Mihbu9pwXaLGWIv4obcRsUaWNO9KJwSyddsTl6rmbp6zxfS2R58O1RGGwwyB1GCMLYDw
	DkiXXxHqxbSvVxrwpWzFQk+K2DpFsT6qzYApuv2CWdbAocVpPJI01vFqjijn264E3iqP7QgDjPfYo
	RkaEsZjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufC53-00000009B1v-05w5;
	Fri, 25 Jul 2025 06:38:57 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufBhi-000000098hg-0HGu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 06:14:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753424090; x=1784960090;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+sr+Nipva+MMpw/BZL34N9U3TlRdkIHSSqX24CZFONM=;
  b=Dgtn0KdCbnd0lW9ctxelZW53NmsK4aKxTeN79LJtwyJRHSP3dDUSSGdz
   KROxqS7jOEUgGVAKYS+EB1bGH06tRplDSqsTWzOuilCLB8OGIZ4fr7rgf
   7pNIYWko63ZkhrwuxsHbDrhJIzBR8KDt1B8ox/m7aYXdW3Y/nc+r2vDVF
   i1aifLo4yd9iqu/Vqb7o4oMP5mHZJAtWDGIS95GBN6ju5gh37AKgiKr4Y
   bLxdifN9fSLfJUaeoqhaEGZ+qQrKjjo7CDUGT3wDoA0FjMoUniexbmZCz
   kIh44p+DUC8erTk9/jMDdVdRpSFBSg6juohUXDv44RFke6iRyUnVO46qI
   A==;
X-CSE-ConnectionGUID: 3i1G2ulQSHmiy9uTaxpzIA==
X-CSE-MsgGUID: x7sgTuTnQACDINcf9zXY9A==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45413068"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 08:14:30 +0200
X-CheckPoint: {688320C6-10-943DFC15-D71A48EE}
X-MAIL-CPID: 2E6577C811EC6F57F3F62CCAE5A4A99C_5
X-Control-Analysis: str=0001.0A002123.68832071.001E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1012D173654;
	Fri, 25 Jul 2025 08:14:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753424066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+sr+Nipva+MMpw/BZL34N9U3TlRdkIHSSqX24CZFONM=;
	b=fIBE8o4BAp5+91+w/p5FRSNScpcISHAYuY6fbU4f4jMpZP+ayM3BRqLExDnFO1eVdN+hOe
	pS/IGogVpelIFGK8+SnCPQ/dl0Ypd0PwmqYDDzZhDurcCi0QO/DjgrONqT6TIhKxDFuM/R
	krc7zf5ZW9T4P3c7YHUMeuwmM7aBNWlVLsGGovucrMErFmL5Nn+da7lwTPWLL16jPSt7vz
	ha1NkBJ//B2VbFBsd8HEQdXK70xJR6c5c2lQZHMPaAJjVrptl1PzBZq2vQFS8cOB4vkKyS
	xI6pcaLivh7ltTvV0kAetqodcX957ihtCzQFRlvaQBOyzedXWHSUhXnv2DyUSg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/10] ARM: dts: ls1021a: remove property 'snps,host-vbus-glitches'
Date: Fri, 25 Jul 2025 08:13:34 +0200
Message-ID: <20250725061339.266125-10-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
References: <20250725061339.266125-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_231450_403428_B12E22F6 
X-CRM114-Status: UNSURE (   8.73  )
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

Commit 7e0685a0c4c27 ("arm64: dts: ls1012a: fix DWC3 USB VBUS glitch issue")
erroneously added this to ls1021a as well. Despite that apparently the
workaround has already been applied unconditional at
commit a6ba1e453174 ("usb: dwc3: apply snps,host-vbus-glitches workaround unconditionally")

Remove it to fix CHECK_DTBS warning:
  usb@3100000 (snps,dwc3): Unevaluated properties are not allowed ('snps,host-vbus-glitches' was unexpected)

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
index 3879cfc3efc99..d8a43c5aac80b 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
@@ -799,7 +799,6 @@ usb3: usb@3100000 {
 			snps,dis_rxdet_inp3_quirk;
 			usb3-lpm-capable;
 			snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
-			snps,host-vbus-glitches;
 		};
 
 		pcie@3400000 {
-- 
2.43.0


