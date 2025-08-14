Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B17CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 14:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5fKCMwHQw3vs0QKmCY7jnj2QoZaEjMZpEYfpWJOqqSs=; b=CDRYAWZJm8vDYifbjlyECcIi1A
	Lk4os3BAx7H7KnL7ZMQbogbTrbvfur2i8teYayaut/ZEMmgeYg0T5yn/koKVmLEU7HpRftFm371rY
	V16rLRUUSTBOZNn+QDaRULohn3IsgwHzT+vU/sVSda6w+e0laNKsXWfHp/IajUDz06p3gBl5nMwQ/
	Waw27olRCZ6qgJJsECRUpCVvttPth8OxHdnuwlbmp8NrY+UnzEqQsZAnLt2wm00dntF6eSF0z9Gsz
	eYlhg436SA70z0Ca8XtsbYGrfeASAhPr8Vj+oFohrriST87Ii46pyYn3gRtXHs35l/XpfDs8ayVOd
	eTVqYrFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZDs-0000000HJXp-32Ob;
	Thu, 14 Aug 2025 14:46:32 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXG5-0000000Gs0T-0lX9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 12:40:42 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57ECZQJ4025611;
	Thu, 14 Aug 2025 14:40:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	5fKCMwHQw3vs0QKmCY7jnj2QoZaEjMZpEYfpWJOqqSs=; b=4q5M/wLhYIAq9Tba
	VNQeiHKNYqpAGYn2zILS0VezA5Uq6pnqUZsmPqLfPQzF+UBbKqYF67e/GeufbKY8
	jJpkZ/MMNM1Pknc0uKPEgN92k1KocX3nrxe8UR7sKv4iyFOyAwo6CY93Ubf5DYja
	Oxzu15QnqwQXCx6g9RmzARa0rRAu/yda0O1IHYPgo9vMKKoFvxQ5Zr8MMuwVAMUl
	q29Mpet3JUObDmC0zWcQo98V2XjvO4K+QQ7QFpM3PnxzKJYcDxy7JZZjjwHkEcY7
	vNxt/Oy2PhZAQULdtIpr422XsBfkzmveyaRBVsnwHvVkE5mMii+QOqGz08SSvYQk
	Pe8ZcQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48dw7gk7xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 14:40:28 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 058954004F;
	Thu, 14 Aug 2025 14:39:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5990471FD89;
	Thu, 14 Aug 2025 14:38:14 +0200 (CEST)
Received: from [10.252.20.8] (10.252.20.8) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 14:38:13 +0200
Message-ID: <ac0409ee-b953-4892-961d-4fcfe6007816@foss.st.com>
Date: Thu, 14 Aug 2025 14:38:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] dt-bindings: display: st: add new compatible to
 LTDC device
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Yannick Fertre <yannick.fertre@foss.st.com>,
        Philippe Cornu
	<philippe.cornu@foss.st.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>,
        <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250812-drm-misc-next-v2-0-132fd84463d7@foss.st.com>
 <20250812-drm-misc-next-v2-1-132fd84463d7@foss.st.com>
 <20250814-resolute-lime-raven-de4fa5@kuoka>
Content-Language: en-US
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250814-resolute-lime-raven-de4fa5@kuoka>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.20.8]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-14_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_054041_477987_5D401DF0 
X-CRM114-Status: UNSURE (   7.95  )
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



On 8/14/25 11:08, Krzysztof Kozlowski wrote:
> On Tue, Aug 12, 2025 at 03:48:58PM +0200, Raphael Gallais-Pou wrote:
>> +else:
>> +  properties:
>> +    clocks:
>> +      maxItems: 4
> minItems instead
>
>> +    clock-names:
>> +      maxItems: 4
> minItems instead

Ack, indeed I wrongly clamped the values here.

Best regards,
Raphaël
>
>> +
>>  additionalProperties: false
> Best regards,
> Krzysztof
>


