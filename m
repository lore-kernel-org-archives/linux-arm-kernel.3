Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CCBBD72345
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 07:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BybO1XLVfdhod5yqmV9OoExkCCsTqBLc4oAzOMgKi/0=; b=TJkGs4ZdS6Ejf2IPxFG4jKWJUX
	Oj5dDqXewREDTAsvRpSEVBTlVdMcANdYlaxezqtjvQvzTixHOsK6oxseihtDoJ/gseebJEiXCKLEr
	HGXBD3iJ4VUmn9uctKqQ1U3UgrUYUKSUQkJmVfooGYHEnDzA7EVGrUJuiQOw1YETRZJqTwVI99rCf
	yWtQlmldBc7wxi/57qsXgeZmAfvLUFADXit9zr7fJYpTPJkT5vODCCJazX/l9/TlrHef/EtXkw8ZF
	cUI7UKIZzRzzNFKL533E11HOoRcVgZbmEHPnJqSi7npTFT9+wBzqsM5YMpqLStbSWFtgwcxh+0M91
	BxDBYztw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBn6-00000008O05-2OjW;
	Fri, 23 Jan 2026 07:41:12 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjBn4-00000008Nzk-0m9N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 07:41:11 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3530e7b3dc2so1890597a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 23:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769154069; x=1769758869; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BybO1XLVfdhod5yqmV9OoExkCCsTqBLc4oAzOMgKi/0=;
        b=Y7nwKjxvGqdp+JHlLtlh0+MlAiYoFFdHQop+w96t/JMgukMhrYzAi8eFYPW/pGCZ/O
         YfSAX2fkDLfbgxqb1Siq/V8suvnCS6F6j6S5gj44GwOv9goKHh4iH3yqPKZvw13dPltK
         kc/968NVK6UA7EAM+11ChMyiAHyO0rbOjI42ZMHywpbKWD/a2e0zK2iydVLHNWRBAaeO
         okABLXMs7z8MnaT+rQusHlFv2UUPXaT3oKcMF4/dAcx/teC5y+Wy4sctEOxitAqvo8lf
         GaP5L666jK+Ks2XPxxfBjRuuvgFAY71mnlYAnXFYkcokItB+Pt9jxH9Z3mcAJPRq63Zx
         6kxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769154069; x=1769758869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BybO1XLVfdhod5yqmV9OoExkCCsTqBLc4oAzOMgKi/0=;
        b=hvuv04GWii5L3GfBQumKcVyh5voMw+PuR94TkNOUYddc1Qssb5LexROzzeOr6GQEqN
         U2HHmsU1IrE/1xDCeQUyaC5xyCpVUF1EWJe4e/7EWvthFmbuF1Am9vWkczQsQDLNyPA9
         TqJ1D1qwEmKcHXJUAJ5j8hCFAe/3WzEzzCap6w19ufohpMUBm5zgY/msfCuXyfWjx3g6
         veHonetbY4XeyDBmN8TPmN+AGkOm5tLJqceVpACOjqUCK899UqPb+RWwHebdY2SyD9MS
         t75w3wpdTJ9iP7p264fgjVXc1VvzMAdc3fJ7Zu+7QMEkjm1PChLoUgWx9c/U7mf7bAq8
         J1Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVqpuSbGYqXG/5d8GMy4sAhoPeSXmTMGp/EjY5Wbn/gbf02yrqKUu7oNtMFBbJDJkGeNkK1pxbWvgj9JxxrrCCL@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs1bU6Daz792KLQvB8rFenYK/orHifXuwBWKUK/qlvhRftQcC6
	hHC5cBEGndFZvi7YOT13tJUJPfKFA1QF3grFtqgcSgzduig3wi+ZGsNo
