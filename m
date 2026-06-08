Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DA6CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 17:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xT/zeOS72re4T4ULchYM4x9R2PdBDBD0TzXisULHajY=; b=LnqUynz3oeleNfswnQIjQvZrpu
	aCmrXV/WeYzFuUVj1Y3dNfdhXFGfAcUeB173CLjxm5QwIjAVXphcUzrZPKDB6EHha+l0Pt7B8S0Po
	BJ/EPUiFHtHZQI1NKwfj8EgJPYxTGDuxHIK8aJJUAkc+lcFlSWEi+mROfP/EqzTo96znD5Ivi3aTd
	qesE4A5AdYudZ+ApJuv+D7T8NErOn/jziSQnrLY9vGf42i36VNiuuwwDoBdhunwf2WuJx9q8iXzCe
	FFKAXa2elErz5vBnKxKxshtuOtpwqMGg0SRhtQeyYn+xy4nDJko+CFvMtRqfniIfhoQUDziGCplOS
	d7vXK0Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdR2-000000049DE-3IKs;
	Mon, 08 Jun 2026 17:06:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdR1-000000049Cs-0kde
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 17:06:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658FFRMQ3934196
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Jun 2026 17:06:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xT/zeOS72re4T4ULchYM4x9R2PdBDBD0TzXisULHajY=; b=MJszQfAHl0sGcgJU
	kW6ZGOW+B/2VIe/kmbP2p76IgtjV1sfutjgnwmirgEIYITZUQRxlGl7gXA4B/05V
	PQJ2bi1dwIsuiUAMdLtvBFnXOWIMCi/JzqAqtq63+xG9mt/d/va4xTZYxWZyoqAc
	tRn52mbPO/W2ff7zWgn2c45pf5Jq26u0j8HK4dF855RAvtw7f59tyZJ9pF1YFwJ6
	Dc7QZ77AvJR7egVufXSkE0tDn3qwOlBfmqeI/ASrN6Q+1+ySYLze+ovld9k0ygrV
	4t/Ua+i1qHOpKYuZxx9aLdy64+ZZid4NgcOWymdqNs3YNe9BgSS9qOUPGN+QpO5d
	Psdo0w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enx2rsb6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 17:06:46 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59bf1a43cd9so10756073e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 10:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780938405; x=1781543205; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xT/zeOS72re4T4ULchYM4x9R2PdBDBD0TzXisULHajY=;
        b=T/m6axbyomrFupwFZWSVgfLkfu3vT90Yxw/9xzNCUT60zoQExoYgtDUiX5pEU7/lgA
         Jrd9TKHF8kxz8IafY8A+mlkF1wVDUsQjBOta7PNb6SK2xhZ4YmMJMOrK0Yc2DuVUAZ/O
         KNR2acCWvNEBvlE819YSHfqdAj27bWONFGizMn1P8beBJZ7lnDFt8A3/6RtpTxxYejlC
         Iihi3BeqCddErumpIu/SYSA9CqsdOvm6An+7b+8egYkYWjkZs6/+g6Lc17tzMxtOwD8Y
         re6GdipJf7Ibe1IJN8EmSvQ3it5TH8+aFqcHms36AlTpZwJ/htwjKHsGg6Ziwd9vLNGc
         vCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780938405; x=1781543205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xT/zeOS72re4T4ULchYM4x9R2PdBDBD0TzXisULHajY=;
        b=GKQjYdJx2ugRmChTEDgRGePF9OclIMY52sSC/hr52HGMk3LDyflnDA13aDOJqnrZCh
         plzGwG4T0nrD1veOUK3DKA1qOMjYSGptj1H+HmBznV0qwVugGgxgrenOlf1VLS8AtnqX
         wYQOQV/d0qDghTYKbY6p2iPGvcx88slsaXmul4ZlWkrlFwvmpqn8UlBs82xgOY81Vlor
         xfHqURRMKO8+jdzKxdMjsYK+kMs78I4TZYknM+WHoKxN5oqGBB+7680WWlw7bY8hGMrT
         W56/HKWVj1+cutgCw7M3CS1Eo3pZdrSaNwPDZTqye9YFEoHakqmNsqMw4n2npjnecEGr
         maNg==
X-Forwarded-Encrypted: i=1; AFNElJ+dhLf2yU6MfV64iftuXIQYajRypVrNXJxJb9hcLE5hGGMziU24DKFxbxRr3lkRdAP5GBI/SNqMBsgxYkjoOGMi@lists.infradead.org
X-Gm-Message-State: AOJu0YzKJbrWXIjmBc37uJyk994TeoOCLcJhF5yn/DPlcYWrcWd2BOEX
	QPcOaBdW3RqWeXy1PSfAzd/fkox+WybkMARRoU2S7OS7+ZlN5hZ3I0W/A6ffERroLjyZ9kiMV90
	ck3lRMSJXhkDQrRqregS5+jw7NTIsBW1WpeYlZHHkyQXcDRo0vKoEkNBniegoEfzj+6XV4yWJSB
	52Ag==
X-Gm-Gg: Acq92OHuwwSgPvxcvJeYqVOziFWNGcJdR7YgwQQTb0Vrt7XN1zafWMF3lAsspK9yeb/
	IfxJbsRLbR8Z9TWKmKObVP2PmErPAS2mcwQVViO0N9ugdMlpV8LgK2XBWYPyngPu2aH7wdnxJ5r
	tAiZOgt3HEkEBxN8CxCWAupKWXWONKqJUkeMWzH9DYlZ87ZCtKFFYD/rpLjggnHAuZMikX0DPhM
	cogKZtn6mhFqLP6g+liwvrJgh8P4jF39Zpxza5okuBIpMH5LWa0fcQn9KwI93sUSC7PQOI+lVDS
	CDNGGMTpAikJMqskQAPheoB2xxKd/UjLzqFHUvp957ZrWezJ/Q2Dcv7jgAadhm4xR6OGVtGnpZ0
	D2Uhwyvy0dk31FvnSbLJkj7GY+Xjvs6/RYKllcw91BOQEu4sC9LkwizdUvvoNay8F6E1jIGolxx
	35IeUWI7LJrSiNBWgE6NQ=
