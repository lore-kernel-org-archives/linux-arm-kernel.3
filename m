Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05609EA854A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 02:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X/qAWoaZQqfb6mtpn3RUbhKRNiQ6ePUEK1WQXiHHbIU=; b=hOu7WL6BeGKnjdbWIsPsQ2hI0v
	fDwKQaJK1nYigiX4I1vHRPmPhGLU235yioG5MfS1PbkkUv/PZx0eVRMNCeJxloaON9b4gVuTKB52F
	DAsdax/8Ov8HTVvCQHW8a2hp4cO85HIr6AYTlQeNAQI0LtstQVq0/Na1UzDCHB9W26vtlUOIbM/ld
	U692BdGv6kGQsTd0Oy6MSMNhdoM3L+us3Sv6dBob22fHWnK2SAvtSJochauuWHNdmG4nu93teLBoE
	CSCU8KPtiQWjB03heqC7dqtkCctg5Ivw/nn33MOYdtolb05GoJ/i16SanquC6MVOEFoMcYb+TorbX
	pxzrM5gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzQFE-00000006Y4y-39N9;
	Mon, 09 Mar 2026 02:21:20 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzQFA-00000006Y3R-3RUB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 02:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=X/qAWoaZQqfb6mtpn3RUbhKRNiQ6ePUEK1WQXiHHbIU=;
	b=NadfPqtz8oMWrUpzwmHqTpokdiv1d47DKAMKLBDP6WE9yRx0GDycuB2GWUuo8Z
	z1dGYXltA4A+rdof6bquGxHhi05pA1P0etHRAvUKSUguBgjGCHi+CqJSwu7L76eW
	rNFhMBzmd+bilj7sCTCe4k7dJgh1zymw5MRpG9dRYjses=
Received: from [192.168.50.71] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgAnya99Lq5ptIx5Rg--.66S2;
	Mon, 09 Mar 2026 10:20:48 +0800 (CST)
Message-ID: <5507e0c8-9733-47e1-bd8e-a335d39ad5ce@163.com>
Date: Mon, 9 Mar 2026 10:20:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: scmi: Fix of_node use-after-free in
 scmi_dev_used_by_cpus()
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: sudeep.holla@kernel.org, rafael@kernel.org, cristian.marussi@arm.com,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260302155348.26374-1-18255117159@163.com>
 <4lbgs3xszh75i4nucdhkbi2j33xvu6y3qfkilrshswbn73kpo4@kp36dhmrpogk>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <4lbgs3xszh75i4nucdhkbi2j33xvu6y3qfkilrshswbn73kpo4@kp36dhmrpogk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: PygvCgAnya99Lq5ptIx5Rg--.66S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKw47WFy3tF4DuF4fZrykAFb_yoW3uFcEgF
	WkK39xuw1UGF1IkwsxKFW3AwsrKFW5Z3y2vw1kJF4fX34fZFW3ZFWkZ3yaq3yxXw4vqrnx
	CryYqF4ayryxZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRic_-tUUUUU==
X-Originating-IP: [140.206.53.66]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxACxVWmuLoCodAAA3V
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_192117_909321_B5326A99 
X-CRM114-Status: GOOD (  10.30  )
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



On 3/3/26 12:20, Viresh Kumar wrote:
> On 02-03-26, 23:53, Hans Zhang wrote:
>> In scmi_dev_used_by_cpus(), the code previously released the of_node
>> reference via of_node_put(np) before checking whether np equals scmi_np.
>> This could lead to a use-after-free if the node pointer was accessed
>> after being freed. Reorder the logic to perform the comparison first
>> and only put the node after the check, or immediately return if they
>> match. This ensures safe reference counting and avoids potential kernel
>> crashes.
> 
> It shouldn't lead to a use-after-free problem as we aren't using the `np` for
> anything apart from simple comparison of value.
> 

Hi Viresh,

Thank you very much for your reply. Then, do you think this patch is 
necessary? Or should I revise the commit message?

Best regards,
Hans





