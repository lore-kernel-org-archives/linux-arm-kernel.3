Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE41CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 03:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PI3FmT1/Yi4DE7+lMDULD4fdLB7X6k2BakvtD3RsQA=; b=IUGUYg7ef2vtVdWnTPzo+x7IF2
	7JN3ThtnZt0mSqu5XqnNWB5dl7E5stdRU6bWB4irMhrQroflJvW4lyCTRWya6RTGRG4oCcB0gZjID
	rxuoFIU6V4NipyiZW3kaas3BB0A/eTRlqruTkINMjQt87TYivC0XsNqg++8qppbtl7oo+l6G7i6fJ
	thZu6JZ5ydXlz1QGleINBifDwmUxgjLkgefCtfL4bqykDFWePHMAMcvAybje7oxG1plGqBJ6RGv6x
	VxSu0nNghH2pgdQp+PAa+BEHOJzblSKtT1vB3Lpu5u+81kKZwD8aoa/qpXm0CaEDzeA2PcgdNdYgi
	ZeU1cWNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQcyS-0000000CbVP-2JEn;
	Sat, 23 May 2026 03:24:28 +0000
Received: from jpms-ob02.noc.sony.co.jp ([2001:cf8:ace:41::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQcyO-0000000CbUO-2vmP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 03:24:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1779506664; x=1811042664;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/PI3FmT1/Yi4DE7+lMDULD4fdLB7X6k2BakvtD3RsQA=;
  b=voYpEEimQ1v2g3+i1Wa8Uj4SEh98VRFVIWfAjRv59ZOJpyAFQhZbw+JN
   azS9MoNkFT4Wh9DYqZveL77xNvSrnXWqsyW86bdFoBF+hwi62iJSvZaU+
   40hVCZt0z8Mdth6NFyxEhW3L8BFQiLxxqnE4Nk0ij1A8LTM1r/SypxiEB
   EQbZKSdf4y5Oa2XnpGZ+8MqnPeBTPTs3zlChdupPca7i7a3r9Vq3+f2LD
   HN35eLkG9mRL0f6xVrosVR6C12TyxZnZ6PBCHcnfpvLFTsZMnJ2uKhohF
   fv4ssRYbbp1DJ4L9aINQ+++rulELU2FUclxbiO9XpQBpncMpNcFKC8Rrs
   g==;
X-CSE-ConnectionGUID: MjBdcViTQqmEpacj7ulumQ==
X-CSE-MsgGUID: 85d+qs/GS4a4KdNEPoGhrw==
Received: from unknown (HELO jpmta-ob1.noc.sony.co.jp) ([IPv6:2001:cf8:0:6e7::6])
  by jpms-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 12:24:19 +0900
X-CSE-ConnectionGUID: O/SdfXAXTci1J18nuI/Q/A==
X-CSE-MsgGUID: JQfr130jQ/m+0PdF94fS/g==
X-IronPort-AV: E=Sophos;i="6.24,163,1774278000"; 
   d="scan'208";a="639353636"
Received: from unknown (HELO JPC00244420) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob1.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 12:24:18 +0900
Date: Sat, 23 May 2026 12:24:18 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rahul Bukte <rahul.bukte@sony.com>, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>, linux-modules@vger.kernel.org,
	linux-tegra@vger.kernel.org, Sumit Gupta <sumitg@nvidia.com>
Subject: Re: [PATCH v5 2/4] kernel: param: initialize module_kset in a
 pure_initcall
Message-ID: <ahEd4iC-2hqUbMy3@JPC00244420>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
 <20260518-acpi_mod_name-v5-2-705ccc430885@sony.com>
 <a0b17be8-f7dd-4d05-bc6f-28b32d0b0785@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0b17be8-f7dd-4d05-bc6f-28b32d0b0785@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_202424_968927_DD73027C 
X-CRM114-Status: GOOD (  39.75  )
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

Hi Petr,

Thanks for the feedback!

On Fri, May 22, 2026 at 03:06:04PM +0200, Petr Pavlu wrote:
> On 5/18/26 12:19 PM, Shashank Balaji wrote:
> > Commit "driver core: platform: set mod_name in driver registration" will set
> > struct device_driver's mod_name member for platform driver registration. For a
> > driver to be registered with its mod_name set, module_kset needs to be
> > initialized, which currently happens in a subsys_initcall in param_sysfs_init().
> > The tegra cbb drivers register themselves before module_kset init, in a
> > core_initcall. This works currently because lookup_or_create_module_kobject(),
> > which dereferences module_kset via kset_find_obj(), is not called if mod_name
> > is not set, which is the case now.
> > 
> > So in preparation for the commit "driver core: platform: set mod_name in driver registration",
> > move module_kset init to pure_initcall level, ensuring it happens before tegra
> > cbb driver registration.
> > 
> > Suggested-by: Gary Guo <gary@garyguo.net>
> > Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> > Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> > Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> > ---
> > Patch 4 depends on this patch
> > ---
> >  kernel/params.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/kernel/params.c b/kernel/params.c
> > index 74d620bc2521..ac088d4b09a9 100644
> > --- a/kernel/params.c
> > +++ b/kernel/params.c
> > @@ -957,7 +957,7 @@ static int __init param_sysfs_init(void)
> >  
> >  	return 0;
> >  }
> > -subsys_initcall(param_sysfs_init);
> > +pure_initcall(param_sysfs_init);
> >  
> >  /*
> >   * param_sysfs_builtin_init - add sysfs version and parameter
> > 
> 
> The change looks ok to me functionality-wise. Sysfs is initialized
> earlier in do_basic_setup() and other code, such as classes_init(),
> calls kset_create_and_add() similarly early.
> 
> One minor issue is that pure_initcall() was originally intended for
> static variable initialization. The file include/linux/init.h says:
> 
> | /*
> |  * A "pure" initcall has no dependencies on anything else, and purely
> |  * initializes variables that couldn't be statically initialized.
> |  *
> |  * This only exists for built-in code, not for modules.
> |  * Keep main.c:initcall_level_names[] in sync.
> |  */
> | #define pure_initcall(fn)		__define_initcall(fn, 0)
> 
> The patch stretches the intended use of pure_initcall() somewhat in this
> regard. However, other code already appears to do the same, so I guess
> this is ok.

Ah yeah, I thought of this too, but it seems like everyone else is doing
it. Linus introduced pure_initcall in b3438f8266cb
("Add "pure_initcall" for static variable initialization") with the
comment, and he introduced another user of it in 140d0b2108fa
("Do 'shm_init_ns()' in an early pure_initcall") which already stretches
the intended use as per the comment.

Given that it's just being used for "run me before core_initcall;
early_initcall is too early for me" without any "pureness" requirements, I
suppose the comment is due for a revision?

> Additionally, I think it would be good to update the comment preceding
> param_sysfs_init(). It currently says:
> 
> | /*
> |  * param_sysfs_init - create "module" kset
> |  *
> |  * This must be done before the initramfs is unpacked and
> |  * request_module() thus becomes possible, because otherwise the
> |  * module load would fail in mod_sysfs_init.
> |  */
> 
> I suggest changing it to something like follows:
> 
> This must be done before any driver registration so that when a driver comes
> from a built-in module, the driver core can add the module under /sys/module
> and create the associated driver symlinks.

Thanks for catching this! I'll add it in the next revision.

Thanks,
Shashank

