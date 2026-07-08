Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48504C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 11:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ddJSAPVz9NkXc1bzGsPcnDtadMHor6sj1Pq8riASaWE=; b=gmxXk+4O7xlqCv
	MULPpupm2sZQeqHK3GK8foFDAxLUJE4WT7DHcfuMMUTv4mrv5MF4wvLd80oskwRaqMmEXjoH12QT8
	BoyneV0eCr0OnNvmVFyEiFx8K3j3hdavf2+CuHUB4Hae+kBPa52gXsdFs6OpGbW6ao7EBL82WmQaK
	juyIINuLaIUfr2UASvgALmpQolJBQNjWRVcdTzlzC7+5AiZK7hbeVRketNRwhdwWQJYJPG3ZPvY2O
	iE916EAyvTPShUTj2BFdzZgBXqYWKdL+KNnrLkMYYH4nlg61jawWzbl8wLAccLf6z8uLb1iYllPxQ
	NKWG++1bn0d9Sag5v0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whP54-0000000Gndn-1G8Q;
	Wed, 08 Jul 2026 10:00:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whP50-0000000Gnd3-2s3r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:00:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B75871E5E;
	Wed,  8 Jul 2026 03:00:28 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31A4B3F85F;
	Wed,  8 Jul 2026 03:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783504833; bh=8oFU73UDNb1/JzzX/59Hz8/SUvhrGo6jInm1l2EOvkk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=K2QzZNWS5qvtc90qr2P/bmEBxGozBIkajd4g2BYgXL6Gp07XfQg2fDAaRimBjytR3
	 AnMyVUC1k+1MwDKxSrlcekXCA+Xo6jxwuhPGUKvb9LNjSYAl8jWKoOD6L8rj1fhHUR
	 MBLQpicTg0GtL6aQ3jsYy8mAbKKMKwErUf1HScIM=
Date: Wed, 8 Jul 2026 11:00:27 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: Mike Rapoport <rppt@kernel.org>, ardb@kernel.org, david@kernel.org,
	will@kernel.org, linux-arm-kernel@lists.infradead.org,
	akpm@linux-foundation.org, bboscaccy@linux.microsoft.com,
	bp@alien8.de, dapeng1.mi@linux.intel.com, ebiggers@kernel.org,
	elver@google.com, enelsonmoore@gmail.com,
	feng.tang@linux.alibaba.com, gpiccoli@igalia.com, kees@kernel.org,
	kuba@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	lirongqing@baidu.com, peterz@infradead.org, rdunlap@infradead.org,
	tgopinath@linux.microsoft.com, tony.luck@intel.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: Re: [RFC v2 PATCH] reserve_mem: add support for static memory
Message-ID: <ak4fu1qINGyAQUEl@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630170911.43521-1-shyamsaini@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_030034_849474_7DB60DF2 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

Hi Shyam,

Adding Lorenzo, Hanjun, Sudeep.

On Tue, Jun 30, 2026 at 10:09:11AM -0700, Shyam Saini wrote:
> Following up on this, As Mike pointed that reserve_mem is best effort
> reservation mechanism, so what is the recommended reliable Linux
> mechanism, if any, to reserve a predetermined memory range during
> early boot on ARM64/ACPI platforms for warm boot scenarios? KHO is
> one option, but I'm specifically looking for a solution that preserves
> the region across warm reboots.

If you need ramoops-like support, I think ACPI ERST is a better fit and
we don't need any memory reservation tricks. I'll let the arm ACPI
maintainers comment further.

-- 
Catalin

