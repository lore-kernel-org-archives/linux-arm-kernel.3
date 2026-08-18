Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA328C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xc14/yx8KFIXbhoySniAcr559uW1aJdvBMPXJmtA6xA=; b=imOlFO6UbDMVzcj7LSLyVXxj07
	q+V2ixj1/gCHC+grF0EGcKmP/8NJ5EK3UgE/IE5SZRMLcnhtGhNnsetu3ofkiDr/lucj+oc9yctMO
	oFifKTb8swoBFt4br6mGXfIDdFHJ62+FBtDDuvPfxa5cySX/NjdVg9XTvPMzC7fmy5SAICwp2JEJ2
	ZAr3pNycCTg6rUkOIp+K7lAJ9ULQiwHPdgaPkjCWyQaoqNl+0d2cyfluhVnDArlpPszacvSisk0ww
	zxbrO13HNPKJe0je2JIEGVyjTv/pSQN3PlVxOi+mI67FRmUj6s6M3/APOLoWMOIl10XkGud7J4qgN
	pOidwcTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKTY-000000085mq-48QG;
	Tue, 18 Aug 2026 14:07:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKTW-000000085mG-40Q9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:07:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F16B8152B;
	Tue, 18 Aug 2026 07:07:27 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 632493F85F;
	Tue, 18 Aug 2026 07:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787062051; bh=0sqtwohSLIumibqmsfO/JhI8IBhQB0YsriVnfH2MrIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B/ow6Zp02cKG2P76++iFsGJ6k7yaOTQOK8xrZVon85fmjZmVhaZ9NQtGZ4qPZTEoX
	 JfwIGa8hvFIOJUJzvFjegNEft6us5fqSsEqGAmPLWl0YDshdw7drqJuLSgzgUxTd5P
	 x6LK1qC9ES5qugkoUL869bbTO1dgdzB1eXoGqCds=
Date: Tue, 18 Aug 2026 15:07:26 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: James Houghton <jthoughton@google.com>
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Nikos Nikoleris <nikos.nikoleris@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>,
	Frank van der Linden <fvdl@google.com>,
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH 03/18] hugetlb_vmemmap: Leave pages partially HVOed upon
 restore failure
Message-ID: <aoRnHjaQ9Y61OB5Q@arm.com>
References: <20260708031129.3503195-1-jthoughton@google.com>
 <20260708031129.3503195-4-jthoughton@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708031129.3503195-4-jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_070735_039904_7FE47F05 
X-CRM114-Status: UNSURE (   7.89  )
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

On Wed, Jul 08, 2026 at 03:11:13AM +0000, James Houghton wrote:
> +static const int VMEMMAP_REMAP_INCOMPLETE = 1;

Nitpick: I get it's all within a file but a static const int feels a bit
weird. I'd use an enum or #define.

-- 
Catalin

