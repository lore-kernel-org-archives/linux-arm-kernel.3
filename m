Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18D8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T/aFwVhqAGc0ZbZI9x0aiPx8X3rURaDkbGwWbnLHtE8=; b=sRuwdPfG5xPMmvfRiOgRAKx7Lz
	hN3nSA+fAYGtQB2nbbIO9ypuwpRll/8tSaf+TW4sKSmvNb99/sq1/QeqbEjEe/0Qe9IwrRyCaesyu
	HdTEXhjs57v/glrwQNC2/wVvXfcyJaGIORYS7mbyQhmm6C2ylXZdPZfDx7dK7PwCU1un/CYYGB9W4
	2FwudKFpdbMi3Lnl4fdXkJcHlLP61QvOmNl6k60rpBpfjHQmhc6OaYsswX6eFcTGfoOGlkstocnRR
	JVzq0zXghR24R4IBjRiHwOmiiCCOJUGMjAQ5B5SsKa/HceGaeKSQlbCHxkIGZ82XKJk+cuPNIeYrY
	kUWd7+Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1Md-0000000EVL3-29a7;
	Tue, 07 Jul 2026 08:41:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh1Ma-0000000EVKJ-0CiM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 08:41:09 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678Dkes3050568
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Jul 2026 08:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/aFwVhqAGc0ZbZI9x0aiPx8X3rURaDkbGwWbnLHtE8=; b=I2h4gFwU+DniJ4AS
	I91DXHqeGqDegN3b98/ME1S4lHUcHux6a+mV81sSLsHSjLylYglx2/w/5qDHd+ol
	HF0zsqAyi7+hb/q69X8Jpg00yWpQJmFWn2xYqWrnnb4jQ/caRQdTo2sBdnEvBOJx
	shzzooXfsKpgIZ3W7kYt7Qtg2YQ3tVOtVCSLNO7WTi0ogZqh1ZL0njIPq2Ekx28r
	tdo9WfgNDu94+IU3vy6pzlKrPRI+1NJd2NI7xOACyRDnXoZrO/Yn8LPq5xXfOkKq
	ISh1NjzAp8nhQsFyyHOMM+uajbYVla7wxSJNH+zLr8BfwxKHghtfp2CcT3wQ3Lrt
	CYw5eA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8w2u89cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 08:41:06 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc88e22f92so48859655ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 01:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783413665; x=1784018465; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/aFwVhqAGc0ZbZI9x0aiPx8X3rURaDkbGwWbnLHtE8=;
        b=VoFabYP6kiwnvBty6xEXG9Y7Bf2y3XCVt1CICFMHPkWOTKD/iaaCkVghHUkZp8Wxuc
         MBuGMJPxyS4GB8au3lZCGlvlfP0Y2O5+GgohIhXamydzifq2kp7Wko5sZUvnUOqVwJ7X
         Ua5g2BQIFCW2aHDhSyNYvR75ME338yc5AE9ZHZfH5d+3Hjb8bf36r2CxukAS5mp3N6Tc
         01D+/Wl7fdjAYHZCP0gGOkooh5ft9jTIotyq1qSx1mqxT+EpIkCoND6PfdkEJHJJ5e7S
         cgLFR5+WC0a1T2/fjSuyjgbVRHojaaHkh4NVj3WxMaq8v651fuyLwkYJrrRIauk5d1gC
         Jvpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783413665; x=1784018465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/aFwVhqAGc0ZbZI9x0aiPx8X3rURaDkbGwWbnLHtE8=;
        b=Ip0G8IjWUeXpiaoyfnEw7dwz0Pq4hxJzjmEv+x8WIWqvT9Z/NBgyibNhXWYi6tWNnR
         ty3EuNSveB1YG/voUsv/lvaq7mN+ERP6Y2uMwB9J+aBIOIsFlqvyHqWqkEMDC1J1kKvu
         TD7OlNAkzqiSonV2rEGcA41G4pBcThdhixP6rc0U9fsb6OLbIswzgjeImK1yzUq47VWL
         HQ1GDeEXHP3vqrutywHA0u0f+UvEt4LuGWcjVyhjOjaKMX5flragEdRfF2rLWDLtrLDo
         8BTkPhOAee0i1ll3IB6QNbzJnxwzlN1YFyhLAhkUMij8LZuawn9SWbusKZspsWaX7Ojc
         D97Q==
X-Forwarded-Encrypted: i=1; AHgh+Roys9rLewcxnC0tqNB5znYU/EYnfMoHxjdtNl/GWFxMabSvvnrl1oUkcO7/QeXUhGr60kEUx52C6ZnVjs81A9q0@lists.infradead.org
X-Gm-Message-State: AOJu0YyGYj1NMo06ydfMYl0peX5EdyQylG3N8zxzBf5Dt4/B4q/ZQANH
	pkRnww0xm0iRj0euJjpvr4DoNMU2t/QzGrKjFY8WzuDQQWdeTJxiv9U5iU//RN5BkBhkTkS8+hD
	iYcTVqR83qgDPp2HBb8VSEAJeLSsVWHTKOyEi0Bvk8NlOyqN0gKRzqt34l6a+bAHPwF/tb2Aykw
	SczQ==
