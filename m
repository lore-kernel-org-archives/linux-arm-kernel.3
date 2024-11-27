Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F21D6ACE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 15:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DX3H+a44kQ13gTw3hzeF4XJrHuDL47mesPKbbKCQO8=; b=kBaNaiG1F4lCi0jJ/vG6PQXYQJ
	CrJnlZ/zSWI9FcQ0l/ZcBy4okDRuubqgRr8yq13LXXrl//vB/7E9HiPVuBDqqIDpYaHoVyPPUeD3f
	cT7n+qWBJyNdbcoWJNf+B8CrzcxIVhmNnVewVX+7KHD0bbUU120AH+/vv1Z6VZLtYj6Rs4jifG+5D
	gGiqdoJKT6nwohZBw0+zi/3nYNlyFHuDFOsIj7UskSood6eYMCScxPc/ReMkpQYTB5T6kfdeRiijO
	RtJJGHuIdCxRBeFA5alh4ErMpWXgkjFl8LX4WPfcXBoyQ5mNYvz2GhQgJ3tpDy7LcUCoUf1+z8egz
	VJuOCS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJWT-0000000DQvo-4A7w;
	Wed, 27 Nov 2024 15:00:09 +0000
Received: from smtp-fw-52002.amazon.com ([52.119.213.150])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJVU-0000000DQoe-43EB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 14:59:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1732719548; x=1764255548;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2DX3H+a44kQ13gTw3hzeF4XJrHuDL47mesPKbbKCQO8=;
  b=hnKRcQdTiISbzqz2T6gmdx2yTN6a/Bw0i3EiUcQl+e26EMI4ervAaWL7
   dKRwP2YicihhciB0hsNfS5ylDV6ss6EtC2vhEAoYikP8XBvDy/BbpDin9
   yZb5pkqtuZP7ocsCF/pD1Vlvizwipn0NPecZt5vFSYtT4xnIovATDK16a
   E=;
X-IronPort-AV: E=Sophos;i="6.12,189,1728950400"; 
   d="scan'208";a="677169741"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.124.125.6])
  by smtp-border-fw-52002.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 14:59:02 +0000
Received: from EX19MTAEUC001.ant.amazon.com [10.0.10.100:60970]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.26.13:2525] with esmtp (Farcaster)
 id e0021fdb-2735-4534-9e9c-863282448e48; Wed, 27 Nov 2024 14:59:01 +0000 (UTC)
X-Farcaster-Flow-ID: e0021fdb-2735-4534-9e9c-863282448e48
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUC001.ant.amazon.com (10.252.51.155) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 27 Nov 2024 14:59:01 +0000
Received: from [192.168.90.101] (10.85.143.173) by
 EX19D018EUA004.ant.amazon.com (10.252.50.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 27 Nov 2024 14:58:57 +0000
Message-ID: <7846b08f-5bdb-448b-9c56-73d9f16a839b@amazon.com>
Date: Wed, 27 Nov 2024 16:58:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: kexec: Check if IRQ is already masked before
 masking
To: Marc Zyngier <maz@kernel.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <akpm@linux-foundation.org>,
	<bhe@redhat.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <jonnyc@amazon.com>
References: <20241126050509.4426-1-farbere@amazon.com>
 <86cyihvopl.wl-maz@kernel.org>
Content-Language: en-US
From: "Farber, Eliav" <farbere@amazon.com>
In-Reply-To: <86cyihvopl.wl-maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.85.143.173]
X-ClientProxiedBy: EX19D042UWB003.ant.amazon.com (10.13.139.135) To
 EX19D018EUA004.ant.amazon.com (10.252.50.85)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_065909_320816_B7B759AA 
X-CRM114-Status: GOOD (  11.68  )
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

> Maybe a slightly better approach would be to simplify this code for
> something that actually uses the kernel infrastructure:
>
> diff --git a/arch/arm64/kernel/machine_kexec.c b/arch/arm64/kernel/machine_kexec.c
> index 82e2203d86a31..9b48d952df3ec 100644
> --- a/arch/arm64/kernel/machine_kexec.c
> +++ b/arch/arm64/kernel/machine_kexec.c
> @@ -230,11 +230,8 @@ static void machine_kexec_mask_interrupts(void)
>                      chip->irq_eoi)
>                          chip->irq_eoi(&desc->irq_data);
>
> -               if (chip->irq_mask)
> -                       chip->irq_mask(&desc->irq_data);
> -
> -               if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
> -                       chip->irq_disable(&desc->irq_data);
> +               irq_set_status_flags(i, IRQ_DISABLE_UNLAZY);
> +               irq_disable(desc);
>          }
>   }
>
> This is of course untested.

I tested your suggested approach and it works.
I will upload V2 for this change.

Thanks, Eliav


