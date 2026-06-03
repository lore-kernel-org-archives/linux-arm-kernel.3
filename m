Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74EFCCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 10:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cemMVSwWpUomfLDkEQHTnLgIi/llhyTHZDSVwZ5DF6o=; b=YLS5Ra364hA5URXD/7Zrfm8u3g
	LaCufJmUMJ/R1tV0CuFjgybfn+ychJ0nTy4896Z/lYKDc5dXog16tvzlQl39T5gG30PTz3kPvWkhh
	J5TXrFFRQNLfpHVLxp+EnpCkxj7M/vhNqSDh7aHizL10PG5C18KEDpwu+v/jiL7NwfY+CtoEQKYNa
	5PjXcMekizrkHMqmQPo9P23ENQ4fcrOn/LvcbbmGNCbPP5JxETZ6KMFdEIp74Fm7Rr+xJgLDb99Bv
	V0IEpsgtzz0LPy3RJWfYF9j0vOhkhcI1V6JqtpUKMWQKCk8JsM5rmUxr0ZZeqlwpTacGTRtbc9xyE
	8Jf9GWQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUid9-0000000EmsV-1WtN;
	Wed, 03 Jun 2026 10:15:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUid7-0000000Emrp-0zsP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 10:15:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6536RRXa3077979
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Jun 2026 10:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cemMVSwWpUomfLDkEQHTnLgIi/llhyTHZDSVwZ5DF6o=; b=ln/Ht+CxkbGrBgNy
	wPjkkVIlTOOgLK2eipmC/+xX7OCKCHzDFzzB2Nm52nMjfKPJOUj3n5mfl6UwjcpQ
	7Udc9IUF1V/oDCXW1QBbbmZc6Sn5z1BMPWq5dBPOwXUXLyk+wIrSW0Nvt1Vk4OJt
	TrDaAm05OwjKwc9RM8jNDlPAZ+cAkDZ3iNO6fT2slHbotWYq5QqfJIyxPTkzV7m+
	AK7SEr/dt7wcZC6a5ecldZ/zraKys6A1ornmHmSD+X4oANirp//WIARcW42LKahf
	xkSN0ge2lV56EWn0rM/ph8mP/psnmHQO0fSqi0YcHDL7C6C0+O3w7a7EXN1xguQn
	byisqw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejabbsya6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 10:15:16 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ccf62978bfso103955776d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 03:15:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481714; cv=none;
        d=google.com; s=arc-20240605;
        b=Mu27GOFNJ0xlrElYY4gBwlPIIZypCdCMt4yx9j8E35TlIuJX6xe+g3/Djuc5fe6A6Y
         omzNd7NSxf0x1PDp4chWvBxBahgezPgAGGinpyEmeVAIkruAixRNY0fW2K8V5navDkYQ
         y1i3vUZ4D/ooIqXOpNajKhlfuR6SuzVbfySCZ5u4Htcl0Gxk6Ob1Tnzqe12yqLjJHP3z
         yAOA0Ax4ep1YSCXjWJLbPv3kxmvsxfD1bEcrXTcu0bQXvEb/NZQO9OLSxG4YOy5H31Wq
         zZpHo9922LPx0Y+/DrVJ2XQwMK61YuJFQMU/6WhSOEJNu+YqyvQgJ14s7t+owHzufEZ4
         aDMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cemMVSwWpUomfLDkEQHTnLgIi/llhyTHZDSVwZ5DF6o=;
        fh=11RVPa6N9KfzViaIf7MIq5FRrS8e8mDHmIGcdmieCtg=;
        b=T17ZGtkAxBttR7WowgEoPYYubkbj5fPeFU/3L4elI5GBG3/Ls52BImJ87GvqT/GeWl
         +ZZJoq5aRcLp4jnBGcu/8tzj2zlwu6Lhr8QiOWDYq1mOo+RY2QMF8Qj9UJwUMzgvjHsW
         Fj3rzdyPpzJ2Bi6++MKkm6M6eC1bTAImc3ZOk6T5SZ7rkverulb+6rr34+l8auW14LHM
         gfguUDXrorfQVFRzxRfBYhVD/NPlDhRtekAzn/yImODkA3Snbzj1rNGqF+P4xDIUEcX3
         eNees82FBGwMec1h0pNa3qrpXUj9tnFMRCMnnObiwB3pJii5qy+xle95Q0L+FLQHeECd
         nlAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481714; x=1781086514; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cemMVSwWpUomfLDkEQHTnLgIi/llhyTHZDSVwZ5DF6o=;
        b=NZdWQdmeu9qN8Fe8Uv76V6kvFB6v27FwgIMmMdcLmBFRpDAeD5Pfap7PH51YF5osai
         Mk+5c+x638JIymMS3Yd5YzBoFL3Pioj+4j5fniwEcN8ell4d1GVrZMortIJ0LtsOYmB5
         OtgfsmwHS80tZbozvFeClpkmox2adD1cZOJmE1qSYdiBR4uiDJHh8BhNEEeAWubJIPwI
         GI3zL3JOfhzf6mmZHurS7yRLQQ/5H9nZgD6kb8epW/AeFo/gZSirKEDtdEYuvGhCf2z8
         QXxKuvJ5b/+V94KibPbsoVBTCcKDs9v+agSEXeAUcFQamZ0BHz6TODRWWHldECuakaob
         rpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481714; x=1781086514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cemMVSwWpUomfLDkEQHTnLgIi/llhyTHZDSVwZ5DF6o=;
        b=HHESZwiL2YS+/D3iuIYdh48dk+FqA4feNfF8Ylzf5B5HfaVd56RZVjwkgrjbmdnaJO
         hRuj6GX7vQrObS/PEpEtsvR3+Ktemn3HFIXibepkSlIDnfUMkZTBII0yTdFQe+3yNPKx
         K3cvc6VpFCRTkLH83Ps5BH/hsEV1UviAgEVcUIRXdtnY1VKL5TaCDIsgYRWjXkwgYq6w
         vc7Rhc758ke4l6F3Z1PcYTCK1KTFlK57besrLpoyUN9C31QFIbSorxNa9SXZ0iPNoxyt
         uOYclfGqgLe/noZGP3G/OuGRFz8Lairampu90DWOwk9GLp+FmuILi/pBv5lIUNNF5SCE
         VhPg==
