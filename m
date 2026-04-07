Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B6FFEEF38
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 13:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egPHa+K7bRIsEovZ/NkxHxwL2y6jSYz+NfZ+J1+t58s=; b=34impLXO3rRdTnEScmUbsGvXZc
	l8Ae0XBO8E/R4LJYkk+Ud7z1YRVzCYxbk9cWfORr476pJcfUAnOSqxvJ7kK0BvmdMY3ksCo/utaW6
	N5mkBYKMNb5o2j2EWTZ5JCSwasQJ17ZXoKgfEvZthdM/iBicwu4RQDxU7d51HiLsDbMSWa9d5Ehe5
	aUsK6ymUnj7ooE6apm9P82I91wfl7eDGPXrJiaylPHYZ4hUQs0QtC1zHFxLx9EwPiPGUI5UlWzWv9
	RwWUj+vqG+Lr4JsImzk06EAr+8MyuKd0KWt8DXVNtZvPJiOYWhzlW9XCwi4onGu7fLn9L/i1tDq13
	4wwxhFWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6mW-00000006XWx-3WO3;
	Tue, 07 Apr 2026 13:47:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA6mU-00000006XWR-0iNu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 13:47:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44D8A16F2;
	Tue,  7 Apr 2026 06:47:43 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CEB003F7D8;
	Tue,  7 Apr 2026 06:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775569669; bh=YCxm5IsUZWkOVmsnnCElZfL8KDjU6K9uk5Pr3gZX1nc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VVPYMBNyFaH6onWlNAwGCgXqVZGQkTcoMTSFGWNL93JMN3nv3BLkZePnFnacj6De6
	 jCgyNxQVNTeX+ACgzoSM21XwGim9Q6AvQrjUQfyJ5TKZm5oaT1z/rI/wZROF8uDTZy
	 NzlrzHYBnkils0WuAfTTUSw1Dh9VbZRQ9Ut2ROTM=
Date: Tue, 7 Apr 2026 14:47:45 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH] arm64: clear_page[s] using memset
Message-ID: <adULAT2xus5z3HdQ@arm.com>
References: <20260306-aarch64-clear-pages-c-v1-1-77c1bb0f1c21@kernel.org>
 <ac7YJPo4Np2zxxEp@arm.com>
 <CAD++jL=G81=ueo7djqUETToE459kpFGniWvBwnYbJtmXrm8MFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD++jL=G81=ueo7djqUETToE459kpFGniWvBwnYbJtmXrm8MFw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_064750_256720_CB30B87F 
X-CRM114-Status: GOOD (  10.52  )
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

On Tue, Apr 07, 2026 at 11:25:55AM +0200, Linus Walleij wrote:
> Quoting my own commit message hehe:
> 
> > No performance regressions can be seen, the fastpath
> > benchmarks differences are in the noise.
> 
> This was tested on hardware with Ryan Robert's fastpath tool.

BTW, have you tried the perf bench mmap test again with the new
clear_page? Both with single page and multiple pages scenarios. And
ideally on more than one platform.

Will pointed out (in a private chat) that current clear_page() uses
non-temporal stores while memset() doesn't. It may not make any
difference in practice but it would be good to have some numbers.

-- 
Catalin

