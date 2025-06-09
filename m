Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC6CC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 08:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYbikLlFrJpSsHAbsyNOgXkJM+1ZHGImF6OaJb/GrUo=; b=V/DuB+tgpH71XM66LLl8KHnOgG
	xzhdsAalx5KSdX0nTOljaJUigDAYVXQA/4lb0fwqQGsZKpauqUbWxKD/2Rm7uGA5lq5ZTQCQ2/O/O
	4G2lxBRZ20f6oMMzCn+TTb6J0mli5jeV8lGq9+oRwwWkZqNraz2vBuawK8ELZ1V5edByVByg18mLT
	Y6qkMqmXovOvr3NMIAhoJFjgiypdArQKElSRBZkct3z7N/syX8oszQIyvfTcnjwJhnGOvAjveVP8/
	UPN7tFcJbMBDkEm8l5sfk1iZOxD6FrXY2cVkWICsiJ9SBdPndSR/HVJaJ52lOAZYrxL1S2QzhyBFk
	m0/63Xvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXXk-00000003dSY-1WlH;
	Mon, 09 Jun 2025 08:07:44 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOXUs-00000003d8s-2EGu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 08:04:48 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso648957566b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Jun 2025 01:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749456285; x=1750061085; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LYbikLlFrJpSsHAbsyNOgXkJM+1ZHGImF6OaJb/GrUo=;
        b=xJVTZBdWvEGaSpw+WhILeKVhu9Ra585RTS9qQdVbCS13A/o3m6N0bfWiPnoFR64Q47
         2XnEFbo+MNAYnULzQHvMBXzf2sPCbwXd7hF2HDAlP+tjDt1+a7LXufyZnliOVa9ZaJwN
         X7QlMTvPC03g2LKJwFEZDwelljS6OHEqaXYHRE1VGsDrkfJgZReGQYLdy778gqfpTL48
         1q5JfFCQSLGJXbdpEyxva8P62lTfmJKLCQ5hihbN8YD2KEuuO0GFIJNFoxy76G/cPJNt
         iJ053bb/mKcjub4VqjO736IIUB0pSwgvuNfb+/emYpgy7X+lBhoXJkjBK/lVkJVtromL
         aSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749456285; x=1750061085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LYbikLlFrJpSsHAbsyNOgXkJM+1ZHGImF6OaJb/GrUo=;
        b=YnRbsDx3RMfmrC+lY6M0xpnQIxnpW1ykNrFp4pnOwVAwuoqkqiOvKjd2xWxjQm15p7
         toVoDTd7FLztcBSESvDKTQ3tnO/YFCKHaiM3GvlgKO5+sETKjgLfNguyCPsgoKbGJY/+
         vTzSAOFQl3PxPeHhPkQvspLGbvrTVIcGdpyHenBebJerAtdZOrd4zWjEJNTRA4yJsqyo
         ysqsoq6tdiWtQDM9UaRR1nnOEvprrio/JFaObUnn57JIqJ71cc1NNtKc4muqXt80I9WF
         PISdAn0gGSv0Fdyw0p7YNaL5/pbRBSAXDvGHl9jbQateT1Myu8vWL4dZeG5AEFRP/o9V
         +XMg==
X-Forwarded-Encrypted: i=1; AJvYcCWXAIQysAyjr6LhcvOF+oum2eIFpQHlVJrNXU7puIvRejUj7Hj3K7GJlpPqOGnMQd+fTZu42/aPEQjPk0M0T/YQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxttScGbtVcqz+OXgKl7aj0Vbz0ieKh6Om+xMqxZfmXIm3sgsFe
	6iwWSVR4+0M+/k1+gL2wRRRUy/E+k1mInQ1jZoEyWqdb+ZfpAg6UIUmbQeldT1N23XA=
X-Gm-Gg: ASbGncsKIJLi8SIpQ3cNoMO49mJq12AZ9UiISyL66ndtPYtPfHRy4sIewnEDudAmWfj
	mUe0KxOtVnxrAIFCUxybwgmpTNIst7VTpFS2jOED5Efka+urCpq/zMUpdL9+la7EVWH6UNzpbZf
	5bTtFiUA9YR/d58iAWTVqGCtdA3yMYpajK1e6Wj7s3+AdJcm+Y9HQumUKVjhGtfUpHZOeODyYof
	tVZ6pk+k8BHc+RCF4QUdqAFKMASFuakz4vtQIT8yhhSQzRjyWJkf7sKRtEzr01rBUX8zhRoBOsT
	I546aPgf6EIWGmtPKjpZ5CViCwnY/iGqXRaajDVuzfHPriLQfhGC+yRoIm/Rt/oJYxnoyQ/R
X-Google-Smtp-Source: AGHT+IE4MSpOgbuv33HwkCjYoe/XHyfRRWBSdHnwS6XSdQ5vijF74vaQ28Yz93NEa6jYLsO+24PJkQ==
X-Received: by 2002:a17:907:868d:b0:ad6:4e8e:1883 with SMTP id a640c23a62f3a-ade1a917048mr1066441066b.3.1749456284653;
        Mon, 09 Jun 2025 01:04:44 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d7552a6sm517919266b.28.2025.06.09.01.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 01:04:44 -0700 (PDT)
Message-ID: <8caf71ab-8b3f-438a-8075-60dd01a7a448@linaro.org>
Date: Mon, 9 Jun 2025 09:04:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] mtd: spi-nor: sfdp: parse SFDP SST vendor map and
 register EUI addresses into NVMEM framework
To: Manikandan Muralidharan <manikandan.m@microchip.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <20250521070336.402202-1-manikandan.m@microchip.com>
 <20250521070336.402202-2-manikandan.m@microchip.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250521070336.402202-2-manikandan.m@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_010446_586493_80C90B14 
X-CRM114-Status: UNSURE (   8.35  )
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

Hi,

On 5/21/25 8:03 AM, Manikandan Muralidharan wrote:
>  drivers/mtd/spi-nor/sfdp.c  | 161 ++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/spi-nor.h |   7 ++
>  2 files changed, 168 insertions(+)

Please find a way to move the vendor specific handling to a vendor file,
don't pollute the core drivers. In what concerns the nvmem idea, I find
it fine. Michael may comment more on it as I think he dealt with a
similar use case in the past.

Cheers,
ta

