Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889ECD277D2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Jan 2026 13:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOc/Hppk+KAaFco3ebCtj8YLvT4b84AgatlNa7eF2B4=; b=MPP2Ph+4v6Cq+LKUf9w+hATQgZ
	HVIcFn19Rp3frvAbPZkhS4d3XneyzS1PEEABU6eqKVyJoUQ8+b0ifFA+7Ei/VzEGTQ/fweW/oBZg3
	vn9sM+x+9GUvecnNrsZrTpBD9VRMLF60Vse/RNyal5mh9p/ILqE2Y+4Gd036daHFrKS+xA2+YJCz6
	3kL89rE1mJHiTXylZsm1tr1roWt+Mvslm2ezlvZRtM6Y3eo6cE/9+nGh+i6a1ZdFzOb7PrGf2IsSZ
	PgsmI6ppUM6DqppaO7UJ1YB1QDpwx9IY5JhwOxMg0nigfAyqsQiP9WE1P/VrK4/GfBREVSgNFHXak
	/8CasjjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veYca-00000003Sa8-1HDK;
	Sat, 10 Jan 2026 13:03:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veYcH-00000003SZ4-0OIC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Jan 2026 13:03:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 669551516;
	Sat, 10 Jan 2026 05:02:41 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19F763F6A8;
	Sat, 10 Jan 2026 05:02:46 -0800 (PST)
Date: Sat, 10 Jan 2026 13:02:44 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Taehyun Noh <taehyun@utexas.edu>
Cc: Will Deacon <will@kernel.org>, Carl Worth <carl@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	andreyknvl@gmail.com, pcc@google.com, yeoreum.yun@arm.com
Subject: Re: [PATCH 2/2] arm64: mte: Defer disabling of TCO until
 user_access_begin/end
Message-ID: <aWJN9JvJilmquWlH@arm.com>
References: <20251030-mte-tighten-tco-v1-2-88c92e7529d9@os.amperecomputing.com>
 <aV_H9h-nSM1HlWnR@willie-the-truck>
 <aV_7Sm96Zf1Gfg9v@arm.com>
 <DFKNU3AVF9EW.3GHYYELNT4V9E@utexas.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DFKNU3AVF9EW.3GHYYELNT4V9E@utexas.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_050253_178495_2F9192BA 
X-CRM114-Status: GOOD (  18.41  )
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

On Fri, Jan 09, 2026 at 11:29:29PM -0600, Taehyun Noh wrote:
> On Thu Jan 8, 2026 at 12:45 PM CST, Catalin Marinas wrote:
> > Reading the Arm ARM section again, I wonder whether always setting TCMA1
> > does the trick for the Ampere hardware. With KASAN disabled in the
> > kernel, all addresses will star with 0xff... so behave as match-all. We
> > do this with KASAN_HW_TAGS enabled but it won't have any effect with
> > kasan disabled.
> 
> Our team agrees with Catalin’s TCMA1 solution. It disables every kernel
> tag checking but the user address will get tag checked as far as TCO is
> clear. Also, Carl’s initial testing confirms that
> `mem_access_checked*:k` counters drop with the TCMA1 patch. While we
> haven’t run the memcached benchmark yet, we will follow up with those
> results shortly.

That's great. Carl, could you please respin the patch with just setting
the TCMA1 bit? Just add a suggested-by me (I could post the patch as
well but I don't have the data to back it up and include in the commit
log).

> Additionally, we’ve observed that Pixel 9 behaves differently; the
> kernel does not perform any tag checking when the user process enables
> MTE. I’ve tested a simple kernel module that accesses kernel memory on
> user ioctl, and measured the MTE perf counters on both AmpereOne and
> Pixel 9. Pixel 9 shows no increases in checked access counters, but
> AmpereOne shows proportional increases depending on the buffer size that
> is accessed inside the kernel module.

It's an implementation choice. I think the Arm Ltd CPUs ignore tag
checking if SCTLR_EL1.TCF==0, irrespective of TCMA1 or TCO. But always
setting TCMA1 is completely harmless and it's covered by the text in the
Arm ARM.

-- 
Catalin

