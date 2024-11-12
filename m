Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B65D42BA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 16:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRoMhvTsieVvRpHiwTHJBgkA2LXduz4dU23XmkkThaI=; b=ZKrw7Xe2lAo1xOWg9HOJQOQRyB
	v+wDwEwIDcwDcP6QOr4yUdULUiNN6N28LuM/A15wo4xA8YAj1D/ddXFidf/lYK+TXjQD5aXN765c3
	cSLUBoaYEdO6a6ph1DlfkuXd+EbjIdWAyJ6a9AtB4MQOIkU17jx20nVWbb+Uk99QPKcT5SFWGhLE6
	JRPd8GVLDSyXvviz6jZAMYl0n8X8xGHIocOOWKgrj1oyKGRjLhY5aM8XvBynTLkU22YZkwgnEbOGT
	m9SWipzS4My/d8y3aObNKjxM99mvBwx/a4TC8Jfsu44k40cpKvqyU00uV6Bc85e0mOnC6k9f41vny
	w4M/tOMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtg2-000000047uC-2CFd;
	Tue, 12 Nov 2024 16:23:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAtT4-000000045VT-2aho
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:10:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 67C105C5574;
	Tue, 12 Nov 2024 16:09:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC9B5C4CECD;
	Tue, 12 Nov 2024 16:10:10 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Change protval as 'pteval_t' in map_range()
Date: Tue, 12 Nov 2024 16:10:07 +0000
Message-Id: <173142780464.896456.6904974640753007235.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241111075249.609493-1-anshuman.khandual@arm.com>
References: <20241111075249.609493-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_081014_721212_FED821F8 
X-CRM114-Status: UNSURE (   7.83  )
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

On Mon, 11 Nov 2024 13:22:49 +0530, Anshuman Khandual wrote:
> pgprot_t has been defined as an encapsulated structure with pteval_t as its
> element. Hence it is prudent to use pteval_t as the type instead of via the
> size based u64. Besides pteval_t type might be different size later on with
> FEAT_D128.
> 
> 

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/mm: Change protval as 'pteval_t' in map_range()
      https://git.kernel.org/arm64/c/de7fb8d3a2c9

-- 
Catalin


