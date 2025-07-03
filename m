Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DBCC83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 11:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FtQ9lRAm6z5cCoKKpjFUoJ7pNUTxADNFPTG8yUssXP0=; b=T2w5lzpVFPGF335cr4fL6wBDOq
	MMDDOtpIHyb12MYQc0jynFcqjsqEX+7PhuBblgRHGteP8U2hOj2Fa3wSr0s8OYb7i9RC2h33Ty3Ix
	/96MmL/npMn7jcF2kcJqo/BER0MM7D8wuOTRy9kyAyvP/bWQ0DFey6CClXmFJ7fm4trMLFwcXlfMJ
	Xfn80v0kkkOyFA0ej0Cv8YKAPbrlNW276Y8kCyYOqzYJyAJbSu3rd7w5JWa5KbFuyUnE8mw03/+6p
	KCdx9PCot80kPL9cDPjsMAOwsWJ4j1PCbfJe2v+iemufFjuXCpT1nssCBafgGTPqg++n8au3LzNi7
	SdoSdpBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXIT0-0000000BDio-1cdg;
	Thu, 03 Jul 2025 11:51:02 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXHG6-0000000B0iX-1mrT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:33:39 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso9316864a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 03:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751538816; x=1752143616; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FtQ9lRAm6z5cCoKKpjFUoJ7pNUTxADNFPTG8yUssXP0=;
        b=UQPZKcuZB+IcaN/sHSonWbs0SSaNWWX8XqGJHR9j/3uBD54KrXirNlYOf0uj6V9+0f
         96ez4xw9Y2tcXF20R0jot49h4m2LRbGSOJgWc0OQxQ9SkKxzwMiRqbxQZpVmpW7AKkTU
         OPfdjoofAQt2E+D1q19UTFtYCyF1Nu0pezvlyr7KURBwpwQJugQJnshMA6DAX7IwsDh4
         w+w6LujlhSPBGFCMyB/mVkCmnxOZqYrVZol9Zrfx7FpOwTeiGqV6we+Y7kV1fKDhLo+v
         ctzXj6Kr5XOnAya5uRSMlsu4NVFO/5XRVTKJvzzF22J+L4ryeEQhWOdZxhlGYoQOQCV+
         DhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751538816; x=1752143616;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FtQ9lRAm6z5cCoKKpjFUoJ7pNUTxADNFPTG8yUssXP0=;
        b=I7tQ+5a8746yeu4DZ1FyY7qOZ196wcjaM12BCeLZHBJDh2yyQhNTe5eqGOCC5sj1OK
         0M9ymh2EHPCYfpAQ0WvbVzyqxfSvZQny5INsi0wvFsXgrt7HX2kqDzJodKoAVAthPl08
         ZpOIG0BvB/whqCCiI8gf+CfEyebM7DcBIzxUjVQE5D+yuwWiOWRy5yYczPT2nZjQzO/a
         TugLM63Z9ICSztBvIhNs80cfb4SIJGrXtvC3O4wyEf7BGKO4JeN8JtAbi+cpCnHeTbsC
         Ib71MCuyWLt+u2JATby9rQMFiVd+gOChaLX9Ck4x7xmpGOB3Ov36Kw1eyJmrUfOe5Di/
         lZQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfifUL8298j4wsw2mSiZoFXgBBFO1JgE+I0O7J4vqnX5unjZvUXBjiU76w98iCtaXtJTWtVQm4qtKm/ae53wDn@lists.infradead.org
X-Gm-Message-State: AOJu0YwEBvNZnjv+fs9+62PROqNBSPKGkDLW2Ff6vq5rFeGhaXcZvpzO
	dIBiE5Dwxwu6qX57ZWdnOAg3eSsNQU/XZzlJ5nG4GbmAJiRlgGChZyOPYXVJ5gILXtVSKMDZerX
	Lcnhn
X-Gm-Gg: ASbGncuBxu0LnrEaVZtYXQk3Vbssh9WNWmj5Z34GhgH72W82jt77u8QKsVYkxGcZuD7
	f8lJeR0IZdinLK+rCWdOiJXdDA8m/hAzgbH+PrRNiHasn7rSpxhj6S2WjmcmFA5uuUC8e5T/t/t
	f1WVBR6aLJD+aN7gO5dN4uD7RirdVaYSx/mo9fdI21K60MUatw2F0MAaBiN9dm8/18L6WcVR3I/
	spISP0JC7HIfCCmYAI1AVBjVAyMIfcg+hsUaWd4lHLTBXeuD4ryiEgAISjtY93IXNezviyYAETG
	U7RcT4dDNKCcz40VkFmsSMv9zPDD8BiE8uv9HGBh8KDCi4BwI+HofghplX2ENJClGWRNWu4+3kH
	H4iHEcTjA6pnx1O4Q
X-Google-Smtp-Source: AGHT+IEAH1Qbn4XNukfjtEADuVdGYHRx0aWx0QTiYECTFTYG6zMFHteBb3TPETKc8kywiiMldQNjzg==
X-Received: by 2002:a17:907:9720:b0:ad2:2146:3b89 with SMTP id a640c23a62f3a-ae3d8983431mr230012266b.47.1751538815896;
        Thu, 03 Jul 2025 03:33:35 -0700 (PDT)
Received: from [10.128.60.15] ([81.92.17.128])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bda4sm1246384366b.141.2025.07.03.03.33.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 03:33:35 -0700 (PDT)
Message-ID: <fbfc6bf9-d7c6-4df5-85d0-b1d357159d88@suse.com>
Date: Thu, 3 Jul 2025 12:33:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Forcing devices into idle
To: Thierry Reding <thierry.reding@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-tegra@vger.kernel.org
References: <rlzpjdsg6cbgxc553j6m25ysb6tyldy4lnxsjjn4hdzv7rszpp@y6rfcrbjfook>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <rlzpjdsg6cbgxc553j6m25ysb6tyldy4lnxsjjn4hdzv7rszpp@y6rfcrbjfook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_033338_480579_B6A8E0EA 
X-CRM114-Status: GOOD (  11.03  )
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

On 03.07.25 12:08, Thierry Reding wrote:

> Any thoughts on how to solve this? Is the pm_runtime_{put,get}_sync()
> method acceptable? If not, are there other alternatives to achieve the
> same thing that I'm not aware of? Would it be useful to add a new set of
> APIs to force devices into an idle state (which could be semantically
> different from runtime suspend)? Or is this all too specific for any
> kind of generic API?

Basically what you need is what happens when the system prepares to
do a snapshot for S4. However, if you just perform FREEZE and then THAW,
devices will assume that user space has been frozen. You need a way
to substitute for that assumption.

Runtime power management is unlikely to be a fruitful approach to your
needs.

	HTH
		Oliver


