Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996DBC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 04:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YU3uFobEDt7UCHiGq89i23dmZccxqlh+VM2cnKCVKRQ=; b=DrZrFpeFfb6jLE8/qcZ1hzCJcU
	0ndsAoSf5P0+ONKEbVbYRYE8Racs6QCSRoN59E0BztacmAIAYeGNauFOYIRyYeYTcXAJXZrOXBctI
	ahhGCPJ/m3ir7eVX+DmOpwA1JNJfNnUIdFnE6LZrlGkhD3xwzBaLmemRIO6yvGK4UfPDrvqoqt3ud
	QJEmCdPYq85CzQsdvxoGl7bdkgGRMtWn6l4QrOKe6/sVQ5UtbSUqaBHPozJoLISFhvs5XTwUG/8xW
	o3986XYyPJHtXbJEdQhPmoMA4p6gPUdpo35fpwtANNcnLv2hwkCgWCsV0YqVFZQspF84nU5SAqirE
	WwxI5UPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujW9y-0000000EIJA-1oBu;
	Wed, 06 Aug 2025 04:53:54 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujW7Q-0000000EIEg-06Yd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 04:51:19 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250806045102epoutp04192603621eaa893e8be5a4b6e31ceda4~ZFE-Ch1w-2466024660epoutp04U
	for <linux-arm-kernel@lists.infradead.org>; Wed,  6 Aug 2025 04:51:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250806045102epoutp04192603621eaa893e8be5a4b6e31ceda4~ZFE-Ch1w-2466024660epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754455862;
	bh=YU3uFobEDt7UCHiGq89i23dmZccxqlh+VM2cnKCVKRQ=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=jr5wS6qoyXUUUyapJtuC/sEXHT6KHoIOpku1UzgGlPod23OVYzctfcMV1B/KX66iq
	 8kHWfekH2qCnwX9GWez0Dkpv1RaeoNxUBjfzZDuEAbGltQzltfm3Xm7Vfy5QukAVvU
	 SwKypBpZKDPD1xzsgIvQNSkrb8+xb0p6mwtPyECk=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250806045101epcas2p3f00ba8fa50537d7010600e037a49d7bc~ZFE_XFbdR2005420054epcas2p3-;
	Wed,  6 Aug 2025 04:51:01 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.68]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bxdCn40Vxz3hhT9; Wed,  6 Aug
	2025 04:51:01 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250806045100epcas2p4f12e6b71c1d6e474e049a9c22f4c9e3d~ZFE9Uzwwh0063400634epcas2p4q;
	Wed,  6 Aug 2025 04:51:00 +0000 (GMT)
Received: from KORCO180836 (unknown [12.36.150.245]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250806045100epsmtip27d9e91b14160102a5feba58a6b8eb732~ZFE9Q6bIV0726907269epsmtip2G;
	Wed,  6 Aug 2025 04:51:00 +0000 (GMT)
From: <sw617.shin@samsung.com>
To: "'Sam Protsenko'" <semen.protsenko@linaro.org>
Cc: "'Guenter Roeck'" <linux@roeck-us.net>, <krzk@kernel.org>,
	<alim.akhtar@samsung.com>, <wim@linux-watchdog.org>,
	<khwan.seo@samsung.com>, <dongil01.park@samsung.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <CAPLW+4mNejXUMW0VqZW8hieNUFmDqS_-qqE=p+bV4TnwM_TWgw@mail.gmail.com>
Subject: RE: [PATCH v4 2/4] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
Date: Wed, 6 Aug 2025 13:51:00 +0900
Message-ID: <01e001dc068d$b4b94b70$1e2be250$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH0xghtQJzMk6eIf2JQ+3VnAplQzQKQWbtpAWsaNKYBwwrfwwEQ7YR8A5N0zr4BpLWR/AENAjt5APhqm1WzsyI8gA==
Content-Language: ko
X-CMS-MailID: 20250806045100epcas2p4f12e6b71c1d6e474e049a9c22f4c9e3d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250724081336epcas2p38e95932ddc5c702e05a6436f05582993
References: <CGME20250724081336epcas2p38e95932ddc5c702e05a6436f05582993@epcas2p3.samsung.com>
	<20250724080854.3866566-1-sw617.shin@samsung.com>
	<20250724080854.3866566-3-sw617.shin@samsung.com>
	<CAPLW+4nRh9DEnkhunG68xvGdaNJswC8fN4v4uBA1Aaao_5pxfw@mail.gmail.com>
	<000a01dc05c0$9f0ab110$dd201330$@samsung.com>
	<18adfcd0-e955-4c3f-a68a-6a2f75ebd24d@roeck-us.net>
	<CAPLW+4kVMo68DAO0y_=m3k81Xeh4wYV9+KX3fg=5S7xwOh0O7Q@mail.gmail.com>
	<008501dc05da$36362600$a2a27200$@samsung.com>
	<CAPLW+4mNejXUMW0VqZW8hieNUFmDqS_-qqE=p+bV4TnwM_TWgw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_215116_370814_7454F3F2 
X-CRM114-Status: GOOD (  12.40  )
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

On Wednesday, August 6, 2025 at 7:53 AM Sam Protsenko <semen.protsenko=40li=
naro.org> wrote:

>=20
> I don't mind, although it's quite easy to fix the code I suggested by
> replacing this line:
>=20
>     u64 t_max =3D n_max / freq;
>=20
> with this one:
>=20
>     u64 t_max =3D div64_ul(n_max, freq);
>=20
> from <math64.h>, as Guenter suggested. But I'm totally fine with your
> implementation as well.

Sam Protsenko and Guenter Roeck, thank you for your kind advice.
As you mentioned, I will proceed with the following code for the next patch=
 set.

=40=40 -27,6 +27,7 =40=40
 =23include <linux/mfd/syscon.h>
 =23include <linux/regmap.h>
 =23include <linux/delay.h>
+=23include <linux/math64.h>

 =23define S3C2410_WTCON          0x00
 =23define S3C2410_WTDAT          0x04
=40=40 -410,9 +411,13 =40=40 static inline unsigned long s3c2410wdt_get_fre=
q(struct s3c2410_wdt *wdt)
 static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 =7B
        const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
+       //(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV =3D 0x800=
0
+       u64 t_max =3D div64_ul((u64)S3C2410_WTCNT_MAXCNT * 0x8000, freq);

-       return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX +=
 1)
-                                      / S3C2410_WTCON_MAXDIV);
+       if (t_max > UINT_MAX)
+               t_max =3D UINT_MAX;
+
+       return t_max;
 =7D


