Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4645109C029
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 15:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYR/VQii1eq+59yB5UylOEDiVqDDyUVcShZrPailuWs=; b=3UK9tS7bLgRbrbh4urhct46RC7
	m5HZex7XQ6yMTyj9ZiBp1ffg8M1G4lNa23tfYPzgUuSxGtvsq/JDBrwWVAZ7gtz7MMAf/ml3DM2Al
	OdElzfHvVfE/x5DH9Y0PyAHMj74osGw66hAIaaWFq0tYdIEt3onQRk2tS2Mn2UN4l6ll8N+wHWWy+
	ElezjH6PNvsvoCox1Eitw9Dc2U3cuqiQx4iZ8Qfjyft3H5JlIscrudqsg524dPC81A+0d98ND27HR
	y8FDX+uDeyUZi+VIKbKBrsNfIfEcYA6Yq+9LTmmhMrehS3JO1iUphgZkbS7g+zwax08yH8bNjCINC
	nqNvWR/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Q50-00000003mEk-3JRZ;
	Wed, 25 Mar 2026 15:23:34 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Q4w-00000003mBV-15GW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 15:23:32 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2c160cb021cso944945eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 08:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774452209; x=1775057009; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dYR/VQii1eq+59yB5UylOEDiVqDDyUVcShZrPailuWs=;
        b=MURMUkh1ea1IA3QCKeh9Wu9yqNH/CpzjSUphbHgLKQinb/b9yX5IWHFc4/Vx/qh120
         aiwAYdUmRvQqiGiaNgp2amhTrchngMegnn1MFQhCNUN0QEsgtlUhJNDFioOzvvTu16vk
         /zChJOVMaKKr7PKQwf0u4gvOyKBBfpJsxMYvUepM62B4TuQPR1cNyODF6+z11ueT2V9Q
         X7RMHPg8nU4Zg8qHN8esJ1HmN9Hfm1WDsn40w/jWRVqu5+iSDNpXAT802vn8I+vsMHWm
         1Dd+8bm6zzdwQ3lWQSc9JX/TulkVVIQfAigN++DdgfqRB2l6g6qW9JL/+7/CCj7fEsOr
         QInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774452209; x=1775057009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dYR/VQii1eq+59yB5UylOEDiVqDDyUVcShZrPailuWs=;
        b=F3F/mwAgzjEoyQHouvTI/bWcabHbnufQTHq849DbXVnO4U++Mi5PQlz948zNHMn3NB
         E5yuI7GDY5xPMVwrm6YeoBnmQAjA/3RSqBacR+0XaSn9CT+salYnP3ZINKLwiwhiscwt
         lqX1POiL1cUlLt5RoSagyv2iD+HQdV/9lQqDwQ3jJ62/OV5pmGFJTN0A/jm47O3u85WM
         RFNyxs6G6i0rcUyTCJZtC8+lgnirZmKWNAJgQDBjOSLdODneBodgWU0gjgYzfta/k1p2
         6KpGPJJmZxzGaa0MPMaMQjYkR2ltYSZNvyIMNz36RYsl4QM8XTWIKAzecT6uxq+rY14Z
         0fJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvqefazyCOfH/FTPz/yzUYPn1T1dEkb+jK8+6n90GLdM7Kb3uz9hEN8v3jWg5fM7Bc3fGBwDjK9XG2Fnxzo5eG@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd5oad7MUgcu0eNYdvSr92YAIDCs6YMaNOxeDvZPcR/aFAYI72
	P4bLEkDvYTvxeOgaDEf3klJiMrtpWXkwJmtTmNd+OoB3oGUZCihGho0y
X-Gm-Gg: ATEYQzz9CtSn0f3B8dVfu5WjH8fbfZUI3mYK5XPYs8ruYfYyQF2XPkIHY5JrQLHMPfR
	tEAtluOhZWLuBw88cs63nKHWYZYirunIDfyQhStuRKVfsBpQ8PF5T6s/+gH0lbqgxKi3VwGYJHP
	r1yDhswHas4PDlRq7JVRhjm8tbjsxoxo6hTKeIFknFRmKn1olcHVwMR3GaCHWhtXgUHm18XNFDS
	bYZJsfSMctg+p7X9n8g8QXYqszTI39/mH8eJTlnOr0e2ZD4WIcqs9bKFgOauvfGeNLJ0rE5Px+M
	39sHFhfcoMwgp7gnsUQlfyRRunu9o3xd5s96IBjqHgHYsVdET+glAjC7WWd73GtVD0JVAUy5YYI
	DcEPm/5FU6PcdXmIsdHNgtNFvmfLa3XwonY65eqgH9GV6jb+JrcdwhsOB7N+T5cButNyDGf6smR
	RTTudfmbGqPm6+P5E6M4bwq11NV9ATeq0XmIrTQIjTfeOEbhPTmDFC6d/HZhoGArrE
