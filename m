Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1033AC54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dgrl60IlcgUtxV8b+GtgWbSKL9T4fkkU03nVj9x4Tu8=; b=0nD/hv2fGf4KyUGPz0nuFLzDPu
	k5YZVEzeut4kD/YV22jDr6i+KhCGjckuRiJnMhcV6GIlmKrevOGhS0XaPguLHgqOmQ5o8kMphcA8D
	VIxwUFBOhzTp/MllZ8aVVd4sQfIn7OWlbAcK5WZ1qqKR8E3Be8Tdl/4zMoyQxgTnk1wFbFZMjrrCx
	/iIrdxFjpLl7pjOZ+N9p11dEYhT93KO0DxeuuWEz2N+Shq7EmMRsFHGFLxxGRMKGc+AnbqRMCTHIV
	3+v5JXgXjbMX7PZSWn/L2HbAH7KnZydYIFOt9ithWh0ABNfuhPUoqAoUpJWfCocnmG+wpimdpgK6F
	4BgIiUuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiU1-00000005Qxj-0UrV;
	Tue, 28 Jul 2026 14:08:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiTz-00000005Qx9-09zn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 14:08:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SDOF6N2655105
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dgrl60IlcgUtxV8b+GtgWbSKL9T4fkkU03nVj9x4Tu8=; b=NSoDKo1DRTM+d2OR
	xcEg1CPv1i2miZnJHhIKmXpRMqLAujW6GhWOPhBY0uv9AQR7A4P6Pvi/QaRi4Gfb
	GuKIhxcWvRXsyyaRla2PP+uge6SSh/SIHcel/gxQ9OXho2SFBiNfbssTEaAIvi8G
	22n0s8kUpjiGc2dqB7pqH7lw3WKyau8wCQDa0Zgah7No9Y86wLfxm+cTpwKPkTNG
	khkMlFaAND0JHSVlf+6tr1cYUZCqvgOrQ0rkDmRpcPNS4RlBj5ccNdOJOuSNqvwV
	f087lQhsUae6dRhITDfop6Zeauz66/K8sHlHuqpKQEAWm4or6M54rPRGs06G6dka
	zfO49g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvd3ggcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:08:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e63df032bso113396085a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 07:08:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785247713; cv=none;
        d=google.com; s=arc-20260327;
        b=KJ153SwEv0We0zW+inxCm4tLoC6GmzguIVcz5wSbw9lfQ+PhAXYWrpLOUzLW0Wn32+
         vDZ3XZM7uuGNSzEmZUyMzmw90NKFeIU9ggEE/9ymEMBY74+NFhbGwXuxpLvj7aXRSWbl
         JFdcaYJ6Sa01+Jvm8IObKzDYJc4BPtixJHtx6qLa/D2wt1FEXtpWUdokw8ImGI1rfoib
         iHAtkNuoIV5uzGAzWwI5y3BjlLE9IjzBlc8k5DrWQ8UwiVnbC0UPRqoCG5aLDq414CO+
         4Tj4qdxcBLwhAFnDjD9TR7YAJKeYrvSOzaxBM7NflxWwP8wPE0tRByynHOkZV90tRZuo
         cZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dgrl60IlcgUtxV8b+GtgWbSKL9T4fkkU03nVj9x4Tu8=;
        fh=JhqLcc/fEHVbvT2riGH/xnN801VI+G7yIrRdkME+N60=;
        b=SGmW1HscUcPi1xTt2F80nMurgfgt4umI1y6ZqN8lmwVFEAeRm80eAdSqJmNm7gsZsH
         WLHSrP8/07oFpU8zYuxP0TFB2mMzrMhoALFGdxtFFBjxRSV/GAQIYfWHEtODZyagSShu
         nkGcZnGV3gBjLQucs4R6sVZoLJZARJRNTAWNldJeNIlDHGHweVjrb2MGPMHwcPE6wQY0
         WWiQBTyWpDushfokM4gzYUq6Hi7XMz5OfTIqzRCEURJKwctHO9G7lnMdvA78C9nvAOZe
         X39zexqRWBREslbCtXs3t58gQhaVSqb/HEXp6vM98nU6JXEfufIuCjoNYmpdgPpIRhGb
         ncPQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785247713; x=1785852513; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dgrl60IlcgUtxV8b+GtgWbSKL9T4fkkU03nVj9x4Tu8=;
        b=IlnXs+nWz5Xd2/MVvdVTlvSVlWwNPCgIiV9w+MkmTrLrQ22vaRUEkY4KAF2jplPV64
         0b6saM0gwtPQmsrZXsyaj17WtSMDlr39CkTSjIGMRXUcxrxWhDAxEVwXRhq3lwbxS+XI
         3vy38MP/4BIYIMBF8MGPuRC0rRHmf5dHWMyAzJJmfIFMUoTV11ZQe5Sal0g/PaT9UnRV
         YQY9rAidsb0zgS35yNJ8vljbr2vA4BQrg/9JWBQq+Y6l9tfCCEHe1gIbMakt7pp6p3kl
         G8v7N2AuiEE4W+U2DC5RygvuZ8l129ccf8pml7w5vILwMSf2toWJrKg+i/eCaKKkxmQU
         eldQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247713; x=1785852513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dgrl60IlcgUtxV8b+GtgWbSKL9T4fkkU03nVj9x4Tu8=;
        b=ZJgUn42mtNAkdHp9t1QMd6NieFBFB8duzsQ4km/O5AI2d9novphRSyP4DCOQ40mq1I
         SfG0c8gpyvBeLjiuEtYy9AAR1VCwEitaNn9Fv86W3tvTEi4LGNjUtlMURPBOvvHdOA9x
         e5UbN5WgrH69AEtIBtgsm0KsJbbqIG5fne0ovkrUcsLWxBvik3buUvOugH683aYt78J2
         1z4cD7ZFsVnwOfsxf19MzuYRieyrLuEOuY9NLwN9tt87DUpl7jfnOPyRC3cl8Z41WBfi
         PYtfnqshGVk5qaTB/PW4CG6gM3sY8XAYuwTuJPLHwStFfOPBwL2mUqLm/LWbVuuo5EKO
         UZWg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9rVnclSC8Tlart+GBfIkmCnkSHp1A4YSnPJfD8TO8lsuCFD5Nn6iRoamOkSdy/SXHAhSE0XtKULh0rSN7TyX7@lists.infradead.org
