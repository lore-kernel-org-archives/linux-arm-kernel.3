Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB07ACD98D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 07:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lV3PsszzF0e8PSHEQWQ0iIE6jGmvm4gXnL8CM8FMIps=; b=IX3uyyQz2pmw/oyMNN9uT2P2jF
	c67LoD9G56ji7w8tp3BtSBkqtAaPPgdtsBrVUeAuXzicv9yM8eSETfvNDQW5wH/vua3IwZx+p12rG
	pnbrdVo7ZeA+b6SkTgYhExmAGqIHrS2JsoECJzvut3/e/QXBGbZay4xaKP/6lHJCBTaQAvt11qvv1
	Zt91pV7OWdEJcpiH8eGuw+HXWZrFQY1hNkvLRLm+q24PrG5JVVhZvD2LnoyfkPQ6/YuQErYJzeKbV
	O0MOU9CjUNRX1m2D7XgljjGec1ldTe0WP5uuZMHtzgRPHlUFHwEXkAQGEgvEZWZr3q0ruV9xlVMQb
	wp3/hnSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1j2-0000000Dmt9-1GW9;
	Mon, 15 Jun 2026 07:27:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1j0-0000000Dmse-1YW6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 07:27:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6KbkG3910878
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 07:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lV3PsszzF0e8PSHEQWQ0iIE6jGmvm4gXnL8CM8FMIps=; b=eElLavAqty18WPNi
	akQ78LNkjS1KxXRN/LcVTT5t5wPm/l36I16VVcthNtebm+bPUaEK9t15p8plA2bD
	R+HvKJNLEAE1pNlOCGEjdMT98sV8Q1COUBZHwz6rz65MwV1NInGBJIlfs8aF5gbr
	zfd/b/hWYOjSSTNJDoGJHZ/pHHnfwCZ/KeHT6l81oMWbC4jhmW7E/+gzRRLer3UE
	592gLtW6W2UgRqgBcnie2KBts4aiVgZX7NE+BtbLh/f3AvfsEkYyu5OHwnl6HQXH
	m13TusyKegmMK+/Hj1xXXPguNjjSIUvLEp2jgScNmkSJp74M3Zb8NWGmG3TskK8M
	kJPhTg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6x7r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 07:27:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c857ebbb0easo2218175a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 00:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781508432; x=1782113232; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lV3PsszzF0e8PSHEQWQ0iIE6jGmvm4gXnL8CM8FMIps=;
        b=RtM3LjpjPyQ5dmVFIgVTnhWOzV8vUGgewbUqb8wBl/sUL0lHLrYf5J35vXl6EM9lTo
         10/2XZzjJjz+sSCp8yBh81wAdCEeLV5PK/+B2cpR2SAdTuMu3UdXRARK06s+Y19bOb5u
         YEUdQRZ0lM/zfGtwoRUjstyDPLWUmbrSdzwkFrHpSLpZMszT6pWIET6bmYFaiGwH4Vwy
         Khnj5Ut5/oI8fbAqf7sdqM9BryfwVunGq2GsMg33a5s1VE3vjsoJ0p2DZdrNfCkUIz4b
         S+EqBVUYAdLuSbkYbhPuPZuTBzHu9M+IeFEBiV1oL3Oyrzazp+vaXRBWk6dFxYSp6PHD
         5cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781508432; x=1782113232;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lV3PsszzF0e8PSHEQWQ0iIE6jGmvm4gXnL8CM8FMIps=;
        b=W1pPyRudj3jBotLKTlCG9Tv3KyZkRCGfuvZSzNokge6L9OJl0B7tnupz0PaoS30NR9
         hJDljpFz9tnEjoSMXIdv9kGmlxdrJywbxIHK6TwtK8b2oBb4omyGlu05YSqKGNpQdjNz
         ZLzRgumsusFKc2vXZCKThwz0YDXCo5iubo1JSrzc8Qn2XDNd7YCmFIPPuvpbVU6YQjsU
         YM/AphKms78HNUlZKHxYdVhgJ3dTrzFhnw5qiLgdstVENVjyHSxpLWUD9wchkDkH0oLR
         KVoOf+Bq+e+DYR6+ZhbIDV++vf/orJBwwzHmLNNCSoV+WIAksMijYKjz60Xebb4vd48G
         EsHA==
X-Forwarded-Encrypted: i=1; AFNElJ+7DarpU+kcuXmTujGIBTDF2K+Z9dMhwUoEdr8LcNGSLKZWsJYbSAceFVIzNw0W8yPG+JO/vHd2a0CCt+xlRG+f@lists.infradead.org
X-Gm-Message-State: AOJu0YykVlJt1ECx3TRTUoPHwNWOb8X56C5F9GDmPjXsNl15eu5EK3/p
	vXLCA9gtPFPHeLd7iT/qUFjKRmSdhaw/IKlHQCcpkvYEf/GMExAIV0ocueECxdUAU4bxh2wojrn
	036UBozX1tx92Cq/y4lZJPJuKhIyBenPQZyNy/oiI/iOKjZZPeRQmxqF+58YPb9/rFNFzfsdxwq
	+N0A==
