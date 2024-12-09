Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9C3E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 14:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKGxGVFQL+Og6kSlKUo67HxrazoGKfS5bm5biJspKWs=; b=35Oh3mPW/FMNVZIqisWsPIpamx
	2JRj7RB/fm5ceCJXi4xZgpFiF96KfuzOKRMO0P2LFjraWc5rPVp43dSnx8oRl4GuXvoT/CMj1vBAP
	N27sLet8e1FJjmLr4fNaZtQu3YGGxT8QNa60sm3ifSlUEb0UnSt99Y75e5Ra46UEGB2T4uQAhlfc+
	CueFBljaT6KQ2NpMwKO/WZee7w5TIl6BZhjA0qa5WiinzcYKUOAHJ6NP+OdxQu7zp8C2SnbX/Ncgp
	OOODAjWd/oDBgMiMbLsGmi2Ts0jkb7gFgwHvCS4v2e2p0HCZt3F+6c/ZFeI5Ss1LD91BddXlHeNNi
	6QSaRbDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeca-00000008BBm-06b7;
	Mon, 09 Dec 2024 14:20:24 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKebW-00000008B4F-1XMm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 14:19:20 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d122cf8e52so7012864a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 06:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733753957; x=1734358757; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FKGxGVFQL+Og6kSlKUo67HxrazoGKfS5bm5biJspKWs=;
        b=q/Vn21TWY5XXBWK9+rYAsKm2gnOo7E4SN8xnIMzBbYyVLhnSiZWUptDN06kCutDadv
         l43kGcj/qoRYQEfXXYxgorv3aGuiASUnPHQpOAH40lSGAaBr80AMEHtjXlp9lsfuYHkk
         FnpYLZYWyxNXokKfEPmqUSRV0ouHl4AQFv+BNfK+79rolP+5+cv4tmzBeFprQhMb/JWJ
         klYYoVAAQf9e9+DKmXhxTpvB/zciho3j8xRNgh+PNVL4rqCD384AbqVeFx5c+cicLayt
         nrvlN7+QBPPtyWcP13LkLFWqIj4BFbbHMpZOlSDJO/SLVb2tUIyyvFWs4scnmF9q/Y5Q
         nKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733753957; x=1734358757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FKGxGVFQL+Og6kSlKUo67HxrazoGKfS5bm5biJspKWs=;
        b=RSYcAns7PcM9h1t76hVb67t9Y0kbLatz1vHv4OQo6LpL9SfaUT8F38X+HgGqoufpCq
         FcgYOweW31i2K9JTu9ptZXPgqQoyFq57XPZo8lvRI8YaVPu9WkHGBUEos8cwqG2uww2p
         Pj0/7An7uDdmzS3eYhSNn3lhp7ijkXXIC7+pAMTXXAWLF5s9keYR5WJzunbB1b8nsUJ4
         rHO2uAXa0wAC3mFEJgncBolGQn37mi3L6U7bP6dfyldC38P0sj384r9CV2cUzz/UvVu6
         CLih+DufSuV1LMIaZ0AbhfTx5qjBIlMXgv4yMJu6Heu9REOd2Zb6r19T3VjPN8QHF6l0
         baDw==
X-Forwarded-Encrypted: i=1; AJvYcCWXRbEZxV0DmEQMH7ZW5l4s6sS0kiq4lqJ91P+XoE8By1rReQAMcK1FfPZzvMF4K69qRT6LvwV+hJxod9GLpyxJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0Oi4X6NYOAXHWIZypYPMcCNdnWhz24qmkKQ1ik21nzsSXjLjd
	N9lQXLDxjVVEc8rxGsqcV/3qJz4/hpdMbqUsssKZfAUrIALyqFYky97rEBluycM=
X-Gm-Gg: ASbGncstuBF/pbzlhL8hfi3nkzLOXsyRD7sAH4ZZ/PdRZXxXZvjR8uXnanBbTgnHbuD
	A2N+E0Ec4t7zyIOmu6HvK+V4Y5ubnTl/1Ts882EjUOptq3z22urbMRQlNadgQXg/JvhDeBOq4wf
	FohK+q/ZfQJNoh3p6swYK+dgImcBkE98PC5Z9cvlfZ8ZL5a85ePqctujLJcRCx8QJi7JAOPZtBn
	qC8o33PZ73cuAlJ7+Y0KsMqS15LcRxmw5zbeWuJme1ERXJr9zXfWW9bcw==
X-Google-Smtp-Source: AGHT+IGFZ72A7topG3h6HtsrPbQ9uANyoeaAttq9LuCfJvMZl3glvlTz4zo8uXTpVfHH3Pb/FsB6eA==
X-Received: by 2002:a05:6402:50d4:b0:5d0:cca6:233a with SMTP id 4fb4d7f45d1cf-5d4185305aamr1118156a12.10.1733753955375;
        Mon, 09 Dec 2024 06:19:15 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.27])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3eb7722acsm2780231a12.3.2024.12.09.06.19.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 06:19:14 -0800 (PST)
Message-ID: <38e6687e-c2ee-414b-bba5-483150ba7baa@linaro.org>
Date: Mon, 9 Dec 2024 14:19:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: add bindings for
 samsung,exynos
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, alim.akhtar@samsung.com, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
 kernel-team@android.com, willmcvicker@google.com, peter.griffin@linaro.org
References: <20241205174137.190545-1-tudor.ambarus@linaro.org>
 <20241205174137.190545-2-tudor.ambarus@linaro.org>
 <2lkowhldq5i4otniijfw7cb3jm6ttatwji3npw5w7c5fyevnn5@ynojupmdyqy4>
 <9886429b-1bf3-4dc3-b0d4-294a98e44ff2@linaro.org>
 <58d62506-de89-40e4-a3c2-bd27da515a45@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <58d62506-de89-40e4-a3c2-bd27da515a45@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_061918_423225_31A88D15 
X-CRM114-Status: GOOD (  15.34  )
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



On 12/9/24 8:33 AM, Krzysztof Kozlowski wrote:
>> I'm thinking of using the same driver for both cases, and differentiate
>> between the two by compatible and `of_device_id.data`. Thus I propose to
>> have a "google,gs101-acpm-mbox" compatible for the ACPM SRAM case and in
>> the future we may add a "google,gs101-mbox" compatible for the messages
>> passed via the controller's data register case.
> Good that you pointed it out, I was indeed wondering why this is
> "acpm-mbox", not "mbox in compatible.
> 
> This needs to be fixed - you cannot have two compatibles for the same
> device.

Will fix. I followed arm,mhu, which differentiates the transfer mode,
data or doorbell, via compatible.

For the fix I'll use "#mbox-cells" as <&phandle type channel>, where
type specifies doorbel or data type. Clients will use:
	mboxes = <&ap2apm_mailbox DOORBELL 2>;
or
	mboxes = <&ap2apm_mailbox DATA 3>;

arm,mhu3 and fsl,mu pass the transfer mode in a similar way.


>> Given this, I shall use the more generic name for the bindings, thus
>> maybe "google,gs101-mbox.yaml"? But then exynos850 has the same
>> controller, shouldn't we just use "samsung,exynos.yaml"?
> If exynos850 has the same controller, then add it to the binding. Anyway
> then use samsung,exynos850-mbox, because samsung,exynos is way too generic.

Looks the same, yes, it differs by the number of how many data registers
each has. But I'll stick to "google,gs101-mbox.yaml", as I can't test
exynos850 and I assume we can rename the file when we'll need it.