X-Forwarded-Encrypted: i=1; AFNElJ+BqqTdT47WIvrAYVJpyP+s/TwyP6a4tnb7LU9PwPN+FWyNGHvnl8CJJ25ZZ4MUzE8ek9/BBIo/zv+Cz2lLtgCh@lists.infradead.org
X-Gm-Message-State: AOJu0YyRNubk0C/Ewp56Yjc1xPcQ54H3qmhIWdjIDG5YSNMnMNfWui7F
	GAOqR5Bg//ysHVqjVCd/qo2WSX6jHTigPmiAX8De5v/l/cVld4cZ+5OVQBvKOgJHZePrnKpFb/c
	hJfKxB7s+1zY/gfQjnxGh806UolX86uNPoHnWPj3aKuBKyv/Jp1ouWNVRaE9YAVeAULOK1hPt5h
	VmevaZiQ5QNFMAV69v22KE9HleXxMIR1vdpY7pZq8o1CRhPSYMSSLE
X-Gm-Gg: Acq92OGHlm4JoM4hJAUWQ6Px1HD5S9i37B695WyKFyooxtFkvOVVsW9FMJf0X7T1yma
	xvz/1sRdHjT2ClzDKEGBhJCzEhkfGyqU5lQLz/r/zJrs7kdW2HZ009WDi8ok8W94Zw9VmVuu29v
	TNYTpdJB+eJwO1q+qA7BO1BsTDn2DBpA0mBCkw5rEWVUkJJ9o4iAo6DqquIdo/PZwzPqK7C7BVu
	ocDid9NVjnJ741N
X-Received: by 2002:a05:6214:838e:10b0:8cc:58f2:339f with SMTP id 6a1803df08f44-8cecdc3aca9mr28775376d6.16.1780481714561;
        Wed, 03 Jun 2026 03:15:14 -0700 (PDT)
X-Received: by 2002:a05:6214:838e:10b0:8cc:58f2:339f with SMTP id
 6a1803df08f44-8cecdc3aca9mr28775016d6.16.1780481714092; Wed, 03 Jun 2026
 03:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com> <20260505-clk-determine-rate-noop-v3-15-f3f829fbacdf@redhat.com>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-15-f3f829fbacdf@redhat.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:15:03 +0200
