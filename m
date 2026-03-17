Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4E0FED9F0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 17:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ER1Wx1cLo48PWOXiIHDwWNLWadUbn+AOiGeXP4sXszM=; b=4h2CWQ2MwN9uRadt2s4M7zQCuE
	YGhP9evW/3gZWMzyEfbtdtWttgnz7AcDIkQZlgRnXS7QsWf2qsyJnb//vPzjQW0sLWuZ9Dk2zgp+G
	cM+y1q+IBrSAHV2A1r0eJTSP4BmWkaFX94V8+HQxYK7LiQAR3L6T1F07v4ONWlwUFR5FuBR8aDiQB
	1K+aNVNPCzEB0NxbGn7d13X4mDg6lKduxDac3Y16QUlECl907Bo1ufCm+gnjwoYBUc7EC6JAUFpWT
	5KjUtdBTh4rOvKsaQRcsr6GyC7PvwgvlwEw3TTSe0fx0Z7Bq5j/VWWHsCM/o7sgpkD1axfqX6FY38
	TBS+NLMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Y66-00000006vFT-0tN2;
	Tue, 17 Mar 2026 17:20:50 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Y5z-00000006vDt-0sSg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 17:20:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 32A7B10D90E;
	Tue, 17 Mar 2026 18:20:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1773768040;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=ER1Wx1cLo48PWOXiIHDwWNLWadUbn+AOiGeXP4sXszM=;
	b=aTN8Yiz9hBMF4UUOfecSjMgGKpOQg0aHaiq5TV18OviysEmB/UfIMUyjcmqtUDXz5D6A/E
	nGDdBoX8T+CpT3lja3J+SQCvPNghVsCzjymc2+n4kJjSH8d4OZJAWZcM45yE0FeySYYEbf
	TbWHPhT+bVQshlQdewle2AMdqY/maZU4e3OSbv/jdnuOPpNsBmAnLRLgUmIkzKSaGlyD8G
	d2no3yitMLOA+eDWgStEKyQoFrxW0LHv1SVcw/LshGyBJMRzdol97OMob+I+Cq1ml2tPub
	55TUfBDxBp0jCklBSNwK1L+tjtlv04hloidZ21C3FYJoa9z6u+xlRz3Vb0Fb0w==
Message-ID: <6ad18fb7-75e8-4ef6-909c-0f2c356fa8ac@nabladev.com>
Date: Tue, 17 Mar 2026 18:20:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction
 reporting via device_caps
To: Rahul Navale <rahulnavale04@gmail.com>,
 Folker Schwesinger <dev@folker-schwesinger.de>
Cc: Rahul Navale <rahul.navale@ifm.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com,
 suraj.gupta2@amd.com, thomas.gessler@brueckmann-gmbh.de,
 radhey.shyam.pandey@amd.com, tomi.valkeinen@ideasonboard.com, marex@denx.de
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
 <20260317104933.4846-1-rahulnavale04@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260317104933.4846-1-rahulnavale04@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_102043_471534_DC8B8147 
X-CRM114-Status: GOOD (  13.20  )
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

On 3/17/26 11:49 AM, Rahul Navale wrote:
> From: Rahul Navale <rahul.navale@ifm.com>
> 
> Hi Folker,
> 
>> Just to double check, and to make sure the regression you're seeing is
>> not a combination of any additional, yet unknown side-effects, could you
>> perform one more test?
>> In dmaengine_pcm_pointer() (the function we just patched), could you
>> replace the call to snd_dmaengine_pcm_pointer() with
>> snd_dmaengine_pcm_pointer_no_residue() while keeping 7e01511443c3 active
>> and test if this fixes your issue or not?
> 
> I have performed the test (replace the call in dmaengine_pcm_pointer()
> function of provided patch) while keeping 7e01511443c3 active.
> I see issue is fixed audio is working with this.
> 
> Hi Marek,
> 
>> I came to the same conclusion, that the residue handling is broken in
>> the xilinx DMA driver for cyclic transfers, and the fix is below, with
>> two extra fixes in top:
> 
> I have tested the provided patches the audio is not fixed with this.
Do you have any other patches applied on the xilinx DMA driver by any 
chance ? If yes, make sure you only test these three.

