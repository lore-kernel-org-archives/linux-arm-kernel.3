Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FC0C021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 07:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXZVhKJ2K7k3WzqdZVJwEQ+tPoZ58G31W+/pRY1rx9E=; b=RoHWcSg+34O3VM9TTHBbYCCWRl
	RzV83c7gODK121zlxziEmAJs3Xe+BrH7Di+si2wbEZymQ66zOhOHGZEboPvdpP1lXKdTwrDfpzYZv
	dvgFzvqHo+D7lRb7cqymkvLfoWxrSFGTTtINFf2gMxK9xxXNVE8palRmQjAEz13wZTcBT0VyHlfa1
	InZ+1NQUCRwIedDUqQGGuhuZKFdcjhajk/WtLOI4OJ/IN6w36nMdcp6ZvpgoO3f2gnnaQsozESFZ9
	iD03A6K3hx+ncHJ+aoIFYeFdiiXZz2tz0JmwylrhS01YxH7vq7Y06Ov7vsjS+B96r2nmmk5evzd4L
	M1kdbzdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTJI-0000000A2cx-1q39;
	Thu, 13 Feb 2025 07:06:56 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiTHr-0000000A2Ld-2OD0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 07:05:28 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ab7e9254bb6so89324366b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 23:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739430325; x=1740035125; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KXZVhKJ2K7k3WzqdZVJwEQ+tPoZ58G31W+/pRY1rx9E=;
        b=r1D/Nz2kF6oSJ71F3YLsrQsJH5tsQLN00ts5SkXNgNIQsARI1sRZtZzCFbRGbDQq5k
         lstUU4wfRbiZYBCKrnUMipmU5upEniwsL5rgNupYwjuHy64d4/4PdorH6pXQw/vUy0N/
         NIj8wxZvbEIOAzucJyrlyFIeCXNeaKWFlFLcUn/dCrqmcVJPnDpIy8lhuP2TSBG0Jpn6
         QcdOU6g2yYO0vBuLg1W9F1VIKLZOoPQogqXL+rSggWn7oyqBMYouSSKRT3Zn1Si/cZQD
         fVsUH1+KzqZC1/jNhoHe10lNnj9idzoxRmKr6iFQOciydEh1lp/c9xux70w32gE1Zqzt
         DyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739430325; x=1740035125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KXZVhKJ2K7k3WzqdZVJwEQ+tPoZ58G31W+/pRY1rx9E=;
        b=TPOv0bC2OSFsxG4op/GdFY3LN3xcy0NHj1bigP5aGOCYhC3YAySCdteF/pQLb+oZgu
         wHFG6Qv9d2I47M02pauo67JaWK5NI4PHum/NEnrQt3qV0wG9iGYysbBeR0qe9CD7kIiX
         i8QEqTyWwsWOYd17pJMuSzGFtuNir4MkxpIHWXD0eACPO0hzizIDg0e9z0Pzm0SyGvLN
         tiMcdalKUt8HGHNLCQXAqIRfB6xcpqTOxUPNvEnVUe9mryvCsHnPs5xxdSzHaZjWIIMo
         /trP2zmzJ4e31Y2QSnthYGa3q/KuvlUGNv0kSbx9U23/3pPf0EmDNNPR8JuI1sg367TV
         8HgA==
X-Forwarded-Encrypted: i=1; AJvYcCXC4NGIZa4W9BxKwHoFoVryLdHfyr7/N9FRgYYjIjy+wtQVeNID/c44vulGt4qDc9N/F9zXn3fzA6bwoOqo0j0l@lists.infradead.org
X-Gm-Message-State: AOJu0YzkGvZdf5FioQLQ8drqEdoggFnzmqvEOX2uazkemKESXBYIaC/6
	QOwMsqq2lL6OAU84pj1hcUsnnvkhmVo4yZG26Nkmww9NHTEtXuORGUYSCfuIM3s=
X-Gm-Gg: ASbGncsEdprJaW8MD7qbno/OsEEVh40+1Ar/c4/MbO408T4vExnHUi+neJXWQcVB/VJ
	zibgkBAbGPPo3YRYXZQPFmvN2X8Y35hS+wGvLQ5SmQtmnM/aBc+l1o0UDlmxhWo84Ox3Er8UrIR
	/TjWV1aWKQdY/X1/b7zNBQqG1pAebs7QTnpsCRN86LnW/CBKNzuWRhMeRH+NmHqiE2+9rLBqEgN
	+SpnDakd1p4erlcJjXhB02+shD6JSa3KgpEi3P+aSKa6n1MdZxn7Q1MCE3NG8Pvpd01f0CPlobu
	0HVNIH9Xst+4UtBDncRpCft2
X-Google-Smtp-Source: AGHT+IHMrmKjXCi72IpIaaGCXzDCq4ibYmkuB+z09aLzRAGtSKSlts+BhuC/X0899B2uE4MTHf5wAQ==
X-Received: by 2002:a17:907:1909:b0:ab3:84ac:4dbc with SMTP id a640c23a62f3a-ab7f31a3665mr647610966b.0.1739430325446;
        Wed, 12 Feb 2025 23:05:25 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.124])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba5339dcf3sm68465366b.156.2025.02.12.23.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 23:05:25 -0800 (PST)
Message-ID: <bad7b5b6-c61b-4e93-9415-6476976c8e81@linaro.org>
Date: Thu, 13 Feb 2025 07:05:22 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] spi: s3c64xx: add support for
 samsung,exynos990-spi
To: Denzeel Oliva <wachiturroxd150@gmail.com>, andi.shyti@kernel.org,
 broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, peter.griffin@linaro.org,
 andre.draszik@linaro.org, linux-spi@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250212191241.280-1-wachiturroxd150@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250212191241.280-1-wachiturroxd150@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_230527_620965_F4095B46 
X-CRM114-Status: UNSURE (   9.60  )
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

Hi!

On 2/12/25 7:12 PM, Denzeel Oliva wrote:
> The Exynos990 SPI controller shares similarities with
> the GS101 (Google Tensor) SPI implementation,
> but introduces specific hardware requirements such as
> 32-bit register access and variable FIFO depths depending on

gs101 mandates 32-bit accesses too.

> the SPI node where it will have to be specified in DT (Device Tree).

gs101 has some USI nodes that can work only in uart mode and indeed the
fifosize there is 256. Does downstream define SPI nodes with 256 bytes
FIFOs? Can you please point me the the downstream code?

Cheers,
ta

> 
> Denzeel Oliva (2):
>   spi: dt-bindings: samsung: add samsung,exynos990-spi compatible
>   spi: s3c64xx: add support exynos990-spi to new port config data
> 
>  .../devicetree/bindings/spi/samsung,spi.yaml    |  1 +
>  drivers/spi/spi-s3c64xx.c                       | 17 +++++++++++++++++
>  2 files changed, 18 insertions(+)
> 


