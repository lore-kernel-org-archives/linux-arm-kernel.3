Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C569FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbozWXvo4QjX4iElfaTeguvBAkfy1ceGfogaHli9wlI=; b=PktZbJUeW9yfwWyeycmoMEtulm
	yMCvhgqwSoJBqukGeixQeissYygQ2WRoEOEPWJ+rVCKW/L1fNmFtlekJAG+OFy3+F9ebKWCyIgGYU
	+RDvxty2z9R5N2anKrwNEFR7Fx/L6OZpzAF9f46vbR1xzDSjyXh8LoSAvWYHPkIdVwIKkab7Q2fcm
	eGEtnSf+axc6NCDfECNGvkYRqqBeYGGZcjFrIyzE9MEIUiWD4gwSO0BVLriISBdXJ626AbWrXfIjm
	0Yqwzq9JIyvCqQrIO1uzSA7DYbe5LVUxvYrJuINGBQj5ryU+oTN7aSsKKQrM7q7a5I2x1KDIyV7Ta
	KeEEWVCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJ2u-0000000Gg81-3pPh;
	Mon, 27 Apr 2026 10:18:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHJ2r-0000000Gg7J-17xe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:18:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R9Oh8t3825334
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vbozWXvo4QjX4iElfaTeguvBAkfy1ceGfogaHli9wlI=; b=B8KlCH0Wvv4A+Cnf
	aAVr7DHhtWimI/NUqHBH91bRFRAutSWQkMrCJksWuA5WWWUPvmRoK/lkKC+RNSCf
	Qw/8gGVTHITFDlI3p5hT4tFg8JghvCccvuc/gSfh1HNyx/Hx5XHnhcwA04LJ3y0i
	tppEJBrhIJOY0EfVNOreAVkGgYdyf/QDXuJBCaKzjz7DVf9ZC3nj0HUcGh3N/uxa
	gM+jqtlHAhfZe1jXx5KHrcLW7lJXrKMp0DBwybqp3JixYQzCjZG6MLy+XKRDxtGd
	PePi5ToaWJJiQTWKCmKP3WajGdCpReYNUzApTcm9iiNREyyqNga7379Vo2seVEhS
	Xk21tg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt55508fm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:18:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b026c4497fso19146446d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 03:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777285107; x=1777889907; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vbozWXvo4QjX4iElfaTeguvBAkfy1ceGfogaHli9wlI=;
        b=FY6s7zn0N818JmfuEWl7xvCVRzOmKDAkNLvvyx/7pg2nQBEduK+/pUpph+IgabQYlS
         qzei47amRZBfmCePO325VN353O58wVndT72WxNksCxB0rMOyinc2HUrMpPK9BhegzNTA
         Yj6kwyxwQ3qP9qOr4PNWDmrn0rFLwwT0x7HWtPLPzyhAkI82edyeg3NoKL30O8+QBeAZ
         sDRs1jgpUji89OcbIupCfqj3I5kT5zIL0ZDkiGDvOsdno+DU/9aMXIUQU732Ko2E7kJS
         tI5QXQjWm0Kl3sPHRruAtUmq7D/jbP+fZQPX9OOfci5V/0sBUojJ3jyZylStcfujys3H
         qsjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777285107; x=1777889907;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbozWXvo4QjX4iElfaTeguvBAkfy1ceGfogaHli9wlI=;
        b=cfPzywy9v2GuMlRp992YOBKHIKpJEtf6eRX87E6NYTaAPtzpzlP+p+1hrrzNprcCRR
         dkPE5UICWkAkxIe0yiDkCAYw6gIO5cxM7DQli3SRv4j91oROcSkQKqVxB3gwP/jIt+Ha
         IAd9CFhToPYv+jykuEYU2hMt65jMrTq0Z+4VQxHZepzXMjvc5nAxEPX+3Wn67NrhDKtx
         9j7OU03FteJv0PwNoHJpPO8L63pCtLlpqysmObbZHjwghPInSsrGRLHL2m/a4d200+HC
         bkJzZz+576pSg1l8eh+PpTkh3Y2aesODdYdqqvpwV/V6Y7q2kMNzg55U2WS0Tk3DkCRu
         d91A==
X-Forwarded-Encrypted: i=1; AFNElJ8JPAMOIAkyUitevtJkz8q1bAFWp1tuTMEWVI5rYdxQpV2G2ww3stavQYNclX1S4EuiYmZ6msubjXVthMsRtmAO@lists.infradead.org
X-Gm-Message-State: AOJu0YwmxuNZg/2yBF98fc04WT9VpqfhjO5D1ORYdajOlyvRP7iKyEEc
	tmS++phHDJ/8Iqc1NzKnTB63uzab2CzvInX1CmFnlQXpkhdON53AnJQZkLvJ6Wny0htH5hdrNfz
	of/gKos0c66TIOUwWZ/qAIUfw0nm/2S7ka985yavZUYBfhSzFnT3Y7fu77btz0c87HpgcXnJt7n
	toyXk5+5Xj3g==
