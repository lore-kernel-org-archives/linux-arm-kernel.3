Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB65C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 09:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+IA/r56tdS5+CnkjEv19roURLy/pYVJy9D2Xe8IOr7c=; b=rEYIAUuwgOpsMu6UTN0JTr1RsZ
	zkqzL0A6pxc0u2Xq88krY/Wf92ETHWrmJUgDRi30XWujtq5X7hjtawV3Y6sKzK094MKXyZJFWZVj6
	tghLDIlh6vdU6hePdMbHu7mYZSbzER2asHwO4YEmlBWHoxR6AkD/pqNV0pA9boSMV2eVq0owQZV5X
	v7MULkMEJ77ZFPYxxX358a6JHjofMH3nUMjDtIdaCuUBXndnYNF2acE5i8SOm72ftqoohGXlUKuXQ
	iA/t3x7tY5LBl2A/440rIrxKBsk109+rE05jcv4kvzaHAYs95m5PAZAY2vriq2LkJn3A0mD+xKh8j
	hL9C88yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Zt9-00000001QVj-2iuM;
	Mon, 21 Sep 2026 09:00:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Zt3-00000001QTx-2Rgq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 09:00:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 548101CE0;
	Mon, 21 Sep 2026 02:00:29 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89A763F86C;
	Mon, 21 Sep 2026 02:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789981232; bh=rmGLhNez3sr3VTeO0rvtyKw8ZUlXlZNA/shMOq4Nvmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Po5RM1+rdbnm6qFubw9+VCeRMeyVqlwMNum4SN8AgdpES5MhqzGT4Q5bGmOKxWQRm
	 qvEiQUYpgvamwapOlIW5mYnepDRMQ47wTTpxrqNeX4zeqbDujGvuOdhjL1jMUwZixw
	 Xw8WIdLM+JpusqCvpbr+Xkkf6QG7esS+aGrU8NlE=
Date: Mon, 21 Sep 2026 10:00:27 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: Re: [PATCH v12 7/7] coco: guest: arm64: Replace dummy CCA device
 with sysfs ABI
Message-ID: <arDyK8QDtCEc5SzU@arm.com>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
 <20260921053807.354802-8-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921053807.354802-8-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_020033_706753_41C236D7 
X-CRM114-Status: GOOD (  24.42  )
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

On Mon, Sep 21, 2026 at 11:08:07AM +0530, Aneesh Kumar K.V (Arm) wrote:
> diff --git a/Documentation/ABI/testing/sysfs-firmware-cca b/Documentation/ABI/testing/sysfs-firmware-cca
> new file mode 100644
> index 000000000000..9cc355724f94
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-firmware-cca
> @@ -0,0 +1,7 @@
> +What:		/sys/firmware/cca/realm_guest
> +Date:		May 2026

Still May?

> +Contact:	Linux ARM Kernel Mailing list <linux-arm-kernel@lists.infradead.org>
> +Description:	Read-only. Present only when the kernel is running as an
> +		Arm Confidential Compute Architecture (CCA) Realm guest, in
> +		which case it reads 1. If the file does not exist, the kernel
> +		is not running as a Realm guest.
> diff --git a/drivers/firmware/arm_rmm/rsi.c b/drivers/firmware/arm_rmm/rsi.c
> index 2dd69febedbd..425b27c0cad4 100644
> --- a/drivers/firmware/arm_rmm/rsi.c
> +++ b/drivers/firmware/arm_rmm/rsi.c
> @@ -7,14 +7,16 @@
>  #include <linux/memblock.h>
>  #include <linux/psci.h>
>  #include <linux/swiotlb.h>
> -#include <linux/platform_device.h>
>  #include <linux/arm-rsi-cmds.h>
> +#include <linux/kobject.h>
> +#include <linux/sysfs.h>
>  
>  #include <asm/io.h>
>  #include <asm/mem_encrypt.h>
>  #include <asm/pgtable.h>
>  
>  static struct realm_config config;
> +static struct kobject *cca_kobj;

Nit: do we need this static cca_kobj? Can you not just use a local
variable in realm_sysfs_init()?

>  
>  unsigned long prot_ns_shared;
>  EXPORT_SYMBOL(prot_ns_shared);
> @@ -182,17 +184,36 @@ void __init arm64_rsi_init(void)
>  	static_branch_enable(&rsi_present);
>  }
>  
> -static struct platform_device rsi_dev = {
> -	.name = "arm-cca-dev",
> -	.id = PLATFORM_DEVID_NONE
> +static ssize_t realm_guest_show(struct kobject *kobj,
> +		struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "1\n");
> +}
> +
> +static struct kobj_attribute cca_realm_guest =
> +	__ATTR(realm_guest, 0444, realm_guest_show, NULL);

Nit: __ATTR_RO,

> +
> +static const struct attribute *cca_realm_attrs[] = {
> +	&cca_realm_guest.attr,
> +	NULL
>  };
>  
> -static int __init arm64_create_dummy_rsi_dev(void)
> +static int __init realm_sysfs_init(void)
>  {
> -	if (is_realm_world() &&
> -	    platform_device_register(&rsi_dev))
> -		pr_err("failed to register rsi platform device\n");
> -	return 0;
> -}
> +	int ret;
>  
> -arch_initcall(arm64_create_dummy_rsi_dev)
> +	if (!is_realm_world())
> +		return 0;
> +
> +	cca_kobj = kobject_create_and_add("cca", firmware_kobj);
> +	if (!cca_kobj)
> +		return -ENOMEM;
> +
> +	ret = sysfs_create_files(cca_kobj, cca_realm_attrs);
> +	if (!ret)
> +		return 0;
> +
> +	kobject_put(cca_kobj);
> +	return ret;
> +}
> +device_initcall(realm_sysfs_init);

If you make it to here ;), I'd also split this patch in two as per
Jonathan's suggestion on the previous version.

-- 
Catalin

