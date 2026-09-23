Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDD6C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 10:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdm538hJDBEeOtB+OYg40rCG/usyp2101S2xsTzwFKE=; b=hGHyiFdn9V3GDMHlVF3U00z5c2
	MjCYElihPtUM9iIqi/oMUEOizZ1+0QBze5h6EDgwnCUR76oZARkVGxywoyXPo0KrYxkXIi7fs5usa
	fbaBuQyG6lneWCZDBgD5LdUoZH7KEoIDxx8mD/yNXaZ8M/OxKQjLVPfX+57UMbxRti7DxL67cX+cZ
	B1zRYDBnl9tfDS/Vg4gPzHRLoVX8vN5ZJX7b6WWhnZv5o9u7Cvz8CBBViWXwd/QYq2961i82DeD13
	/xaVg24Ckl0GvP53p2w8uQzXIbZVBxWJQeCqIwgrj5APS5w0oearAQOt4SXx3KgBfXCbKBdAFjTUT
	U761LpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KS4-00000007vmr-13Dv;
	Wed, 23 Sep 2026 10:43:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9KS1-00000007vlm-29QW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 10:43:47 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA30Wc3936232
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 10:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tdm538hJDBEeOtB+OYg40rCG
	/usyp2101S2xsTzwFKE=; b=djR04gIia4FrVZw0QUhpS9gvO12DqiZtxfId+T5a
	GRD/kg2tk3szeGR8uzBHmfUwE9Dt3Otaso7Lp7DEpIHMaP9RP/yKw86cgf2v4PS6
	+I3TTC31C9CUk0284C5NpVdyM9vDLwR+A8K6zh72VrzWXtOK4Ai0bhftcrlQyV8n
	PaR4QugbjTTwIv6c1gneLUS+/NmwXfc9/CNnf9xflXh7hs1kyPzKJklcrZPi8TKH
	2SQ4zY/cwvwlgsUU0FMPh0wN5UOJ7pMsXq7DHYqgb3+G1ciwAyt/Z49M2krIgGHL
	JUIMW/VhPX3XVlIpVO5CdBN/BZKD3uxOuyZgG5G+nz1J+g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428targ-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 10:43:45 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so1041679c88.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 03:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790160224; x=1790765024; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tdm538hJDBEeOtB+OYg40rCG/usyp2101S2xsTzwFKE=;
        b=EEnuvmGp8WNOGs93x3MtIBCvX3AccK1il8qdSUiOBAtwjiiu1AqrIed9erVV1fybpN
         7ipTeuIQtej3mkkv7xpwefzmkC5pr8DVyKKAmQDuuWz+RO019NnIPToFt8A4otEpiCKc
         bO7uldVt9H4lGpiVIJPbc4YP6abaHQdo23UgQq+jNnfor8rbnQIqpFAHKrkp3DJ1GRaD
         kB13I4R85VjqLbLDJA6fLuZjxJn8G/jG3gE8G9ZojSbW/DE8X/EiIZCDhzre2QapLHt0
         njIDkbKcx+98WRKpP1QhtYdkhRO4+H0y+OCigg0qHqOgqNHZdwpCFi8A7ofMlfYswX8y
         1DPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160224; x=1790765024;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tdm538hJDBEeOtB+OYg40rCG/usyp2101S2xsTzwFKE=;
        b=QP/4qJXUiguxFCz+mp/Wh59b4eimtgkD2pA47oHbPRYftqETiuUs8FvzN8ZJ8RPJpT
         ZBr9K7toeGQFu9mW4ukL+uNSLMNwZS7Scv7xkKJ+izyd0gqhxq5hBEhapFM5rij+Y1z+
         5wshbuqXBNoZGoNzncgZSjV5j0aoBlE7uDdzEPwjgyOqOf/kVw5b+EsfYopozhl0wdif
         Jy8cCCv65v3izPCGWlLFQcLqSBaJ2mQUhQ7HWjunHkWHJaVyH7YjaqeiFGV4M/1/UXAL
         IUdPl6VOVYFOHapiu8dwo1cUl0TPkpnSXpZOuOg5eFrXLeRxgHjZceiFkD40HKTsuE/7
         7uGQ==
X-Forwarded-Encrypted: i=1; AKwUvBz+IrYfZdBUBtb4TxaZWFnD/hKY+nWON5OFgHVpWP1HxHxncCa+v4SiTp5aaQ9bNgmRtEdqzRR6iuI/gJ2YR+PY@lists.infradead.org
X-Gm-Message-State: AFuF++mC/J/LvguTNQTqyxIAzWXT0Qt8hqUCyo2LU94nfwXZAVPYP3QN
	BvE8ap6sFyFbIKVBfHx3RcSmqfogL0gQnRDBAskRtJ1H9AeVMWjTp/wB/0YnarRJ7jDQ2UD57Ql
	hBZzMQbRguOn0kGK9ZiFGrDDlqn8J+/+45fQ4H08aIiNw03H68piWBSBSRaVYjhTz9ZiFmzgOcs
	qxBw==
