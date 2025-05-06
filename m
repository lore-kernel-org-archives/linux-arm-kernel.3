Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C34C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 13:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCQGBPsfO5vWFkl0A0zD/MgOqOEpO+/052K/NE4TDl0=; b=OEKZutu+Y/bkIDHmcrdxnW+Pmj
	RqPI5pLw9d7UyLIztW8RAaHika1VGfiTZemoFmnhxqQHF2GA+oKvXPwQlMtV0+B+x+MuaXaeWoLcm
	CbsSvxN8a3GTVmzWshx4vi/2IjX8UpwXAU+ZnWzbFF3+eGLw2QMAFm87FgX3Mt6q2iyxOzFClMk2n
	+yK4sJW45UqsFnQ0G12WmTNeinfSxTfAlpn5h8bzaU5oQS6JxAfp0QhLwry+psYgVp6bZSPNmo3gw
	c+b+Y8VaLZ6uWenG5wdjujOtfrl8Se5bwiUf5/CJH/CgDFua7DfQXjbIN14Ea0NOGfsjxGjIngh2k
	raKdVKCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIF1-0000000C5LV-48ie;
	Tue, 06 May 2025 13:21:47 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFuK-0000000BdBa-1HGx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:52:17 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a0b0dd3b5bso27219f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 03:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746528735; x=1747133535; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DCQGBPsfO5vWFkl0A0zD/MgOqOEpO+/052K/NE4TDl0=;
        b=Ex7dnWyAYRP7mRiilIH4/bHmRk5V1nN2dc4mddhvCCoSpqRMMkHNSm8mwDfyJYLVye
         chrpXwYNqJQe3PcAahTey8NTCGG9S/HWe8Q0Vz0105G38ts2O1LdQhV2ZsFr7IwRfrpm
         y9w6BK+abjgFWOD64QCW2frdWypuFeaxjDneMBlQB38ChGEJFRwAOoOc7/JxeAZVYscb
         9ZmJmpo9qIHigbckk059et0apsMhHUCws2vs/oM2aNzzlbh7kmBO9uqpBAZN4g8dzgKw
         ixdWg6xaTJHLhYbsnKLkulwhmhS5QsLeloBIGT438RMrxaigStc1ZA3Xo90zPbv90cX0
         NfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746528735; x=1747133535;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCQGBPsfO5vWFkl0A0zD/MgOqOEpO+/052K/NE4TDl0=;
        b=KgM42+vvEKF/FZ6rjhka6jzNjneOc7uJrs1Jgd7MccwgxVHI+kQ85URKxg45kHFzJd
         CGB2YPIg/SV04fkImblQdoueuvIACgn/Yn8iytNVkh2XkvNNl0yD0aFTgfJIkjkpdYul
         yGWUVCCjxnlmeaYLNDLvg3abl2BLO6E5fUx1e/ScerFjHUyqVBHG0iz2AlPBNd8ZnIa7
         897+tfgEiGT/HpFexwVs8IWQE0dXmGdSENGuhPYvi98xKXuKz95HGb9NcaEg9vYNQdAy
         z88iWRvwDeo+tIYCTl3rIM/daqTlfGpmyvfeNllvjxhG++Bju7wd/wT0rB6KdX4PEqqD
         jmxQ==
X-Gm-Message-State: AOJu0Yxjo5lNdx4I+ah6rxjduTBMtc+BBna1NEb7lGwYGKc65ulHp9HG
	7yfcuffqV3Qq85uV8jEUtSdjuXCD6JPXkYB+V+hbzqye3BaC546+HQvxB6pTrjo=
X-Gm-Gg: ASbGnctjehO6EZ4BGoLxjF8BAoiSEXMX49urjjOe+gDhjmy3im3wTzdp3XMKYQX8xbv
	RJT52wCZ8B//lJamqdEIP3K9KxUlDT96Qizwx9tPaTcbX7nNop1fSOx34/jGh2HnocJFrYKTwKB
	NbPqskOrWxI0iqgo5W+RnbPQUoMAaWJmuGxJ/JUg7zB6gPsJB7pT8oNCmKbQKSxo9XvHxzcgrOl
	LhGNu/QJrVH331WVbeIYDuaQC/nBMrxZP5nr+VmMtsuqFKF/RqRqw21y1q1VwYumsgnpC5Dh/R9
	dUzwhqWrJ4f8qdzzB1zG3uJkRWQOH7PCCBU0nxRYPbvAUktHNP6y7IOowEo=
X-Google-Smtp-Source: AGHT+IG+AWKFdW1c3BWzDe6zKGQh1cg2/RqGRVWCUYPzqFEaMQKAz07sa0MgSDalD2L/4cnUy4wIWA==
X-Received: by 2002:a5d:5f87:0:b0:39c:2663:6c23 with SMTP id ffacd0b85a97d-3a099adf5e6mr4448569f8f.9.1746528734779;
        Tue, 06 May 2025 03:52:14 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b170b8sm12995727f8f.82.2025.05.06.03.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 03:52:14 -0700 (PDT)
Message-ID: <3a11ba8a-a9f4-4829-8bcd-56f1702bee8f@linaro.org>
Date: Tue, 6 May 2025 12:52:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Build STMMAC Ethernet driver into the
 kernel for NFS boot
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250506104731.111876-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_035216_361131_F3208DEB 
X-CRM114-Status: GOOD (  14.98  )
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

On 06/05/2025 12:47, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Enable `CONFIG_STMMAC_ETH` as built-in (`y`) instead of a module (`m`) to
> ensure the Ethernet driver is available early in the boot process. This
> is necessary for platforms mounting the root filesystem via NFS, as the
> driver must be available before the root filesystem is accessed.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Same comments as for previous patches like this (even the same?): you
are supposed to use initramfs for your arm74 boards. Even armv7 boards
use initramfs, so network driver does not have to be built in.

For example all of our setups use it thus we do not have to populate all
other vendors with our own drivers.

Sorry, but I am strongly against such change. Kernel is already way too
big and with KASAN it does not fit to boot partitions in some of the
devices (and I cannot change the boot partition size, at least not
without big effort).


Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

