Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE42FC531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 15:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I8P/LRw5Av63ejvXZypK/le3J4llN8sJRzn4b+AZYkg=; b=nyoalmx6u8IfRPW2AgkhRsqyWw
	tj2QVQM7rCLVF43805TlFxa7nNbiaOCNxCCOz1gW7sHeml12j6TNTfN2uPxmI25xvY36/uyGN69IS
	e8IwtPa2X7wb0Z7cq2j91HM3uzZxRU/c+MgfsJCOZQSHvAyyeYTCsKNVbY0caG2yyETa2/LuJMnF8
	qIS4qZTwEKxkrb+4TIE6P4RyXZCTRNalY43n/fre6SUh+lA+6Ks0tKocShtZTeK5+k9264At9eRc/
	NACHRJ3l0kK8AA0aJV7UseOiYftFmYja25LRXwQP9LgdLQiuKohgOVEuvSw8UDbfD9dGUkJPjzHrn
	TfEYAVDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHn5-0000000Ghgm-0f8T;
	Fri, 24 Jul 2026 15:26:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHml-0000000GhXa-3rdU
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 24 Jul 2026 15:26:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=I8P/LRw5Av63ejvXZypK/le3J4llN8sJRzn4b+AZYkg=; b=GIl3Bl584VTtpHRpogiiAP+Eb1
	fdvJybycj2rNhZCtR4/TB8kGk2W6n7Qu842A1gHDIDlel9YY+Z6RVvqa/ZpI8DTYiMw9nod6PD0nm
	K/OZYVLs69nx4+wDmNOjx3ipfdI0SPcFWQx6lyRQZKdRFA6hcmGptcW4Af2XB5nvP0YY4Ekwjx1vy
	8zz33ApdLN4Js2i/13afpwhgTdUOE0EhccCv59vkVpB+OUXsDLRUQnO/IZgPOCp2W4QRdi/zcpWx7
	ItZhM2Z9BsA0shBirATFOClQGJjGkVw8KJLmdt69QVRegSX/np1OOktPsd6MLZiC9CeksdF5PdyqJ
	3t/0DYpw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wnHmi-00000002hqw-2buy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 15:26:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbtoW3198184
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:25:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I8P/LRw5Av63ejvXZypK/le3J4llN8sJRzn4b+AZYkg=; b=nYWy1J4YvasGb28T
	P7IuEzgm+jZE9tIL7w9A8gLlWpk4zyR82mseGSDhqeGl4HEaEJYLMWTxPk/RrXKA
	jIom/zLXMzuEfoQ/l/4oCUjQfN1zcI3i+iqxX3eDtx1lqRTYjzdftBKX1wasjo5K
	eZ2sI0PsDcf4NPappk6EErwhbsNVDsbR7zumQfdmdDZiKC8CnUM2AJOb5UNVHTBi
	4xz1saDDYTRniPXaC/2wPn5RuP4Hdz6UsCrB5TzT33r62lQ8HCZyLDwJpvT1ghgH
	7x6BoX1IVouJRZao0qUYSHuCBLKg06q+4VXr1gqjiv9nUxTEFZ2/2tOCLfLObO72
	fE+2ZA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p52d03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 15:25:59 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ef8249f73fso11501516d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 08:25:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784906758; cv=none;
        d=google.com; s=arc-20260327;
        b=KcDJKVgh1nK6A2z1gw7y/XFfAeBnSUAsEHAbq/z3SSfg3C89hDlaPfVpfKZtJyAsBV
         pV6T43aknsq2qSAWkHyMnmeK/bNyfp2uhmi2PBk4suvfvsq43AYpRR7UPqDGlnYZMJNJ
         mKbZKHci0VBrRcPLJohLHgKFJtYq9HJ8JrQaQrSlOz+J+uQVBpgKvleGdEwxOVZxa+SL
         Z+lX+8bP76QJZ7up9NJ3jYMioPg6Ovud4g1ok3bfKTsEC3G/x8vYDRTEL3oBMc35i8WK
         cExmi04cQJTa5J95KhVR8DQZz3XCA6P9uhSzY7WX2A6qKMse6yEr4l/PRkX9J4XX5sb9
         KHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I8P/LRw5Av63ejvXZypK/le3J4llN8sJRzn4b+AZYkg=;
        fh=kUkxN7sqa8QbxV7LY8cbRls0Ns8ZG+0I5Y8P/QKD01Q=;
        b=D1Js+NhUdjYUN/1EFOsb1feQakRxpazQR+iZ+oY5cPC0BOWs9pCplRA83GltsfQmXd
         B3q8bnH4S5oCpWjixqUc7+HywNby16chClWLnmDJQ3K9nVu4It/N1U/UPDjtNQo9E6JU
         96yZ/rvY8xq5wOD9kz/BI+7tsZLuH4MDZ4cRw35ltGYMIiHuf6+tjJiscwNyv2YMdpjN
         jR7XnRXuxrhzmAQJ60fMRkKzEkBEyq3up8rJUq2Aav8exI6eYYi+Oxf30DnvQLq7lguQ
         UpM9OPZ/jtAE9PAK2lOFiJBcGiAL+gv0AptZ7z7SCySvZQG4Ox6prYqDToknsd2b3Ri0
         QuPQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784906758; x=1785511558; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I8P/LRw5Av63ejvXZypK/le3J4llN8sJRzn4b+AZYkg=;
        b=bkepVuOU52Ct0jfnUVqQsJ/tUyHWTU19l3LkF7hPEDC7ghmQMCBrInlAdGdUMxB6Pb
         1ceI6juf6lJt+pF40PXZzmuDHoj/Zs6c6Sb/exU6TxpCpUkyWOeIt4VDzfxJj5EXHotD
         KfcJyLNtWyIdKmOGCHOinakqfQ5K36eiOwJxczeIj5RyJnW2CqqiiWodxyYiXi0oX98H
         Tg6ewohsMRoL1eNwuEldnT3eV1Tn4u8bOKXY8Bmgx7hDfeQTMdPIVhTQlyPf19Qh/8P8
         wGGsCcDY+hClqwu64tfCczIrBK1w/sAR7uIy0y+J9pSHYdd2IXNHv6u45VQe+u9FW8fZ
         RaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784906758; x=1785511558;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8P/LRw5Av63ejvXZypK/le3J4llN8sJRzn4b+AZYkg=;
        b=T9K5+jNF2rHgfGJ4eZhX/mrWH7GlKNlQR+dle21u1A5TZgtxq5gSEtD2u/Wu2/nTyp
         CGSiPUKQ8tkKwV21bBn9QlBnqDAZj5XO/YzOj0941AdPyQ8+mfwo2cD8bIPObZl5EFhM
         z+iDcwFKPbvm1vGTEd9tRb+WbRHLjlpStXYfAhqtha4I05dchM35995svA2+Sw+UJYAa
         J9V2FVAsAXHEpA1B3AQCEKaatt1Lk3ERZm1I9UDcpjLl7gMV0YIaSt1YxkH433l8lM2h
         8SXcArrFoxsBIVicVuIEcLt6jJXO0se/vSos4DMnUolFkWwNzexvB4eUux3nlw2DADkW
         YnBQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp8iVIZJKCuuW4WIwSvuH5xQWAUWRLA2p3f/DMDtbKfJAJbDcRJiFN3JTfZW4pEylXcVJ1kTu9DXc9JSWYzKd/1@lists.infradead.org
