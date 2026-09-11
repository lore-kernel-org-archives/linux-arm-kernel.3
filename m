Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA4AC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 14:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uz25G+qDafHaYTcukJB4mX7gmdL4Il0RlndYwgEhWHo=; b=ZA7k93q4zllHa1m9jP8cVTJSGT
	2FBnUGNtnKwXgIDh3GTuFnR8xT+v1Gk8qWRxopGlz6C4uAxPkQb6Txdd6ghjROp6YZ9FZfPO6BmDt
	ry98d7TqXSnm1wBVi9uKSjz6VCq1AeqbNxKcEFVBwuBu06CaaTCiWu0JJKgig0hTjFggKUdFilBu8
	9h1MSo+2uUTN/h5mVwXt4gvWOk6kUc1wegcWrRA3VCjS8RpOspCuk2lQ/bOBFJPaAVPv98O5SKHT/
	ncNzlG5wjVTT3YfLIeEaaeGcsJGSP8vkRMs9g0UO57KVENS35cpqffrVcDigtfWmu1BQ/y8QbW+ey
	8ZxPqjnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52Ch-0000000GuFz-1gIT;
	Fri, 11 Sep 2026 14:26:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x52Ce-0000000GuFf-2az8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 14:26:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCjQ674041138
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 14:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uz25G+qDafHaYTcukJB4mX7gmdL4Il0RlndYwgEhWHo=; b=m5Ej9IudHnxlIbJp
	CqMiKZ87K0v0zFULFil/b6+JHUJQashozqlLTCGFTnEdGqz9YVLWb6vPxGKQb0bJ
	nbV4Xd5L2NSCchk7ojPnkY4ysRnL4vuVy7x+C18V/1PHXFmW3YTx652qAVa+IDep
	N+WYnFQ9SRqfF4xKkeL1hMhRIWphax89BMoMYUK4DbhfHYRY6n5fgZQpwne1wK1I
	qkFBK6AYX6QEti8kt37E3wzjUqvxIcXWRM7DOmW+6yYNe21zQNP1iG7vpTsxef2T
	UoE1Apj9rO7pT5LF8kzVZ/SjAGaxQHbh9KOw4aoAPi7Lo8u13Np6rcshLJ5usaH2
	0W7mWQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2cau3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 14:26:06 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-77f133855b9so40405137.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 07:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136766; x=1789741566; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uz25G+qDafHaYTcukJB4mX7gmdL4Il0RlndYwgEhWHo=;
        b=DI/mJiVLx5nQC48EoDV46+UDMEwU7Uf21KNZ/fNSyHULnfzPGnWPdK4sFJ4ubS/u0w
         FA/BcahvpVpOC31yh8l5FHSVNLrt/cxjjREgYR5bjf3pPHamyccQsU48k3c2UY1X9lnK
         Z/L+hnVXJRVdb1spwb2EK6JcTpmwOIVnkvXsW+nukGgHN55YUo+dIGRNoV1hsXj8vIj2
         Rjz4FpnHN9yZSkwi/bBGXeXY8TVwsBZOw2aOYRGWUJbpXFLfnqzvi1CX5eH50ILCfqbF
         URWq1NiNb0BYQ9DmTeifRH8HAB7IqYauC5+vZOx8XVLKQUDSsp4+jW9PJ7YTHx6OxZrr
         rloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136766; x=1789741566;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uz25G+qDafHaYTcukJB4mX7gmdL4Il0RlndYwgEhWHo=;
        b=fJ3Dg+RBTitbrjT0wQ9H7pNWC3C5b7BPEMR9UDfOZ35H+bYN4S0ybRel/TpR4XRziH
         QBet2TfiXfw89WYKT3X1N+fZzCnWMe/obrRBLtTDIVuQx6tBDcKwmx9OHLuvPBhF7A+P
         xUwvJxWmgO8VqfHDH2gkfcbQkRUUaw22R4XRNSfUIAQUZJiohYSvZEf4EkBxMygy1CUj
         g6CK4Z1gvXo1+wVdnvs2jfnm/6Q3zieBhXEf+nCPpqPI21xOncfukPUtvdA5tDwvOr7t
         8bzEqG7KE+r2b721xRDko/xptT06837Fsm9vxmQP39WZqnnPpx/BvVzwBokiYd5Zby6X
         yPSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxx9ftdfE9wFZsNyEPN/UV9vv4J8A0/2UsvjCajisiiwycwaUQDH2IgKLKs+1cJO2XV+1B56hpm0LGKPzhMDofB@lists.infradead.org
X-Gm-Message-State: AFuF++nYzhAy2WJ57nuDbdoZFPMTX1TGfiJ7I553XJeaYBfZ0uzZ8Y76
	GJVDG3/XMapURsUZtUKJCSQt52AGfTjvOYcf9wFeviRkt0hkJeMCL5pUsuPiGqGNRlW5++/vDsd
	sTFyzVQS+ClmtEwTafiQs/195dvZCguW5hfEDDn34J60ufPz4eg1+5uEKe/sk6Hk9UKU8qBwp/9
	6+gg==
