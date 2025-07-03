Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1784C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MfMUO05LhQLMzJPh0jG6WZb3bhuQtHzyTefcrgYX07Y=; b=h2INBcnVUffJvQ
	7Bz/uvgpmLTmcttNvsQhIRFKOZPbYCxMfjpEpFqxOLqxBluiSyTrwf2CuoCC50puH8r0hwiaDx4VI
	rbI4LQVZEXRA7W/ABqRfmbF3I/UaqY0ZQQGyAHVsQZ956lrTsiqtNsGk8nZh1l9A+THSN5Zz2jyJg
	rToUTUddjzCDWemfV6+Nc5kf3FrutO0MpQuOD/mbAK9b5a41qc0LWUrQadzh8IpU+a8ydrmtV3qk5
	XQtRPXdP4eRNFkEYm4JgeHBRlNy7HlIBK99sdSQaC1gFdwH8rUNweVDIB+yFmNNj8ws6/RBuhwqn7
	xHgaKbG3bA4RxqaBerDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSSU-0000000CjY3-17Zv;
	Thu, 03 Jul 2025 22:31:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXPCN-0000000CKMR-1Lli
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 19:02:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4748D5C6803;
	Thu,  3 Jul 2025 19:02:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D54ACC4CEEB;
	Thu,  3 Jul 2025 19:02:13 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V5 0/2] arm64/debug: Drop redundant DBG_MDSCR_* macros
Date: Thu,  3 Jul 2025 20:02:11 +0100
Message-Id: <175156930986.3510289.10858196646035984142.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250613023646.1215700-1-anshuman.khandual@arm.com>
References: <20250613023646.1215700-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_120219_398907_8C50404E 
X-CRM114-Status: UNSURE (   8.24  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, Oliver Upton <oliver.upton@linux.dev>, kvmarm@lists.linux.dev, Will Deacon <will@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 13 Jun 2025 08:06:44 +0530, Anshuman Khandual wrote:
> MDSCR_EL1 has already been defined in tools sysreg format and hence can be
> used in all debug monitor related call paths. Subsequently all DBG_MDSCR_*
> macros become redundant and hence can be dropped off completely. While here
> convert all variables handling MDSCR_EL1 register as u64 which reflects its
> true width as well.
> 
> This series applies on v6.16-rc1
> 
> [...]

Applied to arm64 (for-next/mdscr-cleanup), thanks!

[1/2] arm64/debug: Drop redundant DBG_MDSCR_* macros
      https://git.kernel.org/arm64/c/d3a80c5109a3
[2/2] KVM: selftests: Change MDSCR_EL1 register holding variables as uint64_t
      https://git.kernel.org/arm64/c/30ff3c981e48

-- 
Catalin


