Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2DCC5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 13:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kITj3KNQm/KXIzgVqzqWSiv6WlzVmDA2S/07gwBrxkM=; b=l6AYEaFetOn3Zl/0Ofbazc/LXw
	pd6LWHpzjUzkoHvh9cIUWLNGazLC+hES1zWxaLs0L8VEj5Y/owwoEwedESdbf9i3ie0IVqRd9jhU6
	wH42wm0PEJEVi/m5BM+t5cmtRGUVUOv6GjeXRNS73L9wfYpvaLnXwMuC52JRJkM8wrGia4KTxbsR2
	TY64Hildh895kOZlvArfLgbXpNumIwipQosIpw+KLUxoh1+PHZ88IqyE32kZBL/Jkeu8csNjSbwEQ
	4oHFLo8KJnXdMrg4MR/NoananHXR6+GgHcYuApoElRDGs2RIujojj4GftKZksC/dKstDZqFMDhIT+
	im2sH9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOqs-0000000DMLu-0W7a;
	Fri, 21 Aug 2026 13:00:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOqp-0000000DMLP-3NNo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 13:00:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCofjK1249537
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 13:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kITj3KNQm/KXIzgVqzqWSiv6WlzVmDA2S/07gwBrxkM=; b=DjLCozDR/JQKfj0I
	LGX+gGc3nt49HwQZ7pisjID9l61OyR9AiXwfdQdk3w2Ih/2NN3h9RQINzcDmM9Wv
	NRu+VJW0CcgX+JtFpDGdkhsJ0TQda3kG9pw1xtf0Xhm6sL/v1SJk+H/yJQnX+q6n
	efNdf6UFF5YAe9aP//A8m871HS+Gvega2RMM9tpn6o5N5TU5JU5BV8SaIBd6hFV0
	kescd85G7izy8x2ojf/KldMlTTXs13DqN+52zcO6zMHat2W/3SF/kmPrBWjI3fLi
	IMu0oZbuJL6A0cZlFEwof59qO/Xfrwmwh5TUHpawHYPuH5Z1b4jt8e8mBJXDxSrc
	GvAM8Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ebut1c6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 13:00:02 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so926974a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 06:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787317201; cv=none;
        d=google.com; s=arc-20260327;
        b=d05S5qOPn1DqLD77vcEB6rSBIzBTMyjVoK5EzulVsLMew1QAksn9iECWJajLYhM/oQ
         yY6jlLDbUHNMuMMcprIKD5zdpdeDwVDjJVDJWV3/xNZxph+uN9AVvoX+3IK1K58UU5uF
         XCDpHrUpGuyKUg5THoKJr1lHQWb1Pkbl9iWT8EPNTr4OkC0UpK3F/t/3fk0iy0AThsy9
         9A+pHg2ycxNytIKqXbzUoGJSlWOgZB4UqmcFhefxp8OV9n3lHYslxcSsiWCrEXdPzbNH
         Zporjzbp6QURNG/NHdtK/f9Wg067tg+xOLFB7X4CQgZD/XjkQ2JdyKwpAx0YC/u4PyAv
         F2ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kITj3KNQm/KXIzgVqzqWSiv6WlzVmDA2S/07gwBrxkM=;
        fh=6NOcPGPhipn6DP+Fag6o1/4sixlJ3Ues3OpGHsX1hPM=;
        b=gy+9YMdLQOWP4N/WFVrTRoQiRwaGNw24DJGzPJRgFBXwauqiwisB+q2aXx8M8Xsvvd
         EjpuQ8aWkdgJZuRiTr5f9tG83Dxh1o5lLfcDHCdhdQw9K/xl5SeqI8h62S36G2fFQ2zu
         uwqpkLApZTSbRyF9dmM9oTmjLozTWFOhMmtIq82b53Oq6f1GCWnokn+GaCkzWORiz9Ki
         v8flP86HpS/TDG4vbaQQqz9rMor+cvbBrsA55mp0O22LLAY3m1H5rMRKAu8zvqTV+3jv
         69IqTv2+wPUZ679XszNMOBOA3s6u2Vb+4vdBocSNs/0JvmD1iM4aagn0LW89A0KXXTen
         357w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787317201; x=1787922001; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kITj3KNQm/KXIzgVqzqWSiv6WlzVmDA2S/07gwBrxkM=;
        b=RYcM7eKA4X0zWSj4Uj+ajiMiqd6/Qn5nQ/CBLXOGd4NY3BLwC/gQ8bDLdC7BhziWHt
         XxsiC+iFQoGsYWJt4Si3DsLrBuC0P0RUlbPLT7xawhM0ebrQTV0xdZ+mG5CNHaJ25ZMq
         z9oaXZZ8sirulD/KhgX7pwqeuJgEDiNfMBS7nLFG2qXv0xO7IVVVfv7fV61qYGcp6RZH
         XqG6U2XaRzWIuJI81IFBBHHsv0mrgbpVn0aiCJscdBZl5X79fYFaiWSTLs6e+geFVYAx
         I4pAbhjP7ZqAvid2cn8LhUKgJa8PZwJlOdhghRmoRMfryXCHAa7yXsrVGrPBjlmoNm/O
         2kIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787317201; x=1787922001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kITj3KNQm/KXIzgVqzqWSiv6WlzVmDA2S/07gwBrxkM=;
        b=BRfT6FgWpeRi4gTL4Xn/hDnladH65aCXSaTvE7fxMpn7gt4qHGpw3hzALxRAwyATtl
         RRXADVfEJnp6G8uXwyAPIEl/tVqAz7cQI5AzyYHHNCk/bY+e00i/+jwl3f4HPleGiYTw
         wsw/ejTWPdvBX9rSZLzpNd+2fYE6e3cOnG0/iCUUATaGvHmdZUqzpyX+x7NsVgYeNVcv
         Gdt3IK59OBxiNvIXaUfU/xcGZOIMGfkQA8uaOC3F77OGMVoF1sVo4iZCWqz/qh3I1FYf
         +fxvb6YS8EZRrXxSKHCNcnbplMQypmYBcQFz2rNPE94UnMMOlQ3rCc2Bv2DQFxIlPfm5
         bSEg==
