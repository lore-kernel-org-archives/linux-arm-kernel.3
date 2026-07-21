Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958FAC44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 15:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OjcXqA5sfqMXr7N8m76tGZNflaC5D0xHgA4fme6+cs=; b=SEmRi8f4f2sdPBKuZCj8QsnJow
	ROR+Y+2vaW3IHqg+z3EW7K4IXQiU5OXlxCijirZSiaVR3AX2innY58+fn2MuxkBNQGbV5rwTJPkxY
	cPzgN493zfSUprs7oMh7EXdwpjnpHNKVNo8k57aqCfwi8D+gz9JzYjyw3P0MoLcK4gRrRI3pslVkK
	swhPyaGVWXtoZdT/0btusMtFQlZR2IYGjfYrTYcNvog4cLzsGl4D3E8uMef/5m+pEvRQV52MWi5pM
	rWDshGGM3GXNtjFg7bDMfMK16MUOBN8P6T3X1Tj602t6NbIGaTI4+ebPLKchQs9khSIMnqi331Z4N
	SNDiq0ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCGl-00000009mli-0Dw6;
	Tue, 21 Jul 2026 15:20:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCGi-00000009mlA-2Csm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 15:20:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDgG441399785
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 15:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/OjcXqA5sfqMXr7N8m76tGZNflaC5D0xHgA4fme6+cs=; b=ceBLTJ1KTFdfdFCa
	cxobjgJr4SX1wnsQp58USMvuKXkOj9feIR7AFTHB/qZpe5UQ3BxQhYsBlP9QVcji
	SMTHnweFhyeq21EkmW8Th8ybRTJKsyAo84z1wHJPjVyN+vMjpCPx2ZyHtF9VMjbo
	/znXMW1T88XElerBLvtrqVtldX2FlXMBTIf8OJHlss7ultf55YAciSaeTfnSowI4
	bPrzMIoMgM/XchvZpQyi00Pilp5KEuHdn4nFUj/X8z7PtW8HPZSUMIroBTVld0Mo
	7WXVi00Ix8mvNTI50XEFvfpxOmisxGXho9VcMHNzyrIpMU0KxP2zWjQ0apheBdI2
	sWQygw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1es34uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 15:20:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51cab6f7517so15207481cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784647227; x=1785252027; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/OjcXqA5sfqMXr7N8m76tGZNflaC5D0xHgA4fme6+cs=;
        b=iRKTiwEkybKXALD3RpgnaPIAPgsDhcLBO6AkQ4Wgz+r8tMQ4Gc+x4OMr11wjJgN3GK
         RF+lF/H1Ht2YCc23iP+GOoAbBWDKClXJySONCNutRmTpIJ22TRR11yX8vy7CK0OwMv5i
         gNl8x8TLkM1xSVB+gPpd0z0mcvwG7UfAlpIu22p9EM0R75UbkLton33lJ49WWHUAZBJU
         j6WC5YkHTsiqbb2OOsRWU8mwcRQgtfUDRMgxDr4Y+gy0elYIgUvA0AM9IOZSslVYOJ65
         26ZSXd6znPFfLvbol6QpbEnDplZqytJKGLuJerayDfD0sWzUXZhacBu5qip70xAkH+6H
         pVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647227; x=1785252027;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/OjcXqA5sfqMXr7N8m76tGZNflaC5D0xHgA4fme6+cs=;
        b=KX9vaR2PmTLo/gPhtVjVzZBZC/IUBAL8srNr8Hb/uU3y798gvM2k5cLHM7wG7NRF2O
         vOz51OqSvw5u94pw80HuRzNE5q1N50+dTiWmWv8EJTukTRgu4R/ODvw2slraRKur1XrI
         9T8nNXHGWDl+xWaosDbaQwDbs69kCKI07ouM+MdbRfaBLQPrfAzNTRIEynxuFxa4/Mah
         8LH//j+SoZ4R2G+BuNGmZXI6QOWeAt/5zSJe7Oxix8B2ABeYBCqgQUvVRMCmgAIZ5SyK
         Z/7O+klEvrfZOgbSE/W7w5jecWrvht76hTcZ2MWR+9zQe0K+AgglilWV3cJH/gen9MQ8
         5m2g==
