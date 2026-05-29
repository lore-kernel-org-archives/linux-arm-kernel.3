Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26560CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 14:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0uRdyGufttfYsaSEKi83F70fZI3azu4YBlntZSpPu4=; b=xVBDNdQ1fXY1Ua7dMKEW5WkCCH
	3q9YE4mm7wUnLxlw8Te+9TEDaeD06h05p2Ugws7nbrvujtu21Jk1U1l117oKMpuHeFxuODaGiJokO
	Sg/8/OSahip8umsC+o+ptJK+HMZVpzhoMYLBMmXSu8C0FggLLlojNc/DY9d8etZxoAe/wLTQxAIcg
	+dEBGmb64UPclH35ZjbWdBBWZJy4ccx9YjYjozIivWv0YUw7uhY1UG3JHVqNw8tWwmgs1FOYZlb3y
	WhxsBMjUAZ5LrvTzE2GS7dzQmN5K4gXROctRrAHPWXJYii4VUV0wdYemVJ7o96t6+J+1yySkrP6Lb
	2I1zOmpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyTM-00000007YCJ-0Zft;
	Fri, 29 May 2026 14:46:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSyTI-00000007YBa-0p8F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 14:46:03 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDL00o2334974
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 14:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y0uRdyGufttfYsaSEKi83F70fZI3azu4YBlntZSpPu4=; b=Bu3eS0IocdVwcgU3
	CGTFtvJsHhHnWhPRxdFyHJvNRpwXsNF23f6zIOH4cgaJR8KdAGRdP6uxlcvwADxj
	sdfmufVCxLd7S4lfAP8c/cW4sRRY/lpyXpZDEkiTEDqhadvk3J8s+KZEv5AZyR+s
	BLlH1NDNk2MGWYZT3ibgT6O4GUxvmCf0wOcKB+pp81pulce5ifgnR8A8j8q+N14n
	F1C6J6SSYrSHMySeK0wVDH6gHQ6tYPlqNGIMeZANuO5W6VP2b3D9cmsSeGaJwETy
	KiHxJjnm5MukNBqHY0ERqom4iOSWGsq+o0P/58FN7+fYFzqVW+9Nwps8SooyVzqZ
	b19KUA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef4jj28h3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 14:45:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8b1f39c5827so287025746d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 07:45:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780065959; cv=none;
        d=google.com; s=arc-20240605;
        b=DDcs0I+e/mGQcbedlbapFQ1/DIOFkTOmiT+wCWZrYhoi/q4skflxpv5ZPhGF7XyYAW
         qNn1e5HPj0rGkpeZ2URNAu7OCkLQqeH5qTHu7dbCtd4S5Fl0n1PaK9D1ngPfuWAEfQb+
         +Yeu8J3pwW0b9sknnwWYokqjCgiTOeUlJi4DshzaZXdaPgY/YTj69hcqq1CsfSsETv/s
         h7MSqu0i+LPc/ADG4b7xXgm+OpW1S3B6oiFv9f1/1924uLOnr5gVRWvW0Tx6a/pbJ9H2
         TNBS4aWxJBMNfhEzvMmYQ5QcKydXc66TK7XGLCbIwYwHbs+OMPzuep18z94SleAs+xp7
         VXXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y0uRdyGufttfYsaSEKi83F70fZI3azu4YBlntZSpPu4=;
        fh=qiGG9qFVfzginv50uaysJWfDW2/qd3i9wTt0TD03eK8=;
        b=leP8SebgZ2qHoMEsYs4Y3ZgXjFCFymnw6AzwK2QGEszKp4AnFpsxCafAjw7OTytRwV
         JiZf1j8lS1iUsuPLSgTHUycdkYyBwyt7ACOSgpvDYp/NK0ATS7oqkaxZ6ZEydwj5Hzk7
         jCCblub/EAth4W2qdZ16dTy30KG//6yGNAZC0g61/LTz2zcW+aetLdkLiJwGLGDPQ7WF
         Uy278Wq45j/8ir0dcfFf2HAYgJoj0Ku1ybFneX5HnAm1s1Vut49qpNelA/zYDGYnMy9H
         7X4xFEVG9EOSo5pO81QWYdfvc7fsTmmLlrpx9x4NWv81B1oFLtf8IWAaFPQDSr2ZMPMc
         IOcA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780065959; x=1780670759; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0uRdyGufttfYsaSEKi83F70fZI3azu4YBlntZSpPu4=;
        b=YSHZ9tF2ySnBWZO0pOc72TYgyQ6k+efpIBMxxOn6eudSz4EcKLzVvO/+178OyUxzry
         6QvTVi6U/hsujL1iGUfPoIaZ8acLToF1ht1uW8nMGwyzcUtq/8Zvic06dcUPRKSGJh5L
         SGGbOZn/9i8ia+DjVJsJk9mtV7/YF4bvXIvBsvTehrMVU/eM2xVwowI91FFeqEZVKwEl
         ky6WBf3nUi5Kub+EZm74l8qvih/szPh/HRqMNWcmu2DCt+/Nz+FrHKthW3MCjbrhS4SU
         Ap90lGlXSvCbS888MOFnRk0h9qQHkAFyyNeHTQOjxenH7V+2R1V1W4Em+k0hjPLn8Tz4
         QZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065959; x=1780670759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y0uRdyGufttfYsaSEKi83F70fZI3azu4YBlntZSpPu4=;
        b=Gnv0xnBIt6zcjA7uCiqtRptsnEEpivjMBwq6MN/PGAENegX93CSoAy8Y8KrY8fr1HX
         Y1ASrBNe8Tt/3PSUQzBekxWxHBIk3AO8i4FKZFQGu9ofM2R4PmObThJ8OX4An2kZfz7a
         gY5Fx85DPsagj3vSh6H/+P7DRF1bqErhdDxPQ18WBwDpevurp1sTr4ecLNHbc+hDrjXk
         COc7N07JeA8PIX++OC0G0r/u/xBUEqu1AzD/YKS1QRFiOD3kzyOvYjIfJEy/JPiNMwuJ
         DkA8vLJgj2y5XjedH2/Pa8lqffkKmSsEhoy/vy0wvdS3Waslp/2pp2JYAbvRzN+ydWJc
         +qPQ==
