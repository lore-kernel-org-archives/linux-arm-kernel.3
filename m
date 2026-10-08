Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE843CA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 07:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPJBGY61Mm0F59zwvDOhWaqucyLE0EcmWlV1wN0R5g4=; b=CmyREIp1vMnJNi
	BPeDsILJ88reUHp0NcDO8kaBseJBi76PWlM+YN7dcGO4njIJV6AEDfJhxdBDqi2UsE17q4Inzpayf
	D+EuNA3Tbo8H4ta/5XdQpTIW74tI7TJLABo+PX0/cMIaAp6t05aDoP0IEKNWzILG8mpQToyJXhBWJ
	Qlc7F5Ne+MKwBamvjDeCAbhkDRKi5EocRjiVVrbFMp2gU9HzsAd/BiGg/1s1f0eLpE+UH2v8XDLIE
	5Y6vF3epv8fDVHDJiRhG3FF7pIRhUKkm57V05OOr/bmdVSA5HjxdmQmwOhavOHaOpWb2FEcFLZ8nH
	aeOdiFh2JXzXMDRVJSfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiyt-00000003nzP-10Sh;
	Thu, 08 Oct 2026 07:55:59 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiyq-00000003nye-08ER
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 07:55:57 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GPJBGY61Mm0F59zwvDOhWaqucyLE0EcmWlV1wN0R5g4=;
	b=HTI2c04xSQNkehN/7k3oL/b/H5NHGvyNiRp3EnjSFvHuf/u7VJibTMYXu9g9XuAl5L4UEMUJe
	CQIoH7vgTxMtu3k/S4GlN2ZQDgLorIcE3GRWgGRKrNRQpHLleadQbV/t4HA0cqZv7Jk4MfozRfy
	viYlIt31jyeJhBxRPnmczfU=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4j0hnG50l7zKm9J;
	Thu,  8 Oct 2026 15:43:30 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id A256D40586;
	Thu,  8 Oct 2026 15:55:48 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 8 Oct
 2026 15:55:47 +0800
Message-ID: <7d3fd515-50fe-4f11-a44b-68192c84f1df@huawei.com>
Date: Thu, 8 Oct 2026 15:55:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/21] selftests/bpf: arm64: Use TPIDRRO_EL0 instead of
 SP_EL0 for 'current'
To: Will Deacon <will@kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20260918161407.2300-1-will@kernel.org>
 <20260918161407.2300-8-will@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260918161407.2300-8-will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_005556_533520_7D0AA1D2 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Vladimir Murzin <vladimir.murzin@arm.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linusw@kernel.org>, linux-kernel@vger.kernel.org, Mostafa Saleh <smostafa@google.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Oliver Upton <oupton@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



在 2026/9/19 0:13, Will Deacon 写道:
> The current task pointer now lives in TPIDRRO_EL0 instead of SP_EL0, so
> update the bpf selftests with the new register allocation.
> 
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  tools/testing/selftests/bpf/progs/verifier_jit_inline.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/bpf/progs/verifier_jit_inline.c b/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
> index 02e562f56f9d..a3d6c095acc3 100644
> --- a/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
> +++ b/tools/testing/selftests/bpf/progs/verifier_jit_inline.c
> @@ -9,7 +9,7 @@ __success __retval(0)
>  __arch_x86_64
>  __jited("	addq	%gs:{{.*}}, %rax")
>  __arch_arm64
> -__jited("	mrs	x8, SP_EL0")
> +__jited("	mrs	x8, TPIDRRO_EL0")

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  __arch_riscv64
>  __jited("	mv	a5, tp")
>  __arch_loongarch

-- 
Best regards,
Jinjie


