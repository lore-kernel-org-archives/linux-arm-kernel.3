Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B264C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 01:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kr9XR1CvnQWLyEr1dZjA2EdfuQi+TOXBVnkraFi7+d0=; b=3LTzQz4WFLPZred6CQiCqMERBt
	ch8JG0a+9sejA6Q49dBxMdwcpbZw3b63yDcIopv9GJE8qCM6GU49EtIwQtLLoOfxjqj/8C0ZqZENm
	XmrJRCr4Nx20oGCg7af3r60DCF39uAg2yaiz5ukS4c0jlfbU80Y/h4ZuP1TA8sKxlKbrk7A0dFb1C
	FGt0s8RrXfE0eEKJ6FHf9HGUWOfq6MiSUvneciI7LuTMhY16npC+QPc20/4iN7B0HfX7cJ9JytEUp
	i1l/ezixyS8XUy8eLzKVyxNGEn/ehp/9HSD1Ye+LwEtDrgFN7EG7wYjJLEg9hrSufQV9t1oZ8/i+0
	levVxinQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NJ0-0000000D8hN-17El;
	Fri, 18 Sep 2026 01:22:22 +0000
Received: from mail-m1602365261.xmail.ntesmail.com ([160.236.52.61])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NIx-0000000D8dx-0b1O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 01:22:21 +0000
Received: from [127.0.0.1] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4e34b9923;
	Fri, 18 Sep 2026 09:22:05 +0800 (GMT+08:00)
Message-ID: <11cdc24a-962a-4f44-b91c-445c2ac80c02@rock-chips.com>
Date: Fri, 18 Sep 2026 09:21:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG?] Possible scheduler bug on Rock 5B RK3588 on 7.2.5
To: No SPAM here <nospam@gdead.co.uk>
References: <f15f8166-c1e4-45dc-9ddd-4ec887e415eb@gdead.co.uk>
 <d6232ccc-9876-435f-bea8-43cd169dd185@rock-chips.com>
 <BxAg81spRPHPsVOcNI5jR9tsii3Wi5a_k_BYW6owu3n6D3jn4N6dbkksomSb82KFdp8nT-mY4cyiZzDFHCqtuskOIYxZwBOzAvyYVRy18KQ=@gdead.co.uk>
 <e045dc5b-5b03-4840-ade9-2c8f98c8c885@rock-chips.com>
 <iENNazJ40aK7PPjVcvf8KUzlTm4HMyT85UPc2ez-MfyeJjE2HWX1ujGXIA3BGRwegyOJEZQ86kV7UElMjyBc6V5uCkGyK4NRCdw74ZfJwI8=@gdead.co.uk>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <iENNazJ40aK7PPjVcvf8KUzlTm4HMyT85UPc2ez-MfyeJjE2HWX1ujGXIA3BGRwegyOJEZQ86kV7UElMjyBc6V5uCkGyK4NRCdw74ZfJwI8=@gdead.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa0b21b3f3603a7kunm35fe1041e5f2a7
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTR9KVklJGBpITU8aGB0dH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=UhtFZuOwM0OJ1b2kxJxm7PAqOq0tQqJBE3+mA7cIWzyIYHG1ztkAzBwtR6UCDNhev6HXkKveXq6GBvJfkFHBsts2jOVIvOGCdoxv7lXcONtWegGct6Yv2BygtlbWU7MNSzJH03q+3vHn5XJ04VV0vEUfC/vpcNnHypJ5gi5Z6G0=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=Kr9XR1CvnQWLyEr1dZjA2EdfuQi+TOXBVnkraFi7+d0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_182219_751382_62947FD3 
X-CRM114-Status: GOOD (  11.65  )
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

On 9/18/2026 3:15 AM, No SPAM here wrote:
> Hi
> 
> On Thursday, 17 September 2026 at 03:37, Chaoyi Chen <chaoyi.chen@rock-chips.com> wrote:
> 
>> Hello Trevor,
>>
>> On 9/17/2026 9:21 AM, No SPAM here wrote:
>>>> Would you mind trying to disable `CONFIG_SCHED_CLUSTER` and checking whether
>>>> the problem still reproduces?
> 
> trevor@rock-5b:~$ uname -a
> Linux rock-5b 6.18.52-current-rockchip64 #1 SMP PREEMPT Mon Sep 14 11:36:19 UTC 2026 aarch64 GNU/Linux
> trevor@rock-5b:~$ grep CONFIG_SCHED_CLU /boot/config-6.18.52-current-rockchip64 
> # CONFIG_SCHED_CLUSTER is not set
> trevor@rock-5b:~$ sar | tail -5
> 
> 18:50:15        CPU     %user     %nice   %system   %iowait    %steal     %idle
> 19:00:15        all     99.89      0.00      0.11      0.00      0.00      0.00
> 19:10:15        all     99.89      0.00      0.11      0.00      0.00      0.00
> Average:        all     99.89      0.00      0.11      0.00      0.00      0.00
> 
> Been running stress --cpu 8 since 18:47 and so far it is using all 8 cores at 100%. It would normally have shown the 7/8ths problem after 20s or so, maybe 2 or 3 minutes at max. So I'd say this setting is definitely involved.
> 

Thank you very much for testing. I'm not a scheduler expert, but I see 
that CONFIG_SCHED_CLUSTER is enabled by default on arm64 [0]. 

Peter is the maintainer and author of this series. 
@Peter, do you have any further insights? Thank you!

This thread background is here[1].

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7bd291abe2da09f59dca81f35a4ec220e5e138a2
[1]: https://lore.kernel.org/all/f15f8166-c1e4-45dc-9ddd-4ec887e415eb@gdead.co.uk/

-- 
Best, 
Chaoyi

