Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8471CC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 07:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8vtyMqN7BBl94yLtrpE133kapPVMyCygmknIpKLTZQ8=; b=2VCIjMVvLCtR+qa3AYZK/uc1ST
	EccAGYEqUrMputC9ozTkSqQ5QAhiCAl7JhpHSRpYl84f/cHNtba8Ir2UY3kWto/R4OiR92pMnMCGw
	X1rHBfdxAiouzOZ9Oz+7ZghYjGmdU91cPVk4zeXMNeUKuoIcUDlUX/fQrqyFRuw1NdXk/D9Zb1aD3
	OcnCVS5VOuIpwLfWhOosdsW2RiM/Ic7AUz/Xhw7mu82x7Lb4OtzR6HTvA4QKbTXkuqm/CWxk/C9e4
	M+0kd5sY8GUpY6r6Q5e8sqq086mIpdE34mbtQteVHjSL7+2JXzb9c+jdeQC1JFaqJ/GJ8wZdA4fnR
	2iVpQmPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujC6W-0000000C1Pv-1Tk9;
	Tue, 05 Aug 2025 07:29:00 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujC3s-0000000C19F-1Had
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 07:26:18 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250805072610epoutp02c4045f4682ceeeb586c65897b65920f4~YzjJLBgNi2261422614epoutp02f
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 Aug 2025 07:26:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250805072610epoutp02c4045f4682ceeeb586c65897b65920f4~YzjJLBgNi2261422614epoutp02f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754378770;
	bh=8vtyMqN7BBl94yLtrpE133kapPVMyCygmknIpKLTZQ8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=RNPy6bg+Fs/jsy4qN/qnWzqrncRwoQ4eTk7b9NqY6hEG3TZajeRK9RlVsltmHRn/o
	 kntzv3/pogUM/z1sQRyPmKrf72DRgrfpO9UpPaD0XHnoatH+0SK+PP0r5jcMgXYE3U
	 vEZeg1dhFWJ+nKtrk6UnkQHH/oow8fvuSrGsh+cs=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250805072609epcas2p3d840144f6c0c778395d6483e25a7c47d~YzjI2Lt0X2580225802epcas2p3R;
	Tue,  5 Aug 2025 07:26:09 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.89]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bx4jF23Txz6B9mQ; Tue,  5 Aug
	2025 07:26:09 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250805072608epcas2p4afbd5db258530d696c80e4007749953d~YzjHnrh3Z2393223932epcas2p4q;
	Tue,  5 Aug 2025 07:26:08 +0000 (GMT)
Received: from KORCO180836 (unknown [12.36.150.245]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250805072608epsmtip13df80963802621da648f1f1b2ba181f8~YzjHjiOlZ1882618826epsmtip1i;
	Tue,  5 Aug 2025 07:26:08 +0000 (GMT)
From: <sw617.shin@samsung.com>
To: "'Sam Protsenko'" <semen.protsenko@linaro.org>, "'Guenter Roeck'"
	<linux@roeck-us.net>
Cc: <krzk@kernel.org>, <alim.akhtar@samsung.com>, <wim@linux-watchdog.org>,
	<khwan.seo@samsung.com>, <dongil01.park@samsung.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-samsung-soc@vger.kernel.org>,
	<linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <CAPLW+4kVMo68DAO0y_=m3k81Xeh4wYV9+KX3fg=5S7xwOh0O7Q@mail.gmail.com>
Subject: RE: [PATCH v4 2/4] watchdog: s3c2410_wdt: Fix max_timeout being
 calculated larger
Date: Tue, 5 Aug 2025 16:26:08 +0900
Message-ID: <008501dc05da$36362600$a2a27200$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQH0xghtQJzMk6eIf2JQ+3VnAplQzQKQWbtpAWsaNKYBwwrfwwEQ7YR8A5N0zr4BpLWR/LPB5rkg
Content-Language: ko
X-CMS-MailID: 20250805072608epcas2p4afbd5db258530d696c80e4007749953d
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_002616_680058_76DDC875 
X-CRM114-Status: GOOD (  14.59  )
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

On Tuesday, August 5, 2025 at 2:03 PM Sam Protsenko <semen.protsenko=40lina=
ro.org> wrote:

>=20
> > > +       u64 t_max =3D n_max / freq;
> > >
> >
> > Make sure this compiles on 32-bit builds.
> >
>=20
> Can you please elaborate what might be the possible problem -- just
> curious? I admit I never though about 32-bit case when writing that code,
> but don't see any immediate issues with that too.
>=20

In my opinion, it seems that Gunter Reck's explanation is correct.
I've found out that the error of =22undefined reference to '__aeabi_uldivmo=
d'=22 may occur when compiling new code on a 32-bit architecture.
If you don't mind, I would like to proceed with maintaining the previous re=
vision below.
=46rom my perspective, this approach appears to be the most reasonable solu=
tion for supporting both 32-bit and 64-bit architectures.

=40=40 -411,8 +411,8 =40=40 static inline unsigned int s3c2410wdt_max_timeo=
ut(struct s3c2410_wdt *wdt)
 =7B
 	const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
=20
-	return S3C2410_WTCNT_MAXCNT / (freq / (S3C2410_WTCON_PRESCALE_MAX + 1)
-				       / S3C2410_WTCON_MAXDIV);
+	return S3C2410_WTCNT_MAXCNT / DIV_ROUND_UP(freq,
+		(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV);
 =7D


