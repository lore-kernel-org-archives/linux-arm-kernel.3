Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C4F6C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3Pf6ybetTMox7LP+PnSCdMNRpptpmQ3Q57LrgI5uBQ=; b=wtaj98gwpGCVHRpaz9ZGgnMWSh
	H9KKqfCpzjCXNSBEjh0AaELQatfXUpmKnTrNJiWg9dRJUKL1GV3xGWF0fqvXQnCgNnFx0IvNPrsAP
	OM/YZq8s0hh1bqyt7F5SJ4jNGGuog8wgYuLSjEVF1gXbPMRSGP2GPUJQjod1lvo62mvuSeV9BNZc8
	Q67ScoLU1boX7MagDXc15m2T34ca6msUfqb3GQCP06KTqHr4Zx7z1NvT3yrgV9bUeh8aHBwcXG1mG
	TnK6MxWYG580kVbjmv3JsO0dAasAd5AxsS4zm8SS1Qp11Oc2a/FJmE1tKOz3vldB/XHeBeYZRaAx/
	VjEZ86Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu51x-0000000Fiim-3eTk;
	Wed, 12 Aug 2026 09:13:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu51m-0000000FifY-1klq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 09:13:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67C8YJI42987169
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 09:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3Pf6ybetTMox7LP+PnSCdMNRpptpmQ3Q57LrgI5uBQ=; b=L7sFrA09AFPegeVd
	dwP8/Th3CeYGncUc4G8wz5nz+cru39v3r9jFGPTdx2eJYIGC/nJkbn7Mhzl0oAVf
	PAAM5fTe60+L7xOyrbw8+Ay04V9W0j9MPsGUr3mfpb+PmxpshMEBHDiP/as4Q8mJ
	vhxO+n65OvYhvbUQI6rKOM/JBL3qiTRME6KI+brCiZO8Fja4G5gWMkwjDsIP1JS2
	WyPNlIQyw2cA+SBz9kDrJQTKnJxzk90AzEEUoICMkAwbsgbThSfbarmxmESDRczJ
	TQQAqZ6/h8YrTGqfWMrSq4rrwE/tSOnEHnsWYvfwj/dBgpC/W8n89lDQdAQ030st
	Ibhc8A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049kmgjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 09:13:37 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737f1f1e1bbso124277137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 02:13:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786526017; cv=none;
        d=google.com; s=arc-20260327;
        b=ehUFFo7LuhPAuSh6QQb70grutCOGDjk6quNnQ8At9U3QrfAYHLYSSVuwe1Mn9Qd7P+
         VRo/81gTq5N1de5iDwws28RfsAthQKQM0fBubFBzRQnEyKy9qSpHAHCccOoB3WquofnC
         t6OC4O7bqADt5m104MWAzp1q2QqyXdGgc4bnXwGTiutxLCStvPOjmMSAL6xP5d2mtGYH
         8M05rtZTZUWrUcsrjjZnV0N7q1UUJeb4oqX/p+l6rJZwubL4yy5ALykVkgT7WBjZZOoH
         auQ2Sr8CPaNlFCxhReEvVCcN9YFqQrUKHWUbgRizQ2XADdzHQDD31j780BTVTmKO+HZp
         us6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=J3Pf6ybetTMox7LP+PnSCdMNRpptpmQ3Q57LrgI5uBQ=;
        fh=pucl23jSagGWo6NmS2KKrgwGA6sOKEYjm7Up/dYDe1k=;
        b=e3XHbIizZAu0OKzlK5IKDIErr/6pMMveEPQNYXf5/udxIa1WpzG0ORgTLyol1k1mnd
         pppD6/VuPJtgJ3pK7dIRITpYIRfdSolToUqh5taKifo4YNxK2IqvPq88rhDHowTHURZB
         ocuRYR4HHlIFfvj7QDJWgZ+bf7MXxDs57tFBKlqWmFpdZBWFdu+iezgiGUEBfXPN10DW
         B17EZwo3YKttTRCq4tmIjznUH7vAGW0ajjaZig6zW8ECIYOrkpZkuKXKzSixw4OTWwIL
         A8//TejE5cbiw0p5J5dExcmhfM8usZ9zSPZJ/zMzsqTjHc2aDQQyvR6X53hP+jE4EOvs
         +loQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786526017; x=1787130817; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J3Pf6ybetTMox7LP+PnSCdMNRpptpmQ3Q57LrgI5uBQ=;
        b=IFibTQ567HkBeP4V8NN1o4Z8yVyboPtu+zKMJ3/mYWVUsYdQOObGnKXw5aDW+jFAwH
         naaIV+NpG8Q7YwsVB90bX0n0M8NhUGzy/0ZYdcyiqj2su9DtO4U/POUg5EbDcFPR09CY
         8lPV168PTAB76Ey4j1D2NVgmMN4aRZ9ZwW6z9uR2AolEg49U6JOoH2rGQs7sWJt8iApp
         O+8OLbZakQTP77zL0+WxvEkTLUJQOnqNVEXeUi4ire74T1ok119mwAFXyk2/OgWFnaJw
         twCzNlDqEOc2WnruMSr2N+kjSnUtfgzKdAYXKhETf5QqHcSMSxCJ4gayQB7R8pkXWftD
         2Xmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786526017; x=1787130817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3Pf6ybetTMox7LP+PnSCdMNRpptpmQ3Q57LrgI5uBQ=;
        b=PUpaN8OtfDTmXKTkzLnyJfaeTRQlpDfZpmxJjFpvaTSYvI/MuNrAhwOilic6bQ55b5
         lYfSUFweQnusqyz4yRo+Dnmh8VGuI/y1fdLRVYp0F8+41ypgYMGV9uP92MXDrcOiJRk6
         THr4ioEqkuMLmWXmycLRCpLZdKQEv/GQRTiEalY+mnEqeniFt3qDI13+AhwKJIOESd1w
         Nikxz6/37dtR/z6Nqj4To3awz5s4vQaMwNiT0fQSbgNYD3vP7gxqPidSlBekR+N/U1dB
         +0qMHG+bZMjyWZGylHwxn9t60qzHtQKyysK8hem1DuG+UpiD7E95IXCam5fVfoO5TZIw
         RyGw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1xkVjEpfL0AihdpMORg+mzd9AkIhnZbmbAU3+71urmlyLxkrfNRrJPXbi1jPumuxKycsVphxIdzAb9YquV9Rv@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1Yru20b/HxO7ovNUFRMYFU2qI2Nkc0UBG18jaBvhTEvMifbdX
	86gtKOyp6K1UtH0B4x7N+ODnJG/lfAOV58C9Ia4uiUejn9hIAP2ZmdPA1uZivbmgp/yEj+MkUGj
	0xKr1XGCefCAKvnZ8vE497DDfk4G5out8CNW83qvAyH2/WvYCWhGj45jEcQn5XOmE2GW629fH9O
	y68P5dpiHM4OOhMaugKe4qZRosW7KVSd3Gi5QBNFNkzXjLieUZCP0g
