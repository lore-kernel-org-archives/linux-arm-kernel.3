Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853E3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+2Omb5DUzskgrlR5kHajAzpSEQp/MXc5zGp9W3t4rg=; b=f6eiNc8t688aAb64+3yENWnsd9
	uJRFaXPCE62RDYQGJ3hxMqDhmdogR9KIdSvlnNJvxSCzf8EeyPmGo3G/EHQNNnaF778YYJsCewTp7
	g1RAw8BaDbaokFPmIt34Ls5/L7B5yEmt8TBea1tYBMCH4YWi0RgvN27d6SnDYioIdQr9iyRhZUZbJ
	f+ipNDA0A1MfRjG7CfXO8WD1F6gk61MnhgAddiZlUwkEiSiF9ZgpoqeAqzdti55nsJsJvvm6oJ/5m
	+jxYILM5rrLGTJ7A6paF9L9nofWNecVQsBDjQXvnns7nHMR/rq8GlD7nkyuNCGfGGpXt5YwuCpOYf
	kuMJhINQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkDh-00000001R7V-3vDO;
	Thu, 09 Jul 2026 08:34:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkDf-00000001R5z-2MhQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:34:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960JoQ750012
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jul 2026 08:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+2Omb5DUzskgrlR5kHajAzpSEQp/MXc5zGp9W3t4rg=; b=QH4aKFOALyROa1dJ
	Op4o9GswvuRrGVtMDVlQYqO/7EySTe76uunAUKFGppQr9QMa1aUYDs7rb0S3iBHL
	ppZx1ot8Oon8YOpcOPHOVbDTxNl6H6jgP9DxmktMpt8bQij4JTO/NZ3vDrgOqazl
	MBRjpLBPe1zDSHdZfVIq0yfWr1SVyRrY5bxKQ8xL3kBARRf05mv3OyhhvOJIQ57J
	IX6VrkGh/zpZnOJfGLzaAeXvAs22Uh2qFLR55c1+dS61ycYdFpbkjGfrQpB2Hlee
	2je3aWcjV597bdK/di31lsE9aJjsr0K2dRp255nm1d+kKX2FyjH7q9Hml/pOANwh
	zDrG5Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9wwft5rx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 08:34:53 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cce870a060so17649145ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 01:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783586093; x=1784190893; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l+2Omb5DUzskgrlR5kHajAzpSEQp/MXc5zGp9W3t4rg=;
        b=WowMdLwnKdX9iJ6XzqBJ5U6WJaW+27iAf4Bslai8o6Oc8Psc+0xQsXJgA6JyI4Q4Gq
         bDb5TyVIPXNB4lDUDIgoz8hMk7NPHYOWhMR9EWjGd+yUMMH30l7hEJkSBHO6qdhqss3U
         7UCTfWSaqkSrFC2mGDdqCoTzVMlYFqc3yqMxgvjn6fhAsnaRXt3UpLqyvmiCA95HlAJB
         Ksox/gkauaBMJw3/2wY1aDHBv602VsN2AK+W4yodFFiEP9eyfI9XVgiN017Vyb64zDk2
         b/a+AdXjR7RFxkuIb5tOql8t0vWc6wNQK3Bx/A2houS1hrz7D2AaDGzWNOPmy6qHPImi
         LNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586093; x=1784190893;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l+2Omb5DUzskgrlR5kHajAzpSEQp/MXc5zGp9W3t4rg=;
        b=YpfZ2aErFoXWeq7w/rV2WQnJvpvzJx1RM8npU9Kjr+qCRXrB3UOTDgej+uGigoes7K
         mhYfmsOUDsg4vY9bZHTvTbY3oAiThlmhAUomm6kesm6WPptVPqBrfdrVO4dPW22Sigba
         g2wxwuI/HHas9sxdTJ8L+rlI5hKgKqPGLsu0C5asDSOEkn+JHy97FXcTWSR0NFfoJRoA
         Go5X+v8L2Mw6+UBUByvar57xmrsgVwN3lNGjTVCZ5h1wQRARK4AYOnedHO78vy61WrTt
         z3H6jxfOJ2N9nYru+ammeYB1mLNZ5J4BAq3QZIJN6FHqEXo4oguWA2wGoHa9auV8tYws
         q2vg==
X-Forwarded-Encrypted: i=1; AHgh+RqsInTgasT6JeFN2c6feT7DCVLb6hO3OV3t8vQBy6BGt3+EMrxPnmCbzx+KhihUowHjumGAiYMKS/vgwZn6RCGA@lists.infradead.org
X-Gm-Message-State: AOJu0Yza+R1ZFM76b6S4VXxsO0wz+B8KZB9tYKILMduMoMWldJBay9bX
	Ug3PWY+MduyhFm6n12dUhBdzXsbcI1D2cqIFMIt3goayJGUf4GALsoiDD2B30VX1z4H/6Vx6z4Y
	rgxrRL9XOfc8vWFyzInZJAPLevCE8rftrBc3GNrT7pFf0TDCgAOBbf49de4LIFdR+JniYFT/6PS
	errA==
