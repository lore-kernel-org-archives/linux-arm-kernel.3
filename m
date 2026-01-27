Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF1ED25932
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 03:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yb1Nq1niVrBkwwiP9/q6su3kaXasPkEK3PLxjn0erUA=; b=TqaZE/G+yuIXLUcO167ZJDFOsL
	U15GC7lZ9fPdNSzEOmvp8yQCqB+gyaJ8T5bjTxWI/PQgf30K942tqN4l+ew9iMeMWvLqEw4QfNiUg
	BcXhb8QfrQVdEZefNc4CtLWBn2LgaJs23QGGsMpbl7NbkvmvC9F9PJdbgP59u7okGqpVkNvQgu0uM
	N2yd5HeB3mZuqbkxmPSHfIB7VKQpombua2GK6IPI9p9bemgwgWf+fwa9kThrwsaxEq6g88WFwVbcc
	nBh/My64xm/OqKs/6NBLHmKoP6k1WWrs3k3Cf8XH7vnoQvddG5G5BxFzRcHNK7u7+E8zbLfSSOj8r
	NmOnCBiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vka4p-0000000DcKv-41g0;
	Tue, 27 Jan 2026 03:49:15 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vka4k-0000000DcKX-0ms5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 03:49:13 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-29f102b013fso47438705ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 19:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769485749; x=1770090549; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yb1Nq1niVrBkwwiP9/q6su3kaXasPkEK3PLxjn0erUA=;
        b=NjDn39IDT27kMLlMxaPQkhgDJsy+9IxJlIEnxVdiklf+Dv3KX/mJJRuX5CTJHZVXY1
         OgBOa/TSR+8Fa8KbxO4qPfYKHqhUieEcEJNbx2Iu5Vd3TckCxxZDuHO++gMPywS6zNMh
         UEOntL0btzi7FsZZ9F/+wRtrnGZ6fAIpma1c2j9gB2y9Vgrvq19b0q/SQjRk2ttL8n/G
         VWyWObpr1BD9Fm1LwPrTVYYnNNJvwcDIjzjY6ibAhudXV7aKgiZw6db0mz9oLYbLegV7
         vQNZmS/1p/xj2cqKiSmMlzb04Qye7mOFS7F+Qe4J/bGWxWTmwgSMabt3mhQfd0ikq2tu
         xFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769485749; x=1770090549;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yb1Nq1niVrBkwwiP9/q6su3kaXasPkEK3PLxjn0erUA=;
        b=QoHTeqln6UgoI+bQiox6CxGZ+POP5zPAKEwdgEXGcq8m96OzRK64zDamBaoRpVYSuh
         5R7/RBToNffSOz7TRvldewFvpH4T9tHjz6YaglkO83XgBLItWsDA5MuhMo8yowlCTPrC
         XNs2ksmgtOigy0FXVhG7zFhXrrXg3RiMm1CdNCosLzgWba34Dq2XvMhmO+gH5/sQjjUQ
         bZoB7bUJHg7pTcV9af6IkysbjWFSnkgNgRs7SMdqMQXQqsEIAer1UdOdrXxHNmaWcQLd
         vxQVUaaBlRf9nSsdrj4To89+9tzYikcORcBYwjq8jCfNx3W7KDo6JTT2FQIktbfgrpHM
         rFxg==
X-Forwarded-Encrypted: i=1; AJvYcCVfLtn3imgCcEUqGqVSZcsQBOcjwDO4LDdjbpSuXg+0LcLbovCpAynxbGDQpLfHx8hGxrXgCKRhluReX+wv2tjB@lists.infradead.org
X-Gm-Message-State: AOJu0YyUrCYggByCLjGzPFcFOf7v/DNw0gK4OlrscuUwEiCum3EfYvtF
	SAWf6RIsv9ycwr7zWTeo8eOtHuYaEnapG5gqRFk7cv1dNUFXFOKrz4o9
X-Gm-Gg: AZuq6aKtkvoRwRuxhmrmwMe8Dz6zJ6PGGzpjTd8oAwrktD8svccpIJjj5jtSlkpReT8
	DI9kdCJVzxeRktF5U5iQBBFuF1Q+s45l9LK9dLqTjRB+nPAPn95azVBO6a96GnipsH6Zfr8p0Fp
	gFrw8dRo7dnTON1na1JdANvCRrSyBQgIGxJ6B7/uvuPFxcJS5sOSINut05bfs/V5D1JTxcMG3s3
	a51YC3cQSjE51Yi/bWiPsVeKx0n0la36b6Kovb8pTjQfSoSgfG6l7UnksXrod4DBJ6oazZjDZRO
	vneCNpFgJmRicPZatsFP7SswgMTdg5N/wuJujFqmoXEuy7b3qBXFdz1T1Tj+WdtaDML8DS5VRE5
	TFVSylDvIsbP9jlCtSMe/WspLDJg2vGIzpOusA9KgVfTeOszJ1hEE9OTQkz9AfZtDkj9Jb8ZldS
	JSyVxQwj4pS92QfpuHfdG0bOhwFnN2rLslXl4a0p1hqHZcheAxs21I2jP7mJBKyKsh
X-Received: by 2002:a17:903:2446:b0:2a7:5a42:fb5a with SMTP id d9443c01a7336-2a870df8badmr4535355ad.55.1769485749126;
        Mon, 26 Jan 2026 19:49:09 -0800 (PST)
Received: from [192.168.0.102] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f978c7sm102191145ad.65.2026.01.26.19.49.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 19:49:08 -0800 (PST)
Message-ID: <036b4874-a7d3-4523-bf1f-3256bbef64db@gmail.com>
Date: Tue, 27 Jan 2026 11:49:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: nuvoton: add MA35D1 DCU binding
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, schung@nuvoton.com, tzimmermann@suse.de,
 devicetree@vger.kernel.org, conor+dt@kernel.org, ychuang3@nuvoton.com,
 linux-arm-kernel@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 yclu4@nuvoton.com, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 mripard@kernel.org, simona@ffwll.ch, krzk+dt@kernel.org
References: <20260126085727.2568958-1-a0987203069@gmail.com>
 <20260126085727.2568958-2-a0987203069@gmail.com>
 <176942345650.1493690.6680592088886642042.robh@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <176942345650.1493690.6680592088886642042.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_194912_538847_E97AEABA 
X-CRM114-Status: GOOD (  17.69  )
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


On 1/26/2026 6:30 PM, Rob Herring (Arm) wrote:
> On Mon, 26 Jan 2026 16:57:25 +0800, Joey Lu wrote:
>> Add Device Tree binding documentation for the Display Control
>> Unit (DCU) found in Nuvoton MA35D1 SoCs.
>>
>> The DCU is a DPI-based display controller supporting RGB output
>> with optional external bridges or panels.
>>
>> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>> ---
>>   .../bindings/display/nuvoton,ma35d1-dcu.yaml  | 74 +++++++++++++++++++
>>   1 file changed, 74 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.example.dtb: /example-0/display@40260000: failed to match any schema with compatible: ['nuvoton,ma35d1-drm']
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20260126085727.2568958-2-a0987203069@gmail.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.

Thanks, I'll fix the YAML binding issues in the next revision.

Joey


