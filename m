Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCFFC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 06:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcqtFrXlhmcs0tO7hoxuK5bQDsVASZTvkmxva8sAz+A=; b=OOL0tLQNYqNIxl3S9mYtfqOos7
	Jd7CRdXnOUryD/nxFw+IAvnxQ3oZthcmsY8cHnJ+FeclpnnUzuR+CpJWCo5lmBbYv2+Q0N19fyQUf
	2Vzoqcl4nbnG73PN+0mYBbvqyu5SpC7Au7aRsL98PPjuaEZN4A5mEC88zxETlGkZSUyy9iTDEewgk
	3hKeVk+oUiXVc28mzQ2mj4oKX03f54csXVIMZgFW4UEVYRzQUKh2pzmLbTE2+l3r6hGFZJMAyZAb1
	xgz4byTQbl019BPhqUAsquCSJ39InhARYTL5YywpstBBMbsC+iq6ksThHdH+gFskTPet5oitO0Bzv
	aSds2yRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uepBJ-00000006a5U-161G;
	Thu, 24 Jul 2025 06:11:53 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueoyO-00000006Z6n-3AWP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 05:58:34 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250724055827epoutp02ade20a3b9a00a44733c680b46d105063~VGnIkPHD83000930009epoutp02g
	for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 05:58:27 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250724055827epoutp02ade20a3b9a00a44733c680b46d105063~VGnIkPHD83000930009epoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753336707;
	bh=PcqtFrXlhmcs0tO7hoxuK5bQDsVASZTvkmxva8sAz+A=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=mYsbzx7NewkaXVHZQGfW9TW0WA+ptzFmKbQ8dycQfbVrQs6FWG7WHUqo/gcxB/9A5
	 LkFMaaUpT8f227bCdpaUrSjoF7NCh1tlREo2Ktvcqfwv0ac4DD4RnEseV/55vY8Zmb
	 LJmganNukGgVm+kQQsrJW3g/AnuvQsnJqIkDnby8=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250724055826epcas5p446cf77b5301b2e805b8b626dab172725~VGnH7j8ho2262122621epcas5p4q;
	Thu, 24 Jul 2025 05:58:26 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.89]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bngKY4JZLz2SSKj; Thu, 24 Jul
	2025 05:58:25 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250724055825epcas5p1b0b35277e5ded326d4377a3521f10179~VGnGbZnzb0629006290epcas5p1_;
	Thu, 24 Jul 2025 05:58:25 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250724055824epsmtip1ec26a66e718f21098113071d7d8beaea~VGnFYqVnU3176031760epsmtip12;
	Thu, 24 Jul 2025 05:58:23 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Sangwook Shin'" <sw617.shin@samsung.com>, <krzk@kernel.org>,
	<wim@linux-watchdog.org>, <linux@roeck-us.net>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20250714055440.3138135-6-sw617.shin@samsung.com>
Subject: RE: [PATCH v3 RESEND 5/5] watchdog: s3c2410_wdt: exynosautov9:
 Enable supported features
Date: Thu, 24 Jul 2025 11:28:22 +0530
Message-ID: <2b5f01dbfc5f$f7fb5d20$e7f21760$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-us
Thread-Index: AQIEaJ+ioIR5Yp9zWAA/UcLZjjUhMgLwxs4UAgINVK+zyFf1UA==
X-CMS-MailID: 20250724055825epcas5p1b0b35277e5ded326d4377a3521f10179
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055900epcas2p1f082e73f1f30f7b3ec8e38c6f6501d61
References: <20250714055440.3138135-1-sw617.shin@samsung.com>
	<CGME20250714055900epcas2p1f082e73f1f30f7b3ec8e38c6f6501d61@epcas2p1.samsung.com>
	<20250714055440.3138135-6-sw617.shin@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_225832_958259_DC9571A7 
X-CRM114-Status: UNSURE (   9.90  )
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



> -----Original Message-----
> From: Sangwook Shin <sw617.shin@samsung.com>
> Sent: Monday, July 14, 2025 11:25 AM
> To: krzk@kernel.org; alim.akhtar@samsung.com; wim@linux-watchdog.org;
> linux@roeck-us.net
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; linux-watchdog@vger.kernel.org; linux-
> kernel@vger.kernel.org; Sangwook Shin <sw617.shin@samsung.com>
> Subject: [PATCH v3 RESEND 5/5] watchdog: s3c2410_wdt: exynosautov9:
> Enable supported features
> 
> Enable supported features for ExynosAutov9 SoC.
> - QUIRK_HAS_DBGACK_BIT
> - QUIRK_HAS_32BIT_MAXCNT
> 
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>



