Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B45C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sK8LjopR7pp8ZkQXuKlcKGXgSdG/Xc70Mr3Wn6LmTuk=; b=MQwm1Vw2f0uflvet+o97FfpsOu
	XUsQRkqvygxqspnVjVMSthe1uAx2JkGegPaw8srdf9PULzzxSng02kYhHKvFKFjAEp52YshYBI1cX
	xQ49zKLQdKzDxitnUCY62YZ0Rj68as8ui06kvFRDL5/4HBLMDZlzRqyZPllbyO0wHNscu5rn8yaKK
	Idm8lazB6WkwA3lZOoI/QxDxZbgUm/J/tLIecnosEm9YfLzXPt6gLO+a8uObIYF/Ou8EwiEOGl/HW
	rtouhnW3dQKz4bjhrhhybcQwoyZQq+pd3Q1cjEhJoK5x4ew2YibhXloVs+TukGYjMvEVg4EHMvs04
	6WedlEMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Uke-0000000DvP1-0Xc6;
	Fri, 18 Sep 2026 09:19:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7UkR-0000000DvEH-0X77
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 09:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sK8LjopR7pp8ZkQXuKlcKGXgSdG/Xc70Mr3Wn6LmTuk=; b=RgESExZe+7+7DNrb1sNxdkjgkr
	kveZ1W+UPhYN62XFgN3+8o+QpifUbmT9loj1VnmFUIKBjLmSdIsBK04TnPtUbl8B2S02FBsSDBDUg
	bRn6Yuh7NIidO7a7g++JNy5Hq/JuJq8uFXSwI6NkF3QOvOsZYa0tcnax6r6AcqQQqvOV3ADraeQgb
	T2NF+mRsh6NW3utTENMF5V+l3vY35vUUSEU65sN/+ociqYf/PWPmB9VCVInsLO5DBBkWPcY9XIVOZ
	4MWMYhwmOw7X7/Rs0gLDxAFZ3ydyH1R17OK3u90XyaUFHMZk6ZlX63I99/YUVRpdfgst1V6EkXV39
	TfpSRWNQ==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7UkO-00000009qa7-0kOs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:19:10 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e2406so2612915e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 02:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789723147; x=1790327947; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sK8LjopR7pp8ZkQXuKlcKGXgSdG/Xc70Mr3Wn6LmTuk=;
        b=Q5e4uqbvEGD1X2GzA/XDmEX0BJsny7gdOHsM8kKzE/oY+q2F63O2daN4FBhwHxAvTP
         6uqMUdgAfciumx2QNaNppBtVN6nsHSHUWAims22QxQzHq+HLohiqUEVLYZnupzx/IUqU
         Np/VC4pM/DMcl+CkdgLLYAR+1uPct97o3Qlc6LLnYpbTAavGBWGJ84aiZfCqNSWlY/Iq
         lrwqVlPSYHe9Wc1gUY1Ruaxhs93G47po34WU80uLC/ozisNjwcNoSmHeZck3+7iIViPd
         MGD/TJV2gJ07bySGnctYbWewjyXvMJvTMBzxN0c+E+bFN3lFdutt7lMrtrUqChokSZKq
         oSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789723147; x=1790327947;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sK8LjopR7pp8ZkQXuKlcKGXgSdG/Xc70Mr3Wn6LmTuk=;
        b=Nv32pYlVKaoRtqrmNChGMYas1epR2TRAa4kuc5H5a4P2VRpdXdFosrF7nSfCMn01XR
         WKY8tWwN1WfrqNaU+mWO8Nmn5ANHcixHS5d8GjsjUcgzMkF3vBfDpQuRBXWh0PI6Sy1u
         hn2XhxOyRGC+Dbx4t3/b8JRTUmMbB4qpfLGrGvi+rV2m6A8s8kfvNHLr2Kg7haN/xzrH
         g8/SE+H4OgbhpY+e1ZEEKqAcUHZNPKvEL+K3/QijCuH9RPDGYOLJhxHI6ycMavUIIzie
         2cHkJKTsHd9fub3OtnMXqQqsTKSX1ivcHvC0CW1krdd62+SP9pjIsvWwKsLwJKSP8DiM
         Eesw==
