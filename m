Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801A1C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 09:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pOVg2aiPcPsDk/zFMRyqsZSvGPQno8/ayvFwGAKvNig=; b=r20M3o6YObL0PDZjsTdYRUFWDk
	NYIbcD83JZJRSEtdZH7Hyre1sbQf5d1qSOg3wNhuZY7VeJy16lsV1qvBQpzPQCkbe/3Jl8v2o7baz
	j+s2z5MZlvQpJ3j6bsZ066G986ybJGNjMySeHGXfUKVAouf+P7HXAL454u3EjibZ8sJ76JO1QWNxW
	5GQ2jXuaDqPRyYkj2IiWC/AmU90ZMhDX75KMiD49qrdbx+O6Mui5p9UBmKwE2/YBmX+xUY8W7t7+g
	eCuTP43C16oCRjFvVk3FDPaK0ZayJQbPHuY4SVh83QZPaUX0HfkFypMb8TFn/XJ4KMqHa/ugcGIHp
	lFHmosQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXW4-00000009rqM-2rml;
	Wed, 22 Jan 2025 09:59:20 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXSH-00000009r87-45tF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 09:55:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-436249df846so45628445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 01:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737539724; x=1738144524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pOVg2aiPcPsDk/zFMRyqsZSvGPQno8/ayvFwGAKvNig=;
        b=b2acQrhz9toZBK7WCmGgq/lMn1Dc02FA08gF19cX6f77Qm5HWbkOXbFsVOsXypPuaF
         Irnpy2oscw5dZ1WkT8pMU24e2vqSA0rHvhEHtj3dw5Fw7CvSwBSZto31MZhAr6b8qyqc
         OeakH+P6IYnMVw3tqbIUWfClgx2ucn0OhCM3tcqbbrAwVvIm2c98j1nLLLvyMOdI1+EK
         mGal08m3ktEzbZEX+JKj9JNEZZLt+uvf/rDuxLGi7iowfvfTaJFMXgMRid/wwt/DmFIR
         HNIS3bhATkqMilJJGLc1xZKl4xZj43iLta6swOMmMlnGkxzuGQhCTBqQEcdpeG44k3ra
         JOSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737539724; x=1738144524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pOVg2aiPcPsDk/zFMRyqsZSvGPQno8/ayvFwGAKvNig=;
        b=FbISP3stkapYi9On04PPjB+Enl5JN4nePc8OhEMOv55MlsR6l2xWg6dVGcbttkPMM9
         pC/ntZ6ZdKq/ubFOnlRr3eWPjL/ANYD56gLE/CJo8DF7N1J0gmUPf8DHj6Zsi6POO1vX
         sZreJ/49zo7Dw0LHTONZHXX/cI7k1fZEj5fCRRhXpqAKcxiVPPd2n067fMjuJMdbj6By
         UxXxZpCvapAtgbaOjI0tPZs37LYfxF5TnmVV5FcaG6Qq9Mi/9dHdjKW29ip5NFhx/H87
         SQzgBCP984QTUVZ06mRHkGEaXGa/CTjv8d7ptC1tS0IxGE/LouFcIODkSTY65dQ1V9Fs
         xLIg==
X-Gm-Message-State: AOJu0Yw6TATOGehtOySortZ3maCRAyJ1N2MIBkfcYGH99/2vJT/cCxuF
	kHi+QSoDJpmm9OrM0jLHwV3C0vI3rwzR2x/6sIvtaHEtC/3ooxztmS278kSt154=
X-Gm-Gg: ASbGncuW4oqdCdYyHx83WBVmW+8v4pnKSg62WNFIXUqMKvPTPu9d8drrrKs+mzFctSZ
	gr1UvpSWzGkKRjiEm60bUnscw7kxZKZ8i0lPjWJ7XA4xEk8gpmF0EpcQGPFP/eu8x5Qgt+U5QGT
	Xga690c93NEbO3CpvRbYjbAx6l3DhVLzMi/UXZ+qHzQ9Y9y5Qqy9WNUfQJhKeaH6hKSUvptrtj1
	u+b9BJ+wEIX0abb3eo46nIH7oHKNHrfvJzSENNBLewrX5w8xg9FP5ZW20XdS/y3hb8=
X-Google-Smtp-Source: AGHT+IFnvm/CFRqfIFTIUXUXtoh2Q7PT5HxV0OvAXIKP72tokUlzPkbhq8KLMUJ3KzVCF9+2yyxIkA==
X-Received: by 2002:a05:600c:1389:b0:431:52f5:f48d with SMTP id 5b1f17b1804b1-43891460bbemr214978685e9.31.1737539724275;
        Wed, 22 Jan 2025 01:55:24 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:f705:a3ac:14fe:4e1b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31adbccsm18394995e9.19.2025.01.22.01.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 01:55:23 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Wed, 22 Jan 2025 10:54:50 +0100
Subject: [PATCH 2/3] arm64: dts: ti: k3-am62a7-sk: Add r5fss memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-topic-dt-updates-am62-wkup-v6-13-v1-2-f74835b91da9@baylibre.com>
References: <20250122-topic-dt-updates-am62-wkup-v6-13-v1-0-f74835b91da9@baylibre.com>
In-Reply-To: <20250122-topic-dt-updates-am62-wkup-v6-13-v1-0-f74835b91da9@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1193; i=msp@baylibre.com;
 h=from:subject:message-id; bh=4C154e84jVK9Fewi+rzQJ/XiJhKCIZP2v15K8Dx59sY=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNInHKj/Pmv+2n+P4ruO5kqXSWywLvny68Cbq5rnxNZP3
 TdB/x/7wY5SFgYxDgZZMUWWux8WvquTu74gYt0jR5g5rEwgQxi4OAVgIqKqDP8rNCLusryfaaxe
 /TRkjb7ds1XLrrRl5PSkXfWyqDmY/Fmf4Z+qzpvvJ5P/XV74z4hfayLLgqdctiwKi1ZYr41oqr/
 UdZATAA==
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_015526_017382_161D1779 
X-CRM114-Status: UNSURE (   9.97  )
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

Add the dma memory region for r5fss and list it in the wkup_r5fss0_core0
as memory-region together with the other already present memory region.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index a6f0d87a50d8a7ebdb61e609e8071d6681dbec9a..627b045e3056661c11e1e72bc955c6368094c973 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -61,6 +61,12 @@ secure_ddr: optee@9e800000 {
 			no-map;
 		};
 
+		wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9c800000 0x00 0x100000>;
+			no-map;
+		};
+
 		wkup_r5fss0_core0_memory_region: r5f-dma-memory@9c900000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9c900000 0x00 0x01e00000>;
@@ -737,3 +743,8 @@ dpi1_out: endpoint {
 		};
 	};
 };
+
+&wkup_r5fss0_core0 {
+	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
+			<&wkup_r5fss0_core0_memory_region>;
+};

-- 
2.47.1


