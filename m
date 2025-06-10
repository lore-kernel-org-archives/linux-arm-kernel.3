Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE84C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 12:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXR00VLxmhsH+jMRE5s/YJIThaFKie022RUlAGpjRqQ=; b=Gx7QB13aPd95WXeYaxq2H4Gs+p
	f+AjeBVHciOoBrOSaoK9pUlYKNx431R7SiL6tk45zHrXSXmb6nkX7QDsNk6LOQgVdVfAQP0SZUNmC
	dQCeDHaawSzMLaBi3JkwxEeceYpIAvDc3gpbK5+DHj+nNHEtoonbUVhmelcrxJFxqTBZXXMDXkH9G
	ikCqyJxKFjvp9w1KfcKLqke0mLzdy6JOZX9fJJlNW/3NrgtipLGVzROBhNGr3rdQwAeYB7nxn/G9z
	zaRiLRyw2ee8kwXLw7NZ1XM5s7tghRCHPbxxP9THYxFgL3Ys3gtYHLRa/i/galhwp8i86hc7MElGv
	YuFiK1dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyUF-00000006qf7-28kC;
	Tue, 10 Jun 2025 12:53:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxpu-00000006jkz-1Ry7
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MXR00VLxmhsH+jMRE5s/YJIThaFKie022RUlAGpjRqQ=; b=UF7txX5KLIaptoNDgd4+blLIIE
	HcutkLhHiJlMJ6p67oNUGIHhkcHfZF5mrvPFc1derSfJlwFFgt0pXPqtWys4KhjUiv5xP5DCuQ/2Z
	yiDjJstixdf0knVBxVen6gOtjdD6Q3zNMqilODiYsOzevhR8hXqp8pn3qkTVpbG2id8MGukJlfMC1
	7RuQzovVHgKlfmQ1um2GolYGkgP73SNqPw08Vq8DW7TF18TIhz7Y3kAE907Oz5ggCzXyXgy/mw6IW
	k7xEJdikWslvW1Re9ezikbTwK11fP2JlifXs26ocBBBhrFD9GzRIAXIiOAfkAZ4HlDun9E8cuGbJ7
	AKiYm+tg==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxpr-00000001nfp-3puu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:12:13 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55AC90Ov024216;
	Tue, 10 Jun 2025 14:12:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	MXR00VLxmhsH+jMRE5s/YJIThaFKie022RUlAGpjRqQ=; b=t6dw14ZVsezx0sZs
	dftYh8TOHkwZtHKigra6IELajwcohq2X2U/EEzOrgg0UgqcCvyxyY95HhWWoKgi2
	l4ZJJjbTa8HLWqKfQm2wmIhV23PM+pZlQmpP8ZqXmB7w5Uf/sVmqzPJA0LWQ3kzx
	ZGDc3AczGGayRcDDLvlGgg5SfZ13prHfUyt+Ywh3/Jr8eSaFyEFcCezGJD7sBfT4
	yo67Out2oEAp5y//3gcZ3GC3tcrKPk8c+QbnrmIiPOzCjQ5TIcxZ2wQ28JCT4cF6
	dPSGGljjkPcfzRdCSTvtcIyJm+uXEV+vGImsJ/DQAgwWFd7J3L8SD+EZ/j+BJKwG
	ZYYf5g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aumd4ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 14:12:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id F28EA40054;
	Tue, 10 Jun 2025 14:10:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 42B8AB3A752;
	Tue, 10 Jun 2025 14:10:07 +0200 (CEST)
Received: from [10.48.86.185] (10.48.86.185) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 14:10:06 +0200
Message-ID: <60423d3e-20b2-47c7-a889-f5cbffb83734@foss.st.com>
Date: Tue, 10 Jun 2025 14:10:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] dt-bindings: pinctrl: stm32: Introduce HDP
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
References: <20250528-hdp-upstream-v4-0-7e9b3ad2036d@foss.st.com>
 <20250528-hdp-upstream-v4-2-7e9b3ad2036d@foss.st.com>
 <57667ad9-d98f-4f8b-9b70-428960765ddb@kernel.org>
Content-Language: en-US
From: Clement LE GOFFIC <clement.legoffic@foss.st.com>
In-Reply-To: <57667ad9-d98f-4f8b-9b70-428960765ddb@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.185]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_131212_104199_2E96AE35 
X-CRM114-Status: UNSURE (   8.05  )
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

On 5/29/25 11:14, Krzysztof Kozlowski wrote:
> On 28/05/2025 15:30, Clément Le Goffic wrote:
>> 'HDP' stands for Hardware Debug Port, it is an hardware block in
>> STMicrolectronics' MPUs that let the user decide which internal SoC's
>> signal to observe.
>> It provides 8 ports and for each port there is up to 16 different
>> signals that can be output.
>> Signals are different for each MPU.
>>
>> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Drop reviewed tag. It was given under assumption that you will test your
> code before sending.

Hi, yes sure, sorry for that..

> 
> 
> Best regards,
> Krzysztof

Clément