X-Gm-Gg: AfdE7cmHo7GF3PFyRiecos1csqW7vPJVkr75GPLTGtGZpYZvCNN8e9J8ZjXPTlu45Ga
	dL9rXnzuezGcZp4MgXtUrQ4ik6sUrNyi/P7wxiZhrVDBrGW0jri1+Kj5USKRubqcfm47wcSz/a+
	ZPqca4R/lKJV8EiuaaJgp6ihEroRFSad4V5O0NZRUQ35UgF0Sy79ptWZJ11b9AZZKMjF6ns1LTJ
	zkZq0CRsc94LCPfXRZgezoY6UuoBgOCQ1HQiGgIWRkIZL3asw9L0vYlt2i2i1D4AkfzM3MAzXPn
	zwqlEXoQrKu6EYBEkbeHM6arOs4sYaRXHpqlKEwxVR3Kw8c4WMv1wUYKtLfRig+JxRWHLB0VyH4
	yHqCLfYbdDAE1QtJMKnzpK9h5mSAtuQFBTuzf7uyCXg==
X-Received: by 2002:a17:90b:2e48:b0:384:8a11:33eb with SMTP id 98e67ed59e1d1-387575abe72mr4559415a91.24.1783413665178;
        Tue, 07 Jul 2026 01:41:05 -0700 (PDT)
X-Received: by 2002:a17:90b:2e48:b0:384:8a11:33eb with SMTP id 98e67ed59e1d1-387575abe72mr4559398a91.24.1783413664710;
        Tue, 07 Jul 2026 01:41:04 -0700 (PDT)
Received: from [10.218.50.222] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d1ad7974sm708702a91.12.2026.07.07.01.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 01:41:04 -0700 (PDT)
Message-ID: <447245d3-4e79-4645-a814-9dfc52fc5bf1@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 14:10:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] arm64: dts: qcom: shikra: Add GPU cooling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev
References: <20260707-shikra-gpu-v5-0-d2f373912d3f@oss.qualcomm.com>
 <20260707-shikra-gpu-v5-6-d2f373912d3f@oss.qualcomm.com>
 <cikq6wyljzdlyuopvxno7fipifzc7f2zc6hs2ligiu5esnljui@5mxhammibgpc>
Content-Language: en-US
From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
In-Reply-To: <cikq6wyljzdlyuopvxno7fipifzc7f2zc6hs2ligiu5esnljui@5mxhammibgpc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfX7qnE+Qxk5jzD
 /1ox/QBMkOyW4qujhpgY8YKuGJF+bOCuONO3Gp48QJVfLoE7gYo1Ip9l2bYUuhl4GVlKZtyb2zG
 iv1l0B8Ga6i6wF6rhQjIUtfxtaVitIw=
X-Proofpoint-GUID: _1YTLtdnstRy5FIRX5ziQ-eu4FWRmLHM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4MyBTYWx0ZWRfX1YT8CM7q9jJ2
 e2HL21ubzd3EG0mJShBHoCQi+dBrO4DmgMn52PR4yRhILgGnwyOOynm5fZUOGzrLhFHOKO1kepH
 7opyGfSH2LmMz23AK4J34XoKw0/rKX6vOe7RX9Drv1nPcIUGGGYTQRSnXPutxp8PtGOPYupFM9g
 5LuiZ7bIoAKFgTz+OuWcl9GO5Xfrvtl9P78JfW0SlufzhjczwLroD7g9+Yw9aXJncjeMwqIyjQd
 E2eOdiWeP+pga+CsxVWCUGA/EG2NtcdkxszImTToiHhgGEK9tUL15eKwhoiB2OvhNGudC+eJ/I6
 Olfb6RtSIKuOaxN0gV4ah78vRNaghJ9C10UHB21tBZfZ97GLe80C8uMIIJZuLYA/cU2a7d8sP8j
 jNleCbEjTfy1mEDIBtkv5qPHucUphBuE4P3kLka6lBhk4TiVQ8RdhOxxQlJ92t23teMhXxkoN1i
 i+65JFrFdzjLJeON50Q==
X-Proofpoint-ORIG-GUID: _1YTLtdnstRy5FIRX5ziQ-eu4FWRmLHM
X-Authority-Analysis: v=2.4 cv=bPQm5v+Z c=1 sm=1 tr=0 ts=6a4cbba2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=agT521uulj5WE4s-WisA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_014108_212099_C98A202F 
X-CRM114-Status: GOOD (  18.07  )
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



On 7/7/2026 2:58 AM, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 02:34:38AM +0530, Akhil P Oommen wrote:
>> From: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
>>
>> Unlike the CPU, the GPU does not throttle its speed automatically when it
>> reaches high temperatures.
>>
>> Set up GPU cooling by throttling the GPU speed when reaching 115°C. And
>> use a passive polling delay to ensure more than one "passive" thermal
>> point is considered when throttling the GPU thermal zones.
> 
> I'm not sure I can parse this sentence. How does polling delay affect
> number of thermal points to be considered?

Thanks for the review. The commit message was unclear, apologies.
Without passive_delay, the governor fires only on trip crossing interrupts.

Can we use something like below in commit message:
"Without passive_delay, the governor fires only on trip crossing
interrupts. Temperature stabilizing between two trips generates
no interrupt, so not all cooling levels are applied. Set
passive_delay to enable periodic polling to ensure all cooling
is applied."

> 
>>
>> Signed-off-by: Aastha Pandey <aastha.pandey@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/shikra.dtsi | 16 +++++++++++++++-
>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>
> 

-- 
Thanks & Regards,
Aastha Pandey


