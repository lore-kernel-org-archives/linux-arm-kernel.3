Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAFE0CDB470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 19:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xlRXCKKPWACvAnS4iALqH+JPpXRCzsovrB7Jtm/n3rM=; b=eOGZPmcKag0eFnvo2F2IOAvvfV
	pQ8mh+1lVtWf7HNwQL0pVsqAXHvP3guQpEsvI/7VXR5TjjQT1FuqTR2UvFqcQ3DvLIQNJgYnMZh41
	5F7VZ2kblKu+ACAMygG51THa9TNdbMi7FiPR1w/9K2qc6xI2n/vSlryk/h1Da8V3GIo5XG2h7VQiK
	hNVmmU3Z1X1My9dhyHj1rd6rmT8C5gGhZJ5OFzlbtYyVJFaH5SQ2hhiUrCZXskr7nurgDjlRWM23t
	drMA7OdwcoDWUYN0A0NB71DRHoOxhAS5oUiuaChy8e28zbVq4xguucWt5m/NZ99GUSloOugAZ1zNw
	frIeEFJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc6DL-00000006lts-2Cgi;
	Tue, 23 Jun 2026 18:51:15 +0000
Received: from confino.investici.org ([93.190.126.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc6DI-00000006ltY-1xdm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 18:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1782240668;
	bh=xlRXCKKPWACvAnS4iALqH+JPpXRCzsovrB7Jtm/n3rM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=t9P1Hu1OLFc2SI0lw8Q1OSGHqJXhZIigwJmYPR9UQAtEWYqHKcpENs1qU70YjmqE2
	 GDRoWG/Mi67Tuc4U04Aa5cmTFENIk3xEnejiJaQws/ba5yQaz5XxpprgPeNQtke66S
	 m4P7JmELgeB/mfU6JvuVD1cnZvrxWngS8UfkcmFw=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4glDg029xDz10ry;
	Tue, 23 Jun 2026 18:51:08 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4glDfz65FMz10rw;
	Tue, 23 Jun 2026 18:51:07 +0000 (UTC)
Date: Tue, 23 Jun 2026 19:51:05 +0100
From: Bradley Morgan <include@grrlz.net>
To: Marc Zyngier <maz@kernel.org>
CC: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev,
 Fuad Tabba <tabba@google.com>, Joey Gouly <joey.gouly@arm.com>,
 Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Quentin Perret <qperret@google.com>,
 Vincent Donnefort <vdonnefort@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/2=5D_KVM=3A_arm64=3A_skip_pKVM?=
 =?US-ASCII?Q?_cache_flushes_for_non_cacheable_mappings?=
In-Reply-To: <86pl1hqiwj.wl-maz@kernel.org>
References: <20260623160339.15143-1-include@grrlz.net> <20260623163756.4591-1-include@grrlz.net> <86qzlxqjf3.wl-maz@kernel.org> <5925B41F-0F57-4BCB-9F93-7600878ECA27@grrlz.net> <86pl1hqiwj.wl-maz@kernel.org>
Message-ID: <95A8722F-D486-4030-BA51-9117434C6E63@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_115112_958618_F693F2DB 
X-CRM114-Status: UNSURE (   7.91  )
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

On June 23, 2026 6:13:48 PM GMT+01:00, Marc Zyngier <maz@kernel.org> wrote:
>On Tue, 23 Jun 2026 18:04:07 +0100,
>Bradley Morgan <include@grrlz.net> wrote:
>> 
>> I'll go and do V3 with another sashiko suggestion. I'll fix your path
>too.
>
>Before you do that, please verify that whatever Sashiko spits out
>makes any sense. I'm not convinced by its reply on v1 at all.
>
>	M.
>
>

Marc, 

hi, I have verified sashikos concern.

I am out right now. So I will give a very short result.


Sashiko is being bit dramatic with the whole "Critical" rating, but it
is real in another way


I'll explain it in the code in about 30-40 mins.

Thanks!

