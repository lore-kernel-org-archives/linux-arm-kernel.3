Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F926F8FA8C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 15:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E14rGnaQab5PO7pSIGX1kZKHuKg+736vkJA+/T7tas8=; b=3wVG7hEeClN0gCi+o8c2xCG/rd
	SuYg/Dud5YFyPof3RrjDVOIj8b0A17YouzHY7T7vFqB7imdQHkpkBmRKbbE6Gxy/B9pp8u0lDy6Gk
	gppR0s9a8J0xdy6WH8AtiMoToUkrVMwOztTpiKK3lZhXRR1dNHQPnfkhB8ggWyjoq60p3szrdJD9v
	ov4X4RK6Frh0HHZHcVAXENXqOqMFZC2acTglCf7SOyD7trSy1DgbxRBGrYMvJIgB8NNmfCDwEuum/
	/MhPX6UgvzXxrOBqbLjoXWm6cfEoyUM71Fy8YL+8/jpfO6VmbhmJ2FlVBpoNQMQIqyp0nJqobdBhn
	yumpVoMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCuO-00000008pAd-0R3S;
	Tue, 21 Apr 2026 15:21:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCuM-00000008pAM-2d79
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 15:21:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 69588600AE;
	Tue, 21 Apr 2026 15:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D8B2C2BCB0;
	Tue, 21 Apr 2026 15:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776784861;
	bh=F/at9kvrP0ftyUXa1QoDHgWWt9+7e9KsyBp2so8oQso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kSTNTUxuJ37MXFp3pSpIMdOS40laH/EwZEvvafMj20wmOvojcusZdLaDlk16oH+dO
	 8ppHDiTS5MR1Akmk2kAgbyZCw+upDYVlToxmmW9yRoe7uozquBxIffCUiQO2btwOMt
	 7QxKOVT4jLFsek9pQHTWW/Krw78JV4q2Mpr7++wQ=
Date: Tue, 21 Apr 2026 17:20:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Kay Sievers <kay.sievers@vrfy.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Richard Cochran <richardcochran@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rahul Bukte <rahul.bukte@sony.com>,
	Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] kernel: param: handle NULL module_kset in
 lookup_or_create_module_kobject()
Message-ID: <2026042154-overcast-starry-2872@gregkh>
References: <20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com>
 <20260421-acpi_mod_name-v2-1-e73f9310dad3@sony.com>
 <2026042126-majesty-skyline-b76f@gregkh>
 <aeeQ5x1uMKT6cyxp@JPC00244420>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeeQ5x1uMKT6cyxp@JPC00244420>
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

