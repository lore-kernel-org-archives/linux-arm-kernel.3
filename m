Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED45CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 06:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzKL1XMF2X7NDYIZWTFtjqhUAQB7pXraoI6fG4GLHS4=; b=ueNX55CAAlH27Y3RsikV3KvXRr
	vzprkNpxXg6T/lqAMtDXIbt9yWpfV0YXdRTGDSJyx7plKVGQEW7FV2FMg/7mXvjjzG4m5xrFcw4A1
	UnAZRpiSv0FPdF2QU8aCf8x2VmO8lBhgCPn7CNb4XNZRr2i0i7pt6BcbFbcizUIUxek52BgJxk++C
	69bLUXYqqQwwdm3BAKS6GHxucg7YjVaXZ3O1Bw1PHV313JLSEipnnW+f4MAnoT6XaMOTTAAZ94K6R
	QapHcbw0b+acdAuQChy0bafRi2DRM7DnrvHVS840hJCzryCb2LDty5WHAj4UIJ4i4/UMvIksXYZsd
	vDVqxkZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Z0U-0000000FOFL-0jke;
	Tue, 14 Oct 2025 06:59:38 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Z0R-0000000FOEa-2A2i
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 06:59:37 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=gzKL1XMF2X7NDYIZWTFtjqhUAQB7pXraoI6fG4GLHS4=;
	b=zw/KdMpAFTlf5zt4yJ0H+Z74xhTR52zV2PQrKVuVm98Z773lfrOGRba1Yj9GOKjTkkzmylSo6
	sqPOPOe8lIi5/hEPkvdMbeJaWNvk+aNRhZ3P7P/IUcjcs8cdoSbYm2pGsUHZ8aOksWkNtMPJhmL
	T8z+XFFt6TsZ+NPqTAMbln8=
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4cm4nm3kwZz1K97v;
	Tue, 14 Oct 2025 14:59:08 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id 6FBB4140135;
	Tue, 14 Oct 2025 14:59:27 +0800 (CST)
Received: from [10.174.178.219] (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 14 Oct 2025 14:59:26 +0800
Subject: Re: [PATCH] KVM: arm64: selftests: Sync ID_AA64PFR1, MPIDR, CLIDR in
 guest
To: Ben Horgan <ben.horgan@arm.com>
CC: Zenghui Yu <zenghui.yu@linux.dev>, <kvmarm@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <maz@kernel.org>,
	<oliver.upton@linux.dev>, <joey.gouly@arm.com>, <suzuki.poulose@arm.com>
References: <20251012154352.61133-1-zenghui.yu@linux.dev>
 <25a19af8-2026-45b6-8d0f-42c371c8ff95@arm.com>
 <75f13087-80fa-45cb-9327-aa85522203e0@arm.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <f71d620a-87c9-7cd3-425b-e6052a38e268@huawei.com>
Date: Tue, 14 Oct 2025 14:59:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <75f13087-80fa-45cb-9327-aa85522203e0@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_235935_996758_8B0E4550 
X-CRM114-Status: GOOD (  18.49  )
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

On 2025/10/14 0:14, Ben Horgan wrote:
> 
> 
> On 10/13/25 13:20, Ben Horgan wrote:
> > Hi Zenghui,
> >
> > On 10/12/25 16:43, Zenghui Yu wrote:
> > > We forgot to sync several registers (ID_AA64PFR1, MPIDR, CLIDR) in guest to
> > > make sure that the guest had seen the written value.
> > >
> > > Add them to the list.
> > >
> > > Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> > > ---
> > >  tools/testing/selftests/kvm/arm64/set_id_regs.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > >
> > > diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> > > index 8ff1e853f7f8..5e24f77868b5 100644
> > > --- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
> > > +++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
> > > @@ -249,11 +249,14 @@ static void guest_code(void)
> > >  	GUEST_REG_SYNC(SYS_ID_AA64ISAR2_EL1);
> > >  	GUEST_REG_SYNC(SYS_ID_AA64ISAR3_EL1);
> > >  	GUEST_REG_SYNC(SYS_ID_AA64PFR0_EL1);
> > > +	GUEST_REG_SYNC(SYS_ID_AA64PFR1_EL1);
> > >  	GUEST_REG_SYNC(SYS_ID_AA64MMFR0_EL1);
> > >  	GUEST_REG_SYNC(SYS_ID_AA64MMFR1_EL1);
> > >  	GUEST_REG_SYNC(SYS_ID_AA64MMFR2_EL1);
> > >  	GUEST_REG_SYNC(SYS_ID_AA64MMFR3_EL1);
> > >  	GUEST_REG_SYNC(SYS_ID_AA64ZFR0_EL1);
> > > +	GUEST_REG_SYNC(SYS_MPIDR_EL1);
> > > +	GUEST_REG_SYNC(SYS_CLIDR_EL1);
> >
> > Why did you choose this position in the list for these 2?

Technically there are no restrictions on the order. I just want it to
look consistent with test_reset_preserves_id_regs().

> >
> >>  	GUEST_REG_SYNC(SYS_CTR_EL0);
> >>  	GUEST_REG_SYNC(SYS_MIDR_EL1);
> >>  	GUEST_REG_SYNC(SYS_REVIDR_EL1);
> >
> > Looks good to me.
> >
> > Reviewed-By: Ben Horgan <ben.horgan@arm.com>

Thanks!

> On running this, I note test_guest_reg_read() doesn't announce its
> presence. How about adding a ksft_test_result_pass("%s\n", __func__) and
> bumping the number of tests?

Yup, I agreed.

Thanks,
Zenghui

