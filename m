Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5DCC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 15:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2AMuHuMUUqi+dic2soAVUk4mURTrMtDGqMr1EfN8y4s=; b=r2VbBIINnRvKSnvD2JEFkVcBiK
	F/1FfKlvVDC04qi+G5t3IKIoIaXLHCeBKO6x2UsCzOX20A363cB/qLKo9fxFbYZmi+xfmG1bj8Au4
	hG2G0NsF+h6qpk6aXVD2HjDQ83ihxi7pM4X1yX2u8vW8+oKHuZkv6qh+I7ox2IYwoA/uuDb87zE6U
	plK6p0aXBHUZHWaMhi/TndgcTi68QM3KCcJ9o8j7IsihK5NCyYFYjDx03KyRlNcXtDPaDPOx6ycba
	dSNG7tbx/eST4j/r5H/qbKQJF6OWvRD764hSjUcyum5VW2Rln/aYASd1eyQxhbuMIHUNqHMX8ckwI
	Fv/uEvyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujJZm-0000000D8qr-3rWm;
	Tue, 05 Aug 2025 15:27:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujICR-0000000Cv6z-34rI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 13:59:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 77D765C49E2;
	Tue,  5 Aug 2025 13:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6031C4CEF0;
	Tue,  5 Aug 2025 13:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754402370;
	bh=4V5dBQ+eBPCJ1smNjnAgZUg0T+QL4DB32r+LUoylzy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C+msLCQbJWncbbFJjxOGuHXbektWQ58Zvp45zhgaQzMpnkHSZ2xCeZuWcw1DzgacE
	 D6vkoQycXuMJZrNOS8IZH+cGe6O6m5hOEVEinLUVzNNwCFqvdclDd/ztaH6f5NzFLe
	 xKIwv5Tk5jsQyAontMhaPkrHI2TCLgRo776taGXBe+Elqu0bbqXDr6WhAg85KpyJcY
	 Oi+Y6VS8rFsoRQTqtGwfsOd1pA+g+ME+x0yWYakW5uDjczwXMMQLIUSBGH9DbtvH1D
	 Tgn7bYwqbrJPd6NP5qK0n34074NDyHK5/3VMpDXFvbigSWZefKkFeWNHUVXQlXwaAV
	 HQj3URE/YfcIA==
Date: Tue, 5 Aug 2025 09:59:27 -0400
From: Sasha Levin <sashal@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, toan@os.amperecomputing.com,
	kwilczynski@kernel.org, mani@kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 6.16-6.6] PCI: xgene-msi: Resend an MSI racing
 with itself on a different CPU
Message-ID: <aJIOP1GO8LumDZOJ@lappy>
References: <20250805130945.471732-1-sashal@kernel.org>
 <20250805130945.471732-59-sashal@kernel.org>
 <86fre5aoqz.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <86fre5aoqz.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_065931_813632_CF760416 
X-CRM114-Status: GOOD (  15.50  )
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

On Tue, Aug 05, 2025 at 02:20:52PM +0100, Marc Zyngier wrote:
>On Tue, 05 Aug 2025 14:09:34 +0100,
>Sasha Levin <sashal@kernel.org> wrote:
>>
>> From: Marc Zyngier <maz@kernel.org>
>>
>> [ Upstream commit 3cc8f625e4c6a0e9f936da6b94166e62e387fe1d ]
>>
>> Since changing the affinity of an MSI really is about changing
>> the target address and that it isn't possible to mask an individual
>> MSI, it is completely possible for an interrupt to race with itself,
>> usually resulting in a lost interrupt.
>>
>> Paper over the design blunder by informing the core code of this
>> sad state of affairs.
>>
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
>> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
>> Link: https://lore.kernel.org/r/20250708173404.1278635-11-maz@kernel.org
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>
>> LLM Generated explanations, may be completely bogus:
>
>s/may be//. It is an amusing read though, specially when quoting
>totally unrelated patches, so thumbs up for the comical value.

Yeah, it's still very much at the "junior engineer" level, but honestly
I think that just the boolean yes/no answers out of it provides a better
noise to signal ratio than the older AUTOSEL.

>But I'm not even going to entertain explaining *why* backporting this
>patch on its own is nonsense. Reading the original series should be
>enlightening enough.

Sadly it doesn't have the context to understand that that specific
conmit is part of a larger series. That information just disappears when
patches are applied into git.

I'll drop it, thanks!

-- 
Thanks,
Sasha

