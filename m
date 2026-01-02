Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51283FA3741
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 14:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=; b=kZNjLqBxBqbXs8rrpEjjcKnBXX
	awzBEKE2hYZVoSkmCFvxKlS4rpSzjUJEP6XqwAGBUCViozhre53pwS+8egF7KKzYDQcLNmTfqSOR6
	Yj5f+GRd3frS8GrjOQaD13iK+ykWMJ6jquzzcveO5cYaCzem0pPSeUL/wB4YBHdcO5AZCkmzFxJ9J
	X59+X6NXdWgs+nDYSSf/Ldt0/ORlaZpclcCpGGjKEj1k/X6W0+wWg+V9XYqqEB/+zLDBuWGJRoXd/
	Zb2LDLaKFBD/b39tGM9vTavyoNTNGGro7TTeGfvZHGAvEcljPIsxv5nvPkFi3PH5F/dWbgbbDKoln
	Y0wdct5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbfmy-00000008Kpo-1wu7;
	Fri, 02 Jan 2026 14:06:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbfmr-00000008Kp0-26YS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 14:05:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 602Bnlrd1095017
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 14:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=; b=gp/t4rNJTeHYaLXS
	r/aON5l/KJXOfgVUHGel9MdiD77nu3z75PPbsamCbsTKqaYOKHcXsLjxo17ptTEO
	IsTZgkcmPuGgbvOYefHQNctgxKTogYy5wUZnSHm56XwfPiz/KPv2/ykCWQ65iF0C
	Y1JxlTqFreKr0qy4ioVzeOToPkVf0XwAZx/tCigtYgNm96kdI9G2IhcB1dk0kGo7
	CODVjPpFHC99wiClNOUDGGa/ij/PFvp9t2ve5dQW6KUOh+D95MxhtPtErbZNWcjV
	Mp8WTJSOn3l+99fuCBXnZIO5s5RtBABehHAog7yfHgjpxWwtKC3ix8K3WY1xl/o1
	BENKng==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bedg407ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 14:05:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c231297839so197666385a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 06:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767362752; x=1767967552; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=;
        b=Ah70cd/MxvtA4XzOxBBXEM3duLeJXAkQN+owYfQlQAVSSe+gBn8abMA+9W6BNWGey4
         L+fuJ4x4911RxFttjHJqZyQFZJS4xOJfgneEpXjD2ijs3jrBpRiBhn6rs+L7IdET6nHJ
         Iq2CYj468J8aBqBmOdv4NvXqttBR940/KVkAe1T/iji86YlW9vHMah09snQfwvwJ6E5x
         MKZM1E15tYDlDKLYFUawBHc/11o1eO6i+e86SsVCDQhHGGkMsxBQVR1nhGSREpmDg43k
         DUYdMZv86J66YslOnCY7Y6rwkI7HHJs8ZrXp3asFF1rsUU6OQyTtTtpuAyBVuHlB6jiu
         /Hzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767362752; x=1767967552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zcdn/7Q48JsxusxJpdZxfM0eNzXVTYp1I4zI3xtwG7Y=;
        b=kK7AGdQoKhsM3UY1+h6OICjzdAwIPi8Z3s5hqY7GoAd7CsSz4oIaYLZmwMEwQvq8D3
         lCbFdBEKYSVbKzVojwIIM/z2VLGJGwneHgC8Np5mqNG6+8gbtFKQFZzO8wnjmYM2i4xO
         CDdWxbQRctGNup7BXrwpyg5aNYUDc/nYmNhPDkIrf3dasoYzd+5+EuZM3cwCjUCmm9/r
         CmJn7nhlMJPFKkz342ElTrVfAvLUD8F6NrzSAHQa5u4BGYn1qGPCQ3+mtyK5a3L2H6vb
         pDxs5vJvH+MubnMly8woZJgxZndDJXYdje1KF2dNVnt031RFvtnP139orxsw0u9jU5zW
         HjXw==
