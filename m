Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D88C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 21:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dsHGpAFe1qvMSXAA3lSa5nowlfDdYay5ghEpBTMbdn0=; b=LsnNtZfIb3PfNrxVhxQG7rABfI
	rWG5qHfHVW0NMhz6wXJT4I3MJCl9UGiM92lwksLktLWdYDFTUzZQL4AYSOeYxu6jZYRMwTrDgw0UD
	KmtaImBjvz3oo85TVgu7pzBbT0DQ0FVJ8gdLJQGBeoan6Eyq3Lj70sfwoL/Q2O05+dHADpZqUq9e4
	+EahUMsffwVkx2xzvAYh2witEFi/OTdg8agDBhXkBpnky/CyYmyLnYraflUNljwz1/u4MvvlDMqTb
	WmhdHJpCPMzECTvpoWjdm2KCr4/UYCX69eNbqYa8FsOnA+FUlyZnBD7Rkn+ZJh2r4N8cYw2c8bsvh
	kNPy64LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZco6-00000009xL0-14tC;
	Wed, 09 Jul 2025 21:58:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZX3H-00000009DC7-0t3n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 15:49:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96AEE439E5;
	Wed,  9 Jul 2025 15:49:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04AF3C4CEEF;
	Wed,  9 Jul 2025 15:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752076182;
	bh=4eG67VwdY6yryX9Oqb584knMPMQAKXI8QBnDkqUgg/c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Cwuh3Xe61CXjMKNkToIZevUXQzpOfauMU3w1uzfo4otQHWOZURQipbRvGCdThUF2q
	 ye+BL+7tfamDxzHaO7jA7S7avZDaaw7zxWQGdu2Z8nZlAR36pAQvgnpwX2PHuVDkcB
	 RTej8EmaA/9GFzRVcJyLhsAyoDuOX4LVihX1tnt5GDO+qrq/9g3oVfa8sCehLBJ3rM
	 CmHD+UvXKoqROd00XIWOvQBQI0LGobiTS8tdnG/z0v8vPpssCsDOGyQLGffKl/w3Bz
	 RmUVNmpSsAnRnXBKGECv+Z3/pcxdtMzheiG99XWQM6obd4Z5qxcVxhBd+5MTTc0WQx
	 v3451WtbhxAmw==
Date: Wed, 9 Jul 2025 16:49:33 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Uwe =?UTF-8?B?S2xlaW5l?=
 =?UTF-8?B?LUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>,
 linux-iio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/12] iio: dac: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <20250709164933.47913e22@jic23-huawei>
In-Reply-To: <aG4sxEtXRw982Z9q@smile.fi.intel.com>
References: <20250708231144.971170-1-sakari.ailus@linux.intel.com>
	<20250708231152.971550-1-sakari.ailus@linux.intel.com>
	<aG4sxEtXRw982Z9q@smile.fi.intel.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_084943_271876_56C0D36B 
X-CRM114-Status: GOOD (  14.64  )
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

On Wed, 9 Jul 2025 11:48:04 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Jul 09, 2025 at 02:11:52AM +0300, Sakari Ailus wrote:
> > pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> > pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> > to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> > pm_runtime_mark_last_busy().  
> 
> ...
> 
> > -	if (!enable) {
> > -		pm_runtime_mark_last_busy(dev);
> > +	if (!enable)
> >  		pm_runtime_put_autosuspend(dev);
> > -	}
> >  
> >  	return 0;
> >  
> >  err_put_pm:
> > -	if (enable) {
> > -		pm_runtime_mark_last_busy(dev);
> > +	if (enable)
> >  		pm_runtime_put_autosuspend(dev);
> > -	}
> >  
> >  	return ret;  
> 
> 
> Hmm... Why not simply
> 
> 	ret = 0;
It's already zero (as last call was a regmap_update_bits() return value ) so even easier.
However, switch if (ret < 0) to if (ret) for that regmap call
to make that more obvious.

> 
> err_put_pm:
> 	if (enable)
> 		pm_runtime_put_autosuspend(dev);
> 
> 	return ret;
> 
> instead of the duplication?
> 


