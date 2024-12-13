Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E079E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 08:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ax9fIlDokPVT/m7zwVLOWjC58ZMH8YcqVCp3qT1D65k=; b=QuclF33k1j9dCAqGyPlhojUBvC
	YqOFv9qyoR5FGK+jYXfzPLotZHlGl2nPJ6dOYQeYq35GjURZUdjyAV4wPjNiEiDpURUJGM3Yfk4kZ
	s4+Tqk5spp4P5Bwa6L/gXiIMOLryWzqc2lzf9KQQ/ySxj3DMcmg9OTEamIgeY624N7KYlEOc11k3h
	tXw0IQjl1FfHfJrljJQOxSLB1kifJvQQTzAVrMynJNPaFKSMfAGtqeS4uXI01ImmRe5QRFcOhiswA
	mc6M/uNPe6miLyQLoT/HFmAQqG/NcmhI8OxOoiUN3uqeaM5zY9Yh7k9t1jQaG+OQO/fUX/PXCC0yd
	fmlN7sOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM0oa-000000033fG-0KHQ;
	Fri, 13 Dec 2024 08:14:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM0nW-000000033XK-0W77
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Dec 2024 08:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ax9fIlDokPVT/m7zwVLOWjC58ZMH8YcqVCp3qT1D65k=; b=iL5/rrXuIf9wGkb5mbczSq7V1z
	VrTeW+/5wbkvbrr9zVAVMZgre/NHTJEL8PWLd+VuFcjBMWDitILFdS68CcHZad5KefmFOtAR6yume
	LTUbb1/X9uDZbAFLGFEEKyG2qhq4s3rVX6WKl9m7uVnO+NoRlfDCeFkxDeTvAZgXIVVkpFvGYuOcA
	5gb/sRXcVxQFsRmTeLmLuIUdclvbSQ4nrcyJctFwen7zqzYpW8cwv/NmKhEcidFFWvE0w3TA14E6l
	bWGDnV7kdSA6w+/kZNyHpGIaqVnwhE4X8+gd/74Z5nZUykmtEPl52pcsHnQbvcnafuW+4juXBhmBk
	t9vusmqA==;
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM0nS-00000004ESl-2mn6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 08:13:16 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso2332486a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 00:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734077591; x=1734682391; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ax9fIlDokPVT/m7zwVLOWjC58ZMH8YcqVCp3qT1D65k=;
        b=EQeO3kp7Jipp3mBVwleaR5jr7O4GGREGWA7dSLDIFf+ReT9Xr2S+HiAoPDgpTH+yDB
         q+ZUsCLsw+MTCIsVWHRXXcqLYgcAgVitmi0BSdgssG505vtDqHytd1zaP6xL1qFPK73R
         haHoiMvWls0FTzzDYAPjBbpFpg1YROecnPtOpkINgt4xJvN1U+QJp4+X7pTMpu2lg9Hy
         1W+/Ek6SCmN4B3oG6Tv+o+2yVdTovzNtjUmrVeOaLwsHv+xySDs6l4OYL+Vst7mhqjtq
         lA4RAAMdXxg+KCRkQGW6pPBQYIqIh0qRYkoWJJhauqMguRD2SLe/n7HZ/Wo8bkduG8pe
         WlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734077591; x=1734682391;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ax9fIlDokPVT/m7zwVLOWjC58ZMH8YcqVCp3qT1D65k=;
        b=jSfYWVI5aY5ABRUEETBbFI12adokdAPvhVvJzqRFRFwaS+X05sIOG79YsVlBZ0mFJF
         4niIZn+P6Ec+M1oVW1uhE+8Qd9wcYP5kjMQj+4cck+V3Ua5kIlmAP0HorP2SJSwASJS6
         2KZzPN3WT9/X7mgVNp45V6IfIAKWb3sRT3OjFXivTcWwlQxo73ny2z7TNkJxID9E8fzK
         XD/1OIkv2+mR12EJaEO0HUc7krOYq+8kkVP+aBs+z3CBkvJwaVMrJLktOdKhPqojg0pP
         MgE0NdwVFl0Cg3U1WRdwZzafoSFFIXaba6b2k5+O8r3ct3KAxByEko28EoBDddCJ73FP
         DxSQ==
