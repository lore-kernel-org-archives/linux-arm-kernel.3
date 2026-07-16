Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B68C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 13:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zw03qpSA/Jfcy1c52xfOXzDroG6bM4Pn/3P/eMeeGu0=; b=arGpgX9gXyKhB6LabxPUrMAx6X
	qEE+kaViN+5I55wtKYQKrVre/heRQXMHwtymhmGRLQ89eo39fToka2M2IykIXOOM4oEDSjqMyfff2
	KapiP9X9PxkHmvTayXQwhMgSsaiQm5CZ2bHcL1CnBVVOPf8tg0ePUXa+slCHV8DHTHgz2UyXdrVbn
	QB6cRb+e4UbVbDkV5iz9IR/Il5N0FlfaFn1bs8omptUFhKlxWDJHAfxyBnDQTCPZiwaLMJm9xagZc
	9sOO2iidA0+e6digIPo1pPdie36aqVMxg8XKPy2e3hJqT3Oe9HbtiytrQWyPeZgj2YY5DtsMpLsVO
	xtbPck5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLCc-0000000HG0t-0ePe;
	Thu, 16 Jul 2026 12:28:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkLCW-0000000HFz8-2ous
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 12:28:33 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBj4om2731916
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 12:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zw03qpSA/Jfcy1c52xfOXzDroG6bM4Pn/3P/eMeeGu0=; b=NAFI5GnysCRzYjpU
	Bz+EeYTG8ZydNVKZsAmK/0k36tCekALutDa+vAOwpTiJ8Yxbf5ebj+N3wubi4NHh
	q05tY4kASLNRgFCjj2AHbu3zDh4mLVrExrhR4PjjDbeevh4ziLOkrWGaWfGBPXK3
	GuMKjyjxPdNdqH2QuK/pi+YS5D7019295TRDNnPpJlIPh4sE+NrBp2Bmdzjm7pX4
	ooYLNwJgaZpkJE2o0KLLO7Z5UgokXGYXjTJDX9ehCzdBzngNdn3xlJUl06cNoJLU
	JsnvVfoW4GlwTP66cQkQKDlO/KBN1b2DNqL2Fedkxres8oUoDgAK/aGgtBETciW9
	SS0osQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4wad1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 12:28:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f08560ea44so62087536d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 05:28:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784204907; cv=none;
        d=google.com; s=arc-20260327;
        b=XVoKZVmalk/klMZiRcG4wZipVdpOqcCnqER8Sro1L+zcHb+KQ3L34+xSPDlhTU2YDb
         SbbeulNdAB+dYkxqX6Jk8NZm4He8U7GpqOZCLOYxaTbjw8DtDMA1Ld/aLPQJHIz1Wdk5
         kx26qtV2pdOdGEhGa+pPVyNdU2rYTJYXOlE76+iHoNff3dFCqsWShn6SjGBnZz1T9EB4
         nAUbsQAttViapX+SF6ECQ5TIsPVyjyJJhSqNSXiTfzngjH5D4Tk+VwezLxq3fJq2Ku/a
         TY7p+9LOxjyWImdas7qWsRStCltGd9rscx3lY9Fv6I28VZpas5YSAuplu4HYf47DEblW
         ok7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zw03qpSA/Jfcy1c52xfOXzDroG6bM4Pn/3P/eMeeGu0=;
        fh=xi4/zpDvkePSpFVW3YuVgKBvPO1AlYV5lXmGKpNAfhY=;
        b=SJ59Yn2p34ZhyjwtmNi+9rF+GtRxUVpxJIdzkHCAQYJFnqCN7pk59hA18+x8z1H38Q
         30mLBXAIOWW9ZwWMx+/ZNOOxKpzzUodSjVbprPzidyDZEUSXWsyX0jq923ZgnXPWb9bz
         swFAuyPQ+bitmdl75K6waKDtLu36isPRyec4cT38Q0A/RQpJBHJm65EqR3vWpbmQF0vT
         kWLmbZA2NE0eIT+G1eNEzH7reJVjQsB8ZERtY+/WmIaAd3eBq1YPf+2LDUdWmsd7uN8F
         HROzKjS66S1YRh9Dw3UFssAKVRN1aU8mysHNGYZuZh8C+1TSNa6BSO0ctH4ZKLwYiukE
         RVNQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784204907; x=1784809707; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zw03qpSA/Jfcy1c52xfOXzDroG6bM4Pn/3P/eMeeGu0=;
        b=cHrCpf0XKuD1JEqJffOp/cr0gz2/R898MWmX7dLXdFY8N6T+5TFqlUYhe9Z5jeCdqm
         e9fbvzN0k4RlV+fKoDoFZjm3ofud02AymUNOnuGtzkghCjSfrLfcL9OlrM3Xc8fWkdjf
         x2GbYr54VMuDXDHD19Lrb/k7Dl08/Jg54VJWpWet6DcLcAJoR1g/v091SUEVoLIxF/i0
         1ZdUuQMpBZonCHd/UM7lWClu3G2991xtPWdpgJQKl8eHI2ECp33sKZU9C8q+1Nm/m+fE
         D0w2mLz+4qr207NOS+5eFwAUQDXys4C3JisMPIQWdzN91KIj9tnHNeUAc0TL3WbsAtF2
         H9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784204907; x=1784809707;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zw03qpSA/Jfcy1c52xfOXzDroG6bM4Pn/3P/eMeeGu0=;
        b=pZcrZ2uzhRtv7ZhogZlsukt49oPuabHqN9KdD/wQMdrp4kSJqkDzexEbHcWREHphzP
         uTwSRwR9Pcuo+z1aO1KF4LKtDffLkfdECDgPCLuJw79AkKwsXaOsTjISV2AKN90GSXkD
         DSxJZ5g0mLHYnsRDaiS8LWXl+jq8XHTlFfESpi6JHyHiVgzdfBhdIjVNQeUTL6AkFhuD
         2qGZe0lLdb+APRLOfOzYcX4VP9AGjxDJnDaish69YnZY2q8cSk1833oBV0rt6dA232zY
         N+hjPPFj1CWi639vJVwIGEobvIBtrXH9pIvcE8/TM5UhMh4dlPGAxsDr/3dYpxKUFYNM
         V2yQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrykep6/3lQiTThV30497jro/DOiQnucolmImFozafdg1wTZb57kqvUy8hYDB/MllzgRAjLmb9t37F2ieR/dIa7@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0bKecKz/wANIXLyIb6dA+NBFIyQ74doQoiHW7cBh9NP2V05Om
	DQGTSDuG9Ku2euv6uk/C/XkwlRihNKjSlQtbEIJrF4iRcTNVbzjxLYgDBq+SImZUqS7KVH7yzxm
	3YTZ7fNlGT1eNuyydk4GfGCIhpku5to6xi9vzL3CotIjp2uvpnIGI7DEfTjEQMkKhvQqT9slu8m
	2m4Z7jaQ2ZaYwMzVM9pCti0kgTZkMANWeKiTilmbSSDOZpoHvPTDDC
