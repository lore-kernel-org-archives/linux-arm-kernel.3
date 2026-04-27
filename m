Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601BAFF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/PLRiBW00p5O1VDphKlLgh1MOoUZzzWXnfreqP+S8Mw=; b=i5Hd5wWra1r59dBPsrIKDsiNWo
	3NgA5MyHrqI1KPqvsLJdVdQ/wTMLaqpo2UZ5dWLwRoVRubb3RI6fschVnHoucHDFj3aLqCGeIkrhQ
	DKApl4IsSqnnV5rqrW6V5CyOUaf4ckVubL1jCgCvrUW48S2+O8uEl4ITTlo2bpV64zyL2kTh7B4gv
	baCW3vrXPjam/zmD8wErHih86IfE+3/XNhbpP3e+XThfdWxGlA+0+qGlE1BsAV2AyvuVFVky1pUCV
	dsOPlIC4YEz9ubXNDYCEWn9ZtRRyb4z3cVVolJm83ingf/B9s5sDOKPEQNROUMb8OMrz188eE0W0j
	O6yRqvNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJWx-0000000Gj5Q-06sO;
	Mon, 27 Apr 2026 10:49:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJWu-0000000Gj3o-2jls
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:49:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87BBB1684;
	Mon, 27 Apr 2026 03:49:24 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BD633F62B;
	Mon, 27 Apr 2026 03:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777286970; bh=1NDqOAekPri/m4O8impoBtCDJFr+DiW4Ny0SINZ8vm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HybofPmElUWxhJiHsWQ0t8uWuAGLg77UZdYEmqbP0Vvm0a9mwb+0sCN01sSw/7Ah2
	 7Q409dAH+foOqVQ2Lo3Gun2f++NmwGlOfy5rXY9PrLwwi/GgeNHzZv1y9+pIPJxEaG
	 rNrCwutKSV6vMlGLmesc0H4+GCSPYVfFvnAbT2ko=
Date: Mon, 27 Apr 2026 11:49:14 +0100
From: Leo Yan <leo.yan@arm.com>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
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
	Rahul Bukte <rahul.bukte@sony.com>, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>, linux-modules@vger.kernel.org
Subject: Re: [PATCH v4 2/4] coresight: pass THIS_MODULE implicitly through a
 macro
Message-ID: <20260427104914.GG929984@e132581.arm.com>
References: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
 <20260427-acpi_mod_name-v4-2-22b42240c9bf@sony.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427-acpi_mod_name-v4-2-22b42240c9bf@sony.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_034932_851339_E3D01049 
X-CRM114-Status: GOOD (  10.35  )
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

Hi Shashank,

On Mon, Apr 27, 2026 at 11:41:22AM +0900, Shashank Balaji wrote:

[...]

> --- a/drivers/hwtracing/coresight/coresight-core.c
> +++ b/drivers/hwtracing/coresight/coresight-core.c
> @@ -1694,7 +1694,7 @@ static void __exit coresight_exit(void)
>  module_init(coresight_init);
>  module_exit(coresight_exit);
>  
> -int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
> +int __coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
>  			  struct platform_driver *pdev_drv, struct module *owner)
>  {
>  	int ret;
> @@ -1713,7 +1713,7 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
>  	amba_driver_unregister(amba_drv);
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(coresight_init_driver);
> +EXPORT_SYMBOL_GPL(__coresight_init_driver);

For consistency, we usually use prefix "__" for internal functions.

Could you rename this function as:

  int coresight_init_driver_with_owner(..., struct module *owner);

> +#define coresight_init_driver(drv, amba_drv, pdev_drv) \
> +	__coresight_init_driver(drv, amba_drv, pdev_drv, THIS_MODULE)
> +int __coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
>  			  struct platform_driver *pdev_drv, struct module *owner);

Please first function declaration, then followed by the macro to
define coresight_init_driver().

With above changes:

Reviewed-by: Leo Yan <leo.yan@arm.com>

