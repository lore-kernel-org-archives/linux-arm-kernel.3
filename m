Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1C1C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXYzj8wUxZawxdlqOG9JD6vCCnLWpF0jT2NKjRsE0M4=; b=mSV1N54KIjZexaUUc9tLXba2wW
	Uzue7BMmAj5ImnRO1xxLlU8O4YBL+M0TlEmNJyFgOGM88RUn7TvMkwBVkZGNzflV0uwOpbhfSCEQC
	8arHDk3U9a8M+Q7WtfMHVb2NmBvxABophpFRBGzZBxCdVKd1Fm/gjvQJE5gJxuLFiKyF5DMcHd5Uj
	3BhN9yH59izUwknEwR37dOngJA1GosopcEntVgrf7e2+nbvIQamclaTL/r//Sko51zjzNx3JTvpaL
	sGtdug5K2rgh1ZuAg0CewYxF/wKPiTMmFL4WQovKNrnNaDho53EO3mwIQmOEuSLBSOlLTgWzfQHA0
	HEuqCJeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiWc-00000005RMx-30L3;
	Tue, 28 Jul 2026 14:11:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiWZ-00000005RMZ-3zve
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 14:11:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SDOpIG3066615
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pXYzj8wUxZawxdlqOG9JD6vCCnLWpF0jT2NKjRsE0M4=; b=LyoTOcl4+5hL+KLq
	xoha+jRqy2J2DdVQkvKYJ1DhmF+DlrXPJYqBs6coJdxrj/Ls+DwYS4UoIVtj4Wpb
	kFZakPjJW9CUkjPM6lJNgomLjFo5+RX3wF7x5JdPW+0BKq/wePrvIOyIP880SUGy
	3JBrSONKh4JIMtHgABwnyg7Gxilf3Yf0/oLCINXDHGff4nbCBI3ow432r7L5BIt8
	XXya7NI8uCCme9vSPcvqWYhL/13KjhCYQP1snWCln/nOSufHL08BKXGWXJUwXnKn
	KPLxda8Qvlg81geufLWXqTvWXT2R6DdEqR2XyBe95ZrqYyiCtiX/pQmIVMQDR2Bm
	90jNXw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fptath1ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 14:11:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-91931144870so473275385a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 07:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785247874; cv=none;
        d=google.com; s=arc-20260327;
        b=dcxY2PCWZ1gK7TYZlk/BZMFCKGBRY3hO59JVUCTBE1dJIhqwqI8Jjq/qoYZqOd7IGQ
         UX2oUWFHtpmyWxqmXYOew5usroLXUowzaK0ClRYu+ctOsotAhPpEgUSFjlHDJnlRUTlt
         pPNmg8U6V+OQukofHmuQtghzyIdEMKBJ8XI83uQEXxQSestgg/1ZOVN8uI4paMNWuH/4
         29O7A7ljObk4xhsE4AYHapeu1494LDQbecN3x0EWyEYlgHk4Zff79Buzwqb3NYYOS9IP
         OfBqzz/6MAv90J0Bk9wF7MMWn+4DPki+dLuNFUJvazDdPnegmt7LFKY2G8OCR+qlM/l1
         B0yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pXYzj8wUxZawxdlqOG9JD6vCCnLWpF0jT2NKjRsE0M4=;
        fh=dQLIpUkvoVrTtqoe1R8YUtJVELrZpcXvnxj65X91gqs=;
        b=qBrqHIEQeC7YUzUKtxEbuJ4cODHZn1ivN4dzs5Ygq1UdduQRbpxLC75MRjGdURwEyU
         S8iDsAOp78WogWdu0FmP19z6c/xiW8nZN66riAUF48Y0kPSOnXo54c9WikbWxap0vGUY
         C6JgiecaS8Gw2EMtRyQVQHGHW1mpxYPBVBn3dglY8CBSSUrdKG4sVSMZ2lmCqahIjqb9
         m7j590wDnZO4HKA4mrIBkM0SuihGCrsAg+36HA02YvwGll0lmVxbPQzq/QaUpNVGRb6F
         OXzN4KnS0B4fhpUDvE2L79sJYMZeli9X4f/HNNszVkh9+0NLfCgof8ayxYrvR60Y7opS
         DUrg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785247874; x=1785852674; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pXYzj8wUxZawxdlqOG9JD6vCCnLWpF0jT2NKjRsE0M4=;
        b=X+NDedYBZH3Ws3MW4qgTA4EEsmx6klSwKrUWfOyuzfhH3tpYaoPaz4R1e2DWd3Qz7M
         LYUGP5vCdBjNkAi8mpW+pCx7nIYpot4oaJcQwz6JGCZVsEUGnU+jvF61y/Etiq059hkv
         jxXdU9n/7sfjHDsGO646sXwk3weyv+RgynAb1HxjHUKw8xH7P/Zgnojg1gDHOTMyoBHV
         PfUNRmqBLPvXAvRfM0ly6b0accEo9w7+V7Atw0/XgD9pwSD8Qtr0F+zN5wAFlzgZWhf4
         zCZdLKxC/Ep2dKIU6x5RKjTRIc1BDr+QB42cW8OQrxBCwakzfIDLJX+fGGNMO1b1ogMA
         H1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247874; x=1785852674;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pXYzj8wUxZawxdlqOG9JD6vCCnLWpF0jT2NKjRsE0M4=;
        b=p7VpATxNnSH24UQAt4vt1dThXmuani1kh05zxiHqBP8/TOYFGm4XuVPzmpfGyHHL1Y
         TlOwZVV0R/q1RCwcMhD4z/pLH8qbc646TiM1fHtCCUq580/nZxis9CUEWDhPlH+AM62o
         132ZKp9jRG0GYPKnOFJFUr5QbhpmoK6ZXI1yBiArZgENllBUJ9O9ehSIXLE7yuXBtpLN
         Y/C6gIx73eRq4K0musV6U3/gwTcDqDh0oTkljqdRKg6Lcf81LtUtrG1sfaj0WJAR1/LP
         /NWJ4X0+iO7gxiK19ULBJ9JEXzt19mjZU/0RvTdkXDN+FtciROMnF6DaxLjWIEPr1hdC
         FB9w==
