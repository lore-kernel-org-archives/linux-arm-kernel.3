Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C4AAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQwQS+P0In/tSfCSz/KgwVUgfBQ1+zeASmjyD33V1A4=; b=wRN4Sh7unD0f4x3U9KAhDEpgnc
	tdq2upevdX357VannXWEJuM6PIDFIpz1jFF8DkJw7n87xc2o6zj/tVlmWaR1RiQ0WKJamNU5wBvM3
	dUqSO7j2WVw6hmcOEwx5xuxoPdqVX5k1zbmJdI2cIQ02uMiYdg49oA5DdlYKqOwTBjOC5HEerOtAw
	rPgGP55dthLwwLoJkYoOWxBaU7yYT7krn2RTCxoITnaqGdnOVHyHeUSBIJkoQ8SW//DLsrIlhiK8A
	0+dP0cJJ1p7kQIxIhXBOL8aOccSqwWn2iAdg90Af180JDv/Gq3nOfU/K/8+NAxTMP0cA+lltnmKGe
	u8W3U6YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEUO-00000008xsj-3LTm;
	Mon, 13 Jul 2026 11:06:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEUM-00000008xrZ-1iE7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:06:19 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DAbekr731614
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 11:06:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MQwQS+P0In/tSfCSz/KgwVUgfBQ1+zeASmjyD33V1A4=; b=FZuvx5BP2TEcdOCr
	Q0+YvVkbsf0w394AYZqX+t1q6oZpOxjUTAgoWCfRrY2QzPycABl23Aw+m4A7pzae
	q2PqbXQhLWfu8i/YNzSThqsHLImjVecIz02rP5648jFyYjcmtExOxfVQkq4UUqBF
	vC8FtC+P6z2041LLd3rPjLMM9VyDedVnhJn5u7cedX3uST+cfjzTD3JBLgG/pjBa
	YfVUVfwvzAwSuUqsxC2KPfujESvaJVkcWtmwBfslU/uyOVpXAJIDVzQu3OOvvtYm
	d+unfm0LmPZ9AnLxD9sAA9G8FtJ2dQAkwnB4f8rPDxqvOO5HpDVc/0D/cqVN+KbG
	Ax97Fw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3a685-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 11:06:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f0f45415cfso49715666d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 04:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783940777; cv=none;
        d=google.com; s=arc-20260327;
        b=KzJMHRYIsppyfATUV/ofHMbVV/zvzjelqV5T7ZSBuFivRrTSP/g2ddNoqv29UhKimR
         JF15o9v49p2HkNUgIMZljV01NPhYAIsgIYWnnehZEe1mFV6sy+AMPMgapt3758qxrnRJ
         O0yZydJRahI2p3Mkkr4JCMpPigvOO3uOpZ4/oAT605e+Lyqp5N4JiDWsFWtagwh2J+3B
         5Z7tsypTlzi5SvK0o77vhGEEz/dvmjMoKLvo9OHcrNAgmU0RyiDYza2HZ8uKk7FM1dld
         apg+6035hu1ReV+qcR4nuzrhzqDQEn4fcZRbc4B0svxr4o5mR74fdVISTNsTL0taqjwd
         +/UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MQwQS+P0In/tSfCSz/KgwVUgfBQ1+zeASmjyD33V1A4=;
        fh=7bTw5eJIRoEXaAeVeWAELbUondT9nLWaKu7wSbgQiFY=;
        b=NujJwuf1dp3CMPbE1EQaPR4ElX5VqmYQffLAk+hD2zFV5eMPOIV1tfgEUGYvIuXhjb
         H1eVhhLOKsYNiIs7lj0fDOukXbj4urZzk8iPOS9q9cwq3RPPRhqE4+OEnYcACEq2esWr
         GQtHq/1LaX7xcMIrCYzt7wOIOPJF8fiHe+j7nL2RIXcT7py7PGN4YlsvdFek+zwMO+QU
         wlilWCxeUIs7t7JnQSDvFL/wsI0ji3KpJJG5l3RwH2d4Z8z2QUC0eTzayn3taM/SbaYL
         Smi9t5iOzIDq8QxGQFVoI0ZSb18HdpvZCc//IK5w1YYfA1bl76nu2nsSvZ3mO7ZGGdLu
         A5iA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783940777; x=1784545577; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MQwQS+P0In/tSfCSz/KgwVUgfBQ1+zeASmjyD33V1A4=;
        b=ZD4NT+20A8rKKV6lvbDKfTcX+F+oLfbh9ZMF/z+J+3PEGmrGKzisFGfK6QTWCZ16FV
         3dMWmnFXu72VvxOXkVjS2335ss5yEPq1DawuSsjqBXUPbyf9LtDwqodRn4ZvOGfCjg+L
         FWu1J3tRnLMrYFe01jKa1wWdafiIzj8U96jX7F/plsTJtszsRjJHttyQQyoWcordWpGz
         84jmNQbZpJiT4XsmjVfJkEJpS65EYlZQibvnYe+kw8m8Dkyqz45osZJEb6+YfWEkdwtu
         puA0qqPY4hIIe1c0MpQMn/xTEXbPlCVCDuwzJtU8F0Bu8Vh7IBTBUM6j57ND/t9QOEWb
         ONHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940777; x=1784545577;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQwQS+P0In/tSfCSz/KgwVUgfBQ1+zeASmjyD33V1A4=;
        b=OLFwJnE4scZTBFKCW9fgyopH1HfPiA88NgtDz+5PAzYR/LKYSWtrCKvyeJ7rrNvzfF
         nlq49Qzo5SZoGMg6ao6xVESThN0GCtTcwu1sudh2N/sl66VS5WtAKhchOyKVGyx5hSEb
         BUjV00m7//t3FnKtzjPLSSmDtoawXHKECfYsf7nv80zhiItevZhKx5JmMd6klhyvScLw
         GprNDbrdFvLvOIYIQB9N2w8euhsrOls301c1dHA3QoVIPHfF1cI8jkh08kvNj7dUMNDV
         6n1lXovrqqxwn7ZdFNwhTcNBIN1wWnMuLlr6pW3G8ucZXONslEEp9tIgQSx+LDy1gAVG
         EfGg==
