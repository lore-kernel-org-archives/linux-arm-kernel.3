Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E284C61DBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 17:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gwb8vYO3uznd15Zsf6rDYA4qtHhV4Fr7KW8splPiq7U=; b=aw/w7PkYME43c73758cto2SvyY
	tcmaHGQMBeQHZU0CQtYNJIli7pMHnFEVn/UBmk5IDZ2Zp2ktutVjixCqKWZs/IxvVakKr3N8ZSnLk
	8oYVBGPXuD6FzHabVpDZ1cudsOZh0f2YkNWcsh9Ur+ekcGB5O70hr463FJnaAEoVejqccoPv8HbH6
	z/OE17MdSC5uznvjzjl+dbwSaDTurLm5X/RNf8Ozj6EdZxE7ZBXTAoEVRa3pAqjpvXj5zE0ljQ4gq
	XnBFjC148bk4hVW1UmLYFUza1wyn44ehQLq85TcMu465pjwktPnzm7Kb6fVy2mgE7xRJnYllSMFAt
	65QXRuYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyv3j-00000001EFq-3wLF;
	Tue, 25 Aug 2026 17:35:39 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyv3g-00000001EFQ-3LD4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 17:35:37 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2d3b440b97aso7325ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 10:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787679335; x=1788284135; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gwb8vYO3uznd15Zsf6rDYA4qtHhV4Fr7KW8splPiq7U=;
        b=lsGaqg0Ri6ojd+M2cWFrhJQmTcoPNPMHjJhHS3PmgHVoY2ichDoGVEvECj0Jt3vcd2
         fg4JT7hPPx+HJCS4DfAt3OqPKvYSWYZ0XTsMsl0Y9z+DObjchMwlw39yjSejR8aJxCno
         +BzyeMKzABfmhmUJ4TKNghwUaMAhnzekVxAdZ43dfPmD+W+TRPzQLLFDsw7oG2oCw6YY
         Xsi0qg+QHFBcdV9mIehMWMjGFehvDJWB2K/Ko7o+wei57wFt/0+FAXKWE3kb32/IraUH
         uCUb8tJBRFSf2lKRXGSvZOCvlc/EEXIdGJxKe3nlU3+YjN82PoSduSUweRJNeKyu5JyK
         MbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787679335; x=1788284135;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gwb8vYO3uznd15Zsf6rDYA4qtHhV4Fr7KW8splPiq7U=;
        b=h+/lvVq6+NY3ymUfY86PfcLhi+IB3oYI3qNlD+VMSH5lmxjYbHEsIxJBzoxWQFATuZ
         lHZMOP7CLAmY3S0ZjyT2az652JwxzJi2ERwMx2b1jZOQu836pP5Em9WKP31plT0WXBSE
         lEU6xoAR8TXoMQEdE1WXwm28f5aaaYf1ne5cX7ZzlbBvcgJY1tz4GKQN7b4IIaxMmk1C
         AAvd8eHUjrXMabZx6BAGSqgZFkQS8leUlJeXUwQVAj5iJS8gL+ru9xuk7ZZ9h/uLq9mZ
         2H7vKK9lzFqkVJVhRbl+yNcJ8DDNUKYuEoorXyFwpwYJVdrBX9nHbmWkYX45X/qzl2j1
         uJQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqyPOuNmoAbpLTV7P7coW7eBCeckVD0dkaMgTcJ4ESYFF4DUcLsh/VO6KW9xjsDlb0FQ2A0XKCQlHxQcamJ1/Gw@lists.infradead.org
X-Gm-Message-State: AFuF++nPG2YIIXZukITJBpgIuBECnA1sdNdHKNoCX9OVXZcBM9Zp7f7u
	5YXbucnFGz7gKU43eq8ScWjcbAcu3mR37xFWpfmlsnqBNd6yVWEcTahl6NBQENpCPQ==
X-Gm-Gg: AR+sD115w7qtCG1d/3jQKusykw1pAvdSk7WA6j9ZzPGMOvt4AYrt9lEMYkAgGRFVmt6
	IjzseyVGerl6DWqqJyBVhr9q7273HPZgfHFUBpImSbZqruD1VLERPVcbsa0Nn0u2fOoyZ2ULVLf
	VxF42eKYlJ4+7aRVTM/kbyXximvhkIAM9CrBimyh+TfoUsDo5EKe0PSS0GDgc0E/rIbuuT/IaCB
	Ki7VQT83T6Qnmr6cMlZUp/QBDlxZCUIMTdAJoreng7oAuvVWSwgJZ9v+GG92MEuOwcvpP0bDNm+
	9QtsCiCUG5lUJvciPwkv0MfQb+A25pNzAyakE6czyp1RlINWuMGwf0L2Qn5h32Ghtts4QnGA5wS
	xKgCYB6AhnCisWk9cx2Nge7tfL2vLlHOzcW0uC190LvaR67Ra8767FBJp1FJuReSMMK4QTA+nv1
	Fex1AFNTCKyw5MN4NtvCb44cUEagU7ePQTbaE/AESFqiWIVj3Ug67pojuouK0Pi3ZgvnR64G8/K
	TcPUYF4Vl5feHYJGl0wquP9Og==
X-Received: by 2002:a17:903:8c8:b0:2d5:c090:3810 with SMTP id d9443c01a7336-2d6e0518b75mr9553085ad.2.1787679334305;
        Tue, 25 Aug 2026 10:35:34 -0700 (PDT)
Received: from google.com (164.210.142.34.bc.googleusercontent.com. [34.142.210.164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668767d65sm579978a91.8.2026.08.25.10.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 10:35:33 -0700 (PDT)
Date: Tue, 25 Aug 2026 17:35:28 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 01/12] iommu/arm-smmu-v3: Refactor arm_smmu_setup_irqs
Message-ID: <ao3SYLiFAQnsfJGb@google.com>
References: <20260728210928.1050849-1-praan@google.com>
 <20260728210928.1050849-2-praan@google.com>
 <178767577112.3356902.15076197547390630060.b4-review@b4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178767577112.3356902.15076197547390630060.b4-review@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_103536_860432_E85859DC 
X-CRM114-Status: GOOD (  19.96  )
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

On Tue, Aug 25, 2026 at 01:36:11PM -0300, Jason Gunthorpe wrote:
> > [ ... 84 lines skipped ... ]
> > +	/* Setup interrupt handlers */
> > +	ret = arm_smmu_setup_irqs(smmu);
> > +	if (ret) {
> > +		dev_err(smmu->dev, "failed to setup irqs\n");
> > +		return ret;
> > +	}
> > +
> 
> The sashiko remark makes sense to me, we should not enable interrupts
> until everything has been initialized and things are ready to go. So
> this is better done after the device reset call, which is the thing
> that is setting up the queue pointers in HW..
> 
> I'm not sure what to make of the MSI register ordering around kdump
> comment.. Nicolin?
> 

Ack. I agree with Sashiko's remarks, we'd need to call this within
device_reset right before the SMMU is enabled (same place as today).
I factored this out to avoid setting up irq handlers multiple times
across a suspend / resume cycle (for e.g. we can't request_irq multiple
times for the same irq). Otherwise, we'd have to de-register IRQ
handlers in the suspend callback. Maybe we could do this ONCE based on 
some smmu->inited bool?

> But the refactoing looks fine to me
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 

Thanks,
Praan