X-Forwarded-Encrypted: i=1; AHgh+RrNTeVtpL8jhUwIITw3eeL8JrVYakq1qHW0BXeIbMR+NWuZjxzCaPCk1/Z3/ILS97gtaNF7q7Z6I6/Hzceq2jwk@lists.infradead.org
X-Gm-Message-State: AOJu0YzIm+GrSD85zbf9RcEhP2GZUFXaihPrXLmGn8tY8g0/bLw3QQXu
	Kcgb5qtUuHbl/geY0gs/IVtwbyJgjDBjP8D2slqrZqVuI9S8NwEWwA51ZMUp/6eNHW1BHcdQbOD
	17MRrP46Jezqfi/4DxbLNWeIfPY4nFobqhGOKGbq/D5tCcraSvj3tHx4pAdEbi9Sh4Yjf5FPtBY
	h5cCEKkuR+WkHS1dfF3KPN57I8MWB5CtkaieMvQhyaxThG+s+W4qE3
X-Gm-Gg: AR+sD11N1OSCojFax5hNSldPDyVU3oW/1fredxq0f/Xo673tAlSpoYP4J+g3MBuu+Qg
	/GeJSebtHSVZLpTMn63goo0DRpJjxMOhPWFEX0DUdZjelavzijTACfBVH8kFcoKk4UnmNV7pHTR
	/alOfz8kOglP3un/fiMIsmzVeWZlaKbpwgWokc0wtk+6NAWcaknJm7WUC0+A==
X-Received: by 2002:a05:6a21:6e8a:b0:3cc:51ff:c2e7 with SMTP id adf61e73a8af0-3cd3000a327mr12362759637.10.1787317200939;
        Fri, 21 Aug 2026 06:00:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e8a:b0:3cc:51ff:c2e7 with SMTP id
 adf61e73a8af0-3cd3000a327mr12362636637.10.1787317200300; Fri, 21 Aug 2026
 06:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 14:59:49 +0200
