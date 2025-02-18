Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F57C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 07:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NU3The1APhQsLBU7n9+PEhO2idSxzQOTpZ79T4UM9+4=; b=Fit1orIwl6Bn0EyiH3HnJIifgp
	VyKANeBB34fq5S8I0tTQeh2I/4qBV4gUcWLqimcdKBeoEw0keWp832XT4J3sWNYMvp8IL7qFDKEdE
	vALpagww/+XbO/iv/VViiN8wIc7h+5ruVZhooAAkxhwzrZIs7Mrp30iLmTiEwE8Jk9oPNCXDA6yW/
	LlVbJLjfDahSQR2lXEJaZHpMbAcW3X07pB+JG9V5QLsRQna3ms66a2IAKWvxjtkQV9jh49CXwCE3R
	1I6TK268nteE8xX0mDdGJcxm6C1xurM3tM2qGhJ93ylwhDVzSNEcVL5riarq5CFw5MJDC95Y3knye
	QWtgQYEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIFR-000000076TD-10M3;
	Tue, 18 Feb 2025 07:42:29 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIDx-000000076HA-1HB7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 07:40:59 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Yxrwj6pG9z6M4Rv;
	Tue, 18 Feb 2025 15:38:13 +0800 (CST)
Received: from frapeml100007.china.huawei.com (unknown [7.182.85.133])
	by mail.maildlp.com (Postfix) with ESMTPS id 45E66140B2F;
	Tue, 18 Feb 2025 15:40:48 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100007.china.huawei.com (7.182.85.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 18 Feb 2025 08:40:47 +0100
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Tue, 18 Feb 2025 08:40:47 +0100
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Marc Zyngier <maz@kernel.org>, Sebastian Ott <sebott@redhat.com>
CC: "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "catalin.marinas@arm.com"
	<catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>, "cohuck@redhat.com"
	<cohuck@redhat.com>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
	yuzenghui <yuzenghui@huawei.com>, "Wangzhou (B)" <wangzhou1@hisilicon.com>,
	jiangkunkun <jiangkunkun@huawei.com>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, Anthony Jebson <anthony.jebson@huawei.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH v7 4/5] smccc/kvm_guest: Enable errata based on
 implementation CPUs
Thread-Topic: [PATCH v7 4/5] smccc/kvm_guest: Enable errata based on
 implementation CPUs
Thread-Index: AQHbfvRxSJOyGnvtKEOdLroufJhHY7NG57AAgAAIvwCABcIT8A==
Date: Tue, 18 Feb 2025 07:40:47 +0000
Message-ID: <0557f193756f45daac4349c30d8f2f8f@huawei.com>
References: <20250214151343.61348-1-shameerali.kolothum.thodi@huawei.com>
	<20250214151343.61348-5-shameerali.kolothum.thodi@huawei.com>
	<10831a79-a21f-dc40-a374-81b300d26dac@redhat.com>
 <86mseoscif.wl-maz@kernel.org>
In-Reply-To: <86mseoscif.wl-maz@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.48.156.112]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_234057_484103_341D27C9 
X-CRM114-Status: GOOD (  12.67  )
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
> From: Marc Zyngier <maz@kernel.org>
> Sent: Friday, February 14, 2025 4:43 PM
> To: Sebastian Ott <sebott@redhat.com>
> Cc: Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>; kvmarm@lists.linux.dev;
> oliver.upton@linux.dev; catalin.marinas@arm.com; will@kernel.org;
> mark.rutland@arm.com; cohuck@redhat.com; eric.auger@redhat.com;
> yuzenghui <yuzenghui@huawei.com>; Wangzhou (B)
> <wangzhou1@hisilicon.com>; jiangkunkun <jiangkunkun@huawei.com>;
> Jonathan Cameron <jonathan.cameron@huawei.com>; Anthony Jebson
> <anthony.jebson@huawei.com>; linux-arm-kernel@lists.infradead.org;
> Linuxarm <linuxarm@huawei.com>
> Subject: Re: [PATCH v7 4/5] smccc/kvm_guest: Enable errata based on
> implementation CPUs
>=20
> On Fri, 14 Feb 2025 16:12:02 +0000,
> Sebastian Ott <sebott@redhat.com> wrote:
> >
> > On Fri, 14 Feb 2025, Shameer Kolothum wrote:
> > > +++ b/arch/arm64/kernel/cpu_errata.c
> > > @@ -14,6 +14,9 @@
> > > #include <asm/kvm_asm.h>
> > > #include <asm/smp_plat.h>
> > >
> > > +u32 target_impl_cpu_num;
> > > +struct target_impl_cpu *target_impl_cpus;
> >
> > These should be exported (for configs using
> > CONFIG_CORESIGHT_SOURCE_ETM4X=3Dm)

Thanks Sebastian. I missed that.

>=20
> It might be better to make is_midr_in_range() out of line, and export
> that. This could allow making the data static (by implementing a
> couple of additional accessors).

Ok. I will give it a go.

Thanks,
Shameer



