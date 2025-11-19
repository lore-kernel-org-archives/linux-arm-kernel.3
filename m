Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10362CF34B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 14:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5eyCNmwWmDeNycXwiGh5ANHQUbpJfYnNW5Wx/BlGZLw=; b=wEEVhosmhmUhb7+XW5qMcgbn+3
	mQ5GDPlU5H/mOK4jn7K449rqx4fZf7HVhP0xecBZ/AZYIr+a+kKNzUfRAGMSkBqW8+p8Y2roFNPzM
	wLwTV6MDKLGxBRYTJbwn/AkDT2iA9WgR9xUorSLNmEizRXKL3MUGtg/VAnzU2MTw2QOFJVyYiGDtl
	zKsF6+I2p/lKZacS95gSJV74AKfsQLg955MvJhC7kD2triuk+yUfN04yhZCkxNe1it82KPVC2n6rd
	xeQqipdE4fPeTnEioZU0wBodCFVOp4qKQhZaaEIxhwsJNAusE2/2vbwXIRBhkQ6EHoetTpmO2dRu9
	eyvFfwUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLinQ-00000003L7q-08rS;
	Wed, 19 Nov 2025 14:04:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLinN-00000003L7D-1Hel
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 14:04:30 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJBe29f536943
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 14:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5eyCNmwWmDeNycXwiGh5ANHQUbpJfYnNW5Wx/BlGZLw=; b=hlANfVQU4adiwS26
	xTp9AC4R0M2msa6V9XVu3RrqwzGNAMicSjFkyErG8NHMKbQRH74rKyERzqGxY3W7
	NnrpbyGfQtqs6II959agMcFjTg1+77J9HL12fUsZEqh/XhN2ws2wivVKhJN0DKs1
	pncSt9AVjZ1Dsb8muflVgiTJNcXhfbgsh9Ex/VfeorMx5o+1LMjhiK0+Xyjfougm
	sDn6HSkHYFHtfrekP1F8Wly8wixwGP9vrZf7ORk5jILEva6NbsnNJi396aXapi3v
	3PKphYB8KokgvXFRFpajjs4hyHlgkKVfl3ZsG4K1MjYWk+WuMWho41injpMUMJLn
	5FULYw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ah65t1r6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 14:04:28 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-55955f44aebso756231e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 06:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763561067; x=1764165867; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5eyCNmwWmDeNycXwiGh5ANHQUbpJfYnNW5Wx/BlGZLw=;
        b=i+N7Ij7TMmW7UTkfJGqcfcjFFH2D+VPqeurSbehUD2Q1AouaEyJSPyqscsu9AYeCUd
         4sMd5fohfTfA8pEKoGMZ3xGXX1mbhgaycOkRPwVT35OYVaiGOB8syaXfS1kb5zjsJdc7
         r7q3z//11z1t5KY33jOlwoW4SEWFN1IZfsWWqpbj/G65PVfHO9tKEzRn29m7lmKtJ1Ne
         fOOItMRyJ9HOqU5xmAU0/Tu5rM1F82FKvxgFkwXjkqO/39SyRZdfP8H6es+xSwyihMrD
         qd1NurpLpCGcdFlwwebl3jPkZnTixKIwNsvQNQuMolXIoiguekz1ACibMLfU3UCoslFe
         e9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763561067; x=1764165867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5eyCNmwWmDeNycXwiGh5ANHQUbpJfYnNW5Wx/BlGZLw=;
        b=hlO01jlEq9Q7QdGlRkNyAUeMthYLhR4vicMAA3bP3g+Dny0AMKrOlDNhXhxRQ5QU0Z
         T0N65nvT+f4uWxk8mpMzxGsa6/09/BD2TOy4kuein6WgUp1FllsUtn9tcTa609Znr0eE
         2AP/+w2OKiAmKF+MgoCPcs3QMikoypc1P+1YM4yvNNhxQdLGoHLe2Q1RwGdI8FDDqcs9
         I0DOzOsOuP3ITZOEiKBnuXDr/OwUA+Z7POoiWZPl1m8hGdliJ8KWScrlGPWx7OZwBA3+
         eUrYU0mu9r5PUrjQT5cKMNubWb1oY2DkVDl04j505lYx4Py37k5mZPaCzTe6xDRVqytq
         GdPg==
X-Forwarded-Encrypted: i=1; AJvYcCXbUyvVWgxJC/99AN+lU0Dbyv1J+XsRu56NLjhQOT0kQFhnwRA84fN1TTxo7XSLKAm6WcBEQt2N/Rp1eVB4HbOO@lists.infradead.org
X-Gm-Message-State: AOJu0YzS6N/+HZGnR2yvZVcnFYodGKje5xwrAWYKd7M0w975iS6T58Pn
	1FY61nZsyFikBeGpUYdtQXSV++9TQBelsbbMOER7QOeYVYLxu9QdwMln6ALwO6nGpzzlKYsqTcs
	3HZ5RAY3eZkiLg5NjO6Zu3V3L7cApQrlE5W/GUSwktRuR96JULrakLClDA85qtHRiUtudKzgS8R
	iRhQ==