X-Forwarded-Encrypted: i=1; AKwUvBwE7mjo6gflJT4rpB8oOLd4iZYYuzoeMpxUtpBh/mMAc2D0OoQdAGMRpaEw/0ZcOhQlhlk62deJEg5j8N+y+r2S@lists.infradead.org
X-Gm-Message-State: AFuF++kulVkcsByiQRkqcBTQyOmAVYVmyAvCSSSxP7lh78l2dUiogpPT
	rWh7m9e2ufKLPj4p7vdOEtcRyxbv24C5slIdgQSmLEmDy27e9WYF1yWHGvup1sLxsUM=
X-Gm-Gg: AYBFou1+DkjguHQQoDf6X27++swDrbjd5iNf5oeMNTSBWlZ1hSzvynwCgu0y6jgVr6W
	oeL0jHqOViD4laq3uBpH/kQ6RAXSVcfYRoh9QMT4ltJbGKVnykIrmgMOYlkzCvosTIabLO+vObV
	urfE931YxpfaK0IvbTYFNXwSkXGemy6Gz5aJGSM8rIDdXVpUeJgIdYW8MAgbhbHngNhFl4vpwEu
	aHJhCSMaFFRgBhgUX3zufnII0ng7yd7wyNOPnMsm8YCipgW9iPllJ5VjOqjvggk/9a/aYnDBXlR
	f4slRaeLf9J1LQ3KYcXVQ7vt8IAt1TjeLpFlfBcDUpKbLLUWanSIQ35D6Zc/LFXQEUvUR3j6aXS
	4OK2O9tzrI7AgKwft6SrCA9STTuvroPa/chab2eLFvGICP0tlxrVzVTHWwR+KkiuJLTg3jOfMm9
	BY98eFuresA+yhmbQtMkJHU16/62pq6BrJHD3VGXopRQCZMJiPLxwYRd8bf+XhrUBdAx4=
X-Received: by 2002:a05:600c:6305:b0:49e:715d:95ca with SMTP id 5b1f17b1804b1-49fc50012f7mr25323075e9.13.1789723146740;
        Fri, 18 Sep 2026 02:19:06 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:7a95:1dd3:2926:35eb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7d46399sm49887575e9.12.2026.09.18.02.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:19:06 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Fri, 18 Sep 2026 11:17:50 +0200
Subject: [PATCH v9 6/9] arm64: dts: ti: var-som-am62p: Fix wkup R5F memory
 region size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-topic-am62a-ioddr-dt-v6-19-v9-6-40972ef1f663@baylibre.com>
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
In-Reply-To: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, 
 Stefano Radaelli <stefano.r@variscite.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616; i=msp@baylibre.com;
 h=from:subject:message-id; bh=dumbrPOqQoW19bdj9Q+Yrp4aXi4kOxMnSTyfo6FbsQM=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhqy1jLcfHc68H/BS9uDUKBMetp0zrn/R/8SXy7XmaXuC5
 2WNhLlyHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCR7gZGhn2FJjelbr/xPGh+
 +ureeM5Ahw0/kw7a/Z/ytP3sT9WFOm4M/5Tm5lvG6z0//MlfVijUUbM6besjTZ0bYZ8n3vi0cNb
 SLUwA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_101908_401671_28BFCF20 
X-CRM114-Status: GOOD (  11.54  )
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

The wkup_r5fss0_core0_memory_region was reserved with
0x01e00000 but the MCU SDK linker for the wkup R5F firmware on
AM62P defines the DM code/data DDR footprint differently:

    /* DDR for DM R5F code/data [ size 27 MiB + 396 KB ] */
    DDR                         : ORIGIN = 0x9CAA5000 LENGTH = 0x1B63000

which results in an end at 0x9e608000. For this memory region which
starts at 0x9c900000 this means a length of:

    0x9e608000 - 0x9c900000 = 0x1d08000

Link: https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/examples/drivers/ipc/ipc_rpmsg_echo_linux/am62px-sk/wkup-r5fss0-0_freertos/ti-arm-clang/linker.cmd
Fixes: 571562e76458 ("arm64: dts: ti: Add support for Variscite VAR-SOM-AM62P")
Reviewed-by: Stefano Radaelli <stefano.r@variscite.com>
Reviewed-by: Bryan Brattlof <bb@ti.com>
Reviewed-by: Kendall Willis <k-willis@ti.com>
Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index 8a8dec80cb30..3d1a2c5bc464 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -71,7 +71,7 @@ wkup_r5fss0_core0_dma_memory_region: r5f-dma-memory@9c800000 {
 
 		wkup_r5fss0_core0_memory_region: r5f-memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0x01e00000>;
+			reg = <0x00 0x9c900000 0x00 0x01d08000>;
 			no-map;
 		};
 

-- 
2.55.0


