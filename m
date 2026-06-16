Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7840ACD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 16:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8jmCjdOTgQQP3Z1ADzlmkhEZtRTG+VtASOwyDTz8jQ=; b=tgWJkEkP4ak7reKk92JCBg2TL7
	j4k5c+unqG2lqUWHkZaESxv9LR1Zi2j/iSRubw7qNa4s99oh1n+3+Kc9NCQBVD5kzh5KCw7JT41PM
	Y16895sPiRHYOjIFq2j5PbUDpg19YAlN8TA1SY0K9VHBvwj0N+wj23jYgE21nqZrJjX2so8dLyZ3L
	ss1RtWoEsM6jN372vhEORTnQi9vW+TNzQaAnyA9MnAHqLc1Rr6b5EFY4SMt4+I6+7RdD7uq7SE9hc
	UX5iinPuzoWebEIoSsoI1QM4KPsIYRnIXUBjjz+cuG2da4yH/1805S6Gw66bYx8n2JTvERcHXwt8O
	sdkI0Rcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWTj-0000000G5XR-0stO;
	Tue, 16 Jun 2026 16:17:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWTh-0000000G5Wp-0U9G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 16:17:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GFd1S03641353
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 16:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=k8jmCjdOTgQQP3Z1ADzlmkhE
	ZtRTG+VtASOwyDTz8jQ=; b=gbta7TdUF6RhAfaKwmB36JsrXQPLO2pBds+OD6d9
	nKHaRAyIgTz7NxxeT4kAsQUIJCocUvOAmgffkmvki5Q6VI3Rd+b01RToTZqEVwOH
	QzNgjWF0gFkGKynJEPD7T9WeZ5MzyA6jZlfwswj/hacGUZrT3W70KTJ5cxP1TdwB
	+WViBjJ4SABFJVK/UPel1wBy3EP2/sYRKCZA/OC31JM+a+tKMjwRtomKGhB7EY1x
	tKjpS23Yf3gAdmBq6ylx3pkJ4U5UA6EwHvo0b0yPfS6mV4lDSy7z5Z88WS+H7JOS
	Zl/21WSpfszSNfTgUfKo44yX1wJogqbhzxT2FC6yj9xGXA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu253jc76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 16:17:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36d98b6f019so5143544a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 09:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781626647; x=1782231447; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k8jmCjdOTgQQP3Z1ADzlmkhEZtRTG+VtASOwyDTz8jQ=;
        b=VquoIQBfaO/shUSDprVsqJK2PNzqunm6b5mBJ5kgf3V7V/8O9weKw34H7e/q8EVG3f
         TovzNkXxv0ppLkIYvuursZkdj+2rrpmto8P42YcBOFq/u/FZrH43PaHlKvjPyHMkPCAV
         FL4EIPe4D9T30PJQKOrLii8Fznu67Y3tR/qjB7U6o0fKVkAwRfvg0vpmCYJoaT2lUl8m
         K0CxNT03pPl1MVZmOqQrptmdOZmcvnDjpgWYANHAcT3fdinWyuaRSyHTnhPFSlTHZs+g
         SremM3i9sxOH6siXVS4VEuJIe/FI/QdrBl7fcgq20dRSqehQvPC7M7xioJZwsKJ2n+5o
         I9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781626647; x=1782231447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8jmCjdOTgQQP3Z1ADzlmkhEZtRTG+VtASOwyDTz8jQ=;
        b=ITFN6Qf+3IkfQkY1ZPyx2VPgViUMH5vHzpn2oPiRmQvu74ruV051T7Jih6nCXCckLo
         rVSM3/NC00xnhvRsLv6e6ay3MeIE+YQ5Zmrca+u2SS8g5VQOM+AVafKqF0z4Im6zZy4J
         nd+SAN43R0jIWjVgXfevTmaoSS1XtCnrLwwLb90POuf82DxUJMj1GldHY0X8TnTGad23
         wsnQ+9oxq+mkhWCUsmJ/I/FVjseuL+u6pXynY31oyw0v4V9kJmSZAXMNFeW4xr+6/cs1
         vJP0TwhScSecXxvpzr2/Wi0OH7lHHFrA4uzl1SzLh1IN90oKQOFoxkS5VUA64rcAxEo2
         M4pQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Jg+nwTsqh0y3+0mnXZf6i6N+W69iddeOravDD6iW+e4gjg77EYfU5JQS8gFtwaz9DvbRfBxJouthLmiW9rPwn@lists.infradead.org
X-Gm-Message-State: AOJu0YwpoLpYx1AfrmDyiR0GC+VaxpeU7BAST6p8tBXzxmqTgjolkKO9
	rhk33xJLMe5AA6K5ZbWviOpKBP4EhQqFa4vDUs5TzXPS+30OuHpzeBV5KSnBHph0BiajuhTg1MN
	bk4w4eNVx2xo4i016X5JopCaD9n6fZCYALScuwj8Kv679ZnyQxENdQIrIt+K+RQactr9pgKCujE
	IwTg==
