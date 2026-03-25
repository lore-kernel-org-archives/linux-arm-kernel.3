Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F297FEA806
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 04:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1zx9FotWDsXciTr6vSKC3+KwJ/ZkglPq04NJzxyt/k=; b=i6BfdiL6QFnr73ilJF8j4Pw9a1
	vqz/qiKc5Dl/MfP2bo3qon197g+QZAGqPenqllkpytF6QAPdBgr+CHUgaC7FbbREYaR5lrO1iOEoC
	JF9gHY72ZIudyHxMm1NdwK50SWOpdgjVvlgL+BT00AhXbnSioyhooc+vmTdtKP7265flWJWwjOX0k
	X98ACyryuzZ1aoBHujdTYCj1VC6nvqBN3LMsyR+yuEswm1Ae2Md2jcU5UoTQEEzMtyeerRGVdvMn0
	fKnyLWbh1CrwhFOajX25pX2oJTJjndKh84ORJv8wBc5pwLDq86571gPq67kJskOAOhkbGsOJ7XSAC
	9u0BVlNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5FcX-00000002ezf-3nIx;
	Wed, 25 Mar 2026 04:13:29 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5FcV-00000002eyw-01aJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 04:13:28 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-12713e56abdso304949c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 21:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774412006; x=1775016806; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A1zx9FotWDsXciTr6vSKC3+KwJ/ZkglPq04NJzxyt/k=;
        b=TSiuNJECs2nTpFRM7zBhjckU4fAU7ktGO7B4lCq7haEXDIBsXE+Y8QXtgRdlD3MkMl
         dhNKUpHsmFavpSAZFhYRc94V+tiPXi+VSnLal3ERTbifq3wR9ybwW0/gy/iYnxiJ0NFJ
         xfMSetEbmmEElQb0nR0KfVEAA76k/rv/qlpVzNUo6JtatIQH0y65yTbcQPGLQlDB9MPF
         6SXdE+RsofQXkP3A4OOShp18CMa176z5fYpcIv/cNjHOk4qpe+4ZCW4T1F2/gPogfJfg
         ZAL9xpOzMxiJXX3XX0tGQZo/2nXnwZmVEtxy12dyX5sda9S7i9poXT5moRoyvQE9V/Pr
         04Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774412006; x=1775016806;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1zx9FotWDsXciTr6vSKC3+KwJ/ZkglPq04NJzxyt/k=;
        b=CzmoFKuy67kNIB62pcgNk2iM8FKcpgvOlAXhtnrmIcz93KMh7L49OpoUzEDaoi14ev
         LsmxWXN4JpG5aNPlXwxZR5GqixEpct3kR2vCsCOsiIv2MqPd9lrLR9pORs2dVgiDkJzn
         di03ovbqurrbECV8yc5+GScjA99PRG7BiQbM6OCbS2fQPCipGeqK50GS/szb9Cq5Lp/B
         5XjugqLQDfr0VhS3jFcMGmxUsH1ENcpnVT/mYJmHQdT3dYAeLIz87MXykHOPvVFfnm8H
         2swaKKlNs+VUmeZ36pjSYALCfJS+MrYRN3eBAt8zqNf6gSfIqRdJVH50ftp4b9qtJ0lE
         YzDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRWK/qj1BfHr8bUoxgN9UPHBnBFBH6H8Wvg7umiYs0nS7hwJ9Ais5pn1QmhokbSJFp4Dny9bA47xyZcVl8MKky@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3GQjhQtrql3gepUz/wxe5vWflE/FguZD4ntpzMqn3Khckk3nS
	feNOZAAMhvCc1eiqtNVl5SOJ+MNMVOS9nUYyVFlify0CmO2QT/q+Gqbg
X-Gm-Gg: ATEYQzxk5nCQdmTO29l/pmgsMU9+OvI6E3zQ4IaQGFBbYVNo9Gz2bJXKoveEUenKj65
	q/6sU/GLM0kURL22z3T/KrwikMdXwES8TyYQj2mFqbrtLPs7iJFhrT+UDEQ5RrPR53vLqXNSExG
	IRdHgI+0iqVNIDsGGmzNOHb0kRHbuAjSAKkFykTgCgeTXyTK7KbMq726rRfxBelzRyLlcn+v6Ec
	mmB5ln3W6j40KGk22wNijWagUD0D2oFQ/a7RxGqGXvHoCeOJWxuvTu0lb6OIXQxx7X4Oi1I6TT5
	ryIBdbF9lJeBbET2S8kyPqpd2+mCE2yPSzY006Y13L1yap8TDHZDH/8yaLsz93goq9DNwN21AXr
	0mtym8y83mCybDk3XT6gIQHq9Ki0uLFZdLWEK07RDcw39dIRzHswz+OsRcPZZ0u3LKs9D/DNKvv
	ETwPI0+SqZTbjxhd8fwmkg2BYG0Kr6imECt7G4DC9YLVmKZ/71PA0afL0lKcpgTAJFlDM79qdCF
	pc=
X-Received: by 2002:a05:7022:418b:b0:128:f1fd:78be with SMTP id a92af1059eb24-12a9684c64cmr1091744c88.5.1774412005575;
        Tue, 24 Mar 2026 21:13:25 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a686:fd7f:70d3:9156])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733b4a39sm12292420c88.3.2026.03.24.21.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 21:13:24 -0700 (PDT)