X-Forwarded-Encrypted: i=1; AHgh+Rr23Kx5D7LkwCg7Iti6TDCOFb7I79uU04Y0GR1TK+JMmQugnszT/bxNEh72GZAbnQJRE4MX71P/y9FOcLZPJ6bm@lists.infradead.org
X-Gm-Message-State: AOJu0YzfWlcvYmUi+VF5sAy7qkIaolVMFU6v3Ayxx137r63J6l969tV5
	C/rodfUZ4q834pXoY54PyShlXDO3QcMZHlY6F6WUIr0bRG6BQa4HHVDh9eQq+qqnZOkNUr8vPzv
	80INbke3ar95hghEnH7AG0QEhhgcdsRMUnEcK9ksGJvpthnt2QcORI2Bl8npqazSjxXP2tEp5pn
	u6b1/n2wodSp9UlV1xdCnCPP2uGlHY1svlhiD5A4If3WEqSuSYJ+93
X-Gm-Gg: AfdE7cnGe1c8DHdoahb1QJJ4zJqXVoZs70H0tcjEAUpLixVE9b4tzpFE4vOkXFWYUL+
	9gsdo+wx+uQfT6ymK9xrzXROfU6UjeVdwplVy8hCSVDuGHF0XtsRaLdQR/OW797F0XS1ptaMFxI
	A/lXH6Xqur0TPWG6FGUVPZEOJbGFhlOCcvEZwxOzNUQ4LPtUT5R9DXT3GeKD+RXh+jc3SD
X-Received: by 2002:a05:6214:55c8:b0:8e9:f62b:8f8d with SMTP id 6a1803df08f44-90402368f16mr93379576d6.51.1783940776870;
        Mon, 13 Jul 2026 04:06:16 -0700 (PDT)
X-Received: by 2002:a05:6214:55c8:b0:8e9:f62b:8f8d with SMTP id
 6a1803df08f44-90402368f16mr93379196d6.51.1783940776521; Mon, 13 Jul 2026
 04:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260623135937.60740-1-pengpeng@iscas.ac.cn>
