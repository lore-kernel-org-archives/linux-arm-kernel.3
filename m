Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D86C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rbT+/LcXhnguYXXSk/7BxGc8Wpdz3ZyHLa8xXsRBNrQ=; b=FfLuvr9XvSMybyKUhDsdyBSEDu
	5NCljdDtqUKw8y5gZEFUJPmEYJy9+ri7cUyCXmGTQ5Novm5D0nSbwdx2Rhf0RlJFse26gza9e7ums
	OJVEiEhOpK+GrtMQlIngTywWeQWuUANbOpXTDfxByICpTPsoaQJjL21tkfPKBZuFX7Oxa5YC1Ua2Q
	8/x1hYNSJfYT4k0ZLVBDfz6rbn2YFBE65jvuTtvFfPP+y9RCPv8xZNAf2n0it04SS8qa+tPBD41FD
	F37afcBFZyTMb/GhXWE+UPPtFczlhnwYWx8x50vpaALxq06QZiJQepYFLeOsClD87x0gZBGx/nJTO
	Q6XWLQnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyPz-00000006pmx-0U3y;
	Tue, 10 Jun 2025 12:49:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxng-00000006jRO-1DdT
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:09:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rbT+/LcXhnguYXXSk/7BxGc8Wpdz3ZyHLa8xXsRBNrQ=; b=VOfoRUWUttWvqaiNJD12Kf785B
	MAzeEQVh/D4dKI1ivpcJXUYrvwXyZPV33ujAFAod5jfZsiX1R/shaSttK2X/5KDkDvXX39QgJTu8M
	ByNihccEkeJ2mzRHp4+q31B0p9+c0narTN/kQ4hqWPBw+F0reZvt+Jkgpu9tE0tcEJ+SAIJ9Jy9HD
	R03koARTEc21bF/4vHDX+1eQ6lcUaFP7nuYK5nMFmYrw6IqyrbM1gD87L4hrMwq2yHpBXRMZHjdSV
	TQ2Ell82HJGAp0KOuMv0g8sK97HEGgDLVy7bCx13829RLFQafnZTXqBfFfwBbO7Tj9kE/dHloYdQV
	gfJZrwYQ==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxne-00000001nby-1TBg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:09:56 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AC92oj024409;
	Tue, 10 Jun 2025 14:09:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	rbT+/LcXhnguYXXSk/7BxGc8Wpdz3ZyHLa8xXsRBNrQ=; b=fnDqXI6O+WJPistn
	bnZ8DY90tUXzuIBXtkCiwKYbQ0yuNFQecwxgJs/UlcPmsZrU2CYGPmTYSYmeZHOj
	d1cwA+XuSl4xlbDUgNjsNZFueqhF7omyMWhJBDZLcyDmwHJloTFXQcDrWB9t7Zfi
	R8NICF8GKNtMa1wWdwZflkEOHzfYOCCXd9lLfloPdd/+2Xdm3R1pizI6oATBcHGj
	Xv8ZLdGa/f8d3eRrh8J/edSZpBF63QbwVD6xsN1woB5EezODMS1rKZcfP5B/8azg
	ZzYoPNt/P5DXh3c/zWfQUTHVRZI9nR2TCnV2gzZQ3oZvabmZTbNMoqcMlufQNS6e
	RLzqkA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cahm10e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 14:09:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 69F014006E;
	Tue, 10 Jun 2025 14:08:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id F3843B394F9;
	Tue, 10 Jun 2025 14:07:48 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 14:07:48 +0200
Message-ID: <7f7d6fb3-f696-4dd4-ac19-e5d77134a061@foss.st.com>
Date: Tue, 10 Jun 2025 14:07:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] ARM: dts: stm32: add alternate pinmux for HDP pin
 and add HDP pinctrl node
To: Linus Walleij <linus.walleij@linaro.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
 <20250523-hdp-upstream-v3-8-bd6ca199466a@foss.st.com>
 <CACRpkdaXY1=v_HY9-PDZ=HYwJrP7P8ncZoCDm1da=vxoEazD4Q@mail.gmail.com>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <CACRpkdaXY1=v_HY9-PDZ=HYwJrP7P8ncZoCDm1da=vxoEazD4Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_130954_498377_670FD253 
X-CRM114-Status: UNSURE (   9.49  )
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

On 6/5/25 14:57, Linus Walleij wrote:
> On Fri, May 23, 2025 at 2:40 PM Clément Le Goffic
> <clement.legoffic@foss.st.com> wrote:
> 
>> Introduce hdp node to output a user defined value on port hdp2.
>> Add pinctrl nodes to be able to output this signal on one SoC pin.
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> 
> That's nice, this is exactly how pin control is supposed to be
> used!

Hi Linus, thank you!

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Yours,
> Linus Walleij


