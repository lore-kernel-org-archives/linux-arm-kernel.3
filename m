Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D113F327D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 17:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmtPtPbnl4AV5j+ij+q4DGBojJ4/yQwbp4U1xRsU4aQ=; b=Fj4NUE9wypOifh9QbPqHpsHcab
	L9/e04THGhOMCPIs2RARKQyTYkO/i34S+hImHNyaL/LCeA4Y3PKv04Fn0vvj1YuYj+fOvautiHC3q
	YfNK4+OgEXAvS8LfFCawDhCQdK6peCOvwsJdYZN8XzXf+m6QYrmc0jg6lVWJVfmCVEu8VYhB1lEQ7
	Xr8DrUycsULFxxobDdjPa2icXm6aoECW0xNr6rwxgWQzKPEtxUBCX+oxpTss/4aEQomBo/oWe8zcu
	cvZDQMO/5BmTfycKWWQ0edFk3ju8rHuTjr6dwnTpEoamORkIJxIQG4jOf6Ubh1quoddynnhD06hK3
	nngFh2aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFExj-00000008yOA-1frR;
	Tue, 21 Apr 2026 17:32:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFExg-00000008yNK-3yVS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 17:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776792756;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UmtPtPbnl4AV5j+ij+q4DGBojJ4/yQwbp4U1xRsU4aQ=;
	b=h0YUd/O8xPulR4Z9xjURbJbH4Y5TNfk0SJZMHApM2RlGN1brllARQH2oU0mWVC6tPE76Y4
	pftUU4QdqQ4BDj0+uJZ3703MK5VG56qHfdE3pCopACSfX3zLGC/9sVgEuOoFj409e24aiM
	PzUAR5Xp44Oj4DwiVnOsWgH0XoaA1t4=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263--G06BvQoNveKzC1iQTK5lg-1; Tue, 21 Apr 2026 13:32:34 -0400
X-MC-Unique: -G06BvQoNveKzC1iQTK5lg-1
X-Mimecast-MFC-AGG-ID: -G06BvQoNveKzC1iQTK5lg_1776792753
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b249975139so83295265ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 10:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776792753; x=1777397553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmtPtPbnl4AV5j+ij+q4DGBojJ4/yQwbp4U1xRsU4aQ=;
        b=envV+wyh3qAMbpJ19N7nSNr5lnFO0weWKHRrRtW0Wg0jV2Cydsz2BV91jK0ILpDaOx
         c3XQX49HMvAMy8BvwvEqH5huGe2cE9AQJC8GIC4nKUPdDnfWqZQZtPEpkq1vnd+T2k3E
         b9sL3TL/vJBF86/NnrWuT0rQ4Bi8v9p2JXP2MJOxzylhrUt0//xTp1HHc9gtdOz+JpoZ
         1LTE4pU0P82/30oiQZ8Qkb8KcfGBP5g0JTN4jwCWP8eFfAgCYl4JfI/mQ3eLZO7JRJP2
         f4UoHuhiJyDc5EZyPjMGKOo80It2t6puevFeaDIqEXCDPVxXzEXYkPxozF+Ugf42zB1Z
         0IJg==
X-Forwarded-Encrypted: i=1; AFNElJ8rKXwuJsaO4kNruFAmMdLpMr9ZO+Da0LdK6kociA8S8XBdcnLAZY1Fhl5XQIyZK8dUgwl/YZJM4yhhY6YlhaTT@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr0JaPTJbAjVfZpNk2J8Fm0NiXdKigyS07MHZIeBE1CkkfQ6rf
	Nsb7yjj7pKW5/8uD3red9p5dQfHA8+n8WCd+grlxpu96B0bhkBxj6g7vDMIemNIDbUmF/3QjIcY
	MMWMRmPCeeuwlKU0zn5W75FrXy6AFgBUY89GUHmRu53vJPp9eGvold9GzQ4NLtY8p69g5pSn5qa
	Ty
