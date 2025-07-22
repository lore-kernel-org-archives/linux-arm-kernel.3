Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D94C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 08:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEmEf6eIIroYB8olMob+1Spc3WW6pbbUb9E694QrtfE=; b=IL7NPqoOXPRPjP1g8W/gg/jdGT
	xBLqi3lzkOaXZ1wFLFz0syDb5sxRSSMPXbBppq/Jqn601LFblu5wxoTmVSdqp27bVUn0ST4DjbO9n
	TpGZMDGPtu/mVUJ5U9EGjfsX1lxeXlJ3+X7+G+rbzr5x32DTNUAoQ9dFnb8+UhSF2J2b/yggJ5BkH
	64eqs/8NEx3A/xgBU3vA6/b2vUjTTkAzvxRvbgePEbSttT3unOxseV7LjniJ4RW9wfJIepGPCbiMS
	jfZ94d8gP7YNbpcMoXr/qvem52pzE7f7R/USa7aBs4Wd4X+ska8noA1kB2Tkr+IPKt7A1Z6FuUCY2
	iByYJD4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue818-00000001lYf-1iNY;
	Tue, 22 Jul 2025 08:06:30 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue7ye-00000001lHD-0sd6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 08:03:58 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso40895955e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 01:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1753171434; x=1753776234; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uEmEf6eIIroYB8olMob+1Spc3WW6pbbUb9E694QrtfE=;
        b=VMHUwCDNmAuY/Ll5JdjIdpTZ2bRNxq/CMlGyOg4nUxZT+An2TBm8p/jEMOlK8X1OdJ
         SgnZ2z31IF03MBE8aPVI+1scHmKdq68H8vJq9BC/nGjT32DgW1mkhym8D6flA3BdexRf
         d4dP+O+tm27duiX51iu6wtD9NyNQN6DChBbpY1nj/7+LIuEXmVq5dk0bzMeBq3QBGyOS
         do9lQJsJobga8GCSoqV7PugAlrOMM4hJIMoBZKQ4U16CRE5MUlghGxu/G6Q0xNxpr/c5
         JhEwQPfAoqevNwZnWqeKq3riqE2ohSQGqSd5517RMwS7FmvPzcAHYwlSJjM6FpaIJWQi
         PZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753171434; x=1753776234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uEmEf6eIIroYB8olMob+1Spc3WW6pbbUb9E694QrtfE=;
        b=BXlRkQWKsDMIYQ3DHP+jumpZblkymp4Gn/IkBXiCxM6hvDbYPS1t6u7NUc5JKGadcg
         ULnA55Zxu3qerInPXFBhQwpgDW8jIZBtklFCcWmSQPGdX14bU3c0c8DOkWgeqShKGiRG
         /TmU99cdaqoUFZgFcOVOF0kPynuxsV7aUoSUWhR2zNy1aKgsEh6XMVYjhItRZZv5OZjz
         Ua3Z3avKsHvl2/hTwHc2j4fxo3VF691bimHwMyEAWJWddKulwDxvPDnqkNFX9otcMjuP
         q1ToWV+pzjIaDu8D2fHzT+Ur4dxvD8QEbZV5isaFfLm6gW7LuGztJK2pAYFByMgWiZJ5
         H5BA==
X-Forwarded-Encrypted: i=1; AJvYcCXxaqLzJcjLqaVf7tVz7uFEE4Zc0LZIffBHg7Pfyj8ETCTn3ETsqptjc1UkDLUX6oiUju81r+djcacHr5AaAvE2@lists.infradead.org
X-Gm-Message-State: AOJu0YwfR4YXSoDxSNyNne6ldlE0+D6SrXHDUkrjW6TYFTuw2LvNdfRj
	XCVhvoJrOMrv7tKzl/cPBZh06faHqqCSofS8z8hnh3WaNNPDOOHENcaYDANMEAjGdGQ=
X-Gm-Gg: ASbGncuzkVQlRKejGnJrFrr6wNbdme/G5VJJvgoCVL1IDl85upiTiypbR2p5y6uD4Ai
	ZXW3N2XAY0DBgYXpQ07yZt79WJdArtq8OpXM8grQGxG+PxbEF0aF0zH28jfWe5j4mnPV4lQ31MF
	0r6mzAIq2SwfICU3AbZQht8IWmDyGpYPaeeXKf66nnE9gEIBY5mUZk43hfcenGLoY6B4nHX/Ikh
	kiNoeAhfu9+yrXD1t1rUYJvZ+qm2WRsDIyEKCU+C3xHRTwlKJGZ1cCYKM175AS2dK8d9Foiu01t
	PNx5U/Drgj8LzGYmaNTDl1xpia3ysUgYEGC/sSf+p6BfrYGKYrUN5BlXH+Qg0F+hwH1QABClp5+
	k6KtWhRg85+wUbRjQbYHlt1E23IQ2WdIZr2kfBiKrXbOgEo8l/b99TI90tvzZjMJ2SssJbQ==
X-Google-Smtp-Source: AGHT+IH0HJnl+dwSi0EWYLrpcr7/uk6BoHHegtmmKMicoHxCMgGX73lCJhcNP7HethjBe0TSmHbeew==
X-Received: by 2002:a05:600c:83cc:b0:456:237b:5e4e with SMTP id 5b1f17b1804b1-4563b8fcd8dmr125773945e9.32.1753171433982;
        Tue, 22 Jul 2025 01:03:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e50:3860:59d3:864c:7ddf:2abd? ([2a01:e0a:e50:3860:59d3:864c:7ddf:2abd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca25533sm12474855f8f.11.2025.07.22.01.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 01:03:53 -0700 (PDT)
Message-ID: <9d77242e-8cf3-4179-82d7-24109bace40d@baylibre.com>
Date: Tue, 22 Jul 2025 10:03:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] kernel: irq: msi: Export symbols for TI SCI INTA MSI
 module compilation
To: Thomas Gleixner <tglx@linutronix.de>, vigneshr@ti.com,
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Tero Kristo <kristo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250707-timsi-v1-0-80ae43b2c550@baylibre.com>
 <20250707-timsi-v1-1-80ae43b2c550@baylibre.com> <874iv9w72x.ffs@tglx>
Content-Language: fr
From: Guillaume La Roque <glaroque@baylibre.com>
In-Reply-To: <874iv9w72x.ffs@tglx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_010356_484116_EA449CE1 
X-CRM114-Status: GOOD (  12.10  )
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

Le 18/07/2025 à 22:57, Thomas Gleixner a écrit :
> On Mon, Jul 07 2025 at 17:35, Guillaume La Roque wrote:
>
> The made up subsystem prefix is not really useful. See:
>
>    https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject
>
>> Export MSI domain management functions to allow the TI SCI INTA MSI
>> driver to be compiled as a module. The following symbols are now
>> available for module use:
> While symbols is technically correct, it's way simpler to understand
> that these are functions.
>
>> - msi_domain_insert_msi_desc
> And with that you want to use function notation, i.e. foo() instead of foo.
>
> Thanks,
>
>          tglx

Thanks for feedback i'll fix in v2.

Guillaume


