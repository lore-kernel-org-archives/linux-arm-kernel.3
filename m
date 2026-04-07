Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D8BEDB7F5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 10:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7wprdb1dPmKrPkRiph7Bgx56wW6uxg4wkBACa8+WrE=; b=bozXGTlnuCKkqpJY+VZh2YSPJ/
	QlBagkgMMXz9OY4zKE3vMfNGrjRPx7E9oBuWrGOvs37No/f7T+exdCZ0JoLK3F7zUQbnIx0VVMk+o
	AVjuWyqkLwWf2PH5Qg29IVI0iPhNPsYM0TE1WyeaEWCw6GRg61M3l1Moi8fCHw6iy/9Q3IKBY5thq
	bGq+QsI7XLkpERpHN0v8FPtN0zy/YRz3EOc1R4kPGzTdGu0wJIxumEgq0q06wMlKn9kt+ljVxu+07
	R0nMYzrkDc5AdQH0X4hCfScLG34uuzExCPqoUE6mGKU2+g9svCH5ycKUvk6qkjsuX7k4CnSNfl09h
	oZYx1Ncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3rF-00000006IzF-0zcu;
	Tue, 07 Apr 2026 10:40:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA3rC-00000006Iyp-3vTw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 10:40:32 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6376Kigf493201
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Apr 2026 10:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e7wprdb1dPmKrPkRiph7Bgx56wW6uxg4wkBACa8+WrE=; b=GrPx23sLkh18AeQw
	ov4ZAWjC0IkKxGiLEVl5NOxhU0NBvYV9W/x2BpWGo5PIzwP5g4TL7A9EyZTgE1hb
	Oz1Wc0gWZOQRU2jO7p2Wm4VTCxyp8jLQXWVklX58eYtT8XNgnAQckCaEadO6mkgw
	TRhDxwJrBriOWrC+XN5tuDQb1J4cn0STzd1l9CKIvS35u6YZxtWnyvuaSV1c/hu1
	IJTKxmeoi5cmcUjHXvS+JEjQoZ3iGmk7cOAsoPRpXMz65BOP/V7T4XevPgZc47sc
	NgwVHMGAdAFYdykU9XlU0QfFoLvFVQdIJIxEcg1CgKVRnJNTdwjqNioSN73k9jHz
	NIjIxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr8t9r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 10:40:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d59968444aso59045985a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 03:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775558429; x=1776163229; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e7wprdb1dPmKrPkRiph7Bgx56wW6uxg4wkBACa8+WrE=;
        b=FvZmszK6kClWzYvdhK0JJz+MuZPITk6tuRKzuBb/jNA+2DuOsjYpy/TDaN1MMppJ19
         1jLlHX0UztLGchgrbXVUp/C3O5r49jxQT/EdVYpbkBDoQROFRKCbL4xWWSGLCXCbqvsP
         cza9WEQSYI64dqpPxkpWhemlY/Th5kPDmtsAptsTzl9uYTJQ5dKyyUtseggMOJFM0tBz
         s5QjH+EAF2hrkOo152IXRGmayz3YIZdixUjppZ2KEKpU3IBbs8HuhHvsqzgyD8P33Xzs
         pMZezqjC+PYlvNXimEi7Xih85w3S3KfHh0v2ARWpKcoRZsUBd0j7mvDHapPNQQxTlitw
         G+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775558429; x=1776163229;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e7wprdb1dPmKrPkRiph7Bgx56wW6uxg4wkBACa8+WrE=;
        b=Z1QOK93xgIN72E1tZHk01HViUrmGKL6LnA/qy5E3Eot4zNUyWNXwGj7pltfF3WFRNU
         cpgMx2tk/RiM2un9g0gGS2zi9QnaRlvC3x4bMLR2iRUbjkoXiHAM5PfAZlx5VHehAaF6
         TF6MvoEzBGn4YtgY8Nq1cl0s87NzMNSNS+yUvFRmVKhUHthaQK9HJYPypclpQT7kGsf1
         ygZl/8lo+rT++I+8j2FY0Z8+mxg8YYRfEytVJJ7EJrTIVNW8aXFPLfJcsgvoQS18I6b7
         e7pbBuLf2rG0b+ODwgFHZ0F9F+wAs+xkD11uFYWqodqa8EuyaaTFvvAcJW+oQd5C0BIS
         eYpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu7MteczZTdYzq4CbvR6TeYz5EMCOru9arc6CMiqljL6b6Bf4bwgW0whuJkheokUU0pZjhsRu+W4SUc+n1OS6X@lists.infradead.org
