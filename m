Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211EEC531D0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Jul 2026 05:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LQ0vET0CaLia9gd+nvryYFD7dX3p2pL0OWBdS444Dvk=; b=lxSPbvVoJfNuIZb15biOU+E5mk
	ZrqtzDKlmKS+THQ8pWY2Gd0L96YOc+oZOMROcrg+3hKnRxzDgTAOxYub3Z+qzvGgD0AMqN64Tau0I
	BQaxW5uE3iF20QhCJvlt3pvoXLwPsQhSCsNDmxyccYgPpYw8C/f+ZqDerV7VuNGj2IDk9Otsb6DIe
	QzG5HFA8yEd7bX4+0EWvrqoqkfrB6LOsSzDBDRgLY5tRNtobNApyglz5NULvJ3jdfk8S6dY+9FC5y
	A4+2KdE4E7gLx/Xfyq2dK1GppO3b5tNlTViewxqfwNIzlN5bIJA5Moj4R32DLO5vosigJYPIzm7FB
	LrOcAVww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnUfi-000000003KY-2j5N;
	Sat, 25 Jul 2026 05:11:38 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnUfg-000000003JX-1EvA;
	Sat, 25 Jul 2026 05:11:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1784956270; bh=LQ0vET0CaLia9gd+nvryYFD
	7dX3p2pL0OWBdS444Dvk=; b=L8KaAwyYcqh4o0P5of7bWiO6qvpTwJdJODzZMca1fHGK7+SHnP
	90+TSUQZvaOfIMhdCYV3/AkYopDDM8SAcchdmt8brjzDewevYBc4MDK/YzbZBsRgEhu7Mvo1cje
	jansOoVRKQU19H4rjyy/7UWxlpqequuva55ZvwstpHI7WOinIh4L/N41167b8A/I7PsD0TByZWf
	OROkHnyPCTnu7w/QpywzgkG2wkEYhqqD2vAP3ExfljMRJ9Ncp8GzYCHpYDNLZyDPew/4dubCiX2
	nJSkVku1TpndH7ufVfY9wIrt7Vp6mCn/IrDQaqUhF7w/JXsKVPey5nZIgVKZ+JJbb4A==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1784956270; bh=LQ0vET0CaLia9gd+nvryYFD
	7dX3p2pL0OWBdS444Dvk=; b=eGP4+POni7ZnQkrKwsV2A+5nml6A+0XXpyqrbBOycM6TUZEzBR
	pxonJHdx7/VB+KdmIkIcB2JJ2pr1E8hnE/Bg==;
Message-ID: <fe909054-5c9d-42f5-bbc1-66ca0ace72de@mainlining.org>
Date: Sat, 25 Jul 2026 01:11:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] pmdomain: mediatek: Fix MT8183 hang on boot
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260722132729.302067-1-dmitry.osipenko@collabora.com>
Content-Language: en-US
From: Brady Norander <brady.norander@mainlining.org>
In-Reply-To: <20260722132729.302067-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_221136_490198_64D00A98 
X-CRM114-Status: GOOD (  14.72  )
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

On 7/22/26 09:27, Dmitry Osipenko wrote:
> Depending on firmware, part of the MFG domains may be left ON at boot
> leaving only some MFG cores powered, to let the ACP to prefetch the GPU
> region when the display controller is brought up. This doesn't play well
> with an eventual delay in probing Panfrost when the display controller is
> fully set up, as that would make genpd's sync_state() to power off the
> domain while ACP tries to prefetch: this is causing an AXI stall,
> effectively freezing the AP indefinitely. In order to prevent this from
> happening, the sync_state() functionality must be obliterated on all of
> the MFG domains: while this guarantees a power leakage if the bootloader
> boots the kernel with MFG PDs partially powered on, this is the only way
> to ensure stable operation of the SoC during boot on devices with such
> firmware because, of course, those will never officially receive a
> firmware update.
> 
> Fixes Kappa Chromebook hanging during system boot.

I also saw this same issue on my MT8192 Hayato Chromebook, and I also 
saw an issue on my MT8183 and MT8186 Chromebooks where the audio was 
broken. I fixed all of those issues by setting the GENPD_FLAG_NO_STAY_ON 
flag on all domains. I held off from submitting that change as I was 
unsure if it was the "correct" way to handle it, but perhaps it is. 
Either way, this issue is not specific to only MT8183.

