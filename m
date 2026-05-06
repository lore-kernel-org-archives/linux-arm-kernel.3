Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40E6FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 13:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=75VjGYMnWtipTjsQd1WVPagWhV6uFhuR1eOGHawgBlA=; b=HiWhpo4pdSrXTEer2aVWHLFWYJ
	vZCN4pAhE/e/n+FI0llJzcki8qi+Sc83vtgkEbNbh7SZoUSpM6isBfxxCgwUwS8Em7lHMvyOkjTN5
	/ZkX/Sq4nNw3yfN6waW3QQbK4lLRnv6iO297qh+0BOw2uaXADoSPYtxtwKCIv4t1ILgCnrlAs8RcT
	8Rs4nBt8flkAutZuoK6MC0CoKyTpV1bkh+DOylZCIuVdJVu6T9vD87WJ7xYG7r5ezNUTD/2a1qbVs
	XwourNDHSXNdG97WLKgo8aTDaSTXlxRYQl5MxsQSLaPP38SskDgVvHvoBVe/01RtwSrZ2No3jX0sI
	ffxQY77w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKckc-00000000ykm-0x1h;
	Wed, 06 May 2026 13:57:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKckb-00000000yjM-29on
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 13:57:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B7D701A25;
	Wed,  6 May 2026 06:57:12 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C3963F7B4;
	Wed,  6 May 2026 06:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778075838; bh=qAxl0RqtACkHiwzEDE0zWDfw6tUQYsvu/LQEyZO/AkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wh5Dv8Spfr4cehZvmkTo+VGhkybCzPCOIagZiw2rRjeAKplHHfzv6dAzxjDBD+ZWZ
	 UMAZ2SCVCNte9NjytmyRPpe3Jib05FwIYLLNQsNBVfYFFs48R1DKAdnnco/5QrjWcA
	 BL++VUG9CzKbW8Z1Nn4uKYXJ9WhejPuqDlErDvWQ=
Date: Wed, 6 May 2026 14:57:12 +0100
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
Message-ID: <aftIuPwNeuzc9nY1@e129823.arm.com>
References: <cover.1777036497.git.noodles@meta.com>
 <7734099f5e7fda5480bca016a9e6707983325fbd.camel@linux.ibm.com>
 <afMlgstqahnZg68h@e129823.arm.com>
 <9f188536f09a2db30877d6bfbb84aeaf2565cccf.camel@linux.ibm.com>
 <CAGWfHUW+AX0Hpuw5Vr5iTSaJKQJ+O_4nWWmU1UR8Z_3XFctHZg@mail.gmail.com>
 <202f90682fe47bb5fb9b08f8678ae00981b5290b.camel@linux.ibm.com>
 <201b9172ac47c6766443c1f2343cab3548f33c29.camel@linux.ibm.com>
 <afrXmRiq7XvSe6yN@e129823.arm.com>
 <9ff4853a8e9932b3a1424f2a6c3347f1723fb5f4.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9ff4853a8e9932b3a1424f2a6c3347f1723fb5f4.camel@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_065721_647915_D3C94D76 
X-CRM114-Status: GOOD (  45.38  )
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

Hi Mimi,