X-Forwarded-Encrypted: i=1; AFNElJ9etUWUxoVqFLHLvFsJU/VdjeiSFJiPnpwvUkyJkkKDow1VoaJ0MmllusE8ELmDTYiG5CyM22reLwFTU6w47YAm@lists.infradead.org
X-Gm-Message-State: AOJu0YxLTgQLfR7dTLjdSg/sfjeeVHtceRBa4dPejNFpvw5j4MVwCll2
	QrIhMiAyxXKUus4KMCYwbdQzaJIp74H29qocev2+ICvqpSU170qaReArZatEQPDVmdp6OKnyxTJ
	+5AwEyAzKt8Cn1yROR4uLMdlYjJsrkofY9Zw3/SPCTA5+lMhWBfiH/VAf2N/HljcmYBwzkzZbBU
	DpDyP3jmoobtzFL5mvKdpel3RM0VvYr4Zv9Qw9NWw5ES88St5d7S8s
X-Gm-Gg: Acq92OFaOGvf60/PQfWJIdkaRODdssvqc9A4vFuVifwOObgr0WiN8WWpsK2tIb2cJRH
	VzZiJ84NoAWWFTC7crlq/Ng94o413AJV39yOCFSSIBoSX3fyfueQZx7GevBvYbkx8wLA4yNqj4c
	aJMSY/HQntIf5e6hV5/SQtdo1ScK3xQQEbuRljg0vtfBDAC14Ox5ibj2CB0CThna28A+01ULYcO
	8LuCDanKh8m3w2zTQ==
X-Received: by 2002:a05:6214:230b:b0:8ca:10c9:845d with SMTP id 6a1803df08f44-8cce801f126mr36090096d6.31.1780065958655;
        Fri, 29 May 2026 07:45:58 -0700 (PDT)
X-Received: by 2002:a05:6214:230b:b0:8ca:10c9:845d with SMTP id
 6a1803df08f44-8cce801f126mr36089856d6.31.1780065958269; Fri, 29 May 2026
 07:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260522184307.2979579-1-heiko@sntech.de>
In-Reply-To: <20260522184307.2979579-1-heiko@sntech.de>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 29 May 2026 16:45:47 +0200
X-Gm-Features: AVHnY4J_FLHe1mGcqIVr9GZCUybu2z_sAx_8iofpKeK_xPfv3mpX0W3pewKBvLE
Message-ID: <CAPx+jO9kKCQE+ZtKhJWX9mztEQ2m93irdqt6910wG=9M9zN4KA@mail.gmail.com>
Subject: Re: [PATCH] mmc: dw_mmc-rockchip: Add missing private data for very
 old controllers
