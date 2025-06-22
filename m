Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E16AC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Jun 2025 22:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MD/dLarw0d6IdKUG/1yooRE7P3CJNyXw9dAnU2kSRBg=; b=q6rDDrZmtdrYJk+hYrx5MkEmUQ
	dBLMe3E/3CFngHA3PnySsfmNrrhfxLMgEyYoUHJ/Q70Bt3Ki/gpga4eb2tCDbyo37ebSsUSIaL+lJ
	ra5UeCeEUPEXOtQeipJ6RkCyvOTdQDa3DUP+9gm9T2QNYyJ96toRnhsSeU08RK2Hnp05ivPJuBW0G
	sRVoeqQ4+3Pgl6zsmuJLUdk5G3zsYDo5bX7YxYHKje+G/GLMXxDWPKiPDbZ/VBKDklZT/gGdRIUrs
	3MGUPrX6GJT756eNVp3QC4/Ta27tQGUP2bTxdhLe/5PMiStUsHEYRs+oMUWAyKqDuY7efwmZSqKA1
	DbDUcNdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTTIe-00000001I0U-32sB;
	Sun, 22 Jun 2025 22:36:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTTGO-00000001HuE-2Xfi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Jun 2025 22:34:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 92AE643BFC;
	Sun, 22 Jun 2025 22:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8E66C4CEE3;
	Sun, 22 Jun 2025 22:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750631651;
	bh=MD/dLarw0d6IdKUG/1yooRE7P3CJNyXw9dAnU2kSRBg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KDsBcoQ2zlUOqf4+WJM7mnbgEr5DzxIeYw1U95bLwqJ8gA34GOJFcKbYQMSDfaoLS
	 rO8kavqoob2P6ynRBN4dI1zrP6F0SuXvA1J3TeU+9alhUoCbhc6aRY+GHvl4h56XjC
	 9j6VNQsaQ01k3aHime8Qc99JjJNEb5ZO6VKIBCDo=
Date: Sun, 22 Jun 2025 15:34:10 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Xavier Xia <xavier.qyxia@gmail.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org, Xavier Xia
 <xavier_qy@163.com>, 21cnbao@gmail.com, dev.jain@arm.com,
 ioworker0@gmail.com, catalin.marinas@arm.com, david@redhat.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, willy@infradead.org, ziy@nvidia.com, Barry
 Song <baohua@kernel.org>, linux-mm@kvack.org
Subject: Re: [PATCH v6] arm64/mm: Optimize loop to reduce redundant
 operations of contpte_ptep_get
Message-Id: <20250622153410.1f74305615cbd089fcf943bb@linux-foundation.org>
In-Reply-To: <CAEmg6AW0ZoKf_8XK7EjA2sE6HEL3Tneg7-CKakTNdgZrd585Ng@mail.gmail.com>
References: <20250510125948.2383778-1-xavier_qy@163.com>
	<99a0a2c8-d98e-4c81-9207-c55c72c00872@arm.com>
	<CAEmg6AUBf1wVjXSoqBseWffLbixUV7U-nY52ScKCeNXwrkBcqg@mail.gmail.com>
	<225fd9dd-2b97-4ec6-a9a6-fe148c4b901e@arm.com>
	<CAEmg6AW0ZoKf_8XK7EjA2sE6HEL3Tneg7-CKakTNdgZrd585Ng@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_153412_657110_D9156D03 
X-CRM114-Status: UNSURE (   7.91  )
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

On Fri, 20 Jun 2025 15:56:55 +0800 Xavier Xia <xavier.qyxia@gmail.com> wrote:

> May I follow up: Does this patch require any further changes? Is it
> now meeting the merging criteria?

I think a refresh/retest/resend would be best at this time please, help
people take a fresh look at it.