> On Wed, 2026-05-06 at 06:54 +0100, Yeoreum Yun wrote:
> > Hi Mimi,
> > 
> > > On Sun, 2026-05-03 at 07:36 -0400, Mimi Zohar wrote:
> > > > On Fri, 2026-05-01 at 12:52 -0400, David Safford wrote:
> > > > > On Thu, Apr 30, 2026 at 5:43 PM Mimi Zohar <zohar@linux.ibm.com> wrote:
> > > > > > 
> > > > > > On Thu, 2026-04-30 at 10:48 +0100, Yeoreum Yun wrote:
> > > > > > > With above change I confirmed there is no meaurement log
> > > > > > > between boot_aggregate and boot_aggregate_late except "kernel_version"
> > > > > > > But this is ignorable since this UTS measurement is done in
> > > > > > > "ima_init_core() (old: ima_init())" and it is part of ima initialisation.
> > > > > > > 
> > > > > > > 1. ima_policy=tcb
> > > > > > > 
> > > > > > >   # cat /sys/kernel/security/ima/ascii_runtime_measurements
> > > > > > >   10 0adefe762c149c7cec19da62f0da1297fcfbffff ima-ng sha256:0000000000000000000000000000000000000000000000000000000000000000 boot_aggregate
> > > > > > >   10 4e5d73ebadfd8f850cb93ce4de755ba148a9a7d5 ima-ng sha256:0000000000000000000000000000000000000000000000000000000000000000 boot_aggregate_late
> > > > > > >   10 7c23cc970eceec906f7a41bc2fbde770d7092209 ima-ng sha256:72ade6ae3d35cfe5ede7a77b1c0ed1d1782a899445fdcb219c0e994a084a70d5 /bin/busybox
> > > > > snip
> > > > > > > 
> > > > > > > 2. ima_policy=critical_data
> > > > > > > 
> > > > > > >   # cat /sys/kernel/security/ima/ascii_runtime_measurements
> > > > > > >   10 0adefe762c149c7cec19da62f0da1297fcfbffff ima-ng sha256:0000000000000000000000000000000000000000000000000000000000000000 boot_aggregate
> > > > > > >   10 49ab61dd97ea2f759edcb6c6a3387ac67f0aa576 ima-buf sha256:0c907aab3261194f16b0c2a422a82f145bc9b9ecb8fdb633fa43e3e5379f0af2 kernel_version 372e312e302d7263312b // Ignorable since it's generated by ima_init(_core)().
> > > > > > >   10 4e5d73ebadfd8f850cb93ce4de755ba148a9a7d5 ima-ng sha256:0000000000000000000000000000000000000000000000000000000000000000 boot_aggregate_late
> > > > > > > 
> > > > > > > Therefore, init_ima() could move into late_initcall_sync like v1 did:
> > > > > > >   - https://lore.kernel.org/all/20260417175759.3191279-2-yeoreum.yun@arm.com/
> > > > > > 
> > > > > > Thanks, Yeoreum.  It's a bit premature to claim it's "safe" to move the
> > > > > > initcall.  Hopefully others will respond.
> > > > > > 
> > > > > > Mimi
> > > > > 
> > > > > I have also run with this patch on a number of bare metal and virtual machines,
> > > > > running everything from default Fedora 44 to a version with everything turned on
> > > > > (uefi secure boot, UKI with sdboot stub measurements, IMA measurement
> > > > > and appraisal enabled,
> > > > > all systemd measurements on, and systemd using the TPM for root
> > > > > partition decryption.)
> > > > > I too see only the kernel_version event between the normal and late
> > > > > calls, if ima_policy=critical_data.
> > > > 
> > > > Thanks, Dave!  Were all the systems you tested x86_64?  The next step would be
> > > > to test on different arch's (e.g. Z, Power).
> > > 
> > > On both Z and PowerVM, there are ~30 measurements between boot_aggregate and
> > > boot_aggregate_late.  For example, on PowerVM:
> > > 
> > > # grep -n boot_aggregate
> > > /sys/kernel/security/integrity/ima/ascii_runtime_measurements
> > > 
> > > 1:10 f60a05d7354fb34aabc02965216abd3428ea52bb ima-sig
> > > sha256:9887dd089ee19a6517bca10580b02c1bb9aa6cd86c157b6ead8a1c0403f348d5
> > > boot_aggregate 
> > > 31:10 e2592b0d61da6300d3db447b143897a9792231ea ima-sig
> > > sha256:9887dd089ee19a6517bca10580b02c1bb9aa6cd86c157b6ead8a1c0403f348d5
> > > boot_aggregate_late
> > > 
> > > It would be interesting to the results from a Raspberry Pi 5 as well,
> > > with/without a TPM.
> > 
> > Honestly, I find this result hard to accept.
> > 
> > This effectively means that there is code invoking IMA measurement during late_initcall().
> > It also implies that if, in the future, a late_initcall is added that performs
> > an IMA measurement before IMA initialization has occurred accoding to order by linker,
> > that measurement could be missed.
> 
> Exactly.  The results are simply from booting with the builtin "tcb" and
> "critical_data" policies.
> 
> $ sudo grubby --args="ima_policy=\"tcb|critical_data\"" --update-kernel
> /boot/vmlinuz-${SUFFIX}

