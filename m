Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92CCD1BDE5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 19:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dW54Pjy9QLvSEzlVVh5WS6J/aHobLLiZP95iK2yC5w=; b=OFxFszj3AE00U8A3pwNY2DUFxt
	qaJx0TcEJApBdHuKFiUP2ggqfJDxYbrwfM7D2tvEUssWUMGlpfScJdTYdaZYW5Ds81Q67Twu2Ruuj
	kUfORdbufhhXzAYJ0l0iFZufsXJ+BjMRB/RFBXf788/Ee2j9ML9M1U24vaZpfogwUbjMmewRg8pTd
	1OIKCKIuVZ/7WyW7spmC9z3uIosf1gM7W2AwpZ8ITdEYo4z6VUCNvAuwC03/W7ccLgY0HPDyStsA3
	RHRE6G1bjuQO3uU4Ug0cMoYexRevFzEeFB6Kd8FCSlJl6gP3UQwWAkE88HytFAmPCkj55vxQrI7zh
	RQQLzFyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t82s9-0000000EuyG-48N1;
	Mon, 04 Nov 2024 19:36:22 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t82nT-0000000EuIj-2us3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 19:31:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1730748688; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dxHa7neOBuldoQyk7+LeqYcy2eYpS3dD0yFEg15V0RqOqoCGO7wUchG0wP2mXnmsfYmuHpiZlV4OF3SdiiJLyiD6KevyNaymGAYdCBJ9T0galr75UM5OUpn+zsOqokc85XtPIhePlIbxteBHEl8REo0fKJ4M34ijMYxdh27Vw68=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730748688; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+dW54Pjy9QLvSEzlVVh5WS6J/aHobLLiZP95iK2yC5w=; 
	b=JwuUp0rBXR/W+b0bxHdWqqeaSbcwbzSTkURgxAANmcFOnupF2ElBr4XmVNo4BJEm4S/0KG+awMqvvKROcHKImIYJtZbjAplbo5o3wV0udopUF0PsEpbmauNVU4L+q2y5MLR3LABee17v7xsed25JMIMYiOd+XcdxnJ8Bn9nkf48=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=denys.f@collabora.com;
	dmarc=pass header.from=<denys.f@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730748688;
	s=zohomail; d=collabora.com; i=denys.f@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=+dW54Pjy9QLvSEzlVVh5WS6J/aHobLLiZP95iK2yC5w=;
	b=gzTGd5e117aWUhbGTO4I1xYXRDMZpps6HBgMhYPLUeA0HKLoqE6ZomzdkWEqKAdL
	emf8ZVa/ndXyK0D7aFwt7vZjQHvxj8DsOR3SyDAIw7f8znUM2w6abdsk93Q1F5GwW0y
	ZCVUnYtDUssfRYHBtU9ksDbH/5R4fu+dIRm6hs5E=
Received: by mx.zohomail.com with SMTPS id 1730748685831588.0351303906986;
	Mon, 4 Nov 2024 11:31:25 -0800 (PST)
Message-ID: <a7e8a07cafbb1bcd215a7e9cc30351f6e028ee38.camel@collabora.com>
Subject: Re: arm64/for-kernelci baseline: 14 runs, 4 regressions
 (v6.12-rc5-158-g5283dc78f4da)
From: Denys Fedoryshchenko <denys.f@collabora.com>
To: kernelci-results@groups.io, will@kernel.org, "kernelci.org bot"
	 <bot@kernelci.org>
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org, 
	kernel-build-reports@lists.linaro.org
Date: Mon, 04 Nov 2024 21:31:22 +0200
In-Reply-To: <20241104105548.GA11039@willie-the-truck>
References: <67254346.170a0220.36a303.e8c0@mx.google.com>
	 <20241104105548.GA11039@willie-the-truck>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_113131_809885_C3897393 
X-CRM114-Status: UNSURE (   9.55  )
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

On Mon, 2024-11-04 at 10:55 +0000, Will Deacon via groups.io wrote:
> On Fri, Nov 01, 2024 at 02:08:22PM -0700, kernelci.org bot wrote:
> > arm64/for-kernelci baseline: 14 runs, 4 regressions (v6.12-rc5-158-
> > g5283dc78f4da)
> >=20
> > Regressions Summary
> > -------------------
> >=20
> > platform=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | arch=C2=A0 | lab=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | compiler |
> > defconfig | regressions
> > ---------------------------+-------+-------------+----------+------
> > -----+------------
> > qemu_arm64-virt-gicv2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | arm64 | lab-broon=
ie | gcc-12=C2=A0=C2=A0 |
> > defconfig | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > qemu_arm64-virt-gicv2-uefi | arm64 | lab-broonie | gcc-12=C2=A0=C2=A0 |
> > defconfig | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > qemu_arm64-virt-gicv3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | arm64 | lab-broon=
ie | gcc-12=C2=A0=C2=A0 |
> > defconfig | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > qemu_arm64-virt-gicv3-uefi | arm64 | lab-broonie | gcc-12=C2=A0=C2=A0 |
> > defconfig | 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
>=20
> Any chance of getting "lab-broonie" onto a version of QEMU containing
> [1]?
Yes, i opened issue
https://github.com/kernelci/kernelci-core/issues/2733
We will try to add devices this week, and if they get tested ok, i will
push to production next week monday.



>=20
> Will
>=20
> [1]
> https://lore.kernel.org/qemu-devel/20241017172331.822587-1-peter.maydell@=
linaro.org/T/#u
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Groups.io Links: You receive all messages sent to this group.
> View/Reply Online (#58208):
> https://groups.io/g/kernelci-results/message/58208
> Mute This Topic: https://groups.io/mt/109342716/6902820
> Group Owner: kernelci-results+owner@groups.io
> Unsubscribe:
> https://groups.io/g/kernelci-results/unsub=C2=A0[denys.f@collabora.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20
>=20


