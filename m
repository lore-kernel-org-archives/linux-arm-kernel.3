Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A63CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 17:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZBLTK2DdwywAhDF0XTPjOVZtq1ja7uZBlKESzPWNGI=; b=q90cZTcpgb0wSvc244KJI7SE8L
	tG3QaS4f5TrgLSZmk8SNfjeYkcWxt/iA3yqYFzXTrq876jekVRa4zIGoyx+XfIUo8pey9GxLwTpap
	cVPV2Ik6pXAQpFN9emeDxuccQYj5EmSvjehNGXIiFOtt9/VPlMc+O8fazT/q0LtHBNpfHHoN6DSB6
	ug+XXW9PxAmz5ntX6mg/36P0sI4XXZOnXnfyCZNKmMlbTCmPg528bbTmbLeKAe0qkPuNKEXek6x3G
	7F08mam7jyOypNgwj1I7hdLzncStByuJmmNAzDj1crRv81rp4U9Qg0NoMbVGnLJjaj3cpuFa2Hh2C
	Gd9mkxzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqXD-0000000HTcW-212u;
	Tue, 12 May 2026 17:04:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMqXB-0000000HTc3-2pQY;
	Tue, 12 May 2026 17:04:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C54E760139;
	Tue, 12 May 2026 17:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5208EC2BCB0;
	Tue, 12 May 2026 17:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778605480;
	bh=9Vq8ijFk8qJn7DB2+1iE5j4p/FmaoDocX6KgE6Vblx8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ckw8o3o0c0PfAJEyLSntxYwVU4AbfEuak91RBXrwRvyzNAIe4jv8elNEjpfjPY0PC
	 MkPhOUg9mXjl6MShmhGCSrJ1Wi/YbhNZMV3OMkrZet37w7P7c78VHtD1BGnMduHl3w
	 Tfmm5P5b4C7uOR4xgLVhKFhG4y+fiIzmQsbSbfBFORbEv6M6VS4q5qdE8n9xOg7185
	 EfetoI9BoCOmRvpEw9cIDscSQ9sDtGLuvMyEGuMv9xXcpM4MH3RfGamDSrXuarfIWb
	 B+x8jICCR3r04yE5fHgTYsCHm293bLNlNn46JSSWtoyneqS57vFmlHFeOUhd9JC/Zs
	 Zp9b3Kve5z4jA==
Date: Tue, 12 May 2026 18:04:26 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen
 Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Macpaul Lin
 <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, Srinivas Kandagatla
 <srini@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
 <lukasz.luba@arm.com>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 05/16] iio: adc: mediatek: add mt6323 PMIC AUXADC
 driver
Message-ID: <20260512180426.04677461@jic23-huawei>
In-Reply-To: <gWxamwTKyUeOF4QCsiIsrnh7DSWzIKFaY0h83qKq_0vg786xv1uFYhypix7BVO_ruG_vw3DrIsRhIKv5NAzl8hK72rjzPAjwAGU-rhkMgeA=@protonmail.com>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com>
	<20260512-mt6323-v2-5-3efcba579e88@protonmail.com>
	<20260512142932.5c6801d1@jic23-huawei>
	<gWxamwTKyUeOF4QCsiIsrnh7DSWzIKFaY0h83qKq_0vg786xv1uFYhypix7BVO_ruG_vw3DrIsRhIKv5NAzl8hK72rjzPAjwAGU-rhkMgeA=@protonmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 12 May 2026 14:34:55 +0000
Roman Vivchar <rva333@protonmail.com> wrote:

> On Tuesday, May 12th, 2026 at 4:29 PM, Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > On Tue, 12 May 2026 08:18:19 +0300
> > Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wrote:  
> 
> ...
> 
> > > +#define VOLTAGE_FULL_RANGE	1800  
> > Probably better to have this inline - however if you do keep it
> > prefix t he define  VOLTAGE_FULL_RANGE sounds too generic!
> >   
> > > +#define AUXADC_PRECISE		32768  
> > I'd put that inline.  Little benefit it in having it up here...  
> 
> There was a mention about magic values in the v1 for the thermal patch [1].
> Andy, would it be better to use an inline style or a #define here?
> If the former, I'll rename the first constant to something like
> AUXADC_VOLTAGE_FULL_RANGE.
FWIW that isn't a magic value - it's 2**resolution and the one is  a voltage
in mV.  Those aren't normally the ones people care about defines for - those
apply when they are weird and wonderful things not related directly to physical
quantities.

Jonathan
> 
> [1]: https://lore.kernel.org/linux-mediatek/afmnUG8dG0N0HpV6@ashevche-desk.local/
> 
> Best regards,
> Roman


