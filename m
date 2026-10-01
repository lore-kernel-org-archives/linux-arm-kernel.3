Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B39CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 01:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajLdfQB9wv+uP8aGt8KrThjvzA7jSFdfC14OErhJ2sI=; b=q9sU0W9WxW2UUGXbDBZmnko6um
	6m1wXovFqsmHy+bhZWZ+i/5W99qUr0HMtx2DWqDJ6peHmKyBxwzm/R6lRyJ/ET5kSETAo3FjnCkcJ
	qKoOiCgb78vYbeWz7i0XuCXHJDAAtqeFXt6hi4A7W5ic0nVKd8GFmCH+8OE/QA0UiKvmn0xihkX4w
	XjTz32uqEfo1FC7OKtoc3FJc157D+Nn7gv+0wsGIeswG6CQhXstRadbsVV7+8PoNMWCxFlfkhJeYP
	LTXhxdwrhjrIjxnB9ccYQQCUsWDHut6LIJ1jSDTJLLdzfVPq6OzJGSAFaelZqf8vhObIctwR3Tt/B
	nvy3dRBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC5fv-00000007ZnT-2yEA;
	Thu, 01 Oct 2026 01:33:31 +0000
Received: from esa10.hc1455-7.c3s2.iphmx.com ([139.138.36.225])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC5fs-00000007Zn3-06JY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 01:33:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1790818408; x=1822354408;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HutbBCZxS976JcvsbprlXH4c2wa61HyhSHROQf0yIBc=;
  b=Ps1K004Lj+Fi9SpkqHVx6YN0sGa3K0BPaJnpNgw1EOL7Z+TZ1NN8D7dN
   +77Jwgudb5yBPKOG5L5e0okW7HqlINGeOwzW/2XoSfXdanfO9Rih+3z75
   5Cbf3dBmV+liFUNi0FmOllP+rZ+iuUjksefzaTrglSrf4tglp3G4vp1UK
   7NAoiG5jsRAj7OXk8CZTAWifJspFGpY56SKoWgWo+YnANF0crbvszJjFV
   a8X/oC3pz/xAy1h0/4oBYynkL6QDcya2eGFpd0RePSpmgr2kvPKp+Ge58
   uJibRoGs+B23bRbqxZmEkv0Ni1ymThbpXW7s2pyyXxY0xufrs0HNcf6ea
   A==;
X-CSE-ConnectionGUID: v4ucoEfuSxaBJLklzMecKw==
X-CSE-MsgGUID: 2bjnYwlYQvGQ3HWHYsgSyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="242933423"
X-IronPort-AV: E=Sophos;i="6.27,133,1786978800"; 
   d="scan'208";a="242933423"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 10:33:25 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id C430C7320
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 01:33:25 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 6C9291802AD4
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Oct 2026 01:33:25 +0000 (UTC)
Received: from FCCLS0092175.localdomain (unknown [10.8.107.230])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with SMTP id BD83D1800BB2;
	Thu,  1 Oct 2026 01:33:20 +0000 (UTC)
Date: Thu, 1 Oct 2026 10:33:19 +0900
From: Kohei Enju <enju.kohei@fujitsu.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Suzuki Poulose <suzuki.poulose@arm.com>, 
	Steven Price <steven.price@arm.com>, Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com
Subject: Re: [PATCH v2 3/3] virt: arm-cca-guest: Add support for measurement
 registers
Message-ID: <ar24JzI4QvVqTL7Y@FCCLS0092175.localdomain>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-3-1d98bba187fd@arm.com>
 <arx2hnTv3QaFqMn-@FCCLS0092175.localdomain>
 <aryZnqqBAjKw5xaP@e129823.arm.com>
 <arygMte5C5lJDdoi@FCCLS0092175.localdomain>
 <aryuwukTRtmd2Lft@e129823.arm.com>
 <20260930135408.GP163130@ziepe.ca>
 <ar0Y0vsOpu3WKTMM@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ar0Y0vsOpu3WKTMM@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_183328_586569_D96E6C79 
X-CRM114-Status: GOOD (  25.64  )
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

On 09/30 15:12, Yeoreum Yun wrote:
> > On Wed, Sep 30, 2026 at 07:40:02AM +0100, Yeoreum Yun wrote:
> > > > My remaining concern is that since sysfs_kf_bin_write() truncates
> > > > oversized writes to the binary attribute size before invoking the
> > > > callback, tm_digest_write() sees an exact-sized write and extends the
> > > > MR. The following validation is useless in this case.
> > > > 
> > > >   static ssize_t tm_digest_write(struct file *filp, struct kobject *kobj,
> > > >   			       const struct bin_attribute *attr, char *buffer,
> > > >   			       loff_t off, size_t count)
> > > >   {
> > > >     [...]
> > > >   	/* partial writes are not supported */
> > > >   	if (off != 0 || count != attr->size)
> > > >   		return -EINVAL;
> > > > 
> > > > IMO this is not specific to Arm CCA, but do you have any thoughts on
> > > > this?
> > > 
> > > I think this is ultimately a limitation of sysfs. At this layer,
> > > simply knowing that userspace supplied a larger buffer does not allow us to
> > > determine whether all of the data in that buffer is valid.
> > 
> > sysfs is a bad choice for this interface, it always was, this is one
> > more example why.
> > 
> > We should have learned that from TPM's mistakes, not copied its bad
> > ideas into tsm_mr.
> 
> This sounds you plan to make a dedicate fs (whatever via configfs or
> other) for attestation subsystem which you mention in [0].
> 
> Link: [0] https://lore.kernel.org/all/arwNEWUEEk7jdGir@e129823.arm.com/

I wasn't aware of this thread. Thanks for letting me know that.

Thanks,
Kohei

> 
> -- 
> Sincerely,
> Yeoreum Yun

