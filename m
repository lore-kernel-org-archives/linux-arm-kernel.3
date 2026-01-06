Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2729CEFCE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 18:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDv1QnnUOF68a8kXkDA6TOieF24PvJ5g67KKk/Nk94o=; b=YTCWRSz9MDzx4o7nrCIBHhtXPx
	S/zXuAjKL0ZapT5pjvhyz/VKyQXN6AgLJU9eYETRM12J570+RoOA//+eDcYwzBbFsQIjBS5bgBbCN
	RW6NK8YvZS3B5ocQfBauDkf1uz9zBS6s+LDvVkHW24qcBFDul/5anNjpPBr//CL5BKgCBzfZx7caD
	jUi+VfLcHCI2da40519Qne6cZFc6eCSq1JneOza5oIRWDv9lHT1K+SBo7LzvJ8jnc6qm2ZgRXVYcX
	M9H0tD9Jul9Hjt0cKO0HDa+1m/f/XUA6PcAqO8nZssCkhPpxT0OioykVkDN7k6UzVgcURLoPwd76a
	RXakmIKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBU4-0000000DeIg-2eA7;
	Tue, 06 Jan 2026 18:08:44 +0000
Received: from sinmsgout02.his.huawei.com ([119.8.177.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBTz-0000000DeI3-49qq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 18:08:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sDv1QnnUOF68a8kXkDA6TOieF24PvJ5g67KKk/Nk94o=;
	b=b1uDB+j52vLbyZwJVrpn81CB1AaJzX5AG703pfb11++Y9qfjni/sDs4GEy96hc6Y3ejo5rKcK
	nRU4D95rdDFuVDtv2E9HSSbZu9d0/rbxVkg5Q+uRqHyySlsm1OQP8Qpf8hTEggQNtqCsTk0XOgE
	uUPQQWqtOnkerh/YbP7LPy8=
Received: from frasgout.his.huawei.com (unknown [172.18.146.32])
	by sinmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dlzcs1hvmz1vns1;
	Wed,  7 Jan 2026 02:06:21 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dlzgB4sp9zHnGhr;
	Wed,  7 Jan 2026 02:08:22 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 4A6374057E;
	Wed,  7 Jan 2026 02:08:27 +0800 (CST)
Received: from localhost (10.195.245.156) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 6 Jan
 2026 18:08:26 +0000
Date: Tue, 6 Jan 2026 18:08:24 +0000
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
Subject: Re: [PATCH v2 05/36] arm64/sysreg: Add GICR CDNMIA encoding
Message-ID: <20260106180824.00005516@huawei.com>
In-Reply-To: <20251219155222.1383109-6-sascha.bischoff@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-6-sascha.bischoff@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.195.245.156]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_100841_991293_CCC9FBAD 
X-CRM114-Status: GOOD (  15.73  )
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

On Fri, 19 Dec 2025 15:52:37 +0000
Sascha Bischoff <Sascha.Bischoff@arm.com> wrote:

> The encoding for the GICR CDNMIA system instruction is thus far unused
> (and shall remain unused for the time being). However, in order to
> plumb the FGTs into KVM correctly, KVM needs to be made aware of the
> encoding of this system instruction.
> 
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> ---
>  arch/arm64/include/asm/sysreg.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/include/asm/sysreg.h b/arch/arm64/include/asm/sysreg.h
> index b3b8b8cd7bf1e..e99acb6dbd5d8 100644
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
> +#define GICV5_GIC_CDNMIA_VALID_MASK	BIT_ULL(32)
> +#define GICV5_GICR_CDNMIA_VALID(r)	FIELD_GET(GICV5_GIC_CDNMIA_VALID_MASK, r)

Why the R for just this one?

There is precedence with GICV5_GICR_CDIA_VALID() but I've no idea
why that one got the R (and not the field definitions next to it)
either!

Lorenzo, guessing that was in your main gicv5 series?

Given it's GICR CDIA (and here GICR CDNMIA) in the spec, I think
all the definitions should have the R but maybe I'm missing something.

Jonathan


> +#define GICV5_GIC_CDNMIA_TYPE_MASK	GENMASK_ULL(31, 29)
> +#define GICV5_GIC_CDNMIA_ID_MASK	GENMASK_ULL(23, 0)
> +
>  #define gicr_insn(insn)			read_sysreg_s(GICV5_OP_GICR_##insn)
>  #define gic_insn(v, insn)		write_sysreg_s(v, GICV5_OP_GIC_##insn)
>  


