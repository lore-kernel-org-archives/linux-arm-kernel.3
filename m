Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DBFC9EC8D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAy+C5sEfXpHk9jTElPcoZZz2H8yOU52jg7XT4/1ARQ=; b=cZZjgLdg8HH920fwPHzBVCOUra
	WrbNdM2tPlriX7TIaVB6DKeDDKiLQ/42uEDEuxJV7lDgc+Ru/pf0EuPVxzfmvMyakLXSVsf04p1cZ
	/E5AQp1hlm5ZFLddJS6MwcgfFlzYygSQjwT0dNZLAMiNdxD6Wil3m0U89FrpjXNzHZE9rtNrPfaH3
	Fc8IRS3d14fuFvXN8dF62k6EF7z/HwJ3WZmukFJewcS4zDufPg6nGBZIT5aMAfvKVwoQ92ZM17oTc
	+SzVklwDfIq1UZgqwWXKAFKQFG2EOBttft2gqw071a2biq5LhIPUn4ACaUD2hZAanowZcVNbG/7Fo
	RPo1368Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJ51-00000005YDl-2yLt;
	Mon, 12 Jan 2026 14:39:39 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfJ4z-00000005YCZ-1Tfx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:39:38 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=UAy+C5sEfXpHk9jTElPcoZZz2H8yOU52jg7XT4/1ARQ=;
	b=XXqW77EI0cCltAZNyDTm3GDFWEvrwJMY1fuGWUeiV9OkUjcZuTQCVaMVhIt8o6aq0PZrF1PZA
	+5X0WjZAWjjVklkwovD2K8qsqKMNbuAvw/iKi1HdVwuYUeLTvQHNdhV5thXvNLtG+nDpkLRgbg9
	kZmNlpp7Ly8iTkCpie4afc0=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4dqZhb21jfz1P7Hv;
	Mon, 12 Jan 2026 22:37:03 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dqZl76D6bzJ46Dm;
	Mon, 12 Jan 2026 22:39:15 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 5FE5440570;
	Mon, 12 Jan 2026 22:39:27 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Mon, 12 Jan
 2026 14:39:26 +0000
Date: Mon, 12 Jan 2026 14:39:25 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, nd
	<nd@arm.com>, "maz@kernel.org" <maz@kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, Joey Gouly <Joey.Gouly@arm.com>, Suzuki Poulose
	<Suzuki.Poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, Timothy Hayes
	<Timothy.Hayes@arm.com>
Subject: Re: [PATCH v3 05/36] arm64/sysreg: Add GICR CDNMIA encoding
Message-ID: <20260112143925.00005226@huawei.com>
In-Reply-To: <20260109170400.1585048-6-sascha.bischoff@arm.com>
References: <20260109170400.1585048-1-sascha.bischoff@arm.com>
	<20260109170400.1585048-6-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_063937_809215_DD00CD4D 
X-CRM114-Status: GOOD (  15.02  )
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

On Fri, 9 Jan 2026 17:04:40 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> The encoding for the GICR CDNMIA system instruction is thus far unused
> (and shall remain unused for the time being). However, in order to
> plumb the FGTs into KVM correctly, KVM needs to be made aware of the
> encoding of this system instruction.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

If it does make sense to clean up GICV5_GIC[R]_CDIA_...
to add the R that can happen separately.

Jonathan


> ---
>  arch/arm64/include/asm/sysreg.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index b3b8b8cd7bf1e..97797761a07bf 100644
> --- a/arch/arm64/include/asm/sysreg.h
> +++ b/arch/arm64/include/asm/sysreg.h
> @@ -1059,6 +1059,7 @@
>  #define GICV5_OP_GIC_CDPRI		sys_insn(1, 0, 12, 1, 2)
>  #define GICV5_OP_GIC_CDRCFG		sys_insn(1, 0, 12, 1, 5)
>  #define GICV5_OP_GICR_CDIA		sys_insn(1, 0, 12, 3, 0)
> +#define GICV5_OP_GICR_CDNMIA		sys_insn(1, 0, 12, 3, 1)
>  
>  /* Definitions for GIC CDAFF */
>  #define GICV5_GIC_CDAFF_IAFFID_MASK	GENMASK_ULL(47, 32)
> @@ -1105,6 +1106,12 @@
>  #define GICV5_GIC_CDIA_TYPE_MASK	GENMASK_ULL(31, 29)
>  #define GICV5_GIC_CDIA_ID_MASK		GENMASK_ULL(23, 0)
>  
> +/* Definitions for GICR CDNMIA */
> +#define GICV5_GICR_CDNMIA_VALID_MASK	BIT_ULL(32)
> +#define GICV5_GICR_CDNMIA_VALID(r)	FIELD_GET(GICV5_GICR_CDNMIA_VALID_MASK, r)
> +#define GICV5_GICR_CDNMIA_TYPE_MASK	GENMASK_ULL(31, 29)
> +#define GICV5_GICR_CDNMIA_ID_MASK	GENMASK_ULL(23, 0)
> +
>  #define gicr_insn(insn)			read_sysreg_s(GICV5_OP_GICR_##insn)
>  #define gic_insn(v, insn)		write_sysreg_s(v, GICV5_OP_GIC_##insn)
>  