X-Gm-Message-State: AOJu0YxyLcbact7I2c1krVhNgS4/o5Yh/Ggmu9NTHkoznFIVHA4KBdyz
	6k97kMLZYMZQwmhQgeI+10Nq00O1ecjhsEAWXyJLbC/KhiIrwNNTP2vTNtVyoWnAZe76TW3LJ9w
	q7A6g5TpeYw71cOci4+R+mIGTUuC1UR9rB0QjIruQhMLaqvS6hDRTV47S/6pewQFKJeUDcU50yF
	IAFZTgyhK0/b27yX1Pa6/NHVrF71ngGxPrrUrGGrKIcIlzplFxOTraCtRpqYrhdcU=
X-Gm-Gg: AR+sD12Rzl7GUzPwTlbiQQumO5yezLdv8hVpYf3xdYn3IdY6pXFN74j/1112904EsC8
	3rbubyW0a22JP2oeqDQW5gEqIJ653Qp0OZCb2MUhZ174EQ+gccc14BhPZ7t5q04wEJcqlRLTsor
	gd1RDfHqY0iwv2IOuS/OFihLN52AFftFzaTpXH1IiWfgiW2TOtmLf4aOlmwTCesn4L7KylkUNwn
	iGI7W9/r+BmTrOBB3Tk1F0CuVxo2UKVzoLY/U7yHEcxiXQYcSsUMWPYAMmyo9VGOMdN4fsN940=
X-Received: by 2002:a05:620a:25d3:b0:929:f78f:6bf9 with SMTP id af79cd13be357-9330263c462mr233339985a.16.1785247713298;
        Tue, 28 Jul 2026 07:08:33 -0700 (PDT)