X-Received: by 2002:a05:7301:578d:b0:2ba:6819:2e9b with SMTP id 5a478bee46e88-2c15d32bccemr2245364eec.3.1774452209058;
        Wed, 25 Mar 2026 08:23:29 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b7b4:352d:eb23:66e5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b29c941sm18375747eec.15.2026.03.25.08.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 08:23:28 -0700 (PDT)
Date: Wed, 25 Mar 2026 08:23:24 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Danilo Krummrich <dakr@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Niklas Cassel <cassel@kernel.org>, 
	Shawn Lin <shawn.lin@rock-chips.com>, Hans Zhang <18255117159@163.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>, 
	Grimmauld <grimmauld@grimmauld.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, driver-core@lists.linux.dev, Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
Message-ID: <acP57qjzZr1NR1zf@google.com>
References: <87bc37ee-234c-4568-b72e-955c130a6838@arm.com>
 <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com>
 <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org>
 <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
 <DH09EDBW3X6T.2996UB1CFCAW2@kernel.org>
 <55c28218-1638-4b90-a9cd-a177fb5abcb6@arm.com>
 <acNgUoWWMCi1oLU4@google.com>
 <6cc25c83-6a5a-4785-9573-335371a94798@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cc25c83-6a5a-4785-9573-335371a94798@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_082330_310124_62813E15 
X-CRM114-Status: GOOD (  67.58  )
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

On Wed, Mar 25, 2026 at 03:01:03PM +0000, Robin Murphy wrote:
> On 25/03/2026 4:13 am, Dmitry Torokhov wrote:
> > On Thu, Mar 12, 2026 at 12:48:36PM +0000, Robin Murphy wrote:
> > > On 2026-03-11 9:09 pm, Danilo Krummrich wrote:
> > > > On Wed Mar 11, 2026 at 1:28 PM CET, Manivannan Sadhasivam wrote:
> > > > > On Wed, Mar 11, 2026 at 12:46:03PM +0100, Danilo Krummrich wrote:
> > > > > > On Wed Mar 11, 2026 at 6:24 AM CET, Manivannan Sadhasivam wrote:
> > > > > > > I have a contrary view here. If just a single driver or lib doesn't handle async
> > > > > > > probe, it cannot just force other drivers to not take the advantage of async
> > > > > > > probe. As I said above, enabling async probe easily saves a few hunderd ms or
> > > > > > > even more if there are more than one Root Port or Root Complex in an SoC.
> > > > > > 
> > > > > > Then the driver or lib has to be fixed / improved first or the driver core has
> > > > > > to be enabled to deal with a case where PROBE_FORCE_SYNCHRONOUS is requested
> > > > > > from an async path, etc.
> > > > > > 
> > > > > > In any case, applying the patch and breaking things (knowingly?) doesn't seem
> > > > > > like the correct approach.
> > > > > > 
> > > > > > > I strongly agree with you here that the underlying issue should be fixed. But
> > > > > > > the real impact to end users is not this splat, but not having the boot time
> > > > > > > optimization that this patch brings in. As an end user, one would want their
> > > > > > > systems to boot quickly and they wouldn't bother much about a harmless warning
> > > > > > > splat appearing in the dmesg log.
> > > > > > 
> > > > > > You mean quickly booting into a "harmless" potential deadlock condition the
> > > > > > warning splat tries to make people aware of? :)
> > > > > > 
> > > > > 
> > > > > Hmm, I overlooked the built-as-module part where the deadlock could be possible
> > > > > as indicated by the comment about the WARN_ON_ONCE().
> > > > > 
> > > > > But what is the path forward here? Do you want the phylib to fix the
> > > > > request_module() call or fix the driver core instead?
> > > > 
> > > > Here are a few thoughts.
> > > > 
> > > > In general, I think the best would be to get rid of the (affected)
> > > > PROBE_FORCE_SYNCHRONOUS cases.
> > > > 
> > > > Now, I guess this can be pretty hard for a PCI controller driver, as you can't
> > > > really predict what ends up being probed from you async context, i.e. it could
> > > > even be some other bus controller and things could even propagate further.
> > > > 
> > > > Not sure how big of a deal it is in practice though, there are not a lot of
> > > > PROBE_FORCE_SYNCHRONOUS drivers (left), but note that specifying neither
> > > > PROBE_FORCE_SYNCHRONOUS nor PROBE_PREFER_ASYNCHRONOUS currently results in
> > > > synchronous by default.
> > > > 
> > > > (Also, quite some other PCI controller drivers do set PROBE_PREFER_ASYNCHRONOUS
> > > > and apparently got lucky with it.)
> > > > 
> > > >   From a driver-core perspective I think we're rather limited on what we can do;
> > > > we are already in async context at this point and can't magically go back to
> > > > initcall context.
> > > > 
> > > > So, the only thing I can think of is to kick off work on a workqueue, which in
> > > > the end would be the same as the deferred probe handling.
> > > 
> > > Hmm, in fact, isn't the deferred probe mechanism itself actually quite
> > > appropriate? A suitable calling context isn't the most obvious "resource
> > > provider" to wait for, but ultimately it's still a case of "we don't
> > > have everything we need right now, but it's worth trying again soon".
> > > I may have missed some subtleties, but my instinct is that it could
> > > perhaps be as simple as something like this (completely untested).
> > > 
> > > Cheers,
> > > Robin.
> > > 
> > > ----->8-----
> > > 
> > > diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> > > index bea8da5f8a3a..3c4a0207ae3f 100644
> > > --- a/drivers/base/dd.c
> > > +++ b/drivers/base/dd.c
> > > @@ -954,6 +954,16 @@ static int __device_attach_driver(struct device_driver *drv, void *_data)
> > >   	if (data->check_async && async_allowed != data->want_async)
> > >   		return 0;
> > > +	/*
> > > +	 * Bus drivers may probe asynchronously, but be adding a child device
> > > +	 * whose driver still wants a synchronous probe. In this case, just
> > > +	 * defer it, to be triggered by the parent driver probe succeeding.
> > > +	 */
> > > +	if (!async_allowed && current_is_async()) {
> > > +		driver_deferred_probe_add(dev);
> > > +		return 0;
> > > +	}
> > 
> > That means that you are kicking the majority devices (for now) into
> > deferral path. I do not think this is optimal.
> 
> And probing drivers under conditions where they may go wrong or deadlock is
> better? I've not yet had a chance to actually test this myself to see the
> effect on timings, but whatever it might be, I can't imagine any *other*
> method of re-serialising child driver probes could be significantly better
> (or if it could be, that might represent some improvement we could make to
> the deferred probe mechanism in general anyway).

