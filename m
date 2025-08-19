Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC31CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 22:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RB3RsnkAhGDVxAfCO51F476H5OL8bM1IWI5ovyN1KYY=; b=D51p1yxxs54RFSlVqedbaeUHdD
	g5iLj1Ozd1X+m6v88akJ2yZ0DuiswSDuv+PZpNVjojbR4RkDyNj/jSlkSIqGB1r1XjKeZxARqdLGJ
	uHAi9b7Q8Qq3c6FAViEJaFnOxCmRFlmTkv0jenpZ2wienz30pUg0Z9LUM9h0UFJLDgL/TvNvtI0Yp
	qvVwKKD1zaQXmrMrybG/xuZ0MwZfo3bg9KyOWnu9MxhAPhw7c4jXko7WSFmHZh4eF97vrmmyifnxs
	AyoxlLryCZENuT3AG4qWi69kZbD+KH0X+vdSoctJCZYUYM5vZBS4XD7wbw7Uloi4N4ghoUV3zKsZb
	kwPOpG9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoV1m-0000000BkaR-0bPs;
	Tue, 19 Aug 2025 22:42:02 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoSC3-0000000BRlp-3Eof
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 19:40:28 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b4756244423so784550a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 12:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755632427; x=1756237227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RB3RsnkAhGDVxAfCO51F476H5OL8bM1IWI5ovyN1KYY=;
        b=bT4xjIGlNiRd1XlkpWzgdPagK3rO/ow2ebphoz1FxEgy9RXgMfTMR0HlkpEmot+Ton
         RB0NzGVC57UFsQ7qzh9P0Y7NdgkxyYEQuCEJ8TI8Zrwi3tXRguvSl87Q6myxUonfM8bc
         kGjKNq2Abgt/EYI//2AcAf7rXecP241WmctT3NGqBryOT/kpiesX6f2OOnnXa0SnkFHL
         p4BGzgG9KbklAV2BPys5BIuh6ClAcmhNrRl+RDiIrVpuulmA17uHcRYq6LMVs5KIx+PO
         eLue1UZ4ZvxrGCJGQO1hciYzYZcTcVS5zyrosvG982+PfqkrUu8rkv7KU22yIUGAu8Qt
         2XPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755632427; x=1756237227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RB3RsnkAhGDVxAfCO51F476H5OL8bM1IWI5ovyN1KYY=;
        b=vAqIZjzYv9BfSEs8gqM4u+/ccoCBAiHDj6CEFAfVbJB6ty3y25irH5h5TnQBHJOmV/
         55qbgdP99M7IddpyGR0+jPNzgw/6Ow4oHs6DUKrwRaEVGYlYlPj5C0byFxVFtNJsPyjB
         0wobRJFrsNCDI/7kYJfgQlFYe6/5iiJrYG+9IpSi98UXgz0D9SHHyIAqCPfl7gynLzEZ
         gcjrNY3jjKuTrQR1maucFy5Qh4+biG9zBfGtSJRI/AvqTwSglyq4I3J50HRyw3XRfeCO
         btWFd34hP80Oks6RnRPkXdKSzy/6l7dwrLj5lKbkWjXfNuOozKZyuxe9ILcQIRKY4WJt
         8sRw==
X-Forwarded-Encrypted: i=1; AJvYcCV0gp6GMMV5cSMq62AV0/lHF0tzr56VDjnm5dp8OcdMrEVEv1BUnL5ED+jLYlLt86LYEvLwhPq2NmqIllHIi1Mh@lists.infradead.org
X-Gm-Message-State: AOJu0YxKoaZvwhVNMtPcfNGBxywruXjWcwisim0Kl6v3UoaauxQmTrln
	984sJNRSFoFONE9MAUbfsZ3tksr9UB74qwh+H9GyPbCj0BPGa8ihky/H
X-Gm-Gg: ASbGnctVMUlY/WJFEOT2fveeGddGauufJTa9paAaBzPPj9599hHjp8S3QWqiaW4Nrzb
	jzo0lIhbJG0kiKvyxDlmTe+t3HRRfNuelDBYdtiUfNdfTMPjBjh0iIcZyxgcW2e6pRs0FJPxOQD
	34F38iZf0t6iHrrrFk6J0ZLHFw8jrMwSdV0Kmt20O+TMDK8QRZyy5Gs7HnTF37nZLqFKBtd8AR0
	Tn4JiSQBub3edBUvegxvYlcBIHln+q+34GZXiCzQRV+mNqO6LgaQOphBhNG7QAAGJLylKyIcEso
	RbVkkwYLApHVVt5jlVfiCV5DwON/Tl7D+V+REcE6w2u7dPPc0+PU86L5fyMqMzMSp4w7SINrG+6
	b2VVnEJlW4GLEou862Opht7ywQKi2C1AwBKUv4rdqUi8AmTk=
X-Google-Smtp-Source: AGHT+IEVuqqQppFjXblqA04RSvxGPKxaiU6rrBBZfJ8Qs0HzVs63ejkFYfjytKyUbdGzCQMWet8gQA==
X-Received: by 2002:a17:90b:3f44:b0:31c:bfb9:fca0 with SMTP id 98e67ed59e1d1-324e12e4f68mr501193a91.4.1755632426996;
        Tue, 19 Aug 2025 12:40:26 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3ce6:43aa:f6b8:33fd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47640b2d37sm399383a12.46.2025.08.19.12.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 12:40:26 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: stefan@agner.ch,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ARM: dts: vf: Change the NAND controller node name
Date: Tue, 19 Aug 2025 16:40:18 -0300
Message-Id: <20250819194018.2850727-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_124027_807693_6A35D1F5 
X-CRM114-Status: GOOD (  12.50  )
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

fsl,vf610-nfc.yaml references nand-controller.yaml, which only allows the
node to be 'nand-controller'.

Change it accordingly to fix the following dt-schema warning: 

$nodename:0: 'nand@400e0000' does not match '^nand-controller(@.*)?'

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm/boot/dts/nxp/vf/vfxxx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
index 19de9506e0c8..568d81807c81 100644
--- a/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vfxxx.dtsi
@@ -682,7 +682,7 @@ can1: can@400d4000 {
 				status = "disabled";
 			};
 
-			nfc: nand@400e0000 {
+			nfc: nand-controller@400e0000 {
 				#address-cells = <1>;
 				#size-cells = <0>;
 				compatible = "fsl,vf610-nfc";
-- 
2.34.1


