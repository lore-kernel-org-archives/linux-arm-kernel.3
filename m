Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF77FCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 14:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qM7b8Zvd/r3gp0uDmEIp+6sMf0MTar/zR11vt/xURYc=; b=AIjvU0z+c26Mja7iO+HRcWDL7A
	rJOJs4o6VkTo5TDrAjMA5r8coiRtv42Kb+7jSAH6Mx0ZQMt2KNPy+rjmm68JqEAoDS4z6IDGnPvvh
	2Pc313n8gyGirohZ1lilNy/ywPd9An8btIaQdWbiLeZddCY/+BhCbI8railKc0D2tCF25yT9A/LeH
	4UG9WrEfMA7XWZPPvhiVuDuu+D6VHeZ11UVt9gfAhamV779Vo74PZ7Yqtc64WROyrIboq02RjbD7F
	PI3ZesMnfjzHiJOyyqiDaq/A1mdv0ouCft5sUi/F5FqxfNxJbBp6n8IMkQm37B0E/ZzdS0Dx5WnIJ
	x0ECVMfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvIF-00000006JeB-1SGk;
	Wed, 30 Sep 2026 14:28:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvIC-00000006Jdb-2xkW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 14:28:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68FE3497;
	Wed, 30 Sep 2026 07:28:15 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64CD03F85F;
	Wed, 30 Sep 2026 07:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790778498; bh=FV8I/dO57eVkHuIV6LTmsqycHhPtn1208/7F0F6Lebc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ivjiqceDxB2SzDGrovUsYtnai9OlBdpj/MesfTrM//H/VSlGIF/qkIVOhgV0yGT0q
	 YoxBlmbZNQdc+dl9Qm5ympLo9DjRyivFoJjZCei8/cm0YCB+78YCd+oeHEuLYgDK+R
	 UZftOjsVhZup6GsllDBRNTVEyJ37ZsSRvJs7QrRw=
Date: Wed, 30 Sep 2026 15:28:15 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Kohei Enju <enju.kohei@fujitsu.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com
Subject: Re: [PATCH v2 3/3] virt: arm-cca-guest: Add support for measurement
 registers
Message-ID: <ar0cfxgUCtdYW-EX@e129823.arm.com>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-3-1d98bba187fd@arm.com>
 <arx2hnTv3QaFqMn-@FCCLS0092175.localdomain>
 <aryZnqqBAjKw5xaP@e129823.arm.com>
 <arygMte5C5lJDdoi@FCCLS0092175.localdomain>
 <aryuwukTRtmd2Lft@e129823.arm.com>
 <20260930135408.GP163130@ziepe.ca>
 <ar0Y0vsOpu3WKTMM@e129823.arm.com>
 <20260930141708.GQ163130@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930141708.GQ163130@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_072820_870940_CA341B6A 
X-CRM114-Status: GOOD (  24.93  )
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

On Wed, Sep 30, 2026 at 11:17:08AM -0300, Jason Gunthorpe wrote:
> On Wed, Sep 30, 2026 at 03:12:34PM +0100, Yeoreum Yun wrote:
> > > On Wed, Sep 30, 2026 at 07:40:02AM +0100, Yeoreum Yun wrote:
> > > > > My remaining concern is that since sysfs_kf_bin_write() truncates
> > > > > oversized writes to the binary attribute size before invoking the
> > > > > callback, tm_digest_write() sees an exact-sized write and extends the
> > > > > MR. The following validation is useless in this case.
> > > > > 
> > > > >   static ssize_t tm_digest_write(struct file *filp, struct kobject *kobj,
> > > > >   			       const struct bin_attribute *attr, char *buffer,
> > > > >   			       loff_t off, size_t count)
> > > > >   {
> > > > >     [...]
> > > > >   	/* partial writes are not supported */
> > > > >   	if (off != 0 || count != attr->size)
> > > > >   		return -EINVAL;
> > > > > 
> > > > > IMO this is not specific to Arm CCA, but do you have any thoughts on
> > > > > this?
> > > > 
> > > > I think this is ultimately a limitation of sysfs. At this layer,
> > > > simply knowing that userspace supplied a larger buffer does not allow us to
> > > > determine whether all of the data in that buffer is valid.
> > > 
> > > sysfs is a bad choice for this interface, it always was, this is one
> > > more example why.
> > > 
> > > We should have learned that from TPM's mistakes, not copied its bad
> > > ideas into tsm_mr.
> > 
> > This sounds you plan to make a dedicate fs (whatever via configfs or
> > other) for attestation subsystem which you mention in [0].
> > 
> > Link: [0] https://lore.kernel.org/all/arwNEWUEEk7jdGir@e129823.arm.com/
> 
> Jiri's working proposal is to move it to a char dev, like the sane
> TPM interface ..

Ah. makes sense. Thanks.

-- 
Sincerely,
Yeoreum Yun

