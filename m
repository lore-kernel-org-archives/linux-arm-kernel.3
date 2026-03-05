Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DFCF30922
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/N+fxc7FCXKFi9LiVqjU80w7/4CSzI0iBcib2Hltxk=; b=YKmEtPvLXl1xo+C8LkccsDthfr
	wnojxC+HGbdeTqdc+Q/VU6eG0Sv/Xo9JGxTHUhMYbCTseS820h4QFPQ0qsFwo+gfd5cKc/w2LMnLP
	Sj3vOhBq55hXVziT2SZ0rEUHZqszexvQIiCM5JhTkJx6oHhE7iSmB/51FDVlL/rMbnVk6SINuV01+
	h2BkOzuUW2+5h3/YbkqrwwqW9laYkwiaXlUPJsXNapWHrKsaym8jdbZZ9Tn1bm4egdtsXH+A9wgza
	Lk2RlTJmjxl2QbHPfslN9mrPCgHlFjcT3z150alUwHJnA8DIfkhhQ1sfbtvGbk+k/D+G+2MO+RMST
	zBxfg4Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5X7-00000001UT3-28ZJ;
	Thu, 05 Mar 2026 10:02:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5X3-00000001UMS-0IaF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:02:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258fOWh2665108
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 10:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U/N+fxc7FCXKFi9LiVqjU80w7/4CSzI0iBcib2Hltxk=; b=kN+AXckWrGaNHZZm
	jf4xSJd0s78PHX0x5FJWfoVPPXDSDLvHXVtpa+lgGAbrzrK2xS6zVQ8NakKmGYAE
	0Zrfiog2BU1++B7ORhtLrcHsBEwM7UYh4w7hsovbto/u0NFLFW5u93VR1M1Ryyhu
	+WtN6Bd5Dh+MC6fZk97UHDvrhnrAfFmWFS5e43T0BhqqTmPzgVXdfQk+FWZ0Ddjo
	W2LjCX8ckVom4jsE8Gpt/s0IKTv1RVKN1j90DT8bmHL3VDLetzptu6FCsjg4J3JD
	Qcv0QjKMIM88rHxsDoFHi1hX48xX3mdtVErfjjS+AzLxCnX4Iq2Yco8qfWXdlH8r
	+RrkVA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb298y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 10:02:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb456d53a5so614407285a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 02:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704932; x=1773309732; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U/N+fxc7FCXKFi9LiVqjU80w7/4CSzI0iBcib2Hltxk=;
        b=cwh4lATZrKQY1qa/kT4TV+v3pt1qh2ViwmZIJnUJ7D7TtM/++6qlREXlzlQHCvgOkP
         bdU6VDD0qCgV2iDhr6UiiAbyvt8+1TtgHBrMM44dMJsSzGpBmrqRayOU7aSChOAWPwBr
         SBkr7B2q+S9OPsMUUJz3zA9REyQdAN+YHMIGNeM9BbvVBlDw1bzc2WlT/CRSaoEM4d/Y
         sjUoJ+xcJLx31KXjRk/K4B0rLz6uIFG9I5Nk322xPK+nXTy7YMyCm3CsKkgc+E0+88Kf
         +u+BZlKivc/UscPJN1MZuGQdlS+6kTJRjn+5vxBC8PAc52qnnPzMJ13d6ZXRsZMMPdw8
         bLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704932; x=1773309732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U/N+fxc7FCXKFi9LiVqjU80w7/4CSzI0iBcib2Hltxk=;
        b=GXrvAwr9HTh05isu9VD/McyAFWyXu4ULkJH5Fz+0Z5yeRI5JISYt0XKkNqNEsFVM9v
         JVOV9KxfW/cfOxlFNEs9OBi6m7xLZsMxm/wKq9oqQ8KHLPevdIw1lQokqatKSgw0NV6V
         P7MWZpUTLjzv228FD1j6ekmOK3OIZlPnc9iRCSvB0cZAumiqVyIYxJ+R2oXJAmPHQPKk
         z8PgvO0T4s/8rPnwYtexMhTMnZNByx0X7Tft9ycL7Q/WPFsVrYLsC3cbgptlc3eRAGS3
         +EQD0WwvdhShLgfzmcRBRv5rqbeWdP4AAxBsakad+1FzpdOp9+hHwzaekZdggB6ib/7o
         PnFg==
