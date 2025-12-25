Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CBE4E7AD62
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 17:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=31apXipNlf1QpVcJgO8AvAiPDS1k+UownqxyxhqGB04=; b=EsI4T/VxujE+H8Wofi/ldYg9iY
	+CWk7HkJ93hQHcBN+4nLEm10DHCFjEqAWOB8uYZxx9pPh15neYxeYOHdrVbCMuohggLjx7sietY6v
	F66uqalDnMaXjqrEyqczFtg9C52P876JEtpN6MbFaQr6KBjWl5zBpOBQ2GTNqvgTt69MNKLS62y4p
	ERqjWODxNzB5vUFdWQ8mwAjPZ28nfWSJVH9lz9oo3hpbFvj5RqUenoCpH157WQCuVXfAfGFosy2jo
	eqZgbdMXNCpW5lfYKL+++4NjyDH8C/n7q8UW/WtI8JrB/cjvUaEbMjRiEiMIwQt1mL0ikskZD2T0x
	MF4EwUJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYpBX-00000000ZZm-0Cvw;
	Thu, 25 Dec 2025 17:31:35 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYpBU-00000000ZZ0-15SW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 17:31:33 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7b9387df58cso10842100b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 09:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766683891; x=1767288691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=31apXipNlf1QpVcJgO8AvAiPDS1k+UownqxyxhqGB04=;
        b=Ks1QHYy84W1/rCBsiGM+moFyrKbpqmD7fS6DtNQZrmUGo8HGAJEtQB6+EXzFvXoK9w
         ZCm4PrlhS997HeA+XKS6tUHCId57bOwy8cFdqKHUkLFJY/vRO30jMtgGI0As8SHB1RHP
         i/t/d4oMcgHSPySKv+2eRMfag9PVgsMKF6Zq7eQ8k6CL7L9YcXYbzfGRzjhK7UDd8Rp7
         28+Q0g699LbpBl+LcfX3k4qYSNS3eunR8bYxPQtxOZ4I6SC2WapejtJxuYMQIKjHpfYe
         J9r56PzaswJij939axAF0quA/CH53qBDexFQAJQXg5cRHDKgU+hdQCJJr2R/U6jw1wxh
         to/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766683891; x=1767288691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31apXipNlf1QpVcJgO8AvAiPDS1k+UownqxyxhqGB04=;
        b=qNEnqlweLa0K2s0dQ+2SqomUcEHkEKK8lA+NZ0VhFYv2oB8ba1OWGLslAqaOoBSqAR
         zoFCs8QNf3aE76ztuTW42gZGT8PRTZ5Cn1OnYlnqhETNThg1TnM434v6M7IC5OyHNNDw
         cUCNTSGoAZ1TgCjKljkTOoKr291cMOdvaP76k8iERjlIabFn4NfAkWog81exUP5xqktY
         0PMBu4V9Z9xMiWKPAsJ96vPaJUuG84opZnAWyKeZ9J9qoumsGMXjHvpTNdDsqJ+Edv/1
         mlbrmgGziSZ2vLbjWAGEaw0kIPV7awkW6iOqraS+jcFpvTPYd15AnFoOmEgq+gS9LtIj
         Fo+A==
X-Gm-Message-State: AOJu0YwEhPtTFeSLcMKXAG4m9ZEa+c8MCZYYCJzMczGIqfCfDdou3B5j
	yKUEUjSG1hv1x6ZxIHtEYjAODWK+sin0eqVB8ILRL+O+CUzDZ0pzzcgu
X-Gm-Gg: AY/fxX6QC6xVt7g1pDPClX8GGNCL60bAZDCKvCFt2wrGPQ7LvRYi0kPXfWnrgjqWmwz
	xsk2u5CwU/7hlPyFBjxS1Pwc/MlzVNBth8kBSx6AitXUaQuX9sT/i6a6ZgRY2XQhzPW1l5vMrhy
	1gPl+/k6TZVWLheCyJjanIxDILkhopd/Km+jSOIL6FGif/wIjmxzFigW5jmQcU1hbVgZhEzgRVr
	8pbqJbKwBETMWudJF68b38/qqqb4kXfJl+3TOzgf9dNrK9ZMzFDcpJkflozJ4URq/SgUdeJAh4p
	g2ZkypaEwaWbImHZVXLDQ3c8guHcHU2OhXPDXGbEZJKFQIA9wZHKqcTomECHo3AVRu269VfUW9n
	A3qX5UJI2iu3epMIAqYBs3OGIMFQiH1BiOcmxZW9n4Sb60XU4/o6HNyRr7Su4aCbDgnCio5EzDU
	abbgzNDNOndkJ+2w3JipAjQp1OzCih1xHNfwKwZhnCqVd1ZUf8SQnLTPZu6okaDCHFFvYWRaC3F
	0BNKQUDFpVOMVcQAklE5A==
X-Google-Smtp-Source: AGHT+IG+RrlusK3U5jY/HpNGFiRuvCk55ZP9KNfhnswIoqpfnEX38+YhmOAdvGnR9FlnaOygc0lLqA==
X-Received: by 2002:aa7:9a85:0:b0:7f7:5d81:172b with SMTP id d2e1a72fcca58-7ff664807a0mr20929135b3a.42.1766683890687;
        Thu, 25 Dec 2025 09:31:30 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (25.118.81.34.bc.googleusercontent.com. [34.81.118.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f300sm19814805b3a.54.2025.12.25.09.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 09:31:30 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] ARM: dts: integrator: Fix DMA ranges mismatch warning on IM-PD1
Date: Thu, 25 Dec 2025 17:31:18 +0000
Message-ID: <20251225173118.580110-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.52.0.358.g0dd7633a29-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_093132_327635_C60317E5 
X-CRM114-Status: GOOD (  11.44  )
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

When compiling the device tree for the Integrator/AP with IM-PD1, the
following warning is observed regarding the display controller node:

arch/arm/boot/dts/arm/integratorap-im-pd1.dts:251.3-14: Warning
(dma_ranges_format):
/bus@c0000000/bus@c0000000/display@1000000:dma-ranges: empty
"dma-ranges" property but its #address-cells (2) differs from
/bus@c0000000/bus@c0000000 (1)

The "dma-ranges" property is intended to describe DMA address
translations for child nodes. However, the only child of the display
controller is a "port" node, which does not perform DMA memory
accesses.

Since the property is not required for the child node and triggers a
warning due to default address cell mismatch, remove it.

Fixes: 7bea67a99430 ("ARM: dts: integrator: Fix DMA ranges")
Cc: stable@vger.kernel.org
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Changes in v2:
- Switch approach to remove the unused "dma-ranges" property instead of
  adding "#address-cells" and "#size-cells".

 arch/arm/boot/dts/arm/integratorap-im-pd1.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/arm/integratorap-im-pd1.dts b/arch/arm/boot/dts/arm/integratorap-im-pd1.dts
index db13e09f2fab..0e568baf03b0 100644
--- a/arch/arm/boot/dts/arm/integratorap-im-pd1.dts
+++ b/arch/arm/boot/dts/arm/integratorap-im-pd1.dts
@@ -248,7 +248,6 @@ display@1000000 {
 		/* 640x480 16bpp @ 25.175MHz is 36827428 bytes/s */
 		max-memory-bandwidth = <40000000>;
 		memory-region = <&impd1_ram>;
-		dma-ranges;
 
 		port@0 {
 			#address-cells = <1>;
-- 
2.52.0.358.g0dd7633a29-goog


