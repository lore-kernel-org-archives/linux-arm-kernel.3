Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E93BC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 05:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6pnARJWU8Hn/XLwXN42+gQ7sps7ZUuWfUhevWLlNNPg=; b=C3gOg1rDACMG+1tDyNBH1l92Sx
	/Ijnorlva4CreuuZ6IT1ng/shCPcYTNKYgR43Wst1bOAdMYka1SdU+BX+fDUgJUBpTtf5HBIAl91z
	1Qrwfc9W/iy1lVNW59FESiKnMNhBbWHE3NsN5vWns7h3qg15H6t4U/24z29NCUmF2ozvXRKvDo+My
	NeJS8D8QNAtqRKN4uSWngzMqmUyqUFRKI/eynhj3vAcdoG+DB+5G2WaT+h6lHxrXdBg2nnClTf7ta
	ncRjQwsdXNlB1PaF4+qXn+ejZvqpPjjjpSo+bClE/JvmEc0TS/c6n1/vpmTXrqyIYP8HrCagzj0qi
	XWmC4pAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6M7f-00000005Jfx-0q2B;
	Tue, 15 Sep 2026 05:54:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6M7Z-00000005Jf1-1ztS
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 05:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6pnARJWU8Hn/XLwXN42+gQ7sps7ZUuWfUhevWLlNNPg=; b=il4wHl5nHTIBamheGMio+wpzQB
	02BCWxqCcll1g9WH0hH92BI0r2kv1j8JVy688lszQ7UEB+mwL3L0gCez5o5o7o200Ow4xshJi+S1T
	/9h2UGz9TqVbSdaUlmmQvwj0lff6MWtnjdk45MGNiCXh09MSRiThmNaFCDC9OZTX1avC8TAXmS7O/
	M78RO336PpDCR4ZmvePtZPETJI6qOj6yeIsqroF4kYX82J/yFO6XV4mGB2CizIs/r6ZX7gmvxcVth
	BCuvH38X5WylFI8a8d48h2ol2HBtLFUCXeJ6JNbnGyWHYaWBwcilMtZzy8dgl9rDp/O2hrAaS6jT1
	r3uzFkQg==;
Received: from [203.254.224.24] (helo=mailout1.samsung.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6M7T-00000006J6p-48n4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 05:54:19 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260915055405epoutp01f79065d164bddb2541213de4f7b1d90d~VaMpXB4GN1550615506epoutp010
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:54:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260915055405epoutp01f79065d164bddb2541213de4f7b1d90d~VaMpXB4GN1550615506epoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789451645;
	bh=6pnARJWU8Hn/XLwXN42+gQ7sps7ZUuWfUhevWLlNNPg=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=F3aR4IMx/qlMGya5Xr0xNdL4TM9u53nAUc3/581RY3B5kcT8G1qHipkiClM6AnGv9
	 qOfCc8mW1NW5RZ0VvZj41ThXyPaB5mMRVLZuFF5dSbe7E++tYWmK34Xt3labPalbKw
	 ZoD3NSLlD4SFVRbR7y+BOBtJmLe6xC3iA+o/TNzw=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260915055404epcas5p27df422b565f6cdd3834007c781f48090~VaMoi1tW-1755617556epcas5p2R;
	Tue, 15 Sep 2026 05:54:04 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.94]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4hkWRb1vf6z2SSKn; Tue, 15 Sep
	2026 05:54:03 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20260915055402epcas5p1d4131ca25d791c6e4ba38ced99f1e29d~VaMnCxL-F1505315053epcas5p1m;
	Tue, 15 Sep 2026 05:54:02 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20260915055400epsmtip137fa43b73213458bcb593794a8e06add~VaMk7hdm70286302863epsmtip1j;
	Tue, 15 Sep 2026 05:54:00 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Selvarasu Ganesan'" <selvarasu.g@samsung.com>, <vkoul@kernel.org>,
	<neil.armstrong@linaro.org>, <krzk@kernel.org>, <peter.griffin@linaro.org>,
	<pritam.sutar@samsung.com>, <andre.draszik@linaro.org>, <kernel@lvkasz.us>,
	<linux-phy@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Cc: <jh0801.jung@samsung.com>, <dh10.jung@samsung.com>,
	<akash.m5@samsung.com>, <muhammed.ali@samsung.com>, <thiagu.r@samsung.com>
In-Reply-To: <20260831070309.158069-1-selvarasu.g@samsung.com>
Subject: RE: [PATCH] phy: exynos5-usbdrd: Use dynamic phy_cfg size to
 prevent OOB access
Date: Tue, 15 Sep 2026 11:23:58 +0530
Message-ID: <01e001dd44d6$9c203730$d460a590$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQGKDVFXPtvwg5u1EEO2Agv0acLiRgJK+Mort2M6G0A=
Content-Language: en-us
X-CMS-MailID: 20260915055402epcas5p1d4131ca25d791c6e4ba38ced99f1e29d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0
References: <CGME20260831070349epcas5p4c62a4e46592dffe95723ddd51a6068e0@epcas5p4.samsung.com>
	<20260831070309.158069-1-selvarasu.g@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_065417_280476_91B2C079 
X-CRM114-Status: GOOD (  16.82  )
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

Hi Selvarasu

> -----Original Message-----
> From: Selvarasu Ganesan <selvarasu.g=40samsung.com>
> Sent: Monday, August 31, 2026 12:33 PM
> To: vkoul=40kernel.org; neil.armstrong=40linaro.org; krzk=40kernel.org;
> peter.griffin=40linaro.org; alim.akhtar=40samsung.com;
> pritam.sutar=40samsung.com; andre.draszik=40linaro.org; kernel=40lvkasz.u=
s;
> linux-phy=40lists.infradead.org; linux-arm-kernel=40lists.infradead.org; =
linux-
> samsung-soc=40vger.kernel.org; linux-kernel=40vger.kernel.org
> Cc: jh0801.jung=40samsung.com; dh10.jung=40samsung.com;
> akash.m5=40samsung.com; muhammed.ali=40samsung.com;
> thiagu.r=40samsung.com; Selvarasu Ganesan <selvarasu.g=40samsung.com>
> Subject: =5BPATCH=5D phy: exynos5-usbdrd: Use dynamic phy_cfg size to pre=
vent
> OOB access
>=20
> The probe loop currently iterates using EXYNOS5_DRDPHYS_NUM (2),
> creating both UTMI and PIPE3 PHY instances regardless of the SoC capabili=
ty.
> Several SoCs (Exynos2200, Exynos7870, Exynos850, Exynos990, and
> ExynosAutoV920) provide phy_cfg arrays containing only a single element.
>=20
> On these SoCs, when the loop reaches index 1, the driver reads past the e=
nd
> of the rodata array, populating the second PHY instance with garbage data=
.
> Since the configuration structure contains critical function pointers (ph=
y_isol,
> phy_init, set_refclk), any subsequent access to this PHY instance via
> exynos5_usbdrd_phy_xlate could result in a kernel oops.
>=20
> Fix this by adding 'n_phy_cfg' to struct exynos5_usbdrd_phy_drvdata to
> store the actual size of the phy_cfg array for each SoC. Update the probe
> loop and the xlate function to bound their access against this value inst=
ead of
> the hardcoded EXYNOS5_DRDPHYS_NUM.
>=20
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Selvarasu Ganesan <selvarasu.g=40samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar=40samsung.com>


