Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A192CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 17:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJDR0H8V82XJxR0Z1RuppBFcrPl2HmqD7fethUF331U=; b=oKOHvPbGe16BvyG+vevd2+ANfM
	jvbc/fuzWr7hplcG3RaXo4OibnEuhqdeo5bfpGbSTb67/vpc7HHAVIf8BnIUoGFs1fhCs+m9y5nZZ
	6DJmPEsh+gRTpU0oogX/+cIGxb1yOB1tfq0dFBt7FgZDnC2lbP5z9o0r0hTN8JEqzo+VPqIoWhf/9
	Z71VEozs8hcyAoy/LxmJVafrh9XCnL/6vk/7X3dfKkSneOhf0MPCmDyh43hKgk49dMrB/xklGJv5a
	1HT59RnuJcUvDg5URgQwEkoKVQZRADLYwwJ3w55i03R6TLhdvIZ1ojb4h+YMC7HGuTwb92sjlRUc8
	irSgTaug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT138-000000080T1-38ny;
	Fri, 29 May 2026 17:31:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT135-000000080S1-3Mma
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 17:31:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TH8gtK2857408
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 17:31:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fJDR0H8V82XJxR0Z1RuppBFcrPl2HmqD7fethUF331U=; b=X4esPTDHlq+Rsv8C
	XbAcFT9hcaGFg+2OcBQjIPdDp0LQGn9CtGtOcrfjUnQuB0OsJ4FLm5a7uqYd2R/A
	vviQZtUGLD1Zww5tRizwiuO+5O9eny4ME6bhlPQoEsnHbs2mGGhv9yOd3K/MkUyt
	no1dFEHBlc21336KaM8+mWwh3RoF7mhff+nlFlO18jFuFoHAmAMvogt9wso9ZZ7V
	J3rdS3i2lzRxvNslmAh26ZCFT+Pa150ebYXyp79xHtxLIgzZzKz01woDGCwutUIu
	DJTF0TgnuC5gcTBNHbSy0NE+L4zZAlMM2vOAcW6aXypzOx+S9KnYiKqunG1anTNy
	5J33Vg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef4jj379s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 17:31:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2bf08c2a24bso24126415ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 10:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780075866; x=1780680666; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fJDR0H8V82XJxR0Z1RuppBFcrPl2HmqD7fethUF331U=;
        b=FDyuEy6OLtgvKIApwqi7KphZ8sSC1XWV5j5sccSdXPhePNpmxz+7wcfYjNRcdApVsT
         GmTGXEIG4aZWI9cohNXZp+0bRxPs4fo8l73vDbFdFhrLtK7bEjp3P8ysR5BtR91B1QRK
         Jqm79sKh8ie8XpgBPsVytZf4nWxG/NdByRPO+oAkWlfi8NjSFiOM1WEaOZ0cRPI1nfZO
         2UgESb2MdLpf93/+MIxS29CX9JFSWl9LYBGnqCfiQ4iU7gZHJvLkt16YJ4FkjCm356IA
         fc5iYXI+OsETSr+3k/VMepfbmggKZb5giV7LWMtxA0loRgzMVMXyLGu0StwfQf1IBtGX
         dDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780075866; x=1780680666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJDR0H8V82XJxR0Z1RuppBFcrPl2HmqD7fethUF331U=;
        b=DtNR7tM419XOH+3Y+nosZjMgFZMHoEulV1oY79vHQ0SJu2UgNveYeTPL4fl669SULb
         95mBYF2jpcJ5KMEgWPC38QJU99btMPX6YxrjzSoj0S2LTlxhlyWLnfhJj3AynjXmwVGg
         iNarVJXK0Lexpx/4Hf7ttm0EKe3B2WeDeTJl6R0umLYB9DUixRG50miX11AZlHCQywyh
         d9ogymvQhLC7cEwrjL+YISKu+AMg3dYSXj58PCr9cfZ/7CXPLPnfOxoBZqLLlAT6Tgp5
         mH8M5HfYCXfrM4psleuNachuLGz57RSGQYarZ+5jz89JSgHa6KF/eQTPyfB4pLAAl4/Y
         NTfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/EPQgVxAJhmgtBcyr3GsR4rZRFpWccXNPeFmUHAf79Sres4qUH68bh68Cxy5QzLGEEjcMffK+vrdYA3CQcawW@lists.infradead.org
X-Gm-Message-State: AOJu0YxVI2CAHus5XBdZ3BoTPSUFqKTkJg/VUjOJsD6JGzkO3RbrLt12
	xJLHIyKXTdtaBUkiJPiTQEI5AAtBajRbmUdobRnYUKbI32gf6NnAFRolWMDeB0SyCmaxYccT5iD
	2laUz3MIqDOXyD18dMULGnigh+Mmok2tcKncmn0GlA3kOchyOpYjiy8c6o+n4yeZgdSOs/Z/IJr
	PFeA==
