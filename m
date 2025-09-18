Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FB4CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 03:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AG+lskbMnjhh54sDPIao2BdJBgoYc2E3bPl5g1IWvfw=; b=izEHlaLXkdm+pIbOnaaiEj6cMc
	wbZEGcuqrNgrJnad21HO7Kf+9c0ZIATrJbjUVqbIM/VaBhLNp4FT1wrqHIwATV5Qv2f7RnJ3g++cU
	NCZfynNUmFqCA6vgyZNtVclveraoTwml6oGNV2pAhN0qDVn2Io4M56qCkowSLt4Y2Hn0e2c4vkT8G
	Ihf6y9AqqI0PXSFQHZ2AGnL7SDk1dBUbKYw8+5WcrV3IMygE/5B6V9qtCwtqiUGj0hiBuhlTRfvW4
	n2vKE19FiqhQR9LADwQ4CILxeaMgcGaBZqvYB6Z22KOZtNDO6fxCB+Vldw+SNlE3CQGQEvQfhSUIj
	XJXUZt8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz5iY-0000000GAtL-0MuD;
	Thu, 18 Sep 2025 03:53:58 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz5iU-0000000GAsc-372V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 03:53:56 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250918035349epoutp012b891a7821ae421a561d81be55a48a25~mRCS2-gJ71347013470epoutp013
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 03:53:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250918035349epoutp012b891a7821ae421a561d81be55a48a25~mRCS2-gJ71347013470epoutp013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758167629;
	bh=AG+lskbMnjhh54sDPIao2BdJBgoYc2E3bPl5g1IWvfw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=HXLeHgJ0Nue9BLNwdCgqYa9Z812NbcXqSTj0Oyy44T/GfAx7lN/3rSzj3kOjGjDNS
	 ekCdisc0bJVqC3PbICACosZ0Dq7DF9tefeZNHeaqOnPF28F+OugL6t6Jogs7yjxAJ/
	 j59IvV8JyariZRhPFac0DaigvHJz8EdHpDWlDag8=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250918035348epcas5p2b3ea48f90fd6e94736469d939870ccde~mRCSdRUnU1541615416epcas5p2F;
	Thu, 18 Sep 2025 03:53:48 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.95]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cS1vv5sk8z2SSKh; Thu, 18 Sep
	2025 03:53:47 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250918035347epcas5p345d313bce95bf0470d0969ebe30ec80c~mRCRKMjA51063310633epcas5p3N;
	Thu, 18 Sep 2025 03:53:47 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250918035344epsmtip15d917fc8385d42acf2d7a089c8c59471~mRCOOXWAx0317203172epsmtip1J;
	Thu, 18 Sep 2025 03:53:43 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sangwook Shin'" <sw617.shin@samsung.com>, <krzk@kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>,
	<semen.protsenko@linaro.org>, <dongil01.park@samsung.com>,
	<khwan.seo@samsung.com>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250818021826.623830-4-sw617.shin@samsung.com>
Subject: RE: [PATCH v6 3/5] watchdog: s3c2410_wdt: Increase max timeout
 value of watchdog
Date: Thu, 18 Sep 2025 09:23:41 +0530
Message-ID: <06c501dc284f$d5da8e70$818fab50$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQMf0cCJ9LyTM0wh7cHpv36iTCHVmgGBxYoXAhK/QGyx9FUV8A==
Content-Language: en-us
X-CMS-MailID: 20250918035347epcas5p345d313bce95bf0470d0969ebe30ec80c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250818022433epcas2p1bf8e6a335be945822721b8db1e9571e9
References: <20250818021826.623830-1-sw617.shin@samsung.com>
	<CGME20250818022433epcas2p1bf8e6a335be945822721b8db1e9571e9@epcas2p1.samsung.com>
	<20250818021826.623830-4-sw617.shin@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_205355_423767_0F0B66C8 
X-CRM114-Status: GOOD (  14.99  )
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

Hi Sangwook

> -----Original Message-----
> From: Sangwook Shin <sw617.shin=40samsung.com>
> Sent: Monday, August 18, 2025 7:48 AM
> To: krzk=40kernel.org; alim.akhtar=40samsung.com; wim=40linux-watchdog.or=
g;
> linux=40roeck-us.net; semen.protsenko=40linaro.org;
> dongil01.park=40samsung.com; khwan.seo=40samsung.com
> Cc: linux-arm-kernel=40lists.infradead.org; linux-samsung-soc=40vger.kern=
el.org;
> linux-watchdog=40vger.kernel.org; linux-kernel=40vger.kernel.org; Sangwoo=
k Shin
> <sw617.shin=40samsung.com>
> Subject: =5BPATCH v6 3/5=5D watchdog: s3c2410_wdt: Increase max timeout v=
alue of
> watchdog
>=20
> Increase max_timeout value from 55s to 3665038s (1018h 3min 58s) with
> 38400000 frequency system if the system has 32-bit WTCNT register.
>=20
> cat /sys/class/watchdog/watchdog0/max_timeout
> 3665038
>=20
> =5B    0.330082=5D s3c2410-wdt 10060000.watchdog_cl0: Heartbeat:
> count=3D1099511400000, timeout=3D3665038, freq=3D300000
> =5B    0.330087=5D s3c2410-wdt 10060000.watchdog_cl0: Heartbeat:
> timeout=3D3665038, divisor=3D256, count=3D1099511400000 (fffffc87)
> =5B    0.330127=5D s3c2410-wdt 10060000.watchdog_cl0: starting watchdog t=
imer
> =5B    0.330134=5D s3c2410-wdt 10060000.watchdog_cl0: Starting watchdog:
> count=3D0xfffffc87, wtcon=3D0001ff39
> =5B    0.330319=5D s3c2410-wdt 10060000.watchdog_cl0: watchdog active, re=
set
> enabled, irq disabled
>=20
> If the system has a 32-bit WTCNT, add QUIRK_HAS_32BIT_CNT to its quirk fl=
ags,
> and it will operate with a 32-bit counter. If not, it will operate with a=
 16-bit
> counter like in the previous version.
>=20
> Reviewed-by: Sam Protsenko <semen.protsenko=40linaro.org>
> Signed-off-by: Sangwook Shin <sw617.shin=40samsung.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>