X-Gm-Gg: AfdE7clqpEK5Swg9nANROrK3B6dz7Pw0I4Z0EDs9WU+6AHjG4Y/IPatiGktsM9Pgfux
	7PqxWVBmUjf3/LoT+qoJzF5C452xTAT7o8ugWrWnDD2xM7QNavZYrO3vZDOuVhvfmzuQHyb7J8W
	SOrttdpxRluOR04cJUF4zCh8zeUzcTLVe0IscDq18B83Lq0BcXtH5wn7bK6A==
X-Received: by 2002:a05:6214:3212:b0:8fd:d5a7:f970 with SMTP id 6a1803df08f44-903ff7625e9mr263482116d6.11.1784204907038;
        Thu, 16 Jul 2026 05:28:27 -0700 (PDT)
X-Received: by 2002:a05:6214:3212:b0:8fd:d5a7:f970 with SMTP id
 6a1803df08f44-903ff7625e9mr263481916d6.11.1784204906676; Thu, 16 Jul 2026
 05:28:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260715-rpi-pm-remove-v1-1-e4eed226e08a@linutronix.de>
In-Reply-To: <20260715-rpi-pm-remove-v1-1-e4eed226e08a@linutronix.de>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 14:28:15 +0200
X-Gm-Features: AUfX_myr8HhSmFfAg2iBLZxbDJBG1dywFK58stWc9YDsp2w2MDb2aj6qKlaRYNc
Message-ID: <CAPx+jO8EPX2br9vsuFXBDPoQTF+Ks09MFcFQzchZxZVaj7y=-w@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: raspberrypi-power: add remove function
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Ulf Hansson <ulfh@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a58ce6c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=H0uma_0KToxzU7pGOuQA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: dhyfWB8PQDhICke_gJslck-i-lbZ1jnD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX28ol3tc7j4qJ
 ULSHwhkCMTEZWepHWhjCJ135Cp2PYyfL14fm0ZMF6RzdOEy9iSvaz/pIVQLY8VN3P2PtJPEi9aW
 MuZuO8XXvXfRrr0cp4wEXL1QC7/EnXM=