X-Gm-Gg: AeBDietP5yNSNiWQOZ9V0XFdVFXwf/SwIEupEH4Fcxk3dRBdKEKjB8kwVBR4IXKYcza
	hgxWGtogO0Z1gBXHtGreUqoIPIhZLwRllLpH3fycMk/B7SB6KerB4+Y9QRdO6Kqg9rcvO+5NhqZ
	TwbWhsvoeaLkEnc05Z+sIAb0yssrKQ5ebOf33rkyuxPMhP59GA1fWL5KU9s+DMoTQnr9xX8T8UE
	+L0YuL88LUpBEZE4GSQK3wV4jlgbEbllSgmeecHhNwkYZmwPzTMDh3eNzRDwBPVOu7Gzw9u5DYF
	5+IOcDiHqwRNpnv9SI9O7bA6dcuhkiYadSk/jbn1VJ91KuKD7uFnfRwjlvHxhxIqX1TV7wONTPj
	7eMHpKdGXCXUDcPq7m59IdHfc4vl+eCTY6eCJNkqUy2FwHbzg/uoaLKnCRoma+BtbrMvqHATTrA
	mHDj8x/bIEOcfxZw==
X-Received: by 2002:a05:6214:2466:b0:8ac:8337:ca0e with SMTP id 6a1803df08f44-8b0281d5f4cmr461283646d6.6.1777285106695;
        Mon, 27 Apr 2026 03:18:26 -0700 (PDT)
X-Received: by 2002:a05:6214:2466:b0:8ac:8337:ca0e with SMTP id 6a1803df08f44-8b0281d5f4cmr461283306d6.6.1777285106202;
        Mon, 27 Apr 2026 03:18:26 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455043cdbsm1104657566b.46.2026.04.27.03.18.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 03:18:25 -0700 (PDT)
Message-ID: <54cd62f7-bccd-40e5-be19-624cea3dd1ae@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:18:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Make important drivers default
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QT6FgYZtqXj_xi6Qr79iysS6n8tnstbX
X-Authority-Analysis: v=2.4 cv=CJEamxrD c=1 sm=1 tr=0 ts=69ef37f3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rorZNA5PaGnq6atEbW0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwOSBTYWx0ZWRfX2H20nZssimbl
 bjs4o7ilFcm/IbwQjBTtot6KPvOCy7HDglLMszKVSzcM8pI7BIys8F5TbfS4jMq+F12ZMZjvRRd
 3pUpaf+wnikeXvAfaHqiAgq81hO8w2StO5h5uSaHXXy8xopjdLg90mBTXPg0YbyluhlephghcQ4
 M0EKA5iD6rpAuuN7ijd+vfjWi4/BpOxYDS6x3L6+kB/VDziOKe58IqIIuiOHxngCzRDvClUOgy6
 HEh/yN5DfW9s+lL0YBamEjylq/t2iXRKDSI5npIfl489Q9Dqhd4+KSZeuODrxsW4xg24yY+DNQS
 lPLIbUGeR7xFbs35oigh5onAb4xZeYEb9aUic1cLSEzu0NUcxTFjhXZKcDm97Fl7v8KTiOAohMw
 2Jk08Gk8HJ4sUcEnM/sHIhysZQR/qhh7VLF4ljm1GiWezSV4KdP3L1l3nHZBMe36BpWn4zTBOV5
 emTqAQun+iCZywkiTMA==
X-Proofpoint-ORIG-GUID: QT6FgYZtqXj_xi6Qr79iysS6n8tnstbX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_031829_336083_E023B8A6 
X-CRM114-Status: GOOD (  18.34  )
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

On 4/25/26 5:55 PM, Krzysztof Kozlowski wrote:
> The main SoC TLMM (Top-Level Multiplexer) pin controller drivers are
> essential for booting up SoCs and are not really optional for a given
> platform.  Kernel should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.
> 
> Switch all Qualcomm TLMM pin controller drivers to a default 'yes' for
> ARCH_QCOM.  This has impact:
> 
> 1. arm64 defconfig: enable PINCTRL_SM7150 and PINCTRL_HAWI, which were
>    not selected before but should be, because these platforms need them
>    for proper boot.
> 
> 2. arm qcom_defconfig: no changes.
> 
> 3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bit
>    platforms, which are already enabled on qcom_defconfig.
> 
> 4. COMPILE_TEST builds: enable by default all drivers for arm or arm64
>    builds, whenever ARCH_QCOM is selected.  This has impact on build
>    time and feels logical, because if one selects ARCH_QCOM then
>    probably by default wants to build test it entirely.  Kernels with
>    COMPILE_TEST are not supposed to be used for booting.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

