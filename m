Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B26CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 11:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rP1JaiC+dKbCUaMXThGQDLqJez01N94aR5wIs4E+XU4=; b=asBKc7LgHHjhSeUfJP6YxivoCN
	uJGJhMgvS2pBwM3X8/4rscPeEF+EF/5tz+g8lr2CmFpMYWF0Xyio4FX5/88fBf68kkC/zRMpyAbGd
	ABB0UnkZvWiftXxtp6812lJ7D0+HVpbEaX08avcFJFQ0zRAAMig9r7O59nh5kLX/dQ4+gFxuC3ZRY
	FkwZBaYjJM8ajNVOF+gIxjVUqO3jprG1R/Tarx7JczXGNxUVuR2Dwx2w02+Bek4+hIuMBZGVeST6s
	+JrRh52hcbsgnwE56zTSbFA21Pf5PYGlcm15dPOZa9YxgwdRt6pu+RSxbG9cYWcgO+Wr+YYnKYiiJ
	o4yviHCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6oz9-000000060Cb-0QfL;
	Thu, 09 Oct 2025 11:39:03 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6oz6-000000060Bt-1IUc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 11:39:01 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4256866958bso511356f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 04:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760009938; x=1760614738; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rP1JaiC+dKbCUaMXThGQDLqJez01N94aR5wIs4E+XU4=;
        b=cUYmpgmUt856k2o3bY07zgWN0cgjFowglEy9ZGMr+gyVH00EiJSPzL2uxayxtOtgHD
         9ySvetLq4YBkOUWk2sFzm3Thh+D3Yvd/GmiNCLIpYkZZ5Tt5JdzdUdu3erjbm73Wy4DW
         QPhpaV39zBmpQWflXbSiEaeV5+2xdJ9GEZqDKH8AdJj4MOnaAPttDJOwuIG22y0pRC36
         UH0uNOtOYhbUB5beKT03/I/1tetHCwd/uk/ab5nUjQ1Yl/25f5B8EYHre3lThRUrqfy8
         U5qB74FGPwEv5w1vkAJMKh3NDuJHSxK9Tx+8Y6PHNwddOWLiQOLjHVF37DpMn5tTUZcR
         Ck5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760009938; x=1760614738;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rP1JaiC+dKbCUaMXThGQDLqJez01N94aR5wIs4E+XU4=;
        b=QiUQlDrzp/IH3qWyTzQ1NOjEGmPb+uQjjx+hb3+23AH2EUsr4962ifwAAFUctFlq23
         YQDdlybWhD9b+2C6KmkncVxJyZkhzq5miYe3m2k/R//U40reS9iCRc5rJQx9nVvxSHsr
         YWGAOULlapf6H0QNWUvgOzBubnDuUp8OVTalldbMBosxTyTsUNIdnHMcLzD6l5RV1iNN
         RB4+9Y7b3nvbw+95IgOBgI3IjYoPwl1w9NNVeaX30PQ1mSW2BP7mSIFsPkf8xglIpfgq
         VhtacBOb/tvgumGaS3IOMj0t8R0mjOS6qGEYE13qIwn2ISQ4uGp6LJUy+M0DqTJVdnJh
         wuCA==
X-Forwarded-Encrypted: i=1; AJvYcCUXwyvVVuhl4M2DrZ/1ti0IAgJ+FYtUCkPrA4p/aBCePeTLdlqdeWmm3sH5vsiUc6KbSA30LC/o3TOQmM72Ih5K@lists.infradead.org
X-Gm-Message-State: AOJu0YzCR3ikoVjuAz7nwL7s5rx2J9FXMvN2PIRtXeNgFatplOCip4a2
	cg1NznMDqJhWnjyDTP4U+G/bwtbGChHq5hqSLO87ajrHbuPavX/z/TNiqAGLQA==
X-Gm-Gg: ASbGncs7NIaPJNPdD7CnU5hmKjb1fUXnSc5GyfSve0c68plvh94mpDJiUrX7RtnVjXJ
	qCx2oZDDD+X5RgAry+z1FPnYIrqkCCbjLLooKPJ89re+T2rHB+ndpF83S4V0OAh+IGvayk/LxJM
	xfKrNj5U4Z5QZvAtxhKSoZhxr+e+nLgHOIEHDO/n3gx0yh8pPPeqEFQl/km93RrwiKNn9LdmS6J
	AkcFSVecdcjC8eLEQgiSMyrEcTtFTE1Ht9jU+21PFa5Eh8KPZXStTwejyHVbEDF4X+3oPvOyRyh
	MbIkYu/xeUZTxsYNJ3AMAp3y+XwRbu+quJJBYjBOTR+SNBvmGilyqr9B0YVjSEMdGrdFsHot1UT
	tQETRGNMtmKpv1MHuxWho/CuYrloCfdldQ8+0o/ZnzrjxZh597IsixgTnsM2ZEhC6C3a581so7C
	oRv7YmEetZCI2SExrKJbnZTmCgqzFtuENbmw==
X-Google-Smtp-Source: AGHT+IHAcQEEBgMcQz7wMA2qmx6+wpQkTPjE+CkCEvZDPinipAZ9tUIugghSyFPe5tRLrgYjHfifyw==
X-Received: by 2002:a5d:5d08:0:b0:425:7ce6:fd50 with SMTP id ffacd0b85a97d-4266e8db473mr4788177f8f.53.1760009937964;
        Thu, 09 Oct 2025 04:38:57 -0700 (PDT)