X-Gm-Gg: AZuq6aKF/4a7gTqmf8FeetbVa5F4X4YqdX2jeq/FKh9njV8/QQApZ5hOTD2I8SFWmTo
	LECExzF40IBOPgaI7iK8dBG9F72AKBh63StmBEr/sPkCDlwtnjjMW4x0bRz7drRxjEBIt1rxMOh
	dmgQKc9iARmn7dxAq4oc1Ccdttd0j6j/fJBtQ87/lb08X9pLtjuBlArOeqitcnDeIA3PHiSqHdy
	19ECZDikQZwCTxSPMdXMsRaFb2NxUuY/zfISre63Okrz3Yx9Z0V2DqWzQckPg8mLD9n3vE5HN8U
	C/qes1sJ9wpYJCoUtbtpkFn1FYgywCiPWbWL92JYGIONB1ifdMgzzWYqw5c8v6CeAq1L5WTkIZZ
	gGAq3MvP5KEtK60Hk31EGQjnn3LgNaCyVVs+0JzkS+Og12Qv2nYqcxQhSTOpRM0sf/ZnBl0+Wdp
	gZh8vs5duaWcsZ
X-Received: by 2002:a17:90b:2d8c:b0:33b:be31:8194 with SMTP id 98e67ed59e1d1-3536911f08amr1801422a91.34.1769154068601;
        Thu, 22 Jan 2026 23:41:08 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536dc506dbsm1276411a91.14.2026.01.22.23.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 23:41:07 -0800 (PST)
Message-ID: <abf12a3f-9cdd-472d-a02e-af4da594b84f@gmail.com>
Date: Thu, 22 Jan 2026 23:39:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: ethernet: eswin: add clock sampling
 control
To: Andrew Lunn <andrew@lunn.ch>, =?UTF-8?B?5p2O5b+X?=
 <lizhi2@eswincomputing.com>
Cc: devicetree@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 rmk+kernel@armlinux.org.uk, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ningyu@eswincomputing.com, linmin@eswincomputing.com,
 pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com
References: <20260109080601.1262-1-lizhi2@eswincomputing.com>
 <20260109080859.1285-1-lizhi2@eswincomputing.com>
 <00b7b42f-2f9d-402a-82f0-21641ea894a1@lunn.ch>
 <308b676.2d03.19bb0caebed.Coremail.lizhi2@eswincomputing.com>
 <59cec617-0189-4dc3-bc3f-6346155a62ae@lunn.ch>
 <4e2a55e7.3662.19be8cb9c3c.Coremail.lizhi2@eswincomputing.com>
 <c5c0bfdb-316d-4796-afa0-f6f018ceb414@lunn.ch>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <c5c0bfdb-316d-4796-afa0-f6f018ceb414@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_234110_234229_56C9C7BC 
X-CRM114-Status: GOOD (  14.17  )
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

Hi Andrew,

On 1/22/26 19:19, Andrew Lunn wrote:
>>> You say internal. So the skew is fixed, it is a property of the
>>> silicon? If so, why a DT property? Why not just hard code it in the
>>> driver? Since it is internal, different boards should not need it set
>>> differently?
>>>
>> Thanks for the question.
>>
>> EIC7700 has two Ethernet MACs. Only eth1 has this internal RXC/RXD skew,
>> eth0 does not.
>>
>> So this is not a chip-wide constant that can be hardcoded in the driver.
>> We need a way to distinguish the two MAC instances, which is why this is
>> described per-port in DTS.
> 
> I assume the address of the interface is fixed. So you can just key
> off that to distinguish the two instances.
> 
> Since this is an internal property, not a board property, it is not
> clear it actually belongs on DT.
> 
>      Andrew

IMO, they should be in DT to provide maximum flexibility. The SoC .dtsi
can provide some sane defaults, and the board vendor can later override
them if the mac/phy requires further tuning. Applying such tuning by
the address of MAC seems messy and it hides the parameters used behind
driver. Through DT, everything becomes really clear.

I assume this is not uncommon: E.g., starfive/jh7110:
https://lore.kernel.org/all/20230714104521.18751-3-samin.guo@starfivetech.com/

BTW, no need to worry about backward compat. ESWIN hasn't checked-in any
DT for eth yet. As you and Russell said, they need to do it, pronto.

Bo