X-Proofpoint-ORIG-GUID: dhyfWB8PQDhICke_gJslck-i-lbZ1jnD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX33rRvH8pEe2a
 BuSbDyEfiwtoLkviyjmX6tBoAy9CmW8xOuYC+y9R8BJxbCq1Tbo130skeZVY3SsINF1yhozEhwo
 8WK5jWCn8R+eQ59dkorJ10zohOZCABX2NNyRBbmRaIyjltnJs7xv0Fp121AZywKo3iQnes0fgio
 fGJtl1JnJ+E5/E1UMZ8gArkIZsbzNDZegb63y2AOIdmXJ9RuYwqgCWYnGK3TqS4xRl60nHOY3hx
 RodzrluW+QOrn/WN1ao69B4ohUxhedgqD4LjW5Cbp+kLS+KoBiFF3nO6253RKjzyaNrXVSxVvJM
 M9eoPPd+VzchPAP4dY3ziI3KOq4t++RFPPDsKmCG+/xlYZSwUTyyWG0W1b78l7b8cY38zNITf7C
 Ag3gaSwjKgFPo0+EgobbOFsucWe9tA8HuIk1115DPvcvZxV6QS23I2kvE2+lvwLZHRBRx4RzBP/
 MuHrVkaaHkrPu7Caghg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_052828_730168_BD6FEC01 
X-CRM114-Status: GOOD (  24.66  )
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

On Wed, Jul 15, 2026 at 10:16=E2=80=AFAM Gregor Herburger
<gregor.herburger@linutronix.de> wrote:
>
> The raspberrypi-power driver registers resources with
> of_genpd_add_provider_onecell and pm_genpd_init but never removes them.
> When the driver gets unbound and bound again this causes error. Add a
> remove function to cleanup all registered resources.
>
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>  drivers/pmdomain/bcm/raspberrypi-power.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/pmdomain/bcm/raspberrypi-power.c b/drivers/pmdomain/=
bcm/raspberrypi-power.c
> index b87ea7adb7bea..2c2135c17afb0 100644
> --- a/drivers/pmdomain/bcm/raspberrypi-power.c
> +++ b/drivers/pmdomain/bcm/raspberrypi-power.c
> @@ -232,6 +232,17 @@ static int rpi_power_probe(struct platform_device *p=
dev)
>         return 0;
>  }
>
> +static void rpi_power_remove(struct platform_device *pdev)
> +{
> +       struct rpi_power_domains *rpi_domains =3D platform_get_drvdata(pd=
ev);
> +       int nr_domains =3D RPI_POWER_DOMAIN_COUNT - 1;
> +
> +       of_genpd_del_provider(pdev->dev.of_node);
> +
> +       for (int i =3D nr_domains; i >=3D 0; i--)
> +               pm_genpd_remove(&rpi_domains->domains[i].base);
> +}
> +
>  static const struct of_device_id rpi_power_of_match[] =3D {
>         { .compatible =3D "raspberrypi,bcm2835-power", },
>         {},
> @@ -244,6 +255,7 @@ static struct platform_driver rpi_power_driver =3D {
>                 .of_match_table =3D rpi_power_of_match,
>         },
>         .probe          =3D rpi_power_probe,
> +       .remove         =3D rpi_power_remove,

In general it's not a good idea to allow unbinding power domain
drivers, as it will probably break consumers and their drivers.
Although, I don't know whether it makes sense in this particular case.

Another option is to prevent user-space from unbinding by adding the below =
here:
".suppress_bind_attrs =3D true,"

>  };
>  builtin_platform_driver(rpi_power_driver);
>

Kind regards
Uffe

