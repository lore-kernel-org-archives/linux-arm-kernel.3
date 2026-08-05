Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C91C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 21:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOlBr2Z6ScmE+dhp5/f+kPQyir1jOxNY4C+TyOhoSGw=; b=hTvJw8KCDsMsvktW/f34EdI287
	eCsAWSYoeUgqYhNDve+g5dMaz4cQ706/bShBCOzhIOcQx71D0WoeqJ40bGNchC2w91YUE4RNbxERM
	8XVBcGcdzn3///R88/b2QGAoK87OibNbSi6CjQmYqBqmwfmcUrCJKjsx8Vbvx2L8r0dC3SPp7/9Xj
	/zNL0C+ETIUo8NZKVq/ZZ9EVtfQ8tHHOVp5RBbtlNNQbTO4qndKQZdbA7xezp2Rn6mSjcXclatS+x
	QewAQA/saVEOjZF9Cr/UDBPocVeaelbsO+KV39Y/ByP2E0QvHmHsqoS+FiBshhdxTi8snZdZXYBFO
	A7LJOz2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrjLF-00000004ab3-3Dws;
	Wed, 05 Aug 2026 21:40:01 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrjLD-00000004aaI-1pdq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 21:40:00 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-47fd4531020so961832f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 14:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785965997; x=1786570797; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yOlBr2Z6ScmE+dhp5/f+kPQyir1jOxNY4C+TyOhoSGw=;
        b=Cpco/bJZdy+qzOculqSsC12Wgl3jMJM6hQVD4NemCOBGQ2MkKYGpk1Ekek/uhmnEcR
         4VVfdvx62a5ngWNRxg49Hb62dzeY7lhOLP+kHYCMoTb6mVXTID6yWTdjkik1ff0gAmV4
         UjxgF6ptN/9fZXggJasLk4W+RyNRLQ3jjakFBsSCPoea6hsM/fRdkXQicQqBdWs5Dy/p
         HgH53VwCeqPIJxaXSBuw29wUGm9OPbTKmvhInwUukKj/HG2X3IS6U9blrLY2soMGC9gN
         lAL1LhXYm+1RbFgUnOnucoipCkhLEalsStqNBYpFd2adViz28gQhKH7db2kPQ8zj7w2o
         iTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785965997; x=1786570797;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yOlBr2Z6ScmE+dhp5/f+kPQyir1jOxNY4C+TyOhoSGw=;
        b=YLZXZSUOWZZ4Pj0bsTKboqQXSdzQcz453P8w+kYDZ3dWqk1u/DwT9ho9hrR5chmozW
         zAhtM8H2Si2MPgsTrgKjILc4vZzLT/ZwONBjXe3a1iv9MqFJvARFQ00Bz4r7v5kv19fS
         ZWIy7vb4UHuvIwpcB96dUzWdLlChl70vf0RvIL9fNL4tt4M1UrmKksniWeyTW7v8Ubwe
         5FaxFp0E7IQUZqR9kasG9P0RR2PMNl5znh845chyxmpHZkPqaH0WYTto/mHjLD+ow/h9
         si+pShFlB97VTApvnv9KMWo+PXZJvNxuhN+SZlm5/3ugCa5AgaYCD7t0JCGMmpwr4+42
         ZS6A==
X-Forwarded-Encrypted: i=1; AHgh+RonLOzAuFMALzaQCaKED95tL7VwqUUTNlGSaeVCttBseA937QdXhsHxEOSZuWkuQ/VfaRvBKK5hHwezaIdNB0lP@lists.infradead.org
X-Gm-Message-State: AOJu0YxqYl4C364PXyaZuL9Km0yJ0CXDeCc9SNlYbaFzuW5BfCM8HAwp
	tsJ9XCfXdfxFg8vY1yWBvIvvzM+xQAWj8Qq4sYsLZzqkjafXA1V03zCR
X-Gm-Gg: AR+sD12JRQhNrOJ0NTfdfW/OTZW7VNz09dCgFf6bvutqjwjDh2STc8bUjmjpWylIwOS
	V4yDuKyw4vwKVz/1FzZDQjcFDMN5PAuwc9PFCcMtn4NRN8+fRDJufRv8qNkllc70GzO2DqdQny/
	AysVW5QehvbVQY1z6G74mBVD7FWU2TzZC2uv3UE4rt5ikTY9ziDeEq3dUkYQPp2vvERfvQencgA
	HJvNmfbJ1YWMaWWFFRa9RGC8jgUPjA0ZBS+Iut75ikulSoL2KvISjhXz86JDnzT8qgEFC2T8D0c
	PBjvuHXmfgHxXEVROdn06/ZscUdqRIicMf4A30vEEUZpyD+JupbYPlNf4SIzWustGW7SVyVX7JT
	g62WCkEk4cOSRsAvxzV0XYkYKJP7f7sudI0x8WXclXi97wFwIsMCnJFIFN91EjS0P14q7UKfL3U
	6Z97AIVvfPt+XTz24t3JckPRjMc0o2yMhEj3blfN3D6Dho7EI4p3KpGZRuJPFeBo5Z6r+PoGY2Q
	zFrW2tPYWAzqXansIGARoGxzjkbh2cxcy9+64+ptVt2VvxNSnJaGxwQHXTcQsyJRKz6Ba01+VsG
	9TBfwbMPNtG2KiP+rpOCufRulZbr82Eiwjbhox1P
X-Received: by 2002:a05:6000:1863:b0:47f:5371:1b15 with SMTP id ffacd0b85a97d-47fec63491cmr14018614f8f.26.1785965997040;
        Wed, 05 Aug 2026 14:39:57 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-114-073-248.95.114.pool.telefonica.de. [95.114.73.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff79b32cbsm568073f8f.10.2026.08.05.14.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 14:39:56 -0700 (PDT)
Date: Wed, 5 Aug 2026 23:39:54 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, grayhat@foxmail.com
Subject: Re: [PATCH 1/2] KVM: arm64: nv: Allocate the shadow S2 MMUs
 individually
Message-ID: <anOok9XvLMNX_Aqu@gmail.com>
References: <20260803224405.41468-1-kmehltretter@gmail.com>
 <86mrv2arf2.wl-maz@kernel.org>
 <86jyq6aq8g.wl-maz@kernel.org>
 <anJcUNlnNmP-mKWH@gmail.com>
 <86ecgdaupe.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ecgdaupe.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_143959_493271_B86768ED 
X-CRM114-Status: GOOD (  18.73  )
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

On Wed, Aug 05, 2026 at 08:32:29AM +0100, Marc Zyngier wrote:
> I'd rather keep it on the VM creation path. This is VM-wide data, by
> definition, and given that its size doesn't depend on the number of
> vcpus anymore (we allocate the maximum once and for all), it is right
> where it belongs. See the untested hack below for the freeing on error.

I'll send a v2 with this soon.

> 
> > There's another issue in the current code: the ptdump debugfs file
> > keeps the raw mmu pointer as its private data. I would add that to the
> > commit message.
> 
> Why is that a problem? With this approach, the mmu pointers are always
> expected to be valid, irrespective of the allocation pattern, and we
> only publish pointers to the dumper when the S2_mmu is actively being
> used.
> 

Sorry I was talking about the old implementation. Array reallocation
leaves ptdump i_private pointers dangling.

I'm dropping the selftest for v2. It was a useful KASAN trigger, but is 
not a good fit for the current suite.

Thanks,
Karl