X-Gm-Message-State: AOJu0YyxbR2UFkJFK8au7rbEt5P3Nt6WaSONKwVBelidD26Czg3PFods
	6AKFsrx7evJpnzSDoZwPHrJXzsEvrnQpAFAY2KfhNyJZcjQpfJzS7qM7W4ZlpZY1zB6L8RNo0Sl
	SEglUZKjFEa0tEfKwSFC9eAHJyRncRslIsZLruvmnbRdAvxYrlRlg6wP/6soPzvwkR32uhqc9k7
	KYdQ==
X-Gm-Gg: AeBDies5xfleN5sjQ9vi6PdLiKr1xo5l2gETvbHEgpZcXY74TdU2CBA1z5De6TL0SHs
	GCeD1Z//OPhr92itzqqGPeQ82/L6o5ZbPXn/nZqWJpyMc7VI0Dmq2SS0DJfDafggBCL684niYkG
	ZFL4AI5QN5gXji5pGLB0drmelN1aknC3qVtJo3X8BK74QpuAIBBCRlMYRtVJi+qYtkPdyEqeQyV
	tN1QVkXC6XXwctw7LoLXZawQNtoCd5d8Pe69+JkSbopxrLV8Zxs1+oLYWjo46lebuIBmjj+/nAP
	l0W/qMlCq6vziGlMTnBUTiKYz0f8gERVC3p+6UIzg0Tt39uzEqXdT8f1CkaTwWrOZJmHtvA8nnU
	c36d6hEI+jOVdVqZbG/UGTZFnNr+SY1QIYmsTMzn4gDZZqFSrRKLt+RajwANiHdPxf+Guhd34Bw
	nNwVo=
X-Received: by 2002:a05:620a:7118:b0:8cf:dbad:263 with SMTP id af79cd13be357-8d41bbd4c0fmr1673958385a.7.1775558429258;
        Tue, 07 Apr 2026 03:40:29 -0700 (PDT)
X-Received: by 2002:a05:620a:7118:b0:8cf:dbad:263 with SMTP id af79cd13be357-8d41bbd4c0fmr1673955285a.7.1775558428775;
        Tue, 07 Apr 2026 03:40:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02d44fe1sm4040978a12.9.2026.04.07.03.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 03:40:27 -0700 (PDT)
Message-ID: <623b4ff7-463a-4681-a5be-375ce6fdf90a@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 12:40:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v3 11/11] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
 <20260403-stmfts5-v3-11-5da768cfd201@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-stmfts5-v3-11-5da768cfd201@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Ki19MYhvOL_H7SgI01muHb4b3S2TOFwW
X-Proofpoint-ORIG-GUID: Ki19MYhvOL_H7SgI01muHb4b3S2TOFwW
X-Authority-Analysis: v=2.4 cv=c9abhx9l c=1 sm=1 tr=0 ts=69d4df1e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=edXKPL0xb2b_iQIxsCMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDA5OSBTYWx0ZWRfX3t8a07R3LNm2
 lB8Thi79KRlILX9jLVj39pXLZj3A8swynlZhnSxgdpSt/er9o+pWiM6kwuS1/IS3qt7kxDFbrzo
 ppvcHcN8BkvjYrZlWifEI46CRCwshN2252d+drTS5XRgNwyit6+zMM58WTFbDY1EgpykxXYMq13
 dW2JYAJvwRWxllnxiSTwQp/QlAwNDQbsIPBQXYSGmcPCnJdElXjZnO/uco6QYAvTCndYSoI1km2
 5TGF4qDnTyir/yGdXupr3YpwW55g/lZUvjMKX+r5xDMKuFQnRo05exM8WjCDx5tOgBxj2RVz8V9
 2bLYZr2x4CngPwaoC3a2yCe2Fyocu7wPECkAxVOCNtxDVR3d7Sqno/Lq5oLOWDK5orHVqwGj+zW
 pLqM15lGPF1FrU5vWuGFfg1tp870qIZPQNRQIvI2CPT0ppC/7QBp107UhgGo4mW45qV9TEz29Yr
 EqbMi6pmDOnDO4nEdwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_034030_999687_97BBFC47 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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

On 4/3/26 7:08 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Basic touchscreen connected to second i2c bus.

I was really hoping for an advanced touchscreen!

> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

