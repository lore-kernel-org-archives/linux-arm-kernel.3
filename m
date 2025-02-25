Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AF9C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GequlyylXnIqG4LtGD84B3VsVCx7KNiPZUld/TTZp8E=; b=rZL7Q8AzGcQZfRkk8QxTeELhsk
	h6IOQKgDsK64Y2dkDxmuevd6NlqWijuyMANS7vy9chtx5mZpEgLn23idfX0Bc9z7xvgPF1Cqu6ImT
	WaYbfTjUPAb3n2ooGotUTdufQBZHzAgsYxbJJjneC1Wn1GMGDMH7HdjeBFYgufTcx6R0uBmJgi4f4
	RLtAJzhm1gUoQqPXetOuHqD6u4aW2NKs8Z19OSi6hVRjrMTRCtWcWDUTQ4wtMPq1nf8EBkTD9gl3j
	UmJhV0CwyASFcvY9jSF+/W0VhZXYtwQBSSgJ2IcznfT5Rdno0+7bX80DvmBBzVZ11uDk3eaEB6TuN
	pRk5JP9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmssb-0000000Gz4W-32yG;
	Tue, 25 Feb 2025 11:13:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsBu-0000000Gpd8-3Do4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 10:29:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8TUp5020238
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 10:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GequlyylXnIqG4LtGD84B3VsVCx7KNiPZUld/TTZp8E=; b=mce3Anb9rvwWfev4
	HB80HiedQmNlC24nEJXU3b4s6phbsqDnfsk91jfq0SUQMoodrT5lgGqK7OW8tLXN
	OE7rUHnif0PRQJXyl8ezdU1jzxM6gcFEXffO6GeTbRcGr1+pDeciwjvt1X4OvhRk
	LcYeyZCJQVbb9VcbSUc1ezMTXwoIaK+bKo+qTZtxxh5KIl2YPa/owByu9YXDYLzF
	QYKjbG5m6dxM5A9q5uzhXD/s8xaiivbJ8YIoHeqlBOo1JBO2y3bU9OifYVrjbhqJ
	Bu4WcQGYo4kLyQ7B592uVpcN1H6d3WhUF0U1qomygrnco4dLtNVqq23nrUPgcZf8
	+YmIiA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6t2rd4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 10:29:30 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e66ba99599so10285196d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 02:29:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740479369; x=1741084169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GequlyylXnIqG4LtGD84B3VsVCx7KNiPZUld/TTZp8E=;
        b=cRtiX3+rWVDMO1HYX5aq49Xz8crlfIgDR2cF26Ycn2yJiR2rbsc0ZXjRxkZlScKSNh
         vmrlBtmomP96nsCpsq03WtEdQEy6oHJf3E2uvKuUwwHceyBgAtuXxnUSj4q7pnHr8P3V
         SuIPIxS2N5+ekq3YtFDncVjzU8h0me7HE9U0Exyar6ML6ZeOXtf1EO54U1BoKlWv2V+X
         WW3FinhMGYkSDLNO05uhFIwLNb24q0cZeqXA6U9wDoobBzIku9jOvPACwUJ8g9mUFEYs
         hc5WCHWucaocP1q87qXSLu759TPheIwFvXIdxJRIjlQ4kKhY+2h3OiQS62xLvLstuyVR
         vdCA==
X-Gm-Message-State: AOJu0YwaBJmJu3265XjSKQJoallH/8K5fV7OwHkG7ZjVPfkPUHcmJAMV
	DMd2ZGStcK5xs/BneW4Kjht5EbzsUutwU4kotHUz9Kv8LqcL2Q2eSOnf00FzaI+sADcbvu39H+k
	/iaAs8I+4NjjRyuMSavByyO25vH96eBTCY60bBre52atcx/86mFEN+IfJcrlSLYXLxLAMfBgcYg
	==
X-Gm-Gg: ASbGnctk8xCclOID8kgt/8NHdISgTk7FHkG0RZW5OhHyJgE3b1brjqRgfcWg5hmO3Z6
	uVj8ecvPVX9fU3BpTiFNdDTt+J5q4Xezjt9CIyMYeoPwUOq4ReWMXFTgFDSt3i4HwR55V/GkvLs
	xt68s36VPy1meD4QlYA5ZfwlaKZKFoKjLrMT2m1W81qoosajqsrEmzkoI//agJ/AwgSCYy9Sn2u
	jKl6cpCKWOb5OhlurXDfHw7UK+jWteIoGvAkSrABSoQlrFcAePPu7rLReIOVGNOzqxKzvRySUUU
	imdV2n7mDfsBHmc7zfMrD+jsKtATyC9VTa6dd129Wf1B7HOF/iRD90dNO3R2cKIo+MZijQ==
X-Received: by 2002:a05:6214:4105:b0:6e6:68df:6052 with SMTP id 6a1803df08f44-6e6ae84f58fmr81439756d6.5.1740479368537;
        Tue, 25 Feb 2025 02:29:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHn3RkTQaD2JXSuUMFzGjX6e1+EnlYdi9qDfqQpXuA2RsXKEk2lOILqYaECeRfVX82dBJcTAg==
X-Received: by 2002:a05:6214:4105:b0:6e6:68df:6052 with SMTP id 6a1803df08f44-6e6ae84f58fmr81439636d6.5.1740479368132;
        Tue, 25 Feb 2025 02:29:28 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e460d1bcdcsm1009166a12.61.2025.02.25.02.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 02:29:26 -0800 (PST)
Message-ID: <466134a8-439a-4029-af2f-023a8349f048@oss.qualcomm.com>
Date: Tue, 25 Feb 2025 11:29:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: enable Qualcomm IRIS & VIDEOCC_8550 as
 module
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250225-topic-sm8x50-upstream-iris-defconfig-v1-1-8a17e2e193d9@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250225-topic-sm8x50-upstream-iris-defconfig-v1-1-8a17e2e193d9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nTAA8-4-CrdId7GNPu02wLTdbXtrkIOi
X-Proofpoint-GUID: nTAA8-4-CrdId7GNPu02wLTdbXtrkIOi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=912 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_022930_816335_1572C7E3 
X-CRM114-Status: GOOD (  12.61  )
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

On 25.02.2025 10:10 AM, Neil Armstrong wrote:
> In order to support the Qualcomm IRIS driver on the Qualcomm SM8550
> platform, enable the IRIS and the VIDEOCC_8550 dependency as modules.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

