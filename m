Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B7A1D2F000
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 11:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tp1suiWH8/OzZCmXS9VgFljfMOquW6cZRegEMWCg3GU=; b=CGNkC1YIugNHeeP387FaNc/OxL
	yFFiHyk93+WCA0zy1rZxiEW8/60j937o8zK5naONGEQ6YY1oFuR293DiWjJzrt7BSyfwYwWdvwdOb
	Cj0Rlct58Ckn8UCaluSV+hogapOP8JP9r1JnZiYtPutAFg9ducmJilH0o/SJkEVAaeYoyvfRYSGbh
	EMmjhAbiwXZVBG+x2XKsk+L8jtibXJ6e0mEl1u1dhWv9ransfFHyL6WBAh6OcBc+spTiw7WmrHqzT
	q/g1fFspw3yHhWWTJRMmBihRrs0k0eAwVLpNXQBnHiSbZIX0aBBUGjNRbe/AWR/GnlRM8hkCz36U0
	SCHVYc+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhIP-0000000EA0b-3TRY;
	Tue, 27 Jan 2026 11:31:45 +0000
Received: from sinmsgout02.his.huawei.com ([119.8.177.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhIM-0000000E9yR-0xUK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 11:31:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Tp1suiWH8/OzZCmXS9VgFljfMOquW6cZRegEMWCg3GU=;
	b=ZMM/gisSEkV1luBZufBUNu4mr08k5fBtjWP/tqZt2U7XUEXahwMDszc6Y3renUNhet1H1kaLD
	/ONkSKOcRtDFmQ/jzA8/0Gg+DCG1dWAmGV3tM4sVCQgDxrt3PyfFMUb0ew2wtZQtFSuHS+/M2+m
	XC5sqYjdAllG9D7Yz/0hPzk=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4f0jpl6C9bz1vnJg;
	Tue, 27 Jan 2026 19:29:03 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f0jrk5hjKzHnHH8;
	Tue, 27 Jan 2026 19:30:46 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 40D6B40539;
	Tue, 27 Jan 2026 19:31:32 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Jan
 2026 11:31:31 +0000
Date: Tue, 27 Jan 2026 11:31:30 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ryan Roberts <ryan.roberts@arm.com>
CC: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Oliver Upton
	<oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, "Dev Jain"
	<dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 03/13] arm64: mm: Implicitly invalidate user ASID
 based on TLBI operation
Message-ID: <20260127113130.00005395@huawei.com>
In-Reply-To: <20260119172202.1681510-4-ryan.roberts@arm.com>
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
	<20260119172202.1681510-4-ryan.roberts@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_033142_540081_8B3E98CC 
X-CRM114-Status: UNSURE (   8.98  )
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

On Mon, 19 Jan 2026 17:21:50 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> When kpti is enabled, separate ASIDs are used for userspace and
> kernelspace, requiring ASID-qualified TLB invalidation by virtual
> address to invalidate both of them.
> 
> Push the logic for invalidating the two ASIDs down into the low-level
> tlbi-op-specific functions and remove the burden from the caller to
> handle the kpti-specific behaviour.
> 
> Co-developed-by: Will Deacon <will@kernel.org>
> Signed-off-by: Will Deacon <will@kernel.org>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>


