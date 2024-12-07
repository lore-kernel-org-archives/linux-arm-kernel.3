Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA96E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 06:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hyvv07dz2xClz8g/D/ieatWI6gTW917CwYN97hFxrOE=; b=kqKhCpuW3LcsYjlipDnE8jCggx
	fCwFhU7JCT5YZrsTNp973WUFLztg+Y2zv75ZD3camiSsgwBwXZIyF/BqHZ+C0CGAfRW185OgJiykv
	TV6S1FWWKhHAWLadYYcVO0Px+gTfQu4LHPtvJd0ujkqlBfnTvsu3OwBQr8T210vXBVrx5xPM2v8eg
	CBQQyvADWQjAmatSNpDuKrXzp8nbijdjPpVJUNlPoT/AWQ5eNxuCyHnc1xM4urtfSTpWvfGqLRUcH
	nirQsFmgLcMjFzLqQhmBmxHEe2uX7kr76rtz/TPl/0ewl5q5Y/1yICWEsw3c1bAnKsWUxXJgEjLA/
	rONFG5nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJo6a-00000003UD1-1hQi;
	Sat, 07 Dec 2024 06:15:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJo5Y-00000003U4L-4AZs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 06:14:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5044F5C4A27;
	Sat,  7 Dec 2024 06:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3AAC4CECD;
	Sat,  7 Dec 2024 06:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1733552087;
	bh=FR4jyYVvGAc/QK1Xv+schhqBTtRlolGYuXRzbKnnX1c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fo46We9zcOKYJ5ZyyFgLQkHdqkJZ2+uqkkvcCqqRLfaeDplZY6Qd1+CTu6hOCmIck
	 HDp8TfGzq2ACTP47vjooMiJJSDUk9puaZZWW034/K7AFWAOqYcrVaLOBH2jYNkth35
	 adR74FV6p73bFYQYB/JZM9jMDrGxAiqfJV7HE9xU=
Date: Fri, 6 Dec 2024 22:14:46 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Zhenhua Huang <quic_zhenhuah@quicinc.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>, <ardb@kernel.org>,
 <ryan.roberts@arm.com>, <mark.rutland@arm.com>, <joey.gouly@arm.com>,
 <dave.hansen@linux.intel.com>, <chenfeiyang@loongson.cn>,
 <chenhuacai@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] Fix subsection vmemmap_populate logic
Message-Id: <20241206221446.e5e8ea4ed85d0f2884216b82@linux-foundation.org>
In-Reply-To: <b2681eed-d4d5-43c9-90e0-3e706db3e201@quicinc.com>
References: <20241121071256.487220-1-quic_zhenhuah@quicinc.com>
	<eb4d6674-494a-4a84-bade-481b0c89eb93@quicinc.com>
	<b2681eed-d4d5-43c9-90e0-3e706db3e201@quicinc.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_221449_081688_46B269B8 
X-CRM114-Status: GOOD (  13.36  )
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

On Fri, 6 Dec 2024 17:13:39 +0800 Zhenhua Huang <quic_zhenhuah@quicinc.com> wrote:

> 
> 
> On 2024/11/28 15:26, Zhenhua Huang wrote:
> > 
> > 
> > On 2024/11/21 15:12, Zhenhua Huang wrote:
> >> To perform memory hotplug operations, the memmap (aka struct page) 
> >> will be
> >> updated. For arm64 with 4K page size, the typical granularity is 128M,
> >> which corresponds to a 2M memmap buffer.
> >> Commit 2045a3b8911b ("mm/sparse-vmemmap: generalise 
> >> vmemmap_populate_hugepages()")
> >> optimizes this 2M buffer to be mapped with PMD huge pages. However,
> >> commit ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
> >> which supports 2M subsection hotplug granularity, causes other issues
> >> (refer to the change log of patch #1). The logic is adjusted to populate
> >> with huge pages only if the hotplug address/size is section-aligned.
> > 
> > Could any expert please help review ?
> 
> Gentle reminder for review..
> 


MM developers work on the linux-mm mailing list, which was not cc'ed.

Please address Catalin's review comment
(https://lkml.kernel.org/r/Z1Mwo5OajFZQYlOg@arm.com) then resend a v2
series with the appropriate cc's.