X-Gm-Message-State: AOJu0YzntFJDr+LsmV49wiLEtnlcaYThZfbnDA8bCe2Qlh97k4nXRgyw
	dTkydrS8UyPb3tdqIO+0kbXZdPVMK/laWTZvQgAbHfIMcVvfmL8ZCuYJbKCT+j5XeRuSuEiptU9
	IqtZdlQmAhtLsLAOi4P+alqlU4SVasL2k2Gi3miKtX0whezhgGIa46myTOG6nJ6EjxnuQXWkHq9
	Am0m/K7UnriUawYxwh2LOJ0sd6dCCDpEV69/XW/rsAOg10iQVjHm6k
X-Gm-Gg: AR+sD10IpzSPzQRESbLJxKLVQ2vqga+d2LQZeVZ1JkNKMdyfbOxwUanS2CKyKh1AlHO
	ey4wZ3cpZskht/3+i7raoCdfy2IKbOwoHYYvzaNgubb7obk2JVASzCb3kOt+4IJskVDUZuAy1BC
	ih/Yo01W1YM+X8ZTZ4ML6iAK6QoxqKkKzqW2BF6ahQjnWa4Z1DZ3ZRs1j9eA==
X-Received: by 2002:a05:6214:29ce:b0:8fd:6e22:c7ec with SMTP id 6a1803df08f44-907ca57ac87mr92244506d6.61.1784906758558;
        Fri, 24 Jul 2026 08:25:58 -0700 (PDT)
