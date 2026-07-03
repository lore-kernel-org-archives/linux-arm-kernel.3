Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD065C44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 16:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4fjgNakpX6GsuTiddiSQxuWPFVXr9GRxsHhqq40J8g=; b=uA0bRINawlrXSkQWzc8aYfQjIN
	fSGCgNzf6fBkwcD/e4cwWJCusxjB3qeACn0EwAR1abpPwjhVO8Dv8ixOfDlQBpHN/mL42X4+bmb09
	I7ferZF47FUkEX2w9yFhzRZoEnNIPXRNSErBzc/g/+XPXVv1/N3UyoOEdAEdbt/Q+mrY2c6MfFrsP
	+XQK34T/BwLuf9uS75wA6ac8UoJwHPVwZ7y/X+lBkXWl21b9QI2lWb9QRWSE09awH92jbaEjnmz2i
	uxqnVFwowY3H7G1j43BhlCEBbGJNuJU8aCwQKUS5nIUnsIpEXhP3JmiGmJKB9JBsuvSIEbX1mh+sM
	nr0kGalA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfhF1-00000007Zr3-3SBT;
	Fri, 03 Jul 2026 16:59:52 +0000
Received: from confino.investici.org ([93.190.126.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfhEx-00000007ZpL-2bmI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 16:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1783097973;
	bh=j4fjgNakpX6GsuTiddiSQxuWPFVXr9GRxsHhqq40J8g=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=nSoV1OlAteAOdyTDmN43NkMQNImXQf/VyY0mHwKTVicJhqOaDdDvgJYw8irq19BHW
	 /SLnWpPTpOF4iuIQqnifHUEdcbkPVP9gpVIhZ5Zt1RKMTZYyBV+3+pGQXMbOHPAfzB
	 NgiMV3q9ZWh2D+os60pWqlr+NSGSGEooUbmnlffE=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4gsKjd5HYwz1154;
	Fri, 03 Jul 2026 16:59:33 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4gsKjd1qdPz1141;
	Fri, 03 Jul 2026 16:59:33 +0000 (UTC)
Date: Fri, 03 Jul 2026 17:59:32 +0100
From: Bradley Morgan <include@grrlz.net>
To: Marc Zyngier <maz@kernel.org>
CC: Leonardo Bras <leo.bras@arm.com>, Oliver Upton <oupton@kernel.org>,
 Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Quentin Perret <qperret@google.com>,
 Vincent Donnefort <vdonnefort@google.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4=5D_KVM=3A_arm64=3A_Record_whe?=
 =?US-ASCII?Q?ther_pKVM_stage_2_mapping_is_cacheable?=
In-Reply-To: <86pl15pfqa.wl-maz@kernel.org>
References: <20260701192428.17430-1-include@grrlz.net> <86qzllpy1g.wl-maz@kernel.org> <akZJIm6mTza7qAuu@LeoBrasDK> <6495D546-8FC7-4A31-B18C-88F34E1B64BB@grrlz.net> <86pl15pfqa.wl-maz@kernel.org>
Message-ID: <A209F36E-52C2-4094-9034-9046AF6CB342@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_095948_107857_00762378 
X-CRM114-Status: UNSURE (   7.15  )
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

On July 2, 2026 4:34:53 PM GMT+01:00, Marc Zyngier <maz@kernel.org> wrote:
>On Thu, 02 Jul 2026 15:52:14 +0100,
>Bradley Morgan <include@grrlz.net> wrote:
>> 
>> I'll test it. If it's good. I'll do
>> 
>> Suggested-by? Or co-developed by?
>
>Sb if you want, definitely not Cdb. More importantly, I expect to you
>to follow the process described at [1]. Nothing there is optional.
>
>Thanks,
>
>	M.
>
>[1]
>https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst
>
>


Hey, I've reviewed your code, LGTM, in a week (or when you tell me
discussion
is over)

I'll do V5! :)

I'll see if there is any modifications I can do to shorten
it, (of course if it fixes the bug)

Thanks maz for writing the fixed patch.

Thanks!

