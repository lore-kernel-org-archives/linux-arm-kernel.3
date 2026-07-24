Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5914CC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=; b=i7iLmubbkZafHly6G1qxfYmvtA
	5uNfRthRah9Q3WCas/K/4i/5dCVs14XlEl1F7yx9x9RC8vB8tTtsRiEnkqP2awK742A7f3fYt5es3
	/RT8v7eXuMjepURtajHDApG4ccooV8j8WJL+a8J3ckYr635ww1tI8+el6QuxhY+WpVYqfUHiWeAPr
	mlQ5qVmTrsglXQIxBLYsMyQd0K6g3hbpptP6coC3m2gOohnnxJCDYa8msbzitu27Fwp9m83iqpBTp
	eVtiz1MwPqlGume4aeUY7y+2+cOwhIBF4y0qqt8c2wZP0WPf1Q3cVgNP2JIIv7a0BiQLGMWGNFIbj
	mY6/4iPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHUR-0000000GeDD-3Jwb;
	Fri, 24 Jul 2026 15:07:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHUP-0000000GeCM-2Cll
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 15:07:06 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbSve2710903
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=; b=CMNYH8YKsP0vLnKa
	kg5kejSOcOGDDykg6w4NaAMhIZjMwg5Hvpg2qVVAeGFA6SXIkFXHAI/V9jYZZTSy
	RttEgtp4bwm6aE9p1KGLNE0/MB+O/oivlVfzYqqXeDZ/TYz39Fv1fPEUWjQMmKmB
	ZOhZL4fM89UgzYGiONz5xZQQ8LEp9cpVqsU7E9WNOiG8/iFseatouKgfxZnlVqh6
	rWFhOjCyVDJkJyyzui4Pk9uGykx+T9GFLHJOTV+t4bciz5za3v7JZndxoHiqDk4w
	c6pEZ4xZYfHEQPLIJ2zTQeesRUAuDTSkH8JP6vyj4qfAeEMOO27lPxff5lNMPRVs
	QuKvrQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cggh6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:07:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e8004d60eso84891985a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 08:07:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784905624; cv=none;
        d=google.com; s=arc-20260327;
        b=TakHLDIaZ60IhMZbG/jg8/83Tn6pABX1SwTSKXRjILttM4poxRP8CFFvmtXlPB3mQz
         VIcisyKWDLWf6gHl+Tkr0UlTRFmMy6ylxc3O0lm9Y2D94CN0WyUP4kb5z76d6YZsAd3h
         A/f0IyzH97NaLtdOanBKClO4XXVVthutx/5BDuXmGBqwIA7TCBhe5hDGr3W3cZVEvsXa
         Dp7ZMumkdMLxnaii2bh8zfZRfwxTMWeNMU6RGHr1BdPd3X9V4s/S1zC7C8K17+UG+84w
         LO+o4fwvVsTJyYRNgkzhFhOvwwe0fpyyRVqIIhJpGKReHYjXHOvoN5WqGZs/hW5OvsST
         zqSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=;
        fh=f8iChLSifedLUCXiSPV+Qf2jv0QmsHUMFbYF33XNe38=;
        b=rTkLrg1qcME23JmcfKDY7hkZXaOKF5HQYP3Cmi2GRISKT3qMDI7FrhVBZXD7biiJzA
         R7uL4vzKIgBi7emvMs4VAdIzgj9na8AiO0jmdKwnM8jN51YhWRuZSz8ZZ4JdGPSDN4u2
         EccR7UBy72OFwuBi76WBXOXcBYmEWrhvnklU2EkOQ+5Y6xEfpCbB6e0aQamvpoNYK0eY
         8v8XsjFgg/1W0ThtwPN1BChA9eOD+fTDHUrAjty4IN9g5iseJIqPd87xsb9UMTED+7ul
         LpHu8J29HZ/dgU+G3SfiGk4cdVNQ7arGM+O2Q+HNMOEq3LKSn3huoewtNt3uVupP72mK
         pMVQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905624; x=1785510424; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=;
        b=SxShs5vZe3/xc2dgYZ66vRlDIrHbjn+/MWE/e/C+TtRcG8QONXfHdvoTJTXHJd0vrb
         4ayu9lZnqdDrFgGl7qD4Ar6lJsl1cdeiwkb65ExPBhhcNGTEFpD0nLXdZFsY1u5KA3t5
         ouljKHsMZp/EB1zOM6ZQ9v5KLaXibD5ueuJMxhc2H5lazFnIlA2HjCAEJNvCp8h9Zqql
         6oku0LjUEnWMB8Xew2eQG+pK1sg5r6vGdqZnO+hdCFAvv63Oq5L7CgiYy3m2IrTDC0x7
         v8bZIWjUrkrZANAoy83s3VXrfB/AptQwkmCqclsZpqOcR4sX5zPuGcTzoy6AJEvC8R4T
         TJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905624; x=1785510424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6iZwoWyplh10gQFqizgnNT67wlnEGukSQwIPfNxV3K4=;
        b=iQgDM2cxko4KrimQTQYrPP30DKD3fSckRSAUj4wJrG6KXv7EHRCqTl6sf8oG/RvH3m
         hc/T3xex5INbQ0g3kz2b1hNICS9Bn+jGuMllY1yuZH16vIH5/hbMvj4eljEr8dFs1nCv
         U9fvLbEloSYSNHwpExdMVOU7BRN7KCaCDPzaEDmGK5Dc/vNfkhHvt9ZwynuSRF7kIPIc
         +uAS6wp7rssl5Opdueeoe1hGgtiN6SVcYRISR5OoL/xfmdot3ZpPwMgsEyR8k116Hbf8
         Y9+lP94N1DxtL2lWH7Fseaoc7HhlejeOOg2/xN5UTvWPS5zsa7xsKLKLIh3kE8auhCNr
         9NRA==
