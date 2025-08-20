Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09166CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 03:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1N/ucuPVyTyuNbkPcCCW3UQru9In3TiK2iev/+oe3mM=; b=kuqti3C4sHl18x9KZLKGmd+YWj
	w8pv4kO277ooylercHT1OWINJLXtV10NL+FW+rK1x6Wqx6ygFWPcJ6KjraXHJQ6OOpO44lforZJXp
	Qn0EoW7LRACVjsuqJbZWP+5ZXb2gPW/5wkz5nFw1aCRQvsZLqC0iWRkApd6bqWf3Uab0ocaxNOwNc
	6bPXgDbvFQMWILxHWBuqwb8ZEhRTWE67N7oJCgowa6AfDoIsfwAcaN9vPJZm3JpwgF9GN69IRRUfD
	gWTQE2CiGKw1jh1+0z/vKSec/VteszrZ0WIpC2rvRpG2ct8Sadk7F42AjEE4Tjfou2KX2YuXnUz2c
	xOIW842g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZPK-0000000CGPm-1jhG;
	Wed, 20 Aug 2025 03:22:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoZLD-0000000CG2R-1MGP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 03:18:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1p2QJ009540
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 03:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1N/ucuPVyTyuNbkPcCCW3UQru9In3TiK2iev/+oe3mM=; b=gdoEGRrSMiZHcCc6
	Oo5swe3fsHJEfhNQ9+pgvKJjnB8H0gCiv4Wfiz1NZw1JdjbBEBnykd0DDKRxIE+V
	VkOZxED24WT/zu4meCWY4MclmKfzkTwdlJmlNFH4pe0LQOnu5UUoATxq6Q9qCVlk
	thlNab6rJABofIEzlVHIVkuX0/B9h4qta4DgFKzcx2ABdd/Cua/ofVIXWds1sJ0s
	z2+ph3z5CDFp19I6hLEz4x6qd+wZ7+B2STwLp2ogEFsfaIAmF6GpSTE8eV/0ioOq
	zPx9tHwmTtQLvCc3KSdGQimJeMvzG98dn75hIdBgHUAigUTz5ZGIoQo/fozxbpbX
	VuuNMQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a06n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 03:18:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b47630f9aa7so533315a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 20:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755659902; x=1756264702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1N/ucuPVyTyuNbkPcCCW3UQru9In3TiK2iev/+oe3mM=;
        b=DFwuZ4SvEKCYhiPp647a+YqrKjfiHuq+mNz/MKJZbMzorpl4BP+YXO2U8uRpNAX0la
         V+buP15v+oKBSN1F7F6BVYwLYgk1Av6gdnDDr2UBPqgEGVGLVZcZ+4vhxsq/LMgZV1qr
         vq9Zje7ozSSQ640r5JZC2i1aIiUfut7aJX38gR7BlUlWwLJYIuov7wFm3+HNtjvymKLu
         SY31KS+3uBmDfLqBn5EoL8r6XwyQsAcWJWqY3H1Sio7IuSDD8kLsU/LQMLITofpN7bpG
         WrODa4uY8pZC1I9fVVizGvJEg4XLD/imLueOAtVWp9iPJp0wvsC6B/dIgykFasaJ7Zl1
         WccQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKzz3PcXXq9IDlIFNP69Lj+VhIgzFc1uMy0AG3jkrfgs9bDwVek8EY1NmkFeuu3ZHP7txWgy3ERGYnMEovPSfM@lists.infradead.org
X-Gm-Message-State: AOJu0YypCe9a40bYLxLorm/NzO3cvHi8R8wRFwY0Oshajb10Kigz50OD
	4+1t1DDVqPZifPNCYttCKa8cyIil9K4ngz0vZ6+bPSh/WjzsKrQSiV+QBAeryN3GztWXCOuaaYO
	l2eU9x+Alk8GUk/TZzpOXvj+bOhwguLsx1d8b13EA84Vp/D3r9S724flxb0nsk1/L2WlB7DRlDR
	XIkA==
