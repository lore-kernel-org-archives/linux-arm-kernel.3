Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A60CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 19:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h6IjfoiiLQP40oNop437fQZU0Vc3aVU3mWXyy0kdQbE=; b=gziol4nFOBAhEB7rnVrhKpMYRa
	cy86/z7pgfjfN5P9a57fLujJyLXUuqu+je1FituICH/eqs2CKRUsJeeyfdMaUo4lU52oK53utiWSn
	rgAqueMOGZYuGn/1J3UCW0HbZBnZTXvddfSjYvwaXejjo8TqjVjyAlVVQLWI9t6POK310/wAc1LyK
	WPCIP99nBTPQIKH+Xu2EFoorG6r5YoTM1QfU1qZuZSdf789vGjUJKOj3g2oXZu1nX/Jzq4ZA/mZH0
	F7JpHewbzt4Dkd3He00asnOvZG9aOKBuVE3t0wSnVb7FhKQ0iaWt775KXJjY0JXGg9elKdUvLmqoF
	H1Ve8sVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhT0-0000000H7Yi-0RBl;
	Thu, 27 Nov 2025 19:15:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOhSx-0000000H7YH-0WXp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 19:15:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C874176A;
	Thu, 27 Nov 2025 11:15:32 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA7743F66E;
	Thu, 27 Nov 2025 11:15:38 -0800 (PST)
Date: Thu, 27 Nov 2025 19:15:36 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com,
	mark.rutland@arm.com, gary@garyguo.net,
	Seongsu Park <sgsu.park@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: atomics: lse: Remove unused parameters from
 ATOMIC_FETCH_OP_AND macros
Message-ID: <176427091973.1018443.13188495898174660504.b4-ty@arm.com>
References: <CGME20251126021037epcas1p2c5caf948ede87748ee1d4ef536a62126@epcas1p2.samsung.com>
 <20251126021025.3239562-1-sgsu.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126021025.3239562-1-sgsu.park@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_111543_200533_0F7B691B 
X-CRM114-Status: UNSURE (   7.49  )
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

On Wed, 26 Nov 2025 11:10:25 +0900, Seongsu Park wrote:
> The ATOMIC_FETCH_OP_AND and ATOMIC64_FETCH_OP_AND macros accept 'mb' and
> 'cl' parameters but never use them in their implementation. These macros
> simply delegate to the corresponding andnot functions, which handle the
> actual atomic operations and memory barriers.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: atomics: lse: Remove unused parameters from ATOMIC_FETCH_OP_AND macros
      https://git.kernel.org/arm64/c/c86d9f8764ba

-- 
Catalin