In-Reply-To: <20260623135937.60740-1-pengpeng@iscas.ac.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:06:05 +0200
X-Gm-Features: AUfX_mzuUAbrt-biys8fUHWI-1r9K_KkXYeMxM3f0b6Z4UYxUfZu83suu6CUjU8
Message-ID: <CAPx+jO-nJ81xs0tWVQB=eMZq5muTFTzLmHS8za8ScrD4B8XYpw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: bcm: bcm2835: handle genpd provider
 registration errors
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Stefan Wahren <wahrenst@gmx.net>,
        =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
        Stanimir Varbanov <svarbanov@suse.de>, Eric Anholt <eric@anholt.net>,
        Rob Herring <robh@kernel.org>, linux-pm@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfX21Ed49Fa822Q
 KkTOi+HNA1QweD7JnWwO0c4AigzyIJf9gy9rgp3PObe/QZrm7CisgWmbpaLKH5WdURRpoY31MrQ
 4VQ8Um+SelWACvZfpl2saN5PmCNrT/HyG1eeFvITNzRl0Nv9+Sjql3QMnoENSPl7fLR1kJXLut4
 qh4qOS3RqQBj8CmDhla9wV7E+vrTh5KUhjC7b7SqtMkwBCNX1+DMwbGSr01NC/Z6VhWt42mZdcR
 8uHeOFNlS79ow6ueCa9uJqiTJBxGsqGorP+4/gyoeaeesI+LoEuD/1kPzT5KaTCuuCbf5h8GLQ8
 5epkoODOVJJYcJiK0blvZmXfUyTKqaitht5VUKw5zVCyXRmaBjlOR4w9oeshKYiD35FKoqWygXe
 lSGQ2wVtyXMDRbJsV1bTahCisqo7lQcPxdAxh8NxqOkUNIe1LSKvQFkKQEiDAtq0kzHaWXkWo4P
 ZSQt6okW14C/e0nG6iQ==
X-Proofpoint-ORIG-GUID: _jn8BrS5mLkVdNQAdR1Yx8vheYXbfvFU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNSBTYWx0ZWRfX2Jr8HPP1DOrF
 r7nP5yYB7Z2vMfu5Sl/IBxM2UDG16ZZHSXFKiULqzq7kAcnYDgBh0WWlqLxHFdbr9+8T7iEyR5G
 FqlBYhArkmUSPh2cifpDYeUNYndEPCw=
X-Proofpoint-GUID: _jn8BrS5mLkVdNQAdR1Yx8vheYXbfvFU
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54c6a9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=vHRj6gOV4FyQf9l2a8gA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_040618_457515_A5239E5A 
X-CRM114-Status: GOOD (  22.17  )
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

On Tue, Jun 23, 2026 at 3:59=E2=80=AFPM Pengpeng Hou <pengpeng@iscas.ac.cn>=
 wrote:
>
> bcm2835_power_probe() initializes all power domains and then registers
> the onecell genpd provider, but ignores of_genpd_add_provider_onecell()
> failures. Probe can therefore return success even though no provider was
> published.
>
> Check the provider registration return value and jump to the existing
> cleanup path on failure.
>
> Fixes: 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power domains=
 under a new binding.")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/pmdomain/bcm/bcm2835-power.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/bcm/bcm2835-power.c b/drivers/pmdomain/bcm/=
bcm2835-power.c
> index b76d74e38..68a0a7a8c 100644
> --- a/drivers/pmdomain/bcm/bcm2835-power.c
> +++ b/drivers/pmdomain/bcm/bcm2835-power.c
> @@ -677,7 +677,12 @@ static int bcm2835_power_probe(struct platform_devic=
e *pdev)
>         if (ret)
>                 goto fail;
>
> -       of_genpd_add_provider_onecell(dev->parent->of_node, &power->pd_xl=
ate);
> +       ret =3D of_genpd_add_provider_onecell(dev->parent->of_node,
> +                                           &power->pd_xlate);
> +       if (ret) {
> +               dev_err_probe(dev, ret, "failed to add genpd provider\n")=
;
> +               goto fail;
> +       }
>
>         dev_info(dev, "Broadcom BCM2835 power domains driver");
>         return 0;
> --
> 2.50.1 (Apple Git-155)

