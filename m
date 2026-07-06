Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502ECC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 11:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M9+o4PUKMgHJp9AdorOs0p5SVquVy+abyY/nSxhj6Bs=; b=mfUrJK+ynnQkJUQtSmLxQmcIhM
	JGlhTqatlb/SGCvnpcq3stpYXJ40zD2pTqsyF4YsNhrYW6Te6sYlaD+4N5ljqGYDFt+KLCXnwJUdE
	je7BvWehApSGJN2FdFTOtRaeUZm0R/eO85bBlW8qGbQQp2uF4EKO8jM3UlMZFjATzDVyNFzMJrMKE
	6hdQztNUWSaf8/NPWxF4RHb3p9ddcKQGcjp4UVoQcgbr11maULvgx00/6Hch9wOsRb9NnUo/fxdei
	lZEHiM/6IoDlQLcm70N3iIsK2w6RTGSRcromjghaYhKhJGp6R7FroHbCOJnnHfv5HK+iVNSOds5me
	Hph5RPCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghBJ-0000000CJTn-0nUu;
	Mon, 06 Jul 2026 11:08:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghBG-0000000CJT0-2vmd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 11:08:07 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxDNN238262
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 11:08:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M9+o4PUKMgHJp9AdorOs0p5SVquVy+abyY/nSxhj6Bs=; b=ENQWdUF6x1jx8yL0
	TK34NknB8KymeARAmE8QPgyereYZDw3jnXe1q0/8g8VIFp52NHROi3RqaFudgQWB
	5zhFcvneVdsjzC4lAtz+xN4hN8soi0D0zrkeozEht9CPW4BSfkXXGS/jD9U323y1
	/ogrS24EEAoedojh9FLljIPmZiPkg3Je1RtIU/U/X9Y9YxRXjiwi5R8cE2hJs9XK
	pm9NYzofTI9ptS+Zy118aqiLUxsiF0BAVbr5c+zxiNtevKsFrT9hHyGN7ggwLDOs
	TYMKWyTD5JQoP8CysdFe+g8AbOM/w9G0UIwT4QyYEOOxbQ9xwEiHh/esOHlx+YT6
	Ywkprw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t88my8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 11:08:06 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c298a1b20so6189111cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 04:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783336085; x=1783940885; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M9+o4PUKMgHJp9AdorOs0p5SVquVy+abyY/nSxhj6Bs=;
        b=UST/BkTvpkNQ100eXd2IKCUlJPvksE8QAuZdCYvNjqPEW++6Y5luN25ClEYIl7SAK3
         KTzVooFaiQfUcYklt+2wQArE9XSgPxL4BiAhySgUkhbs4elJJPAmGzguf7b2o3AS8ygy
         6J2NKrZDZr3Fc7BJovplBrs0W1leOFpwVb/nPfj8UqYnlDp/f5iqZujlb2iVhSe3SQsp
         stUarKdqVuyBALkyL3p1P63d+mHQ7SNDmpWA7kuLrW8RRkda664vU28D4dmP6i3W4mXa
         mhndIPL3cq+NCti8ThlayWZ2U2iIRQHcbDjYBSUYdWacWUhK1r++zMXVSUESEnJWFv/J
         XjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336085; x=1783940885;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M9+o4PUKMgHJp9AdorOs0p5SVquVy+abyY/nSxhj6Bs=;
        b=YL6jkgXPbs+VhaRJtiuPwIp0FXXFMM1BwYYxTZ/PAs5lTMmUAFb16t96x30DROOVPF
         KIVVfZ7LS7hvLQb1RRZa1eigdpKA1M1j3jmaN+EMyGDiniQovH8yD+5fku+VxLKQD3mJ
         3I6TzPhfm26xLJR/f69JiKei04VYvhaqQsNEkKPEvNQ90Klxqy5U0ojtIFg/vPkONokn
         q734RrGiYnIfy4U7ODmjA7KNQX/vMihULsbDTFghioiFKxEuAEYGawO6+vlWbtKHUc+U
         OC0VVT4X7UX9T8UeXssHnPwWwTHrgoHDERR0FlrKw7TScT7IOtBUvT/4+ayHqzynLtSP
         MOaw==
X-Forwarded-Encrypted: i=1; AHgh+Rq9PcdD6cjgO7/EzjNKIdxDsY5YLwc40o1yiTjN5mYQgVhBWNMebrrctFwM4xUYaikkjXCDxfB7RUw8K69R47wT@lists.infradead.org
X-Gm-Message-State: AOJu0YydHfD8oAFN921MBY7lSy7IbgNrAT5aLKweMG85QWhJbnjvfpv8
	3tsIKbduBg8HPceTDwkHIp2iOz7vo994vzqTdwFoDYNqkDPaLHntK89WNW8SU/ub6Z/y1yJBsXJ
	WR18nTkCAhUBcT+bYLgnRZxwfd8GDrcDVLYdxvHlnkxo1bE9a5mRWhqCe9ahu6W4nAUYILhwtff
	vIAA==
