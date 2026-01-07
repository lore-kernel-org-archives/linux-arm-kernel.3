Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9AAD0D167
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 18:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YStlvoMyp3D1rDkthx7NRI4dHTFWH4LsKNyR03+KYk=; b=3CUUFikMXJHvn+tUR5qkpv+B7u
	KsKBh4tpviTij0fHbBULMoCWGiBApIBtDiQM4vHPo0I6bParYOfr4G5t7r8fWNK9oI02vmQ0QaBH7
	U5/WLK5cyTMq0wDrd0v7U+jyMnO8zuJK/dyKOsolnVkSkzUEucklST8M7+xXCRVmo5AQJjScyvg7N
	wY2kr9IjMeFfla+wMi6PYciIO7xdsQiatZXgpqAuPSnFjlWEG48mzEiNHa2WwxlH76at6t0MKJp45
	QoXvQkvhvS1g5eTH9+E/bDSFGalXU95Fy5CExuOt3Fwegesl1Qni0ZgyHy5LkW9ltZKw6wpW+yiJC
	oAS/DZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdYQG-0000000FUDe-0hKB;
	Wed, 07 Jan 2026 18:38:20 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdYQE-0000000FUDJ-14lp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 18:38:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1767811095;
	bh=5YStlvoMyp3D1rDkthx7NRI4dHTFWH4LsKNyR03+KYk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=r794LcGWBOzod1LBOrN3R/7j6NffWyCEoatW+NI0eI16GSA6WhQmKb3a+ERw1FDxf
	 7OEy0eZqouln9BqhuoPJ2mT2A+lIAGc/tHrCTptEBt4awB56VBBi/MNds1M0kXMejB
	 LVBsUrNNfuH5GkIPzbWUAGaz9on28RtfibglAHrQ=
Received: by gentwo.org (Postfix, from userid 1003)
	id 4A387402BE; Wed, 07 Jan 2026 10:38:15 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 47DC740193;
	Wed, 07 Jan 2026 10:38:15 -0800 (PST)
Date: Wed, 7 Jan 2026 10:38:15 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Yang Shi <yang@os.amperecomputing.com>
cc: catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
In-Reply-To: <20260107002944.2940963-1-yang@os.amperecomputing.com>
Message-ID: <c529f8dc-db3e-5a43-b98a-73ffe8343165@gentwo.org>
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_103818_360005_7E4C3C2C 
X-CRM114-Status: UNSURE (   4.68  )
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

LGTM

Reviewed-by: Christoph Lameter (Ampere) <cl@gentwo.org>

