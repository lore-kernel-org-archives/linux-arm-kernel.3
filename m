Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1795ACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 17:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIxIK0Wuilz+yl4PP/k27Iy80ZOIVvKw4mIo1azk82c=; b=yul8R5JB6jgFgA7Mx8C/G6KXtS
	Wl4dz9oRDt2atb8EK7TgccEVEJdHHwZ68hvED3UM/Va3x62DLDzeqnOsVStomKn8n2NhydD9hL+xV
	i7okHF53qYd24fW9uid8hLKRVkfNJUd27Oq9dtTMIHs3cOtwrJwSbF0PTUNYfY7+UddhhC2ar4C1t
	r360YiGMjPTr9/pJIuYCVOVDNUN+ulGYFnA9EMpjj05uG1U4dbjBrDGUOO14K0zx53HuYJ+7+9Sze
	Hsy5BV9ghfMbht9bIDGNLZxpvcFBXm9b4Ugen2ywfHP0wDuQd8clJu4H/jj3RxHvnGSCoQ1LhhILN
	uujgV15A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2D8-0000000GS56-3VmM;
	Mon, 18 May 2026 17:57:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2D5-0000000GS4O-3yCn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 17:57:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IE30lh353007
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 17:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MIxIK0Wuilz+yl4PP/k27Iy80ZOIVvKw4mIo1azk82c=; b=pz/vDsbVtXDpaDLA
	RXb0yTPq+pa4kGzKlQgwRXaYiAwcvn1BL+ftJhNufpHGwfK4yh3SnxPA9dIpCmVr
	sknNhlY70m295zXJCEciJNfiZs4/DxxLciyh35IHH+ytoGbFfwAaLy5BwgCUbb+0
	kdZ8jagWJIx9rYTtbBBegG5gHkfs5PLGyt/wuP7kXluURzFbTn+beeLeB8jQ0ZAI
	hpeiDXtFcRoQquLguHhijUX4iTgG72Kf0L6h3+GxcSAchtwHMNNNbNjJjGLVTPxy
	NGbgoWHM7mdwrJo9MYyRG1Fnc5dW8J+6S/RjlCpI1XAygnQl/cqro8IiW0L+VWrw
	A6HXJA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xjajf5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 17:56:58 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514cbe73d00so91458551cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 10:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779127017; x=1779731817; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MIxIK0Wuilz+yl4PP/k27Iy80ZOIVvKw4mIo1azk82c=;
        b=JBSr09VCcOhcWSsTU1MzcHW4uMH/wNExndCOuwK/0/E/J9yFUBptOU/lv/2DcqPDbt
         m2dpLhaHh7uhH2jWvB8n3yFHh4sujwlEzYaK8PSeRbBFj+AClSNZ5/pn8b6DxH7K8tBZ
         INCADUhqiOLkuqnLUj0q3Tfh6pEyI2GCDpZ+7TEVOrpzkKMpJasnZdgpGDDIaORnTGic
         Mz6jBzkIGvkCqyyNV4DMP+iYnNgh9Ey41JpWy6TB811frq79Ft9fVach5bLEDARRs9hQ
         7XATaBgU9CoPf9ZiL9iSnAUd2UADxZva0Aiv23tWyVEbKC0+I7YTk1HtoYFYyxu/C8ZU
         zVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779127017; x=1779731817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIxIK0Wuilz+yl4PP/k27Iy80ZOIVvKw4mIo1azk82c=;
        b=DE2wl3xwrct4ZZ96xUc66OQAOGZtAfyu2LN1M+2GH9T0ecNxbimXUiDhlZx4tEJ4Jz
         fTkzuI9Di8WduxqX6zNaED4lKJTwf37oN2sFEO16h9LtUOXzBhqGYlF2AeCNkugB8TVJ
         VpgSZgsXyUWIJki6Est/SG/M0Ap4CBNj7slNHTEjoODzK8fNik8AaHOKSUsys1t8y2FO
         yspuHqHVWTUZGqz+a3dNOIE5fkxN/v9I0FWlxA9Nv7ty3PDRuv0dmqOuc2Wu33Uqq7mw
         3rRwa24juCDSuiAgSdCjhZeYE8w4X3MMZkb0x5olP022IOgvx0E+bcwXuR9GUkZbjNBj
         chBg==
X-Forwarded-Encrypted: i=1; AFNElJ+n5w5WtPKNF4WMlAKuJA08k1DxxssnjLKTza4OpTmzFssz/4O0paSdHCCH2HjRsOOKZMRuSJAMm6GUjD0OPe9t@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdo1zaM9n8MK2vwJ65aDbNEBv2vTjpPP6WysNXo3mWkxIkBySl
	p5oGt3tN2twsu9KJOdRlpuu0x3g6iOnCYyESAQq2e6vY7UDykaes5x3hRDZnHvTgdH/2vSw/9mA
	FTVW79YxQpctD/tWlelTqal+2FQaf21mldpmzvZZLbz/PE+WcSjP5XCCFwBv5i6bRRbNitG6H+N
	onEg==
