Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A052F327AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 06:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ojy28YJwrhcx+bFCq7U6klSSrqoU7K0JGacrHSbPYm8=; b=e+o1IWYTigDM6DR89VZxcKOeD8
	el0bJ7JjkcWKhNwRyCll5l4GUS0wuHC90dj3RGRmdy2G2CzR3Q6D/bISalyDkci/vjsj16v2TbxOJ
	gaUU+a5h+54RwPJ/oonvP+JbtAIoVNbVZBdAlBdUWe3OVyeBExSFOyvjgLuxTidtPCJfKmOXWhVhz
	GQQfUc8Y0fLwiIP+TCinVGcfwGkDvLTagwt2X+WG3fl6b9TTpJh5thYviZXmvv8Ftm759wm0rK+l5
	avhWUj0RHlN9aIws6l8rlxB2s95YJHGjQNlasMoVkY0h+O4qEJ57gXbABEujCToEMXY/8H+pBtFdP
	4ht6I3pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4aH-000000086Hs-2BIC;
	Tue, 21 Apr 2026 06:27:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4aG-000000086Hc-2Cx4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 06:27:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C5201600CB;
	Tue, 21 Apr 2026 06:27:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3233C2BCB0;
	Tue, 21 Apr 2026 06:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776752863;
	bh=4eupPEnuCHB6LuckiJOiJOQzxqwHwLNuxVXCIGObT1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SD69JUci2FH7D35AkkZmi01co/pGeljYAKeoRAefj09FyjnkRw2Iay/kXXkt7RGSB
	 vSqz6l+kr8eqInZO4PSYOJNRO4ljaouIOGue6Lt0eTSw2bZIKusCmEKZDUul2kwbog
	 NjoEq6kLMxl8MfCvauT/v/Pl0EZqYKMDjmPIXQDg=
Date: Tue, 21 Apr 2026 08:27:10 +0200
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
Message-ID: <2026042126-majesty-skyline-b76f@gregkh>
References: <20260421-acpi_mod_name-v2-0-e73f9310dad3@sony.com>
 <20260421-acpi_mod_name-v2-1-e73f9310dad3@sony.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260421-acpi_mod_name-v2-1-e73f9310dad3@sony.com>
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

On Tue, Apr 21, 2026 at 03:02:34PM +0900, Shashank Balaji wrote:
> module_kset is initialized in a subsys_initcall. If a built-in driver tries to
> register before subsys_initcall with its struct device_driver's mod_name set,
> then a null module_kset is dereferenced via this call trace:
> 
>      [    0.095865] Call trace:
>      [    0.095999]  _raw_spin_lock+0x4c/0x6c (P)
>      [    0.096150]  kset_find_obj+0x24/0x104
>      [    0.096209]  lookup_or_create_module_kobject+0x2c/0xd8
>      [    0.096274]  module_add_driver+0xd4/0x138
>      [    0.096328]  bus_add_driver+0x16c/0x268
>      [    0.096380]  driver_register+0x68/0x100
>      [    0.096428]  __platform_driver_register+0x24/0x30
>      [    0.096486]  tegra194_cbb_init+0x24/0x30
>      [    0.096540]  do_one_initcall+0xdc/0x250
>      [    0.096608]  do_initcall_level+0x9c/0xd0
>      [    0.096660]  do_initcalls+0x54/0x94
>      [    0.096706]  do_basic_setup+0x20/0x2c
>      [    0.096753]  kernel_init_freeable+0xc8/0x154
>      [    0.096807]  kernel_init+0x20/0x1a0
>      [    0.096851]  ret_from_fork+0x10/0x20
> 
> So, return null in lookup_or_create_module_kobject() if module_kset is null.
> Existing callers handle null already.
> 
> Fixes: f30c53a873d0 ("MODULES: add the module name for built in kernel drivers")

This isn't a bugfix.

> Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> ---
> This bug is triggered by the next patch on arm64 defconfig: tegra194-cbb tries
> to register from a pure_initcall, and with the next patch adding mod_name, this
> null deref is hit.

So this isn't a bug, it's a "don't do that" type of thing :)

> ---
>  kernel/params.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/kernel/params.c b/kernel/params.c
> index 74d620bc2521..881c7328c059 100644
> --- a/kernel/params.c
> +++ b/kernel/params.c
> @@ -752,6 +752,9 @@ lookup_or_create_module_kobject(const char *name)
>  	struct kobject *kobj;
>  	int err;
>  
> +	if (!module_kset)
> +		return NULL;

Are you sure that making this change is going to be ok?
mod_sysfs_init() should have been called first as the module has to be
created before it can be looked up.

As you are wanting "built in" drivers to show up here, you are going to
beat the call to param_sysfs_init(), so don't do that.  Make sure that
the drivers are NOT called before then.

thanks,

greg k-h

