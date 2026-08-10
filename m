Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86820C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 17:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENzVokBmSnuN9bqw0Tbgo5j7dr6hE7iZRXU8UDONpzw=; b=Zv6GhblcA9iPRfnILmUevhY+yR
	8exzHoXWXEv34vHSvdr8A15wcLMGM+ORbt9366xOuk+/fJnv+2MBktK2Lls/mUKWowZHZ/FtN/NuF
	KlLo5gPY+sf+TNpPjEke3vP0CRxcfgVOnro+IhG2OF/ylSaclVRjdZ/aIQICiQNVA0VfnEVBbG8Ox
	Lef2xBwgYNJqgy2hQT7JF2ZrSYN2ng+MQUS9e3qG/ClMR6zxLlCiqISUdsbSdxTgtki3D4Wc7O6MW
	JMnraJZ6++g1smucCENp1prCtIEEJNV27xe9D4I+LCwPSyP2W/c0Pml2o4PRUefEo9k/KlNH7ObfD
	40uNgvRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTiR-0000000CVWe-0uCo;
	Mon, 10 Aug 2026 17:23:11 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtTiO-0000000CVVp-2QdI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 17:23:09 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-481412f1828so421276f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 10:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786382586; x=1786987386; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ENzVokBmSnuN9bqw0Tbgo5j7dr6hE7iZRXU8UDONpzw=;
        b=QsjNBb/JkITbsly9Z7BFkpNrXIF/YXyUOYcEVsmW0k/YcaGIlgKn958tdMtY8mYcff
         1PFYGgFfbZQLrXBu4GziH1NFK2pO1b02sZV0DUA5NN9api5cZb1EKjrRyeaEiNhvIqqL
         PT25Ie6k7+pX5VItR2CBj2KzFPMB/y4W60Jyi3ncQWuaxwiNHvxaM4REEq9x860d6Pew
         /6Z3iADbkS7E73/YoT8H/CdVxtyoYTjDG67WZ2FLwvlfRCP2vzPpNUuV1TEP8Ltm570w
         RY6XglSyfo/KHvvarspZknVEZ79NdqgO9iB4Wa6qtQZarhmKL6008hGsJxzLgjwCwymc
         7ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786382586; x=1786987386;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENzVokBmSnuN9bqw0Tbgo5j7dr6hE7iZRXU8UDONpzw=;
        b=b5p7xgj7G22ApUHGMHjLFHuohAHbGJShBBQtY8FqSqwsgkD7a42vyT6tZG9tb206Ta
         aPYH1BADnGf5HT+Yy0exJLN3fDM0YvcNjR0xiIzuWhJwrOeO388FSQZG9ZE96ZrizVIq
         Yngqb6URNl1PVI9UyT1UJ4cn/u3YBygBSd9bFiRQ9Z2WJQRnLoujQlYSi2B9cGCZHQHM
         oWdBRDCZ7+jXdE0sYJG5ZTB3Q4444R2Y6J3JNrZEFeU+/UTVdgPASY0frNIQsvTf0B+j
         jEcvoY9H4OoM7h/+TmMOxxoTwYhI3eHTRdYQq4A25zyKUpOaab71bCv3S7Jyn4IOYNiH
         0yIQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpoj3rndvg9WlgkWzxgLit4JRnvdXFhE/8GFCzsKGhMAByn1QPQe25lD43CBcvrvSh0MqyY7uLM7j6M5k3ZRgmk@lists.infradead.org
X-Gm-Message-State: AOJu0YzA4vb1vqxsYANQ1wRv1684mEgA/ZMCQ5+seZxBUPDAfxqO8X7F
	je1IY4osq7HHqidYaXc468oS6yyk6MRruI3HEU4GBDLDe6CtGlLNvWzN
X-Gm-Gg: AR+sD12yDckVRUE2ZTuFOHTOvEDJ9ByRvmVfpklS2nAQtw6F3ehx9YIE6dwkWyzuRSn
	uVTqO3PBsTp6NBOHIWOlo6/LWB9O/4eKyu5dvFZwh8nufRaEo35MV7Fu2KaQJXWmphUoWW3fXcB
	24v7ucPUt6JbTnMCuUPYboBGlx1wKat9dEn7VPkCfomySZjgKAoyADpa3/jYFLtJpBrFqmL4fAZ
	BH6iy+zVq9yD4jiPw23tCdF6B/HJ0J11Pyt/YNhbyqqdV9+HC0/4yBdQaRX6r1Xdr13pFAW3O/8
	EvC3FvKzzZRHQVP7XDOFDg5k0xJmMAlXumRh9O1A96LkwDiJegabfmSyDQ3heO3yiF0Own38xWq
	BJB6j9WihVzgAQsNK4RTFwt2zfhAmuoSU0hcErMGy1wBBvdekcLynqEr5xj1sQQs2NEPun1K8hB
	zxtUIX40zprrVAY4+CI8sR/CW33IPykkplUgdZGC1YHIe/cItmh+GxklSkKB/KHq850buFPFuWo
	iGDBq2rhekjtdl8Kk/7NnGRA9oxShWlnQ==
