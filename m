Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A73D2F00A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 12:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TtsUWmZLyDa9NSZyV4H1BdwW49lZiFWsjQOUMoBop/U=; b=bKpT8T0fcIKm/E42y3Hv9ZI0BN
	MjchzM18j8d2vuA2hV0AKBanKxkReEzAh7S7u16hXVEXshtMZkZYwv0lMkGRRO80toKWd1xpF3u6m
	+gDYJAL1X09gXV8ovnVt4pEJRgKwfIGboz+3NE+XChyS8jjqBVoDgYeDgVNe+NZY2BNUbsjMgR3Ei
	nror4iWJj/rL+ln9ScR72gkSGXS3qfvACLPqdDq6SDG69g8t623EgnciBELCW3W08D4Vth4kCD8CQ
	5Gr4n4xhLMkQ7IB33zpGNN+n/TDe3C1oaxaZeQktpNQRHNIFXOzZCGfG5T8BhXtDmEtLihBbDV5SJ
	GHGVVyUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vki8X-0000000EF89-3FK6;
	Tue, 27 Jan 2026 12:25:37 +0000
Received: from sinmsgout02.his.huawei.com ([119.8.177.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vki8U-0000000EF7T-1U7V
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 12:25:36 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=TtsUWmZLyDa9NSZyV4H1BdwW49lZiFWsjQOUMoBop/U=;
	b=5HC16Lz7nu5OdyLhukVyR7Pr7aAJ7E92f2CZ5Hru3ZD92/y0OZVa4CObfg19ssKXoMSFsV5Qj
	eI2F3Pl6B6DLZrj3mJbn95YdCippkEzeMnnQrc1Zcz7jpgjBHBD9+NtfM2V/DIN7iIvfPQKia4R
	Q3tsa6jhFZTcP9i/63zTl8M=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4f0l0v4L2cz1vnNb;
	Tue, 27 Jan 2026 20:22:55 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f0l341BdFzJ46bM;
	Tue, 27 Jan 2026 20:24:48 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 110DF40584;
	Tue, 27 Jan 2026 20:25:24 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Jan
 2026 12:25:23 +0000
Date: Tue, 27 Jan 2026 12:25:21 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ryan Roberts <ryan.roberts@arm.com>
CC: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Oliver Upton
	<oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, "Dev Jain"
	<dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 09/13] arm64: mm: Refactor flush_tlb_page() to use
 __tlbi_level_asid()
Message-ID: <20260127122521.00007d48@huawei.com>
In-Reply-To: <20260119172202.1681510-10-ryan.roberts@arm.com>
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
	<20260119172202.1681510-10-ryan.roberts@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_042534_866841_0846A71C 
X-CRM114-Status: GOOD (  10.13  )
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

On Mon, 19 Jan 2026 17:21:56 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> Now that we have __tlbi_level_asid(), let's refactor the
> *flush_tlb_page*() variants to use it rather than open coding.
> 
> The emitted tlbi(s) is/are intended to be exactly the same as before; no
> TTL hint is provided. Although the spec for flush_tlb_page() allows for
> setting the TTL hint to 3, it turns out that
> flush_tlb_fix_spurious_fault_pmd() depends on
> local_flush_tlb_page_nonotify() to invalidate the level 2 entry. This
> will be fixed separately.
> 
> Reviewed-by: Linu Cherian <linu.cherian@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

