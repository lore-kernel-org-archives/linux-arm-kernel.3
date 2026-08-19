Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F118BC5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 10:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hK/xdAUlAIqYIFdhUyKGacY7N7OeAKbgLfKj8KG0cLk=; b=ogH4+Irxj+wLjeUg3pLMlJ9G2Q
	fc3CLF7S7eAx6aSW1hSNF5tGqZZHuNilM2Jw9aiFfPKAygNFgydz/LQOABSmUn1TZusXLCtAGV61+
	OJZpZHXOuEqVotl4zli4S+oPsZwab2T9milMBNBq1qgHnKJH+1Z5Ai5MXReNDke/71w4idKfybej1
	Tx8rt9Glzdd3aiTE22h2dp+w67eIFo2RTmSK6AaToGfNrDgc1DTMXXjgZCmE8nguq/tZZP7wBPvu2
	2csO2fHeKNukBN2PfGkEAfnCQGTJfoyIoYyC7sGgTOP2bqW+cxAb3FA3GCMmQ9s4jIfAR8DWSLlB8
	JgPvNHCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdpT-00000009aGa-2274;
	Wed, 19 Aug 2026 10:47:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdpR-00000009aGC-2bSy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 10:47:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JA7xHh3983908
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 10:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hK/xdAUlAIqYIFdhUyKGacY7N7OeAKbgLfKj8KG0cLk=; b=Iw84kX2TmvvmjdLs
	1F0oqU0yrS/WAieHY1cHYmFOdGOSqSh3qVRb/yRQ5n2YrcpK5CnS8n6QNcTjvspM
	Oxn6GrqBl9XRaV2q+NTwDwcOVQTm9lw4zcU6GAE8qPsqmS3WIeRt3I7oN/IOaks/
	BbqMMPXkI5N7+/DrCTIBxF8m3z/9qvg/fPWr8g4i8jtSVrbJRZfdD9t6tYSzHyoC
	qIhh0x09p3WbLr0rxc7r4zTUl7WJGJncmN3lq+xEILN48zprC4hfxwkswWVp4N1U
	silnBqcKoA9yYgWOu6HiO54Twz0RhdGj3VL/gQqexwNON2nQMukw5yia7h7oMYAT
	uXP5aw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjjubs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 10:47:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d57d17d6cso1887841cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 03:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787136448; x=1787741248; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hK/xdAUlAIqYIFdhUyKGacY7N7OeAKbgLfKj8KG0cLk=;
        b=EULSl1BG6k+La1U13JD6s9d0zxFgQHN6U89iuXu7DE0Yo6EB456w85PaVL0ZArGthv
         6z9UsNfMZ+U1sREdkDN0QwZK0PX3T964NGsijOAtPVZDh6T8lSd32NcwWhaRfCaAvTFI
         6V6DibyZM02BpG36xFzq6M1dz5CiGL2Uq87cltT/wU/31+b39uuDOQymuiylCxr8ts0J
         9nkKP1ESp87dJ9tU4iJyiLkd4ceObdB3z4jTEPA57wX3jhp5fKo28GAszmV2ORguRS1X
         wbyyHo2ue1I00XVpMllq87BSQ+ezheM57WTN4zr+11uKXT/UMXqgkS8b2X+vR83lbHY9
         Y2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787136448; x=1787741248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hK/xdAUlAIqYIFdhUyKGacY7N7OeAKbgLfKj8KG0cLk=;
        b=NliPIub+L0gYeYdfoo26Iy8xcSxw6TtsEsubI2+SxlM1CiVa5wVyFQydQW0/J/5Qwx
         8MfEceq85kWp5uPdzxTFbhISLrfDPtWFGFM+9Myb4IJExUQtjZkvL2caXyr9gB5nZYRS
         aPkRXIbr4d4cKYKOFLdWEi5T+Y8dV8Ed8+lopBej999M8uC0+P9UK+Kahef5IdY179tX
         7kT/lSuuBG0lIkx/aFjBgXvpXBZgJYcahFChtRaxGf4KCU5/Q/AtiQ2bFICZ+ilQrYhy
         L5QJ6y0xU6dU750mP7LY7pnRe6MTb0GVyN2klD5eHYf5lRBqpKtkiAJ7GnrUCilLbJaY
         n52g==