X-Gm-Gg: ASbGncvOhrNRxrlnHJ9Lb3pZv8yzikicwL+RKTEuzd7xbgJ9oMW9Hw2jFr09+laSODT
	FMsVdgdEFThkZKBp48GmNJuZ6M/W4/nDt5UicJQWQyu4dnT09m4ZL/QLoyCxJxRrDIH2IxaxTbr
	wUYUws9BcaqMk2e9YeDUbQH3CHs6GxHL/Hbm6VgTdVMMVQLaUN0Kf8PlZYCrcCeDiwPUZ2aUO5I
	dGxgz/Ol10lJoeJJluOALbbpJG32pZ64CcESW7jaWJjTH4pYDPbwI25hRZoCz6+exSDCgSTRYkd
	9BjoxZ3GGG6YrcDeNSaHGeLvbNp3+uYH1Qtm0IE90vRtM81csj0zpVyv52sljoXZDHV0XvqbgC6
	w6+ZnHISUx00/YIqzpNJ+PxtqRLF167Ba
X-Received: by 2002:a05:6a21:6d84:b0:23f:f5bf:35d7 with SMTP id adf61e73a8af0-2431b988debmr2421278637.45.1755659901670;
        Tue, 19 Aug 2025 20:18:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg42eG76MsaUYs0q0AlQR/5jkH+O6t3EbXik5YsVCq2cwrkly7cX1JNA8zlN9xV7ue3HTcKg==
X-Received: by 2002:a05:6a21:6d84:b0:23f:f5bf:35d7 with SMTP id adf61e73a8af0-2431b988debmr2421234637.45.1755659901283;
        Tue, 19 Aug 2025 20:18:21 -0700 (PDT)
Received: from [10.133.33.88] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e253cff5sm702559a91.12.2025.08.19.20.18.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 20:18:20 -0700 (PDT)
Message-ID: <648e5f1a-5945-4562-b280-c12d26ad65a8@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 11:18:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: qcs615-ride: Enable ethernet
 node
To: Andrew Lunn <andrew@lunn.ch>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable+noautosel@kernel.org,
        Yijie Yang <quic_yijiyang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
 <20250819-qcs615_eth-v4-4-5050ed3402cb@oss.qualcomm.com>
 <813548c2-02be-40fa-bb6b-00c4e713d17c@lunn.ch>
Content-Language: en-US
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <813548c2-02be-40fa-bb6b-00c4e713d17c@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a53e7e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=TQ9DYVZ7-X13aS6S9P0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 4NirG9zvvWf4oiLUQNNqK32xD0vEnbX6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX1cDwrQ11NFgV
 +vzouAUPDEX1u7SRz/zS8gFZqzevPeo8hrJT/UGbGHIBlCp9GsUhE95qEtFA+626GQ8IceKHHs4
 TDtU7HIWuTRf/9ggbMex+6AqaSvJojiZvMqd8dIr/+e3lpY2vx7mRW6/x5fMf3jcd0TsA5rU7Ma
 6nYHaZfC+cbWP+WWfCipJ4YKNIZ+RTDRxL/TzBhPxpzMSNcCgN7uF1d3r2+qms95jyQerjCnEGs
 g+H174NmoZDr16cYJkDYdZWbcg5SudfZip3WBLka4hTamQdTxmbiUa7kMR1hRAAe+e2Mi+nApzi
 K13l94iw3ti8eWCug3tVEghUvVUSEEJQiQBhDJjXreWnLTPfxqbmiKhoUvNL2dG1emzUtqUG4xY
 Ht8FGY/d972aK3YSfhyb8u6GjDGnMA==
X-Proofpoint-GUID: 4NirG9zvvWf4oiLUQNNqK32xD0vEnbX6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_201823_395487_3A330A31 
X-CRM114-Status: GOOD (  13.38  )
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



On 2025-08-20 00:24, Andrew Lunn wrote:
>> +	mdio: mdio {
>> +		compatible = "snps,dwmac-mdio";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		rgmii_phy: phy@7 {
>> +			compatible = "ethernet-phy-ieee802.3-c22";
>> +			reg = <0x7>;
>> +
>> +			interrupts-extended = <&tlmm 121 IRQ_TYPE_EDGE_FALLING>;
> 
> PHY interrupt are always level, never edge.

Thanks for pointing that out — I’ll get it fixed.

> 
>      Andrew
> 
> ---
> pw-bot: cr
> 

-- 
Best Regards,
Yijie


