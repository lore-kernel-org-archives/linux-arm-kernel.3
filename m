Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD569C44521
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rDy2YQnZjC9nWpz521LfOBEMpKeq+JKB5BWp/OjrPo=; b=NC5EwQ3uTbV5+Tx22XX4kx4S/g
	JpXCiMNWMMt0FYGUuRymXOE5P1lM2EasxNy2YxJ4W5/FJ2baKo/V8/iUSsaa2ZXy/2Xh+1aCEMIhd
	2t4jHZL2TTPwKGv0nsByr02qcGHxbn2PaZBh5tdS7WviWLMlAUjKchTgD/TFONrTxYqok34PTdUvG
	UVFHhf92SraQ2S8BlfiIcZsK93Yt2mQniTckUur9r6LUNvCJh4rA3fKDyi0pDrkczphSX6bQ2XTO8
	nk+e1an5DqRx0YdRZiScXAAQs1+/M/vinK2AHt7H5xLc3ALhC7CUw1BdlapvytufedUc0G/II2/39
	L0Do9OWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliLJ-000000063e3-0dLn;
	Mon, 20 Jul 2026 07:23:13 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wliKN-000000063E2-2pqh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:22:16 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38175907a56so2524996a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 00:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784532135; x=1785136935; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7rDy2YQnZjC9nWpz521LfOBEMpKeq+JKB5BWp/OjrPo=;
        b=Bkr+3QwU4HpJAA3Yo4FCjLHlldJFtuOwNZ1OfyXxenW0VsqQ9tyo0uVWa+kt4QNUMK
         WWAHxcV6PBuj8sD/QDpK6Cvc/Netpt/zOPUy0SPIGnuEfivTPlrb9iMh2oW43EL6MtG9
         ZN4B7XZIqfgK3I8GGzcK2quHBjWKxldv0fAbbbJkpm2sfvepNuQ0iy1ErVGiFo8GxEA/
         FgcmAiQj73WnqVujSJJqRuxAFHe36I97yQDBHc07+U76A5C7YfKEwRTgU8OufBRZUsls
         ftKsZzPFT++eSPjNTNg8dpqnopDcQnCZNillOONeRQFP8bQkYxwSdgxkd7sQhun+7yQk
         BZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532135; x=1785136935;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rDy2YQnZjC9nWpz521LfOBEMpKeq+JKB5BWp/OjrPo=;
        b=Oe1C9XsLU2W5e4/6D2EpKSr9hM6U8WEj8YYpEb0V+ki8nXTQId6rWqdbUKOF03txpJ
         sDjH7fKah/ApaNUWETam3g8lF3twcXUv67avt9T7bjRLH61SHTWeLur3L5cWF+XMnhu3
         1VEe/CSv/U0UlLjFTe412gMwdxX4ea9KkHuchVIDZLNxKK9by0fNku47npoBaA6JeVsX
         5CvybGQFBwENsq6veMkP9PLckQn4n0g+EMXMGXUnLnK+lkiEJND+uE7vzcyadu7NFN9G
         jXf/6jdOD4cVAF/GPwVnR6WIzj9QEZfKbvoMPdEmLEblEGtGOjty85dO1HtfJYiH/VcR
         y3Kg==
X-Forwarded-Encrypted: i=1; AHgh+Rov4ylzQQCgaZHkWneV1QZUbmw5PO1tT08SNc2T/gtFXWs6THYh6R3eClXu2rSAveA6Y95iQZDUVkZXSb8vVL+x@lists.infradead.org
X-Gm-Message-State: AOJu0YzReQXmhlKsIKh/L8gIFX+K9+8D5H1+DEMOgWDZX9eFCXhRLfE4
	vQE4O8pamor8E6UrY4SlBt8e2TK82e1ouhbiW8LMubXxMftvqUT2PQik
X-Gm-Gg: AfdE7cnhiTBLrHJ4vFh4VlH0nVCj5QkBRcC3nQpDeQhMqcchTPcdLpA63FPe+i4ZusG
	As3kymoOdvBeEuCzJ86xL2Fk4QrgHMmJ1snXCPAYhtCXYqegVmGEJu7F4lE7wLQbunHLjSl+++0
	ofRv65wzUQHzog0Bfux5NbnqyZULdu6y+W/U4q3jEvosmxTy6wabDz0E9BGoWaXF29p1jD22oOy
	wwyLVytCC8Hl0m1YxqYTNCcuoL5GypgKehS3TW5zMW4QtlpL6JpMXUGw+SfVJBXCVc7QFOIRzYR
	jIkO/CPztheZFOasfQX6FhU0/TiGHtwARmTwt6yWqFee45eEdP2yBZlZupsjM+eAKjWNRFKCwlc
	C8PsA2EH709twzZSReNm+OGPCliY2BWFHdvJYYlZ1F/2DzE4ta2DUtevmyju/P3nLEfggRsDC6D
	nN5OeDO1awxQPJVAC1/0VYn3nD8SDVnn+KzmwmA3o=
X-Received: by 2002:a17:90a:c887:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-38e3d26a744mr19412579a91.14.1784532134670;
        Mon, 20 Jul 2026 00:22:14 -0700 (PDT)
Received: from [10.0.0.29] ([2601:647:4000:5070::51d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5153318a91.1.2026.07.20.00.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:22:14 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v8 06/22] RISC-V: Add Smcntrpmf extension parsing
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Jiri Olsa <jolsa@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ian Rogers <irogers@google.com>, 
 Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Conor Dooley <conor@kernel.org>
In-Reply-To: <20260701-counter_delegation-v8-6-7909f863a645@meta.com>
References: <20260701-counter_delegation-v8-0-7909f863a645@meta.com>
 <20260701-counter_delegation-v8-6-7909f863a645@meta.com>
Date: Mon, 20 Jul 2026 00:21:59 -0700
Message-Id: <178453211935.543975.2748934407130948318.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784532124; l=570;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=qBhu2iKzjNZfNhl5iANbL2aUfkBruPYxRqMle5qLLTc=;
 b=uKypJmhCBRm/kvczWTSaeADe6ZnWZKogPAT9RNWB2cU/VzqTs+HjCiYkmIUntLvKjnWbFfrXo
 mWWz+WSV1MiBTMwThyOj4KDk1SApmC68RTUbDpPAJQUlRKKfVIsL4JI
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_002215_817877_34AE9808 
X-CRM114-Status: UNSURE (   9.25  )
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

On Wed, 01 Jul 2026 01:46:54 -0700, Atish Patra <atish.patra@linux.dev> wrote:
> Smcntrpmf extension allows M-mode to enable privilege mode filtering
> for cycle/instret counters. However, the cyclecfg/instretcfg CSRs are
> available in Ssccfg only if Smcntrpmf is present.
> 
> That's why, kernel needs to detect presence of Smcntrpmf extension and
> enable privilege mode filtering for cycle/instret counters.
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


