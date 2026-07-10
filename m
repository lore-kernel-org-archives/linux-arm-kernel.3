Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0FC4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 13:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXG7S3p3xLtYKwJ43eakLYqv4N13Bj7bELOQ9MVpdnE=; b=0qtQTlY+84tF0MjAPF3xczgQrI
	4XRx44s28OquxCpEPaWz6dCvdHGfuNKRlx4P+P4hoKwfqoqV0t6fuGrbqVV9GEt3DG7P+buU+e7g7
	ow9c6A7wJXIXVRNItSUnxw/LYD/ngfuLnpbtaFnkG2EMjIWNMdcbdYjZI3zmHjkd7DpocXkjfUdq0
	/IFJf1TaQ3THo8KUaAxiYoU78d2CGy3zuO5cJJHGU8uveiXxVLsiz2l/aKSlODH1LclJbULI/f55v
	L2jjV//4t88NOiW0aUrY4RqW7EIYkbQFdHByWZtwZXmE9ZhETz0XogXSRIG5iFoIi+a1NCsebMNXn
	dRM+i7vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBBE-00000004zqQ-0MAO;
	Fri, 10 Jul 2026 13:22:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiBBB-00000004zpL-15wQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 13:22:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6bti823295
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 13:22:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SXG7S3p3xLtYKwJ43eakLYqv4N13Bj7bELOQ9MVpdnE=; b=AXt0FCIk3DGKI/Nf
	pBp5yCPv6UEDsmhYLoWUYxfExoDKdSex+bAkYEDQtib/RTLJMBNYLluw59O+WHLC
	vI/00XWT7TMDcDQeBJswrEXoYtCFKxoLOecFNi6J0l9j1JfKUfibky7pgMm3CtK+
	X4gElHkuw4loNDmcjzmQCrApudoXCsKa69wvqBc5PMc68BwgWgLpKF5AcO4n1CCi
	+qtIE8LwMX8RwiXmNcHB5C7kBFI/8m+a6JGoh3Qq0I3W5MZ1ioiH1UHx1HMnZfw3
	D5INMvKJtgt2A3csGxHhlwcgkrfszkPh6dolM+adj5ldp9WDJg7JTfoAWLIdJtJ4
	xZW0UQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fadvjctxt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 13:22:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90284139cceso9965416d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 06:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783689728; cv=none;
        d=google.com; s=arc-20260327;
        b=aPSF32ogwUi53lyMnGBb6P4NbVqAo2zgrJkBBb2EAmDXg4OXc5oYtxjZIpIzUJeg68
         dKvRbq5MsDbEPyqChdgFdGuUnzf3sAO2OnWkR8KOTI96j4RL+9JIN3JgN/ohUdbU3yWj
         i2ZtnFVe5FlPydVP73MGLerHa12XU99d2EMUrvOdwp9c3j1awI8YCgBSiu9pWiveHwyh
         +y6q66umZqQ+AEzeeuzwIbzOg4pwcztOyJBghE4CztkWqMWmBEJ6/idHUgVXcaHluMrl
         Bt3SoFwP3aTktg1b49ePvoOPyhnCuYsiDSpsU1oMhw8dTWPGWnzqUOSrWjpvd5dZyjQ4
         b0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SXG7S3p3xLtYKwJ43eakLYqv4N13Bj7bELOQ9MVpdnE=;
        fh=LFZM0yT3zeamFCsMQdmhqUUhBlK6vdF2cCI6XwVdN5I=;
        b=kI2ckGeU2r84PMx0sjbEsziHRY4qwMHsmo7K4RWYRkprCQhBhBkjHxHzNRZ9DoOtoq
         IkYcQrjOgKprZr3g7ADT/DvE1I0YOUJLzBPzGOcJsuvgaUMvsJhamTGZAyuzHGf32gJL
         ihL6KhxDDEKV/1mg3HStXK6+1UD0P+PC5/4VPlYY8elfLqfmkhCMvaxlmfEAzgsXVhmK
         lXvX7CM0YR+nx49yUaYkcryABXW65WHOvoKu0qzT3gBUSngJ4q1v4fE9k8hZre95oLeB
         RJSPYJMvrrGUYzJCzk6HWMRgUvfrDsC1LMP9jiIpQrofqFNelyb9WQvEtDRAig0U/8pd
         +w6Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783689728; x=1784294528; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SXG7S3p3xLtYKwJ43eakLYqv4N13Bj7bELOQ9MVpdnE=;
        b=ZR/izoN9O35PiaaeF6vrnINz0i3q2Xt2oRrfJ7uaHvee5mFv5nJB92g0VCPS5SKaqr
         bvcqVsLu8sLrW4yLxGWFrKDnEDPrzMYDMSICdfvT52Vrix8mtpLstEBoO4w8hzrSVUzS
         Q1TX4JWyL/+vARvahBdwGy/GZ3t2QMQz1eq2EZz6y7j2t8yYvcIx06MXvMmvrAiSU0Rh
         LcPBLKEhkRPoDaD52lMjUX9uoT8UJkwO28gJ4yrDIo9MRXh+xUOMrsW13iHPGHwsF9wJ
         8r+rIkJOceInkk2j/D0SgbqiQfa5d1H9kDumBWPyLb5q0P5lYiVKYOL3ANyIQw8MCDl/
         Il2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783689728; x=1784294528;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SXG7S3p3xLtYKwJ43eakLYqv4N13Bj7bELOQ9MVpdnE=;
        b=Uk6+H04W+De1Kh9l0kNBSVf80BhIdinVFMMpK9Kj35bUTfXK1iSvrG9Hgts98OfjL1
         ngvllzPylP/9Hz6VW0N/YW0peJc9i44tZRvp5+8KJUEd2uvACtBzDC6wa0cHavNzfkde
         Ax1mj3m6OE8LQOPAAShE9TXn7lXSYPj9c4eo2yszo8jukYreaxbyLsVkmKwid8wOGsah
         vh1R0LzAdE32hFKQlMJYmHnOMriReKf/2uHXKniMJmc4O/tUxq35/IFIGIM4UmrXngt7
         e/iInBI/79VwDune3IMdazUzIDO2H1t4ijbSPBNMPQJtw6qbkUOuvyV5D4LldM5ZuNd4
         s2Cw==