X-Gm-Features: AcwNN1UMCNjGyQAbzmHsbeA8xY1dFu-8Er3YSHHLgMxcyqihdxWW5Lbpb1PS4Wo
Message-ID: <CAPx+jO9QE_KG8BbfnMLTebDpGDj7OSpPDtgc9uTBGZCDJeLu_w@mail.gmail.com>
Subject: Re: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: pbvmqmyGGV2-ITxBhTMqEHYOoisUbSw7
X-Proofpoint-ORIG-GUID: pbvmqmyGGV2-ITxBhTMqEHYOoisUbSw7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA5OSBTYWx0ZWRfX65Ut3T9ZW/si
 NSgXroBqAt79snBxAIHKURShn4Y3kONo5MW5MDGq8sYmykq/lHIJWL3pGUPWamud5phkynJ2Rw3
 xwiBFlwsy2FFex4SorBkTBEx5YIckAg=
X-Authority-Analysis: v=2.4 cv=QJlYgALL c=1 sm=1 tr=0 ts=6a884bd2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8
 a=26vBHaLJDQanIZDXMEMA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA5OSBTYWx0ZWRfX/v++akpJAkwu
 2ZvOqwg7v0R1uQix5DAo/ZLCwDpea+cX9h3MxDfRdwekeyX27pPogvLXJ41hxdIMxxjhfYxQSAU
 1BJ/2yiJTqI+2HmaR8AZsEIvdkzyKfqOjBeG+ucOaaCOEC+CBTYjjWxR59Bs8J5l32Ql9MTO5+W
 A92Z81U6iFdGSJXOYjjTv50ioJpbq7a7FxuU8O2mPmyUKIU5Hxk896YpqJbUeLAB0yrGPHbFtNC
 GihJVCQSaGr6ZqKJq4MAfwRvm+OIknrWyvSxbxbgOqNoKXYt07Fj2eBBEh8fMsi5eU1Kj/AAlGg
 orBlbNOYYzjO4WNriLViyVe/LNGdSiYJ+XGbyCqKdBOOLKx6rvS8m2ozCebQzOVhMmMm7eCCAzR
 bTSmnCJPJ5Bg+eZYYMkniNa/yu/4oDGbqOwWrYfng53jYh5Ij+tzU1808mkyFLfYI8DO9aDdo9H
 sTcHZM3srE8yG+A6QZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_04,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_060003_974113_7195A9B5 
X-CRM114-Status: GOOD (  37.46  )
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

On Mon, Aug 3, 2026 at 11:45=E2=80=AFAM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
> Currently, both the PSCI core driver and cpuidle-psci-domain bind
> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
> introduced, would also need to bind in the same way, leading to several
> drivers attached to a single device node.
>
> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and registers
> PSCI child cells. As the first user, register cpuidle-psci-domain as a
> child cell.

I don't think PSCI should be modeled as an MFD device with childrens.

Instead, this looks rather like a better fit for the auxiliary
bus/driver. Please consider using that instead.

Kind regards
Uffe