X-Received: by 2002:a05:6122:c94:b0:59a:7b23:16f5 with SMTP id 71dfb90a1353d-5acd5cf1c67mr5070397e0c.1.1780938405351;
        Mon, 08 Jun 2026 10:06:45 -0700 (PDT)
X-Received: by 2002:a05:6122:c94:b0:59a:7b23:16f5 with SMTP id 71dfb90a1353d-5acd5cf1c67mr5070375e0c.1.1780938404904;
        Mon, 08 Jun 2026 10:06:44 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:2c9a:9b81:ddb8:1d14? ([2a05:6e02:1041:c10:2c9a:9b81:ddb8:1d14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc413adbsm411951625e9.15.2026.06.08.10.06.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 10:06:44 -0700 (PDT)
Message-ID: <256c182e-a093-4bf5-a353-ca5c06eff489@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 19:06:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] firmware: arm_scmi: Add bus support for
 autoloading
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, guomin_chen@sina.com,
        linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
        quic_xinqzhan@quicinc.com, sudeep.holla@arm.com
References: <Z6CNWOp8B_ghIrJt@pluto>
 <20250203100154.140877-1-cristian.marussi@arm.com>
 <20250203100154.140877-2-cristian.marussi@arm.com>
 <aibW10NMmzw3QnZ5@mai.linaro.org> <aibzLcZiVwtUHAgV@pluto>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <aibzLcZiVwtUHAgV@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VWIIK5UpO6qjTV_TYB_IXTLPSSVmQxkd
X-Proofpoint-ORIG-GUID: VWIIK5UpO6qjTV_TYB_IXTLPSSVmQxkd
X-Authority-Analysis: v=2.4 cv=JdqMa0KV c=1 sm=1 tr=0 ts=6a26f6a6 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=7CQSdrXTAAAA:8
 a=SzbdiQ1KgPcw3MfRos4A:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE2MiBTYWx0ZWRfX5rUNRqGXc50p
 Ch1X063YsseBPMxUkFs/3/vmCOh86jrp/YKNNjWjS/GQA+gX168opsRCHfolavTbU7PjXguaCde
 fr8fxSKYQsa4Tiplpyoyow7F4cIgyleCJ+tA/8r1nupdad9rQMrbAZ4T80EsK4XcZ9aLLfccqXg
 nwmLFl+roiuu/yupfzVRFYtIzWG07dd+LCLbwEc2BAw8/RkT2Bn3hlcBLHGnyQMHHOGOXEYplCo
 EZbAkhBn6Jb6emr2zxkHsJHhm733Mv0+L36iwaRBw5Fy3o0AOV7DgBv3I8ah6a1dK9Ch9RfP1b7
 LCOAD8MlJdVltUV1tPAZ1upMOF87g8wKoQn/ofAJ6PAjNBZwIqwCcbrAA8g0/sZKcrhJilkxQHg
 xGanMnWYv+lDdALZvtvkXgpv48ml2lgvLIGEaC1kMKH4kg8oP5y1Lae5rabiao0YSw/W5+upPz1
 +gg2NgPqKgs5bGNLRFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_100647_341087_75ABFE9F 
X-CRM114-Status: GOOD (  23.17  )
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


Hi Cristian,

thanks for your answer

On 6/8/26 18:51, Cristian Marussi wrote:
> On Mon, Jun 08, 2026 at 04:51:03PM +0200, Daniel Lezcano wrote:
>> On Mon, Feb 03, 2025 at 10:01:54AM +0000, Cristian Marussi wrote:
>>> Emit proper MODALIAS uevents when SCMI devices are created and make sure
>>> all the standard protocol devices are requested when the bus is
>>> initialized.
>>>
>>> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
>>> ---
>>
>> Hi Cristian,
>>
> 
> Hi Daniel,
> 
> nice to hear from you in the SCMI land :P
> 
>> what is the status of this patch ?
> 
> ....I'd say forgotten/abandoned...I worked on that a bit when I realized
> only part of the stack was autoloaded...then it did NOT received much
> love and then I forgot it....buried by other prios....
> 
> Indeed I have still the local branch...but after a quick check I think
> is the same as the RFC posted.
> 
> bbd14b0f7733 firmware: arm_scmi: Add bus support for autoloading
> 8d982393b505 firmware: arm_scmi: Generate aliases for SCMI modules
> 383c127faa97 (scmi_vendors_autoload_V2) firmware: arm_scmi: Add aliases to transport modules
> 00caa894bce2 firmware: arm_scmi: Add module aliases to i.MX vendor protocols
> d900620c46bb firmware: arm_scmi: Support vendor protocol modules autoloading
> 4fe57bbeb6dc firmware: arm_scmi: Allow transport properties for multiple instances
> ad236e5a7f01 Linux 6.13-rc1
> 
> ...where scmi_vendors_autoload_V2 is merged already...

Actually, I'm puzzled.

On our platform, until 7.1-rc1 we had to add a modprobe.d script to load 
the scmi_cpufreq driver because autoload was not suppported.

Now (7.1-rc1) it seems to be automatically loaded.

I imagined the autoload module has been added between 7.0 and 7.1, but 
the series you are mentioning is from 6.13.

What I am missing ?

