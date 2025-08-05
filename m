Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA305C87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 04:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dYOmk++d7CASSvlIW8u4QMsdypGYRvSYn8mi2FnZsnw=; b=rcTJpTEEAXEmjl/mK3xFlYBPzx
	jWiEpHUyr0luKMvAULdjdRMDxmmF+W0BD4/34UBP6vzo3v99W7xZklUrsegJmQ1WjDG3bMDMgMD5u
	XGIae+ddk+p+97/owmg1rSyeLpEjedGIUfzoQ5jdvztIhcRrRooMCFZW9SViRZCaBA3zRz+7cZvjx
	4fo8YlPE7VtjUf+6SxZ+8ylZWaGkdcQofosby/SLK3EGclutaheisd71zSSD7v7i0awLuUpylHOwI
	51vSqNMV4WSvF/DPqE0/46c9r/6FhhvCdO9n1R2L+OPaw19fh878XLO0hZgUibYuDKE/H4k4tYntK
	1CKBt3ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj9FI-0000000BkGr-01S4;
	Tue, 05 Aug 2025 04:25:52 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj9Ch-0000000Bk3Z-0mpP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 04:23:13 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250805042259epoutp0270326cdc14e7e5fa3bd21827ef214b15~YxDNh6Cpp0194501945epoutp02S
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 Aug 2025 04:22:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250805042259epoutp0270326cdc14e7e5fa3bd21827ef214b15~YxDNh6Cpp0194501945epoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754367779;
	bh=dYOmk++d7CASSvlIW8u4QMsdypGYRvSYn8mi2FnZsnw=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=ubkh80zGGacpBKtPqHK4g+eF4TdnmFD8gKTFMcafYfhycc1ngt4iJRN4ZqRKcXZF/
	 qPewIL0AEd0gs0Ms1497LBVxAOcui4FJbLkVQBpBLr6buz85zxOsf8vOmxmZwenrDR
	 8M0Uj5VXtcVvZFbq/Ms5affHB8q9+x+e50lKgAHQ=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250805042259epcas2p3a3c30bbe884d5f154777b431b94be1fa~YxDMw1Kf82531325313epcas2p3u;
	Tue,  5 Aug 2025 04:22:59 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.97]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bx0dt22cDz6B9mD; Tue,  5 Aug
	2025 04:22:58 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250805042257epcas2p1be233a189b619f4b6fc2253931a2dfc5~YxDLadew41226612266epcas2p1d;
	Tue,  5 Aug 2025 04:22:57 +0000 (GMT)
Received: from KORCO180836 (unknown [12.36.150.245]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250805042257epsmtip22d4312d31b3c174c806adc6fe9821709~YxDLWqroy2523925239epsmtip2E;
	Tue,  5 Aug 2025 04:22:57 +0000 (GMT)
From: <sw617.shin@samsung.com>
To: "'Sam Protsenko'" <semen.protsenko@linaro.org>
Cc: <krzk@kernel.org>, <alim.akhtar@samsung.com>, <wim@linux-watchdog.org>,
	<linux@roeck-us.net>, <khwan.seo@samsung.com>, <dongil01.park@samsung.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <CAPLW+4nRh9DEnkhunG68xvGdaNJswC8fN4v4uBA1Aaao_5pxfw@mail.gmail.com>
Subject: RE: [PATCH v4 2/4] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
Date: Tue, 5 Aug 2025 13:22:57 +0900
Message-ID: <000a01dc05c0$9f0ab110$dd201330$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH0xghtQJzMk6eIf2JQ+3VnAplQzQKQWbtpAWsaNKYBwwrfw7Pz5ruw
Content-Language: ko
X-CMS-MailID: 20250805042257epcas2p1be233a189b619f4b6fc2253931a2dfc5
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_212311_881883_BE1B61DF 
X-CRM114-Status: GOOD (  15.86  )
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

On Saturday, August 2, 2025 at 1:12 PM Sam Protsenko <semen.protsenko=40lin=
aro.org> wrote:

> How about something like this instead?
>=20
> 8<--------------------------------------------------------------------->8
> static inline unsigned int s3c2410wdt_max_timeout(unsigned long freq) =7B
>     const u64 div_max =3D (S3C2410_WTCON_PRESCALE_MAX + 1) *
>                 S3C2410_WTCON_MAXDIV; /* 32768 */
>     const u64 n_max =3D S3C2410_WTCNT_MAXCNT * div_max;
>     u64 t_max =3D n_max / freq;
>=20
>     if (t_max > UINT_MAX)
>         t_max =3D UINT_MAX;
>=20
>     return (unsigned int)t_max;
> =7D
> 8<--------------------------------------------------------------------->8
>=20
> This implementation's result:
>   - is never greater than real timeout, as it loses the decimal part afte=
r
> integer division in t_max
>   - much closer to the real timeout value, as it benefits from very big
> n_max in the numerator (this is the main trick here)
>   - prepared for using 32-bit max counter value in your next patch, as it
> uses u64 type for calculations
>=20
> For example, at the clock frequency of 33 kHz:
>   - real timeout is: 65074.269 sec
>   - old function returns: 65535 sec
>   - your function returns: 32767 sec
>   - the suggested function returns: 65074 sec

Thank you for your feedback.
I'll make the code changes as follows in the next patch set:

static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 =7B
        const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
+       const u64 div_max =3D (S3C2410_WTCON_PRESCALE_MAX + 1) *
+                       S3C2410_WTCON_MAXDIV;
+       const u64 n_max =3D S3C2410_WTCNT_MAXCNT * div_max;
+       u64 t_max =3D n_max / freq;

-       return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX +=
 1)
-                                      / S3C2410_WTCON_MAXDIV);
+       if (t_max > UINT_MAX)
+               t_max =3D UINT_MAX;
+
+       return (unsigned int)t_max;
 =7D


