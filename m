Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D81CCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHjOKl7tCGgMI267yvUkwNuHMFDd9Df215mjICShWvs=; b=dNrkZH0X5vHi/cMziNqEmprwix
	UkUEjPgU/ggl2ZUW9oMH9BRUgOVBEDvNwyZyA2UAQa8YpuCVbM1Q9L/awTCv7HZTxKKqtv6I42r2a
	MhGDHok99RDOynd33p22X5EW+QkvVKp2zuA+NTGYqpsAyhMmodMU0/DCrMxyfcVOyspDTQq7Hua8C
	n/1dHHi/OEfJ04lozzfcqxYpd34KUM+ZMaJKljbYrg7w/BHhmbUiBcpDh8tuWxZzVtckBNV+Qrz+4
	LMQgQHjF43IVS5DZvJmnxGOdBj6DAedZYUKxl5/XZzxSychpt3TnqfqQHTy4+WnIbcMqCpQsiB5nd
	pBt+Rk7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzwT-00000007LlN-1Nyw;
	Thu, 21 May 2026 09:43:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPzwR-00000007Lkd-1qDs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:43:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L9A5er3343968
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 09:43:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YHjOKl7tCGgMI267yvUkwNuHMFDd9Df215mjICShWvs=; b=HkGoB+/LhXTFm1th
	UJ7ZAhEZdLQhzQM/sBK1KCihGwEl00WEPBbpUAxZNLknCpvugrv/tEcnusX2zrE2
	GMRhjsEEUYfpM82qgvcmm6IvwhYUXjCj4yb6fU71smD3q2Z0sJWp2uxCWewLLfzs
	JSz0HkRcrHlYr3M18+820ySJ1axXxsic6/HblwRSKi8pOszEAWh/hxR8iRvUGoxd
	/j4keSUb7mXX0kAp+MFHDl5aEu9RWy8oTs8cs/O1ZEGtmxHQLsZc5NOaZktTpxyc
	68736GR2TxsOh56bmgkgTB1xik8XNEBjXwEu14MZKtlVxiia7JPbn/T6bwbVnOKp
	7SHVxQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9wahrnr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 09:43:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8c183c2eso32143111cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 02:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779356626; x=1779961426; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YHjOKl7tCGgMI267yvUkwNuHMFDd9Df215mjICShWvs=;
        b=UzWBImfcRANk0ZcMdFrz5XiCb410gQ4joiFQQJcgvCIcOC8xXPHk3Gb6NdSVi5S2Gn
         7NmkluS6GPhC/BtB1lMZ7kMAcZcuqZXrwU1dZWhKG9S8Wu1uo/bNbYRu96ExazGZFn2k
         wPuvwy6Jcfo6dtlqZt+0vLF34YxfTE987e2bGW+o9yDcnpMunRabIC7wtnaLIHl7A3DQ
         ZiFu7FoX7qW3uc+aroVc09yi7Dfg9EmHYSHCCXNlAm4jHhFdtbftF29mPIl1dAQFFsu3
         bwA4xic3w4CVBYW+BtgdObQCmCgy5Ikq+lC5eBS8UIWJAiyC0hJpdsR3L/jdrVCjwjTh
         bamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779356626; x=1779961426;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHjOKl7tCGgMI267yvUkwNuHMFDd9Df215mjICShWvs=;
        b=iBIV/aWHPPrg5uWiKvsLYWWczN4SHax3E/TpLTFyyAcmmjx10LuHR4QjiGv0CIU+3/
         NJk9h/aLpWwXRAE41z8BmO+lHJoyuc1Mq2TVn/KYCZtzCw673gAmGjpg7b/6kDVf8A3I
         Y3m3nflVjcsaTtW59YBXOKtvU0vfmSJoWTT+b2+wTr/Y3yKzCV+9Z8JTY0VCOf6mjVMO
         /eBUyjTkQwdZoa114E/p74Dv3Bq02p2rCR0dU/3BBv+IkLdalMsaC5oxysulqaMqNaEd
         km+kbfjqxYBq5kFNJG50BpE/EgHyMHpNUDjW5yhlI8i9eGwgv9ZRzQHhAjG4lHTFBKV8
         lhHQ==
