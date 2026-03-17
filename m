Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840DCF3380E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 08:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q22MAYUqk7atynCYU/o1hplSy4gS1yYkMhcE6k+4m24=; b=z3cQLMZ7qD2x9Og8gdNi/wLK1a
	wuQYMhOem5tWtlXl+Uri30VzVnnWQIzfZKx+t02u/rhbqovz12MpMW8DN2nkwFxSXZhjFYMYOtDQG
	4ZPxKdfXJsWXnOUuadoUtCz9AmyJC/ssjoMFeGykQ7zzw4KsH0yZHqF739FQ/Sqiza8uvZqa2ckwR
	W2m9rVI19k0fQJAFLwexx0BIqTyvcqZOg4YnKW6MhxlcCFh2cFdxU2Gi8nIV/bzNxL9/JRT+xcmC7
	CbFe7wsOVe/EqMPSehMmcZRAbt9YMDxnPb+AEgl+RHxzmLsAQHg/gl8eXLgjPN4T4OkbkPya9wfIu
	Tg10NKqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PfU-00000005ij3-2z9z;
	Tue, 17 Mar 2026 08:20:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2PfS-00000005ihs-12tu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 08:20:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H2DMh13101961
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 08:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=q22MAYUqk7atynCYU/o1hplS
	y4gS1yYkMhcE6k+4m24=; b=WYMSh4gY4nzyJNDkWIGNwmCpNCzKOhmbup1WihmJ
	OxtLfiO20vvyw5ylrgIPN7hwSM851kBvdOida0PFAgIYziQbncZznCr2762dNlhU
	j/dYsEUBxnhcOKvfxifoHL9FLQ2zH77rwqyRObntJb+eeV8pZJ6ci9ySTQE4bmJ7
	RBWplc1lIIMT5qYVQtmwM8iVdOoHsydeFVEecWiOm36n/JWlZckgvQGKQRXki90Y
	LJsiq9Fylq+/xxTMYJFKyrUXZKEDjzeLLLiFA2gMGgpGsqgIDet7ShDnjo3d4FUe
	2KAckR9Noig2yrP61AhMk4c9uarQbrLaKkaJLSioKiN7hw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxnb7auv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 08:20:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7fc27cf7so314114885a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 01:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773735644; x=1774340444; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q22MAYUqk7atynCYU/o1hplSy4gS1yYkMhcE6k+4m24=;
        b=hlkuHzttp7Mt9e+I2dXo+mKXPsLIkhJ2q9yVVHcYHOem4VIGdKgr1G9G7K6yV9qyRG
         O7PvCa5d2lDWNmeKnBbEo/zR0eJeDlsEPUzgMevHUjWsa4ZtRrBwx+DmvVrMKHh/tFdn
         dF6TW0RtvkxgcQKT51a5LTKh0HzKb/cJHbLQ093kyIFw/RnoA6pzRhqfdxegKjroVr+I
         vRrndlEPdHP8TqJF8+sDoawEdvgfsmYAvm3JIdDpiuAWzpGsgRfMZxiCGvmC0I1ECeoT
         FGJlR9Kfx2WL+ZJR4c5zYYG5Zj1t/db/cnXG5mIFjJ25WdJMGTtMeVRWxQXOxjK+DIbk
         b14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773735644; x=1774340444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q22MAYUqk7atynCYU/o1hplSy4gS1yYkMhcE6k+4m24=;
        b=bTEM2d91kgrQ/5TvQGG6LqUxD7wc/lSu6VTbUoc/eToOOtn6LRVPk0YmE996WcZRuG
         xGq3U2xNG1tgHWvgfbwLC95UemibEbnO7aqtkJR9JuVyNJeuIMVrPG8ynXb4y7sZanPu
         t8GLvSK7lxP/BcOKcw5IIoAeRkB5hOXveJ77bDm7uvvtvKg6pm4ALdpdARclvYwAMTLx
         Q8MOvgisblV1NeLF/3IAp+yUIN5kc0ioDqxPmxMqXAMc1fpjpsVGw5GmmoredlwP+0/q
         /vY/U16gEejCLDafEriegdoaqNPyMhJuvZkd9VaUgAFSunlA0FJjG0Mc7AbT/78GiDdr
         QuCg==