On Tue, Apr 21, 2026 at 11:59:51PM +0900, Shashank Balaji wrote:
> Hi Greg,
> 
> Thanks for the quick feedback!
> 
> On Tue, Apr 21, 2026 at 08:27:10AM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Apr 21, 2026 at 03:02:34PM +0900, Shashank Balaji wrote:
> > > module_kset is initialized in a subsys_initcall. If a built-in driver tries to
> > > register before subsys_initcall with its struct device_driver's mod_name set,
> > > then a null module_kset is dereferenced via this call trace:
> > > 
> > >      [    0.095865] Call trace:
> > >      [    0.095999]  _raw_spin_lock+0x4c/0x6c (P)
> > >      [    0.096150]  kset_find_obj+0x24/0x104
> > >      [    0.096209]  lookup_or_create_module_kobject+0x2c/0xd8
> > >      [    0.096274]  module_add_driver+0xd4/0x138
> > >      [    0.096328]  bus_add_driver+0x16c/0x268
> > >      [    0.096380]  driver_register+0x68/0x100
> > >      [    0.096428]  __platform_driver_register+0x24/0x30
> > >      [    0.096486]  tegra194_cbb_init+0x24/0x30
> > >      [    0.096540]  do_one_initcall+0xdc/0x250
> > >      [    0.096608]  do_initcall_level+0x9c/0xd0
> > >      [    0.096660]  do_initcalls+0x54/0x94
> > >      [    0.096706]  do_basic_setup+0x20/0x2c
> > >      [    0.096753]  kernel_init_freeable+0xc8/0x154
> > >      [    0.096807]  kernel_init+0x20/0x1a0
> > >      [    0.096851]  ret_from_fork+0x10/0x20
> > > 
> > > So, return null in lookup_or_create_module_kobject() if module_kset is null.
> > > Existing callers handle null already.
> > > 
> > > Fixes: f30c53a873d0 ("MODULES: add the module name for built in kernel drivers")
> > 
> > This isn't a bugfix.
> 
> I'll drop it in the next version.
> 
> > > Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> > > Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> > > Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> > > ---
> > > This bug is triggered by the next patch on arm64 defconfig: tegra194-cbb tries
> > > to register from a pure_initcall, and with the next patch adding mod_name, this
> > > null deref is hit.
> > 
> > So this isn't a bug, it's a "don't do that" type of thing :)
> > 
> > > ---
> > >  kernel/params.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/kernel/params.c b/kernel/params.c
> > > index 74d620bc2521..881c7328c059 100644
> > > --- a/kernel/params.c
> > > +++ b/kernel/params.c
> > > @@ -752,6 +752,9 @@ lookup_or_create_module_kobject(const char *name)
> > >  	struct kobject *kobj;
> > >  	int err;
> > >  
> > > +	if (!module_kset)
> > > +		return NULL;
> > 
> > Are you sure that making this change is going to be ok?
> > mod_sysfs_init() should have been called first as the module has to be
> > created before it can be looked up.
> > 
> > As you are wanting "built in" drivers to show up here, you are going to
> > beat the call to param_sysfs_init(), so don't do that.  Make sure that
> > the drivers are NOT called before then.
> 
> The reason lookup_or_create_module_kobject() can be reached with module_kset == NULL
> is that some platform drivers register before subsys_initcall: tegra194_cbb and
> tegra234_cbb at pure_initcall, plus roughly 375 others at core_initcall/arch_initcall
> (208 arch, 154 core, plus 2 pure and 13 _sync variants). These are dominated by
> pinctrl, clk, interconnect, gpio, and mailbox drivers across six SoC vendor trees
> (Qualcomm, MediaTek, Freescale, Samsung, Tegra, HiSilicon).

That's not good, everyone wants to be first.  It's amazing it works at
all sometimes...

> Given that, three ways forward:
> 
>   1. Move module_kset creation out of param_sysfs_init() (currently
>      subsys_initcall) and call it directly from do_basic_setup()
>      before do_initcalls(). This is the cleanest fix from a
>      correctness angle: every initcall level sees a live
>      module_kset. But it touches init/main.c and kernel/params.c,
>      crosses two subsystem trees. I haven't fully audited
>      dependencies at do_basic_setup() time.

That's one way, OR dynamically create the kset the first time it is
asked for.

>   2. Demote the ~377 early-initcall platform drivers to
>      subsys_initcall or later. Impractical at scale given coordination
>      across six vendor trees, and many of these levels seem to be
>      architecturally required.

Ick, yeah, that is sure to be a nightmare as there will be regressions.

>   3. (This patch) Guard lookup_or_create_module_kobject() against
>      NULL module_kset. Drivers registered before subsys_initcall
>      don't get the /sys/.../module symlink, but they don't get it
>      today either (drv->mod_name is NULL pre-patch, so the
>      else-if (drv->mod_name) branch in module_add_driver() isn't
>      taken). Verified on arm64: /sys/module/tegra194_cbb/ does not
>      exist on a booted defconfig with or without my series. The
>      guard preserves that exact state while letting the
>      device_initcall majority get their symlinks as designed.

THat's going to confuse people as to why some have the link and others
do not.  How about moving it earlier OR creating it dynamically when
first needed?

thanks,

greg k-h

