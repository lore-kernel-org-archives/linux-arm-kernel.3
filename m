Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036BCE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 11:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YJ9JUQ5bSEMgGsZqbZA+J2STml+1V04qdkGaF/nnd20=; b=ASbSVmFBRZMC/fJya9/jDAxYsj
	8HkyjsUJHqC6d/gi+o4GUqqIV4Vz593v4Kr1fqA4//QmmWyT6X7PWfRpSvyD2l4pG5FUfSNTwNTSs
	zmdTwbp8kZDuos94kbol6goHLpWmPhTHucvyjLsYBuKQSNKO2xsrK5oObN+mF1EXkLxqlytJofQ1K
	ALMNHNSBjU/5/At2/4rRMIEFcwwQbATnoKyJwOyFC/maQPEeqBDGBnF/BxnXurfxd6Mn2Zo8FaVME
	r+IIEFWmvyw0gEPl32kcddMOiT0v9gFnO3dyGvbRGm2eyWkxCpmyxSv1M1D8MJumbX0TU0bEs1Und
	qCRTcnWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbd8-00000007QuZ-3C3b;
	Mon, 09 Dec 2024 11:08:46 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKbc5-00000007Qha-2mJH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 11:07:42 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21628b3fe7dso18014625ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 03:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733742461; x=1734347261; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YJ9JUQ5bSEMgGsZqbZA+J2STml+1V04qdkGaF/nnd20=;
        b=mLdBd88Iui/T3L+NiAfJNImgj3+ly3xi9baj+Em2kgybGgkJove+ei3aDen4xrzHEK
         G+mrZEsagp0ypTQKG2QTqxmlGt5RRLOBRDF/TnluwNlouBg3apSgz8T9VeC2MpKjrA8E
         a+m88z2S+9W84LFPf2aWpx+TszODklt5iE8PSzjbl/2aDHdiBofxMKfM8qmlRXOSKYAQ
         QeqpQmuYvpmif0HXPJNV7Nd+4uajsLGyyI0i7EJBGIkV6ielMTrUTz6Vs1ZRjWhPmDdn
         ighN6oUtPHL0zZ8aQgoZwDQhHARLnfwaUN5deAcxABtH5FL/Fc8xhqVc1ojYOfBHOdlB
         /HeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733742461; x=1734347261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YJ9JUQ5bSEMgGsZqbZA+J2STml+1V04qdkGaF/nnd20=;
        b=dUVCIoOHv4id8KGPzCs/BnLo9PMogPY5ImNBdWrpeODe9tWmMOXG0nR4k7XLXm4DcH
         2E0Q0jWVVpt4rJfUFop8FZhyRTMjhmVKMqB2udmSvs57UbHUCB3TA+yM34uBLpFWyA1O
         9jqiNRgUV0S6J6XVmOTeolGwK5VXScIAXVGuE944+qv/umXmkQ5yTrmsYwrM3TVat8nJ
         hsVWrVt5uGWiUGDoCIIfWUNVmkEsbPgVs+WfMKkrzKlUQvtT5qXbARPZ1+kXUjyrCGYR
         FjhsnCzHgyfNLLXQ1A8wYPrePw9Wt8NByMp/wmML1rDtsuWbH/47R5nGPxl9wrxm7RSb
         qRvA==
X-Forwarded-Encrypted: i=1; AJvYcCWCHM5warvl09+tofV+bS69feWRzVS/66QXRyFj4znNXQWs6LyO3c3Ec08zAMmpE7Nc/cFN3ksAega2XzhWQ+Ju@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3UH8rzO3uV2DSMO0uOMJl4u1UYS46KI5DchazXDFTtC+bQEyr
	xiuP1afuO+f8Y/vKAC68X9suL+OiroFaSCBnrtvs/A314lBPvJ/2
X-Gm-Gg: ASbGnctq31nqGHlE4D93fd+9XI5dwD7Byv0ljpZumdcjwwYo61fxKhmjnvXR2VwBLWp
	lEVBK8r/iNIG4bFcb/yRwYsGP1me+nFuIxDCe202p8BBnLGbnwG7D7L664GUaX8qQ1SrhaXS1tF
	urBD6o6cS6eAfWEd4pzMUIO+NNk9EdTMem1VUl7qkVtE/ykEnUCdtQWKsXW8BSVQAXm999VCL2Q
	qqcVjA8IGrn2TNd0AVKOsVoheA4QWwXZg0M10HrYA38rOVDbC3uhrXI3Q==
X-Google-Smtp-Source: AGHT+IHE+t2Du1WqC/+jnVLPWSG0jQUPMDd8/py9w7+kgKS309UwwhMmDAhAU/gz6Yfj4oBXSzHyqA==
X-Received: by 2002:a17:902:f607:b0:216:4883:fb43 with SMTP id d9443c01a7336-216488401a3mr47732355ad.32.1733742460654;
        Mon, 09 Dec 2024 03:07:40 -0800 (PST)
Received: from [192.168.0.122] ([59.188.211.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f3188fsm70017745ad.265.2024.12.09.03.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 03:07:40 -0800 (PST)
Message-ID: <494a944e-4088-463a-abbb-c0a8cf4455ec@gmail.com>
Date: Mon, 9 Dec 2024 19:07:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add
 bindings for Apple DWI backlight
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20241207130433.30351-1-towinchenmi@gmail.com>
 <20241207130433.30351-2-towinchenmi@gmail.com>
 <iwapssdmronnbtmlmynuarzmkd2oh3ssrmzvlobxx4ixrgwgcl@dnonaahib6jw>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <iwapssdmronnbtmlmynuarzmkd2oh3ssrmzvlobxx4ixrgwgcl@dnonaahib6jw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_030741_703696_BF6A5365 
X-CRM114-Status: UNSURE (   7.20  )
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



On 9/12/2024 17:16, Krzysztof Kozlowski wrote:
> On Sat, Dec 07, 2024 at 09:03:14PM +0800, Nick Chan wrote:
>> Add the device tree bindings for backlight controllers attached via Apple
>> DWI 2-wire interface.
[...]

Ack all the changes, will be in v4.

Nick Chan

