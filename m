Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5D0CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 14:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qq6eAfjOAZ4Lfq7LauQf4bjJ3RlF5Fcl+6rJ1tXLLa4=; b=fdaXuul15sE5SXwlEd6MJDfhiJ
	u041kAh26dmeYoWoXA1OdlLSkvuu8srb0EfBa7Q0bPhIA8kRQ5lluH50raeo2yd3m4UKjfUW0RygT
	xLgj0JTfJuASZT03V3AmKyCJG28iHX17fmQ/mm6EERhGYVJp9kaLRbCzPaA2A9lUfhR2+qirNq2AJ
	okvhqyrq64YZw6VkEWnTdLbkd8M6F5bZOHEcHbfk+p7/Upr6nYbt/mo1WArKudBgWRVVxl2W0iV53
	3+ekXUrXCsjn/kKW7DwhWGBad0yNVueKcQA9yDWVzm/MTQtULWXGhDKT75VhX/zf+7IW+zD0iMXBZ
	zlKvt28w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU46M-0000000BKOz-054O;
	Mon, 01 Jun 2026 14:58:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU46J-0000000BKOG-2mex
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 14:58:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490686877a1so59929115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 07:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780325925; x=1780930725; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qq6eAfjOAZ4Lfq7LauQf4bjJ3RlF5Fcl+6rJ1tXLLa4=;
        b=GFUgTvLMYlXEWEEZovCWZ8kwEVlBU/AcQj6jsZNIDCMhW6JVWloxAJBrIA7J4MdRlQ
         6fn4JaiXG5p0tcpngLloi/a2XU9o/ddGDsWeeapwPihN7AWJEjBLDW0QDhI9z/LWe2bW
         r35pwSUAxBwnjyZ6OCWQCg+E7LqzIwOSqa6nJnD2qKBS9nqtTNSP+1jZ47/JswGuhEbK
         LjmFkkQNPsgU5u4YPfP4jAeJr3LtAzJlY+BIDM9EYYJQbVkfhWmljjGx+vP/9TGJoTzP
         bcQI3wblpATILJhYga1cmy+SPGd7Qv+i70UfFrIVRqKzQzHbyXBwxRd8Z3qP1dEhekJU
         I8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780325925; x=1780930725;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qq6eAfjOAZ4Lfq7LauQf4bjJ3RlF5Fcl+6rJ1tXLLa4=;
        b=HePihPwugIn+6UITSr7amJxr95mE/pAUfoYD/V+WTQMuapgTtDLEdAPa0bjCOYxXz2
         RsefK7LTJRd8fOYhDyQHOBIwhM4PNXJH8dUek6kvZcpLuNYcLkrIhk3GQUalwuSvRSeG
         wn6WRovcRrpDVr5zZRWsMgJCv1XP2GZeTurw2ZjH8mIMZjvi01c8KCi+yqBwdLO0DfHm
         7CmMZyQ8b75cMUgooK7CglEJSNMDbuyo14/QC1P2d8C9UvI3hrEDPV6srzGsrTwNjqOV
         tm83C2B04p2EwUkLLtDm6KaGvPDfN/uoRuQFUA46UOvEKOWvYUpCaPtMnwvBTysT6e79
         uhdA==
X-Forwarded-Encrypted: i=1; AFNElJ/RoM+JpGswiYmL+wg3T7n4w8sA/kxnzMZ6Dmn40KGTuqwbF9tO1YYls8ABkphi2aY5hjlRY4upw5kRZwWSGtlH@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb4H6TGK9x593aFvXEIYNIdlsV3yJmd0EQWfUFPjTkQLviskp6
	eVIKXizsBQA+GmDb1GIiT9I/L35us548xIPO+wwsYO5/jZZrK8d9BtuLgVdmtwdoZ5E=
X-Gm-Gg: Acq92OEIxxzXqhcrPKpPIGUNQZhz06yDcd2fPVZn9fOAUyUNKgAUptziFcSbVD98se0
	GkFaO87AwgSpa3I2Wvvpnh06VkNAktgpQ5Y2Tc6AnP3ZAhy/7ZkEz81zm08dUHoxXTDrE+3GFU5
	lDMUsXX2fqs5Oiaq3KRz9pyPr2PKtPDIpFdqh5XRKg6RQiDLTF6Bx9iWerCFCn0PRipUimoKsbS
	U7km3qBjTNLPnb6d1j6cNnnCEHq24w440xvBvaE8rpQ7bpHmKLdQNhbc0qfnNJu0J5N0SU8WdMi
	s9XYuTTUkSi5OWp6VNb97P0kGC303bmi082MRthRGE7PcHURtvxBe3yV9yatju9SsAPhyAmNraj
	v3RQ3uqFDh8VrktzeDuLBEZQGPdBZcW509cNhND9fbD8DleI4WoH9CF/Dfh0XyhkKUje7ONYN8d
	kkmjNrromfNIIxr4toMWQKYUcHuP3DD7L/44Amy7y9KXDjuQ==
X-Received: by 2002:a05:600c:564a:b0:490:53b0:9e5a with SMTP id 5b1f17b1804b1-4909c11c15cmr174298335e9.5.1780325925446;
        Mon, 01 Jun 2026 07:58:45 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.233.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef32fabcasm25172652f8f.0.2026.06.01.07.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 07:58:45 -0700 (PDT)
Message-ID: <2d7430bc-1bb5-47ff-95c7-c5c4d880cdf2@linaro.org>
Date: Mon, 1 Jun 2026 15:58:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>, bod@kernel.org,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
 <178000689150.4557.11759359941436928903.b4-reply@b4>
 <df00e8d8-21ab-415f-815e-608eb7ab0967@oss.qualcomm.com>
 <23d2a824-e894-4c26-8bd1-02bbb8a7c6d1@linaro.org>
 <f7403443-3c0c-45d2-8235-46c70883a296@oss.qualcomm.com>
 <203e09db-ba37-4d75-b984-227298f55d80@linaro.org>
 <CAFEp6-3prh88NTK5U1HAARmQr203LVcbW4hoo_zuK4Qof4BAzg@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEp6-3prh88NTK5U1HAARmQr203LVcbW4hoo_zuK4Qof4BAzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_075847_724686_1FB2A076 
X-CRM114-Status: GOOD (  13.13  )
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

On 01/06/2026 15:27, Loic Poulain wrote:
>> Yes I think CDM should be a standalone block and BTW use standard DMA
>> APIs with its own IOMMU entry.
> Interesting, so CDM should be a dedicated subnode as well, and not
> part of the OPE?
> Then, If we want to use it from OPE at some point we would need some
> 'cdm' phandle in OPE node.

Your question makes me think again.

CAMSS:
- IFE/CDM
- IFE Lite/CDM

HFI/BPS/IPE
- BPS/CDM
- IPE/CDM

OPE:
- OPE/CDM

I believe those are the mappings of the various SIDs too.

Come to think of it there is every reason to model the CDM block as

cdm-ife0@ {
     iommus = <IFE0_SID>;
};

cdm-ope0@ {
     iommus = <etc>;
}

And then do use the dma engine API to shift data. I don't see why the 
IFE, OPE or BPS needs to map the IOMMUs and if you are using the BPS via 
HFI you'd simply leave the cdm-bps@ {} disabled in your dtsi anyway.

We should excise CDM IOMMUs unless/until we come to implement CDMs as 
standalone nodes.

I'm open to being corrected of course :)
---
bod

