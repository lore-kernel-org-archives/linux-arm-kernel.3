Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6B6103E2E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 21:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7T6BzAyZ6zvZPDDyyrSv8iqVUUqxy8QrR8kmFoTvh3E=; b=KNntXfF29eXaU6V+WIV/FfE3Ot
	uf+7EhSX75bWuNsz9rP7STtmvGeFyI1Xcr1a7z1ksNZ4Rq7KHWw06UW4iIDvdyLbqYJI9Gek0kx9/
	kPnhMwWHGildJ1qLL0RFGEG6PjpxAp484Pm8kzzfMkYu67WAruKsSsA1M6JKB5nbfRGX3zhvXdzCn
	KHunREBaq2bfbQKGe7odHCQgJcXhr4zSQIvPcbHqxYLZZeZTbMaizUa+grg70kqa9rqHNhh+YrA6G
	22Sv3dk9OTbQHRzjzvBmEwABDvhTK/g3paqrpt8a2KU9nNXARkxPRm7oH6H1wwPOhrXAvFpRUvigC
	21suIc2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0RC1-0000000CYGR-2Eh5;
	Wed, 11 Mar 2026 21:34:13 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0RBx-0000000CYFv-2fJm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 21:34:11 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-82995242934so587144b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 14:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773264848; x=1773869648; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7T6BzAyZ6zvZPDDyyrSv8iqVUUqxy8QrR8kmFoTvh3E=;
        b=BlNZqD4adYJVl/klX4VDA6Mas4oZpOZBEuOfOk9Y4BOV8RjxAnl09c9dNju3W4qWcP
         vRBJZjbG/RWEJ5UQET+BFy1YFjg4B73meLKAPsATh6Td4Ek+X9iOLL4WbeiqyRDG4wxu
         YmTS6BML+eYxynAdOCE0eEzBjW3Tj+b3mWT5+2zssNKiz27yIEI47/jLOIbfWj2/wsAa
         8Ea8One/4cC5HKJqn6+DiouL52GqHF4DO/HkBkh1LycFiJpVrIeOBUHhK+9tJ9SsuB9R
         nfk6GA0f/5XryyNDe5Rrjr4p7TMcPEBrUo2l3UX0UzlD5379/NnAQy5lOqw8Q22s9Yco
         HYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773264848; x=1773869648;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7T6BzAyZ6zvZPDDyyrSv8iqVUUqxy8QrR8kmFoTvh3E=;
        b=SPCJ6KjgxGODDVnrg/m6+9OUto2MK2rfX/WPCsSSWa6S2w2Ug5x3USzuNIEcHG7gO0
         QRqMmZD/5XzVPV6EqlWdCCOmQwfriJhub+RjseEwOM6oY83KaGf0ApG4KqUPZ1XV2G9Z
         vEPHRHpTF0o3FJkYWQRpYZ/6jJyvKRw13tG/N9FHEDMK/5IEpJYREEtwY/GqbPgRuJPh
         oIkoUiOsLbaU5qoduRyZ51Nu0gTFDrz1xF0uU0mhUow0+cVSMfGI/bfIR+y26W0l35DH
         K03Qu9OmDQR6hhCvBBpp9dtdsK4iBF19vrFahyi3Zv6smuOhO8DpC08lM+eV3yE/SKn/
         VkfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBeoZkuDU0KZSn0jW4Cd0/PYF1A0XjsBPAIEwY8RxQkCimVVUlmyP9nnjIbzeXyosUrq+apUEZCo4xih488ggw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2xnqGPDeoxxApIkEenJnFbM1EvJg9IPxIUrdBF68McgS2HQse
	L3xzcLqlaIn+Cq25RbaLyj8NtaMP8lVjkwrD/8g0yzGzUPg9iVL8/pp0ZmzmSoWwi+w=
X-Gm-Gg: ATEYQzxvXbbyB9YNiKa+tBOUSK+JGv+AlOSLgTXwqxAMgacIoI1t1RPesH3jE45D6f4
	BYw0fEXqvFXTJ5UUcJbjgNqkUqgqb3PCLI46Orr0WBnvfs6NDglF25PDdZUz922+dK1JiGXFJ0p
	t7Br+4Q47hAFsh9qyXfiDoi72pRhL7k7ineXfLWuuGqaQl6A4p5M2nOKNyaOC+/GUiFv4o3bbfD
	SijFfxrth0RcuxsgLdPM9+6GdUrTnRK4FkFgSf91ifoJ/OyN+kLzo13paQjUs1hLnxzVBMQK6+n
	anEtDbd5fYl7EAJaG5dc00P2mvIUlMobth/YUCl/thS2UBAm+Pt4tDn6dW2uedBND1t6Rc1gb5R
	IrER6e32/p1/LXA52n1obKq52I0wsSJIzEqqFhNi3XG8gBzH/KboBIbJTempI2Hf1HkGf+QpTTV
	TR/QRoZu1fPzrmzR/fcDxg9ToyrABpr8U=
X-Received: by 2002:a05:6a00:9501:b0:81f:be27:8d16 with SMTP id d2e1a72fcca58-82a0722304fmr941796b3a.21.1773264848531;
        Wed, 11 Mar 2026 14:34:08 -0700 (PDT)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0738422esm595730b3a.55.2026.03.11.14.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 14:34:07 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-pm@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Geert
 Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: power: Add power-domains-child-ids
 property
In-Reply-To: <177319309976.1426147.15580608651927678828.robh@kernel.org>
References: <20260310-topic-lpm-pmdomain-child-ids-v1-0-5361687a18ff@baylibre.com>
 <20260310-topic-lpm-pmdomain-child-ids-v1-1-5361687a18ff@baylibre.com>
 <177319309976.1426147.15580608651927678828.robh@kernel.org>
Date: Wed, 11 Mar 2026 14:34:07 -0700
Message-ID: <7hms0eyrsg.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_143409_836222_AC88D529 
X-CRM114-Status: GOOD (  13.11  )
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

"Rob Herring (Arm)" <robh@kernel.org> writes:

> On Tue, 10 Mar 2026 17:19:23 -0700, Kevin Hilman (TI) wrote:
>> Add binding documentation for the new power-domains-child-ids property,
>> which works in conjunction with the existing power-domains property to
>> establish parent-child relationships between a multi-domain power domain
>> provider and external parent domains.
>> 
>> Each element in the uint32 array identifies the child domain
>> ID (index) within the provider that should be made a child domain of
>> the corresponding phandle entry in power-domains. The two arrays must
>> have the same number of elements.
>> 
>> Signed-off-by: Kevin Hilman (TI) <khilman@baylibre.com>
>> ---
>>  Documentation/devicetree/bindings/power/power-domain.yaml | 35 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>> 
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/power/power-domain.example.dts:136.13-26: Warning (reg_format): /example-3/protocol@11:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
> Documentation/devicetree/bindings/power/power-domain.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/power/power-domain.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/power/power-domain.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/power/power-domain.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/power/power-domain.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'

Noted, and fix will be included in next rev.

Kevin

