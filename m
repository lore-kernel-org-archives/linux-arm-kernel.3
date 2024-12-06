Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA351E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 20:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XPymFscJtM0iCR8Z654zo0/sUeFNBdOsH/cxF44Xyqs=; b=PCbVZdYd/PXHINPeMURDnIStXl
	QcxqnVWGsKYZVAkYE85LoInMQ1q0Chgqo1FFWoWH3IALv7d9QIqS6OTz9rNqlJkhjiG/1sCvFzsPD
	SMvXokw41aG3pin0qbwRxIuzkl1DyPJD2Y9W/YU+pdikjBhLRrXUOJjz9IvWKhgm9qLAE7E7ImDb9
	R6EdMYx14NLicgl6Bopiaga9/50CXFS2z/cepwul3XpJICObUlx3lBWI6pLWnfPaqnFchyVumcey6
	85HJT0on6ZNsViBQDq1W0/Ud9AWlYW6z59gXO7Z6AQrRc/ZysrajSJkMa/AlN76fhFarIFPqL5qc/
	ieca4+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJepB-00000002fyp-2UZH;
	Fri, 06 Dec 2024 20:21:17 +0000
Received: from [129.206.119.212] (helo=relay2.uni-heidelberg.de)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJeo9-00000002fv9-0Zck
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 20:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=uni-heidelberg.de; i=@uni-heidelberg.de; q=dns/txt;
  s=s1; t=1733516414; x=1765052414;
  h=date:from:to:subject:message-id:mime-version;
  bh=obweLbPmdaRNnm9sBPFdYU+Tkq05AKGhDIpdDJNmTx0=;
  b=N8pO5jAGxdMtY+seRGb2LQWXtbUYc4m0D5onq9TFWMIL9jrCmUc9+yPo
   pCx35pc9HRSHosrVY8fNawWUwhCLqarOx3HNtsKrgYWeMHCzojcWl842Y
   UsAT7J0E6Iyf0S4/IspcIS6wnFsn2D/I4PG4MnG3zlaiRdagiOQA0tmOX
   re9yqWf1I5SrOuqwuHdNyyZMgx8qeqJ9w8THsemrh3yslQpg+fUj8BGtf
   tZyVcmRVcmv4NmrYjTn+3ZLxiqA5CA33s34fn17N0xEAGLoCUvx5QN+tD
   lbIfactmsvHpATEOjWmB0X5xqUcqRqKt4joa40u9YSWt4GURlyjdAH1oI
   Q==;
X-CSE-ConnectionGUID: 8Uvaaj9YQderm1jRwBtoHQ==
X-CSE-MsgGUID: CejYt4G9T9+tz3lmYZ5eeg==
X-IPAS-Result: =?us-ascii?q?A2DPAwCyW1Nn/1BqzoFagQmBU4IcgQoBgX6EVbAJgg0BA?=
 =?us-ascii?q?QEBAQEBAQEJRAQBAYUHimooNQgOAQIEAQEBAQMCAwEBAQEBAQEBDgEBBgEBA?=
 =?us-ascii?q?QEBBwWBIYYIhwSBCwImAhZJEoVmswOBMoEB3kqBVoEaLohOAYVqATuCDYR+g?=
 =?us-ascii?q?RQBg2iEJTswgw46gi8Eh04liQCdHYFNeDIBVRMXCwcFgXYDQoE4gU2BNoFRQ?=
 =?us-ascii?q?4JOSoNKgUJGPYJKaUs3Ag0CNmmBOyRZgk2FGYRphFqGJYIXHUADC209NxQbo?=
 =?us-ascii?q?n9GhxDHBAelYQQWM5dRkn8BlhuCYCKpCIFpAYISMz6DNlIZD45ZdgECwQ93P?=
 =?us-ascii?q?AIHCwEBAwmVOQEB?=
