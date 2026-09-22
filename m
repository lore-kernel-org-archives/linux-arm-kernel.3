Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4504AC98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIlFbcfWSSBPJOpXWFjbHK10Sw2EK6VtX9GqIx0bZ50=; b=roR3+q/gPTp+EuFViTBrtXZpUR
	c0eBwfA1l+c99D/ZC4WbZdrQjMSOItG1vQU3ojNszw/7ZDcp9sYjNpFhMvBxpeRKHZnWeR5Vz9qBB
	mR0O+cjrTI/qgbXBeWMWy/6G+FojoOhT/Td4DBCyyXZSelb8rgvXRVYq6Ha094tTHzBTGpOUBpPZM
	ehI4l3rMX0zdqOx6QSN4oEjYT3NrZDzgCnUFGkonZoUwNsKgx6SE2sBag6mga75YnoxqYCHf9LYWo
	sO1YqZ79y9LFhQTyAUR2h5gltxdwgQPYHhnZsebrgYpfucMFwfTYv/cloy+T1pmrGnmK7HTw55KgE
	wclgmlMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92me-00000005wZ2-1VH7;
	Tue, 22 Sep 2026 15:51:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92ma-00000005wXn-3SbM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:51:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjMus3307545
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:51:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZIlFbcfWSSBPJOpXWFjbHK10Sw2EK6VtX9GqIx0bZ50=; b=T7JebKBjMDSTjcvT
	jvvm6qlOAFp3Opw7JH9XLLvMpxwQ5Jx8SIE6WCmEtK8wAZHPVPkKurHVgh/qpV2o
	af1yerBOqUz8i3e4pe+Ia4j6jFrQX91Kds7/kehSZJVYzUc3KJgQoWA4BJqL8DDU
	z/NSwxieaNJhA9DuHu12joKB/Abvrn9nXKbJz2jnstzcVS1uO+Pq8nJbKDDId+Vt
	2YdLVB93mNnV+gMqTyH0I3xV7VwXGVrJ1jvEzXeu2bgkYHzCycNoSkXBnKy/rUVp
	ht6KQCMYQTaBvyEiZ3nLCL3GzwTDag/ZwEzA/0sOWBjZn25Z5QqN1v4zd7nnZSyE
	tXaQOg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj112ydb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 15:51:48 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91240299f0bso39036d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 08:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092307; x=1790697107; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIlFbcfWSSBPJOpXWFjbHK10Sw2EK6VtX9GqIx0bZ50=;
        b=hGT38qI/LKtO9SAyMlMXLavQzLlR7FTEHCEn8kpKooOc9S6S1bybX73txb3hL8458t
         jmTVaggC/2N/xoFz83P4u/peUTlMaCz5R+936Mory9i3Tf1TiZDrC2oH8hUZxrTGUDYu
         3EK9ChECUzmput/NLjEGrnk3trHY72BaqysTAGQrkt1FdFmD9v9fTkAdE2n4MyS3V3IT
         NvIb+3PtWlQvvfSlFkczDG+CPo5PcJkTgFN8OE1YiHDrauoYKtZBUZHrIf9ie/m9ip1i
         4QkDEIzBLeWTS0mtVaZMp1dCn7H0iTLgIOjKF5xjwlu8SBW2f5VpoE1hM5I/dOo9o80S
         vbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092307; x=1790697107;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIlFbcfWSSBPJOpXWFjbHK10Sw2EK6VtX9GqIx0bZ50=;
        b=UVteBUkQ72jGfiNywEJASO8D8H2VsqgDo47p2A7tyFEiBZpA00hkiFo61cNgeF1Ksf
         /+1690QHFW8L/FGddvpMzbphVCxYfuaXLe54SEWkX7nFJrM9/FvLM/8kHHWM6Im9ns7+
         F2RcyDmaWjBO4h/77acw+8qAFjAi0j6Qk22CLmTRqEOP3bnnFPQv2CSUlwngaXLuw1BN
         Cil/K2oQS97oyPkt4BMMUIZJj7kjmGbrA7gfI2p5qmTeiG9O3YNfMz4quciP6I0K7G/c
         M8DPu91YLlv8aN9bTgKLtSXuRwtFZhcXkASgHwwVhD8DCw9uNB5S5uweT6nFIAzi0iDy
         s5Lw==