X-Forwarded-Encrypted: i=1; AHgh+RprhDZgF2tf1QaHBsAYcZbKXIt6jKyisZs7slLDiZQbxH8howO+rOqSMru7bLPK1yzyItz0cTHcq5iBz9vZvlUp@lists.infradead.org
X-Gm-Message-State: AOJu0YzaY+uaqU/VwTpjnbIZ+B8yZkp1ObLbznhlyj8zSz5qpQWiN2kn
	7gJbX6r3y59NyDJ6gNEEA7hNRKK3IeQicYrV5qDy8LhLBabOcuPLR5RGoPSaEZ/nucWdvD60IcC
	CEQV3XC8fS4TWzlGVVyJFBjsVQ0aHNU7iJmWNWWMaR8EgmXe5x+HDq2DwfM0LLqOyAt31YJQ4+k
	h4xMJtmJre19ILxotUgcxSWYTBPnXUeTVi5K7WizdEDOIk8WHTWu9M
X-Gm-Gg: AR+sD10Jolzc4PbDncpGRFUyvYdjrj9Q21DhOIoVUmoYxTkXK4OyVpA/g9x8Go/ZA+x
	e9XgztgTgOAgdgS0h4dy7m/n3lB3qdn4q74GWwAmT2zmw9aOL1+JPyJIbm86G0edVX2F0C9AeQ5
	plZmqmooqmXRDgn7+ebld5SnvPMltnyyvPznaEGntLKj+/vPFbonVy/5+dIYpLVoDCuRR9GPaW7
	QCJ8TgDcBH04bLcRvW4fST/qLBkk3bOZBfQ8nXBiQbBpJoUM2cFVlroi4/2wGdYCNedqgA5LfY=
X-Received: by 2002:a05:620a:4155:b0:92e:c117:5ed9 with SMTP id af79cd13be357-933027b2503mr237090185a.89.1785247874318;
        Tue, 28 Jul 2026 07:11:14 -0700 (PDT)
