Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A549BFF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+67EPX7Gc76LkP0rB0FN86BjtT6XKaRsT3p4u4gAuA=; b=ex8c9eS+IaOX/a6Sr3r1juCGPC
	rfWK22rHyUO+bB4gd6svjawXvuyd1EmStWwO1GmHqqYFLb9nF5/Exx6kkaNT8Rqe/eWF741Cz67WK
	+UqeALIRYDaUK0lgXjHszEpqVyUz6ObC/wV0ygY0oXiM9WL70JRu+8O3PqsSrw1O83REJPlLCJgdi
	ggSv1AWAS1wBu9wHkpAeDyaO0gBd9FtP38VTyGTSKcf2yk7uZNH6r4DdZiOFPrYCyJt4bHqfmmDAB
	vB6KGlhg4O35OQXZZG4/02Q23lY5eBa4D2fRHGdAGUSUnJ8VsEsechtjNglSr5SnidJsKxmjyKVsN
	TbF6fi5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4sf-00000003fCc-3Y7Z;
	Wed, 29 Apr 2026 13:23:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4sW-00000003f8j-1H86
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Apr 2026 13:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=l+67EPX7Gc76LkP0rB0FN86BjtT6XKaRsT3p4u4gAuA=; b=gTveE/QQx8bhldnkR5DuOXml/N
	6W4yCw56DDTHDfMN0dkbC40EgRTSR72WmAwBJQXUGDc11VlU5G8yDopbtFozf93gWZIl3QTfhabhd
	XQLW4m6itFxgoxoPvWakceQP5UxxeoicFqzGMz+b8bu4dLz31ldK/MMeBq1cN06kst25BWfa+ohXf
	1LJ6hxD2t2iwLGn5z7Y6//qdLrrs2YO0BEHxBS4moSlrb32NiWCKpmPdDd+vIQ2D5pecepg49lLFY
	u1nqLITAEi9/h0YRtryLjc1P9v4GArSsDvW3K4bCOFTLwX4A/dP6SjtX8ZO2DwpixwJmWTrOf9gfb
	gYscbe/g==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4sT-00000005Nwe-10JK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:22:58 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so7833043f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777468976; x=1778073776; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+67EPX7Gc76LkP0rB0FN86BjtT6XKaRsT3p4u4gAuA=;
        b=pEIS95MR5SZNreO1Yjpz/V3FHkoLU4BnZ7OBbLAA60O44b4RFNtCjTuNd7XtA2/Y/v
         xI9rpVTd7yq3SfoGiMM97/BtCZRQgT6ia4s/h5fPrFtvm/bxBJI7Sb3n8U518cGScIWe
         Qp/oaZdUQ6CZ875LV6EFkW8tROlak1xOBMd0SqqfQyJwjpWCUmWog0o4h9xa0Re21dxt
         WziYbzNby+utJujz474VbR6T0CivzzOzpstomLWo57Gjjr5PQUYriBnPMPJR4kgUvLLH
         CzpoM7WkDF3by9gmAO49bi6IwaznqzbsOiHNGJC3N6fKR7fqTeM7OarzjgpqMYJTYKSk
         1GYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468976; x=1778073776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l+67EPX7Gc76LkP0rB0FN86BjtT6XKaRsT3p4u4gAuA=;
        b=jKp/zYin1WsByLxRchaT/tWFH2A57Cgl5hOaWX18H1oWNLpzlhKMFH0KuCBoL6Aqjf
         Wff0D2OwwR+GLOotuEKXHOb2D5q+mApmapsE9Jhvd6nHz0PY9Ao1z0MVNPmXAV2VTVal
         9RE2UnJZ1Dqte2xMtH6ybOHAdLr/ub9r3PkGIrV8aIWsWkBQe/mg4yQh8vqHiX2hSt6s
         qANwaGJjljmdcdaNaa3Zp6eJ6QaV4QkYTWt5ARTJUfoEIMxcXfvSN/lR7NCI3zUmJohU
         mOzfscR/kxGU4SoEisxLlzpri+Bj1C+cmwzKuqKJLlpo8je1KEZVoQFmlR3JsoJ1vJWP
         RLRg==
