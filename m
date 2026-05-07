Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79356CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 15:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DN95yvOVKyOROIPvTOHyKmb2bM1IEkm0/BWh9em7U8Q=; b=fG2Q17JaMs/UqTTLkPT54HrT1E
	8R7oySXwQyQX34nlL7XUm8t2YJD7UdjLYPjvUW5fk74GiGHxPQigPfbPoI13GHcs7RNP55VFzo9Nc
	6O8DGqoG+Ju0C/Kaykyt6zIV6CVUM3ekB+/RfMpu9fVO0h/rqOQLP6NVDNlgaPvine8clcFuNzHyf
	/i/JUfWe7gGqA1jVUNRpJM0TapsgQvdaMg8A0HvG2EQGSFGzXQ6IXmyfKZpsDKi4Tf4Euj9uYFuSp
	OpbTQyKwwntfmCsP95ydapUqlKU+jbzxR9yp3J8/ADjQl8ruFNdrK23fIAvBZbgSEQ/fa5MIfU5MH
	vzXqKPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0eM-00000004Bkp-27IP;
	Thu, 07 May 2026 15:28:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL0eK-00000004Bk4-1W0w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 15:28:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A1C0406BA;
	Thu,  7 May 2026 15:28:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA90C2BCB2;
	Thu,  7 May 2026 15:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778167707;
	bh=4eOAk7Jab8Qd0kCNwcOZLlm6jgPUdg90LEM6kZcx/eo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tsKTlNuOWmgG9OLtgI/cSdYxSyxXfVLEBh/Hx32ww+52sozgT2D19X9rI4dnCrZYZ
	 3KlxKsvyAhnRA38+ONp1wmPUDLN0GP04w6w+l8vft+lGDOhn78JAGJVMgipLYMcivc
	 fToIuml6bRnmQYKd954N9uirjQcMVJhroSFWR729xxxg32rASs+NQkub4hhYXE0h60
	 NHb+svpZkuJgyi0dKwHLgUc37J17blwvMc8t7Ydf123NGnclFbTULRBjJtT4Ly1Ptq
	 G9YOWeaOMCmB5XTF4GZjMlRP2MXq5nmNv3LneHX4yBzs7aILSrwtralDGUMzOKY4LI
	 ukigsNFZWVJig==
Date: Thu, 7 May 2026 16:28:15 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Angelo Dureghello <angelo@kernel-space.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Ungerer <gerg@linux-m68k.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Steven King <sfking@fdwdc.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Greg Ungerer <gerg@uclinux.org>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, Angelo
 Dureghello <adureghello@baylibre.com>
Subject: Re: [PATCH 08/10] m68k: stmark2: add mcf5441x DAC platform devices
Message-ID: <20260507162815.1135618e@jic23-huawei>
In-Reply-To: <a4b53dc6-e89d-46a5-b4c1-460b0d90ae30@kernel-space.org>
References: <20260504-wip-stmark2-dac-v1-0-874c36a4910d@baylibre.com>
	<20260504-wip-stmark2-dac-v1-8-874c36a4910d@baylibre.com>
	<ef773bbd-1cf2-4cc2-96a8-fccd3355d6b1@app.fastmail.com>
	<20260506155737.6cd625a5@jic23-huawei>
	<a4b53dc6-e89d-46a5-b4c1-460b0d90ae30@kernel-space.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_082828_445466_17CB043D 
X-CRM114-Status: GOOD (  22.68  )
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

On Wed, 6 May 2026 23:07:41 +0200
Angelo Dureghello <angelo@kernel-space.org> wrote:

> Hi Jonathan,
> 
> On 5/6/26 16:57, Jonathan Cameron wrote:
> > On Mon, 04 May 2026 19:28:28 +0200
> > "Arnd Bergmann" <arnd@arndb.de> wrote:
> >   
> >> On Mon, May 4, 2026, at 19:16, Angelo Dureghello wrote:  
> >>> @@ -94,8 +94,42 @@ static struct platform_device dspi_spi0_device = {    
> >> ...  
> >>> +static struct resource dspi_dac1_resource[] = {
> >>> +	[0] = {    
> >>
> >> This looks like the name has a copy-paste error: this is not
> >> related to the 'dspi' controller at all but is just the dac, right?
> >>
> >>       Arnd
> >>  
> > 
> > https://sashiko.dev/#/patchset/20260504-wip-stmark2-dac-v1-0-874c36a4910d%40baylibre.com
> > Has noted some more alongside this one.
> > Seems unlikely a DAC has a bus number.
> >   
> 
> that sashiko comment is not clear to me, maybe was related to the comment
> i copy/pasted from dspi.

Yes.  i think that is what it was referring to.

> 
> I have now fixed this as:
> 
> +static struct resource dac0_resource[] = {
> +	DEFINE_RES_MEM(MCFDAC_BASE0, 0x100),
> +};
> +
> +static struct platform_device dac0_device = {
> +	.name = "mcf54415_dac",
> +	.id = 0,
> +	.num_resources = ARRAY_SIZE(dac0_resource),
> +	.resource = dac0_resource,
> +};
> +
> +static struct resource dac1_resource[] = {
> +	DEFINE_RES_MEM(MCFDAC_BASE1, 0x100),
> +};
> +
> +static struct platform_device dac1_device = {
> +	.name = "mcf54415_dac",
> +	.id = 1,
> +	.num_resources = ARRAY_SIZE(dac1_resource),
> +	.resource = dac1_resource,
> +};
> +
>  static struct platform_device *stmark2_devices[] __initdata = {
>  	&dspi_spi0_device,
> +	&dac0_device,
> +	&dac1_device,
>  };
> 
> It should be fine for sashiko too.
> 
> Regards,
> angelo
> 
> > Jonathan  
> 
> 
> 
> 
> 
> -- Angelo
> 