X-Received: by 2002:a05:620a:4155:b0:92e:c117:5ed9 with SMTP id
 af79cd13be357-933027b2503mr237081385a.89.1785247873683; Tue, 28 Jul 2026
 07:11:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260728-isi-v5-0-1d22ab91602a@oss.nxp.com> <20260728-isi-v5-3-1d22ab91602a@oss.nxp.com>
In-Reply-To: <20260728-isi-v5-3-1d22ab91602a@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 16:11:01 +0200
X-Gm-Features: AUfX_my42PvyrS3FcaDcQHI7hGXphBJTiNAhLBmqhh3UWN-wDUMcyOhj5-Qtq_8
Message-ID: <CAFEp6-33my_MgEJBmwpaAmACzpx-HoF2bXesGr5e6ojRhq9yew@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] media: nxp: imx8-isi: Add 16-bit raw Bayer format support
To: guoniu.zhou@oss.nxp.com
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
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyNiBTYWx0ZWRfX7vI6iHE/88SZ
 MbuLy0rr0pxt/lLlDMtkSyUI5rLEHU+xxUuOzH27qSe+S7wpI6KeCq1ycd9YIREH5NvLrYENf9U
 SMPrW9KPyFsT1EcjrYhW5LqdgrHuWMY=
X-Proofpoint-ORIG-GUID: av1sSR6AA6u9RbYK-QqXPzFLTPMLIO07
X-Authority-Analysis: v=2.4 cv=KtJ9H2WN c=1 sm=1 tr=0 ts=6a68b883 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=8AirrxEcAAAA:8 a=P1BnusSwAAAA:8 a=EUspDBNiAAAA:8
 a=6g14dlwTP8NX5ZwT2TAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=ST-jHhOKWsTCqRlWije3:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-GUID: av1sSR6AA6u9RbYK-QqXPzFLTPMLIO07
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyNiBTYWx0ZWRfX9qOfWZbrX5Q0
 1oF9899bQFLxjqV3BQD0W9yYnLF6svmqu5wViKnRvPByZ6ugjh1C600MvhFYVFfc5nvu1kwlw6r
 bbX0w9iwcywQP1P8X0hrRJqsh8Qy4YrwBNhRJULflA/Oxgpa2t3RkmxCMaNfjMhesgDlth81hB5
 hhpDbq5m41u3tgodWXNmc8xfMc2gLMc5pEwlsHKzQsloc2OsVQy3XCEIBGJe9JFldb79/ipS1bI
 uikrnwLmH+4EgbaYNbgo2eALjQ4Mn9W1R1YwggZv5BsrWJoIgmv2io4L/6ghVj06TUcLEAgygV3
 I7Q01pziuQaGaYz+dyKGx8kZXxTgbZ/KC7wJVC1/I2oavtjC1jW6VOdZ30tLjt+sN6b01zvF42m
 7+7FtDBHDmw8LjgIz+48WJKbI1T5E9yW38JhRhtdNHQGcqOwRti6BW8ZqjSN8rQ27T0+hUDGC6E
 uFkFTfXu8a5ceyukU3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_071115_999467_88035649 
X-CRM114-Status: GOOD (  20.87  )
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

