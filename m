Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C2AC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iiz6zw1huJCKZ/Bz792yn5E08smgkdAVSu2h16MTMeI=; b=afQmegC1MsXUWJcYvRQq0KHHJT
	q3r/aV0mPQ1qtsy8abJ8SGjQTc+LRcBs562QmLSm17XMAdRUeharjKd9q+ddLDcCejySGkXR5qOgr
	vClFxYe+46X/1cDygc65/AZDKkpMgCS0xKzTbdmD7JKtGurw9ykjBtAXZmA6IUdOJQW5oWjEDLmO5
	cVx5nE+AO7DPYcitKJi9ucVnac6HrRloHApX0lv7m2dblnkZAn/f/Auu0N8C3o3xJUOMtjg+Y7t07
	PC047pRnPYgo1NMeuWNJmXgAWFYm/21EA7pb7R4NyCeyq1GGw0AeGd/HgFeXezL12xDdjUbDu8/cM
	O7hfp+Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RZi-00000009AN1-0i5Q;
	Wed, 23 Sep 2026 18:20:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RZg-00000009AMV-2x7v
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Sep 2026 18:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iiz6zw1huJCKZ/Bz792yn5E08smgkdAVSu2h16MTMeI=; b=d2pzFzxSRBPCHgKvonS4mMI/oO
	vaG3uZ8VDyyy9P9byej1o5LbvmlYmLTfgiSeM92LnJEE/RvHACWAfe7HxXzSpjMzhO1m9/PRHXpVV
	/4lOvdgCaVcoDVHIeZbzof1JB6/eiVm+AzXwx9NBvokZWdUOb5ixffyTma3VwWhPM/0axCWXJKmBB
	MtAbQ2g8jsh0hEB/vCc8uLtUga25rMdvqXhF/8yPFR0Mttve3LsVUwoMHJRwErw1dNmVRIGx08Eau
	q/2J35E0RBYPgcJB4Tw7q1vkfP+RteHrrChgI1Is47BL1m6PqwvJEVVKP/QIJw/NTVqpNjDP4Wlum
	oXTo7cVw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9RZd-0000000F8wf-1Ni1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:20:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF6A41476;
	Wed, 23 Sep 2026 11:19:59 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7935D3F632;
	Wed, 23 Sep 2026 11:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790187603; bh=+CJ3rnd+ozisq2bD7zavGONTL1s18Cwzs4rt2Xsh2Go=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=czUO/j06gKeQfiLK7TrjKvNbJtzps1SYpwtBNOO5VDaiw4nQV/pvLBHmUYdW9CZxj
	 m03ppF/XTB57iBR2dUgsw7DxxPlvHn4ofRxGQbRoRcxIqLgh6qQk2Ygwb08fpXruwG
	 KWFNQdJhHlkgoponWjdw9d5dwMZ2FVa7OzabNWhU=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Hemanth Selam <hemanth.selam@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Weijie Yuan <wy@wyuan.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: arm64: Fix typo "initalised" in booting.rst
Date: Wed, 23 Sep 2026 19:19:54 +0100
Message-ID: <179018757672.2942904.12998748244558241449.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907114146.39715-1-hemanth.selam@gmail.com>
References: <20260907114146.39715-1-hemanth.selam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_192005_603239_1A87CF1A 
X-CRM114-Status: UNSURE (   9.63  )
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

On Mon, 07 Sep 2026 17:11:46 +0530, Hemanth Selam wrote:
> Add the missing "i" to "initalised" in the description of the
> spin-table cpu-release-addr property.
> 
> The British spelling is deliberate.  doc-guide/contributing.rst asks
> that both American and British spellings be left alone, so only the typo
> is corrected, not the dialect.  checkpatch.pl suggests "initialized"
> here because scripts/spelling.txt maps this entry to the American form;
> that is addressed separately.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] docs: arm64: Fix typo "initalised" in booting.rst
      https://git.kernel.org/arm64/c/8c37fb7f67ce

