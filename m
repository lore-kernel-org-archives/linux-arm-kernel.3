Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F40ACD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 10:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdswV/H72I0eIbl7Z3IhvzcEqMAO/9EWXcrHd21kKTE=; b=e7VS397GWVIIsmMiipVpGjM8MO
	/IJCfjB+zeARtKHzUu07/dpPkVlD8wR9a1ZrGQxBmQwURh8uOlyqmfAsv2/BOTfAUVmfqvA9otu4s
	3HvhpJo4xJGVbw7Qv7CzddIgFvqFrLa4qznax79b9f6iiV+Vzi7BZrntehYbOgPKecYJ7y9M9njWp
	XA5vGENs7bvgFgnRvWRSkclt0JEQa/YjPomyYztghXz9MsJ8dt+5rcDaWTMPLBisOdvTdw8n83V/F
	E0yGnFXPBsrnOUv118DDs2skyfzgOo6UKDhmL9SSDuHRAb8cH/51Dip+AtYFsxAVA3/BiDiM/lg1s
	k37YKIdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzWR-0000000AZxF-3Cj6;
	Mon, 01 Jun 2026 10:05:27 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzWO-0000000AZwR-0yPp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 10:05:25 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c0c379e8ffso7825625ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 03:05:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780308323; cv=none;
        d=google.com; s=arc-20240605;
        b=RGB1pCLPEGYVW6aQV4nl7KOuxLbmxJ+yZoMPsp+MdibGoUtqUeRIcVhM5QJU/ql0dm
         kPrA5qHP/iOOHQTxn9z7F4Qb4G5WhJGxpsel9YX1IwKh1eEmOguN8fvKA2BlFwkIPJ/Q
         IQlM28cs4v5N5yxecvzi51LJ55SP++RlbtZHn63oFiJu1winUA5tYg85dFPdlMtUT/yr
         G4OBsvcVDR93OEgYG+yMhLJBgwfTABBxTLK80GPoX2Gi0H98/VhtPh/tn2lbZByyRq2H
         rF5TS7KJ1wx2W/MQzgP4adLSEIpg6+QDwGxV9CSpuPKvGir0MLFZ5t+ifoEsZf7EF0B7
         55rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BdswV/H72I0eIbl7Z3IhvzcEqMAO/9EWXcrHd21kKTE=;
        fh=WmgKkp4nSq+iQSYrvsDnRR9cXEzIqVXxtw2tydnSgbw=;
        b=PH+CI3n2r8suioYHpTR+CsfWApqzTgVSrSe81DD4evyzCS0zyOAgbMOzzuzC3soOOW
         Z502ja60fetjP1KoamwCc7WMY/Ap/WCXDwrNfAVrY1JJKZRJQdGupqkBcs+7mt9gEksO
         BizbWTRJG2iW/zu88qZxFmj7d+uhUx70Yh9vfrzS0tuh8iBE29p4yhxWqQwcQaOiCOFd
         trUmSLTWKt3pULeTg14cUW40y6DbYmfqPrHOpU82hMnOdL4NS76jbSixdsgX+M7JNN2w
         m6PGrJyTRfgElpeh5dS3pc2TxDO2T1YfxlHzb3ZZAIySs01tEPvHyBUgUrs+eMsBeJOJ
         J51w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780308323; x=1780913123; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BdswV/H72I0eIbl7Z3IhvzcEqMAO/9EWXcrHd21kKTE=;
        b=VitslqZe2m+70nVBEIVrERuOESpeTTQBU0Ra+8myIcvjXx6BeXrzSVDuhNAsd7db5u
         OwdF2aHq6pcQCN8wkGhIF2eGdJIanFKv4Ju8UheXnVRei+S2hkQQVZvOZJZCGpdDfh6Z
         /y9E3rygyobQqwo2IQa+1C5ohRHlh2hQ20JHyLolgxh1OUgUUq+byK+Sq55Sat6iGj/R
         jq+NOi+1q9yW3/5982RzHuEOMWRWrWJjJ6HsM/eILdcl24QOqtrY2FwlRY39XqTN5TPs
         5XLHDvUMikmL7N0MNneodzz6MmLLdEB98HZKton5ac8gfsKmVHCgIPuLVyLeUoyLeGb4
         CKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780308323; x=1780913123;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdswV/H72I0eIbl7Z3IhvzcEqMAO/9EWXcrHd21kKTE=;
        b=KOdZI56kPE6hqYAEFBwP1yiCy1J3fYg6XNB54XnSuZm/VKjAssKgh/sA2UEISlzvVx
         f3zUOWphn0zwG9Xq36lid8RvvDJ6LisTgsL3jzJvOomXyGul/9kxSHoq9hnz+t9XXwNX
         g9IxauBfB83bF0lYPvqVJpI4ok0MHze3q5YZc0DfYGCk3rIU7w4krjk/BR6CVM2Fd54F
         isTaVAUPqh5OyhiE3navzfiI1tlfwPb4elqjrlvZWT27jblunufnCm1cuRmeW1hEDacs
         HkSJcfT9usUYEJcDZm/WmUzoLCFQ3NrAW16r+g2XKW5Wj5zqcT2fYHNhCQUsQI0Lw9dh
         WsaA==
