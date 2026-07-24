Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7269AC53215
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EVzRgfkUD4JBUm527N3SDHxIqvJx5/qjTVgYiEvrz8U=; b=Ub7niCoYxZPZGD+m6j7Dz3JlMl
	n1LvUQix8d6MJ26/CYGiO9XbOvysqASjIh38UQmwgXeIgWY/JNai/ML6unP8vtPGojICGuOHHo8x9
	iBkVbifQ7SIbdM8jHFrNE58uksLoKqkxN93ASdXrskSgtxmw1DXvI9xUzkjj8iX2wKSU3jXuGNVJU
	eGVKrfkFUBVV47Uizj5XxvXSHjrPA4vONwq3eIW2F3ERsDMUXBf0KJ+VMo3HzaanHsI51ctzUxUpm
	3Qg8BpO/i1eM3EutsE67epiiWG2Kwd74cwXj7s38xM3Ht1LyvAVR/VIgGHfoyOWYILZtzq5/8Q3kC
	trTKmFRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHn4-0000000Ghg0-3grU;
	Fri, 24 Jul 2026 15:26:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHmb-0000000GhVP-153H
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 15:25:54 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbHVa151634
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EVzRgfkUD4JBUm527N3SDHxIqvJx5/qjTVgYiEvrz8U=; b=JdX8vmXYgiLsdgga
	VDfAI2QzOnFN+oMi5LDZiaEWcU64KTI23UWiipG9UKkg3tn/jRYNR/0+WDP3iI/n
	Co5tBTs4hVfTThCD265yDnsw3QqF36F0RwcWIZ0JxQ69bB9PMzJs28ZK6r/WTqca
	yGAkhT1Up8NrfnuXUIpc2lXDOs9A5CiV4k71J13CRnqODu22IWamPZKeNBIHBpw+
	bfcGLnSIXfdoUQ39b8Sze5wC94G6Izs6DdECHpH8EiCIUHVa1nCryk/1u4Rp+2Ld
	HwSTv4AkbsAIRGm5a0YUJx3vuqpNiDz/6kXMiLs5S4NWyFIPtqiHnqnRxYpyzkpG
	igMAQQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8ck8jja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:25:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9309af14fd7so79976185a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 08:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784906752; cv=none;
        d=google.com; s=arc-20260327;
        b=GGjqmhGtNFfChEMbsOvuML1zWpCNT4bpCnlmHZLqXCgcb4K8UTNTZ4g5KajrdepHrm
         wkIXzInaGfslZdoWMfkSrcwi6RzpDr4liEoeLdGbjZNSSjmCoVemNp2EAd75AsQDW4ZU
         p2hHKo6BpBZs+/keUE6rGCscl3suL19t3HICHWiQ4hT7Ov5T7f6jclcBaykC3KRag/RI
         pOELWwKdP5jcUtHa3unSwoYgi34riabBwxZJuMMBTYnoySkvS3F7qTI59RBjhx2liloX
         08J3qA5z4Z/5yekCzvLiBeiJ6fAQAiu3kHkcTZV7Woa+GwF2d3Q0QhkRTnMs1r0HSkAM
         EDmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EVzRgfkUD4JBUm527N3SDHxIqvJx5/qjTVgYiEvrz8U=;
        fh=cKh4kYmDb5nOfkqVwIvp2ofAvk0Ap771bwKnFwWXVFk=;
        b=pyJWEI/1hLTJ/h7invz8xb3NzTJbjlNTq+nwHo5MS9myUsev1RJudly22cXKfy/oAo
         NXX0vvypqy7ZioZjDU+D8XHeHKn4hD0+ekMlDH9fSTmcvDn6YhDbzQW8MWy69AD/Avkf
         243gxQ9AAx8ouKulofz0C/p9CqBkD9rUAo6hnKCX+DokrKnCMtvRWeh431XPGonJVPyJ
         4D1ucGbK+vex7MPuhBCMpdbCu5f34E03Ek8K60btwyYBBRZfjwEeri95pnc63wWZXLYp
         98mwqw3TQDzJndfTcP4vu4Yxf9NleMe3z51zAQPqcqUukMmAOfYNY9NYSnGvfFTPWhgB
         C1bQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784906752; x=1785511552; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EVzRgfkUD4JBUm527N3SDHxIqvJx5/qjTVgYiEvrz8U=;
        b=aSFikIBipg8Z+IxOUQSOWv73AxRTRS7haB64GUa63xam5R5LwL8DmbfXiNjMWkDRF6
         0HQTgWhQWmaqUzqE7TGBejCBiWlXfNhNFQp+Dj3uYepe330hUUZEvwJKGPT65KZ2tm7X
         AwrQlxBq2zCrK8w9cq+Ux7F0HvfP74fHlVIvpyghwJma/eqgzOqa8JkbtXg9Vr2vs+op
         +H7BFycmOZWUnjKhpMqXLCb+M3edg/KAvevnd4T8CIy218X4Dy+oAEVOgKhFpi0EPeGG
         Dg/umHyE/r46DS6EWTRTg6mOapKZGCHwqqR0wF7Jrfxt+X48KMw4Kmoi9HHl7RKng8US
         QkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784906752; x=1785511552;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EVzRgfkUD4JBUm527N3SDHxIqvJx5/qjTVgYiEvrz8U=;
        b=VpbcDJrUQTiuj244wuWaFz79ikDn0LUYlWtwDwXVYBmmtU8NvcVbRmdWHadRVfUb7f
         4tvmO93l/zozeeOUvEcsi0w4dDgtM1lVeMV692MDihhY9j15gmZ6BbTdaGcL82BGFX7s
         GoqYjrVwUXXcXi/wSBYsYNAHZg3Vp9rHEyzhaUjvdsDqHx+57OL4s8s7a+REzGHPEEuS
         RIOdiVXNymFcWUMwpZIonn8xYbFCCxYH/whBtgM3VqyWTx3mLsRgSQJ/2ET0TrxHrrla
         wCoPsg0uWrzjh9nXAXlg4Don9z5AQ7yqWjYvlbemL6yoNQwjdK0ZiJA1Edx9tXGNXeIs
         Y13g==
