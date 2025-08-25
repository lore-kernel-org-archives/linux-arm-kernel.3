Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FCACA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 14:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViX4cex+pfIncuiAWDsLr2F0mTnxItz2ZodPtLpImR8=; b=Pnyk0s1x/VrnZfBSLRV2pWtkGB
	Et7nY3mn0HFU7+lc1vhUC+qNFHpNxL3uQTCQq1YY+O/3dcgOkl1DWqYLini4tLkPJEHlr5AUMZLdr
	PK4a4OS+C61RXTF80bvhWw2lnXYHcDRg4cOUDkvlxbGasj5Kngtmx+zXcTm+LWlG4iSvakzS2kc3v
	sr9uxy9Wsrpu5fD2iicm6dNh2W8Rugi+C0JhFVqzO0R2vjZnenVOu2MxzXupjPr5uq0GUBNwlvirH
	ftN9eBpCY0FruW7Ei+Ys9igttF2wn0MTANHZWyaEDz//PSMnkhC8GBHqM1/MkkF4EKQs5WeHtlYPP
	nJK5rrNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYeu-00000008L7O-30cn;
	Mon, 25 Aug 2025 14:58:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWPm-00000007vzN-0Px9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 12:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756125310; x=1787661310;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tOXezuRT38nCFJ4em80jfntzWPyfyswX+moPxT5fkw8=;
  b=vDiV2HJQYc5Oj1yfHfPaoWrd6WghCbxhWu54wCYxV4udYpm+Epi/eLU+
   cDZ1lZrwJgIZfsBWwamiHKX+mp7XFsWfb8Bue/PikdfnfcJzKHY015ND0
   eLuuHq6UNC9P8m5Zez70vYPy5LCEDRviMplG7RiEC1l8dwYm25oaps8Wn
   FjICRp1XNEwnC//20yJ+biSSp7wSeSM2GCsYpdHVJgQw5oIvKN5nrmMnN
   KEBSottlmXot74qgxPdpLx4As1Q5PjMptopfTad21iOacDBFu7jf9/ml+
   SEnVSLcV+64rAqCV0Tv0CjB72pJzbmN++pxnSUiw+eSsxFKJjuAzE5OmU
   A==;
X-CSE-ConnectionGUID: 8ezpgKBtSyytywR+CgZGpw==
X-CSE-MsgGUID: NTqnnqHtQfSBopmzUi+YwA==
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="45604422"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Aug 2025 05:35:07 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 25 Aug 2025 05:35:05 -0700
Received: from [10.159.245.205] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 25 Aug 2025 05:35:03 -0700
Message-ID: <e3199e23-0973-44d2-a882-405892290e73@microchip.com>
Date: Mon, 25 Aug 2025 14:35:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ISSUE + PATCH] Interrupts were enabled early by spinlock guard
To: Edgar Bonet <bonet@grenoble.cnrs.fr>, Geert Uytterhoeven
	<geert@linux-m68k.org>, Thomas Gleixner <tglx@linutronix.de>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <280dd506-e1fc-4d2e-bdc4-98dd9dca6138@grenoble.cnrs.fr>
 <CAMuHMdWJ3im+k9uQgRhUh52Z_tJ+KQjAGY_Y8FjbEu6gB=0UKw@mail.gmail.com>
 <62be0896-6c90-4a27-81cb-7bd897d0e6f2@grenoble.cnrs.fr>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <62be0896-6c90-4a27-81cb-7bd897d0e6f2@grenoble.cnrs.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_053510_153580_72EAA7B3 
X-CRM114-Status: GOOD (  12.75  )
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

On 14/08/2025 at 17:28, Edgar Bonet wrote:
> Hello Geert, and thanks for you prompt review!

Yep, Geert, many thanks!

>> I think the conversions in
>> drivers/irqchip/irq-atmel-aic.c:aic_irq_domain_xlate() and
>> drivers/irqchip/irq-loongson-liointc.c:liointc_set_type()
>> are also wrong, and need a similar change.
> 
> The one in irq-atmel-aic.c looks indeed strikingly similar. The one in
> irq-loongson-liointc.c is slightly different though. Instead of:
> 
>      irq_gc_lock_irqsave() -> guard(raw_spinlock_irq)
> 
> it does:
> 
>      irq_gc_lock_irqsave() -> guard(raw_spinlock)
> 
> I don't know what the implications are though.
> 
>> Unfortunately I have no hardware to verify.
> 
> Neither do I.

I'm on it. Expect feedback later today...
Thanks so much for the heads-up.

Best regards,
   Nicolas


