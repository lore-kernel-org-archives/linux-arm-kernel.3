Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA30FC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 18:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjzUYO+f0dEIfn0NqOku+3fnvEFXy2J1drD8gdq2Qzg=; b=wOhrYVYCC7lDXY0e+jWbg+pkVN
	x6ycRS/iz3J1Vg5AtgtRNWSINR5Gx1jvaYSEuVLOwPTZJO58onX66WPi7NFzOEC2qtYjfWzc6V5AP
	3wJb1usuJy8FkV56a5yW8bcox1PEtUn9awFYsUW9UkdAthb6ylFwy2ZWHPcVkq1raptHogPMbQni1
	sJya0OjD9b5kwNyIMh87ecUo7S5LSENM3oYLMWg6cYnv/Mm9OQX/R2aEDU6A7r5QyUxLncb8uo+KR
	Re1dkRJBk83Sm7DtGzlnSGkXkx/XUjaiyZm9uGSqbEIjUjXQbz4TLEexJzo9+4Yy65HQXsbEUb5kR
	EN/N37Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9zd-0000000F3Ca-1oYc;
	Fri, 14 Mar 2025 18:42:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt9v5-0000000F2od-3ohy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 18:38:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 555155C4C5C;
	Fri, 14 Mar 2025 18:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A66AC4CEE3;
	Fri, 14 Mar 2025 18:38:02 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	sudeep.holla@arm.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	mpe@ellerman.id.au,
	linux-arm-kernel@lists.infradead.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	pierre.gondois@arm.com,
	dietmar.eggemann@arm.com,
	Yicong Yang <yangyicong@huawei.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	morten.rasmussen@arm.com,
	msuchanek@suse.de,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	jonathan.cameron@huawei.com,
	prime.zeng@hisilicon.com,
	linuxarm@huawei.com,
	yangyicong@hisilicon.com,
	xuwei5@huawei.com,
	guohanjun@huawei.com,
	sshegde@linux.ibm.com
Subject: Re: [PATCH v12 0/4] Support SMT control on arm64
Date: Fri, 14 Mar 2025 18:37:59 +0000
Message-Id: <174197746840.735682.9575626401918508908.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311075143.61078-1-yangyicong@huawei.com>
References: <20250311075143.61078-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_113808_001601_37EA4742 
X-CRM114-Status: UNSURE (   6.88  )
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

On Tue, 11 Mar 2025 15:51:39 +0800, Yicong Yang wrote:
> The core CPU control framework supports runtime SMT control which
> is not yet supported on arm64. Besides the general vulnerabilities
> concerns we want this runtime control on our arm64 server for:
> 
> - better single CPU performance in some cases
> - saving overall power consumption
> 
> [...]

Applied to arm64 (for-next/smt-control), thanks!

[1/4] cpu/SMT: Provide a default topology_is_primary_thread()
      https://git.kernel.org/arm64/c/4b455f59945a
[2/4] arch_topology: Support SMT control for OF based system
      https://git.kernel.org/arm64/c/5deb9c789ae4
[3/4] arm64: topology: Support SMT control on ACPI based system
      https://git.kernel.org/arm64/c/e6b18ebfaf63
[4/4] arm64: Kconfig: Enable HOTPLUG_SMT
      https://git.kernel.org/arm64/c/eed4583bcf9a

-- 
Catalin


