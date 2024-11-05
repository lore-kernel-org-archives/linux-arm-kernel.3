Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458E1D2B92E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 13:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S5oQPLNfeNJBG4LvaQh3Z1vujBSc1EjL+06ibqB0vwA=; b=GibRgBwYYXMxH5iKUpd8NZaDp8
	mrvoKIfCvIGOeP9AXSjrncRAKTQ33Dasn3JJAAcU7bt0/TQId60DVy4MdBwlOHijfjIe4G+egdrJQ
	Lqpt0Jhs9SnqaTOZxxdXv4U4SEj49EQiVUwLECCToxCQXMCWP/7oHUO9fLniADDXCLwZHYq7D0qf+
	i5o2ImJtsJ6H2MCUK4TuEPeOMvMADbOei9DmrypQ1VXgP9a4ovTAGB1+9LWWAN6iQySFLSjSAIa9T
	h1RV7tfVuRkaq37mztPYn2ki2u4bsKxh3KZdvjJEPqULRjSqxhHxwP6L1/Mvstqsku346FAb644DS
	3DQMjybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8K2y-0000000HBeI-1gvW;
	Tue, 05 Nov 2024 13:56:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8Jya-0000000HB47-2HgD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 13:52:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 319B55C4336;
	Tue,  5 Nov 2024 13:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C687C4CECF;
	Tue,  5 Nov 2024 13:52:06 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Ard Biesheuvel <ardb+git@google.com>
Cc: Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2] arm64/mm: Sanity check PTE address before runtime P4D/PUD folding
Date: Tue,  5 Nov 2024 13:52:04 +0000
Message-Id: <173081469048.3480353.14977344618443860978.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241105093919.1312049-2-ardb+git@google.com>
References: <20241105093919.1312049-2-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_055208_646425_1E8CB5AC 
X-CRM114-Status: GOOD (  10.59  )
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

On Tue, 05 Nov 2024 10:39:20 +0100, Ard Biesheuvel wrote:
> The runtime P4D/PUD folding logic assumes that the respective pgd_t* and
> p4d_t* arguments are pointers into actual page tables that are part of
> the hierarchy being operated on.
> 
> This may not always be the case, and we have been bitten once by this
> already [0], where the argument was actually a stack variable, and in
> this case, the logic does not work at all.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

Easier to read now ;).

[1/1] arm64/mm: Sanity check PTE address before runtime P4D/PUD folding
      https://git.kernel.org/arm64/c/baec23979719

-- 
Catalin


