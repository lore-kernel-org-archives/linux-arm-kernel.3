Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E54DCA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 08:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRMO/BIFTS6t5KCadnTGwzkaBkcMRT2kVp1MYvn8vlI=; b=SVuUKXw2JaTODxPwouWlq3wJtc
	EiV4UWtOw42i+WZxRV+s0q5cLS9IuhXWMyynSoQVRj4GRCOK+8xzQoOwONDEyvJmbIL+MkprzIbf4
	DInZoZI6s/N7KLr3yhimXRXmmLJonHuADhBzzZjj4Ca5AkugaKL3TO55wlH6JNEa1uoJK7aAujJpP
	uGf2hOkgZKJHvp2fV+9OBYFidOOhzRo1poWGThFrO9f/Xh1cYZeiV4rNJWlskua8xasYQYiK1mbt+
	xIYgSEW3RDKUuQIOV3VYd2ZGG9c+wku8+ytOi0nSajMKcR2EDaJVT6pMjsL3DIku9pHrQiH3F/gUZ
	Z8F6ze6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENNH-00000001zV5-1GGI;
	Wed, 07 Oct 2026 08:51:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xENNF-00000001zTu-0PxP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 08:51:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jWhT118889
	for <linux-arm-kernel@lists.infradead.org>; Wed, 7 Oct 2026 08:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YRMO/BIFTS6t5KCadnTGwzkaBkcMRT2kVp1MYvn8vlI=; b=U4OpEcQkQIQ4z5ej
	X4PJJ8RUbYDn3oovYkwGFkhHWi6r5CyCyPlzQ/d05CTJCrQ6IKSAfCgYAA6rW5Jz
	giHiRMXWfsdCljgvOd4zpvdcxeU8JHTfljCgbK1WD0kNzZ+4giroSrHf6q3uXj3g
	yEApDeVOHzVf42ENaGHa1nIdV2GZ7zWB2FcQNdVi+BVEhhk/Yeu+bhE2chvvWspc
	k/uqDJtOeQTeQP7fqxW1foOGAbfVOCN6Con/wxoYOxxKrz0zs/dYC6gSwQKknrJW
	y33M3sgngOmOpox9KbL8Gv3+7NiE171C7tRE/1PSxnEDdT6ErsD/Y2oD/VtIo6YY
	94AQGQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc58pv1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 08:51:40 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so3009877a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 01:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791363100; x=1791967900; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YRMO/BIFTS6t5KCadnTGwzkaBkcMRT2kVp1MYvn8vlI=;
        b=BsTXHfjQV50xuSuMFgkpjEECSJkHBfmYKMuV19WzcbSNApUi+mIgkgYl1+zZLDiwow
         cy4NDiG2sJHG9loY1ijeTH9Mk5H6I0dc8s5d3BzY3Cn1fgV6ynF2Q5VTgAM83GElQC8D
         QI5yIftNLVXaFyk5JJ3ZUZWJm52T+CC857cy9VgNjb0Xp9oPml28Ht4R09ZUFUWZBJsR
         rQlUGbvkx+kLZVMWffkjRp2k6C8paaPOt5U8P4m0GYN3FLOvwdrUB6clMHWPkBaB9hCs
         bQ5hePOr13HQJMV1NJB+c+RVNI8x/ZQ/6LuqPxSYMdjyvecDztwOVIs8kI8scoebCTBE
         /20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363100; x=1791967900;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YRMO/BIFTS6t5KCadnTGwzkaBkcMRT2kVp1MYvn8vlI=;
        b=bX1/mV2Rh7rh4hleVaEh7GLh1iZkNc+kDte+inzH5bXVj5o0xCBIUZdTO4XvICnpCX
         O3vPwVaB8p0zxdCO2my8kG60k4q9iNNYGAvp3fQsuoEQCH0BX4OWw0bfoRV92ki8XKKp
         xZDiO0ciEejb2TmVEimeLnUd8b08X4/TIeOlOhEsmTXldlmbrdP5FmZFwgvNlallAf55
         8+Z95p6t6Qxgjrjf/WeJflDgjaF9RUiZ8cRarlP7jAwxXQGEjww9FW592ZHiZPDdpcMu
         jLvoCF5FUTQGQTihJTB4EiaqxSEQ2UT5AjyqlQTC8kNw93vnEERXnE58yEksydMmnTNK
         L/FA==
