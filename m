Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D00CA5FC7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 14:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozxf4hkMU0FzrOoywk+aG5wesIujz7GRFSweCKb4aDU=; b=rRsXPdc7EgobkmlZp/rYZUdLj4
	Qlkqjh9OA/auSb5AsLBJebAOhdJUcPDiNWkdfmXtRMoSyfBkD4IiP3wS1z6UXor8mVeEg7Y5EmxTq
	rRo3Gqf9eCUJzOBRq294CZfqW2oAJNxodPx0CPNu0L6iOSNMYKaroF7sGtyt3WHORCFxZaJaGP6+/
	G9/R6HZAcWx6VTTOzYSZbpuFTlViApaDOEaO737vgNVTCWQd/zaJtoE7aLfVuOiVXMC3234vKsMbB
	+mylVz0TN+L0THtLlx+lMPkmZiCJqKhPyDgBaNXt1GlIHK1hEagJ8fV39mVqtU2JNu+HmkHD/XuVE
	AnwV88wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv8v-00000006HGb-2qWm;
	Wed, 30 Sep 2026 14:18:45 +0000
Received: from mail-dl2-x2b.google.com ([2607:f8b0:4864:38::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBv7P-00000006H17-2cV4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 14:17:20 +0000
Received: by mail-dl2-x2b.google.com with SMTP id a92af1059eb24-1438cb9b3a3so4130211c88.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 07:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790777831; x=1791382631; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ozxf4hkMU0FzrOoywk+aG5wesIujz7GRFSweCKb4aDU=;
        b=er1mlS0FPQ/ImD86QwdvpTHcnEN/jD3BYCEtfQD6VlLW9slxNxrR8BdeLtToDTD+5j
         OJ/tnizPZ1YEWpYp7cb4fuL98xHJESu+FAfrDGs0vxjMRN0WW5WpqeqW7prsaemc6Uk6
         xsit+8M1vovLdZECKB2NUmcaRO/tLXQ23WZGZ9w/PPuZb0TWTdWlq3kvjAePSmoVFxIS
         N+nGhohdQc8qxJDkYu5DM7lOQOmqYjgimgx5S2uFjq1bOPJJgxzV5wFEdVyBMCGfPdah
         LRwnPImRNO76qsR29KwveTsdlfgU5zrXNQ9jZYSBvmP6l4d/2b+1vOjfMNO8HbgPMq1D
         2Aug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777831; x=1791382631;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ozxf4hkMU0FzrOoywk+aG5wesIujz7GRFSweCKb4aDU=;
        b=BNJDOczqeBXxxGqpEUTk76I8YAfANAVZAL7g7jgjFn2ndzVDx5EnD/xu6c3Fw/Zc23
         GNb+qAF9KjE5b3xzQKnx4xSN1CAdc0kziTsHg5DD2JqxzzT1X/FoKG9uQ8guGqXgMOiE
         7/XVzOA7+m4/74fU8bA5rZKUG+BE8tuhJU9qEQOiwfrW4pby3hmhwXyZLNX+6uPq/uAH
         Od9wvQS0cONjo1ytdXMZKl528giXsQbFtXGera+eyQ19UG4mRPTGUi8n6+8fsU+bTqgW
         UFaPvX7la+iZI6mrpnnM8yyvU7PT8X3wTcSUfR09W1/rsAEPmq40MrP6xZxXk1hqzfiJ
         qZzA==
X-Forwarded-Encrypted: i=1; AKwUvBwMonizPRxQLO9O00haP+N+OwYU9VjhmXeu+60IGxfo+uqvshpP/QqnojNwnWdUqktOCOmhg5ByUJIxdV2ZHZ0n@lists.infradead.org
X-Gm-Message-State: AFq9FYL2uqciiNZKCwlSwc+quSH3WO3S+8A+zWME8KaBQw4vj0zIIZPX
	GxfTmFO46ZKcQjz1XrYsSmo1hlXx+qNIAc1KQUiZi2HEjnqgd/RhKeLTcLXrr5nnn9s=
X-Gm-Gg: AYBFou1TkCL51RjJFJRuGFf9y8uup50Po1nk3/zKNkM4hTLH3+mV7V+9xv5aoZNUHPb
	i4loUAQ2g5uFt8NQ5XSe9vqMRo92Aypk8keDaR1oy9HE5qxTyPF8H9XrIaSA/Wj+D/3VTxGLL8U
	1qslP+XL12lUwiKceg0dc842DSMLwfjniH+drdFG+ZBCFBleRqOa/QtnuHWo5YGyoberORDL5WM
	BLm0ymUgL/XGcgN2GEv2EBf4dO0xS6U5sjvIc89U3zqQtzXkhaHb9Y1nD/DicUmZ7QNWwRP8f1Q
	YINaOueOQ4nTZKSWidkEm6yu5PdCPOa0TgPj7KXfR1KVV0ZU/Tvi0pCW6w+dbMM0qd5HASOKSaX
	7BSs6HNh8pACU7YFRMSYisjC+gjbEfBj5dp3SQ9IPqPEVZa0dnqPlRsULA5TrSkCI4DwPNpOSla
	Uyb9GhCVykQ4Rkb500pR6WZ8gDrCc84RFBpIxLDimKh8VVeWIbcD7V8Is=
X-Received: by 2002:a05:693c:66d2:10b0:33c:e74:4624 with SMTP id 5a478bee46e88-34cdcab2d98mr1997715eec.27.1790777830424;
        Wed, 30 Sep 2026 07:17:10 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf22fd4bfsm5602501eec.4.2026.09.30.07.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:17:10 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xBv7M-0000000BpQe-2j5f;
	Wed, 30 Sep 2026 11:17:08 -0300
Date: Wed, 30 Sep 2026 11:17:08 -0300
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
Message-ID: <20260930141708.GQ163130@ziepe.ca>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929-arm_cca_mr-v2-3-1d98bba187fd@arm.com>
 <arx2hnTv3QaFqMn-@FCCLS0092175.localdomain>
 <aryZnqqBAjKw5xaP@e129823.arm.com>
 <arygMte5C5lJDdoi@FCCLS0092175.localdomain>
 <aryuwukTRtmd2Lft@e129823.arm.com>
 <20260930135408.GP163130@ziepe.ca>
 <ar0Y0vsOpu3WKTMM@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar0Y0vsOpu3WKTMM@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_071711_704952_C17DD21C 
X-CRM114-Status: GOOD (  25.95  )
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

On Wed, Sep 30, 2026 at 03:12:34PM +0100, Yeoreum Yun wrote:
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

Jiri's working proposal is to move it to a char dev, like the sane
TPM interface ..

I'm skeptical about any fs being a good idea for this kind of stuff..

Jason

