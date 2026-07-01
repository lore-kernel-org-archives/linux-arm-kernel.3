Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15256C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QI6/1jl+FwxwLNBhZZLYlzz42SxxurAYoSgW8BhCBSU=; b=BeXHWvtOwjxWlDrdY0oAQ9rXg+
	5H8PqfMNIe6Z2hu1GYZFfZXDYYaH5yQZYRaswV9FAWUFKjkDIlTIca2sc7aB+jL5ujBvORillLgRz
	wmgnGkTArBJMqXXmNFeWCQkw3XUT67TApkH2a7zXyP6CqgV/wrrnaF7f9lvGhzat3ljb9QwA5JIoq
	Zppec5sM+exFHPLfMi47Fd3dkXK3ry9rrFhWmG7xoC37HTW+EDEIKsbklZ6rkAMwH21eN2tlcjsUt
	qKYckB5W1J72dYdmQHzxZeR4JJ5hjctaQ5FfxnF29JBE3riMcXBQBte0JB2HH+Z55MxWY72n3KNnv
	UQAJqAlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexUm-00000002Ujs-14UL;
	Wed, 01 Jul 2026 16:09:04 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexUj-00000002Ui3-3VZp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:09:03 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-8111c0c7561so9105037b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 09:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782922141; x=1783526941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QI6/1jl+FwxwLNBhZZLYlzz42SxxurAYoSgW8BhCBSU=;
        b=dyTWpuvjqi+Tbs36lUvgqnHmkyiYkmbiVa5S8Xo2c9qigvaeMbQIfHCjhhp2hB2ylA
         bsrsVD4IXUYneGENWus1frGZQofXc4BFs58KtrEjsUAslFMFZmXWFb+ZwDPwrFNgOHsw
         4j7IczQtnrm/EmSUiSyQPD5Tkl7K9uTuWkUDxvBm/X9z09Ii2S2XIGbthKi7Ga82WIiJ
         uZCoq/tk/8u6xIq7xYftES1lstLGrnG+0o0M6abQS8Ma7zTw7BjjaxzT1cae8ZI8J/4k
         TqbK5UCDrZ73B2Vd4S+86bjf0mwl7KzITSLO2A7OOxzjT6bzsT+qX/FV9vt8ZxNSPAXH
         XhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922141; x=1783526941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QI6/1jl+FwxwLNBhZZLYlzz42SxxurAYoSgW8BhCBSU=;
        b=dqSAezoW3zGYj56/Ns8KjnZDPourbEYo5lB3sWzIOBz6Lyp7aVYEVake2COGEmw70z
         8RUc6m4395dXMmN7aoRBduoAl+M1CeJ2YSTudxizohXPVeugqBLJQxll4WNuOOkobsuD
         5e9uW66GgPxHrLpkhHNiCWSkLBcq8RXAnrhhSj+wGpW3s5xYzLVrBmtf/7k9dhUoo757
         sd38lvZnNt6KXFH44mmf53TDA+Abxf2TWOygz//6cm9n3rs9OpfJCurb+xRW3TpR+M65
         sHeEWkIgxZ0XsxQzwyDS5MP6mWh999WzTZqD9p03T12yyePrlquP8Kro6WAzBsEVqxcD
         gcnA==
X-Forwarded-Encrypted: i=1; AHgh+RoPVMXGkx6JbyN3GaXcAljbTVHys/d36s6Avpb3V+OAjeypuXg39lxtoxy2ayQzZm8gZ8O54DpMce0KRGsAt0bz@lists.infradead.org
X-Gm-Message-State: AOJu0YxlLQd+oejK6+/+Q6SfX5baMcGtn612piZVftZPa1Xt/t7/7/0G
	Gz7yuMlPDeBCYfuah7a85AzHKM6DKwmuwHeGxUGjBVg1gAYN1Yjg+YYC
X-Gm-Gg: AfdE7cldli6SH0VZwNBfkv1go9nLEV58ty92E3v9hZ/nVwuPp9sn3oALEbJ2ixaiXXU
	oq0sMIgpucxa+eGDIBgLI3B3J5a3yfR5+M/4eFTOOiYJPiG6PlrM8VacLPa2/prQMfFgSucuLAq
	4/vv4/2CrtfRvxdl/ODtfz+3HzTrIJ1RxHM+ats13PwDTSisI1J5xy+vwGsB0bMkq4i0qn9/s4K
	X/anfPC3vw3mVBvZsAaYW0zn1iTnavOsUk/kOL5R6IyIgngotH2lT9EEDWTlOr0EQtIVZ8RLqtX
	uehxKZUScFrOSEVr3spU0gbHoCkU6IjV+G5ndboSK6RsMinVCpfzMSD6O8v5tNvksOZXcEAPw/Y
	beBO1vf4pFAP3YSkipwbgrGuMS7uiONeJbeYIHB4nPsiJtS7AC9nc1UMQQDL8P86G1NrKFoPm84
	+TtQzgLyAfwhGiSuijZUMHrYZBLFxxch/OU+oZh8fhkdtjRwy6bD8FTEGjR+rz
X-Received: by 2002:a05:690c:c506:b0:809:fd83:a88b with SMTP id 00721157ae682-812e8dfc9dcmr24185557b3.3.1782922140430;
        Wed, 01 Jul 2026 09:09:00 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144af50fa5sm1682067b3.27.2026.07.01.09.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:09:00 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH RFC 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU and PRCM
Date: Wed,  1 Jul 2026 12:07:44 -0400
Message-ID: <20260701160055.320000-a733-ccu-status-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_090901_883219_92617D9A 
X-CRM114-Status: GOOD (  13.56  )
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

Hi Junhui,

Thanks for the A733 CCU/PRCM RFC v1. I've been reading through the
series and the review feedback, including the NSI clock/reset handling,
the binding naming and ordering comments, the SDM macro cleanup, and the
question around modeled but otherwise-unused clocks such as the GIC clock.

I do not see a v2 on the list yet, so I wanted to check in: are you still
planning to take this series forward? No rush at all, and I am happy to
leave it entirely with you if so.

If you have moved on to other things, I would be glad to help carry the
series forward and address the review comments, keeping your authorship
and prior work intact. I have A733 hardware here and can help test the
changes.

Either way, please let me know what works best for you.

Thanks,
Enzo

