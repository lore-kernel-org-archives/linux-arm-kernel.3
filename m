Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2340FCDB466
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Jun 2026 06:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfmmR4KR+FxAid9sd3QGFwzw4X7Tu5ccd/ACfHBvlSo=; b=PzPwNIBH6AKjjvlqxvab4Rgo69
	wgrnzrImz3KMB21Jqk+vf1xihRlYQho1TJ1/6DKeDWa/ni6pj/zcpReRKQ4IjNanJPzsBbCivsU17
	7Vsq4hLMLsMAzGhxzOfahGUBlSq/oBoq3qq9EM5tVPH54BBEhIBQo5jhIm8NI94urKlzlEuAH8heg
	763gKLATFpSm3+Gu2m4ZWNrW7FDBg4fsy5zCOxP33s96RPPvEtxXwzYMHoVPXEtT07ivhphfEPhZO
	aKTMN+9m7kgQtWirfRyd/S6qN9SmRbqcW0qI2R6y4OAPb3vNZzIo141RmXzfJ9e896P3FU3R+4FqB
	7XArlKQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbBFD-00000003kz2-1ucg;
	Sun, 21 Jun 2026 06:01:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbBF8-00000003kye-0MOg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Jun 2026 06:01:21 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65KNmLOK891185
	for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 06:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WfmmR4KR+FxAid9sd3QGFwzw4X7Tu5ccd/ACfHBvlSo=; b=bWAavCubaAeSbQ2B
	5X7Tk45bwritVIUZ6q7ChKGUS5amfhJX7i6Jd3+U8KstjQVYB//B890waTbupy9b
	tJGRNDICPR1Jmflh+TmMNV29BxRzu7Cc+SFEay0RQthRnVPYESrrpI7WkU5VD143
	wexfNLzPJ1ZnOnb5OMuuIkR5VKYO2anf62kK7rZAWbyQvF5FH3QEr+Vm42Q+MPG1
	8okJYHbaGa4baOhiXL9wGya+HQK2q/qefMZ1x09nSEovfWnr1czKkIP5oN2215pS
	vJF2COzVkgD5GEGRKuUE12Bl+jL8bxINXTToZzgEPUkQFTGeZEl5+zA5C8N8CehX
	pcEM4A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5jhx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Jun 2026 06:01:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c889d1eebafso4583124a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Jun 2026 23:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782021671; x=1782626471; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WfmmR4KR+FxAid9sd3QGFwzw4X7Tu5ccd/ACfHBvlSo=;
        b=XMwejMqW/z6S7ti7HDDaSplue48pSm8VquESWnLwXCCYidwgxx5/Gaao5X9fqY2sTT
         eWbdLCxrP4JfAIJ10uEaUkmuKdVbzPVAL5joxBr/pWem/V0NXeA1qMU9yhdHNBV1FHKq
         HocUpkpqqdhoNYU282JQDaxBh8LHSR05mQ7Md/8fuNnJrNlU9a9JDYfwu8HcuRn6aKk7
         wJUvt9eg8JbvWerv2A1JAmFXV9fvTDozyEkTC2/Jz3kEv8W2CsDu4Zm2GlstooUbu2db
         esppSc/ehFGM2LPRllTYaMQn4ZkOYK28GSC0SET1cu2oUYEvOdJ6Ytv0T67c+Acu5wEO
         RSTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782021671; x=1782626471;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WfmmR4KR+FxAid9sd3QGFwzw4X7Tu5ccd/ACfHBvlSo=;
        b=ruvw+geJBTBSR1QekQzSDXswLF6g+F6MCI7p2pUsU1XP4Yo33YnbWwGU4xv+5NS7S1
         C3ly53jiGFLfx5bfIbsVHlV/EuLV3mFTLkSZdFlikw07VTYU5eFDZV77Mqcr85u95aRF
         xagzELjid9bTNNxeDuzKS91qql6hcyQOld+RLuI2HTZInIAfT7OvsSXSBC9sAGE85Ax1
         dLGHqxOGsU4GHWXqILyQ+QgjoMgPPilSjuhlQ7bEwULo8L3rpG952uJdkG3xU3IB7JFO
         rVemr6U/cgrD6RWHdjvSNw8U/jJxAoWV0vLAOCcy8MsBx4ynjyUALugVjhNSGVbNqmM4
         SE1A==
X-Forwarded-Encrypted: i=1; AFNElJ+dZKZ1OKocA66uL1+muytOlPnUNApt8O1RyxgRuHujibmGN8pcIV5cFoWSkt8e16qO5aOtQoJ1lBBK16CVrIpm@lists.infradead.org
X-Gm-Message-State: AOJu0YzRzIS0Pm4utkAK8rB6mCWUK++x403AL+SEHI5BR7FX67d9Ismf
	ZPt/4/iTcu0d3nOe9O+mZ6kScchABZ65lJCWK+AMsz4+lUjZYoI75xd0suh3Go0BnLkPKnl4waG
	io035zo7Dhoh/C4S9ZjFXb6WZ48GLtqE/BU1qILWlz9LfsG+jZsx34Wkkgx9rCpwGGp4BIaVT50
	sj0w==