X-Forwarded-Encrypted: i=1; AHgh+Rqh8r84mnmpbi828FUrE8yFNjlMFN4otx9+03qnhn6NnU/Y5pQdeKOOZuuWocEqrIVD+oWtUxFzZtVgDTtsvIzL@lists.infradead.org
X-Gm-Message-State: AOJu0YzU0n/bEeUWjPaDf31tFX17rQz4ZgKr3DFIUAM6SuhMh2KpfPqN
	ILzEeDp7oABDjFYV98vkCyAJF/WPFcNLtBTOZibdkVXY1YABe8ClyUcoqEWG7wvpaMz9MnX9MlG
	ESspMBQA8VXQ4MdFYRKjytHTdj4HDGddCBk0WuJRSV2/Q4njCgahRiLnmfihQgKEyQFCXhTe026
	7BN+AZTibzrm2tYabQFpNedvmKHeWHMa/lctprG/Ox2Bi8j9sWQkmV
X-Gm-Gg: AfdE7cmeEh8beaL4hVzhksgiR5T2HMvTNIqqhlw7/ciG6pCVvjoNVzWnb4grwkFUTD5
	e0vfE3WHtvy2z+bhm+lpOMFFltXmeZ7AIl2GMgF9/wByh0SoJEsecRu2TpH14JodN/KO1ibdE3H
	IlWOtf4vuit+HaVYvDJYmp4h/PmrMZ+9vAfJ1ZMqhPNSDKSqWB8yh+bSsli+7nM2Rq0LWQ
X-Received: by 2002:a05:622a:4d8e:b0:51b:fcc1:a0b7 with SMTP id d75a77b69052e-51caa02bee5mr34237441cf.8.1783689727481;
        Fri, 10 Jul 2026 06:22:07 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8e:b0:51b:fcc1:a0b7 with SMTP id
 d75a77b69052e-51caa02bee5mr34236931cf.8.1783689726914; Fri, 10 Jul 2026
 06:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260706195818.3906949-1-sjg@chromium.org> <20260706195818.3906949-8-sjg@chromium.org>
