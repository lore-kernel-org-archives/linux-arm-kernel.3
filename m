Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FCA103E19C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zGfrel/ZHD/jnfQbmAOjbJYHLBGT6cfB4kl14spMH9I=; b=Djuw2I8iviTfXggBjjQJmvskE8
	7gNk1l7CTYU+SisJq/fGxH8Uv2YK1uFHkrQXWPt8IImtlVPe+pbbIulzktRSHtK+HROovfyHGHudm
	JX7ZLIZSiMjKX1OgTt6LUVeTvvEvKkYwdh8zG5ewZXuxNCMleHeCt/Y/LHKaxM60hIAjCiJIsYXGx
	T1LC7sYqd14MhszWgAbVkA/5+ZPreimBgkiP+ULZMoVfplPw8OnJ05Gs/O+OgOicB+zqc1HhEygMR
	AQNzBOOT1JwN5KBc3owFbxTr4Mbg2V2JW/V/zQiSaTGw1QLoOUVEufDC/GmTpLpu+ddTVfpgEDiOr
	PCOxHbqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sbN-00000008fR7-2X7J;
	Wed, 18 Mar 2026 15:14:29 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sbH-00000008fLr-3jIj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:14:25 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-485345e1013so8140085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773846862; x=1774451662; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zGfrel/ZHD/jnfQbmAOjbJYHLBGT6cfB4kl14spMH9I=;
        b=YxVhDfWVwfgU4xoJ2vcu//l7y2MTVy/y4pVySXxVEE6dUcR5h1gmHjW30V+G6quVMi
         lNN6/9qVc6C6s0k1zqwXPxWvYTKnPzagY5xgx63849ReII2vS/2to0fEC6s2mTA1s+vg
         kkK46Y5/YplqX/p641cgGBLmGqiN3DAt/Hcqn/WqfKZ2ulF+H0dcANsczPrBeGnG0Uqv
         g7Wqio4984cSBDJOacqvMtkDdwFN/RmBoQZQt7UysHdYyA3cQtNbgBs5HYa9yc2hO+0o
         /m8P9i7IdCjnlLme/2GBsnyKJKrtpzfN/apIf9lme38n6XVweUFWbmwyESJDq2YSIBVE
         185Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846862; x=1774451662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zGfrel/ZHD/jnfQbmAOjbJYHLBGT6cfB4kl14spMH9I=;
        b=sPYbFSZNW9s67TPZl3pp4R6Zyp+79t2Xve2aF3cw65YMoJXQA1FVZhcAQX6AKbElR6
         XVLMZLHh5eIOiB5lDbc/oFQMpJuqZDPAlNfcNTmgKUrnl4dzTbh2Pd87rEEBUTiltDj6
         vQGLiSsFC7Bmm7d738jM5q2c2T2QMAqsattGhrzlVp7NZZZb7lN/So6sPyuRKKxJlZLn
         e6n6ua8j5yvJ/iWeyioK7MW0YNbGZaJshCUWdOF5w0m6WqjU6gSTfbvkgOwF45rjidU1
         UHF59JCc5deyYHvSiWQLfXnQo6KGKuG/npcfr1OuTM9c8Kchzin1Kh3D9yeO3Ge3FimJ
         Z28A==
X-Forwarded-Encrypted: i=1; AJvYcCVpkG1H6RVwvhX1csDyJ1csY/6Z605kqbPsdnCKYrpcRTWYrPvCU/vUTHss7zqUSpT0URgvwHgFRoyA3/fDfOkM@lists.infradead.org
X-Gm-Message-State: AOJu0YyWEvrlY8+M0GeaKMBLQgUlooAzLB5QTttgEj746bn3xthgw+yv
	go6P78hbfRIVmzxGBt78pkjcCkJFqz6dArpWU/9sGIwNVQmeg08CyRdxF+ktei3zf9U=
X-Gm-Gg: ATEYQzw/rAUc1XwqyfxDrOep70qKM7UizBKgz0D8dXdjntq4MTddwUF3tEu/mbxy29f
	xpt3OZ4QJwTWEQTjacW8kLck2mIb9U7P3yMVMOPdBSyAkzxKBOz/+3XfvNBAQhBZMDa6mzuw6j5
	qRnGRBo+E+ZsZC4JcQtlO5vtI/TP81ByeCAGj2WNkJYWp8BMzNhtdX8ynSTliZ1pr4yxGa7t8ay
	Xc5E5DDIPD8u9WmJRhNFBwEkoGv3F19inimENU7LLyeWz8eNiniga4fNLMfpiqBRz9m0EvU0un0
	JQ7Qeua0/oC+3Wu0K02TxDL8Gn6cGv5n4pRKId6jUJdArzPMQxnuWYloBG7XlPwZYXXjVjAcAkY
	mfy4QC2NKsz9I6ioAht0tigsEJldGfYW0zagIkVLGWULgv2BD2wykK8/APsINV8kmMvdfIgabFY
	mzRxujhUMI8kkWvcMsDnIw
X-Received: by 2002:a05:600d:6414:20b0:485:39b9:9680 with SMTP id 5b1f17b1804b1-4856eaebb6bmr93960945e9.16.1773846861955;
        Wed, 18 Mar 2026 08:14:21 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5189970fsm9220183f8f.27.2026.03.18.08.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:14:21 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 18 Mar 2026 16:13:13 +0100
Subject: [PATCH v3 7/7] arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to
 pre-ram bootphase
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-topic-am62a-ioddr-dt-v6-19-v3-7-c41473cb23c3@baylibre.com>
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
In-Reply-To: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
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
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxdB22qtudcW/vOftsUM4ujlgu+n+nKe5/41MwleM3hY
 L1zwldKOkpZGMS4GGTFFFk6E0PT/svvPJa8aNlmmDmsTCBDGLg4BWAiETsZ/ikkyRsuDzs/88Wu
 ZUs3Ra0+8Ztjv4uC/XytUj1JndeKGUsY/gfvOp1SKBihVZUR1/xs3ulCn/mxE+ZOygl0Z/3UwZK
 vywEA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_081424_669882_C0AE1551 
X-CRM114-Status: GOOD (  10.90  )
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


