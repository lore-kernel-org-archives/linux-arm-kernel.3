Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1AF1CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 14:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vp36po/cz04TMtA4qWYnSTEK6SQr6l93s1NVoQTANc4=; b=jwQTcF/6496KkWq4cjfKfYGXT/
	Rt0bJPTCwVtld7jWm9XJ/79ELkinrLwWW61ZrPOqZ+cykTRPu2B5018qOCOzxMddnDO1bRjleK5Ih
	BU/hBpb3V37Vl56JQp7gTaQjJndJZXi7W3tTvc9Cs461B9V3Z8zLKo52AjKZjBkKrouiJBFcLBgU6
	dUGzIfVD33vzvHrQveP5uPREp0CzxLcDW2P1vT3JSvuR3tQySYRC51gMA09E+MiJR4XJ2x79mQ0q8
	1zjnL4+9KqTXq4PkUYkJjuRLgurXp4aIpwlUaUxptxiwQOe+PbfTqQjrE+dZA3ewpYeQb/KY4rpjG
	ePxTQLIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBfL-00000006SO3-09PX;
	Fri, 09 Oct 2026 14:33:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBfJ-00000006SNe-0Ymh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 14:33:42 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699DK1QY1907549
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Oct 2026 14:33:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vp36po/cz04TMtA4qWYnSTEK6SQr6l93s1NVoQTANc4=; b=ahi9aH3/VFaXEAr5
	8I2va2ktkJ+UNgIhUkf332tEbBGJGMS3n3T9vHBLzRGvj47hq5PjQO8vWDr4n54u
	qbe711kjDwiLaPSdYyO2MYgQteioYq6WvMvHAvra/xOV+P7e1mua5dqaz9Hf1nNi
	oGx3Ej5UtMdt6+R9RbBcHGEjY+157e4ozXPU2lznlMFpRyVaeOTOKgYTxWmn8dvS
	dmqkK/Ds7+63M8r+JHAhUtMjWGvx1JH7lTj0SiPeV+e0Qx+S1abEE17qoBBnVUcx
	92vY68O56UVYbPAQHDSbiRirux34GWUoJ3SKQI+tCe2188ovFRyVEA20IzPA4G6g
	8sQK4w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6yk7gm4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 14:33:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f75c1219so88630735ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 07:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791556420; cv=none;
        d=google.com; s=arc-20260327;
        b=sJh/SrenrBF/+ob2E9Xfbh82GBmcclriB8eXpRQlS7Uk88vTJ6oin7FM5gjPX1Ib2D
         HWAq+Za5pG57ab9tvMOCguU+KbrrqkYQeVe2ndD8sd+GtXaw9VeF+E0bFU8E34JmbKPU
         26Wl4k40CH79Qa1ZlWK9283CDp0kfX51FArpSXQb7tQ50KKrYBglj9IrFTx5VnWMzpVC
         JFfYVSmiVMCz0TqiqVGSM6Y23wGCxS+4I5yJqAqpBC8rqVC+myq7ebjNq+DMqRbXBXHm
         NDCFLVeV0fUR6SgPmPcn47sslggY6lLm6EkdXimF9AI26W0psAnhwWoCGm6t6yetg0BE
         zPTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vp36po/cz04TMtA4qWYnSTEK6SQr6l93s1NVoQTANc4=;
        fh=pSVHehjJ5qZSAxwkJKS+nAj6MhkYnrUOTu9E8itbDJY=;
        b=lvPQHupQ6991DoZU56SZMf4+7zoNq/RHHhz7ynJ/4AqJLBfTqVzXujG2GZ0LRyvrEC
         /OeuVuRCVAfsijVYEcHiGZdQUMwwI0COrn2BthpwjF64oXNPSFb6ndF06ijTqVR3ZBwq
         orEsnP0dKiOJKV1md33a5ogzFzxOPZOLcK5btBSZjpR7NCTtNlS7gEZZPVRlSR+n4zBq
         n1U0yKSM12MW53qQwWPxIzRBqMnMZnMlH6DYR+35Rn4X4RSwd/RNcp0Tnt7baM7sICRr
         v1MofiKCQ8urfe8LRr7WYyO9sREjrZel8XH3iCkORiGdkYZhGvktNfN3+IOXh6Ko2GFh
         4kTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791556420; x=1792161220; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vp36po/cz04TMtA4qWYnSTEK6SQr6l93s1NVoQTANc4=;
        b=j5joIoWx+cKrlyKMT6jJZYOOjD9++jE428rd4Q/liS/wt3M1ddvkBjJdzwcD73+61J
         B6jZ64OtGhpPwZzALDzZmAySTHgKU1IIRhwBtWBKcM0AB0dUoAZr4/tnsNCgjH5Wnb2a
         jp4LbiBfrihdo0hOrc4UYiG+N1pxK8vh/vUvzEhjwpaDxG/oDgaxbFsDNRYn/EOOIml+
         eaZ+2PPsKxxTLscEzp4B20YAxUl6Zxom2eWfvMBUufrSBYO/I0PxEnBb9C1JW64KZja7
         hPnY0R+KDif68/zP6KrXkWBo7v/FKKlp3/FOrdFvU2qhqHNytTXuSYYa0OQO2yST/J41
         P1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791556420; x=1792161220;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vp36po/cz04TMtA4qWYnSTEK6SQr6l93s1NVoQTANc4=;
        b=N5EWOxeTRxPScahGnwPpJw6w/FtkjivtdguvjCbm3e9IaAdmVa9/7/JhUP3gvYWFNU
         MGVCZB1BKXT6pG62fDDCVowsUp9k92UlN+76E6Oz4i4OmKuN5LtKaD7P5QCHpiTH1d3c
         KJVEl2brlgctHxahYue+/osfBblLJyhop0YYd7Uwn95xsCPgbOKaUF+M+bHEUmkQBKde
         dq6dLgC8u3klyHlT0Ifl1yhchT3a+XrZ5YlM1wivpISBiD7jFoRIMBfCtcywulM0JPwF
         FCHKGewjLl5eErZAFqzLOMhDUnKVUZhSONYVsUZXnmQcUqYAY80RL11nvDjLp04T60XS
         QPNg==
