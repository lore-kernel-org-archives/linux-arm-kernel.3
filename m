Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A93CA5FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zocKf4aoUcxpfZ7HxErWFvCgDhY4xiZ7ttrDzpVPytQ=; b=W77FNx0YzvUPK3Swe7/xaC3s87
	OrIkNe0vvBEp8FL+8MVYqAH9OyWIvUDbWxtoOtL83KbTTodBfkeue9txgLH06yrVmMoGCO3FJ2JhG
	SCSohBVUh/vHR6gmWgd+BpOQdHiQNMQdN6vECOANpE0ZJndAMEdQKU0bDQ4bMB94SXrVLwyzfgNTf
	9fTJsbyIUPUV85GKC3Pzvy8DXOGMggXBFJXO385M2VhBdBW4O9hzVgskWTSSvV4Gi1a3yHrPYOE4G
	wuQOAmnNxqJihcS1xQjgm/8DYaJ2X8lfqZmN7lUG7OiZ/PNVxkgyVSJVnpf+mIoDRn0yc7fj5wVlJ
	pPw4454g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoN4-00000005EIq-1m6A;
	Wed, 30 Sep 2026 07:04:54 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBoN1-00000005EIO-333M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:04:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1790751897; x=1822287897;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FzNd2syg4vvhV3eSW6n06Rt1mk/l3E40AGcK4vrVeP8=;
  b=UdDafVCaFx6rQz3Qd5pfA+B10lR2hxr+joD1taF2vCSp/A9T4NbAzeVV
   3Vp9eM6vx0Tn5a0dMisyu7dHU4d1GYQ6ZcVjNC+lGOr4OsJp56ohH8htL
   ZZFMmbwiMOWvu5dDqdbKauPHqfdJYybRCRyF5EPZhoy8ir8PcRaJGdHd7
   W6CLQmwHqkg7p3T12NiCDcq7F9BASgqT/j3aS0JsGcw0DtPb7D00eYuvm
   PGUEyOd+NWPcxf+67rTF+wj669Tyz7TegbYagZGyxlBLtsV+bZuFnDCym
   vVBIO9WA1U1EClSztBdDBanWawWW9anBaHI6+nRxfzBiwty6ZlZWGxM/B
   w==;
X-CSE-ConnectionGUID: fKcGkLsDTMSeuY7Vydx2lg==
X-CSE-MsgGUID: G0LYwRihT2GxXh4HVBS8mQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="242844889"
X-IronPort-AV: E=Sophos;i="6.27,132,1786978800"; 
   d="scan'208";a="242844889"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 16:04:54 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 93A7F1C00099
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 07:04:49 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 3D8E310000CA
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 07:04:49 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.20.173])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with SMTP id 2BCDE1400245;
	Wed, 30 Sep 2026 07:04:44 +0000 (UTC)
Date: Wed, 30 Sep 2026 16:04:42 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Suzuki Poulose <suzuki.poulose@arm.com>, Steven Price <steven.price@arm.com>, 
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com
Subject: Re: [PATCH v2 3/3] virt: arm-cca-guest: Add support for measurement
 registers
Message-ID: <arywufbCohZ-U3lN@FCCLS0092175.localdomain>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-3-1d98bba187fd@arm.com>
 <arx2hnTv3QaFqMn-@FCCLS0092175.localdomain>
 <aryZnqqBAjKw5xaP@e129823.arm.com>
 <arygMte5C5lJDdoi@FCCLS0092175.localdomain>
 <aryuwukTRtmd2Lft@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aryuwukTRtmd2Lft@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_000452_059626_7E96CFE1 
X-CRM114-Status: GOOD (  55.35  )
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