X-Forwarded-Encrypted: i=1; AFNElJ8QkEfBplLKjLBSOP3pMcnOLs8uA5bTlQhtkpZpafCXb/zSefHJBurlqPaC/AWUO2JbLe9SQMFDmHBdN2Nf6RKu@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu3bIwfqzfnJeP287iNHScm7RTJ3rjchUEg3zakItJ1DNDpipi
	nIddPQIZbVFu1CZIFVuYQEVqIkLYgM34L6PXIV5+xabwFOzt2BXYj0ZzYpPVZARQNyu4dyvt/d4
	EPZPYOqRVfkMuNeTfYVGCTrBRAh7lKKM=
X-Gm-Gg: Acq92OEhZPSye3p5XlRSkjE0SguwEeJeFMwe8Z6OGcSTuz8uy9QF9m31OitLNh47jkg
	EJcATNF4fdVy5NK62X29HK4Hg+TbMRBcPHzSxwO37dzlkSpX0KDpGjKLSAkX0i3Y71SbUHpOBXj
	GX4/QcdG9400ZUHX/bz2ClZ345JhomMXmVmzD89CV36Bax0+YD6MWfBYeqSjQOn9wmvmJq2zMqJ
	nxdVVroIranJ4q4JysOOKu/r3h5NluJs+c7GiBjxL/sBiMXNJMjCS1xSTE2cPqmypk8WklzBblu
	7tMo2rJTuawdc+qrlW+6EHqsogn9E93MbCpuRwi4hLwuVdWk
X-Received: by 2002:a17:902:d483:b0:2b2:4260:109 with SMTP id
 d9443c01a7336-2bf3684aeb9mr121794295ad.23.1780308322810; Mon, 01 Jun 2026
 03:05:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260522100318.73474-1-phucduc.bui@gmail.com> <20260522100318.73474-2-phucduc.bui@gmail.com>
 <20260530-adventurous-basilisk-of-happiness-def6fa@quoll>
In-Reply-To: <20260530-adventurous-basilisk-of-happiness-def6fa@quoll>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 1 Jun 2026 17:05:11 +0700
X-Gm-Features: AVHnY4K0HX288K_cD5Sf10SY7BujkeLaPeGOHP02VGsc25wWrKbaxn-vW53Y2o0
Message-ID: <CAABR9nHh5WbC+A-7KV9jKEUbmK8WHgpf=VUk0DJqFrhhQFRpwg@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: rockchip-spdif: Correct SPDIF
 clock descriptions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, 
	heiko@sntech.de, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_030524_276134_773A9B3A 
X-CRM114-Status: GOOD (  16.06  )
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

Hi Krzysztof,

Thank you for your review .

> So example is wrong?
>
> What about all the users?

I only updated the internal description text to match the existing clock-names.
The clock ordering (mclk followed by hclk) remains unchanged,
so external .dts files and the example section at the end of the
binding are unaffected.

> Please wrap commit message according to Linux coding style / submission
> process (neither too early nor over the limit):
> https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597
>

Thank you for the guidance. I will address this in v2.

> > The clock descriptions are currently swapped relative to the
> > clock names used by the driver.
>
> Why would order of clock names in the driver matter here? I do not
> understand that explanation.
>

I inferred that 'hclk' is the bus clock from the driver, which uses
devm_regmap_init_mmio_clk() with 'hclk',
and this matches the description found in several Rockchip datasheets.
However, I understand that the binding should be described
independently of the driver implementation.
Therefore, I'll drop this description in the next revision.

Best Regards,
Phuc

