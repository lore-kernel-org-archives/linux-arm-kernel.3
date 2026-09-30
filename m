Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6150CCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 13:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1gKqZerOlTHnqkOHn42CkvIwvZTzP23Zcbc4y62YZ0=; b=UefAh8J6h/bF+lFTNTqNkEGEVj
	1F896madRs6MuDYgRCuzaOdpKr37I+6MDBjNgkOBq6coMkPcojXIJFl4eIOHOr8tc/FFK5M95aWZG
	UjPsSY2hOGSa4kge/XO6cN47qXMqA7Bqst3f5h+LCOkwVn64Wi9Yq8Rr9r4o70E2IvSaH2YWaY3jt
	mFShVmq2vqus8MMwSY7YfDFt9RhnQcilG29s2hs5xLFdGmEUVC4tV/uSo7Wb62szoVtcJryqI+jX3
	T+Bczzi3kE/8UWfH3CFOvLoVdt7xKukHiVgtOMj2DJlzf9yWXdl/Vf0T1PJrhIuTal7rbtx1cwzQW
	+bREK70w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuQe-000000068td-1i3i;
	Wed, 30 Sep 2026 13:33:03 +0000
Received: from out-113.mta0.migadu.com ([2001:41d0:1004:224b::71] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuQY-000000068s4-04Iy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 13:32:59 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=g1gKqZerOlTHnqkOHn42CkvIwvZTzP23Zcbc4y62YZ0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790775172; v=1; x=1791379972;
 b=m0fYRc7bq98ZpPQfJBgi28FehVtfdDiTUKdSvPq+xHCtQhQwWd+S8MTIeFlhF9hX4KFUSSTL
 O/MaPM/Av9HGQhk3k7pJUmdjfRuvY5EUAZ7afDgnhozVHhmgtXNTFapwXed6RLcQJGbEdMgpYu+
 maqEX04X1YO74xiWkYXjXhaw=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id dacf2144932b6101;
	Wed, 30 Sep 2026 13:32:52 +0000
X-Mizu-Trace-ID: dacf2144932b6101
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b8f42bb8a9so1018e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 06:32:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw14fwC5GqCYbr2IwFyBl60t/g9XNowxD+OJuru1kJa184gorWUV80eaXJ7Doba9/Gq5p8aCtmV0sXKitQycXQw@lists.infradead.org
X-Gm-Message-State: AFq9FYIfvKykNxZs9FIiv33Oeq2CYhWXSwp7Fga7ADQw4EUWTe9mS/WE
	UG2qZVBzzujYbi0NnXbh3gjacvaCMc+O6RrR30ERfjHHYrs35fBRClFLqRwcZUEThrHxdwXFkU/
	YvZ4JHjIidWAkzsI/75shfitH2r6Ufev1NlYDz4wT
X-Received: by 2002:a05:6512:15a7:b0:5b8:d04b:a1be with SMTP id
 2adb3069b0e04-5ba3f6d7af0mr72960e87.2.1790775170749; Wed, 30 Sep 2026
 06:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260930121212.3101361-1-fuad.tabba@linux.dev> <mzmgyzxbha7fcrmbwscu5wbuge2iuhe76czp25guh3hg7cntkh@zrsuzosmzuiy>
In-Reply-To: <mzmgyzxbha7fcrmbwscu5wbuge2iuhe76czp25guh3hg7cntkh@zrsuzosmzuiy>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 30 Sep 2026 14:32:14 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzx=BfOe2bN2gsLEthT587NAq6S2n0EZcnFg3ntugo1WQ@mail.gmail.com>
X-Gm-Features: AclHuK-3E5BlgAYE04xbiTSHwyRzUHWUPYScfOkIMzqEfmAwSfYBzqw2T6965fk
Message-ID: <CA+EHjTzx=BfOe2bN2gsLEthT587NAq6S2n0EZcnFg3ntugo1WQ@mail.gmail.com>
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	"Rob Herring (Arm)" <robh@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_063255_694944_61981EDC 
X-CRM114-Status: GOOD (  11.57  )
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

Hi Anshuman,

On Wed, 30 Sept 2026 at 14:26, Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> On Wed, Sep 30, 2026 at 01:12:12PM +0100, Fuad Tabba wrote:
> > On a CPU with FGT2 and an IMPLEMENTATION DEFINED PMU (PMUVer 0b1111),
> > __init_el2_fgt2 sets the PMUv3p9 bits in HDFGRTR2_EL2 and HDFGWTR2_EL2,
> > which are RES0 there. The macro only checks that PMUVer is at least
> > PMUv3p9, and 0b1111 passes.
>
> Just curious - has this caused any real world problem on IMP defined PMUs ?

Not as far as I know. I found it while auditing these and related bits for pKVM.

Cheers,
/fuad