X-Forwarded-Encrypted: i=1; AKwUvBynaIbImc+tAwZIsFx8NZR0ibA07FpwPOkp31EAqhgXbmUrrjrrNNt6YB5pGCv44pt486AnMp1sthR6ZOJ+m8fR@lists.infradead.org
X-Gm-Message-State: AFuF++ljnJWjXNnjGOyl09GTr8Wq6iuMfVpQWZjX2R4wabGZ71xlFCn4
	gloglHn7FZtNXGZ0nj5ZkltYJJ9C5TTC3KB7KgFwj6Gn7nQjOEx+ED1sdC2xJZMSVGMjJGxorFy
	J5DXcFT0qPqfEgzR6oaPQz1lX57+O4HNqTt5tTTuVa4RpBQZ6EPLr2BssovtT/itaQW3sMIsmy3
	c7FA==
X-Gm-Gg: AYBFou3qnG4pC9CmtKEpnmI5RTJQ7FnPHzg4ROOWLbjVZnSjhhk6Z+m1G9lMxZukWd4
	USK9mGRmNQtt1XN4z3293703PQ2ynNmGgAAzfHCE4IFQshNDLXrFJArwyCFNhJ8mJH0rs9t7BR7
	51wnjZ2GSlqlv7JFr1ZBJKuzNy3WxH0+CwDzeNbRBXGiyOCj8bg6bOCELoXjD1TIkdo2CZ73aqH
	brKyIR90pgIX/KrXZEYy+OOpCZ6c1AwHfKf9IsUkoaq37I8NUkX1+xcXfByio5oMcoU7BfWyfya
	PRgijsAjbr9P/RqiMWeMlhvM/jz3Ga3sx1+3JEJgGD3+4l6kFFhq3qe0ls/hwMPU25c8i+V5DIi
	ywfOJ5ypAu+PO4Mw0voo7JA==
X-Received: by 2002:ad4:5ca8:0:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-913fc9782acmr62342156d6.4.1790092307335;
        Tue, 22 Sep 2026 08:51:47 -0700 (PDT)
X-Received: by 2002:ad4:5ca8:0:b0:912:127c:d7f6 with SMTP id 6a1803df08f44-913fc9782acmr62341686d6.4.1790092306971;
        Tue, 22 Sep 2026 08:51:46 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa440db2fsm1379520a12.3.2026.09.22.08.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:51:45 -0700 (PDT)
Message-ID: <29671684-020d-42e5-b7e2-f7882fda5ffe@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:51:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] arm64: dts: qcom: shikra: Add CCI definitions for
 Shikra
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: favP4Xyu_xSENF-uql9JxeqDqkxnl3PD
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX/wIpcuHw7drc
 fxUxDgx5fjhXr9kt0PblrBGIIYT/+hjScAn6dLS2ywtyLdJ6bv8QtbPejgFcAoWwe7sXV3pH8Im
 9AqXjddtDfJFg7H0ZB56sQ46w2bWKEs=
X-Proofpoint-ORIG-GUID: favP4Xyu_xSENF-uql9JxeqDqkxnl3PD
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab2a414 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kTwRDD6jQfcqJCPQX_EA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMSBTYWx0ZWRfX/2bhfwVIV/uY
 2VqP80Uc2evqy2oZQXvedgPDqvpFnc8zOKwcNZHsr49XIfhW8DqQNefPoSG50RP+Oe1qMHa4pVk
 tZg/XQxyEKSvpFY0hZyCjEzFqCG0rWd51yvBwRUQT77c/0nhay57Mugbnb20Vn4FT/OtRIPdVMn
 CbR+E+paAaWp/6Q6kfia5ltmwuysB7TkUE5M82NnAmZmK1OUJzgxcDorCDJUTtiBet8Sx+PH26l
 Gihuu4zZENS91oXwcytHbe2u/cnwVwFHBG571S7GZ3+UMdZfLzuJ3iVegyU7yxKZT2h6J8mLDbr
 1d0a6Ol2Tf+WDsKHdB+kEv2358/bLf3SCG+HobAkvSlBwCHEQBULiMLo93rhP4iKxA+WqLmoGW4
 lytqFFJ8qNj+wFwU961v6PGsLUp76VVrVj2bBDsixLfgtCNC0hf7X5u3xsp7Ed1e6qcoHfSl7NN
 ju9JnHiEO4cRbG2wblw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220231
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_085148_877699_790195FA 
X-CRM114-Status: UNSURE (   9.90  )
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

On 9/17/26 1:41 PM, Nihal Kumar Gupta wrote:
> Qualcomm Shikra SoC has one Camera Control Interface (CCI)
> containing two I2C hosts.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