X-Forwarded-Encrypted: i=1; AKwUvByu69jEEqx0FqbwqjcNbvnCLZ5Q8Izq7OkviTc83BLj4m9vjpiEsN0mow00GBYeF+lEuFcURiYM/txOChJGrzuu@lists.infradead.org
X-Gm-Message-State: AFq9FYL/JA0e2EqaLJL8rsCLygAojKgDsOk9y9Y6lgZfODppWc4gi5LG
	yIgKzbLYVC0g2fo86AF9ki2HtTM0hI19LFmaTOFc9egc1IwEvpLCjccNUzOS0yGPCmI33hoflLP
	Z+PXrdNMnz2Na1mVk55L0Aght9I3oaXX8Es0cUo8rbr6M5ddztVr6EFS+44PliihIoPd68D6CYS
	upOA==
X-Gm-Gg: AYBFou1pOoDQd2QLE0zkk2s8Q2QiZd4eXObs+9Fb5bFXSE8PxuD7M9W712YXtXiW2HF
	rHUTYBAIp9rKPSr9Am/1bOSUvmUe54/ShD5YfvrAF7joLFEBvJv+FN18PYd7W9S5/WK9XSQFJBu
	OQsu1z/8UmVcVow+y2q/86HQYhm1JJ3eBmOcsp7brcocD+y9JErH5i0XsHfiYty/fkyV/kPhcjq
	XyfsCPMJHoJoB8X3lYgYDoboRpnA4praXddCtCC6bqRh7gJk2buaI6rR0niMHyuxzzjpN27DkL+
	wEdwqEX9HQAtN+c5EjtMimrkwP+D1gWbv7nJLrPcNhTOSlAmdpju47xsZ4aopvaHHu7U/7XHUGY
	acP34BFrHDpd9ofeker74e1QX9I1Lm3+C
X-Received: by 2002:a17:90a:c883:b0:3a0:bf0a:c9da with SMTP id 98e67ed59e1d1-3a8a1bbf160mr1409055a91.47.1791363099903;
        Wed, 07 Oct 2026 01:51:39 -0700 (PDT)
X-Received: by 2002:a17:90a:c883:b0:3a0:bf0a:c9da with SMTP id 98e67ed59e1d1-3a8a1bbf160mr1409044a91.47.1791363099481;
        Wed, 07 Oct 2026 01:51:39 -0700 (PDT)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482cab0sm6760885ad.50.2026.10.07.01.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 01:51:39 -0700 (PDT)
Message-ID: <57f068a0-41fa-4986-8702-8fd3d6dc0976@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 14:21:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] soc: qcom: geni-se: Remove OPP rate reset from
 resource deactivation
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-4-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-4-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX7Z0h/2Fw9c6w
 i/cy60FuQ1Iq8obdayPeHvz5WYfXw2XMxmf1nUZwnqRJ9mY0S3PT+K/xwScUa2r6r3T2N4VK3Uv
 GVB1cqmkfLVUPhVCM1WqTN+qkgKDl48=
X-Proofpoint-GUID: j_t2SeSWimFMuFB1qc83tRH5RGehCFFH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXyto2PBrjJUv3
 DJkh2DCOMNQqV5utM2i/0P1d80IulbIwHz+t9uNNV/ZJsUszTW1eoBEfC1pdk1nHJ0VGwr6y5BD
 YzlRNP4eRA994yyVg4aiFTSsqmv3D7+0DocU0tO5+h+7mJgYiDNNaOKuOtlFyeT2cEZkD4mTqyU
 yEs//KD4QgOEG9JsZRFNlu2sE/+V4GV1RHPe9sboGIvMBGaj6h1wJAQBav4/bwWkInBJL4fOZry
 Z80JDhUBphQmnQdg7a8QaR8VrL7idHh4dPBjdyeASmzNFY42ku36EOD3yhBWSE0qTUnO8mBgEDg
 tI3kdC0TFReRtaxQVfWKwUhNvbbQwD+psCZ+lTGHf5Zv8LK+ONaIyrpOXcVnRfsLiMB8EUxGcOd
 6UGIjp63yXDcxq67UuOcoCKkLOqPlZSN71etsVPV88/KLDNsRG9XfbflTaAL1opiimBeRAty89a
 yS7al+8EKA3FArqJEtA==
X-Proofpoint-ORIG-GUID: j_t2SeSWimFMuFB1qc83tRH5RGehCFFH
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac6081c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=9QLVM3U_lBk_t3napV8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_015141_157097_5572CCC5 
X-CRM114-Status: GOOD (  11.97  )
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



On 8/27/2026 11:29 PM, Praveen Talari wrote:
> Remove the dev_pm_opp_set_rate(se->dev, 0) call from
> geni_se_resources_deactivate().
> 
> OPP resource management should be controlled by the consumer driver.
> Additionally, clocks are already disabled by geni_se_clks_off(), making
> the OPP rate reset unnecessary during resource deactivation.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