X-Forwarded-Encrypted: i=1; AJvYcCWwibLWz8GpnTUj7zUW8rOrUHNMPaIfsLDs4tLmF9wuQzYXyiAMXiHlnwLZU0yB+R0LuTcG4JD0EqL/+t2Y+Wfl@lists.infradead.org
X-Gm-Message-State: AOJu0YyomY2mRbPPtElTHXNHiAkRrpXrqKz/a5JsHdpeKFGq8SUsHi7S
	qg1v4MYSzXfAkNL9kMGyJk1t+FGmkuHF88GxjNh4C1Phd1ArkcBaCMalZ0CTdUO7N2wneb+sPQk
	uOq8pWzxLdl+u41LdWW9iqmhcgnLcvUj6PlcaITDbddgmbP6VtTR6wocuzhYYIAlD+8whFhVNnF
	UXuw==
X-Gm-Gg: AY/fxX5BxuKDiy92JVgeIGMG9AcByyArns0IW033T6aOVTyw8q/cApq+BEof6QaEZV9
	JWmKajFa5ggyyhqkjA1k3SVAXGqDrapY8KfOrBMjvGX2dXejkvE3wzCCt6RbmRU/9svoY6p8msW
	/S86RdBkQBksX+qsrKaCKwBPuUBWmL8SxvZuMF4kYJgzk8GPpJM+YiO/RsWN701fELcScccV+He
	y6StcggV9dpfESJeYiVPg/iix09KdEjhZgP0LRxe/ob/9T++OIuUGXiycH4/v9Pfyws1vZh/j7I
	fUpmkEazBwpxo8ZXDnUaVIIe+1zWtG6Ry0/E/mA4s1jNvUezqWz2k8qiuOnqUALYchIVzrE5wD+
	MpDd+aMviQDDZenp3uQnVHePR+x0pb/AY35q1wJ1AGzGQKIda9P46Wff7pCD/pj6EWg==
X-Received: by 2002:a05:622a:28c:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4f4d620461emr392952821cf.5.1767362751617;
        Fri, 02 Jan 2026 06:05:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvPcr+EyW78LnxZztu6gmFgyoAOWuar2cL8fl5R9dQjwJN8gd7F8C+4SSN+nYk+ChCz+Yvow==
X-Received: by 2002:a05:622a:28c:b0:4ee:1fbe:80dd with SMTP id d75a77b69052e-4f4d620461emr392952151cf.5.1767362751086;
        Fri, 02 Jan 2026 06:05:51 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f13847sm4429125666b.57.2026.01.02.06.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 06:05:50 -0800 (PST)
Message-ID: <237b8ced-7d93-4229-b1bf-f6993c25dd5c@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 15:05:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu: arm-smmu: Simplify with scoped for each OF child
 loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260102125003.64962-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260102125003.64962-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: z0aVmKkR448VPFKZtFr_C5Ima95l_DT0
X-Authority-Analysis: v=2.4 cv=IssTsb/g c=1 sm=1 tr=0 ts=6957d0c0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9ra_KJl88v3tURVkoeQA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: z0aVmKkR448VPFKZtFr_C5Ima95l_DT0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEyNiBTYWx0ZWRfX/8VzOtrUfU8E
 huClsu6nH8t8nqAzwfiRQz5noAirp50+oP5LLVvGxgPY/TPxUsI/2EseKxB7WtubgkB8sh9MuK1
 MtWJ/NqmnSG229MX3wDs5KBtWawblhAs+7FqmeH9ILrldznVpbUFcpgPLLtoG4rPVIVdc+gUQY5
 gKmTYM7IdjHOH/ozXgWSetkSEZ3iiRWmGKWBzJxQRSYafwuFO95pKZXawIDiD7/ttonlO9BzNKu
 iO7iQyaGzhJcIgOnVTNDwSDnUsJMdWjZ05Ex6iSNMyrPTpygZAC+diYWlhVEtznFg7tv6a1xM0Z
 eizvikc1Kg/39JX2DUz+l4B7DCed7xK3domSPkzCGBJXnhcJGyylWOa7E0vs3qg+agnls3Xw7Q9
 8lzX3HUduqg6PV3DmvOuoJ6AcBYQhiNn56mAN0o5SqP2gPpiE8PmViGTu495bIgXTZgfBPndbQs
 wSVWsShc6V0biyX74yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_060558_313647_E0FD98B3 
X-CRM114-Status: GOOD (  10.43  )
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

On 1/2/26 1:50 PM, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

