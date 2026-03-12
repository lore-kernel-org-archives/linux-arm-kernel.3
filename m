Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA3F106ACCD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 18:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MK0tVrkFlYhtOCZ0KvjIJMhJp307ZXYuWb0oUy4onRw=; b=B2xsFIRpr1bSFmsvGaTUrdg6q4
	QTJ3pJHQa3B2T5Pbqqm7Gg/1rXY/xdRGrCrCS4gBp3wfpg/MQNFNTJdv+VFl+NZC5nrnvegpJyxG2
	jEfbqce4op1PQrFg8F9Su9gX663nPmWw1zutFO00UKQ18lN0qCSQjcTagBu4Zi6XXO9hCcF3tuUEj
	MBXNRIJgi+YbEy92fxtmnLcrfcSFhAXauF2FrbFBlUgQTEkuXJvsLq4Vhyyn5Q/lG+LKxQRQmLGPn
	nwVwkLBhXI6J2TuLTAVTKMs5kx8w49QeXPrJ4nS5Tk5jWrHu1bwMff0Y6VxmFdev2e4cmgWPfO0nY
	dZfL8DyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0khl-0000000Esay-31zi;
	Thu, 12 Mar 2026 18:24:17 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0khi-0000000EsaQ-3moq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 18:24:16 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-82418b0178cso845515b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 11:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773339853; x=1773944653; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MK0tVrkFlYhtOCZ0KvjIJMhJp307ZXYuWb0oUy4onRw=;
        b=T6Q/NW8q93ZPWNIl/iA4LBzcTxBfb8UKLS6ELDLs0eyd8Pa77jIAuzxcbWYpkabTn8
         +8YULPIvmMR7ktz7L2aRNik6HWUGqlnNEAx00UJJGUKTt94dUEjcwJ05SKP+Gx28LaDw
         acfkJwy5PTdQGfOI9Jq99PqgQiCAcYY8ci3BCJEHG+IO1kMrhXlM5+bF2I4akK+3I0q1
         ZmX83qe2Wa2wSr0UII865X8zFHWxathApN3aiKaO4jRO3Yb8eq5F9ngyTGkL6DDpO6mV
         dduDdw1sz+fjmLNtkTo2DcbvgYc3KsjIPZek2592YUC0pStAwmU+OCcCcWu38Ic6dNPx
         oplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773339853; x=1773944653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MK0tVrkFlYhtOCZ0KvjIJMhJp307ZXYuWb0oUy4onRw=;
        b=pb7SgIapgkc0kuWoFWFnEXP0E4etDg+TBVeNM0pvTgdO/6EszoLgbLhM8eZNihppx4
         JT8AXnAyED/4g5i1GPxaXmj24j5iMLkmXfyHOr659fLYGBYZPAKiCI5+qPCfC2oNRXsV
         V97hb/UjtXLD0Khxs+ROlJ6+mp8RlGUl6EnADpdEzrMlBUGhkhKpAI3PUBe6In432MZd
         V7ok4Dr6QDoD8mKWljrgkcRXfoTlVJytNdA+jYnxiHNZmCDIw6szstgIjRJEmdblN9DB
         UuSVhjYoWO4+SEFCrZnEnEIBdBjRZFONCDNqAvP8DpNt0wLsBnr4elvzsc4PbKNPF00J
         9+ug==
X-Forwarded-Encrypted: i=1; AJvYcCXAXJMVNMBL6ODsYlk8dpQbyERHSdZrPEoUULQsHzod8h0YTVUBVNfNrCpMjiPQtNjzILGiHWiIZCBiLXfAY04e@lists.infradead.org
X-Gm-Message-State: AOJu0YwklboQGtetwQiRKei/KB0Y/qcmPGFh5+Yy38Ww3OKqxCmWAwJV
	1bJTkwaVWEb53ZdTVD0GNNiUWmY6gTvFh7J+F7XNxrzAQ/iLxFHV5shh
