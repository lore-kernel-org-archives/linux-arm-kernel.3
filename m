Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB86CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 15:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FMcvrNMeiunarYDVwOG320BrY694FQ1Ht0HcOfuTAsY=; b=XzARRlKU2FJmZBKx4akCvzRhpt
	HFq4/L1gUlWLqN3jFXDnVub4uAX6ER35rpOGEC/H3OzLcRyhwvMYeXNQjNSoRaJs5a4f6Mq7I6iFs
	saj5lyKL0YhpiXWf5aqdnpl7Vxp/LON+eeToFZzu+PzEkxnL1qiScbo/BARfFcf8jUGprIRJNTDqN
	VhEQof+YaOCOGa5ih6GSNu8LxZvNBkXJwqWia5bZlubTb1Fb/mtD+Ipd17cU96jrnZhjH6Wa7WUra
	bx6LqI0rhmLKXUEAsn0I4kV07STRxvVXT7RUIBaJVPnRVEBqZw/WEKnow+pYqyv8y0vR9lHnYP+VM
	K/GYYwhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2cs-00000006Uw1-0zQ7;
	Tue, 23 Jun 2026 15:01:22 +0000
Received: from confino.investici.org ([93.190.126.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc2cp-00000006UuT-1fLF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 15:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1782226866;
	bh=FMcvrNMeiunarYDVwOG320BrY694FQ1Ht0HcOfuTAsY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Wb20dxWoONi9pPs2QuazEXjNsezuZUxJfr6Bt/lJx6L2U5wYsR5Qp+2v8p4iKpKWB
	 s6YNPlyU+s4GKPlZyLagwVVt3BtXN5LIcebqRuRBmgkhCN7gWjjlD69Hbur4uWxdVx
	 7pqTFjRLwTMvMunQ9fse9F940xVyvwizQm7889lA=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4gl7YZ52K9z10tQ;
	Tue, 23 Jun 2026 15:01:06 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4gl7YZ1VJCz10tD;
	Tue, 23 Jun 2026 15:01:06 +0000 (UTC)
Date: Tue, 23 Jun 2026 16:01:05 +0100
From: Bradley Morgan <include@grrlz.net>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>
CC: Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: account pKVM reclaim against the VM mm
In-Reply-To: <178222278590.523236.18181071715501850418.b4-ty@kernel.org>
References: <20260621213155.6019-1-include@grrlz.net> <178222278590.523236.18181071715501850418.b4-ty@kernel.org>
Message-ID: <CE64C9AC-32D5-495E-B713-552921468FB9@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_080119_582335_6706B907 
X-CRM114-Status: UNSURE (   6.12  )
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

On June 23, 2026 2:53:11 PM GMT+01:00, Marc Zyngier <maz@kernel.org> wrote:
>On Sun, 21 Jun 2026 21:31:55 +0000, Bradley Morgan wrote:
>> Protected guest faults charge long term pins to the VM's mm. Teardown
>> can run later from file release, where current->mm may be unrelated.
>> 
>> Drop the charge from kvm->mm instead.
>> 
>> 
>
>Applied to fixes, thanks!
>
>[1/1] KVM: arm64: account pKVM reclaim against the VM mm
>      commit: d098bb75d14fde2f12155f1a95ec0168160867ce
>
>Cheers,
>
>	M.
>


Hey, which tree did you apply it to?


Thanks!

