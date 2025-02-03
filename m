Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F23C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v27Uu7ms64VNAEkPo/pGBt9MmiVmiFZ+LIBdVSi8mQE=; b=2nJ7iqdAB6ZxLsqJaY4l7iUNAT
	CKp42IBPlSbDmias7kKODTxOJ/TCDfYmVP7HzKzZGexfRblIMh+yr52PW+36996XmL8Pc0Vr+1xI1
	mHGVjAB92q8wn0w6nUNQzV/WMIpBmghxT2pxNy3+yzkrWFmWPpB6hdS43aOPMhQt2LMknKhbrEiOO
	RWUdAFmAxVJyDDlPv+sAwX2m3Hx5r7DmaVocE3ZMCA2JjCVfC7swO6nxeZmk8Q3iSOiXJT4dflfQz
	HkCk6G+LBMsBs/R95W3DdEk1YWCnfUQ/1RaEXvr05XVHZvEaJcbkNbxz1RX5yWqrVNaLIBRbUyH29
	BXiLBy3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tevEq-0000000FKHj-2orN;
	Mon, 03 Feb 2025 12:07:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevCh-0000000FK47-39ys
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 12:05:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=v27Uu7ms64VNAEkPo/pGBt9MmiVmiFZ+LIBdVSi8mQE=; b=Mab3ANb5p8ciCU01fgUFonhSfd
	TEMRhIkNLqNOek9Br6i8OL1nVgxAy5lWccFK2HREr9RIrlYi8N0ITdAVBJw6lexbcVoo1xiSxS8Kv
	SVsLOFB9tYAqrv0aR3vgUl70MPyUOP108NHS32SGrBpsDeg1h5SkR0wqMCgVGaJ8Ptcyr71SiwsPF
	VZEHoeqtNRcwuMZHdo9BmOnhzSpip0hobQJQlYHBOH/aZ/6+z/TbQjLRl59aUmGD3IHAkzZCI7ASi
	bG1DTvrCPBm/fkDqYQwDwAq+EX+4ZS6RBYVDapYtMIemtE7s74wflEUa6t5XfqcL/Ao5LNMRzbPfw
	q+4LyXow==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevCe-0000000G5F4-3AVL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 12:05:26 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2ef6c56032eso5409035a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 04:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738584321; x=1739189121; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v27Uu7ms64VNAEkPo/pGBt9MmiVmiFZ+LIBdVSi8mQE=;
        b=jt633N05jbXkZfMiJASND3bfdZsNIb7TLKPGjkIk+afij0CG5JoIxCe1ac0lwlaGpP
         VcXLEYtpK16If+/yZF1WMAfOxvOxQHNhbNBp/tge3KW6GXY6YL0VWFjK6OOzl4RLAZ4b
         1kxIxMnNZBXWahAQsml9Dk5kHoEZsUQeMJ1kGWZkE9aTUNzpjxyLi8+gsNiHMIUeXXar
         8PiJzB8qAmYEI0MRIByCPxNqtemV7xxnJ/OvGaX6520kD0zxJBiy7UH+WGjrlTnzhIsP
         rhNnRT+luPotMn/amE3ZSgifEWAqO2fAUmHuIRTB9lHTOByi7blwxuD/FUOCeIUJydQJ
         GqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738584321; x=1739189121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v27Uu7ms64VNAEkPo/pGBt9MmiVmiFZ+LIBdVSi8mQE=;
        b=gxSVI4B8Xje1OV9KDiAyqfTuJU02XVI819gwRu8BNeUpgkR6dFGv5zKAmXEgn7hqxV
         icFHZaZMGTJqlQ+i4oyzZuris9BDkqKz2dZG+WobjXexsWtMDKvPP1DBLjgPbNSLOKIF
         tMLdWy/BSk3ICDRlTTL7YdujJOstf1Tmom2VJg1EuuQJ6S2OXUzRVJgL8ZDlJIykvsFu
         OyocwcOUV5uLSI9AKQa+PJJz4AjOJUAT2+RN/cYAR/dJ9gq2O+ehPBj6bT+SQmcxqq/p
         SX4ymS7CzpLzWpqkwtvfjgFOBcWqJiwFzhSYipoHS/F6/e3n1xulCyN0lnFETKkEF7Wc
         2cmw==
