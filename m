Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F8DD33990
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D3bF9x7z/HKVeULnvK39CxKMPBZQYpledzb2ErpX2ys=; b=sgFllSA2k99/fExb2kkyC95XPd
	6OQzl/pi7TqrmKxZCXz90hMyFSBtOhisYgLuA/fpFora3KmROi7CqfyadFSR7SRgwHO3tMgUO8Smr
	zNTKfWUPt4e2eKW3/w+WulMBvbMFv+ne4QtDbb2oNrQ9jiTa/g2mp4ofYSbuUPh6rMG+woSSspDmM
	xRd0Nlq28aA/+37cHH1Q78Be52ednhSP1BivTNVB8WBjJsKksNVFk4DxeJzLWBxIAtXkVabGcVlZL
	b7SY88tmjTV8FpU8ETbxvzyJvtRzetFzejblRiYAIAWZAciqVMhOOZghvMCm9bDuZxI9rRG7HU4yr
	eYeBezpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Roh-0000000BL1Z-1hnY;
	Mon, 28 Oct 2024 15:38:03 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RI1-0000000BEo9-1D1x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:04:19 +0000
Received: from [192.168.88.20] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 538C543;
	Mon, 28 Oct 2024 16:04:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730127854;
	bh=2Lcr1QBtlLAP2/LIKLk4wPL8X/G0dPlaRTNHfXBItBc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tOaWGvD9AJO2ZxBnsYJ2lCXaS/PychLABXC2Q3g9RoP5Gu2BHdH23AX67SdeHWL4v
	 dXS7+aGOprzooBPKjHZiX3I3Bvpu+cCidTaUJ+A+PP0biV77KfO6tsD1S2/oFwybFM
	 jP3YWnxDedzq50LcLsiMyBhDqBOQc/G5PiRe7nSU=
Message-ID: <20cf573c-d05f-444c-9463-f342a750f6cb@ideasonboard.com>
Date: Mon, 28 Oct 2024 17:04:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/8] drm: zynqmp_dp: IRQ cleanups and debugfs support
To: Sean Anderson <sean.anderson@linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 David Airlie <airlied@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Sagar, Vishal" <vishal.sagar@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org
References: <20240809193600.3360015-1-sean.anderson@linux.dev>
 <5e9769dd-459a-4ff3-aebb-bb7057192733@linux.dev>
 <a023bd66-8f42-4f27-9aa2-5097b2574562@ideasonboard.com>
 <e959a01f-b466-4076-8219-a6c83a7194c0@linux.dev>
 <07766e5e-6009-4b8e-8a50-30ba0fe763f5@linux.dev>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <07766e5e-6009-4b8e-8a50-30ba0fe763f5@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_080417_511157_F0B602C8 
X-CRM114-Status: GOOD (  27.09  )
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

Hi,

On 25/10/2024 17:58, Sean Anderson wrote:
> Hi Tomi,
> 
> On 10/3/24 10:53, Sean Anderson wrote:
>> On 10/2/24 10:50, Tomi Valkeinen wrote:
>>> Hi,
>>>
>>> On 01/10/2024 21:31, Sean Anderson wrote:
>>>> On 8/9/24 15:35, Sean Anderson wrote:
>>>>> This series cleans up the zyqnmp_dp IRQ and locking situation. Once
>>>>> that's done, it adds debugfs support. The intent is to enable compliance
>>>>> testing or to help debug signal-integrity issues.
>>>
>>> I think the patches 1-7 look fine, and I think I can pick those already to drm-misc if you're ok with that.
>>>
>>> I'm a bit unsure about patch 8, probably mainly because I don't have experience with the compliance testing.
>>>
>>> How have you tested this? With some DP analyzer/tester, I presume?
>>
>> For my test setup I used an oscilloscope hooked up to the displayport
>> output using a fixture that broke the signals out to SMA. Since the
>> oscilloscope cannot emulate a sink, I first had the output connected to
>> a monitor. Then I disabled HPD and reconnected the output to my fixture.
>> This process is described in more detail in the documentation.
>>
>>> I think none of this (patch 8) is needed by almost anybody.
>>
>> Well, I found it very useful for debugging a signal integrity issue I
>> was having. Once I could have a look at the signals it was very clear
>> what the problem was.
>>
>>> Even among zynqmp_dp developers I assume it's very rare to have the
>>> hardware for this. I wonder if it would make sense to have the debugfs
>>> and related code behind a compile option (which would be nice as the
>>> code wouldn't even compiled in), or maybe a module parameter (which
>>> would be nice as then "anyone" can easily enable it for compliance
>>> testing). What do you think?
>>
>> Other drivers with these features just enabled it unconditionally, so I
>> didn't bother with any special config.
>>
>>> I also somehow recall that there was some discussion earlier about
>>> how/if other drivers support compliance testing. But I can't find the
>>> discussion. Do you remember if there was such discussion, and what was
>>> the conclusion? With a quick look, everything in the debugfs looks
>>> generic, not xilinx specific.
>>
>> The last it got discussed was back in [1], but I never got any further
>> response. I agree that some of this is generic, and could probably be
>> reworked into some internal helpers. But I don't have the bandwidth at
>> the moment to do that work.
>>
>> --Sean
>>
>> [1] http://lore.kernel.org/dri-devel/cda22b0c-8d7c-4ce2-9a7c-3b5ab540fa1f@linux.dev
> 
> Does this all make sense to you? At the moment I don't believe I have any
> changes I need to resend for (although this series is archived in patchwork [1]
> for some reason).
> 
> --Sean
> 
> [1] https://patchwork.kernel.org/project/dri-devel/list/?series=878338&archive=both

I was hoping to get tested-by from amd, as I can't test this properly, 
but it's probably pointless to wait.

The biggest hesitation I have is what I mentioned earlier: this adds a 
lot of code which is not for normal use. It would be nice to split this 
into a separate file, maybe behind a compile option, but I fear that'll 
require a more restructuring of the driver.

So, I think it's fine, I'll apply this tomorrow.

  Tomi


