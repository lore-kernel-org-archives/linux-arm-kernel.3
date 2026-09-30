Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE2BCA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fIWvZel54CrzajRJGh2AWCDRQlmJuSrCVdo/eT3veTM=; b=J3AypJbp+0V91UFSCCF3ltCEkm
	+EhT9+Y9tNcPcD/m4hH6LpfdPyzZj27g2Sr3PbVpVFDbe6B/hOYLtu3j9sz2ZITID0wVo8FexmmIX
	XzaGK+NepdmYy+wVt0bPR8UvBsnAwAlFzig39O88hUQPOwjHJe8xLedggP+GMTeN1to0rdSDcuwqS
	Zq8C+1fBjUxPha/cupd5AFEc5p9bMp2rtmQ+8Wxdw5D6fnwp/CEpXWffUYsxs+m82I9Pe77gXZJ6c
	jEBSY2Py/qJCDV1/SPg+ggj7xxgcpNVJSr6ZBJVclcKfdMdc4tF08VMCvscY6GMcfvttTc8Hzbea1
	i8hodM1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBp8y-00000005LpW-1Fhl;
	Wed, 30 Sep 2026 07:54:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBp8x-00000005LpA-25ld
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 07:54:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fIWvZel54CrzajRJGh2AWCDRQlmJuSrCVdo/eT3veTM=; b=ftg551BEL0ANPm+FEXXQLLRJf9
	OGVEzwfGWM6yXC24Uo52/MxS7P9MYrwdLNsJdMWFTc9qUTl4gF2yyNxovVw21JhdykdxUjisVkQYu
	e4QWUHjZml+87/v1+SvTkE4C+0AzsgX2XgEWFRq2Jl04Lk5dSSXFQA+z8S/VZgdTGcxxXoIj9GHOp
	tTAYlghDQqXuO183BNAuP0pg/8Y/eBhYdRPVTItElIC13QI1NUWpiTDHwKRzSYJQYOhmLbqJwq8qH
	CxXxWf2XB/aqfX1x3zbfAonFpnQDU4IPjTJCHj78MMg50t9vIcIxCufWoi/GnwbnAcMsKIhIVPKjn
	CJ/JWmog==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBp8t-00000003Uwp-1FZy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:54:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA9B61477;
	Wed, 30 Sep 2026 00:54:12 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB75C3F86F;
	Wed, 30 Sep 2026 00:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790754856; bh=lbkClFzLLe0ivYseX839w/IMZ7BURDCVxHQdQZ6nU68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1EAOKIUjCvotcFM2AizcOeeILl/6SYLkrt4Jt05C56SFmVNmQPpP3Opi5Uv1d9Wm
	 tJ0vhWkIWtcAYLpaK+0WivpxW0erTf+2Jnso1dQgHtmsN43pP/7yozLNiPmRFKwzIx
	 32+UvXvLtdU9i5Ox51b5mh2lRYgcWq/Htklg+ZYs=
Date: Wed, 30 Sep 2026 08:54:12 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Kohei Enju <enju.kohei@fujitsu.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com
Subject: Re: [PATCH v2 3/3] virt: arm-cca-guest: Add support for measurement
 registers
Message-ID: <arzAJJ7glyD4rEeM@e129823.arm.com>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-3-1d98bba187fd@arm.com>
 <arx2hnTv3QaFqMn-@FCCLS0092175.localdomain>
 <aryZnqqBAjKw5xaP@e129823.arm.com>
 <arygMte5C5lJDdoi@FCCLS0092175.localdomain>
 <aryuwukTRtmd2Lft@e129823.arm.com>
 <arywufbCohZ-U3lN@FCCLS0092175.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arywufbCohZ-U3lN@FCCLS0092175.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_085419_834434_8422F016 
X-CRM114-Status: GOOD (  59.33  )
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

