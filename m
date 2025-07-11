Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF189C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 11:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=; b=UWukiop8GLPoV7W0Bl45SzsKZm
	j02z7ruc5+yEbMgbrr/x0c5Iu6asQ43K7O7CMAWDs3sKOmJtUo8VyGVhXKjow7mTvXOBxD5odNXW4
	MbsagF6GPIeaVvjgVbcdjFfZu8zyJkvF9D9fu+Wpz79l5chTretpNiFnFnJwu/SiX5paJy6na3C0X
	xjwlsPDHxb02I9El5dOE7sq3jmpgV5XkGgwry+1iehs3+gP3i8Y/W8RghxueHMHnSRwhq8o0lF+j7
	luhjiwuLk43zTfL821q0jxLuN/FL0HkGqxZzTsmZcNEUqxaFlcSRNMQOpravCtPKsgDTA66A1Zcks
	Bq8j3obQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaBdv-0000000EZAg-2nIC;
	Fri, 11 Jul 2025 11:10:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaAYH-0000000EPXj-38EP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 10:00:22 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B1X3ji012039
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 10:00:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=; b=axw5SR9uMFk3cf5O
	c65Nu/hMWRZOrxPT5SbOCqJIjVKnOvBhRE8X0fQ6i0KGuZLwsJI0EMBLgz44VhIW
	WcVUXjWHyNwtSFfylk/BbF+Eaf/rUfoS1cG536ujCumN/i+ut4Zxunksp+PYpzh7
	9T05vbaYGayHfh2hWaTcUL5KISKFpUwpRwKtAn9d9LconQakq9FBerVWsIjzrkET
	twVdqZ98NXYE937d6Lqi2sragbZoGI3siTh6HPt3YfEY+J9hwAYplrs+on2CVKB8
	qWsm/cZD23v+ESTat3Gkt/SyuF/AK3Lr8QaRKSrvAKbwTUDr9l5tbRMmg66stqP7
	Qqv/kQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9e0406-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 10:00:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7dfd0470485so12237685a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 03:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752228020; x=1752832820;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8yPPRkJL/ZzeV4qZbIKYir/HwBPXfbbXpIoKWUgSDE=;
        b=xAfJIiad3XZ/TybLwRXVkSsTFppLlmbm6awhndQdgC/h5GORQqIwxph0liSLYtffSh
         rBBkmJufj0tkXV9Xhn0kY9/rw5FgaY6VAchJD/8AxE6tfoWhon8LsRfrdETyEeZgzCb2
         mfwVFQGsk1Chb1IBQxao6bf863FFII2F4XzDMN+5RoIMHlr6y2CaFRgbsy1eUlp4tm5e
         YcUA+GBLfEBOVsyYc7bxD2JZKEcYuL+UwGVEScj0oGW6oUBd9IvZ2EXQD2q1flPs0e2G
         59VdhtX4O5XQscLCkZqF96ybMU3UrZiTEpgAF1Zbs5MdM1ip2VWZU9Hf4wvXg9Ibvr8N
         lhow==
X-Forwarded-Encrypted: i=1; AJvYcCV3RJs7vKQfpf1wNbu69S5DU0lq3Q5mroxUpVRf1jC4XKE1hzh6GyRVv1eYSHNm+cc2pdXNGaXJ2du3RqZ+zmZ3@lists.infradead.org
X-Gm-Message-State: AOJu0YwUG0mCIugzz9dT0WDF2IXW2tRGIraKdU//HSHHJ01ku7tUcF92
	LWLbWkK5r/QZ7cC9wnkj7tI9yL1IN9Tr/cyw+FRGBGS5EtSYOCZmbz+2Mgqe5OMeAXHKDtjnU/h
	QHUZu1odNKe+DsQGq4d0p8Y1ZXVr1q0zK1uq3bX7pC7gzn7v+/UiebW4WpxZd28joGHQ/YjfsfX
	XhEA==
X-Gm-Gg: ASbGncsVz3uhnPQmuj+A4u+2h38FAPTddQszrEoQxUTYPnkb1q3Jj9MUwFJtRKPbbg/
	LMyr/2XM8PJjGd+xKQHMWCN+BGLaKt9wKWoIKphcdPiC9TNAIR6x+rRawugzkfnvHw1W81sQnRe
	t+PBAwQi4BgACgsayBwkYAswg+QcjItHpoEO1EHo57J06HBdK4i2qp4aHVdrXSk0FTiBv0l4Yrd
	wKtz0aZA1jvmJC0W8Wz1Z7fHt9QybjWQxBZySRM4+mtzP/XvIZulmi1HN4oxiXPVtkgtNKbVtPt
	J7NAoHokfflCHfHeXmIHX1+rpnTvAqbIcpAriFNgcvPiv7fd61Hpt0JElaHbHFk3PZVzgYsembU
	25BWNUnWQJSajbFMlBJOD
X-Received: by 2002:a05:620a:1791:b0:7d4:4353:880 with SMTP id af79cd13be357-7de97c2cee7mr101578085a.6.1752228019737;
        Fri, 11 Jul 2025 03:00:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlhPKclj6Yn0L7q+F2xj0Xt2MfgZll0J2UP/WxG5I7gSC0cNE/OxkTsOoKzfyHayBKXzvFZg==
X-Received: by 2002:a05:620a:1791:b0:7d4:4353:880 with SMTP id af79cd13be357-7de97c2cee7mr101571885a.6.1752228019106;
        Fri, 11 Jul 2025 03:00:19 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e907c7sm276215566b.17.2025.07.11.03.00.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 03:00:15 -0700 (PDT)
Message-ID: <9b1c3318-7d89-4fcf-99ea-3b446793a758@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 12:00:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] drm/msm/disp/mdp4/mdp4_lvds_pll: convert from
 round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Linus Walleij
 <linus.walleij@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
        Philippe Cornu <philippe.cornu@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai
 <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-3-601b9ea384c3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: -dDv6Sgyd6_EIGDrj3mWlSKi5h8E0M_4
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=6870e0b4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=Lh8LEGs6nEvmLzq652MA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: -dDv6Sgyd6_EIGDrj3mWlSKi5h8E0M_4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDA3MCBTYWx0ZWRfX59aWPOjMEYja
 w9/xBJOQOifsDtoVaz5z52tezx7XTLHbp2RIjpCC4WDD28k/iw/wTdGbQSwdEYpvQsBSq5wCeaQ
 y4q5KvWxflW8cnJmUWz987jRS0Z39CXrvvsX1eW6gJHB5371xcav6p6R1arBJtZWERGEZXLadj2
 eboKkEffsUleIeo2x8C/NTtkuMSb1rnCiK7LL98DQy+GljizNKPJL8LJPTIgOZg1ATP4sTyBWuZ
 289ddKIv/m8FnXpNGlu/ETzjcubwt3ff3io4fx6PKL7hRNUWXFLMhLsTSu9Ey4oec/xHJy0fYTI
 KeHTyazal4IC+nQvjDOej39pooAAgBC/oV5oXRFgxfl0f06VmiuqRF5jHCXOVB95UoTUUS/MWGv
 oVZOOP9aOUqzmGO/NHvzD+xS8KYhQCevuYfj9B3Sv1Oxg9OinzUMz3fZNGSYLHwxudoXwxJI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=837 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_030021_908590_A075EDD2 
X-CRM114-Status: GOOD (  11.85  )
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

On 7/10/25 7:43 PM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

