Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA288EFCD70
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvNOJbFeM+aL7yxqK4J3Mnt9hg3UFgTdAbcvPH6KeV4=; b=JG9D5iPWit+i8gnEKwapO38ZlP
	uLqmn8zckazfOgJBV4SbS1U6AQMyG3sYSkUwxZG2WBiGBuTpZFILkCz7wgxWymI40avtPW/UtdyZF
	zjtOY58YyMkctXk5x8h1FHz2p6BX8l3Qaw50Ijq3gpOdyE3l0tbZpYvU9N56ZNKGNKMt73GpCvTde
	FRJt/RqjLrEIk4iDfQ4nlArL5y2i9RZw0OVIe75DotPR31uXBL+l7e9zecfoSc2mjDoxEd8YWLnMI
	97Coy1v/Xv12D7rrApmAoGK1PTqd8q/YNatLEj8G45434rvkDH2qqZtr0PB6IEbe3DRXpw6zXQYxQ
	RQ0tUNQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzX4r-00000006z7q-3LWC;
	Mon, 09 Mar 2026 09:39:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzX4o-00000006z5g-3t5I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:39:04 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298WHPM3773507
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 09:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FvNOJbFeM+aL7yxqK4J3Mnt9hg3UFgTdAbcvPH6KeV4=; b=CTXHV8yAFPcVejau
	NMbfyIFzsaNBaoSE6z3AWcaSUMk6/fggz8Uk7py9Sr5CeS2CILNRNEJxSLCxUU/l
	pVgaf68xLqNnfngNNCCAqLYXWctc23QlJphVwwxWN/JNZIzkNVdU2g3Iu6bBTNvH
	lrTyYpl3w3fsVHL2SWi2+KTppgmc88Th7+AIEihCECDOAOulTyyEHIpRoKh6uWJ/
	c1H5ufDY3nrSjEX6JL//3k/J/X7/jxa7Ekvlc0C+xvpGTRX1lT2d0lB5J4BUhYOp
	97Wh+ELyBrXWxZElYAOentEhysPmViV3RkldTGzJD5ed/LuRCkPFb/zolZbrBFcB
	GSWuAw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa88h9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:39:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7d66afceso922813985a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 02:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773049141; x=1773653941; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FvNOJbFeM+aL7yxqK4J3Mnt9hg3UFgTdAbcvPH6KeV4=;
        b=BQH4aL/C0Gdhexz6KQs1dkxkntt1kgDUVQdYgr1QGDbxw6y0KHkbVchcwzRHWOLBHL
         ocl+Z25iW1SfKsKqyMWbEhlyeCwUzDU18vwZQRKfG8RhEuxp2moxcFdovXOr8ikaQofa
         T8rLc1Mo6dJzUt7DhDTYaVKq0oqIwB67/GZdxSFU6ge3d4S7lNdIeOW+YuipOKsyTxL7
         5MFk6kuOdmGcCaCuu3zJcZsMgHVyuLvdnEuYHxNDa+3eZThiPvOLDLeTWLcRau21qn7N
         WenB4nFsM0+i4eV893RTDovcBaORiCzcxqGR10ldm6ICnaQIdFrvaS5TOXpMh7eSB1jN
         wzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049141; x=1773653941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FvNOJbFeM+aL7yxqK4J3Mnt9hg3UFgTdAbcvPH6KeV4=;
        b=rbyDbFGsyTPaAEGxyNsX5DWXFPq8OoGUZc6/JVLBQM7KLXBhgZDxCV12dq5/gf4rNw
         /iPQzoVxcfTYdHZGbtcQdhbl8GVXEI05X6TYNFHDIQUUdgyn+eteDc6+JK/D3BHSIZZN
         MudeDYYmmioiYH74ABw2/t50dE7YA+i6XvjJysoVbnWZXas1YvQM8momw1Jx4uiV+s6Z
         RrddxJ6+DwEHbv9cR5pDUjZ1L+uYsFAYMqjQTh/+HdI3E3ywiWXsF9r240bpLjVSHHEq
         Z6GvouVCDg+YS5gWl2gUWbO5RlcY/vGLXUXhC8Iz5xbfT/11tv28b4+OV0a2fRhD6RCx
         H0ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN2n21yzMHKgeWhu/yChvehZ1kWxisUnRO9rbom/tU8hK+LHiVs3sPWcxnV2mM7jKturs7TF+mFdZYl8wHWgnw@lists.infradead.org
X-Gm-Message-State: AOJu0YwWZemIsMkhqtXb5gtT05TqefQnOMgpNQXyaMykCYSib36Yb/3o
	xkzdIjgB8lUMYEuvp4qJ1sPA0iWVHnwDktN3FOyRQqsbwnmLhAp8YJ5Lv2AzusYtgtm26ONn5Nt
	SqWSPIm/oNor53qp5hAdMV2C71o1f7WpaOiNpd4lu1lPRd0i2gROjjQvhhbtPxVLPCjmH/7M6zu
	9YXg==
