Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66B2D1037E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 05:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLvSRiNEkjQwYv9rHqZs7Cd/sAeizIgY1FHze5NDxl8=; b=5BfS4n3SYvG5BbCiwwV1mLFjQ1
	fWfAa1Fq0c/RQmsD93Hv6IvA3LmvnaBKwtOQympDxoRHEBCmhEd8H8x23323dh31k7TVNLNtlNum3
	9UJcqXs85CmmOcTofD6lt8uiSKoJBGKTfcN4ObsdjZfCMVuRPY0Pm28aNCmi8ykhzyOyyV2nn8bED
	xwOOsitqPnsjMma58nrW/mIG92c7Um2Qx9Jo0dxIoHPDmgX7ms1tL4guH/1kH3jNszXBy4iI5Z8YV
	by4sYqvUc55VKCqep0gMGv5lbJf8cdJ+PW7HMj4/ZM4zJtnMMKBsm3QtRc/mIZ6n46zUscC+wPiJu
	OBqc2R3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO86L-0000000EOjN-2dW4;
	Wed, 26 Nov 2025 05:30:01 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO86I-0000000EOiO-3IV9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 05:30:00 +0000
Message-ID: <aef3f079-c81f-4e3e-8484-d02fca793c20@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1764134977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLvSRiNEkjQwYv9rHqZs7Cd/sAeizIgY1FHze5NDxl8=;
	b=F4fk6Ow+XzA9seczvFgSd6MmILJQza2HhxAQ3VCkDklx28lclHX+eKhv6qAjl/min4owss
	fFbK6w/P1CPAE+5t4E5FJSEcaSydWTE/P+XnwIY7WPktFc02fhmJzLD221sXMWBdYDv8Ri
	t/BNEYFnkoOJP2LlcGlGsRBbx3S4AGGefIJkqDSViWHAzqtu+bEIAIzL3NK36eIVZygnFh
	sPIRBp1P/vtRxBnJFnfNMPnftCAEJ2iLhUJm/8aIC+EN+22EqVMAN0aRC6fyZ2ew0ct/QW
	PiPT9FM4oS2UyT4aCbqLxTHt22KT4TCqSeYV+5ar0lgJrl8HDBS7g5lxyIV8fA==
Date: Wed, 26 Nov 2025 02:29:25 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v1] cpuidle: Warn instead of bailing out if target
 residency check fails
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Christian Loehle <christian.loehle@arm.com>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251121010756.6687-1-val@packett.cool>
 <CAJZ5v0h1VTozCKweKvma3dQiUCz8KkR88Hue1cL_jDaKiP+BEw@mail.gmail.com>
 <2808566.mvXUDI8C0e@rafael.j.wysocki>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <2808566.mvXUDI8C0e@rafael.j.wysocki>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_212959_425672_7863A299 
X-CRM114-Status: GOOD (  20.42  )
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


On 11/25/25 1:23 PM, Rafael J. Wysocki wrote:
> On Friday, November 21, 2025 2:10:57 PM CET Rafael J. Wysocki wrote:
>> On Fri, Nov 21, 2025 at 2:08 AM Val Packett <val@packett.cool> wrote:
>>> On Device Tree platforms, the latency and target residency values come
>>> directly from device trees, which are numerous and weren't all written
>>> with cpuidle invariants in mind. For example, qcom/hamoa.dtsi currently
>>> trips this check: exit latency 680000 > residency 600000.
>> So this breaks cpuidle expectations and it doesn't work correctly on
>> the affected platforms.
>>
>>> Instead of harshly rejecting the entire cpuidle driver with a mysterious
>>> error message, print a warning and set the target residency value to be
>>> equal to the exit latency.
>> This generally doesn't work because the new target residency may be
>> greater than the target residency of the next state.
>>
>>> Fixes: 76934e495cdc ("cpuidle: Add sanity check for exit latency and target residency")
>>> Signed-off-by: Val Packett <val@packett.cool>
>>> ---
>>>   drivers/cpuidle/driver.c | 7 +++++--
>>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/cpuidle/driver.c b/drivers/cpuidle/driver.c
>>> index 1c295a93d582..06aeb59c1017 100644
>>> --- a/drivers/cpuidle/driver.c
>>> +++ b/drivers/cpuidle/driver.c
>>> @@ -199,8 +199,11 @@ static int __cpuidle_driver_init(struct cpuidle_driver *drv)
>>>                   * exceed its target residency which is assumed in cpuidle in
>>>                   * multiple places.
>>>                   */
>>> -               if (s->exit_latency_ns > s->target_residency_ns)
>>> -                       return -EINVAL;
>>> +               if (s->exit_latency_ns > s->target_residency_ns) {
>>> +                       pr_warn("cpuidle: state %d: exit latency %lld > residency %lld (fixing)\n",
>>> +                               i, s->exit_latency_ns, s->target_residency_ns);
>>> +                       s->target_residency_ns = s->exit_latency_ns;
>> And you also need to update s->target_residency.
>>
>> Moreover, that needs to be done when all of the target residency and
>> exit latency values have been computed and full sanitization of all
>> the states would need to be done (including the ordering checks), but
>> the kernel has insufficient information to do that (for instance, if
>> the ordering is not as expected, it is not clear how to fix it up).
>> Even the above sanitization is unlikely to result in the intended
>> behavior.
>>
>> So if returning the error code doesn't work, printing a warning is as
>> much as can be done, like in the attached patch.
>>
>> If this works for you, I'll submit it properly later.
>>
> No response, so I assume no objections. [..]

Right, only printing a warning is fine of course.

~val


