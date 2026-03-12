Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AE2106705A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zGfrel/ZHD/jnfQbmAOjbJYHLBGT6cfB4kl14spMH9I=; b=I2CJFSnr0NB36QfxqaUF26EE1M
	sEaL8Gq4hO6UtKFDIZdfBvAgeEVpT4/pBCe8vzYhiGdQ5Ye+mU3NqOk8l4xEamxG40xOsebxZHT7d
	RPjyeSQB/8/6G/v/1+DvbSEkz+akt2ym6EaFHjRBZnJkrXmgMZ4x+u+f4pDhwUgHhnZjnq9Q+k+nz
	PRskXa23reG0doIQujD3FfxggzgM0whrb2QXrQiUUPCWMf0Cegl0t6OO4nxhUJItwrcgJHO8QZMg+
	VytxEMNcRuzriKVZZwaTJ5aEpbLw8UjmB2wHvpdPkKwK1SfUXVOa45hnewzgwcciBqqUK4yJqvVov
	AJD2y/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iJ2-0000000ERhA-1GAg;
	Thu, 12 Mar 2026 15:50:36 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0iIh-0000000ERVH-29uP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:50:18 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48535a0ef86so10114495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 08:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773330613; x=1773935413; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGfrel/ZHD/jnfQbmAOjbJYHLBGT6cfB4kl14spMH9I=;
        b=TY8gbGF3RP6RgJEDrD+mnkyMaiKjjFZciYqLpcYBAsHGzbgwrnqTaLo2IJxXemCDCW
         qjZi1GF4kOmkE5xaWYmHSb6MTbiWKBEZk/ByHJ6dJdwbdNGRsbG9UWLLUaphxjzAEyyS
         kne7GF1YBVCtq6oDTQdDxZGY+u/NJKF7cewd9H4lzG0KAGH5cWHzsIfsc5J6xfAfSLIt
         WAxlfLgM/HiCqaV10Z0xNR8OM5DUsB3465nAyL0AfBAaI1vKgbE4peKMJ/A8m4gb2b6Z
         DUUZwyT8BnkMcYAlSLzqrSQo3K0paLswLZtR33SgmtqznpjSj865Qv724QyL+nBNNvQk
         lV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773330613; x=1773935413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zGfrel/ZHD/jnfQbmAOjbJYHLBGT6cfB4kl14spMH9I=;
        b=r7eYxMJskjf18LlZ6BC/PsPygVVK1i9ACwzinVlaqWbPGffygQhukCdUSL//4U4svO
         MAkDfBrsCmh/eyWtIXGL8O8ybPMHO9ZV9/Zm49ItKAueTUFzPG7KXj9D/4T66XQKp+uQ
         9S5+aSFr54SVmtiLJzDKAuD9aChDBcqnwCimSqk80sKtrvtFFo1Cfx9a/C0MlnSAUm6I
         KArrnOdnQlQO0VwWBhT2iFAZQvSjRyGOpTwu0irz9UbiypOq5+mv6EIjzzBWwx+LpkXu
         8uLVHYRnHk8FC0bJdlMSxGg4bKP150NmEupgG48f/FNq2GwQyupujkS2Bn0XYry9TUTX
         /o9w==
X-Forwarded-Encrypted: i=1; AJvYcCWAh4k8IS9B1qoUtdPYidamXJ9RyozzjoKMUVmkT/IwA3Hz8p2hh+Jv/di+PRzwVSoI1q2LLI3eXdoVMOXSVYHO@lists.infradead.org
X-Gm-Message-State: AOJu0YxKX15C4lSMeGcSJppIVie/OaTRA92Cvw6yhuFIQcclPN0yVz4B
	5ByWXjrerHn6uHBP1lsbGZJFbD9lLz9cI6s078LSPR0jX244USzrFSLUodvUoGOPdk0=
X-Gm-Gg: ATEYQzy6YK5BQi66W8Zjbl7Berv4ZyPKcw6W5mEfFk/59HhYwOII1BWKvqoS3ztGmFc
	id0h+y1k2b6JchF8KN9P+F9RjANENLsT1Zn4pE7pBnSTlzAfRPHFicpym4gh63nTwlO74A1lTL9
	r8wHWrHWBFmvL3t/SRTN8BpJMkhvg/tldLRI6SBL5NYPsY1f+JnwgxW5SrQekcrtK76r2HO2cZM
	vjDfYUp03tz7Ox8hvU5CWiIiB4qdzo6dydCyMDIsvZDl/nFk+3M9griXPQH2bNK59BnC+srRm8n
	NTm5vgFG3+WMiuXY/tK+nAf8mUjNOsCz7JdWM4FnNEM01aVicDtazWG8hwM2+ko8+s2fdzMArvI
	XGngOZJntVzXgLyY7xSINKgOlBwZS6fjn4haxodYBUDyoI24e9zr84Cv4Zmo4PwLzcMJSoUqybk
	9wNvw13BtvuY1S7IIOHFDHLFHpUsw9GMw=
X-Received: by 2002:a05:600c:1d16:b0:485:3c66:e21d with SMTP id 5b1f17b1804b1-4854b0a56c9mr119096055e9.2.1773330613544;
        Thu, 12 Mar 2026 08:50:13 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e912fsm361182305e9.2.2026.03.12.08.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 08:50:13 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Thu, 12 Mar 2026 16:49:00 +0100
Subject: [PATCH v2 6/8] arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to
 pre-ram bootphase
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-topic-am62a-ioddr-dt-v6-19-v2-6-37cb7ceec658@baylibre.com>
References: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
In-Reply-To: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com>
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
 h=from:subject:message-id; bh=iQg2/EW5erfGuk4mijSK5nSh9QVwrNZkATnyLQE0wvU=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxND6bmTWfLePjz9YetV1XPL1uRe6HDIOXBFz/H8H1Tz
 U9zB8rs6ihlYRDjYpAVU2TpTAxN+y+/81jyomWbYeawMoEMYeDiFICJ6N1h+Gej35bBE71u2YyZ
 r9XPzmT7wqb/fObN/GWTE7xkz9dOk2BiZDj/1cRFh2WfcdS1mvpZH+vz1LWVfyWfFDZWkU9r9vo
 QzwEA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_085017_040392_F96C85CB 
X-CRM114-Status: GOOD (  10.93  )
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
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index 7fa4924ab52484c7ac4243a0cd6c0d7aacaf8b30..55e75e9946f75d4d787c933d1d87de6ea9670a13 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -71,6 +71,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -868,4 +869,5 @@ &wkup_r5fss0_core0 {
 	memory-region-names = "dma", "ipc", "lpm-stub",
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
+	bootph-pre-ram;
 };

-- 
2.53.0


