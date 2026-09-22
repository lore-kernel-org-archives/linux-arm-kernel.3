Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4A3C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 16:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcOkEm8qqnkDKNinM/lYYnC2iu4jAqLUF2hwPidYcKg=; b=e5ogFlN38Tg/u7XSBe2YW/OCwr
	pJCxy982DSPREhZSb2RCCRgoUMF6nBrIo/WPWN70Dbi5ihdS2ir3GFvYbA73tDYyiYcLsFu68yF7d
	n3+JGpQrsp3qFFxz8vXQqpcVKffYtAyLbgUlxZSWCfo4amjf2bnReZ6akQLQ+gdR8q9TCjGAhGcuC
	D3CU9C45Ysh22TVONL7HuetmHkHaaw+kNDAcGuBqe8uOmlquLcaNcml8cUDC7x4NDgLIoR1k3Vi9Y
	ZvAfCCl1sM5dah9PsQnVUDMCG5lbJIJoK1cs6mpuj5fpoFxGz1Hwr7EvRK0iXnjN8O9cP/FHW/10a
	WVDNRc1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92rM-00000005xt8-0rRQ;
	Tue, 22 Sep 2026 15:56:44 +0000
Received: from sender6-op-o12.zoho.com ([165.173.180.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92rJ-00000005xsO-213A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:56:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790092590; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SBNSYRLDyn0P37lpEGHmWsi9paZfOeq3PlN3XSnJDHvL/N+A02GAo8dOcPTx2meHwg6lDLrJX+x00lZuA+PHD1jfHrZopnXvcx+pMwxHAGwIx6wRKckBfmW9H4JT1rAmS8cbp8dvo55wyqSU1c/kBCy0nOnFpzq85fTnf8RETAU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790092590; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HcOkEm8qqnkDKNinM/lYYnC2iu4jAqLUF2hwPidYcKg=; 
	b=BRCINSej5gYImZZZBFideTeHtJ490z6zhhv5G0GM1E4V23dHBPGHI5b7fYI1MZuAZysHqg5amQsWCmzpxy8wxtZaRUBcpsbqhROmon2LgqfTWkxjz8VS6iZqJRJjdVhxP/SiLfM53CpxUnuk8oAK9NU0Kn9yu3PhO6aXmJDla3k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790092590;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:In-Reply-To:Reply-To;
	bh=HcOkEm8qqnkDKNinM/lYYnC2iu4jAqLUF2hwPidYcKg=;
	b=ILEHrA5r8EbBQVLFetBKDax6gRjI9cFrWXgJ9vLYIKqFjUnxHsXRwmwtaL6JiM1+
	vLKrFHIS4fXI5RYXHOQwoh++I5lCMriG+FfjNOnjLHlKHImtZEUfKgqDnWgHiUwnmC1
	FysxFmuN9FFjgi1o9167W+6f/IBQFQKCm3QeGIaw=
Received: by smtp.zohomail.com with SMTPS id 1790092587188860.0530086011092;
	Tue, 22 Sep 2026 08:56:27 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 23:56:20 +0800
Message-Id: <DLLYUYMR3CZT.17I8APGBH9H8S@pigmoral.tech>
Cc: "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney"
 <bmasney+clk@redhat.com>, "Jerome Brunet" <jbrunet+clk@baylibre.com>,
 "Chen-Yu Tsai" <wens@kernel.org>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Samuel Holland" <samuel@sholland.org>, "Andre
 Przywara" <andre.przywara@arm.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 7/8] clk: sunxi-ng: a733: Add bus clock gates
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Enzo Adriano" <enzo.adriano.code@gmail.com>, <junhui.liu@pigmoral.tech>
X-Mailer: aerc 0.22.0
References: <20260921-a733-clk-v4-0-9c184ebe9ac1@pigmoral.tech>
 <20260921-a733-clk-v4-7-9c184ebe9ac1@pigmoral.tech>
 <20260921200512.3179109-1-enzo.adriano.code@gmail.com>
In-Reply-To: <20260921200512.3179109-1-enzo.adriano.code@gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_085642_032148_8532FE3C 
X-CRM114-Status: GOOD (  23.26  )
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
Thanks for testing and for the feedback.

On Tue Sep 22, 2026 at 4:05 AM CST, Enzo Adriano wrote:
> Hi Junhui,
>
> I tested the exact v4 series on a Radxa Cubie A7S. I used v7.3-rc1,
> applied the four-patch A523 single-divider prerequisite, this eight-patch
> series, and Andre's current seven-patch A733 pinctrl series. The test DT =
is
> a minimal Cubie A7S harness with the main and R CCUs, RTC, pinctrl, UART0=
,
> and MMC0. The Image, DTB, and initramfs were loaded into RAM from U-Boot.
>
> The exact posted stack starts all eight CPUs, probes the RTC and the A733
> pinctrl driver, and binds UART0. Serial output then stops immediately aft=
er
> the 8250 driver replaces the boot console:
>
>   sun60i-a733-pinctrl 2000000.pinctrl: initialized sunXi PIO driver
>   printk: console [ttyS0] disabled
>   2500000.serial: ttyS0 MMIO32:0x0000000002500000 ... is a 16550A
>   printk: console [ttyS0] enabled
>   printk: legacy bootconsole [uart8250] disabled
>
> It never reaches the initramfs `/bin/sh` readiness line. There is no pani=
c or
> oops in the captured output.
>
> As a private comparator, I changed only `ahb_cpus_clk` at 0x5c0 bit 28 to
> `CLK_IS_CRITICAL`. That advances the same build to:
>
>   clk: Disabling unused clocks

I reproduced the ahb-cpus issue on a Cubie A7A. After disabling
ahb-cpus, accessing registers in the CPUS domain causes the system to
hang. Marking it critical allows the A7A to pass clk_disable_unused()
and reach PID 1.

I will mark ahb_cpus_clk as CLK_IS_CRITICAL in the next version.

>
> but serial output stops there and PID 1 is still not reached. I also adde=
d
> private begin/done tracing around each individual enabled clock in
> `clk_disable_unused_subtree()`. Neither trace marker appears, so the seco=
nd
> loss occurs before the first individual unused-clock disable is attempted=
.

However, I could not reproduce this second failure on the Cubie A7A,
even after disabling all peripherals except UART0, including MMC0. The
board passes clk_disable_unused() and reaches PID 1, so I am not sure
whether the second failure is related to the clock driver.

Could you also try adding `clk_ignore_unused` to the kernel command
line? This would help confirm whether the second failure is caused by
disabling an unused clock.

>
> Each run used the same RAM-only payload and was followed by an
> identity-checked 120-second power recovery. The board returned to its exa=
ct
> vendor kernel and eMMC root after all three runs.
>
> So I cannot add a Tested-by for v4 as posted. The `ahb-cpus` gate appears=
 to
> be one issue, but marking it critical is not sufficient on this board. Co=
uld
> you please check the CPUS/AHB dependency and the path entered immediately
> after `clk: Disabling unused clocks`? I can retest a focused change or v5=
 on
> the Cubie A7S.
>
> Assisted-by: Codex:gpt-5
> I reviewed this report and take responsibility for its contents.
>
> Regards,
> Enzo

--=20
Best regards,
Junhui Liu

