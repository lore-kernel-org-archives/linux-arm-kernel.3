Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCA0EDA688
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcJA/8Mwq453n41Liu4Q1RPW1Mr6IjyitTMqDg3JnXs=; b=Y+REimP8pkagEhq7szLNl0DTRn
	R7GVp8tmFKSkMoXR6BcP+C2419zcXCXN2idrXs+HeVRcGvnRJY+gkaTXlAiSH5cYXKv54GtbKkcon
	MtgcuCWmt30oIbi/q/7NFDdTpJT1tzx/hAm4qfDYK8CGXwEE0K9EklRgjkCP223AAU6oGkVR1rVzL
	Up9oEIjdwrTn8JCZgr4gxN2zWaN/PO2T1cmKsv2NfB7Oh+gFQr7EA0i/i81tVsqOoBSCJLLWszRnN
	5vZSHtypOBimxWcbd4lSCErdbuUl/U3iN+FWXt79ycueS7connRYiCBMDCOuup4PgJWNdRk5cNRAj
	DZLqgDjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRRj-0000000FOwd-2g9V;
	Tue, 03 Mar 2026 15:14:03 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRRf-0000000FOs0-1zU8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 15:14:01 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so66755735e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 07:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772550837; x=1773155637; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcJA/8Mwq453n41Liu4Q1RPW1Mr6IjyitTMqDg3JnXs=;
        b=SkJh0oRjNOPKXTYN6rhwRJNlqaLBKOPAWULkaoyvBWqNW+UPcfJujrH5wOQjl/18xo
         SKLdXeUSbgWqd5rmbR/Jr/FSzcR4goqen9vKuTGZaMtWfodYGzpJp7D0Pav5wkVTMoWs
         W43YSi3SdJ66iApELICQhn+yIJ33qlLNg3P/D85QVTFGSM2MO0tFeoFRQmGFHBHPA3zB
         e1WjUQbsjb9kU8vRCh8Q5MqZj7K5+i1njzFKiJGgNSvPlwmUENlrLsTClNFXyUVouUOB
         Ky9KqboUE+bFlmHJE8VHwN8lavcb8jPXEsCIMecYhvOlYcch5jHCCcuzF8iDBHE3PNFR
         yjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772550837; x=1773155637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TcJA/8Mwq453n41Liu4Q1RPW1Mr6IjyitTMqDg3JnXs=;
        b=Pwfj1tqCsd9RJy0dYLOBalP30Bud6mnTWQpXxEyUcKcF2hgl+vIyAqwb7KrrfzNjWY
         tKE27ux/Ck9yAaG0okEyDiRd6Vzp8DgHdT6tfTFV+KVafRrM8090s3YNqsMc2n72xRr5
         kKb0V/XllFhcJQl2wxDY/rs0CR9wBAFj3QtyLfbmqU5yKN/TvKbf0EoRLps7osdrepqB
         O77JKW9oJ8QKkFSiG6Q8+kE+7IZO18GEFfubpJtQJrXlVCHnOXgYDx3BzvVTABGt65R6
         nncXRoAjC9zp0RZKM2XMG5f4E3lgukuLd+8N1CDFNQcpUPhxYEX/YXsvxFizfTGitYnO
         YKuA==
X-Forwarded-Encrypted: i=1; AJvYcCXi8lmi/lRPafcjsBnblG5JSDyTUo9d82iPgTUAHPNH0UHPWnu4zW9hxvc80QX52HL/S9REXeKWo2sAurNCAzh+@lists.infradead.org
X-Gm-Message-State: AOJu0YyMK1af+zKuhhC3u9KAizyfYfgfFUgXlI/8EKKXirqhksZRP6dL
	M2lh0196+ouD9EEdRmhSINBxM66+yNKjpya9oFUz9F64ECazanMTS0cCsnEZIV8M7mR7q/fK1DQ
	cNPmB
X-Gm-Gg: ATEYQzz5nyM52mITVXS6wN7I1XKelwoB1g8KSkTV1lDOVnYyQ2H8fAaep9/Xqu44RCb
	YjMlbXS28lWWwbcplubHSEjNpG8Pt5kBHXicxBErpOM37iH4t5TfGY1cAbMMNqVx13ocnunevtz
	irVW8y8Ivj/dr62rB6sHKST/UrgOAMPF04dy93rdslTi5zLDHAZU1BHASvkno3JH0F992JjQepP
	R26i8w9dW4mvTyyd++NYLOrdaFVa4yXhhAgQdN3x1c2r6erYnMZeI3rCOUEx5cxfkN1ZOnEzB/6
	YIr7vjkwSHA1axjGRkoAYQTx9/5AMvtstvon34d/uuk7v58QBCZWuj/KFtH+sNLIocR9gtHkkTb
	wEvZvtTOwIKf3SagvBTvjKm5Gv4mKeGPFPV9XtrL6gPTRxh0xBfQoZ+nC4aMTnejW7RSpkPCARR
	k9H6z7s39IJfPmd1jhrVnY
X-Received: by 2002:a05:600c:138d:b0:483:361b:deff with SMTP id 5b1f17b1804b1-483c9bb2c10mr288804005e9.14.1772550837470;
        Tue, 03 Mar 2026 07:13:57 -0800 (PST)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485133a928bsm16836685e9.18.2026.03.03.07.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 07:13:57 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Mar 2026 16:13:03 +0100
Subject: [PATCH 5/6] arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to pre-ram
 bootphase
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-topic-am62a-ioddr-dt-v6-19-v1-5-12fe72bb40d2@baylibre.com>
References: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
In-Reply-To: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=msp@baylibre.com;
 h=from:subject:message-id; bh=60YTLpePbAhheGlRr0IQd8JJuIK7LJIkkR+TFA7gb4Q=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxlvxapbb+ukrBkiiWL/dGWrBdzmU5+2qJZLJB4bcXeJ
 juRqrbUjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZhI92NGhqMTJx+Jf+3y64SS
 fGqP+JfK+zmPogS2zPB+eWDNrfYb/lMZ/lf8ujlRX8Opj73dWtMvUm/m8dOJPHveTLy4d36ebLf
 ANiYA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_071359_550755_9CB2DF81 
X-CRM114-Status: GOOD (  11.12  )
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

For IO+DDR the wkup_r5fss0_core0 and the
wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
setup is done. These are used to read the lpm metadata region in which
data is stored to resume. This needs to be done before RAM is in use to
avoid overwriting data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index c381cc33064ec427751a9ac5bcdff745a9559a89..46483d4085c20fc297d28a49ca7ef5d4bfc4ae9a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -75,6 +75,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -957,4 +958,5 @@ &wkup_r5fss0_core0 {
 	memory-region-names = "dma", "ipc", "lpm-stub",
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
+	bootph-pre-ram;
 };

-- 
2.51.0