X-Forwarded-Encrypted: i=1; AJvYcCUJYE7Zucy2OxFbh8hMkKPUdbhfdG1/3SjvIZPN1s23hk9LuuB3RpDYovB9SbHIg5oiUy3pcLXBZw5Vl6Zh83LX@lists.infradead.org
X-Gm-Message-State: AOJu0YxejcSn9CViZ7BTjnsGxQxsJDvbRP/488vYsqCr93OtFv8gdP8v
	lwbzRzsC/bxcAUV1rRxrFhogkNVRgLOmqvoXLZZZ4LH2cIkqTKBsZB9JxA==
X-Gm-Gg: ASbGncvmTZ4SkK54WZf2qbLmdHefF7K8eGG+cN/eSSJLQ0R3csbl9lUA6gTO5HpIpMS
	FMQSD30YCX0XYqLgxhEzZ46ZHkk1hn5ZSYo0knMmhROOaqLmaPbZU+IxvW9I+mH4WAWgk9bS3HG
	0+jye8bkggUq6qA4E1ndVOE0ZheSLPjOFeL8TrUi319DgpkTg6RRn5GyiCBMcJRt59mj2di48lL
	Gu1ImRj2YN9KhC47LE0Si2F/ZWrkyR7wmvpLkR8a/qm2WHw2bfYZNb9cjY44KfhYmI8bi21oBTp
	iAsqBeAaM6+vd0cquWzln6WszEGgCA==
X-Google-Smtp-Source: AGHT+IHyIauWTC9z0duzSMqu8c57XtVz1O4+agEiGC9Y2shf1npJnycIEzwaZl9lF70bSILlvQbDiQ==
X-Received: by 2002:a17:90b:2b86:b0:2ee:b875:6d30 with SMTP id 98e67ed59e1d1-2f83abb34femr33675709a91.9.1738584321382;
        Mon, 03 Feb 2025 04:05:21 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b1fd:33d7:73ae:fe66])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bfbfe8dsm11060468a91.48.2025.02.03.04.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 04:05:20 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	lukma@denx.de,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH RESEND] ARM: dts: vf610-bk4: Use the more specific "lwn,bk4-spi"
Date: Mon,  3 Feb 2025 09:05:11 -0300
Message-Id: <20250203120511.996058-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_120524_894249_A8911017 
X-CRM114-Status: GOOD (  13.16  )
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

From: Fabio Estevam <festevam@denx.de>

Currently, the compatible string used for the spidev device is "lwn,bk4",
which is the same as the board compatible string documented at fsl.yaml.

This causes several dt-schema warnings:

make dtbs_check DT_SCHEMA_FILES=fsl.yaml
...

['lwn,bk4'] is too short
'lwn,bk4' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
'lwn,bk4' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
'lwn,bk4' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']

Use a more specific "lwn,bk4-spi" compatible string to fix the problem.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
...
Changes since v1:
- Only resend this patch. The lwn,bk4-spi compatible has already
been accepted.

 arch/arm/boot/dts/nxp/vf/vf610-bk4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/vf/vf610-bk4.dts b/arch/arm/boot/dts/nxp/vf/vf610-bk4.dts
index 722182f5fd17..2492fb99956c 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610-bk4.dts
+++ b/arch/arm/boot/dts/nxp/vf/vf610-bk4.dts
@@ -119,7 +119,7 @@ &dspi0 {
 	status = "okay";
 
 	spidev0@0 {
-		compatible = "lwn,bk4";
+		compatible = "lwn,bk4-spi";
 		spi-max-frequency = <30000000>;
 		reg = <0>;
 		fsl,spi-cs-sck-delay = <200>;
@@ -136,7 +136,7 @@ &dspi3 {
 	#address-cells = <0>;
 
 	slave {
-		compatible = "lwn,bk4";
+		compatible = "lwn,bk4-spi";
 		spi-max-frequency = <30000000>;
 	};
 };
-- 
2.34.1