X-Forwarded-Encrypted: i=1; AHgh+RoiNGpP373qFDyTU5xgWsY+HP9SfVDi0Gc6eaT9DwofnvnHpKmNcWn6UdE4hbd5hlCizik1eMBXoVymLMLEKjl0@lists.infradead.org
X-Gm-Message-State: AOJu0Yybc/oR15xGg5WEJoPjFrqAxurO+kfOerZFxQG9pFIBaPousLC4
	zj1x3Pi9Iekht2+cJ/Gb82Xnn82y3j4wCdHpnsh7QJWrvSuVXLgJUC5L5KRDJPgF6u/CyE+AtZg
	5Hnm3e+BNuQQMYlQgV2VLjnA6TFJWZl1wHUCn+/krOQ6cAgQd6nvMAUZxsbG9wkiZBF7nJTQgwL
	pF7ZO1LAD5f8KoON2ZNs7RimI7qJKYrbqRpq3uUjyrA0e9FS23OYsnqL8D8D0G
X-Gm-Gg: AR+sD13sHU5IDShpMIZ7eMT9+1Kmps3Sx6RBSyMcNwxqbi5X/eibQ6K/G29yRmpviui
	pYBDGViKaE57grjGhnU7OhdFHNBjkgEBzI87zv416+gOl4Aa7B/n8j1j/rHKoNBFyA/0QMBtmDf
	E50PQfaZmU3VF+BKlr56bQR4gU5kdMbe4Ius45MklzPGbxVxyMeznc8vmhGw==
X-Received: by 2002:a05:620a:1b81:b0:92e:c118:18a9 with SMTP id af79cd13be357-93103a65117mr772232885a.92.1784905623921;
        Fri, 24 Jul 2026 08:07:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1b81:b0:92e:c118:18a9 with SMTP id
 af79cd13be357-93103a65117mr772229085a.92.1784905623517; Fri, 24 Jul 2026
 08:07:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
 <20260720-pdev-set-fwnode-instead-of-of-node-v1-5-2dee93f42c54@oss.qualcomm.com>
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-5-2dee93f42c54@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:06:51 +0200
X-Gm-Features: AUfX_mxUpEE-_djVPIMU7ZvWbbzhCFmItK3_9wrfK5-RcRFUSwGHiGhMmnFjL0c
Message-ID: <CAPx+jO9=HWwr4jGoCcWAM6fKTTrg3TphgPiNX+4yvfnyEZa_pg@mail.gmail.com>
Subject: Re: [PATCH 5/8] pmdomain: imx: use platform_device_set_fwnode()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>, brgl@kernel.org,
        driver-core@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, netdev@vger.kernel.org,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=JOMLdcKb c=1 sm=1 tr=0 ts=6a637f99 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=RwuSGLWl7VkFDbmKPUAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 3XRVRJPYUcTmVVdOV0XT83wcMPfYlkcf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNiBTYWx0ZWRfX50mmiSRtoFto
 XnlIimci2hAhBi45mQu2naPZ9abuliKgqHLMC6XFqwVEQkTzJdv8p3I4B7OIHspg2GQUBaG0SMZ
 f+fUzl2KZF1H0QVVi4IwKFzpCjI2DkM=
X-Proofpoint-GUID: 3XRVRJPYUcTmVVdOV0XT83wcMPfYlkcf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNiBTYWx0ZWRfX3wnAyz+0toAc
 y6/TM6J/zhcwMG4PmWgUePnitmRMHm6zz0qqEoe9Xg5wzoxvovAAct0knyAKZIcqMB5JXxig4Lx
 gu/nE/hi/d5Eqvy4Sr3qNrKFhFdY70/tpo6anSNfJwtD+qqfNXRCxe2LC8A+5XFvYf54N8pHYCI
 dtVuodoswh3pBhPbC5VrV8kXdD7+H/Rkq7z9q1GuRhFj18+orK+yJt9E7kfXnSmJkeV6j4lvEXc
 WfhlFGt9RSJJPejKLr64OLI0U53xbvtwr5clWS0DUVZqLYysEgS9WPPJVBT7jk1dexHqk1N0IC8
 fqaqCgmiWnQJPsaJB3fsJm6Why71y+fcn6aT+FGjEA6DG8cimN4zUlDAFgFclawsFoiv6/t+imt
 8+1izMwF4qrRK1j9+h9y3omcCx+6X9FPOtAmlylvnOl3k4mrKsrvo4I7UJmYMV1xiEMzUHgroQ/
 2rIJ3UVKrxF+0OaPE/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_080705_584278_F5447505 
X-CRM114-Status: GOOD (  18.61  )
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

On Mon, Jul 20, 2026 at 11:25=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Prefer the higher-level platform_device_set_fwnode() over the
> OF-specific platform_device_set_of_node() for dynamically allocated
> platform devices.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  drivers/pmdomain/imx/gpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
> index abca5f449a226fbae4213926e1395c413160c950..c147eaf048ba2b79a744ec870=
29420981581e48e 100644
> --- a/drivers/pmdomain/imx/gpc.c
> +++ b/drivers/pmdomain/imx/gpc.c
> @@ -487,7 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev=
)
>                         domain->ipg_rate_mhz =3D ipg_rate_mhz;
>
>                         pd_pdev->dev.parent =3D &pdev->dev;
> -                       platform_device_set_of_node(pd_pdev, np);
> +                       platform_device_set_fwnode(pd_pdev, of_fwnode_han=
dle(np));
>
>                         ret =3D platform_device_add(pd_pdev);
>                         if (ret) {
>
> --
> 2.47.3
>