Date: Tue, 24 Mar 2026 21:13:20 -0700
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
Message-ID: <acNgUoWWMCi1oLU4@google.com>
References: <20260226101032.1042-1-linux.amoon@gmail.com>
 <177260693908.10259.13055467642416391434.b4-ty@kernel.org>
 <87bc37ee-234c-4568-b72e-955c130a6838@arm.com>
 <f7tfshf7riljjibuqge4ubfjmludubpyh3ppdf6lasurzdzbtj@sw4xxagfhnn3>
 <5d88fb5b-e771-4ea6-8d2c-c5cfd21e5860@arm.com>
 <qwanhqrpztzkudik5fmberhabnzaly7v53677dohqzj5nq4wi2@6ndpiubyxcbi>
 <DGZXF3LPSRK6.2QYN63QTKUQAX@kernel.org>
 <cp5uktfqdf6zs53qsye57ior2ikmssgevxxdtevkzpisaif22h@7mrxspkuibow>
 <DH09EDBW3X6T.2996UB1CFCAW2@kernel.org>
 <55c28218-1638-4b90-a9cd-a177fb5abcb6@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55c28218-1638-4b90-a9cd-a177fb5abcb6@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_211327_083643_69130167 
X-CRM114-Status: GOOD (  47.30  )
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

On Thu, Mar 12, 2026 at 12:48:36PM +0000, Robin Murphy wrote:
> On 2026-03-11 9:09 pm, Danilo Krummrich wrote:
> > On Wed Mar 11, 2026 at 1:28 PM CET, Manivannan Sadhasivam wrote:
> > > On Wed, Mar 11, 2026 at 12:46:03PM +0100, Danilo Krummrich wrote:
> > > > On Wed Mar 11, 2026 at 6:24 AM CET, Manivannan Sadhasivam wrote:
> > > > > I have a contrary view here. If just a single driver or lib doesn't handle async
> > > > > probe, it cannot just force other drivers to not take the advantage of async
> > > > > probe. As I said above, enabling async probe easily saves a few hunderd ms or
> > > > > even more if there are more than one Root Port or Root Complex in an SoC.
> > > > 
> > > > Then the driver or lib has to be fixed / improved first or the driver core has
> > > > to be enabled to deal with a case where PROBE_FORCE_SYNCHRONOUS is requested
> > > > from an async path, etc.
> > > > 
> > > > In any case, applying the patch and breaking things (knowingly?) doesn't seem
> > > > like the correct approach.
> > > > 
> > > > > I strongly agree with you here that the underlying issue should be fixed. But
> > > > > the real impact to end users is not this splat, but not having the boot time
> > > > > optimization that this patch brings in. As an end user, one would want their
> > > > > systems to boot quickly and they wouldn't bother much about a harmless warning
> > > > > splat appearing in the dmesg log.
> > > > 
> > > > You mean quickly booting into a "harmless" potential deadlock condition the
> > > > warning splat tries to make people aware of? :)
> > > > 
> > > 
> > > Hmm, I overlooked the built-as-module part where the deadlock could be possible
> > > as indicated by the comment about the WARN_ON_ONCE().
> > > 
> > > But what is the path forward here? Do you want the phylib to fix the
> > > request_module() call or fix the driver core instead?
> > 
> > Here are a few thoughts.
> > 
> > In general, I think the best would be to get rid of the (affected)
> > PROBE_FORCE_SYNCHRONOUS cases.
> > 
> > Now, I guess this can be pretty hard for a PCI controller driver, as you can't
> > really predict what ends up being probed from you async context, i.e. it could
> > even be some other bus controller and things could even propagate further.
> > 
> > Not sure how big of a deal it is in practice though, there are not a lot of
> > PROBE_FORCE_SYNCHRONOUS drivers (left), but note that specifying neither
> > PROBE_FORCE_SYNCHRONOUS nor PROBE_PREFER_ASYNCHRONOUS currently results in
> > synchronous by default.
> > 
> > (Also, quite some other PCI controller drivers do set PROBE_PREFER_ASYNCHRONOUS
> > and apparently got lucky with it.)
> > 
> >  From a driver-core perspective I think we're rather limited on what we can do;
> > we are already in async context at this point and can't magically go back to
> > initcall context.
> > 
> > So, the only thing I can think of is to kick off work on a workqueue, which in
> > the end would be the same as the deferred probe handling.
> 
> Hmm, in fact, isn't the deferred probe mechanism itself actually quite
> appropriate? A suitable calling context isn't the most obvious "resource
> provider" to wait for, but ultimately it's still a case of "we don't
> have everything we need right now, but it's worth trying again soon".
> I may have missed some subtleties, but my instinct is that it could
> perhaps be as simple as something like this (completely untested).
> 
> Cheers,
> Robin.
> 
> ----->8-----
> 
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index bea8da5f8a3a..3c4a0207ae3f 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -954,6 +954,16 @@ static int __device_attach_driver(struct device_driver *drv, void *_data)
>  	if (data->check_async && async_allowed != data->want_async)
>  		return 0;
> +	/*
> +	 * Bus drivers may probe asynchronously, but be adding a child device
> +	 * whose driver still wants a synchronous probe. In this case, just
> +	 * defer it, to be triggered by the parent driver probe succeeding.
> +	 */
> +	if (!async_allowed && current_is_async()) {
> +		driver_deferred_probe_add(dev);
> +		return 0;
> +	}

That means that you are kicking the majority devices (for now) into
deferral path. I do not think this is optimal.

Does phy really need to request modules synchronously (and on its own)?
Why can't it rely on udev to load the modules and signal when phy
devices are ready?

Seems like a deficiency on PHY subsystem that is stuck in times long
past.

Thanks.

-- 
Dmitry

