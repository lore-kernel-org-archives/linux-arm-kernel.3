Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B22CD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 13:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCAAJwp1uN+g2GJ/FoC38hHQLXrzoMaWan6fUELQijA=; b=gFns1VoQLJUycW6pFZ+vkThdN7
	8u85kbGTW6d4fIVb4ppfIpvPtOteVe5x0VqUh1L2/vBuhSn+C0kUKdHjnf9SqjlqzHLufYdFOHog2
	hwhLuDYF37BM2obv0KMIFV3CL0QMLU4IKCzR+rQ684QltoeZZERl7Vu4Yicw+n2X86wtOspKeeR5Y
	mh5KeNz0vmqK/Og9/mCLirm0Yq88IZky4/nZghTI0jJo/ehXaQ3hU1KStxzDUx4j2XZ7T17HcDZjN
	K8dQmObmZAbxJ4j7f9htBFpDB2KP4uy5mCVXbTY3ZmRmKcXKzqoELUmfqtfJwYEAY1KaD0Z2sX3p+
	SnhYmfhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnE8-0000000GraJ-0KjF;
	Tue, 12 May 2026 13:32:48 +0000
Received: from jpms-ob01.noc.sony.co.jp ([2001:cf8:ace:41::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnE3-0000000GrYc-2aWd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 13:32:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1778592765; x=1810128765;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=zCAAJwp1uN+g2GJ/FoC38hHQLXrzoMaWan6fUELQijA=;
  b=ClbpscAjf6SZqjCISMLFFiQe+GwcZ9CObSPOuSVn8FiNPIzPD2dU0bdr
   b1GXs0RP3XayRMAE5QtSeRAIkbHoK4VnEh2OlnkoMj193y77/ND34mhgI
   LohLMrC9Fsv464Zc5Y09go8VuFDtEL66YcBqZr2DPnb+8ZLpiZl3sTeCp
   Z2UgKLpyTeVk26XEtfvohC2rhMf4iYiQXE611masYYjQSdF/mQBb9ZHdJ
   qalApuKDFzCRrPffyW3e0HU4ekHk766cEQ3bEz8YY1TVxlJUj1J2ah7ou
   KWHKHL5mA2IcQIktQjPDJZnXm65FsJOAcyPv4/GSWxN93WDHWNSDFUSey
   g==;
X-CSE-ConnectionGUID: v5aief4qRhSwKKiCGThw8Q==
X-CSE-MsgGUID: JOy2P7FWSlG30vV2ZCQhsA==
Received: from unknown (HELO jpmta-ob1.noc.sony.co.jp) ([IPv6:2001:cf8:0:6e7::6])
  by jpms-ob01.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 22:32:39 +0900
X-CSE-ConnectionGUID: mNNKHimMRcquTd1VVSnX2g==
X-CSE-MsgGUID: Xv8Ksh8fRDO0yoXAS/EB/g==
X-IronPort-AV: E=Sophos;i="6.23,231,1770562800"; 
   d="scan'208";a="637606608"
Received: from unknown (HELO JPC00244420) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob1.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 22:32:37 +0900
Date: Tue, 12 May 2026 22:32:37 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
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
Message-ID: <agMr9Vo3nYu623Y-@JPC00244420>
References: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
 <20260427-acpi_mod_name-v4-1-22b42240c9bf@sony.com>
 <DI3Z28IZZOT9.349TTWNN9VDMB@garyguo.net>
 <afABOMT_s9DvF6NY@JPC00244420>
 <DI4QQA6EGIA1.N8WRFWVKG91S@garyguo.net>
 <afCxHUrjr3Z22U6V@JPC00244420>
 <agKMcA7a_UqMua5V@JPC00244420>
 <40c3aab2-b5cf-4297-9b14-3ccfea377c83@nvidia.com>
 <0d9e5a78-948e-42da-9d37-78cc2a700cd6@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d9e5a78-948e-42da-9d37-78cc2a700cd6@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_063243_874233_EEA663A7 
X-CRM114-Status: GOOD (  34.63  )
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

On Tue, May 12, 2026 at 05:44:40PM +0530, Sumit Gupta wrote:
> 
> On 12/05/26 14:25, Jon Hunter wrote:
> > Hi Shashank,
> > 
> > On 12/05/2026 03:12, Shashank Balaji wrote:
> > 
> > ...
> > 
> > > > Hi Thierry and Jonathan,
> > > > 
> > > > You can find the context for this email in this patch:
> > > > https://lore.kernel.org/all/20260427-acpi_mod_name-v4-1-22b42240c9bf@sony.com/
> > > > 
> > > > 
> > > > TL;DR: tegra194_cbb_driver and tegra234_cbb_driver are the only drivers
> > > > registering themselves as early as in a pure_initcall. This is a
> > > > problem
> > > > on two fronts:
> > > > 1. Philosophical: As Gary pointed out, pure_initcalls are
> > > > intended to purely
> > > > initialize variables that couldn't be statically initialized. But these
> > > > are doing driver registrations.
> > > > 2. module_kset not initialized at pure_initcall stage: This is
> > > > needed to
> > > > set the module sysfs symlink. Since module_kset is not alive yet during
> > > > pure_initcalls, registering these drivers panics the kernel.
> > 
> > Where exactly is this panic seen? Ie. why are we not seeing this?

The panic happens as a result of this patch series. This series aims to
set .mod_name of struct device_driver for platform drivers. So that, for
built-in drivers, their module sysfs symlink can be created on the basis
of .modname. We essentially want to link a platform driver to its
module. This happens naturally if the driver is built as a loadable
module, but for this to happen for built-in modules, .mod_name needs to be set.

To go from .mod_name to the module sysfs symlink, the module_kset kset
needs to be initialized. This currently happens in a subsys_initcall.
These tegra cbb drivers register themselves in a pure_initcall, i.e.
before subsys_initcall, leading to a null dereference of module_kset.

To fix this, we want to move the module_kset creation to pure_initcall,
and tegra cbb driver registration to core_initcall, so after
pure_initcall.

> > > > We would like to do the tegra cbb driver registration in a
> > > > core_initcall
> > > > (or some later initcall works too), and move module_kset initialization
> > > > to a pure_initcall. Like this:
> > > > 
> > > > diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c
> > > > b/drivers/soc/tegra/cbb/tegra194-cbb.c
> > > > index ab75d50cc85c..2f69e104c838 100644
> > > > --- a/drivers/soc/tegra/cbb/tegra194-cbb.c
> > > > +++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
> > > > @@ -2342,7 +2342,7 @@ static int __init tegra194_cbb_init(void)
> > > >   {
> > > >          return platform_driver_register(&tegra194_cbb_driver);
> > > >   }
> > > > -pure_initcall(tegra194_cbb_init);
> > > > +core_initcall(tegra194_cbb_init);
> > > > 
> > > >   static void __exit tegra194_cbb_exit(void)
> > > >   {
> > > > diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c
> > > > b/drivers/soc/tegra/cbb/tegra234-cbb.c
> > > > index fb26f085f691..785072fa4e85 100644
> > > > --- a/drivers/soc/tegra/cbb/tegra234-cbb.c
> > > > +++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
> > > > @@ -1774,7 +1774,7 @@ static int __init tegra234_cbb_init(void)
> > > >   {
> > > >          return platform_driver_register(&tegra234_cbb_driver);
> > > >   }
> > > > -pure_initcall(tegra234_cbb_init);
> > > > +core_initcall(tegra234_cbb_init);
> > > > 
> > > >   static void __exit tegra234_cbb_exit(void)
> > > >   {
> > > > 
> > > > Would this work?
> > 
> > 
> > I am adding Sumit who has been doing a lot of the Tegra CBB driver work.
> > 
> > Sumit, any concerns here? We could run this change through our internal
> > testing to confirm.
> > 
> > Jon
> > 
> 
> CBB driver can be switched to core_initcall.
> pure_initcall was originally added so its IRQ handler is registered
> before other Tegra drivers to catch and print any bad MMIO error
> during their probe.
> Looked at the current state of Tegra drivers:
>  - The other early Tegra drivers (PMC, fuse, flowctrl, ARI) all run at
>    early_initcall, before either pure_ or core_initcall.
>  - The only other Tegra core_initcall is tegra-hsp, and link order keeps
>    CBB ahead of it (drivers/soc/ links before drivers/mailbox/).
> 
> Acked-by: Sumit Gupta <sumitg@nvidia.com>

Thanks, Sumit and Jon!

