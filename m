Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C8ACD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 18:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYFJecGvF/PSLvcfOfBEFxneWPelTQqrxpNgn7eEBM0=; b=v2zmtnWU4SBSC2XkGBURiu4V9h
	dlwZEHQsq9ZuVvI70wZ7JrXtvLgn7qYEpo3R+0U++JF/Blw7E0lz24foBgDoarlbb+DbJiDobJx7o
	NkR5vf5pvSeiQTn5DA+XtDYgwSW/mRhemzYMWmA409W6CRuPNIIuccw8yIlAz9YczRHDxC7mdr5CB
	3h14YiBenckHxY9zv5uC+KFcHwOAJXsMeleHfLYZ8uuwGxLPfjgxiyGx92H78HMQIQfykiN+TKBJ+
	O6WlRDaneY0AR4E0uuc5eG/eYutoKIy3Gr7OBZGGWtTrW0CtMv5yy/CFu9SIqWhDInDxjF54bSM+U
	q5FUSLgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcXA-0000000AxeF-1rHa;
	Thu, 13 Nov 2025 18:59:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcX8-0000000Axdt-1TXV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 18:59:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF8E443942;
	Thu, 13 Nov 2025 18:59:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC502C4CEF8;
	Thu, 13 Nov 2025 18:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763060340;
	bh=Y9smVE2v6A+tgVYcflKTZ+tDgKK7i+qAb7N4nXKZcuk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tOgYb1tHK0YsCQNQ27eKv2OIqxJxST9HuH2GBNrGY5xZ4ABcNit5J6rXnODTc49zh
	 jQIfTS6P9ODopRXGU0r/mTTeG1h3WOrMR44JHxx62fi6p5Vwd42ZB+kPZSsr1fTi7v
	 tAuWBk8VECh0RR+oW+C9XILVw3E+hvq+j6KutRCdoBamdRFYKoSQug1JGOIywa+5wQ
	 3k7s3rzgNuiHKxaYQhcBhQEypTvcdihJCzDhdoImbNVOfAbTPfySTahNzQyacSSjhf
	 I0t04f4bDLmUagHm1XoQVUds5LGkg8yC/TE12eKXNzlb1QdIz9zsV0KrzbvAxiGsZO
	 q0k8slu+uMf5Q==
From: Catalin Marinas <cmarinas@kernel.org>
To: will@kernel.org,
	Dev Jain <dev.jain@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	anshuman.khandual@arm.com,
	wangkefeng.wang@huawei.com,
	ryan.roberts@arm.com,
	baohua@kernel.org,
	pjaroszynski@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND] [PATCH v2] arm64/mm: Elide TLB flush in certain pte protection transitions
Date: Thu, 13 Nov 2025 18:58:42 +0000
Message-ID: <176306032240.2459767.9191020544205608195.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251017160251.96717-1-dev.jain@arm.com>
References: <20251017160251.96717-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_105902_435599_CB2C3ADA 
X-CRM114-Status: UNSURE (   9.09  )
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

From: Catalin Marinas <catalin.marinas@arm.com>

On Fri, 17 Oct 2025 21:32:51 +0530, Dev Jain wrote:
> Currently arm64 does an unconditional TLB flush in mprotect(). This is not
> required for some cases, for example, when changing from PROT_NONE to
> PROT_READ | PROT_WRITE (a real usecase - glibc malloc does this to emulate
> growing into the non-main heaps), and unsetting uffd-wp in a range.
> 
> Therefore, implement pte_needs_flush() for arm64, which is already
> implemented by some other arches as well.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/mm: Elide TLB flush in certain pte protection transitions
      https://git.kernel.org/arm64/c/c320dbb7c80d

-- 
Catalin