X-Gm-Gg: AR+sD105dGxQzDT17EyLrUXoOVZZs48mVUa/H30p+ND/X4DhLHirD7IXxmDAXYAzP5o
	8cPX2rWTCGAZ3RqfFgpaYJK8/Dp0yG8Z3uC0mz8UVSui35s1EMAmXtllKbU3Lj7GOrLgTmuomzQ
	6BepF5InuVP9MYk6toYO7OETO8sOVJogt1oWW2YiTIHcfQTRgID9qr+3FpiJAbBwCxB5iE2jnuf
	YDtetQ6tsRK6cwktw==
X-Received: by 2002:a05:6102:c13:b0:6a2:b2a1:f16a with SMTP id ada2fe7eead31-76c877585f8mr619078137.2.1786526016774;
        Wed, 12 Aug 2026 02:13:36 -0700 (PDT)
X-Received: by 2002:a05:6102:c13:b0:6a2:b2a1:f16a with SMTP id
 ada2fe7eead31-76c877585f8mr619064137.2.1786526016415; Wed, 12 Aug 2026
 02:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260808150506.78534-1-kmehltretter@gmail.com>
In-Reply-To: <20260808150506.78534-1-kmehltretter@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 11:13:24 +0200
X-Gm-Features: AUfX_mxrjM8iyAWaDhMnquvm67hwsMzBGMAivc7nk1vv82k5vyDswHGVflOUtdY
Message-ID: <CAPx+jO91LMn4SJXvy_zi2zOcmrDane07Mnh_+bKLztozFyPF-w@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: mediatek: mfg: initialize prev_o in mtk_mfg_attach_dev()
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
        Brian Masney <bmasney@redhat.com>, linux-pm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: OvF7SvcM57Kq9ZqpZZGMboChiOW9BWBt
