Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034ABCA5FBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSNUtQVp5d6e8feP+/xEzUsoy/t/hdu097Eyzo7g4ug=; b=lL8Pv32uy4mHogGCcjz2F55V3L
	VwxiGxE/ECkWObD/9hCbvTQK1qAlEFuC+SGgwy32DdRVfOl2NNP+L938wpGOpcC9fv4avJV4cCTzj
	umeXupG0zp61YsiEO9Y8a4yYmQPstjtvS+vVAPCsju+VfcUPPNEFRvD90SHf6EM/ZJMny4PSCeNxA
	+b3sklJDnel74oRSeABc4F+QW28ZBHGQQcuWvRdr7b3rhYpO4hfSXhs6aUuzjOG3n9oaMPSryYzbv
	aHwrLEOFF7PIiT7Ye9T5nQUSCwLs3ICsp6JouuY+ys4/f+iWw/zJ0CnuaS7t4Y3NKvyl4U4+/xMpX
	KrPGDDlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBulD-00000006Bkj-3rkB;
	Wed, 30 Sep 2026 13:54:16 +0000
Received: from mail-dy2-x0f.google.com ([2607:f8b0:4864:36::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBulA-00000006Bk6-3dJQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:54:14 +0000
Received: by mail-dy2-x0f.google.com with SMTP id 5a478bee46e88-33e630052ebso6025430eec.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 06:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790776452; x=1791381252; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kSNUtQVp5d6e8feP+/xEzUsoy/t/hdu097Eyzo7g4ug=;
        b=IOazKUTHy68+3LZxIrECBy9kT2TZx0sv9pWJ3DlHUo/yC4mjKYxk4E3XeJG6mWoBrd
         6SabpvHjsYbgeF4GV05HJ539+0UnIBcrnHKu3PEzXsrVC0tTDgklm9pZKMy31wE398aH
         HBKRfLfY0CjVJL+KIIdMKAHZiSYm2ZKoCxbKx//6SIGnK6wtN1jNZKgf1RyU0PIqDqWG
         b5O/1VKhw4lHepKUlty0KwnYjnhujRgACacl+Jlc+pkXkn9StPCZkLUAFZ9nJ9VkeXYG
         6GnPilS8c5E7P8cRzvimlosGvHWNv8gP56bPYGq/rmcqCM2MYsxez2KhOqn/YFal9E8a
         sksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776452; x=1791381252;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kSNUtQVp5d6e8feP+/xEzUsoy/t/hdu097Eyzo7g4ug=;
        b=pTlz7ZmIh/WVp6Uywmo516Qf34bfk6DEah3YNg8Hsq12wGysF35OlK7o1eRlCWPV6z
         HC+z1xn+moBI8rMhLhNPGlYLcpA+uPj0GE1SJdZMOJqtT/gzkGGDLr2cx/Nb/NiO44TZ
         LAytFePxDzAo8z6TDe/OaNguoyPIpFa2nmr3v/Ubv1DRs25UFtT1UrrkdfWqEHToMhfR
         iNd2GmnCP2UU4hneyU0e3qnOojtZLtOn+1YYfHDJ0YX1VVtIx7EX2DQH71qA4UFY3a3R
         XkKKipNgFxY+Ivzo4t+sG5xwVT/Bq3ZMGdp+emLdK2/snzvTfDgnCPMWqUyZCh5pUc2c
         lgow==
X-Forwarded-Encrypted: i=1; AKwUvBxU1LtsbpcJZZTZW37Zq4+LEU/1rRaffAk2sRi9T55JZubFLcE0bpe0PfZstfscIeiOlVJCCrS44kdA3b6OzBEg@lists.infradead.org
X-Gm-Message-State: AFq9FYISDdsZnJx8iFRSZj/8MKCnpwnjdNSu8ZhzFhXQ0QkvMlfrn7tJ
	LtUg58EnFkbEH97ecWCrg8MriM4nGRugFqIW8HMIySMlMVtnAfcTEW60suSt974AICU=
X-Gm-Gg: AYBFou12FhA8QxVwiSEYR/EXfL5WwFGqqa+bRe4RIGGvjl+4gxvmC051B5X0HKIGdgD
	9Q570mB1XaVEIL9t37npKdvTGjPxvOJbyT6IFd+j/iZuvwa79PdKWu002aRi+3DenzNGgGB82BL
	sfvGWSpFTOVbNrtMEN95UoPYPVaGf/3doDnVpsfFhWrEUQkY3WQww/spqsJ3Jz+RUksbtYrwvJH
	DuJORzjk98uQZxRrHdoMsHuoAN4MlqrC+EqJkfzfcYMzqUEu0lg7R9bgCYNM7Mk1dFuuEb8XEaz
	5gnrDzRz0jS9A7lN4w0lmE9if28WB/8SJq0PKJTNEvg5+bIyEHoPkOq91H0A81FD0bUNEj3DvwW
	kNCx9uXgksjizn4bbrXa3Rt75dqFYlfIs6Sdgu/5rhP4NiGHeyPSLmafUr5qww5epJNBCPUY38m
	f0d8ndFOwG+v6R/TVJnVChJEh8arKCutk1fwrVrmN20ihcUA==
X-Received: by 2002:a05:7300:2143:b0:340:e422:fd3d with SMTP id 5a478bee46e88-34cdbad6906mr2918204eec.17.1790776451659;
        Wed, 30 Sep 2026 06:54:11 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf514b783sm4165034eec.13.2026.09.30.06.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:54:09 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xBul6-0000000Bmsz-2FAs;
	Wed, 30 Sep 2026 10:54:08 -0300
Date: Wed, 30 Sep 2026 10:54:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Kohei Enju <enju.kohei@fujitsu.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com
Subject: Re: [PATCH v2 3/3] virt: arm-cca-guest: Add support for measurement
 registers
Message-ID: <20260930135408.GP163130@ziepe.ca>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-3-1d98bba187fd@arm.com>
 <arx2hnTv3QaFqMn-@FCCLS0092175.localdomain>
 <aryZnqqBAjKw5xaP@e129823.arm.com>
 <arygMte5C5lJDdoi@FCCLS0092175.localdomain>
 <aryuwukTRtmd2Lft@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aryuwukTRtmd2Lft@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_065413_050843_F4C38C1F 
X-CRM114-Status: GOOD (  19.79  )
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

On Wed, Sep 30, 2026 at 07:40:02AM +0100, Yeoreum Yun wrote:
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

sysfs is a bad choice for this interface, it always was, this is one
more example why.

We should have learned that from TPM's mistakes, not copied its bad
ideas into tsm_mr.

Jason