X-Gm-Gg: Acq92OHYsgfKSvuSg6XvzR49+7yUEvf+ws2Zec5cBWGSK+y0TACxCE3KsEOuQoP5kHZ
	OMGXdotJt0nLawUaoJh2BKA1ML52dS1XK4ud14epx9KYlo3UxrbhtoJTwx3A1IBRbblNDnBGQPP
	LiQLOhFKi5dKDxxmgbNgwhsU+XGb89dsDC1BK9J+rIuekcwJlb0y1jVt2wcwmk+mFt5VwATNCfN
	pZxGEK4b9TpFRtV6Npcizf8NCLWn3yzy1N9bUgD+v3Mxo04wYUdCITLukuYTRjH9yS613eatJCa
	5pCtA1t4NmQsODxAmu6HKmeMWvVqnyXyjYcW0A1aZwYGwf0cwdrDt6KOkTpYqK+5Me4x71hArSm
	UuiY3SzCbnoU4DAspsLzT3qHTghjgs3Qg8dHsg37JEaeqakDBhrZ1QZ5TOlgilP0=
X-Received: by 2002:a17:902:d50f:b0:2bf:2015:5ba4 with SMTP id d9443c01a7336-2bf3682a24bmr9445125ad.24.1780075865554;
        Fri, 29 May 2026 10:31:05 -0700 (PDT)
X-Received: by 2002:a17:902:d50f:b0:2bf:2015:5ba4 with SMTP id d9443c01a7336-2bf3682a24bmr9444745ad.24.1780075865095;
        Fri, 29 May 2026 10:31:05 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.224.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf239e71cbsm25476575ad.15.2026.05.29.10.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 10:31:04 -0700 (PDT)
Message-ID: <bc2aecf3-fedd-4b15-8e69-33ca928831d6@oss.qualcomm.com>
Date: Fri, 29 May 2026 23:00:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] arm64: dts: qcom: shikra-cqm-evk-imx577-camera: Add
 DT overlay
To: bod@kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-7-645d2c8c75a7@qti.qualcomm.com>
 <178000731452.4557.8537369407478321842.b4-reply@b4>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <178000731452.4557.8537369407478321842.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE3NSBTYWx0ZWRfX1TmCrQ59v3PY
 8XCIAtA1Eo/9D9oIMwRqOmAKZIBJQJNkdchgI8niktJoIwnIa+tSuys7quzcrZJb/er2/J3eKtd
 l+/RHbgg0dTfoK3+bnBdV8/6//pXbYiZlqFX7Ymnx4yUTagkEWZcXCFsXz3aDLbaPn4ST2uEGkT
 oezZ/YXArARHoyzdiE3Ai1VD2LaKOAR9BfUay18s8+EUePmwuikGhjw+Ah5yB46dLD/YHUYNcVY
 2L9lNoySZ0d9TMG2Vp4n4lsgd+/+mf6Fmql1M3Qgguu4jMNd1epnSlCv9yq87xNFw4/g0h0V74W
 wk3jIEdxQv0WntXMw0+21cX8c9WQA1cNdYEW7jv0O1u+w4JvYLqcG/tSyUPzmfEYpE2bAkk8/Pg
 q/CCa/4QEbeCcngbyYQRQQMfDctiyJyx5PfPRXCdx8rinmR9tcJyFEe8V7DD1xpXTVAeFynvNt5
 izFDNS1XsJUex/p0D9w==
X-Proofpoint-ORIG-GUID: MhxBWs-qOq9JnV3l7hdTjvwxO7rtIxPq
X-Authority-Analysis: v=2.4 cv=Tt7WQjXh c=1 sm=1 tr=0 ts=6a19cd5a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=tDSAgCU/rryVExTQDfsVjg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=iShi-8OPmrKBgnXoZJYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: MhxBWs-qOq9JnV3l7hdTjvwxO7rtIxPq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_103107_960676_633B86A3 
X-CRM114-Status: GOOD (  13.73  )
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



On 29-05-2026 03:58, bod@kernel.org wrote:
> If the overlay is not specific to board then the overlay should have some
> kind of base name shikra-evk-imx577-camera.dtb
> 
> This seems like a minor nit-pick and, it is 🙂
Thanks for the review!

The overlay is named after CQM because it's shared between CQM and CQS
both use PM4125 PMIC with identical camera supply rails. The only
difference between them is the integrated modem on CQM, which does not
affect camera hardware at all.

IQS uses PM8150 with different supply rails, so it needs its own overlay
and can't share with CQM/CQS. A generic shikra-evk-imx577-camera name 
would be misleading since IQS is not compatible with this overlay. 

Happy to rename to shikra-cqm-cqs-evk-imx577-camera if that makes the
shared scope clearer - open to suggestions.

------
Regards,
Nihal