Thanks. but I still wonder what meaasurements there are between
boot_aggregate and boot_aggregate_late.
Might be there would be key measurements if it takes more than
5 mins before generating boot_aggregate_late but this seems rare.

If you don't mind, would you share the contents of the log between
boot_aggregate and boot_aggregate_late?
since I only get a kernel_version in my environment.

And I think we can collect missing measurements before ima_init_core()
into another separate list than ima_measurements in ima_add_template_entry() and
we can extend them after boot_aggreagate log generation at ima_init_core()
then ima initialisation could be moved to late_initcall_sync like
(just for a test and share concept):

-------&<-------
diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
index 9a1117112fb2..737c1ac8ad77 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -67,6 +67,7 @@ extern int ima_appraise;
 extern struct tpm_chip *ima_tpm_chip;
 extern const char boot_aggregate_name[];
 extern const char boot_aggregate_late_name[];
+extern bool ima_extend_on;

 /* IMA event related data */
 struct ima_event_data {
@@ -107,6 +108,7 @@ struct ima_template_desc {

:...skipping...
diff --git a/security/integrity/ima/ima.h b/security/integrity/ima/ima.h
index 9a1117112fb2..737c1ac8ad77 100644
--- a/security/integrity/ima/ima.h
+++ b/security/integrity/ima/ima.h
@@ -67,6 +67,7 @@ extern int ima_appraise;
 extern struct tpm_chip *ima_tpm_chip;
 extern const char boot_aggregate_name[];
 extern const char boot_aggregate_late_name[];
+extern bool ima_extend_on;

 /* IMA event related data */
 struct ima_event_data {
@@ -107,6 +108,7 @@ struct ima_template_desc {

 struct ima_template_entry {
        int pcr;
+       int violation;
        struct tpm_digest *digests;
        struct ima_template_desc *template_desc; /* template descriptor */
        u32 template_data_len;
@@ -317,6 +319,7 @@ unsigned long ima_get_binary_runtime_size(void);
 int ima_init_template(void);
 void ima_init_template_list(void);
 int __init ima_init_digests(void);
+int __init ima_extend_deferred(void);
 void __init ima_init_reboot_notifier(void);
 int ima_lsm_policy_change(struct notifier_block *nb, unsigned long event,
                          void *lsm_data);
diff --git a/security/integrity/ima/ima_init.c b/security/integrity/ima/ima_init.c
index edd063b99685..f6a2b53c1dcb 100644
--- a/security/integrity/ima/ima_init.c
+++ b/security/integrity/ima/ima_init.c
@@ -149,10 +149,22 @@ int __init ima_init_core(bool late)
        rc = ima_init_digests();
        if (rc != 0)
                return rc;
+
+       ima_extend_on = true;
+
        rc = ima_add_boot_aggregate(late);      /* boot aggregate must be first entry */
        if (rc != 0)
                return rc;

+       /* This is just for a test. */
+       if (!late)
+               ima_extend_on = false;
+       else  {
+               rc = ima_extend_deferred();
+               if (rc != 0)
+                       return rc;
+       }
+
        ima_init_policy();

        rc = ima_fs_init();
diff --git a/security/integrity/ima/ima_queue.c b/security/integrity/ima/ima_queue.c
index 319522450854..81f2ee070fee 100644
--- a/security/integrity/ima/ima_queue.c
+++ b/security/integrity/ima/ima_queue.c
@@ -22,10 +22,13 @@

 #define AUDIT_CAUSE_LEN_MAX 32

+bool ima_extend_on;
+
 /* pre-allocated array of tpm_digest structures to extend a PCR */
 static struct tpm_digest *digests;

 LIST_HEAD(ima_measurements);   /* list of all measurements */
+static LIST_HEAD(ima_extend_deferred_head);
 #ifdef CONFIG_IMA_KEXEC
 static unsigned long binary_runtime_size;
 #else
@@ -91,6 +94,7 @@ static int get_binary_runtime_size(struct ima_template_entry *entry)
        return size;
 }

+
 /* ima_add_template_entry helper function:
  * - Add template entry to the measurement list and hash table, for
  *   all entries except those carried across kexec.
@@ -98,7 +102,8 @@ static int get_binary_runtime_size(struct ima_template_entry *entry)
  * (Called with ima_extend_list_mutex held.)
  */
 static int ima_add_digest_entry(struct ima_template_entry *entry,
-                               bool update_htable)
+                               bool update_htable,
+                               struct list_head *measurements_list)
 {
        struct ima_queue_entry *qe;
        unsigned int key;
@@ -111,7 +116,7 @@ static int ima_add_digest_entry(struct ima_template_entry *entry,
        qe->entry = entry;

        INIT_LIST_HEAD(&qe->later);
-       list_add_tail_rcu(&qe->later, &ima_measurements);
+       list_add_tail_rcu(&qe->later, measurements_list);

        atomic_long_inc(&ima_htable.len);
        if (update_htable) {
@@ -173,6 +178,7 @@ int ima_add_template_entry(struct ima_template_entry *entry, int violation,
        char tpm_audit_cause[AUDIT_CAUSE_LEN_MAX];
        int audit_info = 1;
        int result = 0, tpmresult = 0;
+       struct list_head *measurements_list;

        mutex_lock(&ima_extend_list_mutex);

@@ -195,15 +201,21 @@ int ima_add_template_entry(struct ima_template_entry *entry, int violation,
                }
        }

+
+       entry->violation = violation;
+       measurements_list = (ima_extend_on) ? &ima_measurements :
+                                             &ima_extend_deferred_head;
+
        result = ima_add_digest_entry(entry,
-                                     !IS_ENABLED(CONFIG_IMA_DISABLE_HTABLE));
+                                     !IS_ENABLED(CONFIG_IMA_DISABLE_HTABLE),
+                                     measurements_list);
        if (result < 0) {
                audit_cause = "ENOMEM";
                audit_info = 0;
                goto out;
        }

-       if (violation)          /* invalidate pcr */
+       if (violation)                  /* invalidate pcr */
                digests_arg = digests;

        tpmresult = ima_pcr_extend(digests_arg, entry->pcr);
@@ -225,7 +237,7 @@ int ima_restore_measurement_entry(struct ima_template_entry *entry)
        int result = 0;

        mutex_lock(&ima_extend_list_mutex);
-       result = ima_add_digest_entry(entry, 0);
+       result = ima_add_digest_entry(entry, 0, &ima_measurements);
        mutex_unlock(&ima_extend_list_mutex);
        return result;
 }
@@ -288,3 +300,23 @@ int __init ima_init_digests(void)

        return 0;
 }
+
+int __init ima_extend_deferred(void)
+{
+       guard(mutex)(&ima_extend_list_mutex);
+       struct ima_queue_entry *qe;
+       struct tpm_digest *digests_arg;
+       int ret = 0;
+
+       list_for_each_entry(qe, &ima_extend_deferred_head, later) {
+               digests_arg = (qe->entry->violation) ? digests : qe->entry->digests;
+               ret = ima_pcr_extend(digests_arg, qe->entry->pcr);
+               if (ret)
+                       /* TODO: audit? */
+                       break;
+       }
+
+       list_splice_tail_init(&ima_extend_deferred_head, &ima_measurements);
+
+       return ret;
+}

-- 
Sincerely,
Yeoreum Yun

