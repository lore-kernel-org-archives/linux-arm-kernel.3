Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A281EE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 13:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+XKr+p6+d0vsEOub5KNiYEX8dUurRREKoGxPw+GDFI=; b=1Tj1oZ3lqMuwRnx2VF42ia8Qbp
	Abs7jYr1O03mF+Gl0hgmAQJ4nL7wuC7HObF2rctkoDgkKCvGRU09gcdwitKmMhNIBwCl2kdoR7HRy
	F8Zx8HPUuqfl4wThezW45TxYa5zXflVTiD38xOT+XyUdKCKZHdfxahbC79F0HtQY982gM7etkDpyN
	ozBkm2tnvuGauP56qRMl+wDQhh4DyS3LgrZi2yxLsR2gBM3qH0S8oNSdgI6WYrG0q0GUgLH1wgFlQ
	Z0MH5Oj9TK5oM6u3hn+7n9OMQ+Y2cO7h4P98LJacfVm9mOMo83xl6r99mYwn80AC+pUc6XGyigyCm
	oz/+E9wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdXM-00000007tPw-0yaL;
	Mon, 09 Dec 2024 13:10:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKdE8-00000007nJp-1LEZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 12:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733748662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z+XKr+p6+d0vsEOub5KNiYEX8dUurRREKoGxPw+GDFI=;
	b=Qr0hzkW+2+1mRq6cfy+zwGcdCFLsz1xrzTrdfgig+MOkt8VVsUjYIPBuW4iBtVDgQwhl/w
	N8fg52O18OY9RsHdcOZirSE5tfvukcSR7Wdn/5wXbPzia3w21t4T7NyFU5bmFHtGFZozz5
	xCpOO2vtO0kC6OB1u5HxNbSVIQUFdCI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-435-bTSuDVTEMgyIdvo-oQugcg-1; Mon,
 09 Dec 2024 07:49:25 -0500
X-MC-Unique: bTSuDVTEMgyIdvo-oQugcg-1
X-Mimecast-MFC-AGG-ID: bTSuDVTEMgyIdvo-oQugcg
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 31C661955DCA;
	Mon,  9 Dec 2024 12:49:22 +0000 (UTC)
Received: from localhost (dhcp-192-244.str.redhat.com [10.33.192.244])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A9627195605A;
	Mon,  9 Dec 2024 12:49:19 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 kvmarm@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
 eric.auger@redhat.com, yuzenghui@huawei.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 anthony.jebson@huawei.com, linux-arm-kernel@lists.infradead.org,
 linuxarm@huawei.com
Subject: Re: [PATCH v3 3/3] arm64: paravirt: Enable errata based on
 implementation CPUs
In-Reply-To: <20241209115311.40496-4-shameerali.kolothum.thodi@huawei.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20241209115311.40496-1-shameerali.kolothum.thodi@huawei.com>
 <20241209115311.40496-4-shameerali.kolothum.thodi@huawei.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 09 Dec 2024 13:49:16 +0100
Message-ID: <875xnt10oj.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dOL09OlAXYj2gobNp5w4MkI4kryI-9fW1KV6d2H5TlQ_1733748563
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_045104_429568_C5E9A8BD 
X-CRM114-Status: GOOD (  17.47  )
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

On Mon, Dec 09 2024, Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> Retrieve any migration target implementation CPUs using the hypercall
> and enable associated errata.
>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> Note:
>
> One thing I am not sure here is how to handle the hypercall error.
> Do we need to fail the Guest boot or just carry on without any
> target implementation CPU support? At the moment it just carries on.
>
> Thanks,
> Shameer
> ---
>  arch/arm64/include/asm/cputype.h  | 25 +++++++++++++++++++++++--
>  arch/arm64/include/asm/paravirt.h |  3 +++
>  arch/arm64/kernel/cpu_errata.c    | 20 +++++++++++++++++---
>  arch/arm64/kernel/cpufeature.c    |  2 ++
>  arch/arm64/kernel/image-vars.h    |  2 ++
>  arch/arm64/kernel/paravirt.c      | 31 +++++++++++++++++++++++++++++++
>  6 files changed, 78 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/include/asm/cputype.h b/arch/arm64/include/asm/cputype.h
> index dcf0e1ce892d..9e466f3ae9c6 100644
> --- a/arch/arm64/include/asm/cputype.h
> +++ b/arch/arm64/include/asm/cputype.h
> @@ -265,6 +265,16 @@ struct midr_range {
>  #define MIDR_REV(m, v, r) MIDR_RANGE(m, v, r, v, r)
>  #define MIDR_ALL_VERSIONS(m) MIDR_RANGE(m, 0, 0, 0xf, 0xf)
>  
> +#define MAX_TARGET_IMPL_CPUS 64
> +
> +struct target_impl_cpu {
> +	u32 midr;
> +	u32 revidr;
> +};

Doesn't this need to be u64 for both (even if the upper bits for
MIDR_EL1 are reserved?)


