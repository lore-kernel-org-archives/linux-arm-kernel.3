Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D24ACCA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 07:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KhcnubSus7MkpUMzXlz1FJ9i66J4sJ3ytWF3Qtk0VoU=; b=FSEQu0Jy7m0JMs1UtGQ+KH62mf
	dtoWBEp1RlN9VLXMeh1g+TmXlixUBGySpjeaES1necM1HCfJx0qcz02myod1pL7Rx0qIpo6QkqW4R
	15RMO2a1j83JmpI5dbl8gsZxqSNkRHI4j+7rMo1h4P8Fj5wXv3Voh2RVOlgHtlvWSkswKWHmgrbok
	JdJJ9AhuD0FI8Zk2jdlxum57R6xfncfnpUaXTmFo9D4mxpABg+204Gi+C46CCd6/e2ongDDamxOle
	bF9d2mfS1+GljADgQ4HTjoyIZoIec3BEbAQNb6K8JeAnnoHok12rOJsY9CzIcNzPfDVRnKGJ496dC
	SW4LL7xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGft-00000009ewL-09aw;
	Tue, 19 Aug 2025 07:22:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGBx-00000009aFR-4B06
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 06:51:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57INtCpM002291
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:51:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KhcnubSus7MkpUMzXlz1FJ9i66J4sJ3ytWF3Qtk0VoU=; b=RA1xZPkvzllF0MpV
	naoDi0yR2CxSqphg6p90qxi8lyy6MADcfyIb+nkKPjEoCoBV9uc+tBLfOsHmszpO
	xyJO08L2fhdIpPJKpszYhLkQzhlB3U8XKYaiWda/pkkAkRVK3HmBcdHV0DAx9+Dn
	LX7AjA3/OdnWRDTgQV94el6hFDRookIlXq1U+6SF1dzX2ia/3+Dp3slRNc/522k9
	oI1RPosK4xauiQymYlcQyykReT4tCir++VLdkabDx3DL02Rhn640eXmVfoqZLr2N
	VaG/+Tx1EDRKPPhWBqP31mETZ1MukY3FNGhCQAJj0+KAMbUMmdoOC5MBnAwSyNYG
	u2tiRw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtfq2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 06:51:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b4716fc56a9so8335532a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 23:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755586293; x=1756191093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KhcnubSus7MkpUMzXlz1FJ9i66J4sJ3ytWF3Qtk0VoU=;
        b=n/EPOT5NSUDiNZAp6r6ekDqi8nAyZf3LFpodGRvTOZV36+02oJGllmcBjAKa1Rokya
         DwpXzpg8DwXIio6FHG0sZgsovNnyp/8mOQKUFwp5F1VOsUbA01HwRo5ItOzN4Ya06kzD
         5PiIn5crDCBtsWpEWWqwDwnlWf1J4x5uj42B3/gJvbOR7/XJC3XoJnZRLid9eIzVnu9c
         CpPc3dmdZpSFqSlgJYIbyigfYt6yZnT8Nkyi6kZmTb568zU3H5xSX+LOj86ellAXdUUW
         BMJ/097RxZ2kba132rClWe3GLM+7UECEa2V6g1Oa9Or1vE6BwX+rQYyIwsRow/Hp0DoW
         wrrg==
X-Forwarded-Encrypted: i=1; AJvYcCWaypVCnWpSrDBGG/jNkKDOMAto9zU4+NnENjRo9Gix0kkkNorFIIJp5pZfI2hCK6ibOIzk+ZI1KxJBXXYf5Fyq@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb/slQms250GNlOYIIgHCcRnyVYatHPwyoiVAjKJTOUyJovS1W
	5L4EghzFC9RscNUaJ/HL/ookXWzfLi0ZCUSU0YyA9cgaN29E5mdMt/g6sfRJS+F2/6aOXDVUerA
	E2mCRaBoq/ypkdQA13VbEz+rmNLkVmppkARYrOCHhEHWgtbsCJNr5PnMSx+v0ZSMvE1bvGZ9+bq
	HBlA==
