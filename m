Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 168BCCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 05:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbncP33QuByCSLGI1byB0rZspAPVjU3fy2uppZLE2jY=; b=0g8B9NvW+R8GiCKIiOLImhUdoA
	2In0BWAYHtY7qgOpqniG2U8vpW4GQHn6y4aG7+40R6COPApXy0KiJffk1P4jWGbwSuy+Fn6e8mvH0
	JOgG1Xw5GRG41UmU1Vexh08hRmmAxe0AGPw0tZePgEMVxchqcAGAE9S16wYzOg5A/1rDiUgW8ZO2v
	qL5DTMjn51C850KunGWndLwq65YFb/33rFTpmyMZ2bF0udcF2KyPzsnv8g076LSIFznrV8VMwhjek
	57ajmsnSAi5SR/Wtg0voCFMDcA+V/r6cVZcBI/360wk+jwDY64TxOwGVp56bkkaK57RWeopwlctFc
	aen1wtkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGsQ5-0000000EsXn-0x1m;
	Thu, 06 Nov 2025 05:20:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGsQ3-0000000EsXS-02SQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 05:20:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A61O3q42798824
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Nov 2025 05:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RbncP33QuByCSLGI1byB0rZspAPVjU3fy2uppZLE2jY=; b=WY5U3PG4eUJLipRu
	BebhURNIeJ9CDJWrOCxeTHjrsPo5v3vVvjZ5rTe62ecmyJEkBvPfDPSnpDJYWLY3
	LtD8YTOqv3vzjXA82IizMEH/BAZXyh9ubpV41rpDKnOv9tbFUaLShk5O0rpAtRvR
	8aREZj1pZblM5WYszuAAj7vxoXGSOOoxc47MEptdZZOKj8Lzt8e+9XkdHaRcjoGH
	DYC2UE6tv6BXeraAQQFkXjQG19VkrUcp6eKEaU2TBqJkPP/NfNuzjKb7ODqRvJgj
	gspW0qNK4zE+4u/ghe+kkteBNMB/oG7NLhJyGjwK9LdWmMesN78fthJWs3A4KPeW
	FVkPdQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8hytrhjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 05:20:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eb18b5500so98788a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Nov 2025 21:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762406421; x=1763011221; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RbncP33QuByCSLGI1byB0rZspAPVjU3fy2uppZLE2jY=;
        b=iI+84VKIrh8IqahF7KUkPKAhaHyboKpLbFxWDgO6vTw/h+70c5yCGBlicjDLlqBVBk
         XI8OZxNEh56hvdcKOjoAfvY0vyoa92vO4xLwQx7Up66E9ExmJ4NF6Lql9nKcNeqpoi0c
         KYpgvx4HSKBFzns7aRrvH6Qg5FcgCUCXM5Sm7e3g5v12R2CU9RueDOGozucBnhSR4UBO
         1Ohi8/doQZnOpUzrGb0k9dSYKq3UUsz0UFtOd6i7CfoJDyoN7TtKSxLLI2BMMolBzfuP
         gPWMvCtB+gvy0TbxTAeC1HdU0FpDweH6SUHJ/GHgN0D1fOyT4ZU/tweWjun4xxKldG10
         rFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762406421; x=1763011221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RbncP33QuByCSLGI1byB0rZspAPVjU3fy2uppZLE2jY=;
        b=CLp2zk8m/JO62vxeUfS6i/7g/osp8nwnC2EC4GDDDmo8WGlTa8JxLhm1YTKdzjStyZ
         rW5j9rCFtlPV09GiC9S3QfBwpY0SEr8aSIZu8yCDgdydVtvubh09ZluJr3dGJAS7Yn3H
         IYS2459472pMVTXRU8LYjtbEkeBqCMnLuMQwT3s0nhA0Bx7PLQh5yk3TbDAI1d2G2xRb
         9yafbuJHbVdJAagUTZJaRWehBYFKPK2sRh/jKH+xkeNNTfJBNTUgojHOJxXvYxyPOgFT
         Qbli0zsHwKqym+ogLDR3BFDZelaXiT+FrpRmZQKXkH1NufuN7YOcsCAqn3ADk3askNCS
         PY3w==
X-Forwarded-Encrypted: i=1; AJvYcCWCXdzby5zmlA6cfPx4pFSAwwlQJ8qd2aYwd1zXUnHKTyDSNSeaA1TE/A/PNBZYZ5E2h6UMJC+ThDWGEy+qGJIh@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz10jx9bahXVyelwwU+Tr4Mqmhe3lojFm8zKXDVlZtU7PHmvLO
	EPnNXjVDSaY3Tb9F85gtBmJRWpz9yutDCsZkoN0IrettPf0A7jhUZ5yQK0dVPPNKwGpUtpWqeof
	HvEoc7GAYsVOvD2VSXe+rQBWdCfyw4v0NEfR0zMhGpHkYMa5k6JzFcIJc3pioCokV8861Ai7Fdv
	9myQ==
