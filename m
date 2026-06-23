Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B0ECDB479
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 15:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKKmQLguZ8CX+dAbSlBru+T3jTbu7nsx2GjEfP1Duls=; b=ogHxayk6Gepc9hrTpVOiBciW4P
	jQieGl/DBOCHU1I3DtvggC3d9i6K7w4ZWftfL5RLbjA9nQwHzjATQMtc8DYyWeTxJWpIpadwdZdFa
	p+1XSuB8vxlwB7GSDScEbMwb+H/SXSYlzmNVms1D2NGzKNmD+xtUzZfJtXPJfXmLLzb075NTNTWpU
	mwaUB+iBk3F+W6ecTrIdQoQGgYhkt+Cs75TzUtH3Rb6llEgvFUr8Rq0Uvjo5Ef3CZ1JttafFCRGUK
	ywLHMJTX7xWlLtdK5I4DFcC7PW2F0YjwrURMQMvAygESqJB8WLgSEW6msOjdU8O2SRHz39QyIfPkO
	dsYPIOzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2mR-00000006Vgt-3Itg;
	Tue, 23 Jun 2026 15:11:15 +0000
Received: from devianza.investici.org ([2c0f:f930:0:4::108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2mO-00000006VfU-41zh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 15:11:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1782227468;
	bh=mKKmQLguZ8CX+dAbSlBru+T3jTbu7nsx2GjEfP1Duls=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=S0p0bHhFU5PcCzVHSc3ZdIrK14xvaTPGQPAkRN5N0ilzKgf/xIlAPClRGx3ehSdKt
	 jTTCSLBISlj5wpRUMXwo4Q+NF5sAkYpbC76bNb3KwnttYG1jSG4o/3JwC0OnvxhWuf
	 f2zd4j9cpsGdw8Xfy0h2DhziJhssdSS8ZHxhMn/8=
Received: from mx2.investici.org (unknown [127.0.0.1])
	by devianza.investici.org (Postfix) with ESMTP id 4gl7n85KxJz6vC6;
	Tue, 23 Jun 2026 15:11:08 +0000 (UTC)
Received: by mx2.investici.org (Postfix) id 4gl7n820wGz4y2q;
	Tue, 23 Jun 2026 15:11:08 +0000 (UTC)
Date: Tue, 23 Jun 2026 16:11:07 +0100
From: Bradley Morgan <include@grrlz.net>
To: Fuad Tabba <fuad.tabba@linux.dev>
CC: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: account pKVM reclaim against the VM mm
In-Reply-To: <CA+EHjTz+oNerTD3Ygj3EzOA4zm4BKfQYM45ydwVO=2amErkBAQ@mail.gmail.com>
References: <20260621213155.6019-1-include@grrlz.net> <178222278590.523236.18181071715501850418.b4-ty@kernel.org> <CE64C9AC-32D5-495E-B713-552921468FB9@grrlz.net> <CA+EHjTz+oNerTD3Ygj3EzOA4zm4BKfQYM45ydwVO=2amErkBAQ@mail.gmail.com>
Message-ID: <54A2BB77-5E81-4730-82A1-DB457118784C@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_081113_144602_2C7E1B28 
X-CRM114-Status: UNSURE (   8.52  )
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

On June 23, 2026 4:03:30 PM GMT+01:00, Fuad Tabba <fuad.tabba@linux.dev>
wrote:
>On Tue, 23 Jun 2026 at 16:01, Bradley Morgan <include@grrlz.net> wrote:
>>
>> On June 23, 2026 2:53:11 PM GMT+01:00, Marc Zyngier <maz@kernel.org>
>wrote:
>> >On Sun, 21 Jun 2026 21:31:55 +0000, Bradley Morgan wrote:
>> >> Protected guest faults charge long term pins to the VM's mm. Teardown
>> >> can run later from file release, where current->mm may be unrelated.
>> >>
>> >> Drop the charge from kvm->mm instead.
>> >>
>> >>
>> >
>> >Applied to fixes, thanks!
>> >
>> >[1/1] KVM: arm64: account pKVM reclaim against the VM mm
>> >      commit: d098bb75d14fde2f12155f1a95ec0168160867ce
>> >
>> >Cheers,
>> >
>> >       M.
>> >
>>
>>
>> Hey, which tree did you apply it to?
>
>https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git/log/?h=fixes
>
>/fuad
>
>>
>>
>> Thanks!
>

Thanks fuad.

May I ask if this would be put onto ACK?

Since this affects pixel devices.

(E.g, my pixel 7....)

Thanks!

