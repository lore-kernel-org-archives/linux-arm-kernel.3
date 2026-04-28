Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA9AFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 00:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OLmIYYgccj61Z7Y1BhmUJwFYcoGweKAe0uPk0qWtjNw=; b=MRNCiptVS78VLrEZUtYEEy/1Z7
	JjUKTnCwIpX0eBxE/6F5kHDLDQUrdWFR+01ydZiJVnOrFfpwnUzgzrEeryiPNc9K1KOOMa+zinU/3
	aA7LxQcLa8A4y9I6SkErSOT/9YqwKM7bKYfxTFp2b095jsW2VLiY0fZBW+tWdv+T5juGK9YIE9Tnb
	OrSYOp2+891K0XeZesqaPhEDKr1hlCHTCYNZ7XLQnYjOnjdCSzC0dki2V/juamDjVTMq1hMwvFvoM
	JIPMuguIGcLsdvNOJwrhK3Z/b0Kdre+dLPqrIt+oD+lo6/P+GX2VBz9mc3a9WZLjhhvz/mtdMnQbJ
	/FYiNGRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHWS2-00000000Lcz-0P31;
	Tue, 28 Apr 2026 00:37:22 +0000
Received: from jpms-ob02-os7.noc.sony.co.jp ([2001:cf8:acf:41::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHWRz-00000000LcU-2CzR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 00:37:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1777336640; x=1808872640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OLmIYYgccj61Z7Y1BhmUJwFYcoGweKAe0uPk0qWtjNw=;
  b=Bmm98cf37N+vDONjpat02pIPkmy78BO0qI7guRlxjoMaq71XmPJC5evk
   iJxLjm1+lOq9l6XD/WNaCvgJq69ttOWo8QNaSPhPiDy6wnJp3oM7HMUqI
   UNsiYZiKb7OIKklYT3ZPUwcoP6AY442pCYICdyCbkWa8WfMGXIZ9nppyf
   G/ZplUgerRa74/HusbDcCiv3mAH5xlpQPYUeV5eQxZd+cRPFhd8NzFdID
   ZZf7byInIJRtOoJeb8DsIG4Ttx8EG8scKGZS4HyAAvZi3FulwCCGmOwgK
   g3pJfrijaaVEXgX81wTqWgbrlJkHWHinIHcwmTi19oOQo6kGYItYA/UK5
   g==;
X-CSE-ConnectionGUID: 4R1aVkUWRMGium+Af0CblA==
X-CSE-MsgGUID: 25iQS7X6SSGL/sGstQecaA==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob02-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 09:37:16 +0900
X-CSE-ConnectionGUID: /GTJxWLWQ4+ZYLnZbAxakg==
X-CSE-MsgGUID: b3MnIMCXS6Ww/7MJqXJZlA==
X-IronPort-AV: E=Sophos;i="6.23,203,1770562800"; 
   d="scan'208";a="52460544"
Received: from unknown (HELO JPC00244420) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 09:37:16 +0900
Date: Tue, 28 Apr 2026 09:37:12 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: Gary Guo <gary@garyguo.net>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
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
	Tim Bird <tim.bird@sony.com>, linux-modules@vger.kernel.org
Subject: Re: [PATCH v4 1/4] kernel: param: initialize module_kset before
 do_initcalls()
Message-ID: <afABOMT_s9DvF6NY@JPC00244420>
References: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
 <20260427-acpi_mod_name-v4-1-22b42240c9bf@sony.com>
 <DI3Z28IZZOT9.349TTWNN9VDMB@garyguo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI3Z28IZZOT9.349TTWNN9VDMB@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_173719_802152_D607B36D 
X-CRM114-Status: GOOD (  18.08  )
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

Hi Gary,

On Mon, Apr 27, 2026 at 02:29:55PM +0100, Gary Guo wrote:
> On Mon Apr 27, 2026 at 3:41 AM BST, Shashank Balaji wrote:
> > module_kset is initialized in param_sysfs_init(), a subsys_initcall. A number
> > of platform drivers register themselves prior to subsys_initcalls
> > (tegra194_cbb_driver registers in a pure_initcall, for example). With an
> > upcoming patch ("driver core: platform: set mod_name in driver registration")
> > that sets their mod_name in struct device_driver, lookup_or_create_module_kobject()
> > will be called for those drivers, which calls kset_find_obj(module_kset, mod_name).
> > This causes a null deref because module_kset isn't alive yet.
> >
> > Fix this by initializing module_kset in do_basic_setup() before do_initcalls().
> > Modernize the pr_warn while we're at it.
> >
> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Suggested-by: Gary Guo <gary@garyguo.net>
> 
> I didn't suggest this change :)
> 
> I suggested `pure_initcall`, which is just a one line change.

Oops, sorry about the misattribution.

> diff --git a/kernel/params.c b/kernel/params.c
> index 74d620bc2521..ac088d4b09a9 100644
> --- a/kernel/params.c
> +++ b/kernel/params.c
> @@ -957,7 +957,7 @@ static int __init param_sysfs_init(void)
>  
>  	return 0;
>  }
> -subsys_initcall(param_sysfs_init);
> +pure_initcall(param_sysfs_init);
>  
>  /*
>   * param_sysfs_builtin_init - add sysfs version and parameter
> 
> pure_initcall is level 0 so it happens before all other init calls. Does it not
> work?

tegra194_cbb_driver registers itself in a pure_initcall too. We wouldn't
want the ordering of its registration and module_kset init to be link order
dependent.

Thanks,
Shashank

