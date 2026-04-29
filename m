Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B6CFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+VxMDfovcPTHc1i48TzmhGmrYWTJq7vT35UvWMuOzM=; b=NQGSUyBbOI572cPfPyEi8P8CTa
	jNtSBpVzVzBM8LLFMPr7I2T2h2kWzuXgpKoq5vAyr9AB+mUwaxm04aoIj73vjzaJXbP+Bhvg58pWB
	bBK6n+QTjnuV6Pzav4frA2rnLoAcLGbSFIfy8yc16czVjoIuO9NE45DXK/q4dUZjZ2owd45Oq+2G0
	QQp7+SIC36MKKoAom7pBFIkMiJakNyuV6F94MYkhrc9hEXsq/DFchpVFJB4w+RKOTMWU2VA/zgC5O
	y+S8IXl2vZheXSEvWcNkq9v0TKY84B3gqRWlRIc3EqdcXlftiHc4AoSKy1y8M09yh6artcfXEiwv9
	o/TkmauA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI16r-00000003KAe-236j;
	Wed, 29 Apr 2026 09:21:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI16q-00000003KAS-019F
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Apr 2026 09:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=j+VxMDfovcPTHc1i48TzmhGmrYWTJq7vT35UvWMuOzM=; b=C2U6iU2nxo0/RJgYj5M51mKW05
	+PmSwGd8+jliDgBO8uq4VUtH+xECRkgsYKys8fu9/oTkiIAyn2PPZllrcviNej2L1VckxoUP28iH1
	kT0JgbNew5vai57vAq6bDh4oAKavZ8veNEkeULSJBsa8Y9YNQGVbNSNpvwFlby6DDsSq4UtSVNzkW
	LpaapXOfdZblxEWEudZlvMz+QwhNyk2GRlxw4cAkqy5mJeqGy8HfXDKjyO8Y8OIryON8RfC5Y7P00
	CeErT0ZymvuErfUZdc/KEVoKNS5vyKlJ4+REneVcBPJUYB5EP6lMDWpl6hR3FBv1d/Tm0umZmbEAm
	IS8IS1TQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI16m-00000004xSS-20CV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 09:21:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8q6mD1641981
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 09:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+VxMDfovcPTHc1i48TzmhGmrYWTJq7vT35UvWMuOzM=; b=eMao1LGAfGVaxmB5
	X9pwAUr5On72I3xyLO+PlNjo+tPH9GDaxkifxY/6ZQNyNTqeQ/gf8PdF3aF+Q95V
	Fe0DB4B8B5wwHcMIBJttov5QHsq8naxUPaWM7tlLcnhrim7kNZKF2oTvIPvwAngr
	RZwzgPpuRe3p57smW9bfS7YlJUscIulxXNRqkXONl1WH6ZriTigbE3KtgRvXCivW
	GtYcEOFfw7HeZ9ocyy3ST/2CKa7xNDLS5RTdAeNPx+OMAK6RmSExXYw2EPt/9s2R
	t0GHEkPhl6MWloE4bF+7e3aXHJ5nCKCtXR2lL0w6GmarIFzE9SLYz3Cx9Y7PCJLY
	2MiPKg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ducj80t79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 09:21:24 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56f6ee26adbso874697e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 02:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777454484; x=1778059284; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j+VxMDfovcPTHc1i48TzmhGmrYWTJq7vT35UvWMuOzM=;
        b=M2lHzzckpUVZzI/Hdfql3cA9yk0GdjTs9lFYyhNiwMyoomv29tx26RBz9h7Ds00Kpl
         ltyUPY2LwlVsm+tWOiA+UWQnyce6VIfjPU23T7c8CyyAMRjW8D12MBZ1htm7hsGz5aQz
         zGdFLcrdv9zKMYUuxqIKLrX0NT/gxPWmr/UU5jJbyfJF20tgKtQcg4vDCEKhftojwnMH
         V8//rRNDueC73e/2xtnPSmVQmVs3iC1TVZ77alQ7K93Hu3CqSdsBo2I6zjmulsm1YIcD
         JtT4vPQfT5LZ47Bc5+476da2srMutMdISejaU5uuq1GOlYMDYqZ0yDATnKIp7IphOdKV
         +2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777454484; x=1778059284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+VxMDfovcPTHc1i48TzmhGmrYWTJq7vT35UvWMuOzM=;
        b=l/84nXfW+S/aNg6YGJoj3kwA0NsXF3/Heb2yspGkINV1uSGNsTWgUNCMUE41t17eUt
         LhEa3gWHess/6TzhUPiPaeA8k/hfD9ZqpcVtjTYWx0/avd7TU+Reg8lC+KK2trORe8q7
         8MzMK0DzfNp3c6KNdhbtRCuMMAAWr21l8W6J69bq6HFiD5pkT2BqZNI8KrlpAAAxvEBR
         4mZy2zcyQ2xREpMvzDqQAQYnSHZibjiqJa/kxbxXbrSW3NgXvTElVzMzsS3w1CProjX6
         9ohW2IKq73x2qlrfke6gFkXaRJcAF+fstsXZfBOQpvOnYtZ4dPK/b+zZd7FM22J8HHm7
         595Q==