To: Heiko Stuebner <heiko@sntech.de>
Cc: ulfh@kernel.org, shawn.lin@rock-chips.com, jh80.chung@samsung.com,
        linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0NyBTYWx0ZWRfX5u/oVBLM0VzD
 maq3rihMUTG/ek4rqPeoSm5YBJvCj3aXyWUzqQiLKLC5qcdbzd8AAV+4ekgqCQJRSKI6vNVwY5P
 vB2Z3fn2rXKPi9lsTIdTBp51BwxFAaF/1txIrGkq2QrqQrgqvgx6bJywHjURoxTtabUK+FLjeLt
 zz8B/mKXRKBWQHeL40yEhHKgd6tqUk04cUHrbAMwHfA83DO7fZsON3cMXSbmkBnG8OASQvsYMLl
 IKD63YWHDuZqWo+Jx3vIfTUh3N+LXdjTmlIw6Bbsr5LbiUJLYxt6NcgwC81GV/vgIiImtmebOcx
 LCtl0bSn9gPKWRhYx0xsw6aEJ6gsBS2re08kTVNNEK80+nqDvUDZ+MJwi9VS0lFNWt2MZKs11gu
 Oc6kWryjplv1V1zA3ThjbvovisYXTsfodOMhALuCrTib0JhzJSX+yBisU342k3NnIfl7Why6yaT
 P6gAQG9BKzJlR8uPf+Q==
X-Proofpoint-ORIG-GUID: mabLvZb2IVBMGjn2R8KBy2tQWSdj39qF
X-Authority-Analysis: v=2.4 cv=Tt7WQjXh c=1 sm=1 tr=0 ts=6a19a6a7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8
 a=zCIS9O9Q-TFeY09dWLwA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: mabLvZb2IVBMGjn2R8KBy2tQWSdj39qF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_074601_379386_CE3C17EF 
X-CRM114-Status: GOOD (  27.02  )
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

On Fri, May 22, 2026 at 8:43=E2=80=AFPM Heiko Stuebner <heiko@sntech.de> wr=
ote:
>
> The really old controllers (rk2928, rk3066, rk3188) do not support UHS
> speeds at all, and thus never handled phase data.
>
> For that reason it never had a parse_dt callback and no driver private
> data at all.
>
> Commit ff6f0286c896 ("mmc: dw_mmc-rockchip: Add memory clock auto-gating
> support") makes the private data sort of mandatory, because the init
> function checks whether phases are configured internally or through the
> clock controller.
>
> This results in the old SoCs then experiencing NULL-pointer dereferences
> when they try to access that private-data struct.
>
> While we could have if (priv) conditionals in all places, it's way less
> cluttery to just give the old types their private-data struct.
>
> Fixes: ff6f0286c896 ("mmc: dw_mmc-rockchip: Add memory clock auto-gating =
support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/dw_mmc-rockchip.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/mmc/host/dw_mmc-rockchip.c b/drivers/mmc/host/dw_mmc=
-rockchip.c
> index c6eece4ec3fd..75c82ff20f17 100644
> --- a/drivers/mmc/host/dw_mmc-rockchip.c
> +++ b/drivers/mmc/host/dw_mmc-rockchip.c
> @@ -441,6 +441,22 @@ static int dw_mci_common_parse_dt(struct dw_mci *hos=
t)
>         return 0;
>  }
>
> +static int dw_mci_rk2928_parse_dt(struct dw_mci *host)
> +{
> +       struct dw_mci_rockchip_priv_data *priv;
> +       int err;
> +
> +       err =3D dw_mci_common_parse_dt(host);
> +       if (err)
> +               return err;
> +
> +       priv =3D host->priv;
> +
> +       priv->internal_phase =3D false;
> +
> +       return 0;
> +}
> +
>  static int dw_mci_rk3288_parse_dt(struct dw_mci *host)
>  {
>         struct dw_mci_rockchip_priv_data *priv;
> @@ -514,6 +530,7 @@ static int dw_mci_rockchip_init(struct dw_mci *host)
>
>  static const struct dw_mci_drv_data rk2928_drv_data =3D {
>         .init                   =3D dw_mci_rockchip_init,
> +       .parse_dt               =3D dw_mci_rk2928_parse_dt,
>  };
>
>  static const struct dw_mci_drv_data rk3288_drv_data =3D {
> --
> 2.47.3
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

