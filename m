Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217BAD711D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 02:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vyFT/a7VVmRu5wK/85XX5PVdapzo0oqwsu91Q17iKg=; b=G4AxoKtEW/UIujS+fAP7mt5ZKL
	gV7aPWxH9saob7aZBFtVDJGFO054aDFYapisvVJDdoKUw8Qkw5Gp5cEMJ8ug3fOIgVqirwgMQZJJY
	5c0va+1Z91uLkiJGsnHi0wJHk4H1xm5sGaNQbiGNUyajFQlszUZHxPFU16pDmr0YmhSl6PXUj6cpx
	Dv3aYYPTy20oqBBLDEcJF7rT2JlhlZivM3K1c9ETw5JH0dnYUFavqZlfn+ny/RWwBRU3Tp9QRlhSh
	ybCN4vMaz8iqyRAf+6B0hWfjzkib6pKxKQxqrlsKurhyLAwJxVgq0EPdLVJQ0nZAyB4rRsQAJuAmV
	rrIyTZFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWQPc-00000009VQV-4AAb;
	Fri, 19 Dec 2025 02:40:13 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWQPa-00000009VPU-2wSP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 02:40:12 +0000
Received: from localhost.localdomain (unknown [202.112.113.212])
	by APP-03 (Coremail) with SMTP id rQCowAAHKeD1ukRpAMAsAQ--.24254S2;
	Fri, 19 Dec 2025 10:40:03 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: jie.gan@oss.qualcomm.com,
	leo.yan@arm.com,
	james.clark@linaro.org
Cc: akpm@linux-foundation.org,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	make24@iscas.ac.cn,
	mathieu.poirier@linaro.org,
	mike.leach@linaro.org,
	stable@vger.kernel.org,
	suzuki.poulose@arm.com
Subject: Re: [PATCH v2 RESEND] coresight: etm-perf: Fix reference count leak in etm_setup_aux
Date: Fri, 19 Dec 2025 10:39:49 +0800
Message-Id: <20251219023949.12699-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <f85c7d37-4980-46f0-9136-353a35a8f0ed@oss.qualcomm.com>
References: <f85c7d37-4980-46f0-9136-353a35a8f0ed@oss.qualcomm.com>
X-CM-TRANSID: rQCowAAHKeD1ukRpAMAsAQ--.24254S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF1xCrykZF4kAF17XrykGrg_yoW5XrWrpr
	WUGay5trWDGF10k392qw15Z3yI93ySyrsagr4fGrnxuw1Yqr9IvryjqrWF9Fn3CrWkJr10
	qw12qayxZFWUXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUB214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOmhFUUUUU
X-Originating-IP: [202.112.113.212]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_184011_108846_68DAC75D 
X-CRM114-Status: GOOD (  19.57  )
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

On 12/15/2025 10:09 AM, Jie Gan wrote:
> On 12/15/2025 5:51 PM, Leo Yan wrote:
>> On Mon, Dec 15, 2025 at 11:02:08AM +0200, James Clark wrote:
>>>
>>>
>>> On 15/12/2025 04:27, Ma Ke wrote:
>>>> In etm_setup_aux(), when a user sink is obtained via
>>>> coresight_get_sink_by_id(), it increments the reference count of the
>>>> sink device. However, if the sink is used in path building, the path
>>>> holds a reference, but the initial reference from
>>>> coresight_get_sink_by_id() is not released, causing a reference count
>>>> leak. We should release the initial reference after the path is built.
>>>>
>>>> Found by code review.
>>>>
>>>> Cc: stable@vger.kernel.org
>>>> Fixes: 0e6c20517596 ("coresight: etm-perf: Allow an event to use different sinks")
>>>> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
>>>> ---
>>>> Changes in v2:
>>>> - modified the patch as suggestions.
>>>
>>> I think Leo's comment on the previous v2 is still unaddressed. But releasing
>>> it in coresight_get_sink_by_id() would make it consistent with
>>> coresight_find_csdev_by_fwnode() and prevent further mistakes.
>> 
>> The point is the coresight core layer uses coresight_grab_device() to
>> increase the device's refcnt.  This is why we don't need to grab a
>> device when setup AUX.
>
> That make sense. We dont need to hold the refcnt for a while and it 
> should be released immediately after locating the required device.
>
> Thanks,
> Jie

>> 
>>> It also leads me to see that users of coresight_find_device_by_fwnode()
>>> should also release it, but only one out of two appears to.
>> 
>> Good finding!
>> 
>> Thanks,
>> Leo
>> 
Hi all,

Thank you for the insightful discussion. I've carefully read the 
feedback from Leo, James, and Jie, and now have a clear understanding 
of the reference count management.

The core issue: coresight_get_sink_by_id() internally calls 
bus_find_device(), which increases reference count via get_device().

From the discussion, I note two possible fix directions:

1. Release the initial reference in etm_setup_aux() (current v2 patch)
2. Modify the behavior of coresight_get_sink_by_id() itself so it 
doesn't increase the reference count. 

Leo mentioned referencing how acpi_dev_present() does it, and James 
also pointed out that APIs should be consistent. I think it makes 
sense that following the principle like "lookup doesn't hold a 
reference" could prevent similar leaks in the future.

To ensure the correctness of the v3 patch, I'd like to confirm which 
patch is preferred. If option 2 is the consensus, I'm happy to modify 
the implementation of coresight_get_sink_by_id() as suggested.

Looking forward to your further guidance.

Thanks!