On 09/30 07:40, Yeoreum Yun wrote:
> > > > > +/**
> > > > > + * arm_cca_measurements - ARM CCA measurement configuration instance.
> > > > > + *
> > > > > + * This defines the measurement set and behavior for the ARM
> > > > > + * Confidential Compute Architecture, enabling measurements
> > > > > + * for attestation and runtime validation.
> > > > > + */
> > > > > +static struct tsm_measurements arm_cca_measurements = {
> > > > > +	.mrs = arm_cca_mrs,
> > > > > +	.nr_mrs = ARRAY_SIZE(arm_cca_mrs),
> > > > > +	.refresh = arm_cca_mr_refresh,
> > > > > +	.write = arm_cca_mr_extend,
> > > > 
> > > > From the RMM specification and the commit message, I understand that a
> > > > REM can be extended with a measurement value of up to 64 bytes,
> > > > regardless of the selected hash algorithm (for example, SHA-256 or
> > > > SHA-512).
> > > > 
> > > > However, when SHA-256 is selected, this interface does not allow a REM
> > > > to be extended with a 64-byte value. The write partially succeeds: the
> > > > REM is extended with the first 32 bytes, and then the write of the
> > > > remaining 32 bytes fails with -EFBIG.
> > > > 
> > > > As far as I can tell, the write is truncated to the sysfs binary
> > > > attribute size, which is set to the SHA-256 digest size (32 bytes). The
> > > > subsequent write at offset 32 is then rejected by sysfs_kf_bin_write()
> > > > with -EFBIG.
> > > > 
> > > > I do not see a straightforward fix because the TSM measurement register
> > > > interface currently uses mr_size both as the readable digest size and as
> > > > the required write size.
> > > > 
> > > > [Realm VM]
> > > >   ~ # export REM3=/sys/devices/virtual/misc/arm_cca_guest/measurements/rem3:sha256
> > > >   ~ # dd if=/dev/urandom bs=64 count=1 of=$REM3
> > > >   dd: error writing '/sys/devices/virtual/misc/arm_cca_guest/measurements/rem3:sha256': File too large
> > > >   1+0 records in
> > > >   0+0 records out
> > > > 
> > > > [RMM]
> > > >   SMC_RSI_MEASUREMENT_EXTEND        4 20 3cfcaa635bca042d c148121346b6e1b5 7342800b438d20d7 3dc7a25048cbbad8 0 0 0 0 > RSI_SUCCESS
> > > > 
> > > > Do you have any thoughts on how the TSM interface should represent the
> > > > maximum extend input size separately from the digest size?
> > > 
> > > I don't think we need to represent the maximum extend input size separately.
> > > 
> > > The TSM measurement register interface is intended to expose PCR-like
> > > semantics, where the value being extended is a measurement digest whose size
> > > is determined by the selected hash algorithm.
> > > 
> > > In other words, the extend operation is conceptually:
> > > 
> > > new_digest = Hash(old_digest || measurement_digest)
> > > 
> > > Therefore, for a SHA-256 measurement register, the extend value should be
> > > 32 bytes, and rejecting a value larger than 32 bytes with -EFBIG seems
> > > correct to me and intended. A 64-byte extend value would only be valid for
> > > a register using a 64-byte digest, such as SHA-512.
> > > 
> > > Although the RMM interface may allow a measurement value of up to 64 bytes
> > > independently of the REM hash algorithm, I don't think that capability
> > > needs to be exposed through the generic TSM measurement register interface
> > > in point of viewt to preserve PCR-like semantics.
> > 
> > Thanks for the clarification. That makes sense to me.
> > 
> > In that case, could the ABI documentation be updated? It currently
> > states:
> >   All writes must start at offset 0 and be maximum 64 bytes in size.
> >   Attempting to write more than 64 bytes will result in EINVAL returned
> >   by the write() syscall.
> 
> Yeap. I'll update accordingly. Thanks.
> 
> > 
> > However, the TSM interface requires the write size to exactly match
> > mr_size. Therefore, this would be 32 bytes for SHA-256, 48 bytes for
> > SHA-384, and 64 bytes for SHA-512.
> > 
> > My remaining concern is that since sysfs_kf_bin_write() truncates
> > oversized writes to the binary attribute size before invoking the
> > callback, tm_digest_write() sees an exact-sized write and extends the
> > MR. The following validation is useless in this case.
> > 
> >   static ssize_t tm_digest_write(struct file *filp, struct kobject *kobj,
> >   			       const struct bin_attribute *attr, char *buffer,
> >   			       loff_t off, size_t count)
> >   {
> >     [...]
> >   	/* partial writes are not supported */
> >   	if (off != 0 || count != attr->size)
> >   		return -EINVAL;
> > 
> > IMO this is not specific to Arm CCA, but do you have any thoughts on
> > this?
> 
> I think this is ultimately a limitation of sysfs. At this layer,
> simply knowing that userspace supplied a larger buffer does not allow us to
> determine whether all of the data in that buffer is valid.

I agree that this is a common sysfs/TSM issue rather than something
that needs to be addressed in this series.

> 
> For example, a userspace program could allocate a 64-byte buffer,
> place only a 32-byte SHA-256 digest in it, and still pass the full buffer
> size to write(). From the kernel's point of view, there is no reliable way
> to distinguish that from a valid 64-byte input.
> 
> Therefore, I think userspace needs to check the size of the binary attribute,
> e.g. remX256 in this case, and write exactly that amount of valid data.

Agreed. Userspace should normally inspect the attribute size and write
exactly that mount.

> 
> Given the current sysfs interface, I think requiring userspace to check
> the bin_attr size and provide valid data of exactly that size is the best
> we can do.
> 
> IOW, above sanity check is to catch-up what you worried about as comment
> say, Its purpose to prohibit the *partial write*.

Right, but my concern is that this check cannot detect an oversized
write, since sysfs_kf_bin_write() truncates it before invoking
tm_digest_write(). Consequently, the check passes and the MR is
extended, even though userspace observes a short write.

I think this could be handled by adding an opt-in option that prevents
sysfs from truncating writes. I did a basic test with the prototype
patch below and confirmed that an oversized digest was rejected with
-EFBIG before the MR was extended.

Anyway, I will look into addressing this separately through the common
TSM/sysfs code. 

Thanks for the clarification, Yeoreum.

---8<---
diff --git a/drivers/virt/coco/guest/tsm-mr.c b/drivers/virt/coco/guest/tsm-mr.c
index 657b9c5739d0..5880b12e1f55 100644
--- a/drivers/virt/coco/guest/tsm-mr.c
+++ b/drivers/virt/coco/guest/tsm-mr.c
@@ -215,6 +215,7 @@ tsm_mr_create_attribute_group(const struct tsm_measurements *tm)
                if (tm->mrs[i].mr_flags & TSM_MR_F_WRITABLE) {
                        bap->attr.mode |= 0200;
                        bap->write = tm_digest_write;
+                       bap->no_write_truncate = true;
                }

                bap->size = tm->mrs[i].mr_size;
diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
index cd5bb0f9fee6..1d6a0bf8109e 100644
--- a/fs/sysfs/file.c
+++ b/fs/sysfs/file.c
@@ -156,6 +156,8 @@ static ssize_t sysfs_kf_bin_write(struct kernfs_open_file *of, char *buf,
        if (size) {
                if (size <= pos)
                        return -EFBIG;
+               if (battr->no_write_truncate && count > size - pos)
+                       return -EFBIG;
                count = min_t(ssize_t, count, size - pos);
        }
        if (!count)
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index b1a3a1e6ad09..31a4c3cf5d51 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -312,6 +312,7 @@ struct bin_attribute {
        struct attribute        attr;
        size_t                  size;
        void                    *private;
+       bool                    no_write_truncate;
        struct address_space *(*f_mapping)(void);
        ssize_t (*read)(struct file *, struct kobject *, const struct bin_attribute *,
                        char *, loff_t, size_t);

Thanks,
Kohei

