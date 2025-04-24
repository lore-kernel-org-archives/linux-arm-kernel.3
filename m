Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909E2C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 09:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gyc2hJedNBMQB3mtMI7n6IC+t7jRMFsAPdQTaHcDrtc=; b=2aPJbkwNfPcHZhW00HC0B9XtGd
	jvmmWjdFfFvfhD+5M6UH8+qDG79T6lyhToV9IEldm40mXrshRVvhsuGUO9Sb4Xl9Uq5kR04cD4NOL
	EQ91Lzss1Yy67y44xbIobDg+Hx8PgRnE6qa6TaKkGcxeykjXeyau7JzACutyxjpsEPqykJWCrw8Do
	VreVyw6QYaKq1V8uc5c7I44Bu8RQnnKbRi+Jwt97j8ItXeBdUuzHQt9Srrlz9RASb5See12SU/vb+
	8q+u9cFWvmbNX9m8C7uda0tbbAyj2whn5fLax6lZanD/O26cLsJedRmhfxmZJ4IUkg4Cede4seJsh
	m+5aQX5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7smY-0000000DTuH-3uDA;
	Thu, 24 Apr 2025 09:22:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7sCA-0000000DOFK-0dHO
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 08:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Gyc2hJedNBMQB3mtMI7n6IC+t7jRMFsAPdQTaHcDrtc=; b=b7da16pMVTrsNJovFzpcktREbC
	iDsimB4dO3UyqYHDHvdEynii+44jK47NrS/ONIQVxKkqANNpdqSCHL0q/+QTJTupRui9MrLYBZ5HV
	/H1fqOuY8d4W95yfldzLKR0VSScS4R96BPdpVHHoda66jDxYga7/mYOMbYU1diRdY89JFLPQtbof4
	yy7XbxZdzlDc1FqLUQMQ1iggtGFOpVybHlHx0dCyyQC/FG+jTo+jQprmdSxJPNClFnUB3/oJaEht2
	Q1rWf+fwsvtCyyNF7Q+R72et85Kwwx7tRu3TSTxnNXrIH/tA075q1Bf2gL5ArzFCMqLxfBl1Ra/AI
	S3Lj+sGQ==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7sC6-0000000BdTm-3fIt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 08:44:32 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53O8iMvY2574670
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Apr 2025 03:44:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745484262;
	bh=Gyc2hJedNBMQB3mtMI7n6IC+t7jRMFsAPdQTaHcDrtc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ijIDI++5Y3Wvcd9H7mRWvCEhAXcv8c27qs5qqeDcTwXD/L/nruhkktqbMJJBbb0n1
	 7IaHaz9ojoACClJ4S4qb1oZau8/btMqQJ7tOCgv6QvfbrBYVnfVzVwBYgdZ8WVcs4p
	 bjX7n1KC8JRLT3PKmfYhDjzq4hjOwRq2xNNbVgOE=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53O8iMRi004759
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 24 Apr 2025 03:44:22 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 24
 Apr 2025 03:44:22 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 24 Apr 2025 03:44:22 -0500
Received: from localhost (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [10.24.72.182])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53O8iLnI058454;
	Thu, 24 Apr 2025 03:44:21 -0500
From: Jayesh Choudhary <j-choudhary@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <u-kumar1@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devarsht@ti.com>,
        <j-choudhary@ti.com>
Subject: [PATCH 3/4] arm64: dts: ti: k3-am68-sk-som: Reserve 1008MiB of global CMA
Date: Thu, 24 Apr 2025 14:14:14 +0530
Message-ID: <20250424084415.66457-4-j-choudhary@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250424084415.66457-1-j-choudhary@ti.com>
References: <20250424084415.66457-1-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_094431_424718_99FD5DBC 
X-CRM114-Status: GOOD (  11.19  )
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

Reserve 1008MiB of global CMA pool which is also marked as re-usable
so that OS can also use this region if peripheral drivers are not
using it.

AM68-SK has different multimedia components such as Camera, Dual-
Display and H264 Video Codec which uses CMA for buffer allocations.
Assuming the worst case scenario where all three run in parallel,
below is the calculation:

1) IMX390 camera sensor 1920x1080
-> 1920 width x 1080 height x 2 bytesperpixel x 4 buffers :
   15.820 MiB which is ~16MiB
   AM68-SK can support 8 cameras so ~128MiB

2) 1920x1080 HDMI
-> 1920 width x 1080 height x 4 bytesperpixel x 2 buffers :
   15.820 MiB which is ~16MiB

3) 2560x1440@60fps DSI via DisplayPort0
-> 2560 width x 1440 height x 4 bytesperpixel x 2 buffers :
   28.125 MiB which is ~29 MiB

4) H264 Video Codec 1920x1080 resolution:
-> For 1080p resolution codec application, we require ~98-100 MiB
   per channel. We require ~800MiB for 8 channel codec application.

Total comes about 973MiB. Adding 32MiB for other peripherals and
and additional 3MiB for rounding it off to 1008MiB.

Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi b/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
index 4ca2d4e2fb9b..2b02575549eb 100644
--- a/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am68-sk-som.dtsi
@@ -22,6 +22,14 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		/* global cma region */
+		linux,cma {
+			compatible = "shared-dma-pool";
+			reusable;
+			size = <0x00 0x3f000000>;
+			linux,cma-default;
+		};
+
 		secure_ddr: optee@9e800000 {
 			reg = <0x00 0x9e800000 0x00 0x01800000>;
 			no-map;
-- 
2.34.1