X-Forwarded-Encrypted: i=1; AHgh+RoebZZntOTSqwEzZjAAgtawr70BPu167rtTC7adVTx38NQZNhxQUayRaTa15Mxowv8RtX4c21p3Ssc7fFpzDMC8@lists.infradead.org
X-Gm-Message-State: AOJu0YwQdsyfE3S0OAYGybrEUN6IXFA3ryVkWr3R0Mlp5Jx0nD8bwJgs
	31BB2tXI9wa7/RM9N0wPl+Fk1eWvg/lQRzWIjAmsC3QOGiFj8vqMHdvP4egqiyOCg8v3Caz7sjz
	k+zwH4d++oon3VzDSySCUpLF1K3yuY3di0n5rdGGhLvypDThU5ygfu01Tcf6RwyNHKew77yi2fg
	m7+Q==
X-Gm-Gg: AR+sD11MrDfevSwQIuDmdIcNSRXkyI2Zu8t67kItaJlQ3H3+bdeoEPsDEcbPOrFAVjz
	jmd4epK9Cxi5KYYB5IsSK1+JTH2bwGtonySSvM8eczHJSI4Hzs7EYAZbyQbcX1ebizdL1w6anC+
	S48lZPnizJ1wTbMxjmeXc2LxD7WiqhWbgh/5W+Dkcsxq/nahyNJGecQpMN+FmPedMAqWBPJ/ko/
	Dqpa7b5XFw/69fMoWnB253YbvTmjmAIK7scTyLACMtSfnZBEFV2Oj8w8luura3QzyJZ/kxLBlkx
	h5X5t7s81OzwBikYDxmh4iXg8IbwM8yyDNg1YLYo1wFNfvxZ+STeFDZw0yZS6npILSn0+1sqoHX
	PhoiBNg4DjeanXwevOVSvJ+9n
X-Received: by 2002:ac8:5f06:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52dd61a0e2fmr23786271cf.5.1787136447702;
        Wed, 19 Aug 2026 03:47:27 -0700 (PDT)
X-Received: by 2002:ac8:5f06:0:b0:51c:10e9:ec47 with SMTP id d75a77b69052e-52dd61a0e2fmr23785981cf.5.1787136447287;
        Wed, 19 Aug 2026 03:47:27 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1780c9sm658119a12.28.2026.08.19.03.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 03:47:26 -0700 (PDT)
Message-ID: <3da25205-60d4-46f5-9efe-a97a5a6908f5@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 12:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Fix camera rivian PLL configuration settings
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260801-cam-rivian-pll-config-fix-v1-1-6918d58cd823@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260801-cam-rivian-pll-config-fix-v1-1-6918d58cd823@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4MyBTYWx0ZWRfX2dH3mHa7C+cn
 EM7/7W3+vI2gOjMdxQ9CeXVoJutGucpDxIE7pyRdlkz+VOLwyeAZeNDoGNT9n/J8Yq/6rqlhT2j
 rqubyIT1sHm+M82urpq6x+1a60rk6nx8pU7zQLMHewkEeZyENVkKJ0yBJvwzRpacHxYBdHdQ5+4
 BfiKd9Ls2RV/Th1j95ZsGVFlAdYUaCPu/JPYKBQqkWz9DtutAaV5X1yn1mCxOtez+O6xQclWiWP
 rjdfHyupzJ+SDOdwrjYgwveGTHLp5VvwOH8lhKRr4lylt2jSQPD4PFfgrJ3prNDY8N5NqiFsAKS
 9UG4dO+VzRItJcO/kG8KJMJdxPEYPeemt7KYICTrzSSZbpPiJBEhamhZIrYxOqX2tgva4ZjvuiT
 xdYC4cs+vzK3bkv8O8zUbMIOc7XCJgeOjcQPIgR6PUGNkDwTg4bI2pfRwciZ++8PHptXv3eTxVm
 jg2w6arbpWKT6Rsnqew==
X-Proofpoint-GUID: ggjHAwpWb69tI1aqNrYQtL0ZzTK6ymB2
X-Proofpoint-ORIG-GUID: ggjHAwpWb69tI1aqNrYQtL0ZzTK6ymB2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4MyBTYWx0ZWRfXxtG4DvNseGWG
 idM/OPyZT2g+B2v7xHYONZl8FFRf3oTuGLptNq2Oupy7iiXwOCQblKhbQ+tneVe7eF7ip2K/oiT
 c7SDKPhsg6QzloKWUqx12Gcz4UIgBs4=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a8589c0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=cfD7LCa2rqpQZjTi_hYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_034729_836257_4D8EEF45 
X-CRM114-Status: GOOD (  11.16  )
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

On 7/31/26 9:45 PM, Jagadeesh Kona wrote:
> clk_alpha_pll_write_config() in the PLL configure function skips writes
> to PLL registers when the configured value is 0. However, hardware
> requires USER_CTL_U and CONFIG_CTL_U2 to be explicitly programmed to 0
> for a few rivian PLLs.

Is the platform-specific, or requires for all rivian PLL instances?

Konrad

