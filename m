Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D1BD609B1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 15:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6eUa0xgiO7viGzFB9myrhh+LA3h1UT0NvkNdkJm5Cw=; b=lDiYKklHe3bHAHn/H+iIbNHPhs
	kSaCKcrnmmOiPaqqJZm8iBNlNmjYGJRsz0wC7YPzskGJSWbsUiJ9yj5TaLolnLJ6cmUxVEWnArKhY
	aEb2EpCJyI07SF2QxZf8UTs9IGVmobW5lXdybQIz52eMjzwwiurcEaNzWcx31q3QCbCy3Y2dsibJp
	8ngN1TVqdf5uP8X282QqrIgwvaxQNCzy9GK7O0ml8E6BeEz2WZp/Uwg6A4TymAKs3emdGacc/DOpH
	mO+fOBGhOlqzIIeRaPLQCWVDXTSq42gp1cNol8z11YQCRTvgiZODUAzD6zvAn9msouxA4JuMvAGQg
	05UArIfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXAh-00000005Smr-1XCS;
	Tue, 16 Dec 2025 15:41:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVXAe-00000005SmW-28PA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 15:41:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B08842A4F;
	Tue, 16 Dec 2025 15:41:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF21EC4CEF1;
	Tue, 16 Dec 2025 15:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765899663;
	bh=ZLMXB9W9lGKzctTWJArW9FEZ3LPiAiwdNGpWwjugkkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GJLxC1Bdsgt8eAlutveLdrhP3wGs0rsN+YFRYXv3XvWreXRzKo9MdKq10ncAaofdc
	 A8prOj31IGEMqg8RNNAOFM5+vSexABe4jHflH3sHPxkxNXBfRhVlTTpMGdfQ+K+2Lq
	 xhcs3nRKv6ICR7xJ1uWb6QU1uoe3TF4aWqsky8iylhfTbDQNJEBRCud3Ybr+aOYEkC
	 9igz92Awk8CYkiWBp/BNN4FArycWGjkn0W/ZtpfLyFB8bvYiQLD1p6I1S6KcRvNVqr
	 5ocVq307FzTcutXEWDbg2+MsTC2t6LZciQ1WWq4Ar0V/Tj8PdsygbbHpDl+v/1ntcG
	 lyTN57Ivr6oJg==
Date: Tue, 16 Dec 2025 16:40:55 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd <nd@arm.com>,
	"maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	Joey Gouly <Joey.Gouly@arm.com>,
	Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>
Subject: Re: [PATCH 29/32] irqchip/gic-v5: Check if impl is virt capable
Message-ID: <aUF9hwjBuUKA73U8@lpieralisi>
References: <20251212152215.675767-1-sascha.bischoff@arm.com>
 <20251212152215.675767-30-sascha.bischoff@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212152215.675767-30-sascha.bischoff@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_074104_607546_F0144837 
X-CRM114-Status: GOOD (  21.60  )
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

On Fri, Dec 12, 2025 at 03:22:45PM +0000, Sascha Bischoff wrote:
> Now that there is support for creating a GICv5-based guest with KVM,

The only comment I have is - as discussed, this patch is not really
dependent on GICv5 KVM support - ie, if IRS_IDR0.VIRT == b0 there isn't
a chance GIC v3 legacy support is implemented either, maybe it is worth
clarifying that.

Otherwise LGTM:

Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> check that the hardware itself supports virtualisation, skipping the
> setting of struct gic_kvm_info if not.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  drivers/irqchip/irq-gic-v5-irs.c   | 4 ++++
>  drivers/irqchip/irq-gic-v5.c       | 5 +++++
>  include/linux/irqchip/arm-gic-v5.h | 4 ++++
>  3 files changed, 13 insertions(+)


> 
> diff --git a/drivers/irqchip/irq-gic-v5-irs.c b/drivers/irqchip/irq-gic-v5-irs.c
> index ce2732d649a3e..eebf9f219ac8c 100644
> --- a/drivers/irqchip/irq-gic-v5-irs.c
> +++ b/drivers/irqchip/irq-gic-v5-irs.c
> @@ -744,6 +744,10 @@ static int __init gicv5_irs_init(struct device_node *node)
>  	 */
>  	if (list_empty(&irs_nodes)) {
>  
> +		idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR0);
> +		gicv5_global_data.virt_capable =
> +			!!FIELD_GET(GICV5_IRS_IDR0_VIRT, idr);
> +
>  		idr = irs_readl_relaxed(irs_data, GICV5_IRS_IDR1);
>  		irs_setup_pri_bits(idr);
>  
> diff --git a/drivers/irqchip/irq-gic-v5.c b/drivers/irqchip/irq-gic-v5.c
> index 41ef286c4d781..f5b17a2557aa1 100644
> --- a/drivers/irqchip/irq-gic-v5.c
> +++ b/drivers/irqchip/irq-gic-v5.c
> @@ -1064,6 +1064,11 @@ static struct gic_kvm_info gic_v5_kvm_info __initdata;
>  
>  static void __init gic_of_setup_kvm_info(struct device_node *node)
>  {
> +	if (!gicv5_global_data.virt_capable) {
> +		pr_info("GIC implementation is not virtualization capable\n");
> +		return;
> +	}
> +
>  	gic_v5_kvm_info.type = GIC_V5;
>  
>  	/* GIC Virtual CPU interface maintenance interrupt */
> diff --git a/include/linux/irqchip/arm-gic-v5.h b/include/linux/irqchip/arm-gic-v5.h
> index 9607b36f021ee..36f4c0e8ef8e9 100644
> --- a/include/linux/irqchip/arm-gic-v5.h
> +++ b/include/linux/irqchip/arm-gic-v5.h
> @@ -45,6 +45,7 @@
>  /*
>   * IRS registers and tables structures
>   */
> +#define GICV5_IRS_IDR0			0x0000
>  #define GICV5_IRS_IDR1			0x0004
>  #define GICV5_IRS_IDR2			0x0008
>  #define GICV5_IRS_IDR5			0x0014
> @@ -65,6 +66,8 @@
>  #define GICV5_IRS_IST_STATUSR		0x0194
>  #define GICV5_IRS_MAP_L2_ISTR		0x01c0
>  
> +#define GICV5_IRS_IDR0_VIRT		BIT(6)
> +
>  #define GICV5_IRS_IDR1_PRIORITY_BITS	GENMASK(22, 20)
>  #define GICV5_IRS_IDR1_IAFFID_BITS	GENMASK(19, 16)
>  
> @@ -280,6 +283,7 @@ struct gicv5_chip_data {
>  	u8			cpuif_pri_bits;
>  	u8			cpuif_id_bits;
>  	u8			irs_pri_bits;
> +	bool			virt_capable;
>  	struct {
>  		__le64 *l1ist_addr;
>  		u32 l2_size;
> -- 
> 2.34.1

