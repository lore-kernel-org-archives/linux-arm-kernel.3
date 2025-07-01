Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D839C83038
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 16:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hi0N3GraTx8yze1pAfuIy+A47z01o1rGKa4UbsbV/z8=; b=3BdQ5/JNV2TejGEXiX2CfTlBE4
	DhyMeCgX7KkjYHvmIr5s95SSyYA/LowAMkjexRzXxvYA8x74JLJtY2WN85iQ0DcMVd06viw3Op2we
	04Emcqyp8YVYT8lDbDyS8bWFeaH8m3TWaJ/++ihqS7eE/w1AFYphCvCTHgUJENFY1EMV1jvOIU5Dp
	AGw63yIGftihkQ5XJFxnx6lunbttP7MGy65SIJUVI906kWxVuKPE4K3jE/h3SwfiyuQz4zI04QFfS
	3e5b4s8w7wJPpsuOJNBjHRdHJPW9Vk2+gEuRuBCHfMJSMmZENFPbl1jgLEr67BkvHYigLbxA+0wU/
	jdAEXQaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWday-00000005zZH-0mhn;
	Tue, 01 Jul 2025 16:12:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbyF-00000005hod-0FOk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 14:28:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6EA955C4670;
	Tue,  1 Jul 2025 14:28:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BE45C4CEEB;
	Tue,  1 Jul 2025 14:28:23 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Hanjun Guo <guohanjun@huawei.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Liu Wei <liuwei09@cestc.cn>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Li Chen <me@linux.beauty>
Subject: Re: [PATCH v2 0/2] ACPI: Improve SPCR handling and messaging on SPCR-less systems
Date: Tue,  1 Jul 2025 15:28:21 +0100
Message-Id: <175138008828.1963850.11865219339288044710.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250620131309.126555-1-me@linux.beauty>
References: <20250620131309.126555-1-me@linux.beauty>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_072827_134268_5109F16B 
X-CRM114-Status: UNSURE (   9.36  )
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

On Fri, 20 Jun 2025 21:13:06 +0800, Li Chen wrote:
> From: Li Chen <chenl311@chinatelecom.cn>
> 
> This small series improves the kernel behavior and output when the ACPI SPCR
> table is not present or not supported.
> 
> Currently, even on systems that completely lack an SPCR table, the kernel prints:
> "Use ACPI SPCR as default console: Yes"
> 
> [...]

Applied to arm64 (for-next/acpi), thanks!

[1/2] ACPI: Return -ENODEV from acpi_parse_spcr() when SPCR support is disabled
      https://git.kernel.org/arm64/c/b9f58d3572a8
[2/2] ACPI: Suppress misleading SPCR console message when SPCR table is absent
      https://git.kernel.org/arm64/c/bad3fa2fb920

-- 
Catalin