X-Gm-Gg: ATEYQzwN4NNt11EKCJWe6J+mx0ZvkYNWZ/Q9XitfT7mKV5vmZHw3Ewz6Gs7SuD3gcaR
	ls30CF77y36+YNbmOTDadZqThOjExl+VCUgLeOBMv3MHBbbTxfjY5q3R4CwhPNBv+UlzhLCAafh
	WBI705l6AGsocBuW6GWj77pr+4+sNYHKL9oVBMhDozPVLvP+Zli3ZZvY04uJDBEZ2zCmXKwloZ/
	qxRzmJOjZp2n0Kfj2jl04cDIONHqD/9Ca+7brEd23F6dK1XATwhGa/TKWwUFdZjQxkb1f6Y8lTg
	o9OxJn0XJYEkafnFFoKQQIGazjbaf7+wSl6n4XYvj+1KVeSy41CoyOu6Q4v98IMyCEJ53j4bXuX
	fmRH6vyipEq9ACqCzM40anZSoj/i5mwEyDACrU0cqhDRxrjx+RXP840f7VMyt5c6dxo8Nt2AfDp
	9B1KsLzcUO
X-Received: by 2002:a05:620a:25c7:b0:8b3:14dc:4821 with SMTP id af79cd13be357-8cd6d3403b5mr1301712585a.3.1773049141123;
        Mon, 09 Mar 2026 02:39:01 -0700 (PDT)
X-Received: by 2002:a05:620a:25c7:b0:8b3:14dc:4821 with SMTP id af79cd13be357-8cd6d3403b5mr1301710885a.3.1773049140631;
        Mon, 09 Mar 2026 02:39:00 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48534fa65a6sm77570025e9.2.2026.03.09.02.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 02:38:59 -0700 (PDT)
Message-ID: <019942a0-e9f2-45f1-8e04-26ecc9822705@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 10:38:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v4 3/4] clocksource/drivers/timer-mediatek:
 Convert timer-mediatek to a loadable module
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "tglx@kernel.org" <tglx@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
        "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
        "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
        "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
        "walter.chang@mediatek.com" <walter.chang@mediatek.com>,
        "jstultz@google.com" <jstultz@google.com>,
        "amergnat@baylibre.com" <amergnat@baylibre.com>,
        Aisheng Dong <aisheng.dong@nxp.com>, Jindong Yue <jindong.yue@nxp.com>,
        Xuegang Liu <xuegang.liu@nxp.com>,
        Greg Kroah-Hartman <gregkh@google.com>
References: <20260304081207.4030882-1-zhipeng.wang_1@nxp.com>
 <20260304081207.4030882-4-zhipeng.wang_1@nxp.com>
 <aaiByowtXrTxPsd7@mai.linaro.org>
 <AS8PR04MB84206CF559371D3966653F8EEB7AA@AS8PR04MB8420.eurprd04.prod.outlook.com>
 <6255aa0f-529c-41cb-be32-e5d54a839125@oss.qualcomm.com>
 <AS8PR04MB84209F4103D8D4FD495F5B26EB79A@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <AS8PR04MB84209F4103D8D4FD495F5B26EB79A@AS8PR04MB8420.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fXnQ0a-xp60qo81_yCZhPMxt15P6YLhd
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69ae9535 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=l2TV3C2-n_0iOSrWiQ0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA4OSBTYWx0ZWRfX+I9p95q2uvm0
 EcdV/83muHsp5u5dJe2MXYL6NbXWAZKw+kSZ3asthJ7YqvuDdPmGlVeZWry/HcDR9DGD8qzFkPr
 NeUE8lcWbJPW9ok5BikXhcJhNm1Tx60IxFseBwTyV31nnXAuinDoFb21tYyeu8dtDJaBqMdVpgf
 gfYzuKiQUCVg3FFUOCY/+CDTN5cj/uWz/66h3sybpXdLsYvWPKmB9NBHHjkhfRwkqAGXq+3a4Tr
 reAYQ700xsooXX0ZR/zyFUwYHzMDXTiTMe46SN4ydltuxF6wisCJTSF7M/leqnRduUBuuX/va04
 9Z+Vyb+VsNiw7zUcFLseYvg0vrE+0z1xRlFG3l+ycRORBkRxI9qK4C2sARLwi/2d6/C3yjNVsCF
 eh6sO/fA/IOTa0cW0hVqIusOr2TGusaUB3IRMro/48LljuTntahIbyPxz2/KnbNk13Qbbrt55gJ
 B71FWArti1Qza2jUkBA==
X-Proofpoint-ORIG-GUID: fXnQ0a-xp60qo81_yCZhPMxt15P6YLhd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_023903_085128_97E81678 
X-CRM114-Status: GOOD (  16.64  )
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


Hi Zhipeng,

On 3/9/26 06:31, Zhipeng Wang wrote:
> Hello Daniel,
> 
> I'd be very happy to collaborate on this!

Great, let me see if I can cook a patch in the next days

> My availability: I can dedicate time to work on this over the next few weeks. I'm happy to help with:
>     - Testing the new macros with IMX timer drivers
>     - Converting existing drivers as examples
>     - Reviewing and testing patches
>     - Documentation

That's awesome, thanks

> My understanding is that, based on your RFC, we should use two macros — TIMER_OF_DECLARE_PDEV and TIMER_OF_DECLARE_PLATFORM_DRIVER.

Yes, but also sort out the existing TIMER_OF_DECLARE macro vs MODULE in 
order to prevent #ifdef MODULE in the drivers

A side note, as Trilok commented:

  - you should not do top post. Keep inline comments with the previous 
emails so we can have the context.

  - trim the emails when possible. IOW remove text not related with the 
discussion

  - use text mode with the mailer, not html or whatever

  - for more information refer to Documentation/process/email-clients.rst

Thanks for your help

   -- Daniel




