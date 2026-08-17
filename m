Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F6FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 13:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTrEpzlfCsrOhTTbV+g8x/HCYMbW2tO/XdIXG1JFb2o=; b=ylYzwIwcGT/KTX96jIgJYKJova
	VCn/4Zm/QsnMY7PaasVcKEfVXmcsyWaSwvuIoSehpCMuOoWp7AxQn7RithVRENN2y2CBU4Ip6NaLj
	x/dfuMzPTpNl1XpPNlsLot+QSPFj/1dFW/PEgxw6B9Lu1GHjOTguTqm2X+j6Cxgp6zHEKUmkPd0zd
	T/WwaQdOiMR0AFx1Rffq4/E8Qx5zr7iv6Ahph6zIwRzJqVsGhdeBeF/zy1GrZM1ImLojQqBJVj3Ym
	keyxxk5mueztx0NBej8wdJQxp+cZvz3N2SUohlga2cxNXia8PfmwC9MLYE8g+zAhunsT5syMQWiZ3
	vwljixKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxKg-00000006DGX-2QIW;
	Mon, 17 Aug 2026 13:24:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxKe-00000006DG0-3Imr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 13:24:53 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HD5s9w1929277
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 13:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oTrEpzlfCsrOhTTbV+g8x/HCYMbW2tO/XdIXG1JFb2o=; b=iA87aj+Z9SmKi8be
	luOzuB6NnY9KfUCiUofqNM0EyXl+NG2Tiej+CVCma3IAxAdFwTpVtRxaQJ0c9JF8
	WAQ6SylQLt2BXfX8Z8/avmXtOPgz4WaquOX3tNzvy5yyQ2uj37DsxZip/6TvoiFx
	MgEW7f8sQkPF235TI+A4kG/Fhm5dYEAtfP0ZpP30Y0PKU3OqHOa/u+yK4rnTJOKc
	4tEIMNeykXFVa4tjCGmaT1E/pcbGoMvLsdvFy2OMSeUyFuSq0IJ2aWExG9JiWZsB
	hkXk+l8FOq85mXyGNHAOzsqK/GT0P4sTB+fiAGJ3KoPnyMQN98T6c0UdlSFBw6Px
	dm4TdA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xx7h20w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 13:24:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c9e97b626so4063681cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 06:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786973091; x=1787577891; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oTrEpzlfCsrOhTTbV+g8x/HCYMbW2tO/XdIXG1JFb2o=;
        b=BsnEeD8q3K1l/W9VOguAZENP2ZgRa/oY22fMsU83gWrJpai+TEVlxZShJPubQDj4ij
         W4ZTnBips31sU3WMRWfpCRfeEnQIBExoepHRwnmdULq8IwW1vh0ODJlCOAbNak7BbUDp
         SDp5hTXcbyNbEYTgG6iCjt/L2T4i7+kyvs0hvaSCM2IILbehVUztOJeivuFQg1VP2ySd
         hMizqhe7Yc1CDog5l+GE7KAcT/ccwIuUIAgR+gxw4oaLEDE0Pl4oGvD/TKZ0/RB1qGCc
         THCy3ygn57ftyvDx9/wvAts+F8qRvGlDdXbgox+fkZOsT/q+bfNlIylhYfgUxajqiI5B
         cf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786973091; x=1787577891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oTrEpzlfCsrOhTTbV+g8x/HCYMbW2tO/XdIXG1JFb2o=;
        b=PNqFJbnLN42PXSlWtzHEyF0JONMezbP7lAf9Csa52tKCfcoiBZt4i76g81f97jd7WU
         M3Nk6PlifZfCj4nSjTV+4E4NEiC0XTL94t2VIrr51giopGk+DynK+lscgQzFHZjTfa0w
         1jgfGINLmC5zF6YTkk2Khz2mIfZ+5ZMfPcFoH8TpqE3750vj8wJ5MeahRApGa6ondiPx
         d7cor4QCO+PvcPg8BKZlvojAPXKIebN0tHwF0V5sIj7VaHQxhNrn63TvUpdbjKDKM+kM
         DbzfJH9GEdkEsB9dIUwRQ/NECaIjwmLGxibsqznY568FnLkNMk7vmr5cT0UKBNuB3VIq
         4A/g==