X-Forwarded-Encrypted: i=1; AHgh+Ro4dFtQ15tLZ0WGEnoG6epc+ipY4LVxA6Ql/buRvgL43nbcTWVYTldEp+kfiXo7qZs0hGAWKEbEKUQ9+r07MOCJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxdZnzUKllrHu5xawVPJVrSQA8qCaM5EuabRCJnDbquePagL8sT
	iZonRgaak6cJCRLazv0SNuuvluRrHmO5J/n7GvLvq31BdLKJ3hd/AIX1QX8AM/pcyxGqlLyl8Xr
	xMeR8HFRd2VECU2Chm1BcXnm9I5CQuSJdqtwae3P9mFjnWrxYXchn20AsR8rWnzvNTqxhQOVYpU
	+F6AtDOjnFtDhSaDuTPTB7snryMEuIRa4lx1gQR1qAADN5KRLXVwcW
X-Gm-Gg: AR+sD12LgwKD/ZqmzTkKe9cSNT2V5LSV70CybPk7pz52myP/uw+HJ7iQRhxpCgipOOG
	W0UjPGvjUEMSNL9SUXznlKxXYGqsbNoyricATbEnhzfZEYX4WA/JvqhDBdxgGY3g/2g6+E+f8iK
	S3s851FhMreT94F4RsJByovjFnJgKcC80dGPxf3R42z09xUUiXEw6L0HEdrg==
X-Received: by 2002:a05:620a:4414:b0:930:9c64:330 with SMTP id af79cd13be357-93103a4e832mr831462485a.87.1784906751799;
        Fri, 24 Jul 2026 08:25:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4414:b0:930:9c64:330 with SMTP id
 af79cd13be357-93103a4e832mr831458185a.87.1784906751389; Fri, 24 Jul 2026
 08:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260716114247.49685-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260716114247.49685-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:25:40 +0200