X-Gm-Gg: AfdE7cmcwBbgI6tU4GwRJUxBmHIvpKEs3x4ivUYNCaXD7GViqOXaBxwb678sJ9t7bZb
	sTkWyTJZrAetpvjJs8noboZ5Q8hu/bGAd02ntPvrlsg0oIOvlZboPk7Xadxi2pu2BT8wEWi22rR
	8ajHX7GtPvdqcPgreejtlbXyE73KM7HtzlhkcQZ1RIr+2IIMDGsftn3bKRrOJXGhzZxyN4UBwlr
	t0KcB7SOgSV1oFaXC0uwugXxg0lVzHF6Lpc6g90vM+0nblmR+eO828WtAev3zlFUEzB/M7st4FN
	6two1WY+WHuKzwZGU1mfvyWlu2x1FAvg2VQi/x3Y6c2KKqav26SUSb916SV4lWpZfP0jk0hrpTz
	e/kWhe85bIl7uuW7h8gy+zFc2owYQFY5MIfeXSEHS6J9MZx1n54fWdgNYa+bPtoZ6+CD+7kQydP
	gg
X-Received: by 2002:a17:903:2447:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2ccea3cce67mr67471395ad.21.1783586092834;
        Thu, 09 Jul 2026 01:34:52 -0700 (PDT)
X-Received: by 2002:a17:903:2447:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2ccea3cce67mr67470935ad.21.1783586092330;
        Thu, 09 Jul 2026 01:34:52 -0700 (PDT)
Received: from [10.133.33.179] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e1aesm40865795ad.39.2026.07.09.01.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:34:51 -0700 (PDT)
Message-ID: <e5876525-4568-43bd-8c91-6dc462b18fa3@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 16:34:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: arm: coresight-tnoc: Drop
 arm,primecell to bind on platform bus
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
 <20260707-fix-tracenoc-probe-issue-v5-1-bf733ed9ebd0@oss.qualcomm.com>
 <20260709-versed-marvellous-pigeon-22e2ba@quoll>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260709-versed-marvellous-pigeon-22e2ba@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MSBTYWx0ZWRfXyLKMIofSN3uo
 DV9brcQAJcHIlkTETRSwxWgtMQ9sBRlB4Lka2seTj61aTIOaKaLms7MXToWd2ptX/4Jz7l+yHMc
 GVHsHZPWovUo0ywkHjtTukPFyFP7xwr0LkQ4VbV92Wh8ljxvtv1/HeuUXsCv2eNaNqRRfGOZEOE
 g3qRvAjtduPLX83aF0zzx6HMEjfFeBHaMibGslYTcIQyw4tO+vNN5cJ7+SGe3ph+PWa3R71/0H6
 sHOuM4E+L25AWSAIyjhFzur0i6PTFhefYYUYe1pTQzIeVroSS1D4DiSjmmau1i/X6denzzfCXm5
 c+HdAIvhS7op/FG7aQHb7o3WCb2HOMDbKt2wDLqxN0F0fMDqhhcTocXv+hGN1/V2dzLoG4eaBmt
 GcRauJpqnn47EVhfF9ch71I7v+WCVwC+wK1YaEwrKi5Tsv3LcJjFENDhnHYa07xYyoBGSuZSURm
 H/ANuXpgk8nCIXsPhPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MSBTYWx0ZWRfX8esAOcED51aK
 fTduOaA4p5tQ/j4scnbmBwVcjZENXHMyg+hCTMtVeNmuY52E0Z3Wqa8gUqqkLixFOt7xm0GCgN/
 usoN5U5G59LGWsZRtCiKYu6JOmLiqxE=
X-Proofpoint-ORIG-GUID: FPb1DQdozJNCIIUbCcuLSNQDPhAXf56p
X-Proofpoint-GUID: FPb1DQdozJNCIIUbCcuLSNQDPhAXf56p
X-Authority-Analysis: v=2.4 cv=Krh9H2WN c=1 sm=1 tr=0 ts=6a4f5d2d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=fv-GP7Tdd4dwdnXjSPsA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_013455_723944_3A77D3FC 
X-CRM114-Status: GOOD (  22.41  )
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



On 7/9/2026 3:59 PM, Krzysztof Kozlowski wrote:
> On Tue, Jul 07, 2026 at 05:08:49PM +0800, Jie Gan wrote:
>> The TNOC compatible previously required the two-string AMBA form
>> "qcom,coresight-tnoc", "arm,primecell", which forces the device onto the
>> AMBA bus.
>>
>> Change the compatible to a single "qcom,coresight-tnoc" string with no
>> "arm,primecell" entry, so the device is created on the platform bus and
>> bound by the platform driver through its compatible string.
> 
> I asked already: this is not a valid reason. References to Linux
> structures are not correct here. If this is your reason, then answer is:
> fix drivers, by renaming or doing whatever is necessary to platform bus
> to behave like amba bus.

The issue is that we are not allowed to introduce a DT property to 
bypass the AMBA bus validation, which reads the Component ID (CID) 
registers. Besides, I cannot fix this in the TraceNoC AMBA driver 
because the driver is only invoked after amba_match() succeeds. Since 
the device fails the AMBA match, the TraceNoC AMBA driver is never reached.

The solution proposed by the CoreSight maintainer, Suzuki, is to define 
a dedicated compatible string for the Aggregator TraceNoC device and 
have it probed by the existing platform driver. If the AMBA bus cannot 
identify the device as a valid AMBA device, we should not fake the 
hardware description to make it appear as one.

Thanks,
Jie

>>
>> Drop the custom select block as well. It was only needed to avoid
>> matching the "arm,primecell" string on unrelated nodes; with the single
>> "qcom,coresight-tnoc" compatible the schema's auto-generated select
>> already matches the right nodes.
> 
> Why are you describing the diff? It's obvious.
> 
> 
>>
>> Update the example node to use the standalone compatible form.
> 
> And here.
> 
> You got comments at v4, nothing improveed. Your commit msg tells useless
> things like what you did or you want different Linux behavior.
> 
> Best regards,
> Krzysztof
> 