X-Gm-Gg: AYBFou3hdWE69dnZXQeFnVlQX/qfmRpR9MZFZGYIbCwBWvqdoqU+YwyrF8pu4fWbnpr
	gFifWxIAmLTxfZCDMnHkqmMyTKL797vFG3DeuEQy77bGatIGlSQPiUkrsBtkJyfuD51bpeM7jRW
	0gBbFZSC6Gjdl2xmxtWw8v57RlNs9o9muUKlxTjr3LWT5TJzmnJPOZIyNBXXSvCKu/maHLprTIv
	uXJ6zYV+IjnfD+UbHuMESuh4CKr3TfCu+SfKyqGyAF4L9V3/xsDsixM93178eLjUXZCIGITlAe9
	5hwKTPP5O7Jv9TOZhl2gA9HYaWjgUoZGQc+FUt5yt0JlBY6c5/zjL8cerTYZ2+NugEYefl9KSxu
	57Oz7Ll6DjFcq
X-Received: by 2002:a05:701b:465c:b0:144:eab0:8373 with SMTP id a92af1059eb24-144f91598eamr2150589c88.13.1790160224163;
        Wed, 23 Sep 2026 03:43:44 -0700 (PDT)
X-Received: by 2002:a05:701b:465c:b0:144:eab0:8373 with SMTP id a92af1059eb24-144f91598eamr2150572c88.13.1790160223468;
        Wed, 23 Sep 2026 03:43:43 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9820ca5sm6285226c88.3.2026.09.23.03.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:43:43 -0700 (PDT)
Date: Wed, 23 Sep 2026 16:13:31 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Coia Prant <coiaprant@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>,
        "Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support
 and add Nord Ethernet plumbing
Message-ID: <arOtU15iv5CWPUEu@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <5135e15d-b6ac-476c-9a7d-b7d64e4eed5c@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5135e15d-b6ac-476c-9a7d-b7d64e4eed5c@bootlin.com>
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab3ad61 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=8AirrxEcAAAA:8 a=keUjBhY1HaWyqSYI5lAA:9
 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: BjVXn0XT31BW1026-3fgRXK_mV5ELFC8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MiBTYWx0ZWRfXxw40KaGz6q7L
 pRWPlOZR0xehubLgDAB4GPYKBim7Fl08gYsqPiu6xaJK6f1z3zkFPHLhcH+Pm/SJSgGB8w5xBOn
 YTgXZLq75qkvjSyWqAd+8kRwAT8H8Ai5CgyhalZRdOqwoTRvU3z/ZGSJuVmOsHs9g9ys7mHMYfR
 MapN6+dKr2GaHo6N8CrJuB6qyH2emjqtFGcXI7LGKqkHsoiEi3Zle0xMe+Gt93dSi+Qt3iZGmT3
 L/32hrfUERUjUFt3rBIjxRcHBvvMhFO/uFfY9y4bkuOmJqEMfWfOqjWYlYabpcu/+uLkRF4UOy8
 PQ5WgODGcQKGi0xVqHgkD1vLBdXVcrqCWpgC7b7QgIvH0mOXlgXPN7ZmLTBeLJppSMN8KgXvCDu
 pxkx24ktFZ3AG71gsBsgJfoiPouu8cnaZLlUeptl4iskUGV9uzDh9XRM49KlREkfiwshqXhz8zc
 rK9iLwkp6cGbKgSEvUQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MiBTYWx0ZWRfX9z296N7weL+X
 lwKcEs+jBJ24tBkS5EmC3c9HV7BOFo3cfOoe08C6rzj/7EOOkv/4OUlX6F0ANqlXNWzJnp3hCC3
 qlCfhXX1pVu3e3hV/+cbZ7wpk2FTU6o=
X-Proofpoint-GUID: BjVXn0XT31BW1026-3fgRXK_mV5ELFC8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_034345_556052_7DE6E36B 
X-CRM114-Status: GOOD (  24.12  )
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

Hi Maxime,

On Wed, Sep 23, 2026 at 11:41:14AM +0200, Maxime Chevallier wrote:
> Hi,
> 
> On 9/23/26 03:07, Mohd Ayaan Anwar wrote:
> > Hi,
> > 
> > This is an early RFC which adds the XPCS and ETHQOS plumbing required
> > to enable 10 Gigabit Ethernet on the Qualcomm Nord SoC. This is the
> > first time USXGMII together with an external PCS is being supported by
> > the dwmac-qcom-ethqos driver.
> 
> There are currently 3 in-flight series that adds glues to DW XPCS and stmmac: 
> 
> This one,
> The Rockchip one from Coia [1]
> The S32 one from Jan [2]
> 
> 
> [1] : https://lore.kernel.org/netdev/20260922200336.2201212-1-coiaprant@gmail.com/
> [2] : https://lore.kernel.org/netdev/20260919-s32g_serdes-v3-0-9d68868c1e89@oss.nxp.com/
> 
> MAINTAINERS entry for XPCS says :
> 
> SYNOPSYS DESIGNWARE ETHERNET XPCS DRIVER
> L:      netdev@vger.kernel.org          
> S:      Orphan                          
> F:      drivers/net/pcs/pcs-xpcs.c      
> F:      drivers/net/pcs/pcs-xpcs.h      
> F:      include/linux/pcs/pcs-xpcs.h    
> 
> It would nice if some of you could help maintain the core XPCS driver, and make sure
> these series aren't stepping on one another :( I personnaly don't have any XPCS HW
> for tests.
> 
> You don't have to do it alone, multiple people can co-maintain that :) Maybe
> Synopsys folks can also chime in ?
> 

Thank you for sharing these series, I can help review them based on my
understanding of this IP. Hope that helps.

	Ayaan

