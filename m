Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D714EB26FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 18:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKIUStnyR1RHKjtab0jKusCwDIO6oXe4Ewa6kn0Y0TY=; b=EJE0P7IqzGmv9Is6HpThSOkM61
	XbVz0ccKL8UkWulFRPeqaN4MmSZFGObf5ErUMqWtiiiRTkki/SfNwVxfihCfgJfwfB2BqlJIq1oOf
	OI/runRmd+0xSyTkPKfZ8sOaBLWUfT4RdsyhhpU5jaZ48dtatKVzJ4UcOMM2852n5lWVrldMDQnfu
	etkke0QcOtmFUrFXV80fcx0+gieR4F5Q2Q4DI4y3W56U7zfqSX8okY+F7danVuuyludcLMSEXR/X9
	FVMwfVx49Sw9SPtLesUk+wO155+pPdBoCjR5HIuBwcakgn2dtoVYUYhLUpXtUyzRLOnmIBRAFkxC0
	xWyM7qnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpswA-0000000HPb7-40BS;
	Tue, 10 Feb 2026 18:58:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpsw7-0000000HPac-3Ywg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 18:58:13 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AHT3N03005354
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 18:58:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JKIUStnyR1RHKjtab0jKusCwDIO6oXe4Ewa6kn0Y0TY=; b=bbBsxj8dml/vd+UA
	n+VCNCAU/5ceLksVgXSXee1tqX+4HAtTaa4wpN8p+FO45hRbf3K6dy6S787gRL8M
	PkkUMqBYk6Oqvp/Q/u56zytBYAE5kGaCSsjjwp8x/tJ3leZqR75DyXhWmzk7ulf+
	R0C3vTTKwEyPPhoX0KTD2iNgWnosLmWbrhCcTpF4Ot+lCQ/ziNLPpZFiSMT8e/os
	ed8CuU4oHD7+svfCNqqXCsu0JNJ3vYk1MXwnopzXJcVjMBsb2XWqR0TDBtzjTT85
	np1lUY2twt8Hk9GxsVIJLk6xCGty2+MEJn69UYclz3cDrwHnAL1QLAg/WZIHcybf
	4Ew/DQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8942g8vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 18:58:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ba6ad2ca1fso14251794eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Feb 2026 10:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770749889; x=1771354689; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JKIUStnyR1RHKjtab0jKusCwDIO6oXe4Ewa6kn0Y0TY=;
        b=GccQf+GBF36M9jMnVXCiVmHWZKDj4XnstOSulyS/deOu5zqEXZsfE+CgGePYEPlEy9
         ASYRzlFloSSapUx8Tcs/fYMEdgAC2ii27f4KuzCsfrnlNf+p7PiPpSRNiRKZQCkFwnoC
         UZlr4B7lv1eni/3F/CGC7zYUlAk7vip6+il+wGqOzpNwXL9qEe8SQGOvKUkRPEEXR331
         MnbsdM+ELps0a8rYtT562TRKLzx1uZECTT/QQnOq2loVzz/EDeNUSzb9GJd4ZN9Q03Up
         FxCN+nl98gYzoG23OKspMUXx7av09Rv2slrBHoJ0jdwuhyEzoNgLhOBUtmgEftX3Apzg
         9blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770749889; x=1771354689;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JKIUStnyR1RHKjtab0jKusCwDIO6oXe4Ewa6kn0Y0TY=;
        b=YSoratvml65TBwVxnDoAUCxLy9ahMpTbm/KCPLIqResc2RXgfh35k+YAWHeFudsWtS
         iPjlUqN6zJB4EIupl8oyHmB+P8yZqHqIVC2XSz7Bw+gEkMalV/fFmozN0KH90TUWE3SQ
         lbu56FaW041sweC8vkTkobIIbk7wMtRbuFdqGGQDnbqoQRvWqoeijdNlydTaFJJXwITV
         HvD77UGm8sTm8jlmNx9z1+EeHIR5gmRNEUeFU7WOF6XOkBqNWbsa/q7dt48XwUb5WyQP
         Qmqy4MErx+vVYKuaLmUfgQf3aPHfu04SX+Ks3Giikq1xqDVY3ETGTprFdbVLTp2uuTRB
         Xqbg==
X-Gm-Message-State: AOJu0YwDedvgWYPTSgg+YGQ2MVw+s/vyrMnKa4c96l8n7YN+LE2SSpl3
	TXFo12EiAuM/XmG96Sk5uaZIvIkphAARyGFo65+3aXV9j096Jgg2zmfTXeySfcNtxwwZT7EpEQM
	AxT7vmcScQ8xfAI++CigFBVNZBA9QECEwnqqm4D0V3m/6/tszFvoHuQJPjIj0C9KA2rmLzicuGB
	eWzg==
