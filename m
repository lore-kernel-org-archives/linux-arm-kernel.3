Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CC8C5B559
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 12:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCc9WOBM7D83f/1nIqe9HSmFb7H+FKStAMY4piLGbok=; b=Bmr28cGBes0wlcpNKZB2sDwG3a
	TFKNw2zngmP4KqPH4cMLSnYgtRXUalKN0vhxdDMRpA7/eYQYNOmtYHKy0X4gwoBB2wOZxyT2af7rZ
	f7NEOrOCfhxUe3NiqlZ+JG3JMnmxuMkK8mby1wROoaQ2AipgUJi1Yi0+ygW6c29FE+ZVaIYr10clP
	f7sAIp5zzTpmHdMy1NR4HptJKGg4nVuaQPceXZbo95pX1uXJq9t6jqAHJjkosMqJYHLEZ5ysAV3dB
	0p9Kn/k2gURaKqkXyMNSIFoEkR4UoaXGFZlXf50vpSJO8ZTiIKIU1kN3+x/xZPEKxQjwSTnvWi0Ua
	T+s1DVmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMnhD-0000000DONY-0k5e;
	Wed, 04 Jun 2025 12:58:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMndw-0000000DNwy-1X3H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 12:54:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06E1A1758;
	Wed,  4 Jun 2025 05:54:36 -0700 (PDT)
Received: from [10.1.27.175] (XHFQ2J9959.cambridge.arm.com [10.1.27.175])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA0ED3F5A1;
	Wed,  4 Jun 2025 05:54:50 -0700 (PDT)
Message-ID: <bced1b03-1a74-48f9-a4c9-c7feaf9786df@arm.com>
Date: Wed, 4 Jun 2025 13:54:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] arm64/mm: Optimize loop to reduce redundant operations
 of contpte_ptep_get
Content-Language: en-GB
To: Andrew Morton <akpm@linux-foundation.org>, Xavier <xavier_qy@163.com>
Cc: will@kernel.org, 21cnbao@gmail.com, dev.jain@arm.com,
 ioworker0@gmail.com, catalin.marinas@arm.com, david@redhat.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, willy@infradead.org, ziy@nvidia.com,
 Barry Song <baohua@kernel.org>
References: <20250510125948.2383778-1-xavier_qy@163.com>
 <6f9842a2.7c3c.19734ce1860.Coremail.xavier_qy@163.com>
 <20250603193124.347804cb5a19c9941a354ff4@linux-foundation.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250603193124.347804cb5a19c9941a354ff4@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_055456_448772_D7FCF598 
X-CRM114-Status: GOOD (  16.83  )
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

On 04/06/2025 03:31, Andrew Morton wrote:
> On Tue, 3 Jun 2025 16:00:11 +0800 (CST) Xavier  <xavier_qy@163.com> wrote:
> 
>> It has been three weeks since the submission of Patch v6. I take the liberty of
>> asking whether you still have any comments or suggestions on this version,
>> and whether the test data indicates that it is ready for merging. I sincerely
>> look forward to your valuable feedback and guidance.
> 
> It was late in the 6.15-rcX cycle and I was hoping that arm people
> would handle this.
> 
> It would be better if the patches had cc:linux-mm@kvack.org.
> 
> I'll grab it and shall include it in -next after -rc1.  If ARM people
> want to grab it, please do so and I'll autodrop the mm.git copy.
> 

Appologies for radio silence; As Catalin and I both said before, the arm email
servers drop all mail from Xavier <xavier_qy@163.com> on the floor. I'm not sure
why, but any chance you could use a different email account to make this smoother?

I'm doing some testing of this now and will respond properly in the next few
days. But I don't personally like the complexity of the patch and am not totally
clear on if this is likely to show a real benefit in real-world use cases (as I
commented previously).

I'll respond properly once I have some results.

Given this is only touching arm64, I'd really prefer that this go via arm64 if
at all.

Thanks,
Ryan


