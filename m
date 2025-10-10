Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13FCCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 02:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Poc8CSat8DKSOJybm3/cRmwyiOaA5NMqn/oRePUZbI4=; b=o3O5TNm0bhyAFh8INS91MOJCEa
	N9RYwrvZCRRrY20wDebrX9+BPdPN9FNNG/0UJ0nu7+VGKhrVVErEPLlzTCiZvzgJ9DANu3Ya9jCv2
	Hpi5wwN1+z5VnQh5Tn/E7p72ZzmtqtXQ3hXHnbzPnQckVbZPjbeHnyNZ+suGQGNy1MkV8BZFFem9x
	pE1A+/SwLwtPTzWMj2I5dGHgi7rjHOnjYWZg5T2dcc3bgL+DJxjc0twH1f2jtqrkg1Edz7hVX5WL4
	p50Gok8g5u+vKT/x+rngIJBA7E/BvTGFGkAa26n7TgrNdsFzkwS49SyGJkCBFIEzaDChuNuFB2GSd
	cY+LlPKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v72m4-00000007Uf1-25xs;
	Fri, 10 Oct 2025 02:22:28 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v72m1-00000007Uee-0dKh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 02:22:26 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2698d47e776so11968395ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 19:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760062944; x=1760667744; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Poc8CSat8DKSOJybm3/cRmwyiOaA5NMqn/oRePUZbI4=;
        b=icXOklUR02iz3rvLXbqiiKBjNctpTHgtfBQih5AjUArl8l6HLrsZUw2RHGtd464++Y
         3Ve7Mz4xgIiAmztOFJn9U3z2YfTmAwQCXB+sriKAHgQHhu2HPc9P0qfRyfHHV0wo1VzR
         0mIq5NAN+9I1/qt930f7Gk5m1/dvwlOVWzXqD+rcvmyZWXVgjcYAx5Oadifok+vWyGfW
         01PFiYyovxf4roXGcI2iA1uWDHQDXV2O9RHUa5fyhCxIQKoC0zlrTwTJ+5I7OAKfG7hg
         WBmdc9NIr7TxpyGUWIXnNwmY2CHFP7EEA/vyQxGzeYjNcs3kF7ld+5gDgIE/QXTgq9UV
         gBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760062944; x=1760667744;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Poc8CSat8DKSOJybm3/cRmwyiOaA5NMqn/oRePUZbI4=;
        b=ajcKPy57TjcbDskefxntXnZ4mSBIciD4sYFrheIcLS4veJ6Gp96tjprxCnMcsjZcrr
         0+XiuZeDfyIFpZqIdggdFh9i74b++yGuid5dIPnIm3S9joJsjTwiCeJcEiGnEw/lnOzv
         AdmaGqx97o2/LnEwlzGoExh1K6ChDpqBKIA0tdZD1KgOjdnpwPCDLJ+ZFcmtC7gh5zF2
         LfD10ZFdA+fJuvFlAjL2rupdNQaKJGC6zh4FCZ0FDFyWUjeecjOCcKKahFNex/hEVPLO
         rfATycJ3iT9RklGlbXlt4jYerMiyTLL1s7gA5RfPAI2mq5+FkpMkzvLdGs44KM+GWP+j
         SwjA==
X-Forwarded-Encrypted: i=1; AJvYcCUanD0YLAoDJRUPAOkeDz1WZhFj2svRPznd9AxS7om0gxsBfB9wem7vUeceKlOwDVIIV3r9SopWOrb3O83bG5iT@lists.infradead.org
X-Gm-Message-State: AOJu0YxW1PuV0GemWlH5LXZ7VpKQk+YuvCCNaZvCSQ7afPCaGd6MZ2SX
	AIWUHAYNUcCunatzKe+21YismZzlGNzsSQzOpUhXkJxGCVi9vHuFE7lr
X-Gm-Gg: ASbGncs6PQwBBOeOffxrnlRcZ26EX8WqkOolO3JO4lX5868lzQYbw4qQhBY4XQHYFPz
	MjttFNP8wIjYMQ4I520hj/hpG3xxoDuizmTtBCgkIKfE8KOXmefLnAY5+tnx04NbF0borqW5zcx
	qaU+ebQHIkYJADMobX1jJk92M7R3jUmRBLOfTf5eL+hO9WSp5e9h1vwpQOhdJMTkxVr/ZHu7lAS
	IiSpPAQRAI2HqoeTscntltnsCk1SswfrVXjZFBZsmnCEr52lchO2smH9wB2vi2RDey0VupjF6r+
	XWwiHOievkrGDJA0udnZ9xkMl67Sa1R/RG1biFeR8Ul1hAoBGwJes88g4Y3Grck3oWIwjPy+OVD
	HNqMXIPyB3Omv67QjMoLWdgObWAviEHw9hl9Z0YRbDWPEzjxB086ejSnQ3mZVRJM/mQwm
X-Google-Smtp-Source: AGHT+IG+Pf+n9YF9gI8OUfcmQ9dndEj32A/PkFqo3oluXmEOwiiZZVb7VASeukYYSqQxTR1LizxeTg==
X-Received: by 2002:a17:902:cec2:b0:25c:2a4c:1ca3 with SMTP id d9443c01a7336-290273448c7mr124825125ad.30.1760062943936;
        Thu, 09 Oct 2025 19:22:23 -0700 (PDT)
Received: from [192.168.1.110] ([59.188.211.98])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e18557sm41839285ad.39.2025.10.09.19.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 19:22:23 -0700 (PDT)
Message-ID: <28f4950a-e3eb-4a54-b867-67bd269b8407@gmail.com>
Date: Fri, 10 Oct 2025 10:22:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH AUTOSEL 6.17-6.12] soc: apple: mailbox: Add Apple A11 and
 T2 mailbox support
To: Sasha Levin <sashal@kernel.org>, patches@lists.linux.dev,
 stable@vger.kernel.org
Cc: Sven Peter <sven@kernel.org>, j@jannau.net, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20251009155752.773732-1-sashal@kernel.org>
 <20251009155752.773732-9-sashal@kernel.org>
Content-Language: en-US
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20251009155752.773732-9-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_192225_187178_AA30E75B 
X-CRM114-Status: GOOD (  12.61  )
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


Sasha Levin 於 2025/10/9 晚上11:54 寫道:
> From: Nick Chan <towinchenmi@gmail.com>
>
> [ Upstream commit fee2e558b4884df08fad8dd0e5e12466dce89996 ]
>
> Add ASC mailbox support for Apple A11 and T2 SoCs, which is used for
> coprocessors in the system.
>
> Reviewed-by: Sven Peter <sven@kernel.org>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> Link: https://lore.kernel.org/r/20250821-t8015-nvme-v3-2-14a4178adf68@gmail.com
> Signed-off-by: Sven Peter <sven@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>
> LLM Generated explanations, may be completely bogus:
>
> ## Backport Analysis: Apple A11 and T2 Mailbox Support
>
> **ANSWER: YES**
>
> This commit should be backported to stable kernel trees (and has already
> been backported as commit 37b630a26d235).
>
> ---
This patch adds support for new hardware which is not just a device ID
addition. None of the hardware that depends on this mailbox is supported
in stable either. Please drop.

Best,
Nick Chan


