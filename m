Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D7ECD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 10:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zs3o8mtyZf6a3mEQ56g0Zln0Vd2kWO9rUcsd+oFz5A=; b=y6geQKAg3azvzSOXWCIXHO6Vle
	wDm+hP2FTTvH0h5b4OggGm+PYoEc2yJdABmCO3gGvaIxVDcfcP6zVHB12holwQ3HuuI8J6Y75eisp
	dgwEQR/9ups8OD1MaGABU921rP1fAGi77wwn/DoN5AjYmxFXUqDUoBklWYFoU3MAy8zA8eM1Xtefl
	9vkcvT/diCyRnpra1yhkWK6o6kdarJV3uDhjiRD/ekHgbhG7YCiQBAZ6drlqXJKTzkj2mZg/cCeK3
	hWK6uEsk6sbpcSgoAUU7OOvwTZ1n37djMubSMkjxmzth2aN6sIiuafTOc2Psxyy2af/BzduslKdp9
	HygKaYZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAGK-000000017ZZ-23lq;
	Thu, 18 Jun 2026 10:46:20 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAGH-000000017YR-49Ur
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 10:46:19 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-46255b269c2so545510f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 03:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781779576; x=1782384376; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=9zs3o8mtyZf6a3mEQ56g0Zln0Vd2kWO9rUcsd+oFz5A=;
        b=DRfUU8QbDrPytz4JWDsdujxcC3q2L+knKPGA9svGIriN4FOqPUMJhhhjRON624zmbx
         NZrAT6LFYSkjSrtVdBq4J1odKprD0SRAdCKwSYVFl/4nbNoPnXxUDD5m/zna8Plxka26
         i+2rtqjbc2xhhRQkSGWI7NGFbS3berWTECzMasCDC5+G129BDAAbGJBwPCKvZHcDr3KG
         DolZzgieeNSDy4FN26HjTSei8z7t10sz11869fflZS4YUjA42YPUIQyibS6BNzNTz3Vr
         5sVeg9TrjrTY4lqaXzWPYSfFKqgPMwtqaKoOPQdA8hf1wpExkXLXozafCxsqC/rISIsw
         0u3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779576; x=1782384376;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zs3o8mtyZf6a3mEQ56g0Zln0Vd2kWO9rUcsd+oFz5A=;
        b=DkaaM4qoNUdtOX+YIDSsmW4jRGY4HmnYsaYBphq1LKu/dD31gxeWvQNctcdRmPYBxa
         yq7juSeTmDRxVW9lgfZazXOsywdAcsUjcOI2vxylxdR5uq7y9HuT5siguuIap1LYBcA2
         WIrqJXmF9MeFkAQQP4IPbILm6dWJj9dGM2hRRIU/yHSXxr58Ccs+Kxt0kOIDVZNCpKxa
         I+wEN5mSTUMQ8Z8nFD34JvsSQ2L5SqD6VUGneneFOVfKQKk0VHYVxIMYS8Z3pmiG1mjb
         8QdrM3M8JEtlLvZmLdJLbHWM8LLK4OunLzXltsC8fksifVD3J4b3I9tJgh+rHRqM343X
         EXFw==
X-Forwarded-Encrypted: i=1; AFNElJ+OD3+ViCQ8bbY5dUPwfDRCqVGEX/YY5G8j9PAYbFUAUv0QahGwJX1DTiUsNTf7Df/+5keRTfYs1rUUCzZko2oD@lists.infradead.org
X-Gm-Message-State: AOJu0YzqMSNt0e6NwubWlyYvBy2tthKbg4Z1ouuAJ+XXVLPRuDH/w6Tz
	++Ug6h5gZpX7P8r9gSI9wRgjVNrkrPiqHNIDqbmD+cW0ACj7C9TDtZsS
X-Gm-Gg: AfdE7cnoMx9N1y9LF1Y3WrELKCp7JPXfesgcYC9LutCVBct39sYyp5NoGXiK0yHHv1Q
	YYyc+K/pa67tbDg3ujv9yspYM9LVMPqvPPsq59zCl6j2u8eQ/tsxg5KB0vJkcBYvXBFPI8rKIN6
	Gzz1kxClQ9GtKFmgRhmVHHin+N+Bbq+NZdILBh9ydkw25SIZK45O1lkH7Z2KTWRxLESyfzua0dO
	qA0AkesSvrnTA93QfQZ1GCXlAlLPG8/Hy3P1K3J5OXt1FDJmzSrT9mYOzGuExFZC1KTox+S/cca
	bSCYyK6LDe0lflfqOF6vp1PyaIFQW19QLbWWEN3umh2H6puvBGGBjpxUVoJ94h/DrI38C1dbcrt
	OZNxNxs8UAG+vEH9o6gIIBvCuUbHz1MBNtWkNa9x3S6Z/fE8erot1iA53JjtsEbSgDJQlDEZ4zk
	SK59vzekwOIey4wALIe6Q30IX4DteiVynjSnnenKB2xXeE0DMdF5ZnCRvdjWkB7c2IyKbiVhzdl
	jF72ADREzjWmloGYw==
X-Received: by 2002:adf:ec05:0:b0:45e:f780:6177 with SMTP id ffacd0b85a97d-463ab7020cemr3850916f8f.18.1781779575898;
        Thu, 18 Jun 2026 03:46:15 -0700 (PDT)
Received: from [10.128.11.42] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d70sm62509268f8f.19.2026.06.18.03.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 03:46:15 -0700 (PDT)
Message-ID: <a372e209-fbf9-417f-ad08-226cb7025949@gmail.com>
Date: Thu, 18 Jun 2026 11:46:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] drivers/firmware: add SDEI cross-CPU NMI service
 for arm64
To: Kiryl Shutsemau <kirill@shutemov.name>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Doug Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Puranjay Mohan <puranjay@kernel.org>, Usama Arif <usama.arif@linux.dev>,
 Breno Leitao <leitao@debian.org>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 Lecopzer Chen <lecopzer@gmail.com>, Sumit Garg <sumit.garg@kernel.org>,
 kernel-team@meta.com, kexec@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>
References: <cover.1781709543.git.kas@kernel.org>
 <cover.1781709543.git.kas@kernel.org>
 <ab745689c0bfd01438d98ed1c79328bf2121be3b.1781709543.git.kas@kernel.org>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <ab745689c0bfd01438d98ed1c79328bf2121be3b.1781709543.git.kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_034618_038323_8581C3B2 
X-CRM114-Status: UNSURE (   8.84  )
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

Hi Kiryl,

On 6/17/26 20:20, Kiryl Shutsemau wrote:

> +config ARM_SDEI_NMI
> +	bool "SDEI-based cross-CPU NMI service (arm64)"
> +	depends on ARM64 && ARM_SDE_INTERFACE
The dependency on ARM64 is redundant here since you already have the
dependency on ARM_SDE_INTERFACE. Maybe a comment instead, though I think
it's pretty clear from the prompt...


- Julian Braha

