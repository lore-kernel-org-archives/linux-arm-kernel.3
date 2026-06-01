Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA37FCD6E4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 08:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmVPGxo5yViqGmt/Bu0RZOE4gHJiRjSg/HFe8p5NX6s=; b=vOUh0zcrPq1ik8+x0ViJ5b64ZO
	F88kPTjDbism9g8+4VqFFesUTEBBRybGd+kOQvG4xU45gdi0YOdG/qN78zx6RhAU9E0VKrTLQ0Rn6
	XJ/HwNcyl72cxTHWi+PR3WaVIpLjXw4n4g9vTwspiaFoKMxnM4msCQXncOrfAVOkEHXvcRvKnbw9j
	rCj7Kla3+DVQ1Z9WnZkaE3Sk83LDpZIV2Vf61YkA5tBjxgJ6yDd+l7ixxJpc8f52rUof62rO/qAAo
	5g5zzFMBqjW0J/EDUg1cx3gLHWjYE13g1rkrPqgG4TgWRpQwE8gijWDKQGWgw8xwjKlDljnM3Nn95
	iYGBHJkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyId-0000000APDR-1ehN;
	Mon, 01 Jun 2026 08:47:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyIc-0000000APCG-0zou
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 08:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=OmVPGxo5yViqGmt/Bu0RZOE4gHJiRjSg/HFe8p5NX6s=; b=jDdqyLbYwBki6Zd4c2ghcf4Rne
	l5MYTAOr1cQBLWqkCm1OA0YhdjwyrdSR5/PeYi5HV0bJGbp1Geuo8fzd25zjcRymG1fSaftMLzGYs
	talB/FEqVzGIAAzVzfaWkcRjgqJlNRj1kJ0mUweYyvLPnW/jTOMiAOcOkmtc3ngWXwAos/IyUu0qa
	ZgJk2XFeCCfBitqvMb6jrVy1zD/vjsM8p+q1lil+w/3nNt+Qfh80MV93teeBlLvdqB6jIWD0vlUYp
	P5Nynl57HcU5lkbeMQHdrXh4xDWEOHxgNnmKYG/9GBuW1WLkHj1G8/7urrGyNZQP2DAtwcsC6LKUD
	YkEWYmdw==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyIY-0000000678C-3E6R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 08:47:05 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so100945095e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 01:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1780303621; x=1780908421; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OmVPGxo5yViqGmt/Bu0RZOE4gHJiRjSg/HFe8p5NX6s=;
        b=hSwOzMxTqIKj2SJBWPst+tA6l+IXLTGs8Mh1uD0iRX5NqYef521VhPx0NykkL5i9mn
         gz2J0m+iRndmbWZXyCiskyYws4Hwv76wHPpUIkYQyWx5psxy2uEuE+vP8yXlOfwE+UYQ
         SFBERiDeSUEsj83Q2kWvlPqLXwgFKKRh96dL/zkVHRUFU3IO337YWeTl5BHCIJ4zLLWd
         J2u0H9vjzbFkJ9R38dvZx6aPYVjaVstjlYMj1z4z5y7UZ2t38kHVn8dhHAYG+aVdv72e
         cNM62USR6hpV6fcpyfKWChuwnn5lc6CgIxFeRgCEsQ1sMiR7N1y2cmhvbclzq+fMZUu3
         YDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303621; x=1780908421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OmVPGxo5yViqGmt/Bu0RZOE4gHJiRjSg/HFe8p5NX6s=;
        b=QZxdkqiE8EUPotegKaOCSTlGEsYpM6qcupVSdtB8ZyydDOfY7uNmx52V3OY7/V/mYU
         W3yhWp1PSv4O8V9rfOCy1STEjBvQz3EP5GPNkH2YJoEeixI0kPkmDDOxFLEQSDWIT8qC
         tHkVP3A1S317zBCKebvDNRI/UG3MYtLhHtPMY7lr8pkQIFM1o8qC/RgVqAbQcTKN8/oz
         HAC1NPdyHN45CYKcEzI54PsR/xa4LnimH5YmfWM0ZPcdlGSESzvC26mTsfnK/Ta/Cykt
         23MA+ZDVZlob2PoHKttyPVZAdwZHNTqJghvuLLxB9EwLl+ttr28fWaOfLW4mueNkGMub
         ujyw==