Received: from orome (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e970esm34383994f8f.35.2025.10.09.04.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 04:38:56 -0700 (PDT)
Date: Thu, 9 Oct 2025 13:38:55 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: IRQ thread timeouts and affinity
Message-ID: <j7ikmaazu6hjzsagqqk4o4nnxl5wupsmpcaruoyytsn2ogolyx@mtmhqrkm4gbv>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h7tzznfw5eznq6ir"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_043900_398339_C360269A 
X-CRM114-Status: GOOD (  25.06  )
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


--h7tzznfw5eznq6ir
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: IRQ thread timeouts and affinity
MIME-Version: 1.0

Hi Thomas, Marc, all,

Apologies up front for the length of this. There are a lot of details
that I want to share in order to, hopefully, make this as clear as
possible.

We've been running into an issue on some systems (NVIDIA Grace chips)
where either during boot or at runtime, CPU 0 can be under very high
load and cause some IRQ thread functions to be delayed to a point where
we encounter the timeout in the work submission parts of the driver.

Specifically this happens for the Tegra QSPI controller driver found
in drivers/spi/spi-tegra210-quad.c. This driver uses an IRQ thread to
wait for and process "transfer ready" interrupts (which need to run
DMA transfers or copy from the hardware FIFOs using PIO to get the
SPI transfer data). Under heavy load, we've seen the IRQ thread run
with up to multiple seconds of delay.

One solution that we've tried is to move parts of the IRQ handler into
the hard IRQ portion, and we observed that that interrupt is always seen
within the expected period of time. However, the IRQ thread still runs
very late in those cases.

To mitigate this, we're currently trying to gracefully recover on time-
out by checking the hardware state and processing as if no timeout
happened. This needs special care because eventually the IRQ thread will
run and try to process a SPI transfer that's already been processed. It
also isn't optimal because of, well, the timeout.

These devices have a *lot* of CPUs and usually only CPU 0 tends to be
clogged (during boot) and fio-based stress tests at runtime can also
trigger this case if they happen to run on CPU 0.

One workaround that has proven to work is to change the affinity of the
QSPI interrupt to whatever the current CPU is at probe time. That only
only works as long as that CPU doesn't happen to be CPU 0, obviously.
It also doesn't work if we end up stress-testing the selected CPU at
runtime, so it's ultimately just a way of reducing the likelihood, but
not avoiding the problems entirely.

Which brings me to the actual question: what is the right way to solve
this? I had, maybe naively, assumed that the default CPU affinity, which
includes all available CPUs, would be sufficient to have interrupts
balanced across all of those CPUs, but that doesn't appear to be the
case. At least not with the GIC (v3) driver which selects one CPU (CPU 0
in this particular case) from the affinity mask to set the "effective
affinity", which then dictates where IRQs are handled and where the
corresponding IRQ thread function is run.

One potential solution I see is to avoid threaded IRQs for this because
they will cause all of the interrupts to be processed on CPU 0 by
default. A viable alternative would be to use work queues, which, to my
understanding, can (will?) be scheduled more flexibly.

Alternatively, would it be possible (and make sense) to make the IRQ
core code schedule threads across more CPUs? Is there a particular
reason that the IRQ thread runs on the same CPU that services the IRQ?

Maybe another way would be to "reserve" CPU 0 for the type of core OS
driver like QSPI (the TPM is connected to this controller) and make sure
all CPU intensive tasks do not run on that CPU?

I know that things like irqbalance and taskset exist to solve some of
these problems, but they do not work when we hit these cases at boot
time.

Any other solutions that I haven't thought of?

Thanks,
Thierry

--h7tzznfw5eznq6ir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjnnssACgkQ3SOs138+
s6H/fw//XHBacGZ1WIaZWFeKGgC7KIa0ThRdPdvwPt/7Pnvs0RGF5E7+IX61zdQe
luQOS5rfrygOf05XxWortvQJnhMppVJN6N//i33eXrk+wU3uhymEFZBLguQPyIB8
LeCO2Y5G8/ppNbd+F/LOXF8JiRF1/tMGyCxtfTnqtxPjbPO2XNTKActv6XsYWed+
tYUuknya5lX8j5Lp+y1tc1NkCJvwgCfnhfxmpS1njZX5OMzidveWIP3HVDy9iCTR
ogq6Rk/rzyxlYxa/Ii1AtZUS80D6idaMyvr8gbB6jwYI9LwVQqEHg9WQPUQ4l1vf
/DBdZ5i7yvHwKAn3JYMnKSHJurp0avbqky/8Ou9m3rNSaZACkhrUhjqYqdIG1rIx
+U1NcIzpRyg38JahYdiI3ZzW83FD978KHQQ7Ctt1DSdpujEoNdslv5cXmWfTXYTt
C7o17uBicCt9imXAUaGPlK0509JmiwC45FrI88hAYsGK3yb/Gj9MGa44pwD6fUbC
tG0VLoHmxWHjAKZLgcxLLiu8v8Rqmu0/DB0qJ1B/B8kBR54tfTTeLIdSMYeAspwB
Yix5k3QDJAW6UmdvAwVAumGUGH4bfSxlDkViv5V5zBnLIFKJuSkTNaHfvdY+0+GA
p3jCFr54MCEhAS4rUCrf9ZZt/N5gXiGs7PxPZ4AIlNvrJAsaKW8=
=867x
-----END PGP SIGNATURE-----

--h7tzznfw5eznq6ir--