There is serious disconnect as to what asynchronous and synchronous
probing means. You do not go "back" to synchronous probing.

	/*
	 * Indicates whether we are considering asynchronous probing or
	 * not. Only initial binding after device or driver registration
	 * (including deferral processing) may be done asynchronously, the
	 * rest is always synchronous, as we expect it is being done by
	 * request from userspace.
	 */
	bool check_async;

So synchronous means that when you register device or driver we dun
probe immediately on the same thread that registered said device or
driver, while with async we _may_ schedule on a workqueue (but if the
system has already scheduled too much async it will be probed
synchronously or immediately).

So in the case we are discussing the probing of phy device is indeed
synchronous/immediate relative to the thread where the phy device is
registered.

> 
> I have finally got a bit of time this afternoon to pick this up again, so
> I'll have a play and try to finish the write-up capturing all the reasoning
> so far (it's a long one...)
> 
> > Does phy really need to request modules synchronously (and on its own)?
> > Why can't it rely on udev to load the modules and signal when phy
> > devices are ready?
> 
> Getting hung up on what phylib does in this one particular case is rather
> missing the point. There is a reason that we're still not forcing
> async_probe on for everything by default. Many drivers will still not have
> been tested and validated to handle it correctly, and while the majority of
> latent issues will likely just be concurrency bugs which can be fixed with
> better locking or whatever, even then we should be encouraging developers to
> actively test and look for such bugs to make their drivers "async probe
> clean", rather than knowingly enabling bugs to surface in the wild as weird
> and subtle breakage on end-user systems.

No. We have identified (at least IMO) that what phylib does is wrong. I
am not advocating forcing this PCI host to be marked for asycn probing
right now, before the phy issue is fixed, but I object to adding
workarounds to driver core which hurt other cases and may lead to phylib
never be fixed.

> 
> However, I imagine there will always remain some small minority of
> PROBE_FORCE_SYNCHRONOUS drivers - either for niche legitimate technical
> reasons, or just legacy drivers where updating them would take more effort
> than it's worth - so the driver core surely needs the ability to not do the
> wrong thing itself. That doesn't even need to be "optimal", it just needs to
> be functionally correct.

Again, your expectation of what sync probing means differs from what I
had in mind when implementing it. PROBE_FORCE_SYNCHRONOUS is typically
for drivers/modules that register both a device (typically a singleton)
and a driver, and want to unregister both and free all resources when
initialization fails for some reason. Think cases like PC keyboard
controller.

Thanks.

-- 
Dmitry

