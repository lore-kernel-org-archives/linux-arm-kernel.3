Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDFACD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 16:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=psOFVqSS95xGwn6OhQdRnP9ZxbQORDOpHT0MSKVLULg=; b=JnFy+29liN2iA5Ojl3WCqaExOs
	4b4x4BHEKsi4CsPcRErBTPwP5cSTW1e0+L7wr4xmNtftgJvEUWdjvzMOzZraizCNAzlCDguEmzU3T
	oT9ZvZlsM6RI5XlbKpUcLR+4NA1nmhiylAu8hmIq4tgY+v/FPjsEgLvZHMuLyNqvdNtWk5pfS9x1Q
	rixcMHglTK5JslXOsBfap9T7vF5iHdYcO6tvTzdgKDKItCIPgnanwElp/+JIsBT0p9Pzr2JpJRGJr
	Zi80q1bwDEvJm+/O2DS1FbozHaukxkARMcw7FFXyvGB7ztksqcml3bYX73nP8QAJSx/VpZWsmGZTv
	UgXyDaRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSe6-0000000BPnx-0NjO;
	Fri, 22 May 2026 16:22:46 +0000
Received: from gentwo.org ([62.72.0.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQSe3-0000000BPnO-30iG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 16:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1779466960;
	bh=psOFVqSS95xGwn6OhQdRnP9ZxbQORDOpHT0MSKVLULg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=S2KmXjtf/Q0L7izTuD2etPwD9gTjRria91OHaWThT7/UBGSBMsLfGN9Z57eOiOUBe
	 x4xDN0AEph6J1pAdY8CiFR1pU+Tvs8Q5uPkE1fksyCePx6KTXGdAiMkXv/wFK6RP5X
	 mO+lr79jeoJ8pDYK7mUa+r1ArhCAY5DSnjixXeWw=
Received: by gentwo.org (Postfix, from userid 1003)
	id D244A402A8; Fri, 22 May 2026 09:22:40 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id D0A0940286;
	Fri, 22 May 2026 09:22:40 -0700 (PDT)
Date: Fri, 22 May 2026 09:22:40 -0700 (PDT)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Yang Shi <yang@os.amperecomputing.com>
cc: catalin.marinas@arm.com, will@kernel.org, ryan.roberts@arm.com, 
    linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [v7 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
In-Reply-To: <20260519163657.1259416-1-yang@os.amperecomputing.com>
Message-ID: <9996ab99-05a4-bb2d-7997-283f1f2cf16f@gentwo.org>
References: <20260519163657.1259416-1-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_092243_790927_5EC62DDC 
X-CRM114-Status: UNSURE (   4.59  )
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

Reviewed-by: Christoph Lameter (Ampere) <cl@linux.com>