IronPort-Data: A9a23:i8BeXq1EPovxeR409fbD5dJxkn2cJEfYwER7XKvMYLTBsI5bp2QAz
 mBNX2jTPq7bZTfzLtB2Pou/pBsC6JbXnYI3Sgdr3Hw8FHgiRejtXInGdBeuY0t+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7wdOCn9z8kjv3gqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYQXNNwJcaDpOt/vZ8E0355wehRtB1rAATaET1LPhvyRNZH4vDfnZB2f1RIBSAtm7S
 47rpF1u1jqEl/uFIorNfofTKiXmcJaLVeS9oiI+t5yZv/R3jndaPpDXlBYrQRw/Zz2hx7idw
 TjW3HC6YV9B0qbkwIzxX/TEes1zFfUuxVPJHZSwmZyu0UTPcSrd+vljFkRvP7cH0PpwIVgbo
 JT0KBhVBvyCr+a7xbW9DOhznII+KsiuPI4etnxkxzzDArAqTPgvQY2Tv44ehm9uwJkWQ7COP
 6L1ahI2BPjESx1LM0oaEro6keKvgD/+bCcetVSU4Ko64mTeyAZ8yrerPNe9ltmiH54NzhnD/
 TiWl4j/KjoXNu2DlRXUziPvmv2UmSbKat8fGbLto5aGh3XJnzdCVUZIPbehmtG9i0ijS5dWM
 UlR+Sc0q6U23EiqVcXmGRy+rmSNshMVV5xXCeJSwAWMzLfEph2EAHgFZjpAc8A98ss3QyE6k
 FOEgbvU6SdHtLCQTnTb96iO6y60OG0VIG4OaCsOQBEKpdXuyG0usv7RZoZeDqe8jIzEID392
 TXTrhIhrakUrfdegs1X4mv7qz6ro5HISCs86QPWQn+p42tFiGiNOtbABb/zsKooEWqJcmRtq
 kTojOCywYgz4XCxeM+lGbtl8FSVCxGtamW0vLKXN8N9nwlBAlb6FW2QiRknTKuTDu4KeCXyf
 GjYsh5L6ZlYMROCNPAsON7rUJh7kPC6SrwJs8w4iPITOPCdkyfaoElTibK4gggBbWB1yvhkY
 8fznTiEXSpKV8yLMwZat89HiOR6m3tgrY8ibY39zgqqy6GfeHeYVf8FPVqCY+Qz4bmLyDg5A
 P4BX/ZnCnx3DoXDX8Ug2ddCfABRcihkVcieRg4+XrfrHzeK0VoJU5f5qY7NsaQ890iJvo8kJ
 k2AZ3I=
IronPort-HdrOrdr: A9a23:cQNmwaHB1QcC9vD6pLqEIceALOsnbusQ8zAXPhZKOH9om62j5r
 iTdZEgvyMc5wxwZJhNo6HnBEDiex3hHPxOkO0s1N6ZNWGMhILCFvAE0WKN+UyYJ8Q8zIJgPG
 VbHpSWxOeeMXFKyeH9/Qm2E9wp3dmA97rAv5a9815dCSZtdqFu7w1wFwacFVczbw9bApA0UL
 qa6cwvnUvERZ3fVKWGOkU=
X-Talos-CUID: =?us-ascii?q?9a23=3A86LVn2oG0SdU/2cOxogRFc7mUZAYbHTUzibhGkO?=
 =?us-ascii?q?1E2MwSoeKY0OX2Joxxg=3D=3D?=
X-Talos-MUID: 9a23:UFBdvAoCvnorfNN9aEgezxpvNvZ0v4v/NBFOjYddv8y1B3F9NjjI2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from lemon.iwr.uni-heidelberg.de ([129.206.106.80])
  by relay2.uni-heidelberg.de with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Dec 2024 21:20:07 +0100
Received: from hlauer by lemon.iwr.uni-heidelberg.de with local (Exim 4.92)
	(envelope-from <hlauer@lemon.iwr.uni-heidelberg.de>)
	id 1tJeo1-0006Sy-NN; Fri, 06 Dec 2024 21:20:05 +0100
Date: Fri, 6 Dec 2024 21:20:05 +0100
From: Hermann.Lauer@uni-heidelberg.de
To: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: [PATCH] ARM: sun8i: r40/a40i: rm unneeded PH23 setup which resets
 Banana Pi M2 Ultra V1.1
Message-ID: <20241206202005.GA24845@lemon.iwr.uni-heidelberg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_122013_756029_028996C4 
X-CRM114-Status: UNSURE (   5.50  )
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

Banana Pi M2 Ultra V1.1 board resets immediately when the usb core tries
to setup PH23 GPIO. It turned out that the V1.0 board USB-A ports are
always power supplied and according to the board scheme PH23 is simply
not connected.

So remove the PH23 setup: Doesn't harm V1.0 (with R40) and let V1.1
(with A40i) start

Signed-off-by: Hermann Lauer <Hermann.Lauer@uni-heidelberg.de>
---

# HG changeset patch
# Parent  236ffa4558b03bbc654515fae80a7a2387f06cd4

diff --git a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
--- a/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
+++ b/arch/arm/boot/dts/allwinner/sun8i-r40-bananapi-m2-ultra.dts
@@ -347,7 +347,5 @@
 };
 
 &usbphy {
-	usb1_vbus-supply = <&reg_vcc5v0>;
-	usb2_vbus-supply = <&reg_vcc5v0>;
 	status = "okay";
 };