In-Reply-To: <20260706195818.3906949-8-sjg@chromium.org>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:21:56 +0200
X-Gm-Features: AUfX_mzmOYvznpst6Fhzo_RRhZo2t92NP1TaOref0jVQgAZ-t89JABzPIjGVV8E
Message-ID: <CAPx+jO8t8JoTJJCCMU_yz0yyGQCSA4cKsmpSeX_=jEMUwuYsuQ@mail.gmail.com>
Subject: Re: [PATCH 07/12] dt-bindings: mmc: rockchip-dw-mshc: Add RV1106 compatible
To: Simon Glass <sjg@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>,
        linux-arm-kernel@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzMSBTYWx0ZWRfX4hIK8WQVzQrl
 fl7qNwzi7sPpTzELVinNz6kl+WdAh3eLwZqBkJgUiBqGdgc4wSq0MUZGaCMRYgPRQsyCqWjZkVS
 HYxFAhZ5hRfZ7gnGFz33GLNQb7dFGuMWBvCCRl+dRyj1z1p5qrakt0EjNv2arWZdvQTNMncLhqM
 to2l3hEBfDIrbCS4ZD3klfKJxvpLR+Nvvvev1eOIBXXBh2CGF+n68rE9GhL8NrKhQry7z4zg3Cg
 jiUPSqxI0N7/YjaEr8qX2avBzrt7ZHqbkwDy7LF9avkbCnPKbnm6luNA5hRidA+P+/e+3Db4/BM
 8ELpLjH21aorRrJjSiOE/fl9KcOzG4FMGKWgfH5uMnG2a3rWigSe5CPf2zNmeTQ9pYEBTjvsvAN
 lmOo2dNJIu1sj513ph+JcpvAlXb8ofyW1I2rV9Zr5ALpCgEJIJHcvUUB6/axszwHfqtC57Qb2NP
 lA7UMMhzl5VAPxSKv/Q==
X-Authority-Analysis: v=2.4 cv=WpIb99fv c=1 sm=1 tr=0 ts=6a50f200 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=cm27Pg_UAAAA:8 a=-hWoO2I3uisOaqaBfXAA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: Iam_Z8MQT2dIRLlJTH_6sN0QZcwLKon5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzMSBTYWx0ZWRfXxMeN91bo2OYp
 rFDPZ7rpUc+BGIDzFZbo/QHUNx5KEJ8zThHBe9k13WO/OcXARGkuC2G/Fsfhv/KcJY8T87t7RBk
 cGBaYsrgP9+iXtzEaQDV7XQiuLIW7/E=
X-Proofpoint-ORIG-GUID: Iam_Z8MQT2dIRLlJTH_6sN0QZcwLKon5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_062209_407264_5311C33B 
X-CRM114-Status: GOOD (  18.95  )
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

On Mon, Jul 6, 2026 at 9:59=E2=80=AFPM Simon Glass <sjg@chromium.org> wrote=
:
>
> Add the compatible for the MMC controllers of the Rockchip RV1106,
> which are compatible with the RK3288 variant.
>
> Unlike the newer controller in the RV1103B, which uses the RK3576
> fallback, the RV1106 controller is the older IP whose drive and sample
> phases are set through clocks provided by the GRF, so the RK3288
> fallback is the correct one here.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
>  Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml =
b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> index 4965bb518c54..21ecfaa454f4 100644
> --- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
> @@ -43,6 +43,7 @@ properties:
>                - rockchip,rk3562-dw-mshc
>                - rockchip,rk3568-dw-mshc
>                - rockchip,rk3588-dw-mshc
> +              - rockchip,rv1106-dw-mshc
>                - rockchip,rv1108-dw-mshc
>                - rockchip,rv1126-dw-mshc
>            - const: rockchip,rk3288-dw-mshc
> --
> 2.43.0
>