X-Gm-Gg: ASbGncuYtFqRzqtUVODUIBel5IKGAqWUpT/BkG9cDa2ClkfIMfBiXLVIO0sZhDN9WWv
	MxrzB9vYoPGXL9IxiE9IpGGywWF3yvosFOQSiyug7eAUWamLulM3bnN0RpQZkR6Cumrr0SXCDb1
	CZ29wrf+arypP3EXVbvBtFBwYbet/fpd4VRK/2onfcn7sZ6KfAc5m626sJzDOVwOzRdK/QKLiPu
	DeMkhKB37NkOxCxswDa12+YpweVlF+KGqUYYgq/yB4odRGm11SKDkuIYDP/K5v5QhugX5yGHRYH
	39Fq8zXU9Dvx8sgthk3yMJjbXeus8ikZWd95637mfZS2G7p2RDpt0u7Glx8ke/BQOKuY9IvhA74
	vs6NW9E3kDwO2AQOnL38UTCKVKxs8Yatl
X-Received: by 2002:a17:902:da8c:b0:240:aba:fe3b with SMTP id d9443c01a7336-245e02d7726mr20776695ad.16.1755586292689;
        Mon, 18 Aug 2025 23:51:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrRQRvLzaR0no9uz4wl3VWShxiXhdMnGmDhx8W5wXZivwjwGSDV2ohd6ogQppD0UOvYx2W2A==
X-Received: by 2002:a17:902:da8c:b0:240:aba:fe3b with SMTP id d9443c01a7336-245e02d7726mr20776395ad.16.1755586292249;
        Mon, 18 Aug 2025 23:51:32 -0700 (PDT)
Received: from [10.133.33.88] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446caa3e5bsm99455325ad.33.2025.08.18.23.51.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 23:51:31 -0700 (PDT)
Message-ID: <157c048d-0efd-458c-8a3f-dfc30d07edf8@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:51:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] arm64: dts: qcom: qcs615: add ethernet node
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable+noautosel@kernel.org,
        Yijie Yang <quic_yijiyang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
 <20250819-qcs615_eth-v4-3-5050ed3402cb@oss.qualcomm.com>
 <c4cbd50e-82e3-410b-bec6-72b9db1bafca@kernel.org>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <c4cbd50e-82e3-410b-bec6-72b9db1bafca@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FywTKzhlbjvlU_7rkKfFC-70zfIWueq3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX0G0lZFq5861m
 j+z4sSbq0guCuZZnUkGSHrIKmrL2M4zjix7/0AmXXuGNAe80T82PIh3hCkAj+PuxGAzPaTrWhWQ
 fq0IHLMfzRaV9igcG6yot8PMMvpdqgLkxwmfDWl53qk6eydtJSDQmGB5G6jydd8S1rcAzR9kfZ0
 Ud8SDok/cr3Z8s2heLt/V/uzH1+E6UY0K1iVzlfabupTOUVnXbKgSixuJvs/94/mShrChd0nSzt
 Sc1ORcRhyhdxTo9dxh0j4m7B66f58HCevidYpmsGruEciPwaZxxcRV2NW4Po4xfXM5EpviVsQs1
 1EJHyGDpYBHxNFZrNQWf1W2znAGEHzIQO+5rAU+ly5yYVu3FwolVXSiQ4u7C611b1qAOf53GbWq
 QBmRBdde
X-Proofpoint-GUID: FywTKzhlbjvlU_7rkKfFC-70zfIWueq3
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a41ef5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=XWQ9mN7VkJ-Tecl8lUkA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_235134_073618_8C498056 
X-CRM114-Status: GOOD (  15.61  )
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



On 2025-08-19 14:44, Krzysztof Kozlowski wrote:
> On 19/08/2025 08:35, YijieYang wrote:
>> From: Yijie Yang <quic_yijiyang@quicinc.com>
>>
>> Add an ethernet controller node for QCS615 SoC to enable ethernet
>> functionality.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
>> ---
> 
> 
> Why do you mix up DTS and net-next patches? This only makes difficult to
> apply it, for no benefits.

The DTS changes and driver code modifications work together to achieve a 
single purpose, so I included them in one patch series. Should I 
consider splitting them into two separate series?

> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Yijie


