Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7153C98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 03:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fV+OYR1a5s/03fbYdkCOSm1nCeOMl/C4++YXRNfv/rg=; b=pPsO6sggOFPmnfbm7hrYdlzers
	37hspQNEbTqRkFCT0dhUT3LwhkqatcW7RDo7yjtKtO5ukG6hoRZ7oURDADnbmrFkjc/h1tY/dz9PW
	uZgUWv6sc1OZJRJLGRtD3XyE9wT1obQbfM27ZjA32DME3hJ7WHNwachThMefz6Z+ur4vCIq7Llzyl
	Uq/33uRdtc4r/ImgCjfI8bxJGX42CtcuRlNFmnhKxihP1+cFPhEmq6PrQkJ9jJjhPHvBCYDddgEJk
	VnTorj4fNwNlCPsrkv6MXFjgWoOj7XNHj4vwMR/F9vi0DEUb3FQ1NKkQcj/3GkwcQYSEY1On0A63+
	5sHoN0AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJRn-0000000EvFC-3tiK;
	Sat, 26 Sep 2026 03:51:35 +0000
Received: from sender5-op-o12.zoho.com ([165.173.182.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAJRk-0000000EvEg-1Aco
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 03:51:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1790394679; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hcdUvlqhEAhvRwAd7ZHCQT0gA3kxGMGPiAyYPWNCZ3G8o3ICf6DG8HW4XXQoyinp8Dppzog/zOwvDF3WNpPGwVQonoBsB066ELV/QNiO4yCaU6D0ywjK0pl+B8/W780RbHxzqgwGGBsUlcnlL/WfXgfOjHDi+wRp+25xj8X5SrY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790394679; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fV+OYR1a5s/03fbYdkCOSm1nCeOMl/C4++YXRNfv/rg=; 
	b=A6Odpcw+ofPIswzOf3mZfaQ1MKlujgpIij6W7tJcCYX18DcMHZ1EHUxISK4UmNiQNnpL8e1TBwT8TLy0Ms2nG30G4EOJwd7Ftf9IrtGu7A/IE6QVtm5ag1/0EdCGEdngAVuZEJ5iMrbUEbeusTrWqFPPL4vZ8+x2ngxs/r6WV1g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790394679;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:Cc:Cc:Subject:Subject:From:From:To:To:In-Reply-To:Reply-To;
	bh=fV+OYR1a5s/03fbYdkCOSm1nCeOMl/C4++YXRNfv/rg=;
	b=X9lR9t+OuCotMH0uHQ8o8QJqXn5RtaRSmpncPreAeFoM9AHD8rLb3cP8wrVJvUJD
	XqKQRx3lZV7yJmrtrWTjxdfdHS/1hcDrSwLiL+xO+jexE/Setw6wvVxawenMaUoITX+
	4aUUZkQ1K0LFuuxUx2f1bh5SJrP7nKSr0x7xI6rM=
Received: by smtp.zohomail.com with SMTPS id 1790394677967246.7571969104904;
	Fri, 25 Sep 2026 20:51:17 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 26 Sep 2026 11:51:11 +0800
Message-Id: <DLOXXXFCEB5G.15XI8896GM7B7@pigmoral.tech>
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
 <DLLYUYMR3CZT.17I8APGBH9H8S@pigmoral.tech>
 <20260926020313.911537-1-enzo.adriano.code@gmail.com>
In-Reply-To: <20260926020313.911537-1-enzo.adriano.code@gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_205132_712246_D498E55D 
X-CRM114-Status: GOOD (  15.64  )
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
Thanks for the feedback.

On Sat Sep 26, 2026 at 10:03 AM CST, Enzo Adriano wrote:
> Hi Junhui,
>
> Thanks for reproducing the ahb-cpus issue. Adding clk_ignore_unused lets
> the Cubie A7S reach an interactive initramfs shell.
>
> I reused the September 21 uninstrumented comparator: v7.3-rc1 plus the
> four single-divider patches, CCU v4, the seven pinctrl patches, and the
> minimal test DT, with only ahb_cpus_clk marked CLK_IS_CRITICAL. The Image=
,
> DTB and initramfs were byte-identical to that earlier comparator; the
> only boot-argument change was adding clk_ignore_unused.

I tried to reproduce your software stack: v7.3-rc1 plus the four
single-divider patches, CCU v4 with ahb_cpus_clk marked CLK_IS_CRITICAL,
the seven pinctrl patches, and a minimal test DT based on my
understanding of your description. On my Cubie A7A, it completes
clk_disable_unused() and reaches PID 1 without clk_ignore_unused, so I
still cannot reproduce the second failure.

>
> Without the flag, that comparator stopped producing serial output at
> "clk: Disabling unused clocks". With it, the confirmation run recorded:
>
>   [    1.263452] clk: Not disabling unused clocks
>   [    1.292364] Run /bin/sh as init process
>   [    1.526500] mmc0: new high speed SDXC card at address 544c
>
> Commands issued after the shell prompt returned the expected readiness
> and completion markers. No panic, oops or SError appeared in the capture.
> The RAM-only run was followed by a guarded 120-second power-off recovery,
> which restored the vendor kernel and eMMC root.
>
> This narrows the second failure to the path bypassed by clk_ignore_unused=
,
> but does not identify an individual clock: the flag also bypasses the
> runtime-PM acquisition and traversal before the per-clock disable calls.
> I therefore still cannot add a Tested-by for v4 as posted.

Could you share the exact minimal DT used for the test, either by email
or through a git branch I can access?

Could you also provide some details about the boot firmware you used,
including where the U-Boot and TF-A images came from and their versions?
I would like to reproduce the test with the same firmware and rule out
differences in the boot firmware.

>
> Assisted-by: Codex:gpt-6
>
> Regards,
> Enzo

--=20
Best regards,
Junhui Liu