X-Received: by 2002:a05:6214:29ce:b0:8fd:6e22:c7ec with SMTP id
 6a1803df08f44-907ca57ac87mr92243986d6.61.1784906758119; Fri, 24 Jul 2026
 08:25:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260716132603.2327847-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20260716132603.2327847-2-u.kleine-koenig@baylibre.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 17:25:45 +0200
X-Gm-Features: AUfX_mxxKiB1do-atg-rTre7pVoswHFzTOplPvRF1EBywznaNQKzflz6UIrGwS8
Message-ID: <CAPx+jO_k2fJRvXiNiqztHXDbCvkHrDzbM46egyiF7RQX0rsK0w@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx8m{p,}-blk-ctrl: Add MODULE_DESCRIPTION
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
        Xu Yang <xu.yang_2@nxp.com>, Ming Qian <ming.qian@oss.nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, linux-pm@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a638407 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=IpJZQVW2AAAA:8 a=GSG5rVEFErVBAG7bqOoA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: -m-UsUfL0muOuxnGRNJ2UnatYwVtVDr0
X-Proofpoint-ORIG-GUID: -m-UsUfL0muOuxnGRNJ2UnatYwVtVDr0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzOCBTYWx0ZWRfXxZV+dkUEBtl4
 ymuJaXmBVNQv6Rdw2L3prAWDOeYCvHFHS0k/t+w70Oj6cH11h0FhhgJzFN7bFV6CXN6ufXjv7+X
 I0zRtnVdenGrkW75GCWM2QEBWb4PRZk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzOCBTYWx0ZWRfX6Jfjz42lBf82
 QlGCSvoT5FWOH4oa+tt61tTbF5XTGC4fOC/+m1ntbxr7I5BymGEityQ5mv+7g6M19lSGbgR6/fc
 gZlL71rggzjJLu/3WKty8oyW9789enG6vUdKw4Iq4heXHzE6dG3wt6zfFHK6+7sinWXCE3+6MOR
 n9jFRT2TLp9cb/QIrf8h2CHA1ZWt51mk6kmj7YVu2cisSfCuKy+piO+PNIKBtArDB6uMUK1upR0
 mCnYflpBwVJwUO2LucQVrVXwAXvDS/JlbDdi5CmZzcMZRy3wJzgHCgmdC4W+NzT+YSCS/cREky2
 C7qC5vUgdj6iFToFhWceF2kn96b3MSMMCpoRyN412sO8jkgxam2DwPbH27Z4EluWaDWARBup0Mm
 wjX8u+2jIXgOC8jAApozAIDaDPyjPxoHwAVXTrz5KKrpV9uZIU3lQ/pg3Mkj5N7EqF2uU1pOY7F
 Q1SFyCzDvqfaTGFV/4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_162601_134016_959EBDB6 
X-CRM114-Status: GOOD (  18.37  )
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

On Thu, Jul 16, 2026 at 3:26=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
>
> Without a module description modpost emits a build warning:
>
>         WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pmdomai=
n/imx/imx8m-blk-ctrl.o
>         WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pmdomai=
n/imx/imx8mp-blk-ctrl.o
>
> So add the required string to these two drivers.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c  | 1 +
>  drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx=
/imx8m-blk-ctrl.c
> index 99d100e1d923..479789009c7f 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -953,4 +953,5 @@ static struct platform_driver imx8m_blk_ctrl_driver =
=3D {
>         },
>  };
>  module_platform_driver(imx8m_blk_ctrl_driver);
> +MODULE_DESCRIPTION("NXP i.MX8M power domain driver");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/im=
x/imx8mp-blk-ctrl.c
> index 3f5b9499d30a..d255c20f58e2 100644
> --- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> @@ -890,4 +890,5 @@ static struct platform_driver imx8mp_blk_ctrl_driver =
=3D {
>         },
>  };
>  module_platform_driver(imx8mp_blk_ctrl_driver);
> +MODULE_DESCRIPTION("NXP i.MX8MP power domain driver");
>  MODULE_LICENSE("GPL");
>
> base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
> --
> 2.55.0.11.g153666a7d9bb
>

