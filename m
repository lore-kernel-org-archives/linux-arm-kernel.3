Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FE2C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 15:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zh2N3DGtJ2GD6KAwDIkT597ToDimyE3LkUGAAa+eDg=; b=U1EpQFLPejg8cYd4oHtGj5Hgvv
	Q6az6RhkkaU3QRGVX83aQKISBtT4CqbkxhkTEgeUcfEFVk9EzpBNZtmNPjEx2pHOro2J7pxYPUzI/
	KLgD/2d3Vf35xlg/+F2lNJXowCy8TWa+sba9J8wHgMSBqlUO4VlodgO74k6GG4kBNXP+hH8p0U3po
	GAZJKvTBG2NHvQywm42WeqHaFKBnfzO4Fz+sHMkDe+A8NZvOzyC4yIzBAbKAsj12dw3280ep2RsaN
	x0dwtpJwEhNm5hAeXnB0tQTt16Pu4DieG0g4v99sFJUhc6GThyLz8BcbDYKac7s3jSYnqaP42xkKo
	N/lHP4xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquFS-0000000HTGv-3EoL;
	Mon, 03 Aug 2026 15:06:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquFQ-0000000HTGa-1LHl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 15:06:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A164143D;
	Mon,  3 Aug 2026 08:06:30 -0700 (PDT)
Received: from [10.1.25.28] (e122027.cambridge.arm.com [10.1.25.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E09E3F66F;
	Mon,  3 Aug 2026 08:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785769594; bh=AKHk4mlXMEmidkB6mplFPKFhKVxhdwJ+1dQAEJAtyyY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BNQDBx3nISccFEihc91rkcvYVRSDUBe855HEni/Md3KgHmB0IcddGK1GnAbb/YQzG
	 LC+n0k7cgO8GvGUmlv5JUbQ+ygUMmMUFvBKVlL7+rNiWOlx3HOAy/qxy9y7e2IryaV
	 3E4AOCSx5ZHoMYwI6fYIZ99a5Rc2CBlcf1PbOxS4=
Message-ID: <57225daf-4319-406a-8328-e32835e8a980@arm.com>
Date: Mon, 3 Aug 2026 16:06:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 00/45] arm64: Support for Arm CCA in KVM
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo Pieralisi <lpieralisi@kernel.org>
References: <20260803134403.80630-1-steven.price@arm.com>
 <86y0enb64s.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <86y0enb64s.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_080636_423040_1131B9F2 
X-CRM114-Status: GOOD (  20.11  )
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

On 03/08/2026 16:01, Marc Zyngier wrote:
> On Mon, 03 Aug 2026 14:43:16 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> This series is based on the guest_memfd in-place conversion v9 tree[1],
>> which is itself based on kvm-x86/next. It is also available as a git
>> repository:
> 
> Well done. Series on top of another random series, based on a random
> tree. Unusable. Have you realised there are reasons why we (KVM/arm64)
> ask people to base their series on a *released* tag from Linus' tree?
> This means that Sashiko cannot, once again, provide any feedback on
> this series, as it fails to apply.
> 
> Just to avoid any ambiguity: Sashiko reviews, as annoying as they are,
> are not optional. They are very much mandatory, and I wish I could
> turn back the clocks to run it on my own code...
> 
> Running it on your own is not enough, because *I* want to see what the
> tool finds. Not to mention that non-Gemini runs of sashiko are much
> less interesting (unsurprisingly).

Sorry, but I'm not sure what you expect me to do - clearly I want to
base my changes on top of the guest_memfd series which is being worked
on and not just ignore that work. So I've based my changes on top of the
tree that Ackerley published.

I'm certainly not trying to avoid the Sashiko reviews - it's a rather
unfortunate limitation of the public tool that it doesn't seem to be
able to deal with these dependencies. Or is there some magic that I can
do to fix this?

Thanks,
Steve