X-Gm-Features: AVHnY4LC-7sv-Yo8uO8EA2lGD_GeWV9mrQovi0mZKLxB119HM7ymo5rY21qtuRc
Message-ID: <CAPx+jO-zN7+q2CWGpMnistOqwVSipdQLi9b=fMwtZg_xy_Jxwg@mail.gmail.com>
Subject: Re: [PATCH v3 15/15] pmdomain: mediatek: mtk-mfg: use clk_determine_rate_noop()
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfX4NOkapqjuPJR
 q3SwAqqZFwdWoSb253grcRkNZ8soLbJW29ugymzik1f5nOVCndF97Mh+CGH+7SjAUHJsNG9AKHr
 8HbsTC3KbBfLHwHOyqxiH2lm1X/iMIgVVzR2E2NaKGEYJXMI6fsQHjEt28icfkCOjeqnH9vuAmy
 mMbiQsau3aADruV4jW96bQ9tCKQYB/dFNiPrqermV54qTF/+FZx2zPn5nbOWtT3EGa36foGzJkg
 JQWkJdvUByTQ/f4QUDi4ENDoyWjgootwtawa9HCLSnPEPVQbwS5t3x4PTF0itrkmXd26GW7qaq6
 xRIy5PS8tkY+QSX74KB53yDrjsJvOsTE7xu3ciQf4mwdJHwJwuKnNiYifEVVZr/Gz1QTQeMxS1j
 WVe1x+NIU1oJIrtQBHkCK/dOIRqjC9zYojyT+Tks8MQigfeosfOlKTTqqAcuuzwCQN0Y+4PvQFz
 Lx2F3Ca+f5Y4qQy9+rw==
X-Authority-Analysis: v=2.4 cv=UqZT8ewB c=1 sm=1 tr=0 ts=6a1ffeb7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=QX4gbG5DAAAA:8 a=IpJZQVW2AAAA:8 a=JfrnYn6hAAAA:8 a=rQN42pXJ2LDxoJgk6j4A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=AbAUZ8qAyYyZVLSsDulk:22
 a=IawgGOuG5U0WyFbmm1f5:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: nC8zAEowYQ16XloR5lSksewrYj9ln_Ft
X-Proofpoint-GUID: nC8zAEowYQ16XloR5lSksewrYj9ln_Ft
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_031521_279932_3BC2B6CF 
X-CRM114-Status: GOOD (  24.14  )
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

On Wed, May 6, 2026 at 2:49=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> Drop the driver-specific empty determine_rate() function and use the new
> shared clk_determine_rate_noop() helper.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Acked-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
> To: Ulf Hansson <ulfh@kernel.org>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> To: Brian Masney <bmasney@redhat.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> ---
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 23 ++--------------------=
-
>  1 file changed, 2 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdom=
ain/mediatek/mtk-mfg-pmdomain.c
> index 3ce6fb74dd53..64fef838776e 100644
> --- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> +++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> @@ -310,25 +310,6 @@ static unsigned long mtk_mfg_recalc_rate_gpu(struct =
clk_hw *hw,
>         return readl(mfg->shared_mem + GF_REG_FREQ_OUT_GPU) * HZ_PER_KHZ;
>  }
>
> -static int mtk_mfg_determine_rate(struct clk_hw *hw,
> -                                 struct clk_rate_request *req)
> -{
> -       /*
> -        * The determine_rate callback needs to be implemented to avoid r=
eturning
> -        * the current clock frequency, rather than something even remote=
ly
> -        * close to the frequency that was asked for.
> -        *
> -        * Instead of writing considerable amounts of possibly slow code =
just to
> -        * somehow figure out which of the three PLLs to round for, or ev=
en to
> -        * do a search through one of two OPP tables in order to find the=
 closest
> -        * OPP of a frequency, just return the rate as-is. This avoids de=
vfreq
> -        * "rounding" a request for the lowest frequency to the possibly =
very
> -        * high current frequency, breaking the powersave governor in the=
 process.
> -        */
> -
> -       return 0;
> -}
> -
>  static unsigned long mtk_mfg_recalc_rate_stack(struct clk_hw *hw,
>                                                unsigned long parent_rate)
>  {
> @@ -339,12 +320,12 @@ static unsigned long mtk_mfg_recalc_rate_stack(stru=
ct clk_hw *hw,
>
>  static const struct clk_ops mtk_mfg_clk_gpu_ops =3D {
>         .recalc_rate =3D mtk_mfg_recalc_rate_gpu,
> -       .determine_rate =3D mtk_mfg_determine_rate,
> +       .determine_rate =3D clk_determine_rate_noop,
>  };
>
>  static const struct clk_ops mtk_mfg_clk_stack_ops =3D {
>         .recalc_rate =3D mtk_mfg_recalc_rate_stack,
> -       .determine_rate =3D mtk_mfg_determine_rate,
> +       .determine_rate =3D clk_determine_rate_noop,
>  };
>
>  static const struct clk_init_data mtk_mfg_clk_gpu_init =3D {
>
> --
> 2.54.0