X-Forwarded-Encrypted: i=1; AKwUvBySIfibt1folpWEwvNBO8HB7ExtQcl5EMmX7Ek/5TWv/EYf4scwMSWpKeuH4qvnBuTv55c1PyTWQ9ryk/JmBVyi@lists.infradead.org
X-Gm-Message-State: AFq9FYKS/FLFRRndKCH+zNspuD9ILEy15peaEBAcbFQgvoCuzPgl/O7Y
	9qnHQpt6T7Kcfota9e6NOqYQSeacosjGS3Ah03lFH+KSu7j8S4CoQMmPobnawjbWLBvXc+J4jaq
	TZz/nhywLaC3QlizRvszSKBAMFxkK9XW3J+jaj20okhR/SYYsQ8O/sFIw3chpdggfl7XSHyWaqs
	V67aVRDOsE9IcexXfiYP5EvnWLtQpaAmc5kwV4CAoZp/G9Ct163FYG
X-Gm-Gg: AYBFou2ofCgtY3NKRlsIKFSjmm/6CE6FtIF+nmshkniGgQ6jFZNxBUIebUuBjgg8Ypv
	IRl8KPZuJ/T4EdPGCodWpvRxXw7GVdmhTwf+dwxhZd6Y9nGolDncZsA9EnKUsZq5QXF5R/qkbVT
	uRuVBmIbwwzVVvRNdwS4NyMAKyX0rJzD9HIvgo/S5Po8nef1vVdxDilHneFg==
X-Received: by 2002:a17:903:2f92:b0:2e5:98d7:8202 with SMTP id d9443c01a7336-2e842cd44b8mr19505885ad.13.1791556419646;
        Fri, 09 Oct 2026 07:33:39 -0700 (PDT)
