Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 195E2C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 10:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xpCeLBVC6ziEvRs3avdSAkam/Yq1PpMlp/nqMW89isQ=; b=JgaP1yyDHPGNleV7dKInDx1zj0
	jI2YRgdHnyGYLSpZ8pZXkU6HBKZuEj5gZ06n9WfyBpUzEgpiAjhL0VjRNP+1r++us68z225vVpzzb
	vrFfLkwAehUok0ShwmCXgzMZYfxV7mqsuzSyMGd+05L27REL3di6ffspOxVLhWu8B4Hu+vqfUsgc5
	Qu4s3MBjlXgyjxr6KiUefGjH1lveJhZR7kT/jdze4oQZnrIxLwQLxcOH4TXiiLG9ZTX0B3O3pDjBD
	4OiP+VGOvx+uGC+VCPCgsJVMEvn68nbe4froSoKRS+f/kqBmcdQxApi92sK2ODdpTsw1qyXvkkXCw
	mpXXShcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FWf-0000000BPq8-1Ycn;
	Wed, 09 Sep 2026 10:27:33 +0000
Received: from fout-b8-smtp.messagingengine.com ([202.12.124.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FWX-0000000BPjd-2hZ9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 10:27:28 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id CA9C61D0007A;
	Wed,  9 Sep 2026 06:27:24 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Wed, 09 Sep 2026 06:27:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788949644;
	 x=1789036044; bh=xpCeLBVC6ziEvRs3avdSAkam/Yq1PpMlp/nqMW89isQ=; b=
	GVttOQ7rVoRtIgf8/wwQBmmTZqS6+yovk4gPnP/amBkwAXN08n5zynvDHilcjyJ7
	EhC609vmE7SVmrYLvSRbyWlpvdqMq4PnGQUQEsv3yj/9Bh110jW5Y9U5i1p/awlr
	vpJ6gzV8uxLnet4WiMeQ9xIZUR40ZUcMO7V6sTKzYo63Tm4/VJ/TeERoWTiV54XW
	cFBVFKlyJ3QH7xETvB1rBZ0CpdakTevobvInhv+YUdRlepL2oSTG3FMphh4IA8+z
	aWtA4CA2l0+xW6W7Pt9VdQUM+aAHu6DNEdZsiFktZzgwTsb+aqjBJLmSe/EnUQsc
	wajLY0E2ct2oKzrIbZtdOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788949644; x=
	1789036044; bh=xpCeLBVC6ziEvRs3avdSAkam/Yq1PpMlp/nqMW89isQ=; b=V
	MnU3JrmWnWEcGmUesA+O0+xjpoTXwuEHVvMZlawYrTEMNFZETHqq5qy29V7FB7cA
	G0OJ89OPtjMDqc2kSqL4euyqyRF5NFRTolUGM+NMRKM0ijJ+WalMTZ+xDZB29Xox
	pXlbhu5W+eXb/b7gl88rmsrNwmitoGyFcj+jXsmPlHqAUor9RjSrf5/uV2JW9khb
	lm2v99LsThbZvgN4PRq8Cg7N8D71aojBIMP/t4DYdZRsYutMhRFIJRycmCRdP324
	FK/po2Q4Rb2Ue394nikfTp1zj/IjoEsGVr5mHCHHuxRw6Z2jyLMxaTeT3/SOVrv0
	VJGCSjlHRMhovTe8u3yEw==
X-ME-Sender: <xms:jDShapZtRXcn5dRJsX9peYNZzx-jJnLv-kP2DNg7nJ8qgOmX5mkfPw>
    <xme:jDShaol9vgVmhUCJh6r4bg9PaWjJttW2S7kQOLI94wVseHTGl6L2U0gleuXcyPA__
    umKNupyEhPaZHQ2fQZJFZRWGR0EZgYURUaRV6PvPqWN_Ncx-13gnm4->
X-ME-Received: <xmr:jDShanhLq6iRfrgLbZJ-2WxY7NYmo1lcfnGk3bNpZ80tzs8DAXLLpSgiPf6Mm54Gu9xoCS3ShZhw5Q2C3-UTPpHZ0Ei7vuHTsSPA_w>
X-ME-Proxy-Cause: dmFkZTGrfMJS/BPnzvFtxFWH7T2NvqB5iRSUYFltsQYoqh91AcAlEZdgxuHZyrYLq3kEOk
    j5wvhkqN1OKl91HrWXzjjavcMXmgvEWC1tfNMr6YyuWRD6//RUDkmVO3/ATEajCWyfZedL
    8sHEPefu4TqdYPDdk53dU84dTpDQmvitB4Jd8BhRBQx2FhHfLph5+6E9Uyo985vYlfK3rV
    DNGLSCjFuasa5/IY8K3MZyQs8cwzlsSAXH1aJt2liMZr6UglJb7lvyAF9z6AbPEzIyhVzl
    HRoRmsqTYvRh/nPj5OrrpEMagZdYAssoR8SKXOADJ0/HyjV/ybNJdeD0QwSSZATBimrjOV
    AL4mgnMbUq7YhGPE5ZDdveM7LgxCXqkeR1+taogZnmtDGdTPIoIz8vKCuXfUcs+JrBRSH8
    N4DY4AbGSPbRJoO5lIscekZ9Vg7unFGr0zOSFmBrqP1d2MO9RdnFChdTizsSvyQzhgj1UH
    V7uAmxQcHKyNFhglv8DaSP1uBsn9rD3VvrDBsssrJB+V2aWQeFfj1guDKHJh5bNLpfNn/J
    /EwYkbv2WonPJHzMUOTiU3Aa+p+h2VIlNBgUBShi8C2HqW5twJsm/AqlOPN3n7e+eB2jlR
    PXnh+/ASgD1/UfEhGA5LVPFipKQ6hilzf4Ka1pRNzURR0VFQk9fW6EIzl9kw
X-ME-Proxy: <xmx:jDShaiR41btzB0ie6OZKa7-lqmVTmNwT5Ct1Gqh7n62HFmqg_7oRrw>
    <xmx:jDShagbDUrRKyvy1j6TDuv37xaVGQ11xjc5nm55F3kMOTX6YdL2m3w>
    <xmx:jDShanRA4RbUDccIK9FfWKR5LgZ9UWVumEYDpcGDoiurIFsjpKp7oQ>
    <xmx:jDShan_Ei_CbYpmzTGWTj9_SAFCc08jWlMd-uHwp7caR-Zr0RH99jA>
    <xmx:jDShaj5a0z0dYR9gzvlXJnRWS615skYW7YRjk6VBwcJXBWn7-LZqzld1>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Sep 2026 06:27:24 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 09 Sep 2026 12:27:03 +0200
Subject: [PATCH 07/13] arm64: dts: apple: t8122: Fix continuation alignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-apple-dts-m3-dt-style-check-v1-7-4c546e2d9d51@jannau.net>
References: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
In-Reply-To: <20260909-apple-dts-m3-dt-style-check-v1-0-4c546e2d9d51@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=743; i=j@jannau.net; s=yk2025;
 h=from:subject:message-id; bh=W9V+oB+r9lFZT7SEICn5PR68cDT522xBOot+vrw+XQM=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqyFJpU7QpOS2dfuibgR9vXCu5U3BD4VfBDg/9KneOBLc
 OcKL7m5HaUsDGJcDLJiiixJ2i87GFbXKMbUPgiDmcPKBDKEgYtTACZS/ZyRYdc9t897jN7yhr/d
 uXGddNHFBjmpmx8u983p9Vp78+Sf+D2MDFfW1cvtuaXjYPH3o2+1569cd68LRi07ukKelv7ut53
 oyAgA
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_032726_158925_DC5A63C1 
X-CRM114-Status: UNSURE (   9.76  )
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

Align multi-line properties exactly to "<" of the previous value.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index 3c7677079a29..cf9cd0781fde 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -344,7 +344,7 @@ aic: interrupt-controller@2d1000000 {
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			reg = <0x2 0xd1000000 0x0 0x184000>,
-				<0x2 0xd1040000 0x0 0x4>;
+			      <0x2 0xd1040000 0x0 0x4>;
 			reg-names = "core", "event";
 			power-domains = <&ps_aic>;
 

-- 
2.55.0