X-Gm-Gg: AfdE7ck+hjSZB+45yXa1/DfW9wRMXKiPHYng3HI8vqtIm3YEjE4nuI1nansOHOwppZy
	YT8/AKVxHvrTrsKsIdmA2jJDnT30NWanNft840ue3dZL2wmkOiXLwe6McNz+RtRM6f/vmCKAu8E
	vQGayP5p8JXIQcszZjnnUOI03D3dgVlVe0Cnhwbkx4OSHOlVbBLyykX3IxCgnru7xz5o2IUItGz
	VG2IBrl1W+i3bqH0Ww9SDgWRv6U+D0uBXs0h27VDno4n3qm8Y0Dv+KqCI5oILPjUUKT9nZfsB/b
	7RQQLGusYes0G8Y3p+oMhtcFGmBn7p560hjwrIoEsu5iYu+iAvNP56bEMCkBSCq4i7uYNaHSaSL
	E0C6vfi23VfdeqcaAfl7DkbGyiGBrwHddGnZxE7tySg==
X-Received: by 2002:a05:6a00:4385:b0:823:d2c:b156 with SMTP id d2e1a72fcca58-8455078c20dmr11621222b3a.5.1782021671033;
        Sat, 20 Jun 2026 23:01:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:4385:b0:823:d2c:b156 with SMTP id d2e1a72fcca58-8455078c20dmr11621188b3a.5.1782021670637;
        Sat, 20 Jun 2026 23:01:10 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.226.145])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ecd779sm3823101b3a.53.2026.06.20.23.01.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Jun 2026 23:01:10 -0700 (PDT)
Message-ID: <cfe1778b-c204-46cd-a9c8-2bcda8ea63ac@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 11:30:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: shikra: Add pin configuration
 for mclks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
 <20260615-shikra-camss-review-v4-4-bcb51081735b@oss.qualcomm.com>
 <6e760884-87b1-4ec8-9ae1-e53901451b65@oss.qualcomm.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <6e760884-87b1-4ec8-9ae1-e53901451b65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIxMDA1NyBTYWx0ZWRfX0XtnfRDANL//
 dqIrYCdNkTLa9jIfgp4I/5CfChe+zhwIKB4+my/7I3acS3jMEVxp71HwIjfbSuBd//szBRMVWGQ
 SkqGofsV4PhFtbvmJv4eSNwvs+V3MYhNHrJqNhW5YJQqZNVcIU5HMWFXAt6YHkm2xjrJVzXQeWS
 T6aXnUYxeiS6r3aKUTYP74UcA1PyP6nVVJrKLn/4KwTz/eaE21Sn2es3axqKC/fNj1GRc642qYx
 4PkFDuJUI6g2sM5YFuY1Mh/HXpHNggV7Mc9+9PVt1bvIJVobFZAUW9vSSBRgguoghg1w06vItHq
 GD8OZRTe+sZt5PJoDZ/77DsMgsztCjQ7HUU/LgQcWNRP0SZofJ8llBWWv9DOGS18yHUnoIRlW60
 vxpoyy49ZvScI0ZgrwVmzmkPETa6oa4h8QbcnsOWMk1o1tQZEIFONwLMmwu9aKFq/wfVyWCOmnz
 65bjlc3fdjkGGaQ2LAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIxMDA1NyBTYWx0ZWRfX5fdySmwdCGWj
 LRNNv82meXjg/tjZZ8P1rbSBsM4QU7V3joq5lvGp2KptXvBFZ24ClrCDbp8hgvfNyj4sd1x9Rkt
 Mk58u22awJLQ6jUdzXd4k3dPsjtEnoQ=
X-Proofpoint-ORIG-GUID: MEhacHgLKgfAvNq6_8XQmmn_6-dlogkg
X-Proofpoint-GUID: MEhacHgLKgfAvNq6_8XQmmn_6-dlogkg
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a377e27 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Kt9MDo777XuedpO0AoDL9g==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=EEnOiY-A6ZLknHPuIi8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-20_04,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606210057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_230118_274925_C8030B95 
X-CRM114-Status: GOOD (  11.74  )
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



On 19-06-2026 21:06, Konrad Dybcio wrote:
>> +			cam_mclk3_default: cam-mclk3-default-state {
>> +				pins = "gpio98";
>> +				function = "cam_mclk";
>> +				drive-strength = <2>;
>> +				bias-disable;
>> +			};
> Please try to keep the entries roughly sorted by the pin index
> 
> For the entries themselves:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
ACK, will fix pin ordering in v5 - qup_uart0 (gpio0/1/...) first,
then cci_i2c(gpio36/37/41/42), then mclk0-3(gpio34/35/96/98).

Could you please review the other DTS patches too?

--
Regards,
Nihal Kumar Gupta