X-Gm-Gg: ATEYQzzd3zUjdquXksTd2l9TcQXaOw3ubE62L/wV/sTDUiGfHU0leqQcnd0eDJsrhQd
	Fj5TMMcpCfMDv6QYLf0TYSozR8QvDT+285hxHiTvm0j6P4m7Dh2kCqlWxBtQqoopMnMUOYNI6gd
	Zc5QomqP6AaqEYfKlg3P1umq539N/+DfpI2kJo+G8Ip1P8d1wq7XafJOmkH0Y/yHmFCuplOMRar
	vluNWk3KwAMFRrZxogKwJ3QLZHZawsW65b1nOa1ZSKQ2BIvEWabC1uyTraG7K2oJXkANflVDbQN
	yICfx/RyWVPaZucxnPoqsm86EzZ1WdoHxB51F+StojRdpxlDeQ8h0ZHOMknAaAq2tBdsY1Jww/Z
	tMKw3+lF4P4J7VCofyT3maywUwEC2XOYQ+rXwjVzmI5cd//DQs2siesKq9JJQvUkMqusu5jYdi8
	UsKuPFsDaLhL1JIUaoLNjlnHn/ur5pUZ9y+S7fRpVpCRH1qO1+ZNH0ou2o8O1f
X-Received: by 2002:a05:6a00:23d2:b0:829:7b15:848 with SMTP id d2e1a72fcca58-82a198d6a4cmr413604b3a.48.1773339853254;
        Thu, 12 Mar 2026 11:24:13 -0700 (PDT)
Received: from eric-acer (36-225-72-126.dynamic-ip.hinet.net. [36.225.72.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0738528fsm3708429b3a.56.2026.03.12.11.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 11:24:12 -0700 (PDT)
Date: Fri, 13 Mar 2026 02:24:09 +0800
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: will@kernel.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	jserv@ccns.ncku.edu.tw
Subject: Re: [PATCH] iommu/arm-smmu-v3: Allocate cmdq_batch on the heap
Message-ID: <abMEybRcTskHOjd1@eric-acer>
References: <20260311094444.3714302-1-yphbchou0911@gmail.com>
 <abF6un_jrQ8zGZZ4@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abF6un_jrQ8zGZZ4@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_112414_966607_7612B285 
X-CRM114-Status: GOOD (  20.65  )
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

On Wed, Mar 11, 2026 at 02:22:50PM +0000, Pranjal Shrivastava wrote:
> On Wed, Mar 11, 2026 at 05:44:44PM +0800, Cheng-Yang Chou wrote:
> > The arm_smmu_cmdq_batch structure is large and was being allocated on
> > the stack in four call sites, causing stack frame sizes to exceed the
> > 1024-byte limit:
> > 
> > - arm_smmu_atc_inv_domain: 1120 bytes
> > - arm_smmu_atc_inv_master: 1088 bytes
> > - arm_smmu_sync_cd: 1088 bytes
> > - __arm_smmu_tlb_inv_range: 1072 bytes
> > 
> > Move these allocations to the heap using kmalloc_obj() and kfree() to
> > eliminate the -Wframe-larger-than=1024 warnings and prevent potential
> > stack overflows.
> > 
> 
> Thanks for the patch. I agree that we should address these warnings, but
> moving these allocations to the heap via kmalloc_obj() in the fast path
> is problematic. Introducing heap allocation adds unnecessary latency and
> potential for allocation failure in hot paths.
> 
> So, yes, we are using a lot of stack but we're using it to do good
> things.. 
> 
> IMO, if we really want to address these, instead of kmalloc, we could
> potentially consider some pre-allocated per-CPU buffers (that's a lot of
> additional book-keeping though) to keep the data off the stack or
> something similar following a simple rule: The fast path must be 
> deterministic- no SLAB allocations and no introducing new failure points
> 
> The last thing we'd want is a graphic driver's shrinker calling
> dma-unmaps when the system is already under heavy memory pressure and 
> calling kmalloc leading to a circular dependency or allocation failure
> exactly when the system needs to perform the unmap the most.
> 
> Thanks,
> Praan

Hi Praan,

Thanks for the feedback.
I agree that kmalloc() is unsuitable for the SMMU fast path due to
potential deadlocks and the need for determinism.

To resolve the stack warnings, I'm considering using per-CPU buffers in v2. 
Does this direction sound reasonable, or would you prefer to keep it as-is
to avoid the added complexity?

-- 
Thanks,
Cheng-Yang