X-Received: by 2002:a5d:5985:0:b0:47f:b452:49f1 with SMTP id ffacd0b85a97d-48130e7e7dbmr32190829f8f.2.1786382586047;
        Mon, 10 Aug 2026 10:23:06 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:3344:2841:7708:a101:2b8a:f76:a00f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021fb89bsm34651555f8f.30.2026.08.10.10.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 10:23:05 -0700 (PDT)
From: =?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
To: wens@kernel.org
Cc: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Juan=20Manuel=20L=C3=B3pez=20Carrillo?= <juanmanuellopezcarrillo@gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: A523: fix voltage withstand encoding
Date: Mon, 10 Aug 2026 19:22:54 +0200
Message-ID: <20260810172254.468732-1-juanmanuellopezcarrillo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAGb2v64bTO-uG=QrtVDfHF=qnGtF5LMitagD1zfNEYSAqOzvXQ@mail.gmail.com>
References: <20260721223956.13665-1-andre.przywara@arm.com> <c539e5c4-f21e-49a1-b0e3-d35f42893fc4@arm.com> <CAGb2v67CGcaQmSz_tTbSTQ7dzfCV2+7i5t_34iHKmyU05h-yRQ@mail.gmail.com> <20260803153519.262827-1-juanmanuellopezcarrillo@gmail.com> <CAGb2v64Ty3HkBbb5A=ZL6QUAVD6bugG0hcYykCmh-KUsVwzwRw@mail.gmail.com> <CAGb2v64bTO-uG=QrtVDfHF=qnGtF5LMitagD1zfNEYSAqOzvXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_102308_643551_CD67CF29 
X-CRM114-Status: GOOD (  19.98  )
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

Hi Chen-Yu,

Sorry for the slow reply, and thanks for taking the time to measure this.

> On my Orange Pi 4A, running iperf3 [...] 4A as client: ~180 Mbps
> 4A as client but with reverse transfer (-R): ~520 Mbps
> Something is definitely off. I don't know what though.

I cannot reproduce that here. Since you asked with iperf3, here are iperf3
numbers from my Orange Pi 4A, and one measurement that I think is more
useful than the throughput itself.

Bench: direct Cat 5e cable between the board and my PC, no switch in
between, link negotiated at 1000/full. iperf3 3.18 and Debian 13 on both,
board at 10.42.0.52, PC at 10.42.0.1. Kernel is my own 6.18.40 tree.

  board -> PC   (iperf3 -c 10.42.0.1 -t 10)        943 / 941 Mbits/s
  PC -> board   (iperf3 -c 10.42.0.1 -t 10 -R)     930 / 928 Mbits/s

Retr 0 in both directions, and rx_errors, rx_dropped, tx_errors,
tx_dropped and rx_crc_errors all still 0 afterwards.

The number I would look at is the cost: sustaining 943 Mbits/s takes
about 3% of the eight cores here, which is roughly a quarter of one A55,
with ~8500 eth0 interrupts per second. The little cluster was pinned at
1416 MHz for that run.

So on this board the link is not expensive to saturate, and that is the
part worth comparing with yours. If one core on your 4A is at 100% si/sy
during the run, we are looking at a CPU-side limit; if no core is busy,
the CPU is not the story at all and it is somewhere in the MAC, the PHY
link or the path. That single observation would split the problem in two,
and it costs you one `top` next to the iperf3 run.

There is one difference between our setups that I can name precisely. On
plain v7.2-rc7 there is nothing for cpufreq to attach to on this SoC:

  - drivers/clk/sunxi-ng only builds the main, MCU and R CCUs for the
    A523, so there is no CPU clock controller;
  - the cpu@N nodes in sun55i-a523.dtsi are bare "arm,cortex-a55" plus
    psci, with no operating-points-v2, no clocks and no cpu-map;
  - sun50i-cpufreq-nvmem matches h6, a100, h616, h618 and h700, not the
    A523.

My tree carries all three out of tree, so the cores scale here and on
plain mainline they stay wherever the bootloader left them: mainline
U-Boot 2026.07 hands mine off at 768 MHz.

I want to argue against my own suggestion, though, because the numbers
above do not fully support it. If saturating the link costs a quarter of
one A55 at 1416 MHz, the same work at 768 MHz should cost roughly 44% of
one core, which still leaves headroom. Falling to 180 Mbits/s would need
about five times the per-byte cost, and the clock ratio only accounts for
1.8x of that. So the missing cpufreq support may well be a contributing
factor, but on its own it does not explain your number.

What I can do, if it is useful to you: rerun exactly the above on the
same board and cable on top of v7.2-rc7, twice. Once with just your
withstand fix, which is the smallest thing that gives me a working link
there, and once with that plus only the CPU clock controller and the OPP
tables. Same base, same config, one variable. I would report throughput
per direction, scaling_cur_freq during the run and per-core softirq,
which should at least tell us how much of the gap the clock can account
for.

To match your setup as closely as I can: which kernel and defconfig are
you running on the 4A, what MTU, which governor, and is the 5 Plus the
iperf3 server in both directions?

Cheers,
Juan

