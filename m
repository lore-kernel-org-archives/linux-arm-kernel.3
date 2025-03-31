Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933C3C36013
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 06:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7lblEgjGmVku0WDIJm+ceZUSHznhd5T5FJv/9s0u8g=; b=jLuGdGdzmAF8qCM5ZZvnX1qrBQ
	R7NdeqBAUAAIjfUmbFiJC5PWq2PHanGlMjSZ/WByA2mUPgwpsoMkAdtF8292dCpL0Uf/yPup14t3h
	1azf+GvyBWJnoqcXj7yoaU6a7/dKg3uTyuBK4F/O80BBYrUIDwg4oCXP836CTPGj6gEQcQF7z172f
	OwkEpujGLt4f4efZM/nbI0RqkSnlnUS/ZH110XKCw6RfJgVjmCXmmsFkKYi/Qo781w71m4k1cgWaA
	3zgC3zLHw+rv5s2Oq1KAAxBOL+epqqkGZXYLij3VUXP3SkvPJsK7okCNUQ+c3wmK0SY5Lz8Ah2aE8
	en2x4awQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz94b-0000000H91n-0cOs;
	Mon, 31 Mar 2025 06:56:41 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tz92a-0000000H8qf-0cTB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 06:54:38 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZR1x40ZN5z6M4hZ;
	Mon, 31 Mar 2025 14:50:48 +0800 (CST)
Received: from frapeml100007.china.huawei.com (unknown [7.182.85.133])
	by mail.maildlp.com (Postfix) with ESMTPS id 8FD01140257;
	Mon, 31 Mar 2025 14:54:23 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100007.china.huawei.com (7.182.85.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 31 Mar 2025 08:54:23 +0200
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Mon, 31 Mar 2025 08:54:23 +0200
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Oliver Upton <oliver.upton@linux.dev>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, "Lorenzo
 Pieralisi" <lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>
Subject: RE: [PATCH] smccc: kvm_guest: Align with DISCOVER_IMPL_CPUS ABI
Thread-Topic: [PATCH] smccc: kvm_guest: Align with DISCOVER_IMPL_CPUS ABI
Thread-Index: AQHbnzaiWLoM4Pr1N0ylxjrv88F9hLOM1NNw
Date: Mon, 31 Mar 2025 06:54:23 +0000
Message-ID: <e670c3778d794d82878d0b4cdd3d11d5@huawei.com>
References: <20250327163613.2516073-1-oliver.upton@linux.dev>
In-Reply-To: <20250327163613.2516073-1-oliver.upton@linux.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.48.153.182]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_235436_325905_808FB598 
X-CRM114-Status: GOOD (  16.08  )
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



> -----Original Message-----
> From: Oliver Upton <oliver.upton@linux.dev>
> Sent: Thursday, March 27, 2025 4:36 PM
> To: kvmarm@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> Mark Rutland <mark.rutland@arm.com>; Lorenzo Pieralisi
> <lpieralisi@kernel.org>; Sudeep Holla <sudeep.holla@arm.com>; Catalin
> Marinas <catalin.marinas@arm.com>; Marc Zyngier <maz@kernel.org>;
> Oliver Upton <oliver.upton@linux.dev>; Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>
> Subject: [PATCH] smccc: kvm_guest: Align with DISCOVER_IMPL_CPUS ABI
>=20
> The ABI of the hypercall requires that R2 and R3 are 0. Explicitly pass
> 0 for these parameters.
>=20
> Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Fixes: 86edf6bdcf05 ("smccc/kvm_guest: Enable errata based on
> implementation CPUs")
> Signed-off-by: Oliver Upton <oliver.upton@linux.dev>

Reviewed-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Thanks,
Shameer

> ---
>  drivers/firmware/smccc/kvm_guest.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/firmware/smccc/kvm_guest.c
> b/drivers/firmware/smccc/kvm_guest.c
> index 5767aed25cdc..ac2d3cf8a776 100644
> --- a/drivers/firmware/smccc/kvm_guest.c
> +++ b/drivers/firmware/smccc/kvm_guest.c
> @@ -95,7 +95,7 @@ void  __init kvm_arm_target_impl_cpu_init(void)
>=20
>  	for (i =3D 0; i < max_cpus; i++) {
>=20
> 	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_DISCOVE
> R_IMPL_CPUS_FUNC_ID,
> -				     i, &res);
> +				     i, 0, 0, &res);
>  		if (res.a0 !=3D SMCCC_RET_SUCCESS) {
>  			pr_warn("Discovering target implementation CPUs
> failed\n");
>  			goto mem_free;
>=20
> base-commit: 369c0122682c4468a69f2454614eded71c5348f3
> --
> 2.39.5


