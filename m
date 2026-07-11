Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6343C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 00:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNLAaq8lMnoNaNFRUGiCyDQLbXvyZcNLq3BCSpGo7dM=; b=CQFESKymREI2sSllywzHJAcfmF
	sY3Mc+KFtfRtrm7ptpqV4Jzhyjf+9VSbuLRdGs3N1qRydcWMLNWbZaX50Bs797Y8RbK6XZPztktPB
	E8Mad9MbHpIm2IIvvunoc8eVpW+fuJ6K79ljD2F6KjPmM0tysbP/ilomHdfpMgiSnKkneshw4cv7K
	SgBbiU1HzdgP1pS8xZPJksbriS2pja2+KMfKGpehVPeBrffcYGa32vfonAJIn7+n/Kh+jr57aldZN
	RwMuQY51bq9CClevjOAVkUyAu3YvH7ONRvGkda6F84bACbJ3ENh1Sh0Q0KyS3mvPEAl6sa8UlB/Jm
	DUWcGTWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiLs2-000000063xH-0iex;
	Sat, 11 Jul 2026 00:47:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiLry-000000063wk-3UTi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 00:47:04 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ANIujS2203192
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 00:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BNLAaq8lMnoNaNFRUGiCyDQLbXvyZcNLq3BCSpGo7dM=; b=FZoeEOOmNynVMum+
	nV4KrR2QfX2XayduYDoh4AhrWBCR1zJtO9RFpdaeSA7ME1r5dhzGLgyNRYe4RLxo
	NCXhRF1Aq6WZnMkiJOHgJsVAnMqNxkAUlTjLlTp7e1tksejD6TI3q2zLcE2eGWQg
	rOgYlG0Bmfr3bjCkGYtaMHiU7GH7koMu366I3QI0lz5WFKSDyGsqSZ7GHXFe3uZ/
	cfwfj0A7/pFEioUo15A6BPPf3aN5LfJcVJiq+N+EaJngGHSd/0/Nr/qcg1rP6HX4
	jBAZUoXgyrMqtG57GV7J4jjN0ZG3gtZ394lkDQR0Ku7sKOXpYZgB4vRYiui9QELT
	9siV8A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fax5faxfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 00:47:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cce406883eso12237525ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 17:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783730819; x=1784335619; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BNLAaq8lMnoNaNFRUGiCyDQLbXvyZcNLq3BCSpGo7dM=;
        b=C/YAr5HY8b69rbnEdzZ9iDG2+jBfNXJRQNseLuml8/u8ZaO5Mv7DDyaNt9r0gZijYF
         Lg/bilBTWy5VhfcR6h6v70caFGtxqptyLsHuITIvWfc9TQ+puUhvciM3+lZIVJsOYw5g
         rZ9Gzy3zElzXefdUK4aaRCetaDI8QpScVxdlFGENkIXn3PucpiJ0tAU0Iiz5Lk3PTrfc
         oJnqeR1Kq3U5FTyV41OiOrSAKxPS5yyf9WrRja58RoPQeo3IBu22aUwYV6E1+jiHR0JB
         SnsRG2d58DMSDCNcBEcJ+b0r/pD7f9bJ3w5fZMYde2uigCtdLBQbXuugJ2nKUuWyGrRO
         DF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783730819; x=1784335619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BNLAaq8lMnoNaNFRUGiCyDQLbXvyZcNLq3BCSpGo7dM=;
        b=oxVVUpT4rJDCI4ZF2/RXQVm8rY0QdAR1vD6FexwXich3hJW6OW8ggQJWU4PK4/V9VN
         whuRHmBvShNs50KL5KQn4L3nUHgYdhlNKatu1jHLZR0k54/VCJZv7n0wCVENyKlaAETR
         aXCgK5oX5dbn+PCdFRuamlPaWnbG00efOpXZxzq4lgvQG+q3MapBqTzGXnITjy5Ry2T4
         EwrqSFUZ1XaemxojxmvhqR+tHdFeGhuD4L4+HECK7TDgStK6kSAMP+9jBaYXaj+MaBY3
         8XkpSfoi0YUTrsuJIUUnDZSzYCyEJVyn6aRgQ7CHk82bPoQOFu60rwPfMHFDwOvXKRGU
         JCWQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/94hrmw52GNLCUwgmUfeEAyOa6GJICtCoQPhCroN1nnddstDPb/QAo0NHSRLt377d1MXfHePRYTTtV4JqdJMU@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh4ywcWYTwalu9EBhdqchaNfgW5xXEvcBYUR7oPOq4yXoptqfk
	3tZwk54/Qk7jQjgQAGf7fwcUOkRT+CJB9E7vr46mRB6jnA0Um0fKlAtiPlHEKqLsNtOsl2cw7V1
	TKoy7VHem2cdJd6yShiMYJpfL1yKUK7oeYvcI6xwm0fUx8Kwt7swH3B60b0XCE/HVPouyKbxHa9
	E0fw==