X-Gm-Gg: Acq92OHaiM2qIxHGBCPQq291zwtsLWwVXTdrYKrmKwl0BryrApjPglLJSs5fY+vbFNy
	FqP4f0b7g/qZWh11Cu4DJ12XC4XD1cg2fweFv7GFiGG2dnrdZBQ1JH8LSYLSns0GGUgKZEBzpGg
	uoAD+2E5PeLYtnS8bA3A/wUF8V1zA/kVWvzRVUf6v1FHW/rtfCdxMVZx4AzKoofchRyEdUNKYcU
	EuMsHxQ/bq1RfRw5EHZvZYzqm02iDOO90dqFPvHyCTQ0RXfpd8jH3hYNu8qeqomoDVA+8i/l/FS
	lamlDn4WCTexkyb4DLpHBCm3hwvLCXP+MlE4ej9V6nVj563UObcYyH+SeVe879Ks2TqvZtD8I2Q
	7A0jZR+JLAOsMy7gsoGda6ipIlOUoEIudua7s1PN5HqNGHDiSwQ==
X-Received: by 2002:a05:6a20:e290:b0:3b3:bf9c:7c3b with SMTP id adf61e73a8af0-3b780ec2f0dmr12418308637.8.1781508432270;
        Mon, 15 Jun 2026 00:27:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:e290:b0:3b3:bf9c:7c3b with SMTP id adf61e73a8af0-3b780ec2f0dmr12418274637.8.1781508431779;
        Mon, 15 Jun 2026 00:27:11 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.27])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c86651af0edsm7787406a12.32.2026.06.15.00.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 00:27:11 -0700 (PDT)
Message-ID: <b11a9de2-6bc6-4345-8d81-5befb2182a7d@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 12:57:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/6] Add CAMSS and IMX577 sensor support for Shikra EVK
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
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
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v3-0-8183481f48d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3NSBTYWx0ZWRfX0oFkfBZsdMLN
 Ka/DyEdEypouEKZVuZJEes9k05OnpehNaIfoAbvEocRW/vbkaplKfI0/w4L7MiuHIHO33dtKW48
 haAnzBu8YUcDbsiWdrirJwwVWO9Z4ZY=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2fa951 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6rJd4luAlhGbPPINhpk/8Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EF_2yGccovn9CQtFCckA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Ao2GmFSoTop5awbrHzMYGY8f5s44AqJq
X-Proofpoint-ORIG-GUID: Ao2GmFSoTop5awbrHzMYGY8f5s44AqJq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3NSBTYWx0ZWRfXxFWJtL79oB4d
 w2x89zcpwIA3d6n0MZTYbLA/cbsVbb4AXQMHDZuCGd3wltr4e537xUKupx15M7Q3d5Be29g+jTB
 UuzmZO1hrNqfv7V4RGrUQ7tUdWfauigIZ8hhZ0QZuySDyDImA41tbAVFus9FU30DkmP+bNZ95pf
 7hLOmI9FKpl+gDT3ci9c07AmPRmaITdZiJgS/DbVxFyFXBMeDu0MHIA4wtyrrQmkb3wTCkKS9sZ
 H/BbotlCXSW5WAOJRE7i4gZegpw56+RMF8iGa5R0zA0kjALLG1Lco02FWS7gR/UiccazyQWelkz
 wwUZRe8XVQ9ZuRQKUnIPvdxn1REvsZjOMUBLSQIGUjv6kmffT6etnzWYV/7SFrfFgm8k+ZBzXZ2
 8vzGVkVZpMoQZnsb+2sXooGQMokACEHrH2U9MlpfvGC9GDkmDagzGxqYqSJ543jyswiE9yTVHbN
 L0mNCMM29v74J41Pl3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_002714_531222_293F5D94 
X-CRM114-Status: GOOD (  10.91  )
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



On 15-06-2026 12:42, Nihal Kumar Gupta wrote:
> - Add blank line between iommus and power-domains in CAMSS node (Vladimir)
> - Fix data-lanes numbering to start from 1 in all endpoints (Vladimir)
> - Move cam1_reset_default pinctrl state from board .dts files into the
>   mezzanine .dtso overlay files (Vladimir)
> - Collect Reviewed-by tags
> - Link to v2: https://lore.kernel.org/r/20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com

Hi Vladimir,

Apologies, I had tested the changes with data-lanes = <1 2 3 4> 
but mistakenly removed them before sending. Will fix and send v4.

I've incorporated other comments.
--
Regards,
Nihal Kumar Gupta