> On 09/30 07:40, Yeoreum Yun wrote:
> > > > > > +/**
> > > > > > + * arm_cca_measurements - ARM CCA measurement configuration instance.
> > > > > > + *
> > > > > > + * This defines the measurement set and behavior for the ARM
> > > > > > + * Confidential Compute Architecture, enabling measurements
> > > > > > + * for attestation and runtime validation.
> > > > > > + */
> > > > > > +static struct tsm_measurements arm_cca_measurements = {
> > > > > > +	.mrs = arm_cca_mrs,
> > > > > > +	.nr_mrs = ARRAY_SIZE(arm_cca_mrs),
> > > > > > +	.refresh = arm_cca_mr_refresh,
> > > > > > +	.write = arm_cca_mr_extend,
> > > > > 
> > > > > From the RMM specification and the commit message, I understand that a
> > > > > REM can be extended with a measurement value of up to 64 bytes,
> > > > > regardless of the selected hash algorithm (for example, SHA-256 or
> > > > > SHA-512).
> > > > > 
> > > > > However, when SHA-256 is selected, this interface does not allow a REM
> > > > > to be extended with a 64-byte value. The write partially succeeds: the
> > > > > REM is extended with the first 32 bytes, and then the write of the
> > > > > remaining 32 bytes fails with -EFBIG.
> > > > > 
> > > > > As far as I can tell, the write is truncated to the sysfs binary
> > > > > attribute size, which is set to the SHA-256 digest size (32 bytes). The
> > > > > subsequent write at offset 32 is then rejected by sysfs_kf_bin_write()
> > > > > with -EFBIG.
> > > > > 
> > > > > I do not see a straightforward fix because the TSM measurement register
> > > > > interface currently uses mr_size both as the readable digest size and as
> > > > > the required write size.
> > > > > 
> > > > > [Realm VM]
> > > > >   ~ # export REM3=/sys/devices/virtual/misc/arm_cca_guest/measurements/rem3:sha256
> > > > >   ~ # dd if=/dev/urandom bs=64 count=1 of=$REM3
> > > > >   dd: error writing '/sys/devices/virtual/misc/arm_cca_guest/measurements/rem3:sha256': File too large
> > > > >   1+0 records in
> > > > >   0+0 records out
> > > > > 
> > > > > [RMM]
> > > > >   SMC_RSI_MEASUREMENT_EXTEND        4 20 3cfcaa635bca042d c148121346b6e1b5 7342800b438d20d7 3dc7a25048cbbad8 0 0 0 0 > RSI_SUCCESS
> > > > > 
> > > > > Do you have any thoughts on how the TSM interface should represent the
> > > > > maximum extend input size separately from the digest size?
> > > > 
> > > > I don't think we need to represent the maximum extend input size separately.
> > > > 
> > > > The TSM measurement register interface is intended to expose PCR-like
> > > > semantics, where the value being extended is a measurement digest whose size
> > > > is determined by the selected hash algorithm.
> > > > 
> > > > In other words, the extend operation is conceptually:
> > > > 
> > > > new_digest = Hash(old_digest || measurement_digest)
> > > > 
> > > > Therefore, for a SHA-256 measurement register, the extend value should be
> > > > 32 bytes, and rejecting a value larger than 32 bytes with -EFBIG seems
> > > > correct to me and intended. A 64-byte extend value would only be valid for
> > > > a register using a 64-byte digest, such as SHA-512.
> > > > 
> > > > Although the RMM interface may allow a measurement value of up to 64 bytes
> > > > independently of the REM hash algorithm, I don't think that capability
> > > > needs to be exposed through the generic TSM measurement register interface
> > > > in point of viewt to preserve PCR-like semantics.
> > > 
> > > Thanks for the clarification. That makes sense to me.
> > > 
> > > In that case, could the ABI documentation be updated? It currently
> > > states:
> > >   All writes must start at offset 0 and be maximum 64 bytes in size.
> > >   Attempting to write more than 64 bytes will result in EINVAL returned
> > >   by the write() syscall.
> > 
> > Yeap. I'll update accordingly. Thanks.
> > 
> > > 
> > > However, the TSM interface requires the write size to exactly match
> > > mr_size. Therefore, this would be 32 bytes for SHA-256, 48 bytes for
> > > SHA-384, and 64 bytes for SHA-512.
> > > 
> > > My remaining concern is that since sysfs_kf_bin_write() truncates
> > > oversized writes to the binary attribute size before invoking the
> > > callback, tm_digest_write() sees an exact-sized write and extends the
> > > MR. The following validation is useless in this case.
> > > 
> > >   static ssize_t tm_digest_write(struct file *filp, struct kobject *kobj,
> > >   			       const struct bin_attribute *attr, char *buffer,
> > >   			       loff_t off, size_t count)
> > >   {
> > >     [...]
> > >   	/* partial writes are not supported */
> > >   	if (off != 0 || count != attr->size)
> > >   		return -EINVAL;
> > > 
> > > IMO this is not specific to Arm CCA, but do you have any thoughts on
> > > this?
> > 
> > I think this is ultimately a limitation of sysfs. At this layer,
> > simply knowing that userspace supplied a larger buffer does not allow us to
> > determine whether all of the data in that buffer is valid.
> 
> I agree that this is a common sysfs/TSM issue rather than something
> that needs to be addressed in this series.
> 
> > 
> > For example, a userspace program could allocate a 64-byte buffer,
> > place only a 32-byte SHA-256 digest in it, and still pass the full buffer
> > size to write(). From the kernel's point of view, there is no reliable way
> > to distinguish that from a valid 64-byte input.
> > 
> > Therefore, I think userspace needs to check the size of the binary attribute,
> > e.g. remX256 in this case, and write exactly that amount of valid data.
> 
> Agreed. Userspace should normally inspect the attribute size and write
> exactly that mount.
> 
> > 
> > Given the current sysfs interface, I think requiring userspace to check
> > the bin_attr size and provide valid data of exactly that size is the best
> > we can do.
> > 
> > IOW, above sanity check is to catch-up what you worried about as comment
> > say, Its purpose to prohibit the *partial write*.
> 
> Right, but my concern is that this check cannot detect an oversized
> write, since sysfs_kf_bin_write() truncates it before invoking
> tm_digest_write(). Consequently, the check passes and the MR is
> extended, even though userspace observes a short write.
> 
> I think this could be handled by adding an opt-in option that prevents
> sysfs from truncating writes. I did a basic test with the prototype
> patch below and confirmed that an oversized digest was rejected with
> -EFBIG before the MR was extended.
> 
> Anyway, I will look into addressing this separately through the common
> TSM/sysfs code. 
> 
> Thanks for the clarification, Yeoreum.
> 
> ---8<---
> diff --git a/drivers/virt/coco/guest/tsm-mr.c b/drivers/virt/coco/guest/tsm-mr.c
> index 657b9c5739d0..5880b12e1f55 100644
> --- a/drivers/virt/coco/guest/tsm-mr.c
> +++ b/drivers/virt/coco/guest/tsm-mr.c
> @@ -215,6 +215,7 @@ tsm_mr_create_attribute_group(const struct tsm_measurements *tm)
>                 if (tm->mrs[i].mr_flags & TSM_MR_F_WRITABLE) {
>                         bap->attr.mode |= 0200;
>                         bap->write = tm_digest_write;
> +                       bap->no_write_truncate = true;
>                 }
> 
>                 bap->size = tm->mrs[i].mr_size;
> diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
> index cd5bb0f9fee6..1d6a0bf8109e 100644
> --- a/fs/sysfs/file.c
> +++ b/fs/sysfs/file.c
> @@ -156,6 +156,8 @@ static ssize_t sysfs_kf_bin_write(struct kernfs_open_file *of, char *buf,
>         if (size) {
>                 if (size <= pos)
>                         return -EFBIG;
> +               if (battr->no_write_truncate && count > size - pos)
> +                       return -EFBIG;
>                 count = min_t(ssize_t, count, size - pos);
>         }
>         if (!count)
> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index b1a3a1e6ad09..31a4c3cf5d51 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -312,6 +312,7 @@ struct bin_attribute {
>         struct attribute        attr;
>         size_t                  size;
>         void                    *private;
> +       bool                    no_write_truncate;
>         struct address_space *(*f_mapping)(void);
>         ssize_t (*read)(struct file *, struct kobject *, const struct bin_attribute *,
>                         char *, loff_t, size_t);
> 

Yeap. I agree this and valid for me, but delay decision to sysfs
maintainer whether it's valid for overall usage of sysfs.

-- 
Sincerely,
Yeoreum Yun