X-Authority-Analysis: v=2.4 cv=IO4yzAvG c=1 sm=1 tr=0 ts=6a7c3941 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8 a=xhlwbj9xLX0jMGTAeIgA:9
 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDA3MyBTYWx0ZWRfX3w+sn320fB3W
 gLdrJZvQ4Bif1z0c018cczQ5aaMKujWf1zxLsFsTf/YFg1P/94p46tpitfFM8cY9AnY3cTeqT/p
 ErcUIwo2Gvq/UPbQ8OX4K2wNRavIGvFf4lguhTdXd79SZ4s6CXdMf1wO9H6bCtgMvuzHLc86xe9
 3nIeN8veiblqY0IAhUnoD/w4kowNrMLb7jmsEnDXsLkK5uFdEIaR2hHqA+/lutRJUe7QJpMrXQ9
 koF3Ju+vX7WSih8TWtefjuXBI5eptELOjfSxRVBXgZoQ3Pve+RoHfKBxcArajxzEeLALx3DyjPV
 pkWKW5xKyt1NZwciJ2YvAK6P3NMSFfnijYyrxDdRWEjhp+mPih9EvxCo6J7qi6eOfE4TL3ukzz+
 nH2t5GAWCQ1fpt8VvLpDkjulHDazm4RlxcHata8vA7JBiN9OUHxpoSbwqvrXCdFg/sKNiXgN7iv
 925OWvoHKMbbbjEv6uA==
X-Proofpoint-GUID: OvF7SvcM57Kq9ZqpZZGMboChiOW9BWBt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDA3MyBTYWx0ZWRfX8Q3J3j5n8lLu
 V4nlayT5ATRDJkbDqsri0H4Gp+iM/TYEirtrjAhJJ2wFoQX2X4zaCPJpP+hsD/QZzRKn/FA+P7J
 SirOnjysnA2WW2KTvXaQPD4XVoUQSvA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_02,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_021340_642944_47F7F55B 
X-CRM114-Status: GOOD (  21.96  )
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

On Sat, Aug 8, 2026 at 5:06=E2=80=AFPM Karl Mehltretter <kmehltretter@gmail=
.com> wrote:
>
> mtk_mfg_attach_dev() reads prev_o on the first iteration of its loop,
> in "if (prev_o && prev_o->freq =3D=3D o->freq)", before prev_o is assigne=
d
> at the end of the loop body. On that first iteration, evaluating prev_o
> reads an indeterminate value. If it is non-NULL, the condition
> dereferences a stale or invalid pointer, potentially faulting or
> incorrectly skipping the first OPP.
>
> Initialize prev_o to NULL. This matches the intent as well: there is no
> previous OPP to compare against on the first iteration.
>
> Found with Clang's -Wconditional-uninitialized.
>
> Fixes: f08e7a4e8d6ac ("pmdomain: mediatek: Add support for MFlexGraphics"=
)
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdom=
ain/mediatek/mtk-mfg-pmdomain.c
> index 53bdab66cf157..9a8a38d98cce7 100644
> --- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> +++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> @@ -657,7 +657,7 @@ static int mtk_mfg_attach_dev(struct generic_pm_domai=
n *pd, struct device *dev)
>         struct mtk_mfg *mfg =3D mtk_mfg_from_genpd(pd);
>         struct dev_pm_opp_data *so =3D mfg->stack_opps;
>         struct dev_pm_opp_data *go =3D mfg->gpu_opps;
> -       struct dev_pm_opp_data *prev_o;
> +       struct dev_pm_opp_data *prev_o =3D NULL;
>         struct dev_pm_opp_data *o;
>         int i, ret;
>
> --
> 2.53.0

