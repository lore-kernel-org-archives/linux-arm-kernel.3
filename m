Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734DDCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 07:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Cc:To
	:Subject:Message-ID:From:Content-Transfer-Encoding:Content-Type:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89fgQI2MyG5GwpzH4bnJ+61l5og0hczL62ghWcdv4i8=; b=P5S2DNCr2ks+e+L7qTxt7Nuv6G
	G/B/6AF61qYJaleOH4/DOcYYlt/qrjoGUmEgR5+NkimRyC2Fn7SGjJFdJdnX3Pv/53C5SjGcmclyK
	w8G93FEWH53kTgg1/hqmJrgucxipezd1MQvMtUOxSAo29Xo9A9L1P6Mee8ycLFjawyXAAUSIazxwA
	IlhOxWC37tyNNc8KekqOrBpRGEGroHLqp30ctMfNOxNbbti302EETpdH0YvCXAG9Z3jLKxupo7PhK
	J3YAlisxAgmiaWjTQOhnUZZstW/P0L2BEofXcdZGPYH1RTkD4GVphz+jfxWcqjqwUDRJ0nzZ8hMSJ
	Mp0CcXyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV23j-0000000GGC0-1Rhe;
	Thu, 04 Jun 2026 07:00:07 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV23h-0000000GGBM-090k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 07:00:06 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780556391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=89fgQI2MyG5GwpzH4bnJ+61l5og0hczL62ghWcdv4i8=;
	b=Q1SjqbTAiGs06RwvRDUK/EqJrxv6iRhxFv3Vuje1OIEYQTdbbxCZtsxTEhirAP7gUbY42E
	ihDvn+H9+1v9SgLCNIciuaF2xArOsxSnQ3ikuBZrTx2XPwUT3ILJw0m1F9O5k6A+xx3cau
	LuB/Z3sx+4Y3g2NwvULBvCKRm2EkFZA=
Date: Thu, 04 Jun 2026 06:59:49 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Jackie Liu" <liu.yun@linux.dev>
Message-ID: <0bc286797b469d93631cb3ad2c99e135f49d5200@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] KVM/arm64: vgic-its: Fix memory leak when
 vgic_its_set_abi() fails
To: "Oliver Upton" <oupton@kernel.org>
Cc: maz@kernel.org, linux-arm-kernel@lists.infradead.org,
 yuzenghui@huawei.com, will@kernel.org, kvmarm@lists.linux.dev
In-Reply-To: <aiEeKGsLg9098OUt@kernel.org>
References: <20260604031426.16109-1-liu.yun@linux.dev>
 <aiEeKGsLg9098OUt@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_000005_229303_8D559F46 
X-CRM114-Status: UNSURE (   8.59  )
X-CRM114-Notice: Please train this message.
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

2026=E5=B9=B46=E6=9C=884=E6=97=A5 14:41, "Oliver Upton" <oupton@kernel.or=
g mailto:oupton@kernel.org?to=3D%22Oliver%20Upton%22%20%3Coupton%40kernel=
.org%3E > =E5=86=99=E5=88=B0:


>=20
>=20On Thu, Jun 04, 2026 at 11:14:26AM +0800, Jackie Liu wrote:
>=20
>=20>=20
>=20> From: Jackie Liu <liuyun01@kylinos.cn>
> >=20=20
>=20>  In vgic_its_create(), if vgic_its_set_abi() fails after allocating=
 the
> >  its structure and setting kvm state, the allocated 'its' is leaked
> >  because the function returns without freeing it.
> >=20=20
>=20>  Fix by rolling back the kvm state flags and freeing the its struct=
ure
> >  when vgic_its_set_abi() returns an error.
> >=20=20
>=20>  Fixes: 71afe470e20d ("KVM: arm64: vgic-its: Introduce migration AB=
I infrastructure")
> >  Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
> >=20
>=20vgic_its_set_abi() always succeeds so there's no actual memory leak
> here. I'd prefer getting rid of the return value instead.

That was my original thought as well. However, I kept the defensive clean=
up logic in place
to make future extensions easier. This way, if additional resource alloca=
tion paths are=20
introduced=20later, we're less likely to miss the corresponding cleanup.

That said, looking at the current code, the return value no longer serves=
 any real=20
purpose,=20so removing it would also be a reasonable and cleaner approach=
.

I'll send a V2 with this change.

Thanks.
Jackie


>=20
>=20Thanks,
> Oliver
>

