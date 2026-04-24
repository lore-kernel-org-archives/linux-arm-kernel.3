Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB21FE51EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 09:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3CeKJzlL9L5e/i5qCTLBtx/7vOhA4o/U3gUBdeSPBo=; b=Rb5CE2nTg1OcTBcknu8D8qh4aB
	UPYNGuS8/mhxnr9Orh8VkygEoIooW+dOLj2lTc3baitpzIJFtilXJrlTEtoa/N86542CdYzeSu691
	KvnscgJKSsW7On/duB67uMtY+IczFcQhQT3RlEuLNxZi23MIvtnyeDWSKjF70fZurWr+qBh+7DCLY
	DzROlyPbEunUjFMp96waqL1w9puEV4MgGbcd0lxjnrJRodNQ7wgtJXtRc9DQAWx1KjcXW5IXm5af7
	QgQp4cBIjM903fx4Xyxqg+3BZYnE+/OZfHI094taO2TGx0+11hx+r0E9KFDEMJupWTPTd0y2IZtqK
	LteUTFrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCew-0000000CvEV-29Yq;
	Fri, 24 Apr 2026 09:17:14 +0000
Received: from jpms-ob01-os7.noc.sony.co.jp ([2001:cf8:acf:41::7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCer-0000000CvE8-1PTB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 09:17:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1777022229; x=1808558229;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z3CeKJzlL9L5e/i5qCTLBtx/7vOhA4o/U3gUBdeSPBo=;
  b=dkWNBbycnixpfJfYbZZPR5KKEjcD/aidQNeZooX0U/n/Gk62FMEMlrYL
   V4bXiNFznQXDNCBd2ZjvlGiROTrgQl2qr0snXfkdDnm47y442FaTGFy3P
   QOqSMp+b9DIeoCyH8i8WzMuvIn3k0L4CXryJqIm5Tt1rPY5s5vECHeZqp
   LJy/Wt7ljnudEUKaaNgwzA/pFj4LjV/kYoO7YFcjuurdzxcpiBeUsDJB5
   xabGNDKljurUAV2uAXYrOiLPELOa0ysAj7gSKZwBkOaeNFQSfbvoueoE/
   aHMIdDhjAMXcoQHBVtCEpdsuQTq3yZaLjEP8ngQ5SEgW83a8pDpVH4Gwb
   w==;
X-CSE-ConnectionGUID: ph0z+u3HR9KWm1G7dN5zgA==
X-CSE-MsgGUID: LhrMTgIkRMeTYXQdiGtBRw==
Received: from unknown (HELO jpmta-ob01-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::6])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 18:17:04 +0900
X-CSE-ConnectionGUID: vg91C+9wTYuqSdSyCqL2wA==
X-CSE-MsgGUID: qQfXLFtnQi2pXFgzuVJRUA==
X-IronPort-AV: E=Sophos;i="6.23,196,1770562800"; 
   d="scan'208";a="62774146"
Received: from unknown (HELO JPC00244420) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 18:17:04 +0900
Date: Fri, 24 Apr 2026 18:16:59 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
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
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Rahul Bukte <rahul.bukte@sony.com>, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>
Subject: Re: [PATCH v3 1/4] kernel: param: initialize module_kset on-demand
Message-ID: <aes1C8oJs3Vxnj6y@JPC00244420>
References: <20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com>
 <20260422-acpi_mod_name-v3-1-a184eff9ff6f@sony.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-acpi_mod_name-v3-1-a184eff9ff6f@sony.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_021709_631430_B2C2630E 
X-CRM114-Status: GOOD (  24.38  )
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

On Wed, Apr 22, 2026 at 06:49:03PM +0900, Shashank Balaji wrote:
> module_kset is initialized in param_sysfs_init(), a subsys_initcall. A number
> of platform drivers register themselves prior to subsys_initcalls. With an
> upcoming patch ("driver core: platform: set mod_name in driver registration")
> that sets their mod_name in struct device_driver, lookup_or_create_module()
> will be called for those drivers, which calls kset_find_object(module_kset, mod_name).
> This fails because module_kset isn't alive yet.
> 
> Fix this by initializing module_kset on-demand in lookup_or_create_module().
> Retain the param_sysfs_init() subsys_initcall to ensure that module_kset is
> live after subsys_initcalls (assuming no OOM) for any users who may need it,
> on the off chance that it wasn't init'd on-demand because of no
> pre-subsys_initcall drivers.
> 
> This on-demand path can trigger before subsys_initcall. kset_create_and_add()
> be should safe in those contexts because the allocator is up and running by then,
> no userspace to start uevent helper or listen to a uevent socket.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> 
> ---
> 
> Patch 3 depends on this patch.
> ---
>  kernel/params.c | 41 +++++++++++++++++++++++++----------------
>  1 file changed, 25 insertions(+), 16 deletions(-)
> 
> diff --git a/kernel/params.c b/kernel/params.c
> index 74d620bc2521..f25d6fda159c 100644
> --- a/kernel/params.c
> +++ b/kernel/params.c
> @@ -745,6 +745,26 @@ void module_param_sysfs_remove(struct module *mod)
>  }
>  #endif
>  
> +static int uevent_filter(const struct kobject *kobj)
> +{
> +	const struct kobj_type *ktype = get_ktype(kobj);
> +
> +	if (ktype == &module_ktype)
> +		return 1;
> +	return 0;
> +}
> +
> +static const struct kset_uevent_ops module_uevent_ops = {
> +	.filter = uevent_filter,
> +};
> +
> +static struct kset *__init_or_module ensure_module_kset(void)
> +{
> +	if (!module_kset)
> +		module_kset = kset_create_and_add("module", &module_uevent_ops, NULL);
> +	return module_kset;
> +}

Sashiko's review [1]:

	Could this cause a race condition if multiple threads try to initialize
	module_kset concurrently?

	If asynchronous driver registration triggers this path concurrently before
	subsys_initcalls, is it possible for both threads to see module_kset as NULL:

	Thread 1
	    if (!module_kset)
		module_kset = kset_create_and_add("module", &module_uevent_ops, NULL);
		/* Succeeds and assigns a valid kset */

	Thread 2
	    if (!module_kset)
		module_kset = kset_create_and_add("module", &module_uevent_ops, NULL);
		/* Fails due to duplicate name and returns NULL */

	If Thread 2 overwrites module_kset with NULL after Thread 1 succeeds, wouldn't
	this orphan the kset created by Thread 1 and cause all subsequent callers to
	fail? Does this initialization need synchronization to prevent this?

While all pre-subsys_initcall platform driver registration happens
synchronously now, on the boot cpu, asynchronous registration may be
introduced in the future which would silently break this patch. Either
way, it would be better to be safe with a mutex.

I also noticed another problem with this patch: kset_create_and_add() is
called as long as module_kset is not set. So in the case of OOM, init
will be attempted as long as it succeeds, even beyond subsys_initcall.
While the current behaviour is to init only in subsys_initcall.

Both of these can be fixed with a DO_ONCE_SLEEPABLE-based
initialization.

[1] https://sashiko.dev/#/patchset/20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com?part=1

