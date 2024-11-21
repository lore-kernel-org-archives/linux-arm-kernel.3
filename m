Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488CCD75BD9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 09:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzADr5mhRRcz/tF9KfROlyGYTUVMAn9CEq045PmPCOs=; b=qutiCpWUi6p2FLYRMANfO74uvn
	qpvoXBHQNvYkpPRp8COBfcjziJh1/kRxX0Tb/cHT/9ewoDP5swc7cJgfYnLMlEEp/HlmW9ctx2q7t
	w/WYVwxP3xmOlU7jAjosf/kURpbmNEqeBmzVOqjORkNEgb2iDh45+J1NsVmr57gl2b10lgTXI4r0B
	eFrE16lqzNVaWW5Lw+QeaZ/pxMOpqWn18/SX/zokptmZ1yTuqLbuc3LCzmzNlcgDGgGvGYNaulPlF
	lZ/StHPgRIhyebLGxyAwfkAdo0RyqAws6oyV3eJrJxsXaj8lA2OHhfQU6q+uKc8QNCEpyE/H6p8KB
	DoX0tlZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE35H-0000000HAu3-3nXQ;
	Thu, 21 Nov 2024 09:02:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE34I-0000000HAlv-2RRy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 09:01:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 727DF1480;
	Thu, 21 Nov 2024 01:02:09 -0800 (PST)
Received: from [10.163.48.156] (unknown [10.163.48.156])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E01513F66E;
	Thu, 21 Nov 2024 01:01:36 -0800 (PST)
Message-ID: <6e6c57da-6e11-49b2-a6c4-fb9478055314@arm.com>
Date: Thu, 21 Nov 2024 14:31:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: smp: Fix IPI alignment in /proc/interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Russell King <linux@armlinux.org.uk>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <96f61cafee969c59796ac06c1410195fa0f1ba0b.1732096154.git.geert+renesas@glider.be>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <96f61cafee969c59796ac06c1410195fa0f1ba0b.1732096154.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_010142_667734_C81D5C1D 
X-CRM114-Status: GOOD (  13.88  )
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



On 11/20/24 15:24, Geert Uytterhoeven wrote:
> On a system with less than 1000 interrupts, prec = 3, causing a
> misalignment for the IPI interrupts.  E.g. on Koelsch (R-Car M2-W):
> 
>     200:          0          0  gpio-rcar   6 Edge      SW36
>     IPI0:          0          0  CPU wakeup interrupts
>     IPI1:          0          0  Timer broadcast interrupts
>     IPI2:       1701       2844  Rescheduling interrupts
>     IPI3:      10338      21181  Function call interrupts
>     IPI4:          0          0  CPU stop interrupts
>     IPI5:        651        825  IRQ work interrupts
>     IPI6:          0          0  completion interrupts
>     Err:          0
> 
> Fix this by adopting the same solution as used on arm64.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm/kernel/smp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
> index 3431c0553f45cdf5..50999886a8b5cbab 100644
> --- a/arch/arm/kernel/smp.c
> +++ b/arch/arm/kernel/smp.c
> @@ -551,7 +551,8 @@ void show_ipi_list(struct seq_file *p, int prec)
>  		if (!ipi_desc[i])
>  			continue;
>  
> -		seq_printf(p, "%*s%u: ", prec - 1, "IPI", i);
> +		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
> +			   prec >= 4 ? " " : "");
>  
>  		for_each_online_cpu(cpu)
>  			seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));

LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

