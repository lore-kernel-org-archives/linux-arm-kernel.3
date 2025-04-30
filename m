Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB07C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 07:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbfPCoz7K3yyLKhPzzjMngjt4hki3q6Xp4ZTRt1mSNE=; b=zCVktfMF3O5Pki1lvqVRNvVq25
	qayQgILzsbyJsBdgzPU4pBM7hgEzgLHObLedSsyvAdPo6RdVhGsVrHL/jnK/GCPHCuFPV5Leh7B8C
	y4vNy1lNH0nGMj0UZPm47ifbCc8+Ns9w7dgtth4XFtNCidSqE2xlRDGmG77YjrfyQsds+Pk1hlmAG
	7cNg5JYcFKDUDWDGjoIU4N99/PW8S8RbkFBMWmoPg2aMePvSPGg+DkQetfd18HAhvC76TyEzz5MFN
	7IBZw74oTlEQSL+kICOazIOqtkkYcSsuGyXkPKEx54lljWWbLUjpjaK+sB29l53UfkrHTnCj/Tan4
	H8ZEn+/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1uB-0000000BzrE-0hlT;
	Wed, 30 Apr 2025 07:30:55 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1aD-0000000Bx1M-04OB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:10:18 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TLZWIJ026622;
	Wed, 30 Apr 2025 09:10:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	PbfPCoz7K3yyLKhPzzjMngjt4hki3q6Xp4ZTRt1mSNE=; b=Blt/qIucYIVVVjdF
	ZXX1VYBNOpLeOwvWCmP850xclhl8KSwzXUefbVFvV7gP6aYxTVfJddEsKwJ+EdA3
	h5AhP3EBcF3QN3bZMT1mBUWb/QTw1p1nvg9RLM1rrtYu0CzjldTqoIVVpL12aA6s
	l+uIm20CzooNw6RyT1MJ7Vi2GbVUhTshXYRdp8FfJe8estFLaH1F3y8Rg43tq88a
	JI8emqTt1e7x0i9q3sKy3W7RTU3srgWsCLJLJ7oOhWunaniTIYqibSwaJtVZrsAG
	yNvShTkfwupYfGkiwj/veUpfd5HFNZUVuXxeX7LnIquylZbSXaVHwN9RDFhbuxye
	sJuokg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46b6tmsjbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Apr 2025 09:10:00 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 948604005E;
	Wed, 30 Apr 2025 09:08:47 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A6E6FA564C6;
	Wed, 30 Apr 2025 09:06:00 +0200 (CEST)
Received: from [10.48.86.79] (10.48.86.79) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Apr
 2025 09:06:00 +0200
Message-ID: <ae61407f-81fe-43a6-bdb6-1d1a58ed67de@foss.st.com>
Date: Wed, 30 Apr 2025 09:05:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: st: stm32: Align wifi node name with bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Christoph
 Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@denx.de>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <kernel@dh-electronics.com>
References: <20250424084706.105049-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20250424084706.105049-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_02,2025-04-24_02,2025-02-21_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_001017_333394_BF49F9FF 
X-CRM114-Status: UNSURE (   6.00  )
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

Hi Krzysztof

On 4/24/25 10:47, Krzysztof Kozlowski wrote:
> Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
> wireless-controller.yaml schema"), bindings expect 'wifi' as node name:
> 
>    stm32h750i-art-pi.dtb: bcrmf@1: $nodename:0: 'bcrmf@1' does not match '^wifi(@.*)?$'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied on stm32-next.

thanks

