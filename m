Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BCCC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 17:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAzhxC16UU+/rnLyUKWUpbnsD1PlWbcpokqyOn+1QWs=; b=ayeA5/TI4Q6hz3Iy7eSWxX3EfF
	kdy0TXI1NQYwIz50NXDjmQVC4HOvfpzdeD7P2cLAcbP2MC0NzcHK6nqLcIvIyL6x1qiBAyDOB+w8r
	tw6WVHjaFyyOHYNBdnuM7ZCcmPThtbowXdavpzrsEwDzQA2ZV63W6pe1w7dGfyfn0pPem7QG7VX/t
	KW9VB3YA2xb8lQxoVXJxCB7pyY/Q7tiel7QPg7wvhfAgpOZThWZO6PLLeeyKDAfGjwjS0+3mpfRNV
	f2jHw0Uft/BLoiXpww4GJFYzNvFRNMMxhpTfH6m8zgGTeJ/MEQULH9jM2P8mkHXzJX5pvYHppYVEG
	FdkQd5ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XxN-00000002vJj-2c9B;
	Fri, 04 Sep 2026 17:44:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XxL-00000002vJ8-3Vy4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 17:44:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BC521152B;
	Fri,  4 Sep 2026 10:43:58 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D31E43F7D8;
	Fri,  4 Sep 2026 10:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788543842; bh=LAzhxC16UU+/rnLyUKWUpbnsD1PlWbcpokqyOn+1QWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SmyUMwyf0fOz70a6iHmJ+0r0316naU9TPE7vIrtpLEUdB3KCGgXUiWsWHn4o/cKUt
	 sod5v8VTNcFXtS2tCLd7b4DTqfvyTiDwB7q15s5kcOyC/ZczcxTHpihXp7RjInDgTZ
	 gw7h7vMgIzP4x3iXIayPrYKYO4xHtkXtWicQGoEk=
Date: Fri, 4 Sep 2026 18:43:54 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/21] arm64: Preemptible this_cpu_*() operations
Message-ID: <apsDWloW0TX4BHXB@J2N7QTR9R3>
References: <20260904161758.376504-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904161758.376504-1-mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_104403_940480_D17FA6F3 
X-CRM114-Status: UNSURE (   8.93  )
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
Cc: vladimir.murzin@arm.com, ryan.roberts@arm.com, usama.anjum@arm.com, peterz@infradead.org, catalin.marinas@arm.com, david.laight.linux@gmail.com, stable@vger.kernel.org, ruanjinjie@huawei.com, james.morse@arm.com, yang@os.amperecomputing.com, cl@gentwo.org, maz@kernel.org, david@kernel.org, ljs@kernel.org, will@kernel.org, ardb@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 04, 2026 at 05:17:37PM +0100, Mark Rutland wrote:
> This series reworks arm64's this_cpu_*() operations such that they do
> not need to disable preemption.

Please ignore this posting for now. I'll spin a RESEND or v4 next week.
At least one patch didn't make it to the list, and some CCs have been
dropped.

Mark.

