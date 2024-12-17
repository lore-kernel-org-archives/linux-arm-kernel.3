Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F63E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0teF/46Oaov7zdRERb9KE3vehrfRENnvEWwbC7uDJI0=; b=ePAkmDSp5zGxiEqujD/8lRfDpc
	TArOkDRKxI82QXa6JZ4GhXqDJfVlxO5g9DeEeQWPKS1ql0lOxGpgYjLdKtSP+PorLOnWe+Fji8YGI
	lfZeQgJg/3sL5bVxdI0A/Hw1nmR6JaSGqsT8po++mDEd70I1V1XCednbHYITjuXjpLNb8nXzs6WV1
	5POJHQcLfIl6xwH8Xthl+jJnZCtIN9BbLXfBl6G6LUVGW5h7eNdahr2o+pRLbxkFyTe/h4TuzEvSN
	7Z/6drfvgLTpk1DlXIbX7d9vq9R3+LPNcL2QaNuj82ZOl1ZWygO17llzz7I6+c8kpP8lEvXnqgT3Q
	a7+I5Xng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSKh-0000000CcpH-30Q4;
	Tue, 17 Dec 2024 07:49:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNSJF-0000000CcaU-3tWY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 07:48:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH2wjkT015558;
	Tue, 17 Dec 2024 07:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0teF/46Oaov7zdRERb9KE3vehrfRENnvEWwbC7uDJI0=; b=KNkyUYTJa4dWwGas
	neIVHdv0EJj/5mv0oWQBPy5CQfXTHUvpnp1XEFSVBOcB8A8wIl4MoIvmWXMJgXMK
	IRj254DcM1lcgqDNB5x44fpzS0Dmba7WCv7CXhDftU+y439WVJLcSe2vntmbHyqu
	fW9IZTkeFAZENAhkk3vMi778FAB7TWjWtiYmoDJnj9Nfg4Rk9cidwv6F6l7M6KO+
	Ywu9q5O/FZKt12r4lGPg8X8aR8E3+wWaopkUf60Bk+WrJzgreRiAL754TMw/PTmg
	k1fZmRKLfZwVt5dnBkFieFZNdNsw5NtdoS+plozjIBOXwbpZa9nNQIAOZfMc/8Qb
	LvLZzg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k1060m73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 07:47:47 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH7llGw003553
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 07:47:47 GMT
Received: from [10.239.133.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 16 Dec
 2024 23:47:44 -0800
Message-ID: <e7ca1f47-8ccd-44b4-bfdd-707a1f8aef13@quicinc.com>
Date: Tue, 17 Dec 2024 15:47:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] arm64: defconfig: Enable STM protocol and source
 configs
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20241101084558.36948-1-quic_jinlmao@quicinc.com>
Content-Language: en-US
From: Jinlong Mao <quic_jinlmao@quicinc.com>
In-Reply-To: <20241101084558.36948-1-quic_jinlmao@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yhI47qohPhXzufK3x9PGXq1EHxIgAaqP
X-Proofpoint-ORIG-GUID: yhI47qohPhXzufK3x9PGXq1EHxIgAaqP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=976
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412170062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_234801_976090_5002D00C 
X-CRM114-Status: GOOD (  15.63  )
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



On 2024/11/1 16:45, Mao Jinlong wrote:
> STM is used for logging useful softevens from various entities.
> With STM and TMC sink enabled, there will be more buffer size to store
> the logs. STM source and STM protocol need to be configured along with
> STM device for STM function refer to Documentation/trace/stm.rst.
> CONFIG_CORESIGHT_STM is already added as module. Add Coresight STM
> source and Protocol configs as module so that STM functions can be
> used.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
> Changes in v5:
> - Update commit message.
> 
> Changes in v4:
> - Remove Ftrace config.
> 
> Changes in v3:
> - update commit message.
> 
> Changes in v2:
> - select ftrace config explicitly.
>   arch/arm64/configs/defconfig | 5 +++++
>   1 file changed, 5 insertions(+)

Gentle reminder for the review.

> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5fdbfea7a5b2..ac11cd1a7c06 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1599,6 +1599,11 @@ CONFIG_NVMEM_SNVS_LPGPR=y
>   CONFIG_NVMEM_SPMI_SDAM=m
>   CONFIG_NVMEM_SUNXI_SID=y
>   CONFIG_NVMEM_UNIPHIER_EFUSE=y
> +CONFIG_STM_PROTO_BASIC=m
> +CONFIG_STM_PROTO_SYS_T=m
> +CONFIG_STM_DUMMY=m
> +CONFIG_STM_SOURCE_CONSOLE=m
> +CONFIG_STM_SOURCE_HEARTBEAT=m
>   CONFIG_FPGA=y
>   CONFIG_FPGA_MGR_ALTERA_CVP=m
>   CONFIG_FPGA_MGR_STRATIX10_SOC=m