X-Gm-Gg: AfdE7cltYWQAed8NArs93vBvn9fzG7rNSbs0FobMyxX7X0jRyPB9LftX07aXWfuQ2F2
	jXWw8TwxXjWOKgSfZRA4EWOmhlFFQDFDA6fr/puEJkNFYuGcr8ZyN+cHwWo0m6ScYV7d7BoIu4y
	bmb63xM+S5Nz1ngcF/S3hs27z5pdfQd1qiJhsGkI5IkKH2MXRMzS9eSVCCJgYsBBIKuIVZcW66Q
	+tVLJzEF7j6hK/6R2VyF5uiAqcfCFXyMLxi8k0NFixkoj+7dWFOxfd9Cso195mJzKQFzjdkqaXP
	X0CMiBqMFl+qkLCE0ZT0nmDS4kC4t51PQRMhohXCFHYHkSczTWCkG6A6cFTvheY+B35YcL5eEp5
	1lJJ+yqB5C3AzB+NWz2clqvYNRbbLoNznK90=
X-Received: by 2002:ac8:5710:0:b0:51c:db4:3cb8 with SMTP id d75a77b69052e-51c4bed6cd2mr88275371cf.8.1783336085177;
        Mon, 06 Jul 2026 04:08:05 -0700 (PDT)
X-Received: by 2002:ac8:5710:0:b0:51c:db4:3cb8 with SMTP id d75a77b69052e-51c4bed6cd2mr88274771cf.8.1783336084718;
        Mon, 06 Jul 2026 04:08:04 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b629a1c7sm723146366b.30.2026.07.06.04.08.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:08:03 -0700 (PDT)
Message-ID: <5fcc0bc1-7f9e-4611-be77-42860e0f4c74@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:08:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: eliza: Add GPU SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-6-c9f1354dbd29@oss.qualcomm.com>
 <10b0ad51-8766-449c-a51c-979364e6c781@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <10b0ad51-8766-449c-a51c-979364e6c781@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfX0HZc8ZnjB4Lv
 rkkYV9sF3sQzs+u+/f+OhyQbbq2nolMWklFvG7jmSDjY/P8z8xzNVNjJCQxEZMcSmyXIMXe9rtv
 YiMZJY5Uj2Es4G++5NKMjp7DRCfG0sY=
X-Proofpoint-GUID: 8u6iM5ez3k8zuLFgMZV7r7MujISCjecI
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4b8c96 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rL6LpJHDE9oUo6aHBFIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 8u6iM5ez3k8zuLFgMZV7r7MujISCjecI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMyBTYWx0ZWRfX1Z6toG8NOCxy
 WjgBknZe0MxvBoUi4GpgFa935LkyubFWWXBYPlKdapdB3MLiFQm3E5mAcDOXpZFXiwvmHeYGhKo
 pn+wXmabjIwBI6esUE0BXqZFi5q7OwboSZ+/F0PC/6ooKGw8GusTL5NdOZStOZ3T5GTtsnRcuUZ
 OVndhnnwPvxrDrDbyUcaiksmKf6y1PolVGB9qNBbLdzbjMt8ISY9d+LyTsFNDfw67v81o2iCEV+
 z4Qbnz/2ozcpDq2AYGHojs6rCB8fkGBoD12H8NRgcNz9KnIz2qS1J+4rmc65BcEXDiW0+ZHZ5MS
 ayBlnPjRtopuWp8GzRt4zkeGty38vrPkIkywXquk7GD0aCVk1m3/WcEBOiNESzS6lgceQ53jUiO
 flc90CvOle1gn8ULGRENa1XT3BRw73ZtLSgKflIJfLDE+gdmjIhrRQqrY9JjE7pa2GebEvQ8fu5
 vKuqZh1acInZNdhbPag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_040806_744440_591ABAE7 
X-CRM114-Status: GOOD (  19.80  )
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

On 7/6/26 1:07 PM, Konrad Dybcio wrote:
> On 7/5/26 10:14 AM, Akhil P Oommen wrote:
>> From: Abel Vesa <abel.vesa@oss.qualcomm.com>
>>
>> Add the nodes to describe the GPU SMMU.
>>
>> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/eliza.dtsi | 38 +++++++++++++++++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> index c5635f22e2a7..e5b8377e6c3a 100644
>> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
>> @@ -2674,6 +2674,44 @@ mdss_dp0_out: endpoint {
>>  			};
>>  		};
>>  
>> +		adreno_smmu: iommu@3da0000 {
>> +			compatible = "qcom,eliza-smmu-500", "qcom,adreno-smmu",
>> +				     "qcom,smmu-500", "arm,mmu-500";
>> +			reg = <0x0 0x03da0000 0x0 0x40000>;
>> +			#iommu-cells = <2>;
>> +			#global-interrupts = <1>;
>> +			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
> 
> 674 is the correct globla

(modulo the issue i explained below)

[...]

> This list is not quite correct. It must be sorted by the context index,
> to which a given interrupt corresponds to - the driver relies on that
> to give you information about where a context fault happens
> 
> Moreover, I see that the interrupt sheet has the bug where some
> interrupts are offset by 32 from the base vector, and others are offset
> by 31 (i.e. the SPI number doesn't equal irq vector - 32) - please find
> out which mapping is correct with the right folks

Konrad