X-Gm-Gg: AZuq6aLZpNperX4aRhGZ2OPqp5Byi2oY0E+7Wxlq9Rh1iBvEMz2r1UCNe5ADU5H/72O
	RihM5fjXbiH3sq3M8OcRv7Jmm73FquxHu7YH8OFxfALNhFmdHANR7OTWBbIamg7bOkhW9jcrZR8
	3G3jslDXCLL0mubHitUVpXcAHYnLDOUr99DqSp8EPogfGTtSMHMxQAHTNlXezAYbhnnkTHMTZB8
	RrMCj+6UVPOzrpJOqYGIQDw2c3rqpRyBPU7kQrUL0OPlRCz97FoAQHZctZdXGsV8VNK5+tGmNyq
	wGOwLwDcUtqXnxr5wDgy8qcBzavzDcoXYXaO4YnQexutzEfGbuxRxXiFiqRMFTonlUp4tYY+oyT
	SBlYHShNG0BuCYpye8ZJLbLGf+PNg1nCYmMobbYWznV3UtJ8oI5Z/6zI=
X-Received: by 2002:a05:7300:fd03:b0:2b7:ffc4:ee45 with SMTP id 5a478bee46e88-2ba8a847312mr1284574eec.28.1770749888503;
        Tue, 10 Feb 2026 10:58:08 -0800 (PST)
X-Received: by 2002:a05:7300:fd03:b0:2b7:ffc4:ee45 with SMTP id 5a478bee46e88-2ba8a847312mr1284561eec.28.1770749887816;
        Tue, 10 Feb 2026 10:58:07 -0800 (PST)
Received: from [192.168.86.165] ([76.176.48.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b86b800c47sm7896914eec.12.2026.02.10.10.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 10:58:07 -0800 (PST)
Message-ID: <f151a8ba-b76c-4037-b1aa-b6b52e92b7e1@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:58:03 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/35] KVM: arm64: Add support for protected guest
 memory with pKVM
To: Will Deacon <will@kernel.org>, kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu
 <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Quentin Perret <qperret@google.com>, Fuad Tabba <tabba@google.com>,
        Vincent Donnefort <vdonnefort@google.com>,
        Mostafa Saleh <smostafa@google.com>
References: <20260119124629.2563-1-will@kernel.org>
Content-Language: en-US
From: Trilok Soni <trilokkumar.soni@oss.qualcomm.com>
In-Reply-To: <20260119124629.2563-1-will@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=U42fzOru c=1 sm=1 tr=0 ts=698b7fc1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=lsoD3MMNObdLvy1227ExmA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=di51ST-lB5JxRLjaeOkA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: W9jQmHZ5YcHzcKQ7LsYpd-G2x0seFzv0
X-Proofpoint-ORIG-GUID: W9jQmHZ5YcHzcKQ7LsYpd-G2x0seFzv0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE1OCBTYWx0ZWRfX8cflM4H9qkuB
 whiV6d1tKWKj73y6gJ60/mMAVQ/r6ZskaoZeyHbbJJ4Irzt1mdxqrdGeKJLTEH4JD3BbTLll9HY
 Moh8p2fWH/mY7zSSqN197DwPzf2po47JNphedHyHTnAVkRHSTuR5pfm8oHj6jm7qtIRDmn3cBJ1
 sx9XJ4HYR5T7oFbWDYL06TflsJq90CXpSAM06/T9Y183bPO3s+LULkhgApy1jsb5c/6ujZq3B39
 qaq4Hp3YdpyDG9mFxssaCv6X/RzI0QZd0iR3BgG97o7JdEdjeDX9M0W9ADUdZyy4MtfK/IKWTKw
 4waPXoCSG0d5oDRMiB3aSa3FVI5n8jd7lqNE9npez/uBvYr/DD9BjfJyRHOoLWNSrnowmt2DEfV
 kQQR9no7sM52m20ut77u8SJEEjXhEFJh0vGae3Kmz2jndCwLYCD8me4qSkjip+KAqiWLyfaDNIe
 ZiDcj22/8VOAdFWvLXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_02,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_105811_906901_A9C4CCFA 
X-CRM114-Status: GOOD (  14.50  )
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

On 1/19/2026 4:45 AM, Will Deacon wrote:
> Hi folks,
> 
> It's back and it's even bigger than before!
> 
> Although the first patch has been picked up as a fix (thanks, Oliver),
> review feedback has resulted in some additional patches being included
> in the series. If you'd like to see the first version, it's available
> here:

Is it possible to test this patch series w/ the QEMU or it will require
real SOC platform? 

---Trilok Soni