X-Gm-Gg: Acq92OFTB2jT1Ario7L6y58WdEtgryaJmu34BFaNY/9kHXV5FcEXQFn2iNBzevzMK56
	G256JaCuRZY3YnZdXWmM6rUm0NvdUiiQvib4d/BehNa5XstbQZ9lxyjA7Rz/EL3Evf9HbePQHwc
	ztaj2BE5dtKfM+a6du6v4nVPLAe/OjxwdxxLMuvMWTU7o3S1agRmcBtK7ENLQn0X/PiAYqdcU/G
	iYAIvqK1mqLmYPHJL15aDA7UzLE4DT0Q6dLtkclB/1UFWAvvmVDfmDSjTlFc7id0sOJ2hSh2i2n
	MSSw3LcRJ2bR/pT1U1JIEAhO0474bD2KKTMjurC/lln8QzHXKgP87LFeCFmW3GLVgDhWtTB+1Qa
	YFc0sp1WPdyjM+G3dD6Mp+iyRg5ZQaJFbGaBwtUDflBjKPhihvNK+F8bNQvKKXwnOFFML4yUVhL
	GQBLcOHS/g
X-Received: by 2002:ac8:7f53:0:b0:50f:ae44:515b with SMTP id d75a77b69052e-5165a0df71dmr223765141cf.37.1779127017469;
        Mon, 18 May 2026 10:56:57 -0700 (PDT)
X-Received: by 2002:ac8:7f53:0:b0:50f:ae44:515b with SMTP id d75a77b69052e-5165a0df71dmr223764831cf.37.1779127017114;
        Mon, 18 May 2026 10:56:57 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:e390:12f5:ed3c:ffd9? ([2a05:6e02:1041:c10:e390:12f5:ed3c:ffd9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5ab527asm299815105e9.11.2026.05.18.10.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 10:56:56 -0700 (PDT)
Message-ID: <1155ed3f-12d2-4a98-bbae-b3dc61846e75@oss.qualcomm.com>
Date: Mon, 18 May 2026 19:56:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: imx: do not split quoted string across lines
To: Mayur Kumar <kmayur809@gmail.com>, rafael@kernel.org,
        daniel.lezcano@kernel.org, Frank.Li@nxp.com, s.hauer@pengutronix.de,
        rui.zhang@intel.com, lukasz.luba@arm.com, festevam@gmail.com
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
References: <20260511174255.215207-1-kmayur809@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260511174255.215207-1-kmayur809@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE3NyBTYWx0ZWRfX6n3XYimJ6YJz
 H9MSrxn1KcBsEv0EZBS849SPiQvg80LEqKe4aQ5GQeHw3RsVA7VnlVC3ANH5B540adoQ07HSa/f
 PLCTmg5aGYz8GHg+0zCBW+QQKm9LT1DGVdvxTInFfR1mXcfFkIQ1uKHr4xkB45LMqo3S7+em5L4
 twFiMkzQdL9A+0dYAFBq+mfYf+Tg69R7Dl8KcRBbKrEOJnSjOSTlfy4B2vXKj+/cq6XIgs/BHa7
 w2xdy7F07pESrzfG2sTn8FdQbENjTc7AImSrCYhZ2yQ2j0brO+gILLBNbRZZvbyXLA86BocfXRS
 3yhA27HMS+7GZ2bv4wOWhVWKUxqgKJY3nenDjgm93XppPM/923s2E/IyHiE50sxGFvIqIs2X+qV
 fg+X6QqyeC84wcO68qltjg5zZ3FW3vrhKFT/4YNqvVQukFIxXGDacZToo7lJAJ+SQlagAwQPbYz
 eGGLZk+xReQNhSWV9/A==
X-Authority-Analysis: v=2.4 cv=BYHoFLt2 c=1 sm=1 tr=0 ts=6a0b52ea cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=fjfue5pgiGPxETPXDXYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: IPN2SLJsxmD20mr5u5wqJ5iUpb_S1SJT
X-Proofpoint-GUID: IPN2SLJsxmD20mr5u5wqJ5iUpb_S1SJT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_105700_105253_A4C7E848 
X-CRM114-Status: GOOD (  10.48  )
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

On 5/11/26 19:42, Mayur Kumar wrote:
> The checkpatch tool warns against splitting quoted strings across
> multiple lines. Join the dev_info message into a single line to
> improve the ability to grep for the message in the source.
> 
> Signed-off-by: Mayur Kumar <kmayur809@gmail.com>
> ---

Applied, thanks


