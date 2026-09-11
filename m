Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F71C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 17:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GIg8Ee17H8uLahuwZG6QIu9IwUSfphXuVEckTgzzbiI=; b=WmCJTluMajL2Z4UbhOsthoyO2j
	PvS2PlvWFrwm2sxDsclZ5cot7YMiirkG7IjXnN/tf2UCttU2PwNQ2Kw2DUoEqvl+GCwbl3+W8F2Sq
	yTgAN2IjGVXAxlhbVGy6CGIX+RFlC2JMA/Pvs2bvW7i77RC/kU7C0l0vhNnprgyQG0Lt85+kNETGE
	CDQyW9KaxNMRPHeC5rvFNhaA8E4Thr5TKKEps91mkAv/TltR4MHTjt4qIgHEt3LYn2qa4yBrIV4bU
	MM2GBZp6pVsUXKarVot8hYWNTHuJctEIXfVSECOYBvsYf0TrLC3devAb2eUcjWWoVuNvrExNs8Gtx
	mSPPvnMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54of-0000000HJEu-3n2p;
	Fri, 11 Sep 2026 17:13:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x54od-0000000HJE7-1zPa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 17:13:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmY1C3962494
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 17:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GIg8Ee17H8uLahuwZG6QIu9IwUSfphXuVEckTgzzbiI=; b=MbMJ043Qh3693KxM
	TC8kMQTkju8cjNkcgW0WulTHDisRDeS0zOWD/ntCNBIH//BMVQJLOwmHGnfrnVoQ
	we6dQdxk2dewXcF7hvbcGVMtcQyzu+7IrU7yfFFkhxWA0BLxT4RBARs93uNpWFfh
	psCq4Ciz7SXlC4Kr+yxAixZvt0u1AIbftjDKa5DNH2SU98Rg4Fie+fSyEIOIJZgb
	3nxRV46XfAERrERiZVDNEDd0G8cygfq6HCYuON8opaV5PrqvXD4d+sykhXziHZBG
	WqdZ3HZvPs5sCRC5KNok3cCunb/JVu5nUgZpOTrxivUvVl9vyeWKEIWYdqtnIIae
	RJeFIw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmfbbhw04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 17:13:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8632fdf67dfso1655571b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 10:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789146809; x=1789751609; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GIg8Ee17H8uLahuwZG6QIu9IwUSfphXuVEckTgzzbiI=;
        b=YdeTzv6kjYHr4uEqOuwxAtLS9thZItEDJwOUgQsPZHOB7yCZoNhYnSHgQLNSxlj/O7
         fvdYCymiumzYDzYg5BWmx3cgoZDOUYVypnqFlw5UKymzip2++4qwQ7TlZyocMv+BMxTY
         X9o24zxQ7ifdLZSmnsUL92cmUl0LKigcVpn7Psw3MKmAe/x8DWoTvSNSErUEAGVaew+O
         iWvjGqxSEJiUjPMj9MfarUv0CG2/RySjbR6oVdDkbbOL2KWUSZr9AWymgelaKltv1ZRX
         MPETPC05wtUhTlLcFexbniMp535AxnauIC9fVN33YacDi/SFRKczojNHv8cdZ0d3I0i5
         vzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789146809; x=1789751609;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIg8Ee17H8uLahuwZG6QIu9IwUSfphXuVEckTgzzbiI=;
        b=PVhWZxAY7ch5EKq+JiINodBPOSq28wi2GeYzss+zUbDQNO8BxHOnRNhu7IHhTPa54K
         M+qKXzGhxjRLGoA7VBVLBrOm7OkDK8y+sKuKc8chuKJ24hKvOat6km89ZeUPy0rxpdXe
         hHT4ulq3xLr5W+is6Uk8a0CDkDabFPGYrVwa52+pNyG4l87cLGR3RbwpAn4GiYAy+lpi
         J24fnackWORPuYRTIXrZGD8cML/CXrIIP1SfAv5EvrT1NWNENKBDK4Vx616+ccNGpVyO
         KmoBkHv+1b7iMCAhWjaFugjNoDxZ4OmNgQRipZVTHHzDkWLNsO180wNzDcocxc4Gw8k7
         Qo+g==
X-Forwarded-Encrypted: i=1; AKwUvBznO7mch5YDqvt+cwb1sqCO2FhOIv8ktL3WEVMFvjrug6ISoQ3GnjOoJ3V+2A9aETscJLFlV+zJ6VYjfbqYKZV3@lists.infradead.org
X-Gm-Message-State: AFuF++mJLOigLJIQ+w93jgym674vyKMmsZaidLze/gMVxrI95BcqMEcN
	XYEwVDc4VtJGND2DDP/Q4FKIlECLKThxJyAPEgqio/8iX2Fy+EKTYqe1imLCpy04BEdmI6wAPIH
	2LBt2ytVrNM62L9Eu8107/gSfzNEcMJCbITaBp4t75iZB+xk2zH9rZITuTkVzdpxcbsQhJgu7C0
	5lWA==