X-Forwarded-Encrypted: i=1; AFNElJ+wuQgxUId0r5hqreArCmE7CQagreTuD3OfZpHfsHa0g6vdOPP1X5z490kaerR929RceyBq0RwAenNJmKFi65aN@lists.infradead.org
X-Gm-Message-State: AOJu0YwIuBStR1gXlW9dUnvRzIH7ltLH66VVnsCh8vl9klvdexCj+G5K
	RvLNltrQS0TOGrGtw2y8WRADXrE2odlsBfjRMuUwzrgm618/51j0mFj2VtTk5mVVvGTkYtvzXwv
	EG5u8Tz0N8uLmYIAmsy0LhpQrTvbhUH4JvI6J+hFFSu7uMV3i8YLQeU3pZdmWfolDI7LEJX6Z2x
	ZFqw==
X-Gm-Gg: AeBDiesQp1E2FrD7eWArogr7UF9NjtzbnvTALVpNTGq/kjV1pz+kZF+b1/vVkwvPsyB
	tBlccbMgHi2b2xkuYG0oBru+PxVptpyk/a+hlkm9IeM0z0AVi9Sybs1rWANbhv9tk95vWkvvqDX
	6oPCbv7WrV3p9gXnxYffF2cgj1nubFa4Ba1s7dkwByyQaRJQCGM0djCEFdzFxo0N+RM1iysN/jM
	EnmRCBcljxKHbnzyVpjF8qzgVAMVdHk5GVc3ad29OnkPaQCQfIGp8YYCRUp/xcJSfPNURglvDan
	eyYr75X0m5fMot6trbcq9fmcBA/amBMFrE1ZjIl3f0Orft3PKcnpoHfD+IRfsBUqD8IgJdYyNDa
	hvl48aLlkSRkgx2rdycRyiyanKUrmM5z+FjRKJ32FX0CExkpUP6NGvdqd+Yy1ZvZHMZWNj3ueh0
	E3nd+CITc6JPsztQ==
X-Received: by 2002:a05:6122:2a50:b0:567:4293:8d38 with SMTP id 71dfb90a1353d-573a294c552mr1851422e0c.0.1777454484398;
        Wed, 29 Apr 2026 02:21:24 -0700 (PDT)
X-Received: by 2002:a05:6122:2a50:b0:567:4293:8d38 with SMTP id 71dfb90a1353d-573a294c552mr1851417e0c.0.1777454484002;
        Wed, 29 Apr 2026 02:21:24 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb98543bf48sm65502366b.41.2026.04.29.02.21.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:21:23 -0700 (PDT)
Message-ID: <d4962403-4e54-466e-baaa-6bbe28707c5f@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:21:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] interconnect: qcom: Restrict drivers per ARM/ARM64
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com>
 <20260428-interconnect-qcom-clean-arm64-v1-2-e6bc3f7832db@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260428-interconnect-qcom-clean-arm64-v1-2-e6bc3f7832db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: v9zGEctjEFG4Q-QwMTYyxg6vCgSibBIY
X-Authority-Analysis: v=2.4 cv=RI6D2Yi+ c=1 sm=1 tr=0 ts=69f1cd95 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pmW9M_d3okJ3YB8kds8A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: v9zGEctjEFG4Q-QwMTYyxg6vCgSibBIY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MyBTYWx0ZWRfXymzVWWghWhAg
 +fh6oDlkoMPUhkDx0SiaXYlJ6t6+UxBseUxW7wY3r2m6IAtXMtqWtmS705NxBVMVRXA932TOkiZ
 GeSYdU46kN0LUIUlYJhV5BO5FJNl/dwM7gQSpaJv3rrIit2jreygt5Hs6y+VrdevmxCdmE9zBMx
 d7M/Wl+v0KmfHYd/iBbK/68Vm1C4tgzFQPgE3o5vWF9hOhr8P43hwj/QXFmO+hESsdhe8oULpTi
 H0tOsGpmzYpt9j5NoMJ7b7oNzxWTgRnaGrL+ICAKaTrJSj1w4QIzI+LPrCiNPhGBdgW8kcIorH4
 R+TU7Xz+PDLBcCI3otZfJiLjypP/WLrXg4En01QdWssJqE7BlVc86UnJFE0OCIfZ298T1OAmmVg
 6oJjPuULLk1PZABD9IbAg9Zdup5k/1qoFRQc+FlWEFEU7btDRh9lx81WHtfn1LmAdLGyDrMz0hj
 GvIiouej+UmglSxHvBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_102128_943877_E1ABA4C3 
X-CRM114-Status: GOOD (  11.74  )
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

On 4/28/26 7:32 PM, Krzysztof Kozlowski wrote:
> There is no point to allow selecting core SoC drivers like interconnects
> for Qualcomm ARMv7 SoCs when building ARM64 kernel, and vice versa.
> 
> This makes kernel configuration more difficult as many do not remember
> the Qualcomm SoCs model names/numbers and their properties like
> architecture.  No features should be lost because:
> 1. There won't be a single image for ARMv7 and ARMv8/9 SoCs.
> 2. Newer ARMv8/9 SoCs won't be running in arm32 emulation mode.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