X-Gm-Features: AUfX_mxVC_giYxUaohart3sP181-Oh1lGOCSPJ7_kEvq1OppxaW1JXZvQ16t_ZA
Message-ID: <CAPx+jO9t=te39Lg7BijMvSV5xzGKp5hNVETRhd7-N5p32jFL2w@mail.gmail.com>
Subject: Re: [PATCH] pmdomains: mediatek: Avoid setting RTFF's CLK_DIS before NRESTORE
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ulfh@kernel.org, matthias.bgg@gmail.com, nfraprado@collabora.com,
        macpaul.lin@mediatek.com, irving-ch.lin@mediatek.com,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzOCBTYWx0ZWRfXxZR7kt3rUS32
 U25lgpyYrAF8TIyeRTvWtH4WcnMvFx13t70IEL+O1dM1Tg2m4ANpoPIrCJdkyZ6YH3qv7K3wgGt
 l0oVLh9dO50qqDNSxmjHM1Y4zrTtL7AfDksxMz47eJ1stuhQ86Hwo064Y5TOX3D3R/7RfdrTxZF
 T44+J7mRyMsz6s70Vf1jgrJj0C6DKIoqgES2ye4zsJMRMHEJbLZVY/Yxiqf1/nVtXbGQrTUM7KO
 L6wH2W8zZJAqPmkY8fw6N1MxM1TmEOZ+BvVtuR9fMDLNAvkm382/vxPAMSdUpr6b4tKRyvntJAN
 V8uh/HqfCBscszU19oda6y683wIoSGro5/EruiTvzLogYOB1uRjKFf0pPbNcL8gC1wrQvgL3t2q
 isLIVKBonuHABHwz1J+Wc70I2W/iu8UcpbV5qw+i4CKzwvJjxCmRYN4N9aSNHxWRPovqvVQNtFi
 KSCnoccchfJyTinWwTw==
X-Proofpoint-GUID: C2FCIKUmmVwx-D1h6pa50GxfUlLaW2K3
X-Proofpoint-ORIG-GUID: C2FCIKUmmVwx-D1h6pa50GxfUlLaW2K3
X-Authority-Analysis: v=2.4 cv=F79nsKhN c=1 sm=1 tr=0 ts=6a638400 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=QX4gbG5DAAAA:8 a=fzz4A-KDz1Fdncvdh-EA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzOCBTYWx0ZWRfXzONM/itrcA4z
 1cYuwLXpPzBEGDSaxKwhSbiwp54PNWv3OxXxxD7qY8quIaaQjOE4EuPRyYHQxhhPPHUG5U6SGDr
 Mx8R38ds7AgjLUVOAN+IJE0TTo6NlA0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_082553_301779_1D45CF25 
X-CRM114-Status: GOOD (  23.32  )
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

On Thu, Jul 16, 2026 at 1:42=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> For the PCIE_PHY (also called PEXTP_PHY) type of RTFF hardware,
> there is special handling setting CLK_DIS before performing the
> NRESTORE sequence for resetting the RTFF and start sequencing
> from a clean state.
>
> That special handling, though, poses an issue in case the machine
> specific bootchain (bootloader in particular) ends up booting the
> kernel with both PCIe MAC and PHY enabled (not just power domains)
> as doing so will partially corrupt the PCIe MAC/PHY registers in
> an unpredictable manner, producing either an initialization fail
> in the PCI-Express drivers, or even a hard lockup!
>
> Resolve this by simply removing the special handling: in this case
> the bootchain, or remote processors, setting is getting honored by
> the later check for PWR_RTFF_SAVE_FLAG presence in the RTFF ctl
> register.
>
> Fixes: 9d02c94342b3 ("pmdomain: mediatek: Add support for RTFF Hardware i=
n MT8196/MT6991")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-pm-domains.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomai=
n/mediatek/mtk-pm-domains.c
> index f69cf69ba0f6..df8e93638e08 100644
> --- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
> +++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
> @@ -480,16 +480,8 @@ static int scpsys_ctl_pwrseq_on(struct scpsys_domain=
 *pd)
>         if (ret < 0)
>                 return ret;
>
> -       if (pd->data->rtff_type =3D=3D SCPSYS_RTFF_TYPE_PCIE_PHY)
> -               regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RTF=
F_CLK_DIS);
> -
>         regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_CLK_DIS_B=
IT);
>         regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
> -
> -       /* Wait for RTFF HW to sync buck isolation state if this is PCIe =
PHY RTFF */
> -       if (pd->data->rtff_type =3D=3D SCPSYS_RTFF_TYPE_PCIE_PHY)
> -               udelay(5);
> -
>         regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
>
>         /*
> --
> 2.54.0
>

