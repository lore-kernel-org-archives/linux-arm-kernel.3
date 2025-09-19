Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738B4CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 07:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F9flJKM7IzkC8ce1hDWca3X0bVH2146bB5hDPYcqi/s=; b=AcFfP0C1z8UCprjAa5Cm1Yp92z
	vqsWUfi0A0wjon7eSyfpc8kO/WWi9b48wnv2TXGK3cxbfMCvMeeJZd4ClJRqu/R50G2VYZ8HEKa68
	h/I/ebvCGoiYnRqG4Z4vbZHY0PlfpYpGEtYXygEoFdOX5ZBOy+8YGaK1xX2FBk2Dxwn8FR/lkM3Pr
	X8TgmCMEIXQPnbo6ThRrqaGy9SI91zdd1NzX8Oq512Pu6EHOFgGZOK1wZkoi5JNcUSq0zaeVp6NLc
	qKI4igkEa33rlx4Z7maKvq0bWlFbUB0QK5wODe1Q2d5F6RtL3D5yxUBjV347MdR6EeMsCzWBrbJ0V
	RUp2QA8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVpB-000000027g0-28Sx;
	Fri, 19 Sep 2025 07:46:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVpB-000000027fL-0MFP
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 19 Sep 2025 07:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=F9flJKM7IzkC8ce1hDWca3X0bVH2146bB5hDPYcqi/s=; b=RkW5hUq5iSfU0cbtn/Wk6qs5mP
	XPEhQt79ZxGVzbJwicOt10hPxawUBRlP6TqpD9lgjYZ4kQnOmUCSgqr4hcBYCEvezu1Qt+/9n72yn
	vpx1g54f6pXK0KoQSv/IS1TmO4DeGwxN9QIUzp4Djm41I/vlj0RlYcr9iVxLeJ5nLgyjCLYRFBpn3
	crGK6KYh2QQ+bW2bUWizGhG3Mi3W43fqwoxN8niObSPNlncvP+nIlytytdklH+1QuVs7ZWo7brbkA
	7WwhofXJUGsMzF+hnNpaxUgnMc/5pgN26XqlEIXVteD2q1A/sBo3d8HOKM0vQ6ModKKLDzPPTEsDK
	9v/Wf2NA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzVp5-00000007mBZ-1PU9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 07:46:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 912811692;
	Fri, 19 Sep 2025 00:46:16 -0700 (PDT)
Received: from [10.164.18.52] (MacBook-Pro.blr.arm.com [10.164.18.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EAA743F66E;
	Fri, 19 Sep 2025 00:46:20 -0700 (PDT)
Message-ID: <4f5df85d-b238-4e12-8654-cab771454c49@arm.com>
Date: Fri, 19 Sep 2025 13:16:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v5] arm64: Enable vmalloc-huge with ptdump
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, anshuman.khandual@arm.com,
 quic_zhenhuah@quicinc.com, ryan.roberts@arm.com, kevin.brodsky@arm.com,
 yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com, mark.rutland@arm.com, urezki@gmail.com,
 jthoughton@google.com
References: <20250723161827.15802-1-dev.jain@arm.com>
 <aMk8QhkumtEoPVTh@willie-the-truck> <aMrXBArFNLTdwWs3@willie-the-truck>
 <aM0F8U-cW6sh62H-@willie-the-truck>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aM0F8U-cW6sh62H-@willie-the-truck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_084627_710401_9FA96782 
X-CRM114-Status: GOOD (  13.54  )
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


On 19/09/25 12:57 pm, Will Deacon wrote:
> Dev,
>
> On Wed, Sep 17, 2025 at 04:43:00PM +0100, Will Deacon wrote:
>> On Tue, Sep 16, 2025 at 11:30:26AM +0100, Will Deacon wrote:
>>> I'm currently trying to put together a litmus test with James (cc'd) so
>>> maybe we can help you out with that part.
>> Here's what we came up with. There's not a good way to express the IPI
>> from kick_all_cpus_sync() but it turns out that the ISB from the TLB
>> invalidation is sufficient anyway. Does it make sense to you?
> Any comments on the litmus test and/or my question about serialisation
> of the static key? I'll be moving the arm64 tree to "fixes only" soon
> as far as 6.18 is concerned.

Sorry, I had read your replies but thought I will take time to respond since
it seemed this patch wouldn't land in 6.18, and I need to recall the discussion :)
I'll reply to the other mail.

>
> Will

