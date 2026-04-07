Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB990FEEF25
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 11:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JuA3/x1S6HYosIQcTCsqEgUi5XC8HNDAlPK2rNrD76I=; b=QsvCEY5NOz6Mm0K1WsXbMzQonU
	0ifx5p03rkVMYBVR/MAzaKxqg8ctZ9tC8aRxLi2kPJk9oE2m7qseS7VBw0PA+CkgMSn5RtN3UF1UB
	ovk59KNi4riYcXnTMBWUm4GIhIRFazsVB59/XPOL2reypFvY3ewBGjRQS5mhC8VqdY53XVLGYNC4r
	jc2f4369bVlMlB1srUsylBcBZFqt0GwpN/L1LGi3EgsHNDWaoZ0OCS4ocCWBz3BEYLHQoo+ZPuXBk
	SX4InQP/iUFuiVzN41lgi/DVM5rUjY09oTDItHni79WuQwk0zVMRhfcVNkMBk+7oc6waY3TKQQ8OL
	+RaYsVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4Z6-00000006Mtt-01t2;
	Tue, 07 Apr 2026 11:25:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA4Z3-00000006MtY-17d2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 11:25:50 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376bFmL2549972
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 11:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JuA3/x1S6HYosIQcTCsqEgUi5XC8HNDAlPK2rNrD76I=; b=RH9N8BYxu/OoCdN5
	Zv7pjQeDLhWnl/+EWNBao3OErZ3jFXLuYAjY4WcpFECccorCchM2bNXs/mtxdz1s
	gK+on9zu3KOT15yfuDJ8Qn+napdG1BfhPPYoRzj0lNUIBkXZfwtMg83tf6AucTik
	YY+y2Db2Yn0zKOFj/8/y6ytdvOAes027AIFUCo+ddWSrce72uY4gnYa0v6URLo/j
	EAIxRiEp0aZS33P8OWDwEo8Ft01PeWYiy6ioI9ga8zUxQMb2LuNEVV2kAo8wDApb
	oQKvzEN3wF6zDPyh/KaAm3Sqyw7O+kA4pfO/DqoeBieyhXAixP9P49F5T5j0Emyt
	zkq44g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmreag72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 11:25:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8d59968444aso59933785a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 04:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775561147; x=1776165947; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JuA3/x1S6HYosIQcTCsqEgUi5XC8HNDAlPK2rNrD76I=;
        b=JTo+vfcWc86otXV6v7ryZV33sAyIaYZqw/uHdhQWtbDFzUiFeLMNWYa1QexjtY8F66
         YfkvX+Qn4JgW4f4XCIrglBVNVGL1u/fMTBQ1C+JsyDB7g1lPNGUG9mTn4GnytRuIbi+5
         /yl5tLBxOPx2LUT8AYzxZN6PsCbumnCUbCgHw4py224UjRCt32cHOyxFPIDGdLkqidoX
         hMVcGOs1+z7+4NW3YklTqwfWM4uvi/rCilHhcBdYi2RAF5FqQ0dSkLuRixj2S773pXHm
         vt43SE5ioe1/caZwDDxKI31UDUFCVOseIqRMgs5ZxCZ3EIQ6c2UUQvXjy0y7Qe0Vsay/
         bKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775561147; x=1776165947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuA3/x1S6HYosIQcTCsqEgUi5XC8HNDAlPK2rNrD76I=;
        b=THaAWsuz9A9VuVssGMgiAMx8l+R4vvd/JcNNRHp5jx1aswEw87iyu/mn1yrmelokRq
         908BR5VFBKaENq+UmxApqj5tWbNsswM5rPWUvFFYG8jssh1NOkuMdmPxTKAo3+G82iFS
         22M7AGGQ/xuOw6eSu8xxC4Ewt1e04A++WXxVKgPMWaqfizrMEON0JznCh3aoc6tIIBpQ
         9MFy7bSlyQs6ds9ok89U+M7KY6VpcyQ861NTxlr7kSnjte8Ree/XU3vTRWYlmnZbbqGs
         /GLfXvq8jZWUQXLLSM0qXAc3cklDR6yAo9BgH4fG6b7B4+/fepPpRDADGTVdP7NGFkGu
         HCBA==