X-Forwarded-Encrypted: i=1; AHgh+Rrbu3LGDGfHfqT9lByJXm7y9H1NX+fGvIChXnk+1yLvOL28W7c+4k6EaprIyxuziu+7uC7c1ZXiWGFHj76j3O4A@lists.infradead.org
X-Gm-Message-State: AOJu0Ywp8O6N1+BqYBAgY+oZiqkyFhZjwuIPP28jpA6EPPl3/yp6eDOf
	lQLD1Bh4MdkJ8XYBdKUK0ISyBu5SW1EvkgkEg15YaHIJ7EhC1ZTKRTTvYaaee3Ft86l84BKO7EZ
	uyWZSr9eJVqEShBmhGSEpRdlhOEFccHDwkNGA1v7aUkwaAkl+XW2kJvbc5vNetwJNH9zuY7mkwZ
	iuIQ==
X-Gm-Gg: AfdE7clLWn7fF5rK5uQTLPacguDWN4HzUcwWDjEVUbkUHu4EyAF8ClA/DdeJ9LY9VaT
	KgPYMPvAFLcoPdC9ta3CfMV4NKo9o/gn2b7UmsEC1qx4wPAY7Uyns60XtZytJ+mbUTlZdJs5Knd
	aMEyKO45CppZ3bI8JrC4SXauZtB4HsJ1DkyZ/ofIFCYYvodtoKOwjBvzgr9DiUKGT3lKgHawmlm
	WcTfYzm1q2jowjl1iB1dPQj3Unt0xFAv2HjNaM8mUPZtnQWFwraIh+6tZSSQdu5AjYqoY1Xlpcj
	SXtJX+K6TzGifYwYr4PWEPqhK9ALkDUJDFiHLUwmjmABLJ6iPpIEeAOmaoVHG1vS6qPyWTEl6eb
	QZ6O7TisTAPncazho0s75q0Fj
X-Received: by 2002:ac8:5f47:0:b0:51b:e991:92bd with SMTP id d75a77b69052e-52674e0c561mr29261011cf.7.1784647226928;
        Tue, 21 Jul 2026 08:20:26 -0700 (PDT)
X-Received: by 2002:ac8:5f47:0:b0:51b:e991:92bd with SMTP id d75a77b69052e-52674e0c561mr29260731cf.7.1784647226547;
        Tue, 21 Jul 2026 08:20:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009ae04bsm605787466b.8.2026.07.21.08.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:20:25 -0700 (PDT)
Message-ID: <925e848c-7265-4beb-8d51-de542d682a0d@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:20:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] ARM/arm64: defconfig: Drop redundant Qualcomm
 interconnect entries
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
 <20260720-interconnect-qcom-clean-arm64-v3-3-942e8ee7ebda@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260720-interconnect-qcom-clean-arm64-v3-3-942e8ee7ebda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SPZykuvH c=1 sm=1 tr=0 ts=6a5f8e3c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Q_J6LHpempm3BuxY28QA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: KGtrCTlWU_nGKP74u-55jZrztIGwms1R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE2MiBTYWx0ZWRfX/o3cJ1ic4HDk
 PD6HxHZl2nNLWcNGFRdGjzaDIH/K8M287detKALE16VdUGvxfD5XWXmNw+E07JKoX83ufb0ct96
 yOjfGgqnlBw4qn4Q33uCF6OKBELXm83pqmSRybj7LsK28w2KmVzyiP76xpz7IQrW5GowYmDJL6U
 YcHNJdsUjhfuI6ZkNCK63chVdVNrrPQoZoswBpgO14c6hgNIXYrgzJFHU9AXcKasy6Ee6jZyEeR
 Qtq/oPPkIu3s7JPXp4hooVoSEzvkso3og3a0scPlxU6GruKq5zNEnaDMsbhqzMv73D/SxeK9UtO
 kkT2iCisOdtPq3fFBmEUvVCdoavGhwBRMjuYIMFF5A47VtMRSd82iB5RACYZn/gYik8YvIR0x8d
 3ZqRkdeozWvqSGz98zQHwuhfLXi0wEGQeC3WicQPYmSj9ROW+6/6m9LJpLlhXm6rhs8KHPEHk4h
 Jvgp2OlF7N4e+25aYTw==
X-Proofpoint-ORIG-GUID: KGtrCTlWU_nGKP74u-55jZrztIGwms1R
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE2MiBTYWx0ZWRfXzHFZoVfaQpoW
 UonrI85dxVRCJg89e8ieyydc3qEp37Ixp1Ju53VePJtZBGTPiiBAoZGoI4GBe3eCFwMsRr05qga
 C28hEhfZCocGfah8gC5rbjSjxHGQwNQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_082028_569054_D09726CD 
X-CRM114-Status: UNSURE (   9.47  )
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

On 7/20/26 9:03 PM, Krzysztof Kozlowski wrote:
> Drop all drivers from defconfig which have defaults in Kconfig.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

