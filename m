Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7DBCA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 14:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TGmzl4ZBgt+a/NX3f8+5yKV69hc+HoNAJkowxE1wKzs=; b=BgyJmJTBh7T1VKm5XbzGVM6kfM
	qZ/ykBeHyCc1wudGcNlbKMsvQH8Fv3ke/1JDF4NP//EZkqQB55n6AzqmuK1VLN3vAYdGTcxg+LvfB
	dGWPvWLF5RBJCIxXckre73YiWtdvlxufLlFF1oSyVoY+4OBmHrGVbSB02wF/DdBOVeKyraBbKL0Ul
	uDJPxtgTr2CK93cenojncntbHbX/VbLS0jeBqwfDummBVLo+j7x1ANQHUhEG0dMfKXo9B5DCgGECR
	PdLxkG+AoHbxrXZJVl8REDC0ufSzu34DmW200Sf6yMcCLf5/SKvix7vX1t+2QevP+9DD3OdW/hyY6
	hBiaJ3nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv3j-00000006GGo-2UKa;
	Wed, 30 Sep 2026 14:13:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv37-00000006GAW-0QPK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 14:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TGmzl4ZBgt+a/NX3f8+5yKV69hc+HoNAJkowxE1wKzs=; b=RkTlqCH5DQwnvDmfuoedCtak1U
	QZYgd11KBF1rpQ5f9FifGUJnrhQA6P2V8RupOPOav6JkBdZM290TTZZ3mLYklSUAJf65BSfPuUxy4
	owl609wh86nYSm9u98rHUGp5V18EpNHT3Fn+Fx1dwP5x+bxcl3C9k+DyawF+EjHpuUXGs5eios6/S
	dDVasM0LS2CRUXjj2kMTdjHzbwN3GSGT0wyUoCdJTj7Nu7On47wEzVfIXGYI2UmYmL5vIl1NdYoRc
	Dwc8S+DP0caaoPl5HmAwuQkdzE56Z6hdH8rJmQPqwEWTuID99yjVF7AhriP1R/4PsJE1F6FC76vAq
	YBu6e8ug==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBv32-00000003u9h-48tm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 14:12:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07193497;
	Wed, 30 Sep 2026 07:12:35 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0076E3F85F;
	Wed, 30 Sep 2026 07:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790777558; bh=6+XFhO3Qp73z2z2yEqj749ONIdCc8STL6SPnIAdhy28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YBEqbiPqHIV3PjNK4fnmysbqZ0s3o2rjqRTpV+7ZOQrSy43ORf5HmdjAkvYSla0Rc
	 0P6nS3vDTzjvPw/pjriI4xZfLh26M5cqoKPy3lgyau3O5kGSQMD4dXIVH3fyjDPS/N
	 N/F+rhcINWuQ8dKR5pUwiv7v3ryTB180DvNl/dQQ=
Date: Wed, 30 Sep 2026 15:12:34 +0100
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
Message-ID: <ar0Y0vsOpu3WKTMM@e129823.arm.com>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-3-1d98bba187fd@arm.com>
 <arx2hnTv3QaFqMn-@FCCLS0092175.localdomain>
 <aryZnqqBAjKw5xaP@e129823.arm.com>
 <arygMte5C5lJDdoi@FCCLS0092175.localdomain>
 <aryuwukTRtmd2Lft@e129823.arm.com>
 <20260930135408.GP163130@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930135408.GP163130@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_151241_234612_B579924B 
X-CRM114-Status: GOOD (  23.38  )
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

> On Wed, Sep 30, 2026 at 07:40:02AM +0100, Yeoreum Yun wrote:
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
> sysfs is a bad choice for this interface, it always was, this is one
> more example why.
> 
> We should have learned that from TPM's mistakes, not copied its bad
> ideas into tsm_mr.

This sounds you plan to make a dedicate fs (whatever via configfs or
other) for attestation subsystem which you mention in [0].

Link: [0] https://lore.kernel.org/all/arwNEWUEEk7jdGir@e129823.arm.com/

-- 
Sincerely,
Yeoreum Yun

