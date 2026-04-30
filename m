Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1BACCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 12:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/YmOm364MLgKTekAQcMcyvI8WeWgw/tah25yx/smkI=; b=Gu8KtVVAUNAVtUHdffib0umUUF
	uuriMDKmOhojZu5XZRr6n2o1LbfCQUP+HyWREa8rNpZSIF9Dg8XJjr3/AJXYwz9y2nRW9GO7DWuVV
	PyvIFsRg10kEn9vRyk9WJmRbVDKgK+Hc1rEkJC4lVLgt0lPk+4xy9mv++BKZdix7fP/1tkAETM7L5
	KeJTUyXaM86dTRjYYqDf4fPKsCjgTzPfcK4Phrxx27DR2DvfVww0d6mBrbceqgYJ3vxQHr5pPhbij
	m1U3pivJc1aOCZRGozKLBaMc0/vrbAmLZcqbjq5X/CJT9rz5AkiPrV5cAxJDlFuuzG4s//A5BSWmT
	9AOrHKcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQdv-00000005TCp-3Xh9;
	Thu, 30 Apr 2026 12:37:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQdu-00000005TCT-2lkC;
	Thu, 30 Apr 2026 12:37:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=z/YmOm364MLgKTekAQcMcyvI8WeWgw/tah25yx/smkI=; b=OVEuy04ZJAcBaKwk8cxrvq7Tt5
	XT82G1jqIw0PkdnsdUVlw+7QCza/twzfpnsx2kAqSxg7PTBm0kBexRmE2xwQdNMnRyEnteCqgWzIn
	pGkT+4EL2ASd9E3W3zW7yYDg3jwhiv9VQjK8KHyhy+eeJpz4dqkaLDP6PuXP1J2eRrmKWTk8F9tKW
	CawTIBqH87INZkKlSIMhv2zjWwFJnSYo+4xe4HesOWqi4rik/G82R6PqrkV5YTcbPWHu29MwOaGgj
	jzKa0vAXrEAUkOYciTPNLGggQqRFBNNvsXY3E40Q+hwIcMj9vZmSiwG6RsfdSJ+eO9OpzQbCzsngB
	wKLRaGvg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQdn-00000007Dwg-0sn0;
	Thu, 30 Apr 2026 12:37:15 +0000
Date: Thu, 30 Apr 2026 13:37:14 +0100
From: Matthew Wilcox <willy@infradead.org>
To: "Barry Song (Xiaomi)" <baohua@kernel.org>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, david@kernel.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, jack@suse.cz,
	pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn,
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com,
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com,
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <afNM-gIqxpyJ6ro7@casper.infradead.org>
References: <20260430040427.4672-1-baohua@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430040427.4672-1-baohua@kernel.org>
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

On Thu, Apr 30, 2026 at 12:04:22PM +0800, Barry Song (Xiaomi) wrote:
> (1) If we need to wait for I/O completion, we still drop the per-VMA lock, as
> current page fault handling already does. Holding it for too long may introduce
> various priority inversion issues on mobile devices. After I/O completes, we
> retry the page fault with the per-VMA lock, rather than falling back to
> mmap_lock.

You're going to have to do better than that.  You know I hate the
additional complexity you're adding.  You need to explain why my idea of
ripping out all the complexity now that we have per-VMA locks doesn't
work.

