Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3368F55809
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 10:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=192fbMdGov5ra3CzttpWVsfsxwWZ2pH8LM+eCLO/yN4=; b=qlKxG8r8D7mfwQtZX7BSM7zumM
	bZF3RMTJnaHKGcQwMwvpw/Okw1725BdPfgdjikdtzxXjxx2yE44hPw09EpJ8gOqLABNOQHjWuGYIF
	71cSdOrR1Vd9gyVdgBtSqUbzb5Qq664HJ76E3beiPoVqOIeD/qC8ayIX6LSEtZnAdfwB5ppmJ2QOL
	Kxp1oXpshhvG5JVaSJ7KtTpN7vCejsg+/q+jx/iNw7ZuxWUab+3yl1TOqHps2mjnPcXGqLNQuvTz/
	8dFqvKZQoeQaYDzY+RXveXifl6KoklsYQWuR7z+0ohGlX63Pd5gobuEejfPTRNAYRTy6oDTE9mbbJ
	rJ268iyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wElw9-00000006jiA-1ZfT;
	Mon, 20 Apr 2026 10:33:05 +0000
Received: from the.earth.li ([2a00:1098:86:4d:c0ff:ee:15:900d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wElw6-00000006jhl-2pso
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 10:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=earth.li;
	s=the; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=192fbMdGov5ra3CzttpWVsfsxwWZ2pH8LM+eCLO/yN4=; b=f1C8Kqc5RU5hnOVR3+GUpKke9a
	fij2Gr/6dtPqzAUplechdSze22hseaiHPeOITqSHyxIK14zh4x0e9UUKZV3X9/A3u7PG8uR6PknnV
	byys1CbYcn4rdkFiQdxCQMSkiHPzXyftqZGswLo6U6PNoNutChpIwe/S+XAEPjBM+NJZrFZuz/rAc
	5U+t+jPmdbMDwAg7eXbylZKnQi7ggyOnmiFWPdCg32zTm4uG4OwYFcb4t+ZsPWF/+TDZZmPTn6hf7
	xYcHWwApZ9EesabPH4NAiF7BsdamsqF2hgMQwalWm2iCbCwBfzQeRtAp5vnRuxNV37+kcTFpb4s1R
	qbh9nHBQ==;
Received: from noodles by the.earth.li with local (Exim 4.98.2)
	(envelope-from <noodles@earth.li>)
	id 1wElw0-0000000HLRV-2LBb;
	Mon, 20 Apr 2026 11:32:56 +0100
Date: Mon, 20 Apr 2026 11:32:56 +0100
From: Jonathan McDowell <noodles@earth.li>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	paul@paul-moore.com, jmorris@namei.org, serge@hallyn.com,
	zohar@linux.ibm.com, roberto.sassu@huawei.com,
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com,
	peterhuewe@gmx.de, jarkko@kernel.org, jgg@ziepe.ca,
	sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org
Subject: Re: [RFC PATCH 1/4] security: ima: move ima_init into
 late_initcall_sync
Message-ID: <aeYA2Jf7esHsfY4M@earth.li>
References: <20260417175759.3191279-1-yeoreum.yun@arm.com>
 <20260417175759.3191279-2-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260417175759.3191279-2-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_033302_833956_BE2D0196 
X-CRM114-Status: GOOD (  21.08  )
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

On Fri, Apr 17, 2026 at 06:57:56PM +0100, Yeoreum Yun wrote:
>To generate the boot_aggregate log in the IMA subsystem with TPM PCR values,
>the TPM driver must be built as built-in and
>must be probed before the IMA subsystem is initialized.
>
>However, when the TPM device operates over the FF-A protocol using
>the CRB interface, probing fails and returns -EPROBE_DEFER if
>the tpm_crb_ffa device — an FF-A device that provides the communication
>interface to the tpm_crb driver — has not yet been probed.
>
>To ensure the TPM device operating over the FF-A protocol with
>the CRB interface is probed before IMA initialization,
>the following conditions must be met:
>
>   1. The corresponding ffa_device must be registered,
>      which is done via ffa_init().
>
>   2. The tpm_crb_driver must successfully probe this device via
>      tpm_crb_ffa_init().
>
>   3. The tpm_crb driver using CRB over FF-A can then
>      be probed successfully. (See crb_acpi_add() and
>      tpm_crb_ffa_init() for reference.)
>
>Unfortunately, ffa_init(), tpm_crb_ffa_init(), and crb_acpi_driver_init() are
>all registered with device_initcall, which means crb_acpi_driver_init() may
>be invoked before ffa_init() and tpm_crb_ffa_init() are completed.
>
>When this occurs, probing the TPM device is deferred.
>However, the deferred probe can happen after the IMA subsystem
>has already been initialized, since IMA initialization is performed
>during late_initcall, and deferred_probe_initcall() is performed
>at the same level.
>
>To resolve this, move ima_init() into late_inicall_sync level
>so that let IMA not miss TPM PCR value when generating boot_aggregate
>log though TPM device presents in the system.
>
>Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Awesome. This fixes the problems I saw with an SPI TPM on an NVIDIA 
GB200 system and reported in 

https://lore.kernel.org/linux-integrity/aYXEepLhUouN5f99@earth.li/

Reviewed-by: Jonathan McDowell <noodles@meta.com>
Tested-by: Jonathan McDowell <noodles@meta.com>

>---
> include/linux/lsm_hooks.h         |  2 ++
> security/integrity/ima/ima_main.c |  2 +-
> security/lsm_init.c               | 13 +++++++++++--
> 3 files changed, 14 insertions(+), 3 deletions(-)
>
>diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
>index d48bf0ad26f4..88fe105b7f00 100644
>--- a/include/linux/lsm_hooks.h
>+++ b/include/linux/lsm_hooks.h
>@@ -166,6 +166,7 @@ enum lsm_order {
>  * @initcall_fs: LSM callback for fs_initcall setup, optional
>  * @initcall_device: LSM callback for device_initcall() setup, optional
>  * @initcall_late: LSM callback for late_initcall() setup, optional
>+ * @initcall_late_sync: LSM callback for late_initcall_sync() setup, optional
>  */
> struct lsm_info {
> 	const struct lsm_id *id;
>@@ -181,6 +182,7 @@ struct lsm_info {
> 	int (*initcall_fs)(void);
> 	int (*initcall_device)(void);
> 	int (*initcall_late)(void);
>+	int (*initcall_late_sync)(void);
> };
>
> #define DEFINE_LSM(lsm)							\
>diff --git a/security/integrity/ima/ima_main.c b/security/integrity/ima/ima_main.c
>index 1d6229b156fb..ace280fa3212 100644
>--- a/security/integrity/ima/ima_main.c
>+++ b/security/integrity/ima/ima_main.c
>@@ -1320,5 +1320,5 @@ DEFINE_LSM(ima) = {
> 	.order = LSM_ORDER_LAST,
> 	.blobs = &ima_blob_sizes,
> 	/* Start IMA after the TPM is available */
>-	.initcall_late = init_ima,
>+	.initcall_late_sync = init_ima,
> };
>diff --git a/security/lsm_init.c b/security/lsm_init.c
>index 573e2a7250c4..4e5c59beb82a 100644
>--- a/security/lsm_init.c
>+++ b/security/lsm_init.c
>@@ -547,13 +547,22 @@ device_initcall(security_initcall_device);
>  * security_initcall_late - Run the LSM late initcalls
>  */
> static int __init security_initcall_late(void)
>+{
>+	return lsm_initcall(late);
>+}
>+late_initcall(security_initcall_late);
>+
>+/**
>+ * security_initcall_late_sync - Run the LSM late initcalls sync
>+ */
>+static int __init security_initcall_late_sync(void)
> {
> 	int rc;
>
>-	rc = lsm_initcall(late);
>+	rc = lsm_initcall(late_sync);
> 	lsm_pr_dbg("all enabled LSMs fully activated\n");
> 	call_blocking_lsm_notifier(LSM_STARTED_ALL, NULL);
>
> 	return rc;
> }
>-late_initcall(security_initcall_late);
>+late_initcall_sync(security_initcall_late_sync);
>--
>LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
>
>

J.

-- 
] https://www.earth.li/~noodles/ []  "Do I scare you?" "No." "Do you   [
]  PGP/GPG Key @ the.earth.li    []   want me to?" -- Wayne's World.   [
] via keyserver, web or email.   []                                    [
] RSA: 4096/0x94FA372B2DA8B985   []                                    [