X-Forwarded-Encrypted: i=1; AFNElJ/VM/11o5Q9hK8idBPfc2SZJCskSUJlBco6oGI5csmPvOTiofbIkdBQ5PCvVauh3/f4rUJGHm3tD40q4vqTjyWI@lists.infradead.org
X-Gm-Message-State: AOJu0YwT+gdiD5nbLQpEoHlnxuImPPikWw/TAO0c/hJ41g/1Kjp4S1KD
	FIZFyo4rseDwh7GV01hCRqayPJ+Y9PFOVKSbq7Ui0krzPD+4bryYGyytM24yIxz+ahDAoeK4Lwm
	vSzVn
X-Gm-Gg: Acq92OEr7W5N1Z8O5bTG6nlpzb5pTr6ba1qvcaUeCLkO+rIKlm9BknYi19CHCeCBSgv
	72gpOKh8s3jEkFMshqvGQ8CUKDn0EYBPtxpmZ7gEMLVe6yLlmMOzuyt1tvgyUmBxXJZg+ZVhhg7
	g5J/uv3a3OlwaaC1+t+LhY8WP0igWaBpLt4wL+L5W1LkU1mQPSquXYy3VcYfu1WQh5q4iW+iy4P
	3W/3bTlv39xPsXr5SJlJg8sSArafrZiW2QpshjqrN1ZLWw/LNUgzYytZCAUbay3kox25qn0Cbsp
	BA1hE9lRsru73/qNu5aHNLn8rXzXV6D1BkljKbksf9yvAFCP6LRXnZGpnp7nXCKqLOtK4ofdlJ2
	Aej7K4SJONudmTbYiHi/pAvH6ZIePImJ4ee56shJiytz/X/vHWwuwfCCN5k7Tfmyp8s1zd3MlWK
	qbCJpOVKj0WkTOw3oOx17+8dAZdSYdd1U=
X-Received: by 2002:a05:600c:3b09:b0:490:a7ab:bbee with SMTP id 5b1f17b1804b1-490a7abbdcfmr125745245e9.15.1780303620937;
        Mon, 01 Jun 2026 01:47:00 -0700 (PDT)
Received: from localhost ([2001:4091:a246:8595:a745:3210:d732:4094])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0e8c1bsm95750715e9.3.2026.06.01.01.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:47:00 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Mon, 01 Jun 2026 10:46:16 +0200
Subject: [PATCH v5 5/5] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Add r5f
 nodes to pre-ram bootphase
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-topic-am62a-ioddr-dt-v6-19-v5-5-3856a023aff2@baylibre.com>
References: <20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com>
In-Reply-To: <20260601-topic-am62a-ioddr-dt-v6-19-v5-0-3856a023aff2@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228; i=msp@baylibre.com;
 h=from:subject:message-id; bh=uAMXjM4R4ypUPu0O2chE4qQ0SBsBultATlgaeo4yXaA=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixZt8+x0gdne5pd9r24JXFq5taqTWvXVJ7LXO/GEhhwd
 4HctQyhjlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjIC1tGhmeBiiHPoy61H7uv
 mRzM/9R59bHT++T02y4z56uKqPmtbmZk6CxfalM5ffPSf9vkqi/e8jAp650UeDDj6na7H9e0cne
 J8gIA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_094703_278236_9DBA072C 
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
 arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index 437b1df02142c666019ad4ad3558fa066e04781d..27b8f0b6666091d0ad8fb51be07f000e4c10c439 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -40,6 +40,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 		compatible = "shared-dma-pool";
 		reg = <0x00 0x9ca08000 0x00 0x1000>;
 		no-map;
+		bootph-pre-ram;
 	};
 
 	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -89,6 +90,7 @@ &wkup_r5fss0_core0 {
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
 	status = "okay";
+	bootph-pre-ram;
 };
 
 &mcu_r5fss0 {

-- 
2.53.0