X-Gm-Gg: AfdE7clILB8PBc9wDh9pL3RjKGz835Z5gKnrB9RZcPsQfFvDMXc9LqS6thqGMF7UOTf
	jvkIfUZrfA5oyAa6i0zlPdWXArlTwUeUO8GsyiXaBpgQ2lfBNTr0FE4aXRX/kMNxpJX+uW4HyHV
	lcP23ZDzpJ1KZ/24u07sjUqmEJOYgzE7jJUqt2VBE7HzVkZmgMFA7VsTaoIVHcBg9uOIIBkERoa
	B/QqKiVYSTqwkVAzMjbDHbdBurQzKqRiBGF2NeliB71A7+tiMM4kFv4q+BOW6qieoDPv5zsqluM
	Ye4IK+hf5KSPty/D5SMKzY2uwB/euiLo8Dimv9fGp5UhshATJJcdO0HYY5MB15b9Lvi81qcNEc+
	ROcCt1mhr5UagG5OujavLCgTTjtpGlR+yNqPNzqgE18NP/BZ9c8zIE0kTf0KHPvfOQkL0UPAn6k
	Y5
X-Received: by 2002:a17:902:ef07:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2ce9eae29e5mr14108395ad.2.1783730819009;
        Fri, 10 Jul 2026 17:46:59 -0700 (PDT)
X-Received: by 2002:a17:902:ef07:b0:2c9:c952:6e9 with SMTP id d9443c01a7336-2ce9eae29e5mr14107995ad.2.1783730818551;
        Fri, 10 Jul 2026 17:46:58 -0700 (PDT)
Received: from [10.133.33.249] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bf92bfsm67000665ad.28.2026.07.10.17.46.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 17:46:58 -0700 (PDT)
Message-ID: <a34905bf-7f93-46bc-a9b7-ec44f36aa0e6@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 08:46:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm: qcom,coresight-tpdm: fix bracket
To: Manuel Ebner <manuelebner@mailbox.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260710080523.428548-2-manuelebner@mailbox.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260710080523.428548-2-manuelebner@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ab2B2XXG c=1 sm=1 tr=0 ts=6a519284 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=b3CbU_ItAAAA:8 a=EUspDBNiAAAA:8 a=tyIhYoOGzA4zFAWON2wA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-ORIG-GUID: 4pvAf-Gfby1PK3et9cLhZyuhCjDi8kNl
X-Proofpoint-GUID: 4pvAf-Gfby1PK3et9cLhZyuhCjDi8kNl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDAwNCBTYWx0ZWRfXxJ7vFhGAAkEw
 jVYYO8xRSUw/Z2D7OGzKduduTLAW5GYqtTFZWZHsKv4580CQ6iCVFUlDaHLoBSWUASyYtPUHrvZ
 +rifUpL/+Ci6Oc8JGOL9wHFNfpUzInY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDAwNCBTYWx0ZWRfX2vDUbtZ0UMXz
 deZZl8fArV2bnt4CSv72MzS2Rz9Vqgd0xP/gXLCp5fQxkFq2vLJesxZ7v2qqk7q8Vpgux/EnBH0
 +xwdGueK3wlrpNF6GlFOjGvTatXFyqSDXS2aJzWE7ZGodjdl1A3uOxBaDwUgisDG9lx5w2zBXxd
 ymC/pVbNiL7hWDl/+8Wh/9Zmj0djUn3KJ+YkBrlRg+nJUCVMluMKptnOGle4Dphyd3qY6BT41Sm
 5xIOVEziFv01jECtyq+J5OCGNk6PFoXjMsirUhMzSCULexxxj400w6eQ2h9qouqpLFJRiUyIsOH
 OELAEPa5dYRz08yje8VHdZ/IVUdxuMAHujFdEC7Z7EGuzjqduu8YK+t54FaGUQgBR32qZv/+qEm
 9uwyq4UXM4HxfeMcP7NL4lLD97+U0DWJfk1W301tstyiUz7/5w1z1HOqBKvoOdXN1q6ujgL08jA
 M8lMav/Y7UQfhpvG03w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_07,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607110004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_174703_026645_9354005E 
X-CRM114-Status: GOOD (  17.05  )
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



On 7/10/2026 4:05 PM, Manuel Ebner wrote:
> Remove needless '('.
> 
> Fixes: 6c781a35133d ("dt-bindings: arm: Add CoreSight TPDM hardware")
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Thanks for fixing the typo.

Reviewed-by: Jie Gan <jie.gan@oss.qualcomm.com>

> ---
>   Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
> index 152403f548c3..c7301f1b28c1 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
> @@ -9,7 +9,7 @@ title: Trace, Profiling and Diagnostics Monitor - TPDM
>   
>   description: |
>     The TPDM or Monitor serves as data collection component for various dataset
> -  types specified in the QPMDA spec. It covers Implementation defined ((ImplDef),
> +  types specified in the QPMDA spec. It covers Implementation defined (ImplDef),
>     Basic Counts (BC), Tenure Counts (TC), Continuous Multi-Bit (CMB), and Discrete
>     Single Bit (DSB). It performs data collection in the data producing clock
>     domain and transfers it to the data collection time domain, generally ATB