X-Forwarded-Encrypted: i=1; AJvYcCU1VTP4e8+0oLNdE43mw2kTGEvD7m0w3Af14wX1IyPZFDisDRhzgWn3CaZ2bwjeX8+ri48ugSzKYtzEZ78hS2YC@lists.infradead.org
X-Gm-Message-State: AOJu0YwAWDumv7I+7wEZJJ09DS89XXlgAqHbCr4WT76tYY9z+vkMVwM8
	o+nkdP68Wr4tuBg1xfggBdhQg++UZ8v9PEw8l6Fi8blYj20qjna4PpA7n0/u3GNtnB217NaHDy2
	XY760MZGKOi7k/fHuvyGinC1vM1XNjfUpPk9BrJ4taANQybBoH4RFESjlzFMB9U/3w9ujkHk/uC
	7Oiw==
X-Gm-Gg: ATEYQzwoaHb7LMlFinzZGbMI+c27GPiKJ0wbpPIF25jrP1tVZ7swLjwBfBCd9UvIKj1
	K7D7oJuhJPRxCspC8iXbsuhi+OmLsyCT6B7sMquP5dFwmm4ysfdNqG0rBwfTVyikGWGp2BYgtot
	JGtatMQ3oIzLXtBArFYvrHfLZ6iKGMtxYL49wdHgFUMBbneWobNag9tSQjlqhNF9ZM3jFKyHSAC
	iLr7s8DeJc94uJHvk1+ir24Xi86Eyk9vDoo3T1vOnQoziHvWUfspqbKsNDQVS2anTdZ7zQyFY8V
	0GMdxx8gTz+mk2+KFk+deDdpI8Cmr/5lcs7DvGxXFOdxRzepXaMOx8NflMvGsrMkgRK6RO35w5Y
	KS66NN0F3Jt6I8ohhETVdjkwG0bRxwvjf5w==
X-Received: by 2002:a05:620a:19a1:b0:8cd:80f1:f460 with SMTP id af79cd13be357-8cdb5b20e52mr2244390885a.45.1773735644083;
        Tue, 17 Mar 2026 01:20:44 -0700 (PDT)
X-Received: by 2002:a05:620a:19a1:b0:8cd:80f1:f460 with SMTP id af79cd13be357-8cdb5b20e52mr2244387385a.45.1773735643531;
        Tue, 17 Mar 2026 01:20:43 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4856eae3037sm51077145e9.11.2026.03.17.01.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 01:20:42 -0700 (PDT)
Date: Tue, 17 Mar 2026 10:20:40 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/6] clk: imx: fracn-gppll: Add 333.333333 MHz support
Message-ID: <sd6iwi57nfv7whvlzlnl74wgel4ka6zs7mc2imafhtgpeail3r@dotylxqzpr62>
References: <20260313070740.585043-1-alexander.stein@ew.tq-group.com>
 <20260313070740.585043-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313070740.585043-2-alexander.stein@ew.tq-group.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA3MiBTYWx0ZWRfX/FJTry/6ckV2
 FRTbtnpsVJsyIJDkCWds5EG3p05md8g00Dna4VXFe+EKCdeJmzSOFbWoIhrhY5h1ePzIqvrUBfn
 Iw9zBl6vSyoXwHMLsBQl4BWMeNMod+Ozoy4Azl0t23bLlFulx0+40iSj3XeA5EXDY3Rl2bVPcB+
 /Ufy+d4y6yTZAfFcvtHGqVgps7mCP8OxGyOsByWRqQkfckBU2msp4jEUOWvtR2pM/dxjubptFSY
 jUKuXg+Hji+Qb4DSvTPdB+EVf9nAybbdypgmXLtOp6rSP4Aw4GSw9IBPEni7KiDeKl56eVl77TL
 LU74s4hy3ltVxjJxfGLgtLMn3XCr6dGjmzsl5T7ID5jjWpamx+W2eLN3zqN/rkMY1F3LJMUmLlr
 IfXPoEa3IUNTUPT9J8jIzXyleI1BhIH/VoX7+VTQr+LDbPjHOG3FY7FYWg56shprzmEGmbM7HM1
 lkyjt9tWBSb10EwLgqA==
X-Authority-Analysis: v=2.4 cv=D7pK6/Rj c=1 sm=1 tr=0 ts=69b90edd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=8f9FM25-AAAA:8 a=EUspDBNiAAAA:8 a=LywSNKSTaWSAk7vVM4cA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=uSNRK0Bqq4PXrUp6LDpb:22
X-Proofpoint-ORIG-GUID: u0lx5YcumaeHQwmMd-VTTMr00LxOMHAp
X-Proofpoint-GUID: u0lx5YcumaeHQwmMd-VTTMr00LxOMHAp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_012046_307349_19B423F0 
X-CRM114-Status: GOOD (  11.77  )
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

On 26-03-13 08:07:31, Alexander Stein wrote:
> Some parallel panels have a pixelclk of 33.30 MHz. Add support for
> 333.333333 MHz so a by 10 divider can be used to derive the exact pixelclk.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

