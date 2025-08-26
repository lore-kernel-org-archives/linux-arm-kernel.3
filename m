Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FEDCA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 23:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CD6yjiZ5YQJ32PGJlfbxDHcsoHAZgjFnPcceDJ4tFUI=; b=si1OQpbEBDLcP6JehoTMuz31hW
	VYWBQTW69RjniyPacW1zFbiSSsUxqBO4OeqE5Z65dB6rWJcre0VVSSpV2lYfPIp2biJAbtiKfuDfy
	mqvM5fgUMTaFqfkrfALj45OTiF+VoWprnAWXNJvsBQqfp4X1i0gro+gdT7WUxGqNEnckVdwkkOYyL
	PlVzhup1ucwLwmgO4+DEe5cuADJuR8UwCMaq3FfrufD7NBUlQsq6+3NpbWU8NBepTP1D4z+OSwF3r
	ebcHtG86gehL3eOTY/tz00PDLWsStFeQfXhR1Dfq8Ymvvqyae2XVnCKKyYmBJcKN88AN3J/gFZqG+
	t7hG3Zrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur37j-0000000DLpC-2qU0;
	Tue, 26 Aug 2025 23:30:43 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur350-0000000DLYf-2ekE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 23:27:55 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-b475dfb4f42so4307850a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 16:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756250874; x=1756855674; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CD6yjiZ5YQJ32PGJlfbxDHcsoHAZgjFnPcceDJ4tFUI=;
        b=N8WMMFWtn8IhPcGU9LMU4+PoPbZ/dfl34oDiEKmpObnkFIDaFey2e8qESlo2tYiA6l
         tz2b0Jpv/dpIGiY/VlsgYdl/jY4U7bTcB1av78FYIrTabEXi9hPudY0HxQOg0J08TR2Y
         dUu32kC1eYnKLLcCXsAPaU/Z6yKciv2cJKYjMauM5iMpUxo++Ib56ERXd6IiOcXg8MIt
         MOpUrLxsBJ20wobrfiTtIqekkwhFckPu2WUq6pnZKDQHUJwmSLw64Rj3rzWXd9pu4e8X
         0wragCzaG6eGbaJqzP5erH7xMc8vYXiWzAk6C1gO7ipxitcfYvO+1g4sYOoPZQv+0gzc
         rlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756250874; x=1756855674;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CD6yjiZ5YQJ32PGJlfbxDHcsoHAZgjFnPcceDJ4tFUI=;
        b=l2w+QyifwlqdIetxv/7C4AfLJGtZrSefR4p/WlefegQe4B6rb4jnpq+GFJH8J58X5h
         qltw/uLzsO4VyZBuK68SX6+lPzcYxzfgL7IqbREvurAd00ugK1acVQl/KBOjBQOaa4fW
         MTcmqNe5Wff1l1HVENlvRowqZZjlYb+xZBqg6WDD6zn0jAZRlskyXVctNlllvAaBORS+
         4BGhSoh29ui/mdaYRuNWzM751BniJK8Vhsoy2zIbmxkfvbeXk7X1iqp4iUPILmr2v4hJ
         dfRVBAi+KtZjqVE9V1jfLrR3JIyxAo01gM4Fo7+bFtAledc/fWFKLAosSRcXixyjIwm0
         DvlQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0Hi4PgjNACpfM0b6Gz4sBUPSzdOMuAFJ4tfkXeCwIVioX58dmc3ckDoxu+C4sux32qhG5kDkWkoJ0bW5Fk0WT@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ/5y27vthC/ocy0aGdx/ZCazQG4bnXC8GuicBVDI1C32xxGZP
	RgntOvxVKoWZeZ2DznLp5udRvDTq5/pw3RETq1b5ze0iYG2CR3nz+984
X-Gm-Gg: ASbGncsPEQiqzsZyNoRKO4N3Le9eLZOSYQmHuJwTbdRx5Fq0f3QB++1Rc6l5zMRjaSQ
	+E/UqljaKSMVxa92Q76Icnu3MmvaMDZfGoRWnSRqiB6GL3nLVUgCEhM/6HyZrHOWyiUUMTV2FRk
	hSaX+9GLFxFP7+c266a5BKZmqPJ21FqkCNDcTaDPTr9g3xIi3Q48qUCawCJ02Kghr0Lw24sqoOE
	/jyFSIPvfSTC9w8WfhyJSTPZJ7fcCDwyvyXoQY1JzPOR9CaInPuC8XfFhCCspC0ccKPOj1zAMUA
	7TTCXY2uI1XDMAoNeUd91ZkmPCL4xjnJfqTwd3zrZqpmjBshPxZoAktzrZW7h4GmcAYSCpMcEMG
	a595XanjlKa6B0zHtxccIIPUDtcXqAwU2t19N/7Fy
X-Google-Smtp-Source: AGHT+IFz/KMAhS4Oimu584tu9uMR736OqQJnjQoNKaXTHKg/3q21BZIuq4aoQ7AMNj16dNs+Rbxpmg==
X-Received: by 2002:a17:903:4b03:b0:246:cfc4:9a27 with SMTP id d9443c01a7336-246cfc49fefmr102960175ad.13.1756250873707;
        Tue, 26 Aug 2025 16:27:53 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466885efc8sm105526725ad.90.2025.08.26.16.27.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 16:27:53 -0700 (PDT)
Message-ID: <3b1a2ea1-4456-4f65-91f3-fcf070eeac98@gmail.com>
Date: Wed, 27 Aug 2025 06:27:47 +0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] selftests/arm64: Fix grammatical error in string
 literals
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>, Markus.Elfring@web.de,
 broonie@kernel.org
Cc: shuah@kernel.org, will@kernel.org, mark.rutland@arm.com,
 ebiggers@google.com, catalin.marinas@arm.com, martin.petersen@oracle.com,
 ardb@kernel.org, thiago.bauermann@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
References: <20250826214913.866695-1-zlatistiv@gmail.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20250826214913.866695-1-zlatistiv@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_162754_679037_A0F67C8C 
X-CRM114-Status: UNSURE (   6.34  )
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

On 8/27/25 04:49, Nikola Z. Ivanov wrote:
> Fix grammatical error in <past tense verb> + <infinitive>
> construct related to memory allocation checks.
> In essence change "Failed to allocated" to "Failed to allocate".
> 

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

-- 
An old man doll... just what I always wanted! - Clara