X-Forwarded-Encrypted: i=1; AJvYcCVDnsjTCbdQgkCARyIaRYWADMpZPG3Mq+VZND8ZKlzCmDA9s5hwExU/KoexOTReM1IQEFJsxw16oJN8HThXDRnL@lists.infradead.org
X-Gm-Message-State: AOJu0YxjKL39twSAYrC0QAEKtTJmiYAfcqjfPlkG/EYwPmbVrxQMBrKn
	Gco4WNITeU3h2FNqevSCce/fj6zZkmWzFsPO/2MBMsoAz96ODjhdJ3OBn/ezECBTmrw0qKaHmr7
	YzjrB4P6amlfGrUoWb1L+2XD6soFYagWHGsOm2vx2/pSuWj7kX/Jm74b40nPsxTRFnG7YnEumWM
	k1QQ==
X-Gm-Gg: AeBDievflQ3ZOEYSQB7EkPDTslLLhS9y3jVmdFzy3NEfioAhAEpIAwsPgYc3xYg6LJu
	3ZOaoakKK1y6kcI9eK+iDFGeOJ+aSmJusq2xNNEEaoLc9x6h1tLFaDgQ92xNLxVPzMdPpIV/Dfc
	rUbL/TW8dOCtZvq9Ph3zzv/LxIhr53nQlYvKKIsIUFrgFhs1DtK5eRZ6Igl6hDQO/JDndISqjUM
	zyRdL+Var+S9cimICcK7tZcW6RRJt0ulumysJnm7mcujCPUDkXu5Y0GPHq/9JX7IMIGyu7e8aRr
	LKko9NTJ0dJypb4M9FHtGJuFVv3EZlNNgaRnQk8ImjYqcdEZxKjFhLZXtwp+I8mfjajw7qy1p5J
	1hdOZ1locd1ewckfzZAuXgPX4u8G5BOMRchWcvPCNXcywS8BpBZbssvelgU6mbwG5LC558diXBn
	pifVc=
X-Received: by 2002:a05:620a:489b:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8d41b2e38bbmr1773618485a.5.1775561147584;
        Tue, 07 Apr 2026 04:25:47 -0700 (PDT)
X-Received: by 2002:a05:620a:489b:b0:8c6:e2a7:ad1c with SMTP id af79cd13be357-8d41b2e38bbmr1773615985a.5.1775561147051;
        Tue, 07 Apr 2026 04:25:47 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a74e8sm4218517a12.16.2026.04.07.04.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 04:25:46 -0700 (PDT)
Message-ID: <fc1fce6f-b37e-4d69-9121-dcf8df9740f5@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 13:25:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: lemans-ride: Enable mdss1
 display Port
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com
References: <20260402095003.3758176-1-quic_mkuntuma@quicinc.com>
 <20260402095003.3758176-3-quic_mkuntuma@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260402095003.3758176-3-quic_mkuntuma@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OKEXGyaB c=1 sm=1 tr=0 ts=69d4e9bc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XQLX8yjaJUNYVVxXu1AA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: f2kGzTEA0_Eqyj6tTA-MEGAhzfU_uhXd
X-Proofpoint-ORIG-GUID: f2kGzTEA0_Eqyj6tTA-MEGAhzfU_uhXd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEwNyBTYWx0ZWRfX+69d4Zkg1aJB
 rwLb6neBmPb6q/zV/kcEZrYAPo01My/qaOA8D64FyLmP/KySntO4ovFAz7anQrVFr1tf9Agy3aw
 24Uvw8CINeQGuBuXP47JBgoJvDj7lyyYJQiHvH1V8m75brrDbdn3FKgBondWs5JL881nTBBwJJs
 5O+msQENDDttLwqVjbo+UTG7ezc10rZGaPqvlCEfAdAJSBgL7AZASujfUq1PTS8ac7J6iDs8v5h
 D9aTFBxUOfJBkWr5Wqf0UpJGDrLQzGsqSjsO8nlBwYx+W7JKtVe8lkNh16G2buIPhmbZaQ+kZ8c
 x2+HBZfmmkwmfZ1IPYMWL6DY987nyyxSROeA1e1e6ZGq7pZLZvqDyiB5XFppQg04SwTPyXAlYsu
 GUpIN6Y53wbtAUIzUFvRm7d3UI+dqFRpsCtuwHfzc2HXchKSLUI5eWoaSC/BKQezBpHXo4rZdvq
 hyqRABTSZk0sd6QL1jA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_042549_397553_D3941F16 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

On 4/2/26 11:50 AM, Mani Chandana Ballary Kuntumalla wrote:
> This change enables DP controllers, DPTX0 and DPTX1 alongside
> their corresponding PHYs of mdss1 which corresponds to edp2
> and edp3.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

