Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA79D1D478
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 16:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbU4fkpkOOSXQwSp10NRbg+E3BjPYUuFytg8j8m19zE=; b=y23d3/Kr+6BLmiC7tZG48PIqT/
	OdI6Uvu3DjYUKwIa0UP7DTg/mnobbRF/Td3cgFqFROfMac7xSFOmZgwFnVOIh4foEoBA0i9eWqBEd
	+ehWfsJ2tDYXlX9g8Zlz3i3OwC554/V1hj8Ol7YpUZsXOPuxYary6Zbxn7cjAu2mZh+eI9e5U1RXA
	vNayxhcgEHf68JJ6E7LB8W9PkENf5FqI6UOnBBNBnmlUXiovDPhgZ0SmIYdUByp8yxncbQa3yMykE
	9y9F2Q+vNmUArelAAOwppBwJ4EV6e5ph+8CPxfpoIoAfc886x/0G/TVnQkGiCSdPBgEJb4J+HtqY6
	+phxCRsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtKR-00000000Emo-3sbk;
	Thu, 08 Jan 2026 16:57:43 +0000
Received: from sinmsgout02.his.huawei.com ([119.8.177.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdtKQ-00000000ElR-0kMv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 16:57:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wbU4fkpkOOSXQwSp10NRbg+E3BjPYUuFytg8j8m19zE=;
	b=WeCWOz6VnYjpLolBIyuz7dR9docT6AbY8hEl1QjtHpOFFWAx0xJnBwOddeJxQSMFtvagHzBQf
	iat4eRHpSsmDSZEUZaaIWuSzVqTh0Mt3WNjjXoY2AgT258tYE1My5NhTZXoEu7AYXr5Da4zAmrl
	eYlq6LpGk4uwcGYNJIZJYwQ=
Received: from frasgout.his.huawei.com (unknown [172.18.146.33])
	by sinmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4dn9y33L8gz1vnM8;
	Fri,  9 Jan 2026 00:55:23 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dnB0Q4NbvzJ468V;
	Fri,  9 Jan 2026 00:57:26 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id B861F40539;
	Fri,  9 Jan 2026 00:57:31 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Thu, 8 Jan
 2026 16:57:30 +0000
Date: Thu, 8 Jan 2026 16:57:29 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Sascha Bischoff <Sascha.Bischoff@arm.com>
CC: "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, Timothy Hayes <Timothy.Hayes@arm.com>, "Suzuki
 Poulose" <Suzuki.Poulose@arm.com>, nd <nd@arm.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvm@vger.kernel.org"
	<kvm@vger.kernel.org>, Joey Gouly <Joey.Gouly@arm.com>, "maz@kernel.org"
	<maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>
Subject: Re: [PATCH v2 19/36] KVM: arm64: gic-v5: Check for pending PPIs
Message-ID: <20260108165729.0000290f@huawei.com>
In-Reply-To: <0f8b393f8c9e557ba081a75757f1140c0da75a76.camel@arm.com>
References: <20251219155222.1383109-1-sascha.bischoff@arm.com>
	<20251219155222.1383109-20-sascha.bischoff@arm.com>
	<20260107150012.0000336b@huawei.com>
	<0f8b393f8c9e557ba081a75757f1140c0da75a76.camel@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_085742_423729_F82269F0 
X-CRM114-Status: GOOD (  11.56  )
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


> > > Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com> =20
> > Hi Sascha,
> >=20
> > One thing I notice in here is the use of unsigned long vs u64 is a
> > bit
> > inconsistent.=A0 When it's a register or something we just read from a
> > register
> > I'd always use u64. =20
>=20
> Yeah, I'd like to do the same. The issue is that the for_each_set_bit()
> loop construct only works with unsigned long, and not u64. I'll rework
> the code to use u64 wherever possible.

Whilst is a bit silly with a single u64, there is bitmap_from_arr64()
The compiler should be able to see enough to flatten that to an assignment
so it's pretty cheap and ends up documenting why types are different.

