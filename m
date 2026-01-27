Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F443D2F000
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 11:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUbY/SueKFHa9keFtxArUQDFQcITAX/e20JYSG+UB9U=; b=4cn8S/cdioppjKHhGj/VTBw8Rb
	1P5b2fUTHj6e3gKbpVEdmLAXidbt2hDRRjv/kbp1X3PXBVw/V0eCfKTTRuuGW44a9GDuo9tdbJ0Pq
	hveZvxceOPwK53ddfoXM5/XwkNGgLsgJQLq1R/f9OxcutwBNz1JRtroeRY2NmKbR3LhmP3u2gjtJ2
	2zwM/UZ0qcH+LsVLxeVzfq9Jqj+AHdCM/Yzq2kBn9A7+VEWfQqNzJrvQoVoXSvEQS1+6U/CY3a7vs
	VuMf6ZmczHLvikBOum+UvfISbE9zIwod1j6d3BoY8lJUBTi129bR8+Bh5mGCPOa2JzY3v6nymFBKz
	SDzvkt4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhWj-0000000EBFZ-43Md;
	Tue, 27 Jan 2026 11:46:33 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhWb-0000000EBEx-0wXI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 11:46:29 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=QUbY/SueKFHa9keFtxArUQDFQcITAX/e20JYSG+UB9U=;
	b=go5nMwrRyShR3qglbfKoYU3ZVepZPkpXMEWfbRRX49Myxs03s2ydWHEvSu/hlzAhzPeldz606
	k7wuUmJykSSmuWa4EXwFwIqIcWAdiQfdN+7hB6NnWxWTF+CGg9uSfGzer92sXZcVl/1UhQgOZFC
	13k0/Rp1fi/iGNWGncmmsT0=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f0k7l07phz1P6n8;
	Tue, 27 Jan 2026 19:43:46 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4f0k9s5Yd2zJ46dp;
	Tue, 27 Jan 2026 19:45:37 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 9C12940570;
	Tue, 27 Jan 2026 19:46:13 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 27 Jan
 2026 11:46:12 +0000
Date: Tue, 27 Jan 2026 11:46:11 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Ryan Roberts <ryan.roberts@arm.com>
CC: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Oliver Upton
	<oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, "Dev Jain"
	<dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 05/13] arm64: mm: Inline __TLBI_VADDR_RANGE() into
 __tlbi_range()
Message-ID: <20260127114611.0000381e@huawei.com>
In-Reply-To: <20260119172202.1681510-6-ryan.roberts@arm.com>
References: <20260119172202.1681510-1-ryan.roberts@arm.com>
	<20260119172202.1681510-6-ryan.roberts@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_034625_800119_076BEF9E 
X-CRM114-Status: UNSURE (   9.68  )
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

On Mon, 19 Jan 2026 17:21:52 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> From: Will Deacon <will@kernel.org>
> 
> The __TLBI_VADDR_RANGE() macro is only used in one place and isn't
> something that's generally useful outside of the low-level range
> invalidation gubbins.
> 
> Inline __TLBI_VADDR_RANGE() into the __tlbi_range() function so that the
> macro can be removed entirely.
> 
> Signed-off-by: Will Deacon <will@kernel.org>
> Reviewed-by: Linu Cherian <linu.cherian@arm.com>
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

There were some oddly complex constructs in the original macro like
the handling of ttl == 0, so good those got cleaned up in the passing.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>