>
> Update cpuidle-psci-domain to probe as an MFD child and use the parent
> PSCI node for power-domain traversal.
>
> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  MAINTAINERS                           |  1 +
>  drivers/cpuidle/Kconfig.arm           |  1 +
>  drivers/cpuidle/cpuidle-psci-domain.c |  9 +-------
>  drivers/mfd/Kconfig                   | 12 ++++++++++
>  drivers/mfd/Makefile                  |  2 ++
>  drivers/mfd/psci-mfd.c                | 43 +++++++++++++++++++++++++++++=
++++++
>  6 files changed, 60 insertions(+), 8 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe67f7bfa44c..0b6e4f89f319 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21671,6 +21671,7 @@ L:      linux-arm-kernel@lists.infradead.org (mod=
erated for non-subscribers)
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/arm/psci.yaml
>  F:     drivers/firmware/psci/
> +F:     drivers/mfd/psci-mfd.c
>  F:     include/linux/psci.h
>  F:     include/uapi/linux/psci.h
>
> diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
> index b88b01aa5829..c5ecca0d7397 100644
> --- a/drivers/cpuidle/Kconfig.arm
> +++ b/drivers/cpuidle/Kconfig.arm
> @@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
>         bool "PSCI CPU idle Domain"
>         depends on ARM_PSCI_CPUIDLE
>         depends on PM_GENERIC_DOMAINS_OF
> +       depends on MFD_PSCI
>         select DT_IDLE_GENPD
>         default y
>         help
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpui=
dle-psci-domain.c
> index b9e4ad7d43a3..a2d01810f295 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -17,7 +17,6 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/psci.h>
>  #include <linux/slab.h>
> -#include <linux/string.h>
>
>  #include "cpuidle-psci.h"
>  #include "dt_idle_genpd.h"
> @@ -122,14 +121,9 @@ static void psci_pd_remove(void)
>         }
>  }
>
> -static const struct of_device_id psci_of_match[] =3D {
> -       { .compatible =3D "arm,psci-1.0" },
> -       {}
> -};
> -
>  static int psci_cpuidle_domain_probe(struct platform_device *pdev)
>  {
> -       struct device_node *np =3D pdev->dev.of_node;
> +       struct device_node *np =3D pdev->dev.parent->of_node;
>         bool use_osi =3D psci_has_osi_support();
>         int ret =3D 0, pd_count =3D 0;
>
> @@ -181,7 +175,6 @@ static struct platform_driver psci_cpuidle_domain_dri=
ver =3D {
>         .probe  =3D psci_cpuidle_domain_probe,
>         .driver =3D {
>                 .name =3D "psci-cpuidle-domain",
> -               .of_match_table =3D psci_of_match,
>         },
>  };
>
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index e4fd4572472f..d18655d76172 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2374,6 +2374,18 @@ config MFD_KHADAS_MCU
>           additional drivers must be enabled in order to use the function=
ality
>           of the device.
>
> +config MFD_PSCI
> +       bool "PSCI MFD for psci child cells"
> +       depends on ARM_PSCI_FW
> +       depends on OF
> +       select MFD_CORE
> +       default y
> +       help
> +         PSCI MFD registers PSCI child cells and exposes them as
> +         platform devices. Child drivers are probed only if enabled in t=
he
> +         kernel configuration. Select this option whenever a supported P=
SCI
> +         child driver is selected.
> +
>  config MFD_ACER_A500_EC
>         tristate "Support for Acer Iconia Tab A500 Embedded Controller"
>         depends on I2C
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 72d3944b0ad8..f3edfad702ff 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -24,6 +24,8 @@ obj-$(CONFIG_MFD_EXYNOS_LPASS)        +=3D exynos-lpass=
.o
>  obj-$(CONFIG_MFD_GATEWORKS_GSC)        +=3D gateworks-gsc.o
>  obj-$(CONFIG_MFD_MACSMC)       +=3D macsmc.o
>
> +obj-$(CONFIG_MFD_PSCI)         +=3D psci-mfd.o
> +
>  obj-$(CONFIG_MFD_TI_LP873X)    +=3D lp873x.o
>  obj-$(CONFIG_MFD_TI_LP87565)   +=3D lp87565.o
>  obj-$(CONFIG_MFD_TI_AM335X_TSCADC)     +=3D ti_am335x_tscadc.o
> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
> new file mode 100644
> index 000000000000..7affd6bb09dd
> --- /dev/null
> +++ b/drivers/mfd/psci-mfd.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +static const struct mfd_cell psci_cells[] =3D {
> +       {
> +               .name =3D "psci-cpuidle-domain",
> +       },
> +};
> +
> +static int psci_mfd_probe(struct platform_device *pdev)
> +{
> +       return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci=
_cells,
> +                                  ARRAY_SIZE(psci_cells), NULL, 0, NULL)=
;
> +}
> +
> +static const struct of_device_id psci_mfd_of_match[] =3D {
> +       { .compatible =3D "arm,psci-1.0" },
> +       { }
> +};
> +
> +static struct platform_driver psci_mfd_driver =3D {
> +       .probe =3D psci_mfd_probe,
> +       .driver =3D {
> +               .name =3D "psci-mfd",
> +               .of_match_table =3D psci_mfd_of_match,
> +       },
> +};
> +
> +static int __init psci_mfd_init(void)
> +{
> +       return platform_driver_register(&psci_mfd_driver);
> +}
> +
> +core_initcall(psci_mfd_init);
> +
> +MODULE_LICENSE("GPL");
>
> --
> 2.34.1
>

