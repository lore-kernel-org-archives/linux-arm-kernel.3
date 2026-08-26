Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C29FC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 23:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBDSwIVuGClC2U8jcOy/ySqyjLGwgvu0rHcFGCcBek4=; b=LP7UQQEaqoGH+Gao/uIq67kUID
	Y124zlQostOvdgLhcstzTct4dZybIt9PvZWJ7YPe1+50M6MvxiLxL+i6NQ1rQpuVt5pbYFJ9KKXMG
	VmTmrrP386UMwlj97yeL64Y1SGgAQiu1dxkJqfRs+HTn/WNEWHYUiYzZJWM13VcFmolDRFpEV+2uq
	FyLhrL3URc/rMpb8Bk+ZNovSkdrwbFSVWXjCHoASN85Vg04gN5cJSL5Mete1ABlKScqpyBNm49A4l
	PrPjqiDaCoun7OeHU9APw1EbganmcC/o1Lh5CTHBbfCFEkWC94I3i0f6U7+tJqAyBSoMx+4hmGT56
	4sSys/Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMkn-00000003ALU-2ja4;
	Wed, 26 Aug 2026 23:09:57 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzMkl-00000003AL3-3R6U
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 23:09:56 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-5c664b8c3f3so876972e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 16:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787785794; x=1788390594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBDSwIVuGClC2U8jcOy/ySqyjLGwgvu0rHcFGCcBek4=;
        b=FeyOzDOpbXeiUUewKQrIA9WiI5BuJFQpXs4idMFPCrzdwkqbybMcXll+PczGj2GlIA
         yJu/IEAdZYGeE+HWaMkAbuMJX0so62HJl9i9gwvkslwyNkzpPH+aLA8VQhIW7YYdRzs3
         HFHgjbndEC/N1VLCHVoGHZmyUUb3QQdpye0Moi8BKAZebm+nepH1hhxVt5BV3LXdRpoq
         o4Ra1bWho83SNklxyV12OPZNNt30VbfBGT52Ppn55UM5wR+NbUK8QRcFmM3RXNuqoVXD
         SreluUBgYcXX7USyKKyNo6Nmck4WqaKuQ951iQd6fDC7FaR2ZNVu3x3DTr22kga1uwXb
         +gtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785794; x=1788390594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBDSwIVuGClC2U8jcOy/ySqyjLGwgvu0rHcFGCcBek4=;
        b=deghShySladboxt1251uKQIaRz9NTEUfzmRB/2r2r11gDWgAOJtix9xanCBDJ2tQAN
         WY0HXQFQkvH2WZcKooGl4S772azXYI0yRbmpkVuTM5hN4gJOlSjwkThyODTmkG3Z8hpf
         sTIlMhLt/k2EV6DE79Zd/a6m5+NBDt22GhQckS0F/oN5/isfmTzfSVYhz96Ovcu2ik9Y
         RgfVbsVVwoZVQsId6y6UFodolOfBTzsDIci95MqlVeYsl8pelzAPRy1a847i2UY291kK
         8J/BR+y/vAVV6S+YCgZb3Q2LVPP+pnmdWSgjERa+Sdjm6WDMfWj1BSJjvLcDm4dGbW08
         6Ejw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7Uh7YWa2c3gRfEK4uBJOmdscScrO44142rXBCQqt8RK75rTHjiZXO6mnLxtqtwqAmmJqcBjrdOIKYbQVcWKHK@lists.infradead.org
X-Gm-Message-State: AFuF++lTjJpvgOzKY25UBHPrOkKaFG/KWViRzke+6mWeS2DuDzz0WhPM
	D9zhj/zrWhQOsMyhSnF2kaia/YrBXzHWqvDu2s9FcWNke8cV1B/jSa+n
X-Gm-Gg: AR+sD11b3fjISsiYdKBdRLI7IE8P8o/+elVzdVWSlt+C3gbZkcGvymJl1i5HU8yXuR4
	lOO8Z17yZh0dwvvbkN1A+OMch9JteWkpUOHrALrI1ctse9HT8uZDDiaeuAJpDXX4K/xCNsamTwY
	foLU4V+rKA0ZjzC0PGR6g2CJ9313HC+WelWr0VvEaJan/Fm4qYogdqA2ZZjmILSSZw5joZ0bQyO
	u1rgIkSM5nwQF8yC60YTNlJFrDRJUFXk3VgJeiKHLEzzjcUfyprNCajFaMPKeRREWxyjyZZ1jJD
	nZFk5YvNNRms/oeS2rDXawkBTSAYRoD0HVnGWCFqixkCG8MGs7uPrp+O2Esp/hH0t9H0JKtf+qV
	JztTSt+6HzBCuPH1IEH8UGSQgOWtLgL6z8tPb2gxfvZxTx63qQuC9PUyvC7kHX/Nw62eFzhNOyQ
	Ki5hXKYLfdbQVLbD32uzHUUEJZFAj/Pga0UliOjIddDaRAYLo1Yk1SJyZHQBSMwC0egdLgolcHI
	ukuAN2Xz9N3gbdGqXzgeTEnq4HZPBky99oX4T/D+C+Nd4Ai3y/lFvqy9UovmyXmG6ONvMo=
X-Received: by 2002:a05:6122:1826:b0:5bf:d3cd:3d64 with SMTP id 71dfb90a1353d-5c65b56d0c8mr4542431e0c.0.1787785794612;
        Wed, 26 Aug 2026 16:09:54 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.239.222])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c65fe7d777sm2727980e0c.6.2026.08.26.16.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 16:09:54 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/4] arm64: dts: allwinner: add A733/Cubie A7S DTS support
Date: Wed, 26 Aug 2026 20:09:40 -0300
Message-ID: <20260826230942.466219-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_160955_877946_FF94286E 
X-CRM114-Status: GOOD (  10.94  )
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

Hi Enzo,

Two findings from building this series locally on top of the A733 CCU v2,
plus one note for the DTSI move you already agreed to with Jernej. Both
findings reproduce on your own Cubie A7S DTB. Junhui and Jerome on Cc.

1. Schema evidence for the clock list Jerome already questioned.

Jerome raised the xtal rate and the naming of the node feeding the CCU. A
full CHECK_DTBS=y run - the whole schema set, not a selected binding -
rejects that node outright:

  sun60i-a733-cubie-a7s.dtb: clock-controller@2002000
  (allwinner,sun60i-a733-ccu):
    clock-names: ['hosc', 'losc', 'iosc'] is too short
    clocks: [[3], [4], [5]] is too short
      from schema: allwinner,sun60i-a733-ccu.yaml

The posted binding wants more clock entries than the DTSI supplies. This
may be the same problem Jerome described rather than a second one, and
whatever resolves his point probably resolves this too. I am sending the
diagnostic because it gives you a check that either passes or does not.

2. /soc raises a W=1 warning.

  sun60i-a733.dtsi:116.6-197.4: Warning (unit_address_vs_reg): /soc: node
  has a reg or ranges property, but no unit name

It is the only diagnostic this series adds over an unmodified tree in my
W=1 comparison - 499 unique diagnostics before, 500 after.

3. When the UART0 pins move into the DTSI, they will need
allwinner,pinmux.

allwinner,sun55i-a523-pinctrl.yaml has listed allwinner,pinmux under
required since d626d248caae, and the A733 compatible joins that schema in
the pinctrl RFC. uart0_pb9_pb10_pins currently sets only pins and
function. Nothing catches it today, because the A733 compatible has no
schema yet - but it will fail validation once the pinctrl series lands,
which is likely around when you send v2.

Static evidence only - no A733 hardware here.

Vinicius