X-Received: by 2002:a17:903:2f92:b0:2e5:98d7:8202 with SMTP id
 d9443c01a7336-2e842cd44b8mr19505565ad.13.1791556419166; Fri, 09 Oct 2026
 07:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20261009-ux500-power-domains-v7-3-rc1-redux-v1-0-5eb1b90bc35e@kernel.org>
In-Reply-To: <20261009-ux500-power-domains-v7-3-rc1-redux-v1-0-5eb1b90bc35e@kernel.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 16:33:28 +0200
X-Gm-Features: AclHuK8BLLsnCLnhdwop9PNp8hP17bfQmxcAxbY57H8p7JbbxjDD7-48aE_iQho
Message-ID: <CAPx+jO9BiY=v=BQ20qjgmq6SJ99NK7krTHTMdGcTfR_dshodJA@mail.gmail.com>
Subject: Re: [PATCH 0/3] pmdomain: Basic DT defines for ux500 power domains
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=D63SufRj c=1 sm=1 tr=0 ts=6ac8fb44 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=XH1a5p_xQohBom4lpSYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: yLT8X6FzpVewieAybro1qlz1L53R_3nV
X-Proofpoint-ORIG-GUID: yLT8X6FzpVewieAybro1qlz1L53R_3nV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NyBTYWx0ZWRfX8Qo2P3n9q2oe
 D0h/dh+NbDEuoneTlDz/dFUdQkP507cgaMk2/Oa+mby9XtizXRreH6H2VSxd6rsrCuaXALZTWBW
 Xg5wQ7gQq1aubV9Cy0Lrhbwgx5uNd44lsvZ28c79NpEk+RFpUtCk5XguQAKS/OC0ImD1ymGgSf0
 g6bekXqzGNfwkt/50H8+qWHO+D/msnfPWSUE1MAF4HOD+dketmOVvi660+75L+/QQWEtNmT71ix
 Z4sCzqp0yyR37B6R238YTtOg9FHvSutKF9QoLxeYxs1sffqp/rqT2GNscKl+PorvYj4xJw0W7Vw
 jbPlmhmH2/Z7UuaC6GCHiw8T76Ji3fR0P281nPMb1F8W6QxYRPPXs0irzhYlmqdozrZXloKo+Q+
 rUPcQ7uyeFlo7zkv9QSQ8hxRGmrXotrIVQH7/VbicF/aUXCLKmFVtG/tuj3nN8by4fNJAajW7vU
 FIQUPDM+5vN43rqYa9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NyBTYWx0ZWRfX+/6e0GiQflW9
 o9QtgHuXnQvKw6ewyGSyqdwXphQwojqJGbZyviwIzgSqXwJgygZxQAXX6hv05/GgaSYsr8cCT5f
 ILKprrwNQVfJ1kKWSgMpVTRNDOB1JjE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_073341_182258_3777D0F6 
X-CRM114-Status: GOOD (  18.28  )
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

On Fri, Oct 9, 2026 at 2:15=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> This is three preparatory patches for v7.4.
>
> These three are an excerpt from the earlier sent series,
> updated according to comments and collecting ACKs.
>
> It also fixes an urgent dependency (my bad).
>
> The main ux500 power domain rework is targeted for v7.5.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Linus Walleij (3):
>       dt-bindings: power: Convert Ux500 PM domains to schema
>       dt-bindings: arm: ux500: Drop NR_DOMAINS
>       dt-bindings: arm: Add the actual power domains on U8500
>
>  .../devicetree/bindings/arm/ux500/power_domain.txt | 35 ----------------=
--
>  .../power/stericsson,ux500-pm-domains.yaml         | 41 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  drivers/pmdomain/st/ste-ux500-pm-domain.c          |  2 ++
>  include/dt-bindings/arm/ux500_pm_domains.h         | 17 +++++++--
>  5 files changed, 59 insertions(+), 37 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20261009-ux500-power-domains-v7-3-rc1-redux-acdf755a5efc
>
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>

Applied for next, thanks!

Note that these changes are also available on the immutable "dt" branch.

Kind regards
Uffe

