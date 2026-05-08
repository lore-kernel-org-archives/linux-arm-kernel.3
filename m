Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04198CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 13:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4sw1iE8KN76l1QK41GrlFKdgsNt/B2uiso7gWXdfOw=; b=VgVM1wz8zsYN+DdQ7NJzVwRmo3
	LRhqY3NXDCHNKsDln7s6VuPYhC6z1ygXg1cCr+CtVHN9wrWEfMKZBt37YIMe+Ie5KFCclUUWTB3YO
	cLlmV0tjLeALTARlyqdLhiGgHOou3uV1fP+E/UXS5LDDRINH6WxcwTdh3mgluKqAA3KryxNSozfFV
	QwK4U4u9XDTMkNOeynWQN+tXjBskXOZy8daw93oXJyWKM6PWUsgEhkCADPyiOxOJqdduq8UGH5Mm+
	ZXgf4IJ6qZczdHaZ66TMkzuz3ea8OSIUGXzqdyzyn/sZtIpTR5r4kyHC8KSL2bYOzbk0XCTLa+LcL
	qIrHxKlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLSj-00000006a5v-07dB;
	Fri, 08 May 2026 13:41:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLLSf-00000006a52-1uSy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 13:41:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 268E326BC;
	Fri,  8 May 2026 06:41:42 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC9193F836;
	Fri,  8 May 2026 06:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778247707; bh=QmNsu1x3udImOIG51/QbUgV1i4PuYkqOa/OqRyu9jYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YtuBmpKr0TZuvK4M6mGLVWsPHJyGPvari/WZL9N7a5iN6M6C+22Wv5070OxoiTENO
	 rqLOSz8K4YTk/Lw8UQnNbvLfijqmt6BezYbkduh1KFqGpIRr0BvfM5GB4Zbef6OXiP
	 DBig3E/RZyG5BLnpb9HHb9UZJ7vvP/6jpGmNMLTs=
Date: Fri, 8 May 2026 14:41:41 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: David Safford <david.safford@gmail.com>,
	Jonathan McDowell <noodles@earth.li>,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	roberto.sassu@huawei.com, dmitry.kasatkin@gmail.com,
	eric.snowberg@oracle.com, jarkko@kernel.org, jgg@ziepe.ca,
	sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com,
	sebastianene@google.com
Subject: Re: [PATCH] ima: debugging late_initcall_sync measurements
Message-ID: <af3oFfdSMUglZVHa@e129823.arm.com>
References: <9ff4853a8e9932b3a1424f2a6c3347f1723fb5f4.camel@linux.ibm.com>
 <aftIuPwNeuzc9nY1@e129823.arm.com>
 <9d1af933ef218b159762884357d127e3644dfe2c.camel@linux.ibm.com>
 <afwoDgaJxmKwOhXp@e129823.arm.com>
 <f19081f1eda19d6d1ae133d8ec93e779ab1a25e5.camel@linux.ibm.com>
 <afyIbW5cljh5ZvTL@e129823.arm.com>
 <afzwJn+5r15jFxrB@e129823.arm.com>
 <77ad49cca1acf707f4152ed3e2066b2f24c90c16.camel@linux.ibm.com>
 <af2nhZyyNaP7LM3w@e129823.arm.com>
 <2b3782398cc17ce9d355490a0c42ebce9120a9ae.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b3782398cc17ce9d355490a0c42ebce9120a9ae.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_064149_583348_6775BB1E 
X-CRM114-Status: GOOD (  32.19  )
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

> On Fri, 2026-05-08 at 10:06 +0100, Yeoreum Yun wrote:
> 
> > > The kernel selftests caused the measurements between late_initcall and
> > > late_initcall_sync.  After disabling all of the kernel selftests, there weren't
> > > any measurements. Re-enabling the FIPS selftests on PowerVM LPAR resulted in
> > > measurements.  (I didn't try re-enabling any of the other selftests.)
> > > 
> > > CONFIG_FIPS_SIGNATURE_SELFTEST=y
> > > CONFIG_FIPS_SIGNATURE_SELFTEST_RSA=y
> > > CONFIG_FIPS_SIGNATURE_SELFTEST_ECDSA=y
> > 
> > Thanks for shraring this ;)
> > 
> > I found the reason for those mesaurements. Those come from the
> > request_module() and usermode-thread generates them while handling module
> > loading request for crypto-x962(ecdsa-nist-p256).
> > Since it's not a real kernel module,
> > I confirmed file measurements between late_initcall and
> > late_initcall_sync are gone for modeprobe with below change:
> > 
> > @@ -1246,9 +1250,14 @@ EXPORT_SYMBOL_GPL(ima_measure_critical_data);
> >   */
> >  static int ima_kernel_module_request(char *kmod_name)
> >  {
> >         if (strncmp(kmod_name, "crypto-pkcs1(rsa,", 17) == 0)
> >                 return -EINVAL;
> > 
> > +       if (IS_BUILTIN(CONFIG_CRYPTO_ECDSA) &&
> > +           (strncmp(kmod_name, "crypto-x962(ecdsa", 17) == 0))
> > +               return -EINVAL;
> > +
> >         return 0;
> >  }
> > 
> >  Though this is the only request_module() call between
> >  late_initcall and late_initcall_sync, but I also confirmed there're
> >  request_modules() call before ima initalisation before "late_initcall":
> > 
> > /*
> >  * NOTE: kmod_name is printed on ima_kernel_module_request()
> >  */
> > 
> > // This is called from module_init(stm_core_init) -> device_initcall()
> > // which is in driver/hwtracing/stm/core.c (built-in)
> > [    1.421986] ima: kmod_name: stm_p_basic
> > ...
> > [    1.444900] ima: kmod_name: crypto-pkcs1(rsa,sha512)
> > [    1.444903] ima: kmod_name: crypto-pkcs1(rsa,sha512)-all
> > ...
> > [    1.452029] ima: kmod_name: crypto-cbc(aes)
> > [    1.465321] ima: kmod_name: crypto-cbc(aes)-all
> > ...
> > [    1.467845] Key type encrypted registered
> > [    1.467848] AppArmor: AppArmor sha256 policy hashing enabled
> > 
> >  // IMA is initailised at late_initcall level.
> > [    1.467850] ima: [init_ima_late:1336]
> > 
> > If IMA should care request_module() from kernel before IMA init,
> > I think there is no way to solve except queuing those events
> > (kernel_load_data/kernel_load_post_data and open for module binary etc.)
> > though it breaks "measure before use" principle since IMA couldn't
> > measure at that time.
> > 
> > But if you don't care about those things -- some events happend before
> > IMA init, I think your suggestion -- controlling the init time of ima_init()
> > via a Kconfig option is good and ignoring some usermodehelper request
> > including request_module() before IMA initialisation upto user by that option.
> 
> Thank you for the complete analysis.  The early measurements before the TPM is
> initialized is a problem that needs to be addressed.  As to whether the solution
> will require queueing is yet to be determined. (Roberto has some thoughts on
> addressing it.) This discussion makes it clear that simply delaying IMA
> initialization by moving it from late_initcall to late_initcall_sync could miss
> measurements.  That said, exposing it as an opt-in Kconfig for those who accept
> the risk is a sensible pragmatic compromise.

I think once we address ealry measurements before intialising TPM,
It doesn't matter when IMA is initialissed since they're considered as
ealry measurements anyway.

BTW, I'm not sure whether we should take pragmatic compromise first to
support deferred TPM initialisation or solving it together via solution
of ealry measurements (whatever it is) in now.

-- 
Sincerely,
Yeoreum Yun