X-Received: by 2002:a05:620a:25d3:b0:929:f78f:6bf9 with SMTP id
 af79cd13be357-9330263c462mr233331485a.16.1785247712676; Tue, 28 Jul 2026
 07:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260728-isi-v5-0-1d22ab91602a@oss.nxp.com> <20260728-isi-v5-1-1d22ab91602a@oss.nxp.com>
In-Reply-To: <20260728-isi-v5-1-1d22ab91602a@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 16:08:21 +0200
X-Gm-Features: AUfX_mw5JcxlCW6NeAN0Cy8X5f4_Rk6VWvnTqzYs1-6WgLhGTre_063E34AGeNA
Message-ID: <CAFEp6-3jntC6xQLDLjQdMps5Lq-sOCGEtMnkFTtrCDZpngBwRQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] media: nxp: imx8-isi: Use BIT_ULL() for 64-bit
 stream masks
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Christian Hemp <c.hemp@phytec.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Jacopo Mondi <jacopo@jmondi.org>, "Bryan O'Donoghue" <bod@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyNSBTYWx0ZWRfX+oe7/04sh2tY
 4Ugsw6MfkDBWthxBCGoex+mLZV70BsazpCmFM51NqeV3j5EEIrRoRkqHXSut1poGsxJpF941iju
 uWHGUHCxcgINsoHv/hLd6QwpPY3RDwk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyNSBTYWx0ZWRfX6nKX086Vo5gw
 zanSCiuh0zA+qgbV4AuB4DMJ/Nd4MWSWtUJLE8YRPgS2QieHGl+Am8Co1aGQC8cSQGyj4xebV7E
 1d/UuNAo3w1qSezz6StqOqQ4WlaXVIzf3pgWZ7+T/lmUTvQEdjXA4RaESN7D9kBQ2DaWimbYN6+
 Hg7O3q76YZI6k4nPm3pIJPx+2ddtkmxtHmEkP4RMwf8+W5bNh8CuuqHU8srU0aUtmo2WbBUlrWe
 WTfxjwhzLIWu+wCjEn7v50XkpuaPmDn4RUyqY3BzoTIvWgB+bGdrnYD/BaO7Xc4LukXt851tQpg
 l6EUy1CukvxR9R/+d4L1IXmMQd+Fnj8rMg7/NmMrzlkJj2mYJYMWluPxkkXzl7HS9VINg6kokLX
 FPfNdq/KJDIvTNZn3u/Y4ZMdD366Wwu9bPbAvMaU+HsqySAPArJrj2eaLB973lmaqubdeyfx9Gl
 z5GI81Qj3gwr/9fyKOA==
X-Authority-Analysis: v=2.4 cv=SqegLvO0 c=1 sm=1 tr=0 ts=6a68b7e2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=LElf2VvS5UWv9C91Qe8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: B-HGMAk-xxKjMSsbPQQmn8fIk6hZXeN_
X-Proofpoint-GUID: B-HGMAk-xxKjMSsbPQQmn8fIk6hZXeN_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_070835_084217_71139A4F 
X-CRM114-Status: GOOD (  17.96  )
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

On Tue, Jul 28, 2026 at 8:55=E2=80=AFAM Guoniu Zhou <guoniu.zhou@oss.nxp.co=
m> wrote:
>
> Use BIT_ULL() instead of BIT() for u64 stream masks to avoid incorrect
> results on 32-bit architectures when stream IDs are 32 or greater.
>
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/dr=
ivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 9f0231ca47a3..9db9c6e55c2c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -157,10 +157,10 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_cross=
bar *xbar,
>          */
>         for_each_active_route(&state->routing, route) {
>                 if (route->source_pad !=3D source_pad ||
> -                   !(source_streams & BIT(route->source_stream)))
> +                   !(source_streams & BIT_ULL(route->source_stream)))
>                         continue;
>
> -               sink_streams |=3D BIT(route->sink_stream);
> +               sink_streams |=3D BIT_ULL(route->sink_stream);
>                 sink_pad =3D route->sink_pad;
>         }
>
>
> --
> 2.34.1
>

