Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE03DEB28D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 06:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQcuRxmk8HUJBcO5JRqiErTcAkKAKHjaMWcgzQ/Msa0=; b=AhAlHlkwhWCOLOJ6ZED62+1IRr
	9kUdFt8WHdaatRuPJZk1RS2xjaVxIQmj1hCaZgavXPB8qf4q1pqH8OdOMAhQhF36yPTjPZYxWWlV+
	eLl8ropI6ZlY3gEzRbKAqR88x0TOw/NIKLO1EqYinSOJhzM2iZdVzJL2iq7/9Lp0gH+DdUtBkr0j+
	kgywMkDT0WfN1KQ+NXlQ1xoQFTBEFEDK7QxI7kCU9K6u9fD0T+7gxYvcAxXD9l5rAX8QQzTT3drfp
	nOhOaab34SX2FCl9bOMr7b2PB8/iz0g485cQy1CiQLN9lV6pvKxQ2ohRQwuRwIw3rgNqnYHf81fec
	A1ttGnmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voF4B-0000000Avid-2P7g;
	Fri, 06 Feb 2026 06:11:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voF4A-0000000AviV-2Tvm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 06:11:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6A04260010;
	Fri,  6 Feb 2026 06:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2709C116C6;
	Fri,  6 Feb 2026 06:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770358301;
	bh=xQSKwhkANWN8IwjK9ckDxM334/zoJ+AcdEkWuOlyze4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bPsGU1LJrFqeLArNybkaNfr/lVd5ZdvZFwss0zlO1bkv6QAcNoTkRln2gPQdfBc8P
	 v9jsoEj15xJNX22uEts8ki7IRrdXusX7r3tya+jqqU5sBHRU/rFJ97C1COKah5dA0Z
	 fDRMu3kM9h9nxKtwmQr8rqeDbVoT0o615FzVew/jA5gomL8EE5vGvNyd8GmK1eGGyq
	 7DLLTyTW049d2U3uUgaRG8URQmt6gC9nU2BmAkQmQe7HZGu8EFcoJVmtZ882vh04s4
	 RnT5WJ7LPnuttQxFOC/yxAXEzpt9fBkgb46ibM3Ec1A6esdPs8VI0DL6KPpjZwptGu
	 sqGvrg8kvJc9A==
X-Mailer: emacs 30.2 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>, suzuki.poulose@arm.com,
	steven.price@arm.com
Subject: Re: [PATCH] arm64: swiotlb: =?utf-8?Q?Don=E2=80=99t?= shrink
 default buffer when bounce
 is forced
In-Reply-To: <aYOVf066Fdr9L-nw@arm.com>
References: <20260120070102.182977-1-aneesh.kumar@kernel.org>
 <aYOVf066Fdr9L-nw@arm.com>
Date: Fri, 06 Feb 2026 11:41:33 +0530
Message-ID: <yq5a8qd6iep6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Tue, Jan 20, 2026 at 12:31:02PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> arm64 reduces the default swiotlb size (for unaligned kmalloc()
>> bouncing) when it detects that no swiotlb bouncing is needed.
>> 
>> If swiotlb bouncing is explicitly forced via the command line
>> (swiotlb=force), this heuristic must not apply. Add a swiotlb helper to
>> query the forced-bounce state and use it to skip the resize when
>> bouncing is forced.
>
> I think the logic you proposed in reply to Robin might work better but
> have you actually hit a problem that triggered this patch? Do people
> passing swiotlb=force expect a specific size for the buffer?
>

This issue was observed while implementing swiotlb for a trusted device.
I was testing the protected swiotlb space using the swiotlb=force
option, which causes the device to use swiotlb even in protected mode.
As per Robin, an end user using the swiotlb=force option will also
specify a custom swiotlb size

-aneesh