X-Forwarded-Encrypted: i=1; AFNElJ+tl+k6Lv2d/LppTVGSYx7mXbqz3ub9JpBdavBYKJSV7IpzK72V/34dWnxNqLvqFZIlxKe7d5uKdg4YlJOhS1ZV@lists.infradead.org
X-Gm-Message-State: AOJu0YySXlSzFRe3ePuztnu0W/N66/ueh37FrWsr1Sa9z/uVdyHGj+gc
	xbKJddk4R7VGQDva1Ziqtj9O+FfbeLjP7XeOA66Pi3ix9lsDclMrtL0Ak/NiweuwjRw=
X-Gm-Gg: AeBDievEQtwjq5jM8vIwh1i7TsmYh1Y1WnfVlBJyx75iII3TM3klCzZbx6aAauBkXMd
	wUXZ5agFZgKpmGu1ykBWJYr8s6SE1OCDKWiNEhLtEDRhlfz1sbQkh2MwrgTeH5pjSpqB70EvP8F
	kkzA3n2uYdy5W3V2OvvK9IoxGpkoERHTNr3rJVOo7qpWntnFU5WxnESHe3BdDD+lMB1beyzOqy/
	ktzEDs64oICk7SjP8etBjGovotQ2+h3dXmlzDz90IXvX2kLoNILUiXeAs01z6OzC9VRqPYEUV/x
	OA1Aknetj5fz/Hv4k2iHHoqMqJ9SszGTLyZNZrVXWfcDk/5AkCpBdabrY2eGV1Dhkdt0YCngDxu
	PgyAQPOH1JgSYUnIsd4TSf2ovcaY6GffehiGfDgWr3J3Cta/77OwfgwEGrwL2kwJoYkVkPsqTZu
	ZcQTc36wGxOlRmcUVgNAkMzsZ+ySWzba8kJ5pJW3vKow==
X-Received: by 2002:a05:6000:200f:b0:43d:70de:1c68 with SMTP id ffacd0b85a97d-4464aced5d6mr13681441f8f.30.1777468975590;
        Wed, 29 Apr 2026 06:22:55 -0700 (PDT)
Received: from localhost ([2001:4090:a246:83ca:1917:a47e:1872:2063])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-447b7ca664csm6222511f8f.35.2026.04.29.06.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:22:55 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 29 Apr 2026 15:22:10 +0200
Subject: [PATCH v4 3/4] arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to
 pre-ram bootphase
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-topic-am62a-ioddr-dt-v6-19-v4-3-fc27d6ac753c@baylibre.com>
References: <20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com>
In-Reply-To: <20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com>
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
 h=from:subject:message-id; bh=S9PhpLFx+N3VMs13TwHZ1Fz84zCZTEwqsIfi6+XGGtw=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxPbFJVk2Y4bps8v5vpQ4TVzSPWh1bZq7dd2XBPNJfDT
 EBcSti2o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACbCPJuRYe2Gp/f2hhkFbM3I
 lt+4wjQkM2V+WMzTmR4mJv7vLW8FOjD8lWVjULp38e6GqV6HVFawCt+4ubqTifeU7z+2OJHGJdm
 1PAA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_142257_415935_2D0D2E7F 
X-CRM114-Status: GOOD (  10.65  )
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
index 6f2ee93c7be141ee5ae3f1e3324d3a060db069f6..5155f093437f35d815b2bf62429b57c9d8672290 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -75,6 +75,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -968,4 +969,5 @@ &wkup_r5fss0_core0 {
 	memory-region-names = "dma", "ipc", "lpm-stub",
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
+	bootph-pre-ram;
 };

-- 
2.53.0


