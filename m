Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34158CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 14:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpTdOrj2/1YMe+JfICda83vHBh44GGQnNDLrcg0mYY4=; b=0thOwAZ5DppEMUH9K6Yk2V4md9
	l2oQ3u6QQ1t4c1DdZy8yi4lpHTkTA8m033egZ4423Fd0+B6D+Q+AeARfH5jHEIYpb0fyAdUWEUciX
	kR5Cele1dQSekO1LNWMniDkQprGyeWNfTD4pX9OK2nTH2Ka8Sv3VaeI2VhdkQF29eTWhu2wtcQVcW
	twrT0uVyxTEpTk/FNKmNEjIRpUcyEwE9mJL5HxhHqfIuIRw7pg1rqxTZHSSeIdCuXxg/f376kz69K
	6FEVj8ZEgp72srCs973/pZWJ65AbUAzHgYXIDdcUulfNs6z327yyplspYn5JaDersVcDQRky6wQ/o
	NRHURmxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBvl-00000000jJM-38QC;
	Mon, 28 Sep 2026 14:02:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBBvj-00000000jIW-234k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 14:02:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BE0191A00;
	Mon, 28 Sep 2026 07:02:02 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D07553F763;
	Mon, 28 Sep 2026 07:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790604126; bh=dwo/7H/kyhi0uqLDFZ+V6WuX3qFrA95uTlT7TB0bQAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=esd5N1BfIIQNpSfmKiQ8/X/si2jjCe9j7kFqvk5pDRCJbYqVAaa/BzG+il33yoQiu
	 gD3wfFgldRJdnX9IZCA7ERxg2luZhTD7fV2h0NxReAHYEJJgkU76N3RyhoRebVuFF6
	 PghZ4XYDlQcRIPX0I6Uwa4hEcTspI4Ja0zUedWF0=
Date: Mon, 28 Sep 2026 15:01:59 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Grapentin <gra@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Friedrich Welter <fritz@linux.ibm.com>,
	Fuad Tabba <tabba@google.com>, Gautam Gala <ggala@linux.ibm.com>,
	Hariharan Mari <hari55@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>,
	Nico Boehr <nrb@linux.ibm.com>,
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
	Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v8 11/29] arm64: ptrace: Use constants for compat
 register numbers
Message-ID: <arpzV-ylRwdqdNSE@arm.com>
References: <20260918133107.1042730-1-seiden@linux.ibm.com>
 <20260918133107.1042730-12-seiden@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918133107.1042730-12-seiden@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_070207_568157_0A8CB313 
X-CRM114-Status: UNSURE (   8.67  )
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

On Fri, Sep 18, 2026 at 03:30:48PM +0200, Steffen Eiden wrote:
> Define an enum to determine the register number for the mapping from
> AArch32 and AArch64 registers. This allows for a more flexible use of
> the register mappings.
> 
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