X-Forwarded-Encrypted: i=1; AHgh+Rq/BtziuvL+1YEdXS7pTgWx3a0lZRxkCpcUx+Fr2lpu3kGPnPRWFB+INQODglzbbvHW5QPA8NxZNnm+mUsUCP+Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yytfqw74xAY37VoZf8yXPfrbt9ldC599ul2YDZrq9PvqmHS1mKZ
	oMctnx2sUdbiT0kvDWbkHOsRiOkP6Y/Dhx79z7LY5YX4tQTqKg5UhFyDok25dNYJyshe4kxTlDa
	dg5LowUmMIZinYrEum5eN6RXrJ39O9g8xBRtkTxEoZknC51oFZ1kNEbEeGYbjrCx2TdbNQWQZp7
	/HDg==
X-Gm-Gg: AR+sD11J5CT49ibA3UbQMDhXgRW8x91+JfTYtMh+7vQG8tLX5xt0RFuHoEonmBNiN9J
	QBrdAiQdc/YX3iiZsgY+8JP88eKABATd38vFMXhefeDkeo6Yg5btlMq75x/FVJOZZ5vt2cZ2JGx
	a4IaLRgHQNryN79IKMpJ12q2GMBF3JLKcXHQV2asCQ/bl7WPWpS7OKG9hi3fK9uUB0RvGAlF2+T
	xsRZMSxLi5A3fFf9++sckDpIdL4zNwjH1W4nwnzCwRZOT8RK/njn4dhwXui5UTe0SlrhwhxPnFg
	kkI7ktdV9fOKbIbYdYFtvgtyuwlAxr3mOaRjS3dlLYJKmy6EhXMVLuRExolG1Dt0jJQfdvNsx9s
	ucWJDn70I58X2wn9fXUes1CgW
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr103953451cf.1.1786973090879;
        Mon, 17 Aug 2026 06:24:50 -0700 (PDT)
X-Received: by 2002:a05:622a:1a86:b0:52d:9db2:7924 with SMTP id d75a77b69052e-52d9db28d13mr103953141cf.1.1786973090323;
        Mon, 17 Aug 2026 06:24:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185bc66a7sm26799466b.59.2026.08.17.06.24.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 06:24:49 -0700 (PDT)
Message-ID: <b88c7884-f86b-460d-9880-8dbc23798b02@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 15:24:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-9-3079794f0f73@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-9-3079794f0f73@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX2/sl/Adb0Gf4
 1LIAXjtemydRz3XrtatdoosGaKPjMKJit1cPhlVhkO9QlaeD/YHpHb87mUALsZfbA9IEGE4iWOw
 BG109AVGW5Bu2qEKnztzQmLQyrNgQ98=
X-Authority-Analysis: v=2.4 cv=TK91jVla c=1 sm=1 tr=0 ts=6a830ba4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=4tAzDn1lkwtfZF03VZIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: SK9fcCHDITFfP8Bh1kreRZaafl1qvRwZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEwMiBTYWx0ZWRfX44fx1V6MGJgD
 coZLphXXKJnTc3Z8G5aWlMKoS4jwjK4VKBDeZoqfUUHayKEQTqauwFqoSbjOeSqglTymJ6AmKS4
 mc8gkRycmdGHSqJpXha3+HXABffdtvP1znuhfb8VXT/XDkFe5jFPCemUH26Ku/Oly2F+TE4l/Cy
 VnKMRCj1i3/SURAcSYMMem/qZSeGnOOVHCOZHlT0eut0CiEU3AwzVemW34XDSIaHtDqezHi/p1I
 q2YA3F0L13j5KMf6x+1L0aHizvOTGcgE78ISe572L4kH7jstkQrM153M1pKRMjs8JYDT9/Wyo8i
 6LKuXe9YZLIJMWIRrqKGo5ivYX1AGW03CWq9zU6McUIXqI72GQx520kQFl2VCkRsbqdeRKBn039
 RoXet8fEUO/XNeIi/2VrJbPt0z8mBFsOVCDL1qrcKwGrbr/MLXsBhCHEMwqBpbSmcMQasOfbHf6
 Ya4brfBencTRkhVPAWw==
X-Proofpoint-ORIG-GUID: SK9fcCHDITFfP8Bh1kreRZaafl1qvRwZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_062452_851686_18825C3E 
X-CRM114-Status: GOOD (  11.17  )
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

On 8/14/26 9:31 AM, Hardeep Sharma wrote:
> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
> interface through the common pinctrl-msm driver.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

[...]

> +	[65] = PINGROUP(65, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),
> +	[66] = PINGROUP(66, qup0_se1, qdss_cti_trig1, qdss_cti_trig1, NA, NA, NA, NA, NA, NA),

Function3 can't be selected because of repeating names

In qdss_cti_trig1_groups, you have qdss_cti_trig1 specified twice.
Perhaps there was a longer name that got truncated?

Konrad