X-Forwarded-Encrypted: i=1; AJvYcCX62B1XK7/sgkV6zeiRPxb5sXkSqJNyJgbB1BAWuoDybpvD8EWJmCFIiM1dpfmhLAenzh76kbKheBeoHu5AKesW@lists.infradead.org
X-Gm-Message-State: AOJu0YyJRpXCZ33Tt9P7OVLSm7hkijFxCPyj9MLQDapqvXW4uAjT4A/f
	eoq2WG/U8ExCATtNO3eFTUYeeBADlA9SYSZWNHZn5K6j04QPLQH6sohHa5prWNo=
X-Gm-Gg: ASbGncsqoRcnBqY6UCMrGgnrwD24pTqRBiHPr9GKQngnuMXDL2ZmH5KuAiabPPNd79M
	ri+0Z+UO0EUC8l30tbs5VI7Jm+DqlHdpvAa7xl1CYTDCnDS0YyqVe2/g+aLhChW3O6CEygf630J
	2oaC4CedO9Kibal7XRtoa/p3n2j3yPH2xlq7bGDoJtCMVKsru8qUwx0+fh54sdQM9W+a3IxZFiA
	hikf+rzl8dpDt7Ezcy1/nVYRPSIF+/ikbkV/Tkt32LNDiLAqs/BmVXdoWIgcx8o
X-Google-Smtp-Source: AGHT+IEu1OlplbyTKyMNJiSwcJM/aHzieHb5jY3kjHadk0/91d7Jwi8sJXlwCnYq4jjEgabYRNsm0Q==
X-Received: by 2002:a05:6402:40c2:b0:5d2:7199:ad4 with SMTP id 4fb4d7f45d1cf-5d63c2e7f94mr1392853a12.6.1734077591474;
        Fri, 13 Dec 2024 00:13:11 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3cbd14892sm9718785a12.39.2024.12.13.00.13.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 00:13:10 -0800 (PST)
Message-ID: <467966de-ae91-417f-b315-62459af93b7d@linaro.org>
Date: Fri, 13 Dec 2024 08:13:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: mailbox: add google,gs101-mbox
 bindings
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: peter.griffin@linaro.org, devicetree@vger.kernel.org,
 daniel.lezcano@linaro.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 willmcvicker@google.com, vincent.guittot@linaro.org,
 kernel-team@android.com, arnd@arndb.de, Krzysztof Kozlowski
 <krzk@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 ulf.hansson@linaro.org, andre.draszik@linaro.org,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241212-acpm-v4-upstream-mbox-v4-0-02f8de92cfaf@linaro.org>
 <20241212-acpm-v4-upstream-mbox-v4-1-02f8de92cfaf@linaro.org>
 <173402453635.2828943.15564980222849076434.robh@kernel.org>
 <90720b8f-340f-4f27-ae51-df98b2e5e820@linaro.org>
Content-Language: en-US
In-Reply-To: <90720b8f-340f-4f27-ae51-df98b2e5e820@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_081314_874812_FDBD9EB9 
X-CRM114-Status: GOOD (  10.92  )
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



On 12/12/24 5:53 PM, Tudor Ambarus wrote:
> 
> 
> On 12/12/24 5:28 PM, Rob Herring (Arm) wrote:
>> My bot found errors running 'make dt_binding_check' on your patch:
>>
>> yamllint warnings/errors:
>>
>> dtschema/dtc warnings/errors:
>> Documentation/devicetree/bindings/mailbox/google,gs101-mbox.example.dtb:
>>  /example-0/soc/mailbox@17610000: failed to match any schema with 
>> compatible: ['google,gs101-acpm-mbox']
> 

It seems I had an outdated dtschema (2023.11) and couldn't see the
error. Updated to dtschema-2024.11 and now I see it.

The takeover is that I shall periodically check for updates, or maybe to
try to upgrade dtschema and dependencies before each test.

> ugh, I remember I fixed this, compatible in the example needs to be
> updated to 'google,gs101-mbox'. I'll send a new version tomorrow.
> 
> Thanks,
> ta