On Tue, Jul 28, 2026 at 8:55=E2=80=AFAM <guoniu.zhou@oss.nxp.com> wrote:
>
> From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
>
> Add support for 16-bit raw Bayer formats (SBGGR16, SGBRG16, SGRBG16,
> SRGGB16) to both the pipeline subdev and video capture interface.
>
> These formats are used by image sensors that output 16-bit raw data,
> enabling the ISI to capture full dynamic range from such sensors.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v3:
> - Remove "high-end" from description as RAW16 is common now (Laurent)
> - Add Y16 (16-bit monochrome) format support (Laurent)
> - Add Reviewed-by tag from Laurent
>
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 30 +++++++++++++++
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 45 ++++++++++++++++=
++++++
>  2 files changed, 75 insertions(+)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/driver=
s/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index c0ec59856374..934f7b356258 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> @@ -83,6 +83,12 @@ static const struct mxc_isi_bus_format_info mxc_isi_bu=
s_formats[] =3D {
>                 .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
>                                 | BIT(MXC_ISI_PIPE_PAD_SOURCE),
>                 .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_Y16_1X16,
> +               .output         =3D MEDIA_BUS_FMT_Y16_1X16,
> +               .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
> +                               | BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +               .encoding       =3D MXC_ISI_ENC_RAW,
>         }, {
>                 .mbus_code      =3D MEDIA_BUS_FMT_SBGGR8_1X8,
>                 .output         =3D MEDIA_BUS_FMT_SBGGR8_1X8,
> @@ -179,6 +185,30 @@ static const struct mxc_isi_bus_format_info mxc_isi_=
bus_formats[] =3D {
>                 .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
>                                 | BIT(MXC_ISI_PIPE_PAD_SOURCE),
>                 .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SBGGR16_1X16,
> +               .output         =3D MEDIA_BUS_FMT_SBGGR16_1X16,
> +               .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
> +                               | BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +               .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SGBRG16_1X16,
> +               .output         =3D MEDIA_BUS_FMT_SGBRG16_1X16,
> +               .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
> +                               | BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +               .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SGRBG16_1X16,
> +               .output         =3D MEDIA_BUS_FMT_SGRBG16_1X16,
> +               .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
> +                               | BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +               .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SRGGB16_1X16,
> +               .output         =3D MEDIA_BUS_FMT_SRGGB16_1X16,
> +               .pads           =3D BIT(MXC_ISI_PIPE_PAD_SINK)
> +                               | BIT(MXC_ISI_PIPE_PAD_SOURCE),
> +               .encoding       =3D MXC_ISI_ENC_RAW,
>         },
>         /* JPEG */
>         {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drive=
rs/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 056603055c81..a6e044056762 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -212,6 +212,15 @@ static const struct mxc_isi_format_info mxc_isi_form=
ats[] =3D {
>                 .color_planes   =3D 1,
>                 .depth          =3D { 16 },
>                 .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_Y16_1X16,
> +               .fourcc         =3D V4L2_PIX_FMT_Y16,
> +               .type           =3D MXC_ISI_VIDEO_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RAW16,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 16 },
> +               .encoding       =3D MXC_ISI_ENC_RAW,
>         }, {
>                 .mbus_code      =3D MEDIA_BUS_FMT_SBGGR8_1X8,
>                 .fourcc         =3D V4L2_PIX_FMT_SBGGR8,
> @@ -356,6 +365,42 @@ static const struct mxc_isi_format_info mxc_isi_form=
ats[] =3D {
>                 .color_planes   =3D 1,
>                 .depth          =3D { 16 },
>                 .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SBGGR16_1X16,
> +               .fourcc         =3D V4L2_PIX_FMT_SBGGR16,
> +               .type           =3D MXC_ISI_VIDEO_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RAW16,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 16 },
> +               .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SGBRG16_1X16,
> +               .fourcc         =3D V4L2_PIX_FMT_SGBRG16,
> +               .type           =3D MXC_ISI_VIDEO_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RAW16,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 16 },
> +               .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SGRBG16_1X16,
> +               .fourcc         =3D V4L2_PIX_FMT_SGRBG16,
> +               .type           =3D MXC_ISI_VIDEO_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RAW16,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 16 },
> +               .encoding       =3D MXC_ISI_ENC_RAW,
> +       }, {
> +               .mbus_code      =3D MEDIA_BUS_FMT_SRGGB16_1X16,
> +               .fourcc         =3D V4L2_PIX_FMT_SRGGB16,
> +               .type           =3D MXC_ISI_VIDEO_CAP,
> +               .isi_out_format =3D CHNL_IMG_CTRL_FORMAT_RAW16,
> +               .mem_planes     =3D 1,
> +               .color_planes   =3D 1,
> +               .depth          =3D { 16 },
> +               .encoding       =3D MXC_ISI_ENC_RAW,
>         },
>         /* JPEG */
>         {
>
> --
> 2.34.1
>