X-Forwarded-Encrypted: i=1; AFNElJ8BVzaIQb2EnfuEtlHcKDApP/QelCtWJChkfWU4EHOhDUfgdc/aGmSWRVnkZR1S+3jQzJW0Gn1mwHelIXC1Vc1Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxjwW/wkaNRF8jl8r6ydvxaoRvDLOnx4NA9VPvUxBplswJXY/OW
	94kxAs/OoK5CUEKfX35lEeomKYZN97WLo06iRVtGEKfIseXs+vAOoX3j05K86vwYhnGsF6n2Lve
	Ge6cStDZ5miMFLywc5fIhveZZ4y2Ju9AhdeIosLyRDhZx1q9mM7RvtyA6tuQQmBW5erIG5HD10/
	9Y9Q==
X-Gm-Gg: Acq92OGb1Fav7fjsLbfpDzTMEanwPsg/MJFnz+8MENA6BV/nXswnXN/05rIw/wqpgWq
	MXc4eg4UD/y5r1JuAFV1EygaHka8uaBm4k1voqHZ0wYY2pgTxtOyLr4YL8TxeI85N9aHWPgDCsh
	Uz0d/euAMMhSP6wpr9vetyiUPvfOm9XHAKrl5s6RCOa6z4hjwRACDiZx/js8aaOInkXSP1OOwHA
	e6bYQmyL7SKZXtRtnP4Q2CoUuIVs0PdTt98gyqlvo+snKHz+Q4es79nbW3ccqcPAA5vGMNnjX9h
	KW0sIi/yI9bLk8oHQgdjm7TFw+6XCUYy7ZZsuTLB0VsSviDSmLPb/Hyyhb8ebE1JjKl1tegmCQJ
	djUHwSlKXvoZP0K9ut1P40qwxzAnmQoMIehEgMPo/kyOyp/aEcxSTrnjjBY5/shTdgeVq3j7tSU
	3drFw=
X-Received: by 2002:ac8:5ccd:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-516c56d0badmr18732301cf.8.1779356625850;
        Thu, 21 May 2026 02:43:45 -0700 (PDT)
X-Received: by 2002:ac8:5ccd:0:b0:50b:3489:5495 with SMTP id d75a77b69052e-516c56d0badmr18732051cf.8.1779356625303;
        Thu, 21 May 2026 02:43:45 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc87e79e04sm23605166b.21.2026.05.21.02.43.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:43:44 -0700 (PDT)
Message-ID: <7ddd43eb-855f-435f-8f8c-5d1bf10bc31b@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:43:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] interconnect: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
 <20260515-interconnect-qcom-clean-arm64-v2-3-adeebc73596d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515-interconnect-qcom-clean-arm64-v2-3-adeebc73596d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5NiBTYWx0ZWRfX8+XxV4wbya22
 6PDcsCha6TdhcNhOY+tNBpA98lMo3FeA2rnEE14y7j3EPuUM/puTh7tFjWyKvA3JctVGqGhkhT3
 dok4ZqHthZ9BZ7xnNrq88BngwpphETZB/B2GD0jhurQ1g0L6x0Ie1QUtWCbiS8u3Y9gDr8UYO5y
 UOagLQiIhCJsnzHBhnb2jSJ50fh0e6yzUjp0+ekLANE/TQcKywaHRBOo5vPokpbd3ptGhWMRJcR
 IqWj0GYtmHEigr6BXnfCoGArj62KYK0Y02Ax9hjnOtpuM9yns+jn6UbtGBbizYBscRWb1yYDiyy
 lcG11Ob9XtWaqpvQlH/1YaioHeHZEfwR9adbO/b5wgjs1AHfDu3jYKTy5rtyn8g4bz1Y5za+Td/
 BegxSbIhDgNkx9IvwlQLr14uqgZCGcoAKUFm4Lf4CohtVtlFL2UJnA795MPdene3QQyuqHM7V9F
 GaefaDrU5ALuw1XCiLw==
X-Proofpoint-ORIG-GUID: wHYPXyg9YSA6hOJNblOJAWvHnqriM9Bo
X-Proofpoint-GUID: wHYPXyg9YSA6hOJNblOJAWvHnqriM9Bo
X-Authority-Analysis: v=2.4 cv=H8LrBeYi c=1 sm=1 tr=0 ts=6a0ed3d2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=N0nv3qFBaOOCOp0HD7oA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_024347_605265_EC182BA0 
X-CRM114-Status: GOOD (  13.52  )
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

On 5/15/26 2:11 PM, Krzysztof Kozlowski wrote:
> The interconnect drivers for Qualcomm SoC Network-on-Chip are covering a
> basic or fundamental SoC feature: bandwidth management between internal
> SoC blocks.  SoC can boot without these, but power management or
> performance will be affected.  These drivers do not represent any sort
> of buses visible to the board designers/configurators, thus they should
> be always enabled, regardless how SoC is used in the final board.
> 
> Kernel configuration should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

