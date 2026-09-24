Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF318C98311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 09:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OH4SNWg4WxSZv561l9vVZkZSASMw2QsrKpQxbItU284=; b=g/zKSq2C569XI+7kmaUfPcclBd
	ZDLduGK32wT3WSxfJ+NbMJFUSJLsgmqvDpgP1nS8CIFDKuai64uhu5Nu4Ak85iqH19vPRjLUxfavr
	xGyGO1Sagc6GRg3BKtCNJTCalCf+drfQc/2m17MAtOcnaO0zQmPzydi/xZBJ+su9iDhtQiLXmqnsd
	cdw1b/ERBD78jhsMa5yzgUbCheq0S0DWE8T3ZsFcWUPCT1fPuWUxaMD1JMEAMde6bcMhrmuvt7X1X
	mTTBPKMCBOAaTcyuKTt7Cw9pvMgviP+vcOOEUm5jAaBW7J73NBlyqCjtyu5NYhere/At7wybGg7Wm
	89vLsPMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9g4I-0000000Ad04-2I7J;
	Thu, 24 Sep 2026 09:48:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9g4H-0000000Aczs-1fNR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 09:48:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE0E041356;
	Thu, 24 Sep 2026 09:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160FC1F000FF;
	Thu, 24 Sep 2026 09:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790243320;
	bh=OH4SNWg4WxSZv561l9vVZkZSASMw2QsrKpQxbItU284=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hbAlI9mfnuuRp6LUUI6ldVQ2MDxhRSTnKumanSZx1azAPkE+7SYVbJ+gOf9jsyRv7
	 DNptUQabV/jGs7mAQLKybEm6DPkrJYryZqGBibJQDC6p3unAgbGAydbVL09FWvNtIH
	 YBbcsHCRERkQh3DzHyPxADNpJ5PpzcWlLpsJOm7IgztDgDDjeWVkkbqeLKOlEXVqxw
	 r0FEq05XGfoBfGIc819sKhhVDNdp4RLCNxKnPxMLoJl4paHAFeYpePfQ6j+bDCz6OX
	 PqkHaCSS4kkEYHw5Y5nX5qazMSaWAnOdp8V6yMybD8sz59e/3UJkvCvWh/oVQl61lN
	 gnMGqWGkxl9zQ==
Date: Thu, 24 Sep 2026 10:48:35 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Ben Horgan <ben.horgan@arm.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Srinivas Ramana <sramana@qti.qualcomm.com>,
	Niyas Sait <niyas.sait@arm.com>, Lee Trager <lee@trager.us>,
	Ritwick Sharma <ritwick.sharma@arm.com>,
	Gavin Shan <gshan@redhat.com>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 12/14] arm_mpam: detect and enable MPAM-Fb PCC support
Message-ID: <20260924-snobbish-brainy-velociraptor-06bdd4@sudeepholla>
References: <20260911112835.714162-1-andre.przywara@arm.com>
 <20260911112835.714162-13-andre.przywara@arm.com>
 <3e7bdafd-d6ea-422c-82ff-e278a17280ff@arm.com>
 <a314ee8f-4152-4b29-8348-6cd750eced40@arm.com>
 <d96cbb8f-631c-433f-a553-6a6e20531f68@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d96cbb8f-631c-433f-a553-6a6e20531f68@arm.com>
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

On Mon, Sep 21, 2026 at 05:28:27PM +0100, Ben Horgan wrote:
> Hi Andre,
> 
> On 21/09/2026 17:09, Andre Przywara wrote:
>> Hi Ben,
>> 
>> On 9/11/26 17:09, Ben Horgan wrote:
>>> Hi Andre,
>>>

[...]

>>>
>>> This looks like the change earlier in the series to
>>> drivers/acpi/arm64/mpam.c makes no functional effect unless the proposed
>>> spec changes are accepted; the default is msc->id. I'd just move the
>> 
>> Yes, but it reduces churn, and more importantly, is more true to the
>> MPAM-Fb spec, which says:"The MSC identifiers are sequential and start from
>> 0 for each agent which uses this protocol." So this requires that we have
>> per-channel IDs for the MSCs, that's why I think it's justified to
>> introduce this already now, even when it's somewhat redundant as the code
>> stands now, as we always assign the system-wide ID to it.
>> 
>> I can of course move that out (and have that already on top of v9,
>> internally), but wanted to check this with you.
> 
> I don't really mind. If Lorenzo/Sudeep are happy with doing the preparation
> work in drivers/acpi/arm64/mpam.c then I'm ok with it. It's currently a
> non-functional change but does make the expected path forward slightly
> clearer.
> 

Sure, I am okay to have it added here if we plan to use it in the future.
We can always rip it off if the spec changes its direction or gets deemed
as broken 😉.

-- 
Regards,
Sudeep