X-Gm-Message-State: AOJu0YzubSUEJDkG3FUUbBnLhLGJhUuwdiX+amixX3JDfOVktJyRGHlI
	XMDb8SJDpunhf/n0loGc7rEnxkI9JbEIQF/1S698b0KEoyhLJTGpaiaTmC3CN/UDjVPuGXtjeEN
	reDhxoh1DP5EJMs9uTJAfgg1/Gnt9LBKo2tRs+OrDXhXaaQWLVwqmT4JmwaG7VWHxFTU6f0FZfV
	fTtA==
X-Gm-Gg: ATEYQzwKEu0IarrxFlSH1W1GclYbOF2kdwWc17ddU2macoK86BPMHyFw49ld3lpcVZr
	7BRVq7hFWd9lRLPtF5ymtmdtnK5hd7Gx8so0Hgm7hRVYsrYyPzNw7/YFhYTSHAMdyys/6JJqiH7
	N8QMlVHBZJ+z8YDF3sPG/rwzdvef3jFeXYzQm0aq/jLpp552QQnvTZWaMYY50KyL5xe5e7aRng+
	LrgRWGhgYvGnYUWovi2cCfzPyFsoo70vUrdc/m1hXlBGh3zuMcswN0sIVS0YMZx46t0MArqq0WO
	hC8YwW5hjNvvnLMNT+2mZVqqvBsrMD8ooYRcrcv25vm9NDvDYDLZ7+Vlr58OIP7gSCI11yslOA2
	0X0M8xOYsWneWRFFoQ2t09sa8SneW9JyjPtvtfkA+nLsaoos51um+Jgfo3iknASEzjHuGPs+Yaj
	ml/dg=
X-Received: by 2002:a05:620a:4014:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cd5afbef4dmr443239685a.8.1772704931612;
        Thu, 05 Mar 2026 02:02:11 -0800 (PST)
X-Received: by 2002:a05:620a:4014:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cd5afbef4dmr443235485a.8.1772704931010;
        Thu, 05 Mar 2026 02:02:11 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aee3ab4sm870864166b.61.2026.03.05.02.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:02:10 -0800 (PST)
Message-ID: <fd00e0bf-7b73-49fd-a2d7-1d4a88bed5e7@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Drop CPU masks from GICv3 PPI
 interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thierry Reding <treding@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1772643434.git.geert+renesas@glider.be>
 <226c5d1005a6e295e0581b2c89e5510dbb7aa9d1.1772643434.git.geert+renesas@glider.be>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <226c5d1005a6e295e0581b2c89e5510dbb7aa9d1.1772643434.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4MCBTYWx0ZWRfXxIlZiQ/JW6YM
 tcIxdkFKFKxtOknlx35wlIp+p9G62TkAlUt1pqNqgSHDTuTZbjoB8oilEWH2PyWadpMCn1PQpvO
 cQTsixPlm7FbYSBbNXlCIeVDaD/yzYO1sf0PEJtAIyZhaSMrL7nxzlRSCOJe+eXnf3hkGSDVAFy
 gJqaFcJy31vyuOxOgnCOChDwZYecsMuv5YSOPk7kJIdZ9xuPOJdzKua8upC94M0X1bm082j+ipi
 GFy06FAxUzi9HV0Ud6CK1G4hI1h2qQn1HUkTCDd/vtJBwVEufo7NGaBlSGC6NDulnWC8enlyN3L
 uvvpjkBeNf7EZvLSPLXucNDJ6IQJevtAOnCpCk3McVVnvVTKlB8rEEOV9Jslt/0Ye335ZSoXsLF
 jRgPLd3jJSy76uXCwpgJbNutESmXUUifXhFD1NXSHLRLLVDjwfjkneQmwSFOpVlzxT3vqShrlFI
 UDz/P3xdyz4fVm3LPow==
X-Proofpoint-GUID: XKYhjMDKaNQW_ofWCZjO-vkyFq7EWxwN
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a954a4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QiSWx1vRvZ7C5zKyDnUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: XKYhjMDKaNQW_ofWCZjO-vkyFq7EWxwN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_020213_144252_94A8383E 
X-CRM114-Status: GOOD (  10.62  )
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

On 3/4/26 6:11 PM, Geert Uytterhoeven wrote:
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