X-Gm-Gg: AeBDiev1EImzbBw71F3iiM4ZDO0jLzqQ+Ju8ciq8cO0JXoRs7mdKtq4fST7Z1EAq9o9
	267kLc8YeZ+L8U0PGAqeWsuVYSbwj+46ZCPILs2C8LX3WcDyiQgm5igeBjQJyWQwJZaAKSHWcqk
	AgznN0hdTHzZ4zTGFCr+43HlP5UTCc6Qcunc+a4s/Xvw/TrXQq7jYYQsrC7nLJ+ZPLQI47ov1uM
	12eAVh9Hx/77qhvk5UuSJPmZEDMwTWOKZTVXzRmkjvdbj02EoAzVMjPNlMCqsAyiz0J1oGM4FGS
	ZUpfQz3hQGD2H4aiSA3HYRqTYhXMpMWUX/SZmu6L6QKW3bkxOwFahW4N1/yOU//GMJQfHgqr7K+
	2AFPnPTaQPE6P0bL6PRv5Wp9mQOY27omQE1gJdWBzdR8EhHBoaQUuWLF0aOjVn1Nt7k0=
X-Received: by 2002:a17:903:b4f:b0:2b2:ae89:fd44 with SMTP id d9443c01a7336-2b5f9eaf3d6mr212359735ad.6.1776792753287;
        Tue, 21 Apr 2026 10:32:33 -0700 (PDT)
X-Received: by 2002:a17:903:b4f:b0:2b2:ae89:fd44 with SMTP id d9443c01a7336-2b5f9eaf3d6mr212359275ad.6.1776792752543;
        Tue, 21 Apr 2026 10:32:32 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.104])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff3bfsm175412135ad.7.2026.04.21.10.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 10:32:31 -0700 (PDT)
Message-ID: <b9d1e3b6-ad3c-4bdc-98aa-2e00a2937585@redhat.com>
Date: Tue, 21 Apr 2026 19:32:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 2/2] net: airoha: Add missing bits in
 airoha_qdma_cleanup_tx_queue()
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-0-e04bcc2c9642@kernel.org>
 <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-2-e04bcc2c9642@kernel.org>
 <210f5d0b-6232-4c0f-adff-3a97d54159b3@redhat.com>
 <aeewoVjN7EHLZTW_@lore-desk>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <aeewoVjN7EHLZTW_@lore-desk>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nQ_eX1thgJUotfDm0rUPWxvvD2r-OKVw-iVflnXW1mo_1776792753
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_103237_081452_1B328DC8 
X-CRM114-Status: GOOD (  20.81  )
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

On 4/21/26 7:15 PM, Lorenzo Bianconi wrote:
>> On 4/17/26 8:36 AM, Lorenzo Bianconi wrote:
>>> @@ -1055,8 +1058,33 @@ static void airoha_qdma_cleanup_tx_queue(struct airoha_queue *q)
>>>  		e->dma_addr = 0;
>>>  		e->skb = NULL;
>>>  		list_add_tail(&e->list, &q->tx_list);
>>> +
>>> +		/* Reset DMA descriptor */
>>> +		WRITE_ONCE(desc->ctrl, 0);
>>> +		WRITE_ONCE(desc->addr, 0);
>>> +		WRITE_ONCE(desc->data, 0);
>>> +		WRITE_ONCE(desc->msg0, 0);
>>> +		WRITE_ONCE(desc->msg1, 0);
>>> +		WRITE_ONCE(desc->msg2, 0);
>>
>> Sashiko has some complains on this patch that look legit to me.
>>
>> Also the pre-existing issues mentioned WRT patch 1/2 makes such patch
>> IMHO almost ineffective, I think you should address them in the same series.
>>
>> Note that you should have commented on sashiko review on the ML, it
>> would have saved a significant amount of time on us.
> 
> Since this series is marked as 'Changes Requested', it is not clear to me what
> next steps are. I guess we have two possible approach here:
> 
> 1) - Post patch 1/2 ("net: airoha: Move ndesc initialization at
>      end of airoha_qdma_init_tx()") with the series available upstream
>      (not merged yet) in [0] where I am fixing similar issues for
>      airoha_qdma_init_rx_queue() and airoha_qdma_tx_irq_init().
>    - Post patch 2/2 ("net: airoha: Add missing bits in
>      airoha_qdma_cleanup_tx_queue()") with a fix for airoha_ndo_stop() waiting
>      for TX/RX DMA engine to complete before running
>      airoha_qdma_cleanup_tx_queue().
> 
> 2) - Since all the issues rised by Sashiko are not strictly related to this
>      series and they are already fixed in pending patches, just apply the fixes
>      separately without the needs to repost this series.

Given the current flood on the ML I think option 2 could be the better.
Note that the tree is currently in Jakub's hands and he can very legitly
disagree.

/P


