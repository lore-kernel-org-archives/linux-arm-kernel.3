Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B37E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 12:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D0XetQ/p;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nVRWHUmm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=F28cEkRZw6qR8QYv0rrjSViytgYVUruaxZYjwZM/GiI=; b=D0XetQ/psRqCUGEsGY39ayr04y
	mBrzaXygb/seUTktaYLU74ExksvDnYDcVRLXW7iVr10XNhANKd1nWDZsl7Fycc0Fm/Cm1GrhTeDe5
	Er/WGyiJDACu5PzLbNfcNof/czywzp9XNw0+mAlohnXQNgVCqFn7PPELVypttzeJFYiQ3HqIsmc3R
	yTkGEfRWnQ6c4/OcmWYdjR/XxI4hFNdugho6nVpP/iUxzOT0u8wCV3U+rfdZv6/YT3An2J9pbk5W5
	mgo6WuCe/q6nkOYQYbabb3KpFZP4WxbfaFL4/i1cUFd106MJU0SBEANhn2teOygAs4wSAFerxdolU
	TRizokvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJjF-00000002Ugh-0KW4;
	Mon, 26 Oct 2026 12:23:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLJjE-00000002Ugb-3ETA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 12:23:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 85212414B2;
	Mon, 26 Oct 2026 12:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284BB1F01825;
	Mon, 26 Oct 2026 12:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793017384;
	bh=F28cEkRZw6qR8QYv0rrjSViytgYVUruaxZYjwZM/GiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nVRWHUmmQBWzJjaKLYtj7Cs9hBRzpKDsPyblR+L9mqeip1CnW37rOhv99PxQruLGG
	 F9bR/dIkIEDwPH3Ww1wgvgZe9ts0Mv9WDYDVzEyUvIqTSIoWVsqSgzYseEFoVt3Xlu
	 tLVXovWCeBjfrjW64pb4R0SC5LkjtSFOtl9eemi5ut90BPibXq3ZqlF0aJAuZ3Rr71
	 9gMtSlyL/aBdT3S4GrqAMpJwP2CnkcgnDkd4BSH6sS9XsD2Su2W8duCzHwWxTCWsQq
	 f5AZJgohMtdHL32wOVh3YWugp0BrVbFbCa+D6OvbG/EQWP8Xk0fCYfOS8rLB1MWQFD
	 9GRWRl1bW/cpw==
Date: Mon, 26 Oct 2026 07:23:00 -0500
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Ben Horgan <ben.horgan@arm.com>,
	James Morse <james.morse@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Drew Fustini <fustini@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
	ganapatrao.kulkarni@oss.qualcomm.com,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
Message-ID: <20261026122300.GA3598537-robh@kernel.org>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
 <20261008210004.GA1318789-robh@kernel.org>
 <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
 <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
 <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
 <6e06228b-827a-4321-99c1-3e0e961abd61@arm.com>
 <86fee017-c9cb-4583-beab-4f29919fb518@oss.qualcomm.com>
 <1feb10d8-75f3-4dbf-9fae-807dc5a22c25@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1feb10d8-75f3-4dbf-9fae-807dc5a22c25@oss.qualcomm.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 23, 2026 at 02:03:57PM +0200, Konrad Dybcio wrote:
> On 10/14/26 9:09 AM, Yin Li wrote:
> > 
> > 
> > On 10/13/2026 6:37 PM, Ben Horgan wrote:
> >> Hi Yin,
> 
> [...]
> 
> > Hi Ben, Konrad,
> > 
> > The original 0x10000 reflects the per-MSC register block size as
> > allocated in the KNP hardware — as Konrad noted, Qualcomm DTs tend to
> > use "how much register space is allocated for this block" rather than
> > "what the last used register ends" to avoid holes.
> > 
> > We'd like to update it to 0x321c to give other platform authors a more useful reference, without exposing KNP-internal details such as address holes between blocks. In our case, we don't implement MPAMCFG_MBW_PBM, and — as you noted — the registers from 0x3000 onward are domain-specific; since we have no domains, those aren't used either. So the actual footprint we need is smaller than 0x321c, but showing the full 0x321c gives other authors a complete picture of the allocated register space.
> > 
> > That said, this patch is marked DNM and is intended as a local
> > verification example only, not for merging.
> 
> If you don't intend it to get merged, you can even put 0x12345
> in there. But for future submissions that will have the intent to
> be merged, please stick to the 0x10000 size

Why? That just wastes virtual memory space. I know it is "infinite" on 
64-bit and *only* 96 bytes of PTEs, but still.

Rob


