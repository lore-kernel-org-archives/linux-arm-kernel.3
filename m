Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA346F8FA8F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 15:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3We8v/cWP2gtcTXE3xZoQ0CkfHEqYxB8F5njBD+WhU=; b=K9yrwtcHGxGiYu7JJBvfjRHF68
	3DeK1zwJ3VjQu2f0CTGfAwDP+1VOvdFapxZRUVxC3Ni6Ny2wggjcBmx1Uz9BMthdrTAvrJG0tWePU
	MifWKPDYZqhBYxrD96nrCVdGtqg8mWLlfxVG8fXfAVuTfroU41Vaf5CiHJuOJ8CHz0tEYKS63dt2A
	damRk0PMFUFJawWL8Ido16Fb8/caxLHgAMkgdafEPb9mP3TiQ7+Kda3tmXDYLPr92M08fxlmBIasr
	jHxZRV5w41qgfL9MXXXeZKaGssCHz7ZGnLDqGevFARWhwiwlp981TK/YM7hHUucFSzz7AdDV7J5t1
	IfscVCXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCa2-00000008nkl-09gd;
	Tue, 21 Apr 2026 15:00:02 +0000
Received: from jpms-ob01.noc.sony.co.jp ([2001:cf8:ace:41::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCZz-00000008njg-1F4g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 15:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1776783599; x=1808319599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x3We8v/cWP2gtcTXE3xZoQ0CkfHEqYxB8F5njBD+WhU=;
  b=vk1R7ZYbA7tTYgDgrZI/gZHiqrJqn5r5blKHeWiAlUJ/BtdPQF8jkUEt
   iV14LPLCMpZ0c4hOChUcydccWXSuREQZ8Dc1QEnYzYBazLIkoLPNMWl/g
   6q8nFrG+xrIavVk/zzAozPQkUyhEnbLfvzvfQSkj1cjBopVML2g4AXB/3
   MmIBwGeS8tTnmvJy80OU2Tgk5s64A8iaDVHQLooceKadP0QZMNpt2YTIR
   pI0XOcgDT62IDefy+mMvLo40TYCrRIN9GnDFfV0PcfW8nnIFivFGd4Bzi
   KV25QM1TWO88+4/3Q04tSSPb7eixr4G9ms0VeWhnQdmW/XuNjGCWQ2lLR
   A==;
X-CSE-ConnectionGUID: 7YcWXDMFSr2vGakNyQmKZw==
X-CSE-MsgGUID: CA9mzlDuRueJWUWadCW0/A==
Received: from unknown (HELO jpmta-ob02.noc.sony.co.jp) ([IPv6:2001:cf8:0:6e7::7])
  by jpms-ob01.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 23:59:52 +0900
X-CSE-ConnectionGUID: 3RyYrMSERUKfI0QHkYxSQQ==
X-CSE-MsgGUID: 6ScaAiufTta8VQMfoRcw9g==
X-IronPort-AV: E=Sophos;i="6.23,191,1770562800"; 
   d="scan'208";a="603084691"
Received: from unknown (HELO JPC00244420) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 23:59:53 +0900
Date: Tue, 21 Apr 2026 23:59:51 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Message-ID: <aeeQ5x1uMKT6cyxp@JPC00244420>
References: <20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com>
 <20260421-acpi_mod_name-v2-1-e73f9310dad3@sony.com>
 <2026042126-majesty-skyline-b76f@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026042126-majesty-skyline-b76f@gregkh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_075959_583885_4560D110 
X-CRM114-Status: GOOD (  29.41  )
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

Hi Greg,

Thanks for the quick feedback!

On Tue, Apr 21, 2026 at 08:27:10AM +0200, Greg Kroah-Hartman wrote:
> On Tue, Apr 21, 2026 at 03:02:34PM +0900, Shashank Balaji wrote:
> > module_kset is initialized in a subsys_initcall. If a built-in driver tries to
> > register before subsys_initcall with its struct device_driver's mod_name set,
> > then a null module_kset is dereferenced via this call trace:
> > 
> >      [    0.095865] Call trace:
> >      [    0.095999]  _raw_spin_lock+0x4c/0x6c (P)
> >      [    0.096150]  kset_find_obj+0x24/0x104
> >      [    0.096209]  lookup_or_create_module_kobject+0x2c/0xd8
> >      [    0.096274]  module_add_driver+0xd4/0x138
> >      [    0.096328]  bus_add_driver+0x16c/0x268
> >      [    0.096380]  driver_register+0x68/0x100
> >      [    0.096428]  __platform_driver_register+0x24/0x30
> >      [    0.096486]  tegra194_cbb_init+0x24/0x30
> >      [    0.096540]  do_one_initcall+0xdc/0x250
> >      [    0.096608]  do_initcall_level+0x9c/0xd0
> >      [    0.096660]  do_initcalls+0x54/0x94
> >      [    0.096706]  do_basic_setup+0x20/0x2c
> >      [    0.096753]  kernel_init_freeable+0xc8/0x154
> >      [    0.096807]  kernel_init+0x20/0x1a0
> >      [    0.096851]  ret_from_fork+0x10/0x20
> > 
> > So, return null in lookup_or_create_module_kobject() if module_kset is null.
> > Existing callers handle null already.
> > 
> > Fixes: f30c53a873d0 ("MODULES: add the module name for built in kernel drivers")
> 
> This isn't a bugfix.

I'll drop it in the next version.

> > Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> > Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> > Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> > ---
> > This bug is triggered by the next patch on arm64 defconfig: tegra194-cbb tries
> > to register from a pure_initcall, and with the next patch adding mod_name, this
> > null deref is hit.
> 
> So this isn't a bug, it's a "don't do that" type of thing :)
> 
> > ---
> >  kernel/params.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/kernel/params.c b/kernel/params.c
> > index 74d620bc2521..881c7328c059 100644
> > --- a/kernel/params.c
> > +++ b/kernel/params.c
> > @@ -752,6 +752,9 @@ lookup_or_create_module_kobject(const char *name)
> >  	struct kobject *kobj;
> >  	int err;
> >  
> > +	if (!module_kset)
> > +		return NULL;
> 
> Are you sure that making this change is going to be ok?
> mod_sysfs_init() should have been called first as the module has to be
> created before it can be looked up.
> 
> As you are wanting "built in" drivers to show up here, you are going to
> beat the call to param_sysfs_init(), so don't do that.  Make sure that
> the drivers are NOT called before then.

The reason lookup_or_create_module_kobject() can be reached with module_kset == NULL
is that some platform drivers register before subsys_initcall: tegra194_cbb and
tegra234_cbb at pure_initcall, plus roughly 375 others at core_initcall/arch_initcall
(208 arch, 154 core, plus 2 pure and 13 _sync variants). These are dominated by
pinctrl, clk, interconnect, gpio, and mailbox drivers across six SoC vendor trees
(Qualcomm, MediaTek, Freescale, Samsung, Tegra, HiSilicon).

Given that, three ways forward:

  1. Move module_kset creation out of param_sysfs_init() (currently
     subsys_initcall) and call it directly from do_basic_setup()
     before do_initcalls(). This is the cleanest fix from a
     correctness angle: every initcall level sees a live
     module_kset. But it touches init/main.c and kernel/params.c,
     crosses two subsystem trees. I haven't fully audited
     dependencies at do_basic_setup() time.

  2. Demote the ~377 early-initcall platform drivers to
     subsys_initcall or later. Impractical at scale given coordination
     across six vendor trees, and many of these levels seem to be
     architecturally required.

  3. (This patch) Guard lookup_or_create_module_kobject() against
     NULL module_kset. Drivers registered before subsys_initcall
     don't get the /sys/.../module symlink, but they don't get it
     today either (drv->mod_name is NULL pre-patch, so the
     else-if (drv->mod_name) branch in module_add_driver() isn't
     taken). Verified on arm64: /sys/module/tegra194_cbb/ does not
     exist on a booted defconfig with or without my series. The
     guard preserves that exact state while letting the
     device_initcall majority get their symlinks as designed.

I went with option 3 because it preserves observable behaviour
everywhere and keeps the series scoped to driver-core. If you'd
rather I do option 1 instead, I'm happy to.

Thanks,
Shashank