X-Gm-Gg: ASbGncs0g8ZNp70fA2LLYmK7j3wteMys5RLe0iAqmPXKep4qq+wmLmfYr52L4UadgX0
	b6iXAPsmqZKC8RmvS8tkGaP3gkHAQZpQL/jhO1WqLTl4rqCHUlSYCeYRtuVv0I2nL7/lgGbMa6F
	Uo7JNXuajPqCrXJ+GfSqyVmFDvbmEkWa4k+Ey0Hm5B9nTZ2TW05pZNiwlgjMDdsIpSaWv0Ho6BS
	Ogab7ksbT5RBd/2zSPK0oc4rIFOHbAFa9G0/dxqyyghbBlR3a9pdZfahQkh5sHqscFg6zayrn/c
	ubbmGy5PTkC9jlupUIKvilVVcHNkBlRvAnfCbjB9EM2YE0EObA5JiQWb0fsmVyh8zepkuS9bH4r
	hkTo3uS+XkMCzbgAd3rzZlwnMQPFX7E6xLIO306vBwj54TK3+tHGRCUokVNyrSP4BYVI=
X-Received: by 2002:a05:6123:542:10b0:559:a30f:1648 with SMTP id 71dfb90a1353d-55b5ffb13eamr1091227e0c.0.1763561067064;
        Wed, 19 Nov 2025 06:04:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGozAIOyuCaP/CpSUrDdBNesIlCHdEhqQKyEjU3wClthJpKPW+79NQz3R96LxB0U2cncCgMVA==
X-Received: by 2002:a05:6123:542:10b0:559:a30f:1648 with SMTP id 71dfb90a1353d-55b5ffb13eamr1091177e0c.0.1763561066565;
        Wed, 19 Nov 2025 06:04:26 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a497ffdsm15258514a12.21.2025.11.19.06.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 06:04:25 -0800 (PST)
Message-ID: <76d153cf-8048-4c6f-8765-51741de78298@oss.qualcomm.com>
Date: Wed, 19 Nov 2025 15:04:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] net: stmmac: qcom-ethqos: use u32 for rgmii
 read/write/update
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
 <E1vLgSO-0000000FMrF-3uB1@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <E1vLgSO-0000000FMrF-3uB1@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=avK/yCZV c=1 sm=1 tr=0 ts=691dce6c cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8
 a=jDdzDUYIFSdt8Bpb0fgA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDExMiBTYWx0ZWRfX1AHhy3p720cb
 XzBIRxrKzHW6pzt/PqjZKx/dDUxq3xiV6WMqp7MYOC4hf207Oyzx/y8kw2q2VXT0fQ8x1ThU98+
 IJ/EXL1a+jyC4CRCNYzD5VdAuLtlHb9m/M1GyPRteMgTP17L9z4jaIG/Md9wSTRMOe+b4pVPc68
 Z/cAz0QTNhJIxBYBVYjcRwFGy3LRstgiZW1qUe18TT08lYxmhCx7hpUCaIMV9vFuW77sH1dI8Dx
 pxEdpq4P5d8TbMR5OMVIj1eDQIvS2K5wVd7LGM2zWDmCtzVQNRq4P9u291BDBV8RGi97l49vn0G
 f81lYerB8rqViqkD4B9U96/IYMb7cPFYTv+je4CtLIP0zKEoQMlI0oilrsDPF5mrcTqcIIIa1jr
 7s99gQvPz+Ql0vR3hcu3fcAn6Kg94Q==
X-Proofpoint-GUID: WwEX8Jub2b_TPZKoRhi1dtfrWvMw-It6
X-Proofpoint-ORIG-GUID: WwEX8Jub2b_TPZKoRhi1dtfrWvMw-It6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_04,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_060429_379710_EA09F13C 
X-CRM114-Status: GOOD (  16.75  )
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

On 11/19/25 12:34 PM, Russell King (Oracle) wrote:
> readl() returns a u32, and writel() takes a "u32" for the value. These
> are used in rgmii_readl()() and rgmii_writel(), but the value and
> return are "int". As these are 32-bit register values which are not
> signed, use "u32".
> 
> These changes do not cause generated code changes.
> 
> Update rgmii_updatel() to use u32 for mask and val. Changing "mask"
> to "u32" also does not cause generated code changes. However, changing
> "val" causes the generated assembly to be re-ordered for aarch64.

No changes, on clang 21.1.5 at least

> 
> Update the temporary variables used with the rgmii functions to use
> u32.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

