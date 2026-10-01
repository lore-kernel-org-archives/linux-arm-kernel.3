Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5F9CA5FD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 16:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9DJ2OBEBeen8r1Cz8VCm6EqOKx+idqhcOTbiJQQDLU=; b=JiXVXBsYXhdP8B/DElKRR9MOJP
	BfypdcvOvEtysLqr31b4xHrDv+XDxf4A/TxOpfcFwyLjtkbI/XkZoVdfjuDqEa9J44XlVcfyyV0o8
	MCFerGmqfSJfrzQLCui9EEfAPAae28pYhzJs1WU549zTo9AdjRJYx2/KjMw+y6dPOduw2xri4QkSD
	KRHcwhbBZnx+4XjWoWcsT2MlF0B+ZZT5+izVQhTQAU2IscbK4/RANG/Xcqy02wV+tTU8FNi72tdLb
	iTIoipP7hV9tRGvd8n74OkIFta+gqqwoS54SvL+6tX2rZnPcFgU7Ts4bA1OSkqUHuWPwEn+Bc4l2k
	6GJ4E7qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJOc-00000009fUK-3E4q;
	Thu, 01 Oct 2026 16:12:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJOZ-00000009fTl-332q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 16:12:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFC6D497;
	Thu,  1 Oct 2026 09:12:26 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C7B23F8C6;
	Thu,  1 Oct 2026 09:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790871150; bh=9bd9AEnsGKNpH+D/yIPJ3kXVXuQ9SDa2Lj8IdvT698M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s08UdgTtlGgiPsQj0wMZhoVKaIvaw4i5QoKRZqKAJRH23BCXBysWllyrCROG4qTgN
	 ogHvKm4t0PjwUDIaRUt81CIj4/k6+ZNdSDeK93SW1SROtBA2Bfz8tvDHOenhdGM1QI
	 eoUCXkoEmBV1UQ4tQYKoyI2gPnEsufF0xssx4N3U=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/cpufeature: Drop redundant define(ID_AA64MMFR0..._SUPPORTED_LPA2)
Date: Thu,  1 Oct 2026 17:12:22 +0100
Message-ID: <179087114214.1104965.13059453342725371380.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917024152.3660794-1-anshuman.khandual@arm.com>
References: <20260917024152.3660794-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_091232_232965_96F4C97F 
X-CRM114-Status: UNSURE (   7.22  )
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

On Thu, 17 Sep 2026 08:11:52 +0530, Anshuman Khandual wrote:
> ID_AA64MMFR0_EL1_TGRAN_2_SUPPORTED_LPA2 is always defined as 0x3. Hence any
> defined() test on the macro always going to be evaluated as true. Hence the
> very test itself is redundant and can be dropped off safely.
> 
> Although similar defined(ID_AA64MMFR0_EL1_TGRAN_LPA2) test is retained back
> as the macro does depend on the configured granule size.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/cpufeature: Drop redundant define(ID_AA64MMFR0..._SUPPORTED_LPA2)
      https://git.kernel.org/arm64/c/f73411ae5be6

