Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E67EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 10:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QeDvH9xy8MdxSFw3+qRu5pCEXHFm5eXNIhh36F4ITIU=; b=3RtflTXN6mGcQ3gQ1DhGSFwjkr
	lACrGdKyRKK+xnRsNEjuPLl+ncJFuseKDvmzybH0/2sClrCsOi9x8KZzqiBl1SSDEhGBr8UnUqsBj
	XgW2fPWByTPNvRYecyhyvRYSw5K9tKzD4AxKpFPGNRzMXuNXXXcJOQQkoPhIU9KFZ2rCmklLUjCDU
	1mQ0YJPtAvBlUTreDVKTI4foaodJdDiYHD0UJDb+fudwLLT1ekd9QRngt2WSUE4mKo9OYvlC0595s
	TighyYrIpwal/0294HbQ/ArbcnoOL/J7qDW0UuNoXOOGFiSexX3Mo8pJXFHsdDRKOncxEFsWeAO0p
	YFmQrgTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu82C-00000002FOv-2IWP;
	Mon, 17 Mar 2025 10:49:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu7yl-00000002ESn-2fAn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 10:45:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DA9ED5C51BA;
	Mon, 17 Mar 2025 10:43:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A966C4CEF0;
	Mon, 17 Mar 2025 10:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742208354;
	bh=LY3D1eEpzD7Ym5RE/679CwqLvo2anB0W3KM9H7hyeYk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=H1culFkbAWzr5SaiHTZ6vUxZ/zWcxviY6NVeRPaFwffxbeux4HZJGagdwHa90eNAd
	 RiwMtfjHDwBTkW9My9xyIm2NJ/MjBF4D68YubCt7gCPLSmohbdntBevVja58Uo3Qq+
	 yn9ahOEwhIxQuv1piLKBUKttk5q2lf9FTxc1r1Zz6uflQFkFiqI0kQRaQsEQfM9vA3
	 M6eGMp4nVs+5wKOZ+gHEY8Rtkp6Y8dVSfB4mSMbCgUVFr0MbFhHakCJ4jJHeUtxny+
	 XnRCcxObOoqEu57iiTNzjf2ZiNm+K+CBSeRG81Xd+hlfSvw5/nvfejVQzkqNGRAi6h
	 ZQ0KI/+OV2V/A==
Date: Mon, 17 Mar 2025 10:45:37 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, Matti Vaittinen
 <matti.vaittinen@fi.rohmeurope.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Nuno Sa <nuno.sa@analog.com>, David
 Lechner <dlechner@baylibre.com>, Javier Carrasco
 <javier.carrasco.cruz@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Guillaume Stols <gstols@baylibre.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>, Trevor Gamblin
 <tgamblin@baylibre.com>, Matteo Martelli <matteomartelli3@gmail.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v7 05/10] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <20250317104537.3a8819e5@jic23-huawei>
In-Reply-To: <Z9frCUqRTD0i1Faq@smile.fi.intel.com>
References: <cover.1741849323.git.mazziesaccount@gmail.com>
	<df0b2b53affbef5ccb7219328cc15db3ba843737.1741849323.git.mazziesaccount@gmail.com>
	<Z9LQ0O34EUM8WZku@smile.fi.intel.com>
	<20250316094112.6731bd01@jic23-huawei>
	<50b126c5-248e-4694-9782-4f28d6db5fce@gmail.com>
	<Z9fUmo5wp3EcNWzm@smile.fi.intel.com>
	<0db2a42f-d393-4e75-afbf-cf30c0e06cce@gmail.com>
	<Z9frCUqRTD0i1Faq@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_034555_767944_D5870AEB 
X-CRM114-Status: GOOD (  45.46  )
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