X-Gm-Gg: Acq92OHeKaqnIIB0uj5Fe6XVRA/bGz14oXKfYnX6R9Jz9bTImCoiTjWzquavoWfUz62
	dzEXP4Maj2Uichbno4dU1oO6Zq0XTqolBxqkBRv7F44vQrH3vnG4VlxtYSE+4rJI5m4KNcK34n7
	16hoC2X1mKlTGgS20jF+Oa5Y18glAZLGidRW/BrPjofbjINCS9/m4Av3UuEv7w2mIjzteotWJEu
	BSfyUsoqqZaFR3kNMMQlurNEGUWbuFB2HPbpKknJNJMdJORL4r9QCcEk46yJl/+xdtShJEynOWW
	qTFpWYOT2of9ZR+4QdQwuAELQX43Cy6BbJaTiZgRi0ECkl/FgH/QZ7d3/0ahkt3hScBg0dt8Z8z
	TKAUkiDgbllgWl7SIkX+lFbzfSc467GqjvMs=
X-Received: by 2002:a17:90b:4ac7:b0:368:3d3e:efa6 with SMTP id 98e67ed59e1d1-37c93969a18mr139691a91.20.1781626646570;
        Tue, 16 Jun 2026 09:17:26 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac7:b0:368:3d3e:efa6 with SMTP id 98e67ed59e1d1-37c93969a18mr139656a91.20.1781626645979;
        Tue, 16 Jun 2026 09:17:25 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661a67603sm12281484a12.0.2026.06.16.09.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 09:17:25 -0700 (PDT)
Date: Tue, 16 Jun 2026 21:47:17 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC 4/9] net: stmmac: qcom-ethqos: add per-platform NOC
 clock voting
Message-ID: <ajF3DUGYPBs1iU5f@oss.qualcomm.com>
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-4-f0f4a1d19929@oss.qualcomm.com>
 <45d7faac-7c0f-4f89-808e-06129e8420e4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45d7faac-7c0f-4f89-808e-06129e8420e4@oss.qualcomm.com>
X-Proofpoint-GUID: 2Vt6QUD0yaY4ZJ2R3aQeZF5Tj7n_L-ik
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDE2NiBTYWx0ZWRfXwYHBOWoSKQJP
 rZ9Z+yYkGSZQL23AJi4U7OL9BrTVjLsqWSKvjUwegebpWsjwxKJxKE+9UB71o9pw+9keMzbWXb4
 0qDXUwXYmAx8mVo44YdW5lc2s706G08=
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a317717 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=267an7I0AjvZusCT9TAA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDE2NiBTYWx0ZWRfX6rpAmNCuS+hO
 qTe/OXA7XNVE7/pGuZEVjrGgt4Qu5wzfeLVzbgSOYNJjSRHV2sASMB+OIQZMtONJCeWfOQO+EzH
 MnHQBmLoB8+dWUl+alPj00ZOKJx78gAEBtegReB6wIvRsXC5FaJJnzE/J3DyH+SFujlUWXUo2FX
 MYj20kVeywYZX/bjMG3nOOVylfx5LyxmZRuuslyJD/csBatwmZlBfNF+1a5FuY+unmj/DYxFUhx
 iQ/nvNl42vxh9K9tdtmHYDqnF0NgG+KtmTBD2bXH2M2JEwk0b1sHYXCabKTxsQHJE81mzjFSqJ0
 Ww8at6OUTd009oChMAVMc43iupk4ZeOb7iqPFUAhHmRHfJvLvQGmp/FDdIO49fFm532wNWcc8TF
 cICSCdH6BB8yDf+qRPDyHROhDvmxEekOW7d+LZpjVPjIFGLdIInBs9Qhn0WfvIphyrsvQ9r4swe
 5jqfN4zt+arLLRwF4GA==
X-Proofpoint-ORIG-GUID: 2Vt6QUD0yaY4ZJ2R3aQeZF5Tj7n_L-ik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_091729_156232_84F4CE02 
X-CRM114-Status: GOOD (  17.64  )
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

Hi Konrad,
On Mon, Jun 15, 2026 at 02:13:05PM +0200, Konrad Dybcio wrote:
> On 6/11/26 8:37 PM, Mohd Ayaan Anwar wrote:
> > Some SoCs gate the EMAC's path to the System NOC behind dedicated clocks
> > that must be enabled before the DMA can reach memory.  Add
> > ethqos_noc_clk_cfg and the corresponding fields in the driver-data and
> > runtime structs so each compatible can declare its own set with per-clock
> > rates.  The clocks are acquired during probe and enabled/disabled
> > alongside the existing link clock in ethqos_clks_config().
> 
> Sounds like we should use an OPP table instead, we can't just do 
> set_rate() on qcom, as that will not propagate the required perf
> state to the clock controller's supplier power domain (i.e. VDDCX)
> 

Understood, I will test this out for v2.

	Ayaan

