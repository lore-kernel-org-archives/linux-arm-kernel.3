Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC635CD4846
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 02:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPXs4xfe9WaD1xaFn0d8PPw/gVNLx2J4xPkxz7s4xqs=; b=koKv+wAdpx3g14YXXtdANKERCO
	mrgwEB6BxfHwvNO6rtq0ZaRI48HPAhL74RfiYrjL+gVWSsHIO16/awW/RlRweuU4mR4XmYuaY3sQr
	sRevN0A4FbTgUtyFE9C+orl3wE80TjTDNB4ITZDcHfytwdHv9wsG3l9eyZvVSR8K1PcEvGADguD9n
	C85Y45y3daytd+Atl4dowsicXu4eMX4nsGh+Lunwv2OTNJ6obSURQAeUpgCs2BdIVMagovmCOKLJQ
	8nD8I+sCrDm1B/43b+yIC/dNokem0jCjrLwC2vnDPix3RETcAE+BB956QZAOzztuXRlb46zuRkR5E
	/0GJhozw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMcbU-0000000FF12-1Xgd;
	Tue, 12 May 2026 02:12:12 +0000
Received: from jpms-ob01.noc.sony.co.jp ([2001:cf8:ace:41::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMcbO-0000000FEyJ-3CYJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 02:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1778551926; x=1810087926;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hPXs4xfe9WaD1xaFn0d8PPw/gVNLx2J4xPkxz7s4xqs=;
  b=oE2Fi+m5Q+0pWOsPWb+xdxt1HZl0nC5EstDQki3ArXqc+q3QtBhOj5Zb
   QB6u2UCOYdMbg9ey9QFr85w19fro2lcc5YyceZD1rmhriVA8rXeFBlBvD
   gePkfhckh9k63abPvM9ubhLgfj9OhMn+sXcpW+Ack52aBo+Roc19ssxHo
   7GhQDAly0G8eu5dr1lW1bQxXTq8X34oRyMopX/OLWajjxalha0CorK6YK
   lqy6NhYsY0g/CrYwph7E8ndJePUEs9Alfw0zy6z3Mv2GEGiDdyPZ9k3Ix
   JMTNU5wbz2DnJGG2bOch4i95ySqE6qv2wFw6ESDPcJM0BoVtXBf4Akyz4
   A==;
X-CSE-ConnectionGUID: mMqO8ayGSh2J6gqMGWGv3w==
X-CSE-MsgGUID: GLqFx78rRh6vl26RqbxuRg==
Received: from unknown (HELO jpmta-ob02.noc.sony.co.jp) ([IPv6:2001:cf8:0:6e7::7])
  by jpms-ob01.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 11:12:01 +0900
X-CSE-ConnectionGUID: E4sXDblmSuKgQZmCqCcvnA==
X-CSE-MsgGUID: Qwx43BEcSKO83PNWSCJ4AQ==
X-IronPort-AV: E=Sophos;i="6.23,230,1770562800"; 
   d="scan'208";a="606139396"
Received: from unknown (HELO JPC00244420) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 11:12:01 +0900
Date: Tue, 12 May 2026 11:12:00 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Richard Cochran <richardcochran@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@arm.com>, Rahul Bukte <rahul.bukte@sony.com>,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>, linux-modules@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 1/4] kernel: param: initialize module_kset before
 do_initcalls()
Message-ID: <agKMcA7a_UqMua5V@JPC00244420>
References: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
 <20260427-acpi_mod_name-v4-1-22b42240c9bf@sony.com>
 <DI3Z28IZZOT9.349TTWNN9VDMB@garyguo.net>
 <afABOMT_s9DvF6NY@JPC00244420>
 <DI4QQA6EGIA1.N8WRFWVKG91S@garyguo.net>
 <afCxHUrjr3Z22U6V@JPC00244420>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afCxHUrjr3Z22U6V@JPC00244420>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_191207_576646_9DDC7BC2 
X-CRM114-Status: GOOD (  37.79  )
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

Hi Thierry, Jonathan,

Just following up on the below, would moving tegra194_cbb_driver and
tegra234_cbb_driver from pure_initcall to core_initcall work for you?

Thanks,
Shashank

On Tue, Apr 28, 2026 at 10:07:41PM +0900, Shashank Balaji wrote:
> Adding Tegra maintainers.
> 
> On Tue, Apr 28, 2026 at 12:10:50PM +0100, Gary Guo wrote:
> > On Tue Apr 28, 2026 at 1:37 AM BST, Shashank Balaji wrote:
> > > Hi Gary,
> > >
> > > On Mon, Apr 27, 2026 at 02:29:55PM +0100, Gary Guo wrote:
> > >> On Mon Apr 27, 2026 at 3:41 AM BST, Shashank Balaji wrote:
> > >> > module_kset is initialized in param_sysfs_init(), a subsys_initcall. A number
> > >> > of platform drivers register themselves prior to subsys_initcalls
> > >> > (tegra194_cbb_driver registers in a pure_initcall, for example). With an
> > >> > upcoming patch ("driver core: platform: set mod_name in driver registration")
> > >> > that sets their mod_name in struct device_driver, lookup_or_create_module_kobject()
> > >> > will be called for those drivers, which calls kset_find_obj(module_kset, mod_name).
> > >> > This causes a null deref because module_kset isn't alive yet.
> > >> >
> > >> > Fix this by initializing module_kset in do_basic_setup() before do_initcalls().
> > >> > Modernize the pr_warn while we're at it.
> > >> >
> > >> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > >> > Suggested-by: Gary Guo <gary@garyguo.net>
> > >> 
> > >> I didn't suggest this change :)
> > >> 
> > >> I suggested `pure_initcall`, which is just a one line change.
> > >
> > > Oops, sorry about the misattribution.
> > >
> > >> diff --git a/kernel/params.c b/kernel/params.c
> > >> index 74d620bc2521..ac088d4b09a9 100644
> > >> --- a/kernel/params.c
> > >> +++ b/kernel/params.c
> > >> @@ -957,7 +957,7 @@ static int __init param_sysfs_init(void)
> > >>  
> > >>  	return 0;
> > >>  }
> > >> -subsys_initcall(param_sysfs_init);
> > >> +pure_initcall(param_sysfs_init);
> > >>  
> > >>  /*
> > >>   * param_sysfs_builtin_init - add sysfs version and parameter
> > >> 
> > >> pure_initcall is level 0 so it happens before all other init calls. Does it not
> > >> work?
> > >
> > > tegra194_cbb_driver registers itself in a pure_initcall too. We wouldn't
> > > want the ordering of its registration and module_kset init to be link order
> > > dependent.
> > 
> > It's the only device driver that does this. And I don't think it's supposed to.
> > 
> > >From documentation:
> > 
> > > A "pure" initcall has no dependencies on anything else, and purely
> > > initializes variables that couldn't be statically initialized.
> > 
> > I understand that given large amount of drivers registering themselves during
> > core/arch_initcall that there might be regressions if all of them are moved, but
> > surely we can demote these two specific tegra driver to core/postcore_initcall?
> > This will still be called earlier than init_machine call which happens during
> > arch_initcall.
> > 
> > Looks like the tegra CBB driver is just doing error logging anyway.
> 
> That's a good point, Gary. Thanks!
> 
> Hi Thierry and Jonathan,
> 
> You can find the context for this email in this patch:
> https://lore.kernel.org/all/20260427-acpi_mod_name-v4-1-22b42240c9bf@sony.com/
> 
> TL;DR: tegra194_cbb_driver and tegra234_cbb_driver are the only drivers
> registering themselves as early as in a pure_initcall. This is a problem
> on two fronts:
> 1. Philosophical: As Gary pointed out, pure_initcalls are intended to purely
> initialize variables that couldn't be statically initialized. But these
> are doing driver registrations.
> 2. module_kset not initialized at pure_initcall stage: This is needed to
> set the module sysfs symlink. Since module_kset is not alive yet during
> pure_initcalls, registering these drivers panics the kernel.
> 
> We would like to do the tegra cbb driver registration in a core_initcall
> (or some later initcall works too), and move module_kset initialization
> to a pure_initcall. Like this:
> 
> diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb/tegra194-cbb.c
> index ab75d50cc85c..2f69e104c838 100644
> --- a/drivers/soc/tegra/cbb/tegra194-cbb.c
> +++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
> @@ -2342,7 +2342,7 @@ static int __init tegra194_cbb_init(void)
>  {
>         return platform_driver_register(&tegra194_cbb_driver);
>  }
> -pure_initcall(tegra194_cbb_init);
> +core_initcall(tegra194_cbb_init);
> 
>  static void __exit tegra194_cbb_exit(void)
>  {
> diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
> index fb26f085f691..785072fa4e85 100644
> --- a/drivers/soc/tegra/cbb/tegra234-cbb.c
> +++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
> @@ -1774,7 +1774,7 @@ static int __init tegra234_cbb_init(void)
>  {
>         return platform_driver_register(&tegra234_cbb_driver);
>  }
> -pure_initcall(tegra234_cbb_init);
> +core_initcall(tegra234_cbb_init);
> 
>  static void __exit tegra234_cbb_exit(void)
>  {
> 
> Would this work?
> 
> Thanks,
> Shashank
> 

