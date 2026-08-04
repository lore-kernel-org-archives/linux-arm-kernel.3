Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9FBC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uh08z4xlQC3LVT/bBQopMib730yNkx9GaHo/8q4uaI0=; b=CqXu9h9/YQhu6pQUNHQhRKA0cU
	e4b8/N8HHP9fpYMDDYtLbIa7Ps4giNe9T9uZue56ZiDKOy14rbfcA4dVa1iQLkoY7syN0HV86MC3C
	E71lEiOi7638kYuc9Kd4LuRPrSYbaPzaFKki5JBQPsaTxSQQ9SsnuLiY01CSJs4pxGIRpBRimfMDA
	aNlX4A2rF06O8BZB8GWeuI9FeFc9C8To3GXaEMjlnKrAVCD86lwnTOfIhIXi7Yj2GTjAtzMs9HdwU
	Qlmrm9jCvOmHCaL6mgQAgIll1XKCZC78vndcT4xrmoMAC3kXKYUUb5q6n34Iycij0tymGoaahB+3q
	eBqjPyTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIxh-00000002V35-2CPC;
	Tue, 04 Aug 2026 17:29:57 +0000
Received: from latitanza.investici.org ([185.218.207.228])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIxe-00000002V2K-2R6S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:29:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1785864590;
	bh=uh08z4xlQC3LVT/bBQopMib730yNkx9GaHo/8q4uaI0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=tStpdKy1pdkBSdBPcCu1jZBByy0M/OFZ0DmH2lVWIxMFan86UP5IACMmegn8dBvDu
	 wMOpHEjUlr15b1HcGzcNqx7uSAznjKbu2s84FG9hUrIX1jPTyKeccApirbCPjCyyPK
	 Rlt4G19sUcmpypB2DN8inCBTGqH2ouqFWDTz+pfY=
Received: from mx3.investici.org (unknown [127.0.0.1])
	by latitanza.investici.org (Postfix) with ESMTP id 4hF0sp6p9KzGpRx;
	Tue, 04 Aug 2026 17:29:50 +0000 (UTC)
Received: by mx3.investici.org (Postfix) id 4hF0sp4psvzGpRv;
	Tue, 04 Aug 2026 17:29:50 +0000 (UTC)
Date: Tue, 04 Aug 2026 18:29:49 +0100
From: Bradley Morgan <include@grrlz.net>
To: Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>
CC: will@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC]  [Question] memset.S old code stuff
In-Reply-To: <anIfa959Zjws1iJz@J2N7QTR9R3>
References: <F8EBC118-3F46-4A47-AD0A-A68E8688938F@grrlz.net> <anIMAh8nL5rWS6d9@arm.com> <anIfa959Zjws1iJz@J2N7QTR9R3>
Message-ID: <07524ABA-8210-4848-85E6-5F3F72183F21@grrlz.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_102955_036069_87671D0C 
X-CRM114-Status: GOOD (  14.28  )
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

On 4 August 2026 18:20:43 BST, Mark Rutland <mark.rutland@arm.com> wrote:
>On Tue, Aug 04, 2026 at 04:57:54PM +0100, Catalin Marinas wrote:
>> On Thu, Jul 23, 2026 at 12:17:15AM +0100, Bradley Morgan wrote:
>> > Hey folks, sorry for the crazy asm emails, I see that in memset.S in
>> > arch/arm64/lib/memset.S, the code is incredibly old code, like 2013
>old
>> > (heh).
>> > 
>> > I was wondering if I could say, adapt it from optimized-routines (same
>> > treatment as memcpy.S essentially.
>> 
>> I think Robin attempted until he realised the use of the Q registers in
>> the Cortex Strings library, mentioned here:
>>

I would say scalar port??

>> https://lore.kernel.org/all/cover.1571073960.git.robin.murphy@arm.com/
>
>We also subsequently looked at moving away from Cortex-strings entirely,
>e.g.
>
>  https://lore.kernel.org/linux-arm-kernel/20230314115030.347976-1-mark.rutland@arm.com/
>
>... but there were open questions on the semantics, and no clear path
>forwards at the time.
>
>Writing the code isn't the hard part. We need to get wider agreement on
>the semantics, test on a variety of platforms, etc.
>
>For now, I think it'd be best to leave as-is, since it's a time sink for
>reviewers.

Ack. Again, a scalar port is iffy, not 100%. 

That would require time.


>Mark.
>

Thanks!

