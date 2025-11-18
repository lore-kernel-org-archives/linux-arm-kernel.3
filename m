Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4510DCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 07:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gIGnGRcLf8t2W8efWudyJsLJCWbakw7lPbWiXe7B4s=; b=lU6kUtqjD+W5ujW0q8kFaGveNK
	tj5q5x+lD4m0aKhrKdFp+keVo6A3DAljWY23U4zjqqfzRX4zfbElyPU4O32RyN710HZf/RaI0pu69
	56mVTINB3/O9XXtIakyCdtidCpycDNDrhWT6vEcsURSVOAp8o4Xm0jhO3qutqqd1j7liPhdy0CB00
	yCGT5QOOREOF82m/W8M7XW/yd871ogIzdmyJLd23lGRcksPyGuzLLzblpyUMGv47shQg+0Rtyiq44
	ia1A2hubsIoFX0bhKi1bRejzVVYjXrAMBTNyM+frjcUbC6/kv/X+3lKaJo0RLdADJ/+vZGhXQgMb2
	vVdrsm5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLG9h-0000000HZEh-1OjR;
	Tue, 18 Nov 2025 07:29:37 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLG9d-0000000HZE2-3ZIy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 07:29:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5gIGnGRcLf8t2W8efWudyJsLJCWbakw7lPbWiXe7B4s=;
	b=5hcM+WWE3m/Diy8jP98F4LRZXomcwK6Rwve/19aNLAwOJtPnBiwf7JqAEragFLju796XVGh5U
	J5GbyxNPT8QN2DT6zjRY5oMBa/zUZ+eHVVRvzVxzQyIESlMUGGwix955YEmtcivjkvdSHm48BSl
	FDxm5v4gPZiYn5vM+wDHp/w=
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4d9bmW0wRpz1K96c;
	Tue, 18 Nov 2025 15:27:39 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 92B7C1A0188;
	Tue, 18 Nov 2025 15:29:20 +0800 (CST)
Received: from [10.174.178.247] (10.174.178.247) by
 dggpemf500002.china.huawei.com (7.185.36.57) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 18 Nov 2025 15:29:19 +0800
Subject: Re: [PATCH v4] ACPI: AGDI: Add interrupt signaling mode support
To: Will Deacon <will@kernel.org>, Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
CC: Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla
	<sudeep.holla@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown
	<lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Ilkka
 Koskinen <ilkka@os.amperecomputing.com>, Catalin Marinas
	<catalin.marinas@arm.com>
References: <20251017073935.1746365-1-fj1078ii@aa.jp.fujitsu.com>
 <a93e845a-b084-a680-7158-68363c492b75@huawei.com>
 <aQokdBkjFqw9ZGRt@willie-the-truck>
From: Hanjun Guo <guohanjun@huawei.com>
Message-ID: <6b14156b-9734-f0e0-5954-57cc76576a37@huawei.com>
Date: Tue, 18 Nov 2025 15:29:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <aQokdBkjFqw9ZGRt@willie-the-truck>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.247]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500002.china.huawei.com (7.185.36.57)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_232934_435862_BF1D11AD 
X-CRM114-Status: GOOD (  17.63  )
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

On 2025/11/5 0:06, Will Deacon wrote:
> On Mon, Oct 20, 2025 at 09:23:05PM +0800, Hanjun Guo wrote:
>> On 2025/10/17 15:39, Kazuhiro Abe wrote:
>>> AGDI has two types of signaling modes: SDEI and interrupt.
>>> Currently, the AGDI driver only supports SDEI.
>>> Therefore, add support for interrupt signaling mode
>>> The interrupt vector is retrieved from the AGDI table, and call panic
>>> function when an interrupt occurs.
>>>
>>> Reviewed-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
>>> Signed-off-by: Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
>>> ---
>>> Hanjun, I have addressed all your comments.
>>> Please review them.
>>>
>>> v3->v4
>>>    - Add a comment to the flags member.
>>>    - Fix agdi_interrupt_probe.
>>>    - Fix agdi_interrupt_remove.
>>>    - Add space in struct initializsation.
>>>    - Delete curly braces.
>>
>> Looks good to me,
>>
>> Acked-by: Hanjun Guo <guohanjun@huawei.com>
> 
> I wasn't cc'd on the original patch but I couldn't figure out why it
> uses IRQF_NO_AUTOEN when requesting the irq given that the first thing
> it does is enable it.

Sorry for the late reply, seems this comment was addressed.

But when I go back to read the latest AGDI spec [0], I see
the signaling mode can be SDEI *and* interrupt:

Flags node structures 1 36 Bits [1:0]: Signaling mode:

2: Both SDEI and Interrupt-based signaling is
supported. While an SDEI event handler is
registered, the platform is allowed to not
generate the wired interrupt

So which means we need to support both SDEI and interrupt when the
signaling mode is 2, but for now, the code is

+	if (agdi_table->flags & ACPI_AGDI_SIGNALING_MODE)
+		pdata.gsiv = agdi_table->gsiv;
+	else
+		pdata.sdei_event = agdi_table->sdei_event;

Kazuhiro, could you take a look again?

Thanks
Hanjun

[0]: https://developer.arm.com/documentation/den0093/latest/