X-Gm-Gg: ASbGncuCql8Wb6eflASMVr8629muC54tOcSn6siO76dERcQvmA00J08oGZ2afgkXtBR
	n0K1CeCe/EtP6Iuhj3i1SoPfLRB2boIcnK1yqtKOHhM4i9CRcJJsTI2e/WsdQV90ziFgnPy3QQP
	7cyX1ZAp+S2xQIzyS4XDjfsHme6X++letUZvR6PnZEA6eTbgw9qaADBWmH32nowyj/n4Kgr/xE4
	TOGCp7khJ7BwoeSmzdKrw+QJLgLRFw7MepobLFSth0QowYeS8tTwbv5lgySZNpI2TY9EXbpmgct
	uj8KJ2mCMAKR2P44jPmj+c/Jo3GL8b1SjX1c8m+NpRyhaL5N2GnGu4cZzbP13VgiMb7mGwWwh+u
	BJT/xLcKiYtBR0MMZbBSL8eJOdeswkCGUdxde9rndfPsgfQJRlicCGtQ/kck0wmN+
X-Received: by 2002:a17:90b:4a0e:b0:33b:b453:c900 with SMTP id 98e67ed59e1d1-341a6dc3ef0mr7716785a91.19.1762406421345;
        Wed, 05 Nov 2025 21:20:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEA8v7A+ayync/726jkKTD5KYJxkRhenVh6tscIPPHnasEdHKYvxouPnrmMzhPLa+hczUysXQ==
X-Received: by 2002:a17:90b:4a0e:b0:33b:b453:c900 with SMTP id 98e67ed59e1d1-341a6dc3ef0mr7716756a91.19.1762406420807;
        Wed, 05 Nov 2025 21:20:20 -0800 (PST)
Received: from [10.133.33.139] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341d1347db0sm535859a91.4.2025.11.05.21.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 21:20:19 -0800 (PST)
Message-ID: <cfc7871a-73b0-43ca-bdf0-bcb8b5f17396@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 13:20:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] coresight: add static TPDM support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9Diy87Uxq6qOhj4SqkT4tnPbM3VliCGX
X-Proofpoint-ORIG-GUID: 9Diy87Uxq6qOhj4SqkT4tnPbM3VliCGX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDA0MCBTYWx0ZWRfX73S0OQNuStk5
 QQLXX9q6dfSGqixzi0iq+g2Knu/NFJ+JI1MByrzcBcv8F0/DJ1fzDwv10HHpl9W4T7GuaMjUsF8
 SpNcQ2k8IFl/Xsj23fgYIUxO5vB2zs4VP/HmTqut2zrKvDqfyyNDWcf5QfuO6FhwfltGKyttMXw
 BoxmKceszZ45aNtEvzsPKGEWzgukq8O5eftO8i4yCr0PD88PFpycXedaAHP+tN/U7zgIdooC3qq
 2Wt9fnp4gdgjHAPehbXSr2PK3W0aP19Op7ebQucyWdXWQ9CDhAQItDoWLkmb1eS9K98H0IluILb
 scX3k61cAII+Na8z/hRMVCbH+eVEow//PW0qCqXjZqxM3qgQeSywHA8TVlTGtdIizxTWdL+JvW0
 ck6IWiupC8bsfm5B3tlXGe03AbkOOQ==
X-Authority-Analysis: v=2.4 cv=X+Rf6WTe c=1 sm=1 tr=0 ts=690c3016 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=43WlQIeRwcEhdZomQpkA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_212023_072686_CC0C9F61 
X-CRM114-Status: GOOD (  20.04  )
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



On 10/28/2025 6:11 PM, Jie Gan wrote:
> The static TPDM function as a dummy source, however, it is essential
> to enable the port connected to the TPDA and configure the element size.
> Without this, the TPDA cannot correctly receive trace data from the
> static TPDM. Since the static TPDM does not require MMIO mapping to
> access its registers, a clock controller is not mandatory for its
> operation.
> 
> Meanwhile, a function has been introduced to determine whether the
> current csdev is a static TPDM. This check enables the TPDA device
> to correctly read the element size and activate its port accordingly.
> Otherwise the TPDA cannot receive the trace data from the TPDM device.
> 

Gentle reminder.

> Changes in V4:
> 1. decouple from tpda driver code.
> 2. Introduce a new solution to identify static TPDM.
> Link to V3 - https://lore.kernel.org/all/20251013-add-static-tpdm-support-v3-0-a720b73e83db@oss.qualcomm.com/
> 
> Changes in V3:
> 1. rebased on next-20251010
> Link to V2 - https://lore.kernel.org/all/20250911-add_static_tpdm_support-v2-0-608559d36f74@oss.qualcomm.com/
> 
> Changes in V2:
> 1. Remove the dependency.
> 2. Collect tags from Rob and Konard for patchset 1 and patchset 3.
> Link to V1 - https://lore.kernel.org/all/20250822103008.1029-1-jie.gan@oss.qualcomm.com/
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
> Jie Gan (3):
>        dt-bindings: arm: document the static TPDM compatible
>        coresight: tpdm: add static tpdm support
>        arm64: dts: qcom: lemans: enable static TPDM
> 
>   .../bindings/arm/qcom,coresight-tpdm.yaml          |  23 ++-
>   arch/arm64/boot/dts/qcom/lemans.dtsi               | 105 +++++++++++++
>   drivers/hwtracing/coresight/coresight-tpda.c       |   7 -
>   drivers/hwtracing/coresight/coresight-tpdm.c       | 174 +++++++++++++++++----
>   drivers/hwtracing/coresight/coresight-tpdm.h       |  12 ++
>   5 files changed, 279 insertions(+), 42 deletions(-)
> ---
> base-commit: f7d2388eeec24966fc4d5cf32d706f0514f29ac5
> change-id: 20251028-add_static_tpdm_support-1f62477857e2
> 
> Best regards,