X-Gm-Gg: AYBFou1zK0WBZYg5NVbW0o7d0qmnG1Mw4Rkio6p0hk266OBLY/J6cj6h0+tcxhturAo
	kydhYKmHEmoQbpiCnSFLALSKrBRz9JS3hG49HvmFVksTaj/cK9GATv8XuTwnO1hO3rBnh3Nv/8Q
	pOOszd/CGfGXQp+oS9VpOiKq8V0oFKE7dGRet8ElZhk7PvCQEgCzFZw7ZuqRBJre0iRN2vRU732
	uDu/yqpgQzwKVhA1ZBVTnrNdmSneIU4p01UG+LOMF6YJEFnc0YQiNhGOMESIRTWwcHGrjQ0exJs
	+wshIw/7VTKmGicDGbTJJCo42tB/SbU5O55b60sdaJ/xG37OxuWaGbtBsb61PM/guyhD6Qs9rjx
	mUT87dRjU0crH+JmTfekf1g==
X-Received: by 2002:a05:6102:41a2:b0:791:33c:9d1 with SMTP id ada2fe7eead31-792a6758b54mr1275626137.1.1789136765737;
        Fri, 11 Sep 2026 07:26:05 -0700 (PDT)
X-Received: by 2002:a05:6102:41a2:b0:791:33c:9d1 with SMTP id ada2fe7eead31-792a6758b54mr1275573137.1.1789136765193;
        Fri, 11 Sep 2026 07:26:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966021d0dsm86105266b.10.2026.09.11.07.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:26:04 -0700 (PDT)
Message-ID: <04e79cef-bbd1-4f4d-a249-f040c7e33435@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 16:26:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 9/9] net: stmmac: qcom-ethqos: add Shikra EMAC
 support
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260908-shikra_ethernet-v2-0-bbe3389d0652@oss.qualcomm.com>
 <20260908-shikra_ethernet-v2-9-bbe3389d0652@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet-v2-9-bbe3389d0652@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa40f7e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=q6PzOI_h-AFGYkee8UYA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: ps4kFS788FpemfSHEWVuvP_2Z6g1sZrB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMSBTYWx0ZWRfX96yuGMQnejP4
 iUzqOJsmKZxfB4qNoRhUnEL7xCkJ2PLcbQrt8gYNVMqk4pgaL5UaBeJvMLXnmwHbK3tG2BADtFC
 GbMewM5e33O7k87es3gMBRglXtzWojU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMSBTYWx0ZWRfX80d6k2g0Hb7L
 IdCDaxIWZaiCi2Gg0IXvs/mYt6O6trwoVSlcwU4aKcz6a1LZIURHeoIB1NWgTLk6m8lXN5xejTw
 TDwFtGrmpq8U0u/V0Twpn3GuYXoCshpe/UL5iyCChorJy30nmNO7s9BMDJBCMahXVtw4SIhLgwr
 NPSAw3/LcOOfp4cyp3hR9wur3alI/RiJXQ7F3t+DCHgPjq0yCmf2w8XBfcaDSiUscq4xcdyLGca
 oh0imcHpicA43vdZf5l/koMXvEwf6eFgc6gi4+37LMzA2BS6nN/VYrh1mcrhIxQ9tDzH4ihWZ/9
 Xl3ws/gV9vlRRFIuf7l8aO9fjoOixWeE19UzlzS3VQtD2yDA93S6qxUDaktxHcPrSvB032p5hKu
 IPsY35SYyfnLLw13jiYBz0HUDrF8o9DOjE6lvBHzx/ePjcIZeP8zNQj9kpz+MfHd3wqo0lIZZ0P
 i9WjwOQ6dO+ql+cf5Vw==
X-Proofpoint-ORIG-GUID: ps4kFS788FpemfSHEWVuvP_2Z6g1sZrB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_072608_781261_BF2ADEB5 
X-CRM114-Status: GOOD (  20.94  )
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

On 9/7/26 10:23 PM, Mohd Ayaan Anwar wrote:
> Shikra integrates two Qualcomm ETHQOS controllers based on the Synopsys
> GMAC IP, similar to previous platforms.  Register qcom,shikra-ethqos
> backed by a new shikra_data descriptor that enables the three NOC clocks
> required for DMA memory access (axi-noc, pcie-tile-axi-noc, stmmaceth)
> all at 120 MHz, and the 36-bit DMA address width.
> 
> As part of the NOC clock voting logic, the qcom-ethqos glue driver takes
> a second enable reference on the "stmmaceth" clock, which is already
> enabled by the stmmac core. All three clocks in shikra_noc_clks[] must
> run at 120 MHz for NOC access, and managing "stmmaceth" through the same
> clk_bulk path keeps the rate-setting and enable/disable together.
> 
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 31 ++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 8871d285941162c72e2a8f79d2eef915d9283796..c474f1e5a043777a52bcbff8a488640f6dbdca30 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -328,6 +328,36 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
>  	},
>  };
>  
> +static const struct ethqos_noc_clk_cfg shikra_noc_clks[] = {
> +	{ "axi-noc", 120000000 },
> +	{ "pcie-tile-axi-noc", 120000000 },
> +	{ "stmmaceth", 120000000 },
> +};

Can we please put this into an OPP table, so that it also casts
the required power vote?

Konrad

