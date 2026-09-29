Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C7BCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 19:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlqSekmBIvaPzDfuozpOnY+MYgiQ1xGecmLC2it8BD0=; b=fZ1tsj4IwY54zthS3aOyPr4tmc
	eFOpCgQXcVyPVCbpYgLG2yDURuiRVzhT4Q8rdivgyABtY21VuMK0RsnihfWY3fktvuicLtcZAzW5i
	cG7agIRS4LFjcebfTYgzPw8yYmzefs2CSNuEUA56AkzFIbH6LAPwlH9jYR5xfFSNKrtwLf4KZ+y75
	RxnFAXdRnv5tcHz6cXCt2urPFZzv/VHbZcZpHGGE5xNCGSucaDMTwltm5bVUeuCdtBbwC3qHQbmQU
	Yc+L0dDAKSZkfURB5J1ZsKrRA7jySwlSu8GtzP4V/mCvVtvVylmBXMBHW/GTYRqy9FGESGZiDvOG3
	jj5BNK7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdlD-00000004PuW-3k7I;
	Tue, 29 Sep 2026 19:45:07 +0000
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBdlB-00000004Pu6-2fLi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 19:45:06 +0000
Received: by mail-dy2-x0e.google.com with SMTP id 5a478bee46e88-3411e0ace58so5898381eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 12:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790711104; x=1791315904; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dlqSekmBIvaPzDfuozpOnY+MYgiQ1xGecmLC2it8BD0=;
        b=mu1KlSwEYuAzTJE9qWkC26aPyBZbY4mBp/BTwO8COrmtXAvNM76ZWU1z0uDrqMN6V6
         CrIt6qDNklDT9flc4Ln857tUCfKFSiJpfSC97eiZoUn44/N0hvGPaawpe3Er7s0fabt6
         Fj25LcOBHo5U8FJxWatZcDPMpygrdrDlWqkJBWyHe5NSG23p6hZpz7htWXSYG37bjybF
         +kaCUZv67ttnLrSRnWkaJdZLn+r2Vq+/V1vkAy+RkV7AV9kD9L3cksTtrxzpZtAb6r/h
         MvGEOF1EK0cI9xRKtFOFkDEwjlx4tWNu1ls8inokjMq5Y3VhX3u2MQ59L3C7lLXhkmFC
         6XcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790711104; x=1791315904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dlqSekmBIvaPzDfuozpOnY+MYgiQ1xGecmLC2it8BD0=;
        b=O2OBATYcxjKw4tVVTucpLRcjnWqvNlRG9JuRmCfJz22BhgpoDOYMdVdoiJs8Dv59WF
         /JiyMH3NVq2JkxPn641R+ZHvt4N0OD+moB56kr1zM+7SRgz/MP1R0ECGtwLDtt8REnSh
         nHxXAScTn0qAKNz2Biu+VEOlc560d7lm/GGNuML2MwXCZyZ33LdI/UQbt/40FM7TwmV5
         8m8MorWTqZ5qI5fL+1GCmNjPMFRQ4elLwXczIpL0yk/15KoVxiSpck3Y3Th1DweJmj5A
         lsPPninsRQjKVk8M2CsWLzSAfQRRJgdrCo30vbaSsk8/VEAjicMtim3PNh73+CtcJB4L
         vpWw==
X-Gm-Message-State: AFuF++k2yZUQHl42m6otUnnP3mdewV/JsMcRWKCh6gT74ZHI+20Wk3ir
	1tvEExB9R4OeatBizc8USmeaRKyYk1DsnmiUsezV6WcnsuYVeViJFImVkq7y7or55ks=
X-Gm-Gg: AYBFou09AhqJ2MmJHRg7qFRL4GkX2G9Sy+3xKyOviiS0pBiFuqrdhzHpXW/Vqrp4bJt
	TllWodOSywa+QYy+XEdrh6XZroctUbLUUEGiSIGPoyyfSrFxidCB2DHxVwkZKfduYEyyBwx599q
	aDOC50ea/JqTuN+Onj82MquRBP169qdza9fRAmNYEyUN5WcvNQRYoXnuyZOJNxiHtFPHmkRBpDH
	ZnhjJt8AS0aTrvLflh0vcUmRWhM7ozzrTeegH2JnMLUpddnktFzDLebfm4O8imPEW3lfFpQhh1P
	q08ITSu4UmZGiNPNLJPR6hn06ZoyXYygkf5pMiufIgmnUwQjvTludldoRTKdP6ELMMT6PVnOxEI
	Mkxdte9M6pjIukHeQmAbqmkLR0fww/abEVbn1gY/Y67/9xk6nUtXaNTD/qNmZ+FUctZ0H+1rbKO
	sutZi3v5scCi3masevEZLYvkvwpeuODz0FQeUHtMlg9XTb
X-Received: by 2002:a05:7022:7f1b:b0:13b:2f26:6881 with SMTP id a92af1059eb24-14c9c46fbf0mr312799c88.4.1790711104075;
        Tue, 29 Sep 2026 12:45:04 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14c63acab5esm1202011c88.10.2026.09.29.12.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 12:45:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xBdl7-00000009uUb-3ljP;
	Tue, 29 Sep 2026 16:45:01 -0300
Date: Tue, 29 Sep 2026 16:45:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>, thuth@redhat.com,
	Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH v2 0/3] arm64/virt: Add Arm CCA measurement register
 support
Message-ID: <20260929194501.GO163130@ziepe.ca>
References: <20260929-arm_cca_mr-v2-0-1d98bba187fd@arm.com>
 <20260929192051.GN163130@ziepe.ca>
 <arwUrOYn0NVySdzm@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <arwUrOYn0NVySdzm@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_124505_675550_83FAF64C 
X-CRM114-Status: GOOD (  20.31  )
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

On Tue, Sep 29, 2026 at 08:42:36PM +0100, Yeoreum Yun wrote:
> On Tue, Sep 29, 2026 at 04:20:51PM -0300, Jason Gunthorpe wrote:
> > On Tue, Sep 29, 2026 at 05:57:46PM +0100, Yeoreum Yun wrote:
> > > This series adds support for Arm Confidential Compute Architecture (CCA)
> > > measurement registers in the Linux kernel, enabling guest Realms to
> > > access, extend, and expose measurement values for attestation and runtime
> > > integrity tracking.
> > 
> > I'd prefer not to add any more tsm_measurements users until we bottom
> > out on the attestation subsystem.. Mainly because it establishes uAPI
> > that doesn't really do everything people need from this stuff..
> 
> Tend to agree. However, I think this seems like an integration with
> the attestation subsystem.
> IOW, although the functionality and interface are currently scattered,
> the functionality of the TSM MR doesn't change —
> showing the current measurement register status and generating
> a token with a challenge. Therefore, even if the subsystem is refactored,
> I don't think this would be a burden for it, and personally,
> I'd like to see this patch series emancipated from almost six months of waiting ;)

Yeah, but it immediately establishes a sysfs uAPI that we don't want
anyone to implement :( That's my main issue..

Jason