X-Gm-Gg: AYBFou11FapdDbfhQblJgsByOM+e+Y1sCRZj/AweWTk7DUIFbkIyy6fFyyocehfCOjJ
	3RzC1phl/KtdqDb3s+P7VlPGPBDG1wCA+Q6B0VMpNHbyFWslErP5FqOqgNTWtN+1XRgEfyPLr9a
	9UygBkGLnJRVgNY5oP7lXCbysSTSS+F9lufDCboxyXgcZ/BmEXpXUYIoP8J83acxlw0XeCUOzjG
	8h75cYgquJZolywT9TqMpX/Zm4DrRJFXOuUfWrqwogQxQVb9Jh911eZ/kMo7j//WY1ad1FrUAFP
	jsr/OzTBwkzLFJ+cYNruTz579v7SjaOBPcn/ck5suPqXQicUKl5VCoMXpGjE0iYHBn+R/rtwxhv
	BVW6mR9IceA2l/NcjkmujvFm0rroKlkdE
X-Received: by 2002:a05:6a00:1786:b0:84e:354:422b with SMTP id d2e1a72fcca58-86b6f55356fmr3892856b3a.2.1789146809342;
        Fri, 11 Sep 2026 10:13:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:1786:b0:84e:354:422b with SMTP id d2e1a72fcca58-86b6f55356fmr3892808b3a.2.1789146808816;
        Fri, 11 Sep 2026 10:13:28 -0700 (PDT)
Received: from [192.168.0.6] ([49.204.105.169])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b291c1601sm1492832b3a.31.2026.09.11.10.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 10:13:28 -0700 (PDT)
Message-ID: <e43b8af4-011d-4896-b488-1a9c790718b6@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 22:43:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] soc: qcom: geni-se: Remove OPP rate reset from
 resource deactivation
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-4-091697dbeb02@oss.qualcomm.com>
 <813aae42-22bf-4029-8f04-54fc555a2a1c@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <813aae42-22bf-4029-8f04-54fc555a2a1c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W0duvXPVqcpJJpsv6hPS9BqPrV1Xj1dc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI0MCBTYWx0ZWRfX2OTMbfdNs8EC
 aAaBJ4YR4U3/jbp86smfYlDKQBIQKgalY1TZdringovNEnjFk/iYMWzoHTR5IEHUQrlaF6HMApz
 tx+ZdKlpn0y/Jflf4xFiF6ujFflRxoIDu+65zA+o1UI/bsaD2vIJ9DtR1KSqDwrB+GEp9D5h33H
 ru6OOclNmbILgjxq+iXWzjYaDDbU27kJsfx7sqlBffzlu4bwlxL9TAUwhDznZUKEy8SllbbOPON
 0i8gTjOltI93EENEVTYgTZ/Tr/ozAzVgQNybiwfTfxH7tFSafKWyE/1PFcxfQIcsTn7vpMB0bez
 sq7+8Vn33cfR9HmjpikXtqySqIuGHLJ6gj4ppQXIGiMRdCTCl9qqtqDD14mGctrgYJ42ZHyz8kB
 9FQp0EaBZCoi5iT6jnXtZuib3Lsf14mdevJxj15r7X1tFxLrxhSK3FrK2LPJoZ1iOJ1owkWB1YQ
 rpeBDz7oYdWzIhA3kPA==
X-Authority-Analysis: v=2.4 cv=X6jHu2Te c=1 sm=1 tr=0 ts=6aa436ba cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=KFINdI5Z0390/lZYonNNQw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Bcqig9hN0zFNc8VZEzUA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI0MCBTYWx0ZWRfX3cFNgg0yZ0HO
 h/aIimpYy+B8kC1svbSqSjemnfvVB6ULMDVjzb0GjqS4jT0jNog5UCVgbrTIG8dl3yFVTt8XdGQ
 /3IYvah/FPxCQeOs4hmHoHJlE+5eSnE=
X-Proofpoint-ORIG-GUID: W0duvXPVqcpJJpsv6hPS9BqPrV1Xj1dc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110240
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_101331_525115_A76867AD 
X-CRM114-Status: GOOD (  13.47  )
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

Hi Konrad,

Thank you for review.

On 04-09-2026 14:19, Konrad Dybcio wrote:
> On 8/27/26 7:59 PM, Praveen Talari wrote:
>> Remove the dev_pm_opp_set_rate(se->dev, 0) call from
>> geni_se_resources_deactivate().
>>
>> OPP resource management should be controlled by the consumer driver.
> I believe the opposite was the original intent behind creating
> these helpers..
Previously, resetting the OPP rate to 0 was applicable
only to Linux-managed resource control. With this series,
dev_pm_opp_set_rate() is used for both Linux-managed and
firmware managed resource control.

Therefore, the reset should no longer be performed
unconditionally in geni_se_resources_deactivate().
Instead, the consumer driver can reset the rate when required,
keeping the common resource deactivation path applicable to
both configurations

Thanks,

Praveen Talari

>
>> Additionally, clocks are already disabled by geni_se_clks_off(), making
>> the OPP rate reset unnecessary during resource deactivation.
> That is, on the other hand, a valid reason
>
> Konrad