On Mon, 17 Mar 2025 11:27:37 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Mon, Mar 17, 2025 at 10:42:07AM +0200, Matti Vaittinen wrote:
> > On 17/03/2025 09:51, Andy Shevchenko wrote:  
> > > On Mon, Mar 17, 2025 at 09:11:08AM +0200, Matti Vaittinen wrote:  
> > > > On 16/03/2025 11:41, Jonathan Cameron wrote:  
> > > > > On Thu, 13 Mar 2025 14:34:24 +0200
> > > > > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:  
> > > > > > On Thu, Mar 13, 2025 at 09:18:49AM +0200, Matti Vaittinen wrote:  
> 
> ...
> 
> > > > > > > +	num_channels = devm_iio_adc_device_alloc_chaninfo_se(dev,
> > > > > > > +				&sun20i_gpadc_chan_template, -1, &channels);
> > > > > > > +	if (num_channels < 0)
> > > > > > > +		return num_channels;
> > > > > > > +
> > > > > > >    	if (num_channels == 0)
> > > > > > >    		return dev_err_probe(dev, -ENODEV, "no channel children\n");  
> > > > > > 
> > > > > > Note, this what I would expected in your helper to see, i.e. separated cases
> > > > > > for < 0 (error code) and == 0, no channels.
> > > > > > 
> > > > > > Also, are all users going to have this check? Usually in other similar APIs
> > > > > > we return -ENOENT. And user won't need to have an additional check in case of
> > > > > > 0 being considered as an error case too.  
> > > > > In a few cases we'll need to do the dance the other way in the caller.
> > > > > So specifically check for -ENOENT and not treat it as an error.
> > > > > 
> > > > > That stems from channel nodes being optionally added to drivers after
> > > > > they have been around a while (usually to add more specific configuration)
> > > > > and needing to maintain old behaviour of presenting all channels with default
> > > > > settings.
> > > > > 
> > > > > I agree that returning -ENOENT is a reasonable way to handle this.  
> > > > 
> > > > I agree - but I'm going to use -ENODEV instead of -ENOENT because that's
> > > > what the current callers return if they find no channels. That way the
> > > > drivers can return the value directly without converting -ENOENT to -ENODEV.  
> > > 
> > > ENODEV can be easily clashed with other irrelevant cases,  
> > 
> > Can you please explain what cases?  
> 
> When it's a code path that returns the same error code for something different.
> 
> > > ENOENT is the correct
> > > error code.  
> > 
> > I kind of agree if we look this from the fwnode perspective. But, when we
> > look this from the intended user's perspective, I can very well understand
> > the -ENODEV. Returning -ENODEV from ADC driver's probe which can't find any
> > of the channels feels correct to me.  
> 
> Okay, it seems we have got yet another disagreement as I think this has to
> be ENOENT. Because this is related to the firmware description and not real
> hardware discovery path. If it is the latter, I may fully agree on ENODEV
> choice. But AFAICS it's not the case here.

I'd not rule so strongly but -ENOENT is fine and there should be no fall out from
standardizing around that.

> 
> > > If drivers return this instead of another error code, nothing bad
> > > happen, it's not an ABI path, correct?  
> > 
> > I don't know if failure returned from a probe is an ABI. I still feel
> > -ENODEV is correct value,  
> 
> And I have the opposite opinion. I think ENODEV is _incorrect_ choice
> in this case.
> 
> > and I don't want to change it for existing users -
> > and I think also new ADC drivers should use -ENODEV if they find no channels
> > at all.  
> 
> Again, the problem is that you are trying to apply the error code for HW to the
> information that comes from FW.
> 
> > Besides that I think -ENODEV to be right, changing it to -ENOENT for
> > existing callers requires a buy-in from Jonathan (and/or) the driver
> > maintainers.  
> 
> Yeah, will wait for Jonathan to judge, but I think you can find rationale above.

The distinction between hardware not there (-ENODEV) and missing stuff in 
FW (-ENOENT) seems reasonable to make. If anyone is relying on capturing
a specific error code and doing anything much with it beyond logging
for debug then they are very optimistic as this stuff is often
not particularly stable over kernel versions. That sort of error code specific
handling only makes sense very locally, not in probe() return values.

Hence my preference here is switch to -ENOENT and we'll go with that for
new code in general that hits this sort of problem.   I'd not consider
older code returning -ENODEV buggy as such, just slightly less than
ideal. So any changes for now probably belong in series touching the code
for other reasons rather than a mass cleanup.

Jonathan

