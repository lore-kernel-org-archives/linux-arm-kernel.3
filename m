Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273E6C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 22:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XphRFYGKTpOm5xqnRvI7xsnYVXmfTKHiTieuuJNNgkI=; b=1Snj/xolloFMglOI3Nxz14Z9Qj
	SIJ4w3RHgPUc4FQJDqWaBnMYFnHByvAu3M3ATMmQZ52L7aUNfdcwFh1CPCx2Vkh5uQVp6aqTB1HWS
	sEOOLPZtB63liILMEIX2CteAvdm4Y56s0TQCsin7Kgryf3CbVVqn4lqcrAIbcfiSD+C8r14OhYTft
	fUT5Pm237jahEETHWMl35jMTN+pF5p3xsLWegnF8zGkWKfzAkZZBBoyhxHdEcOsilknQowF3rlgQK
	tRtZspVmLiEC5He59IYi+cIPcOLoF1qsDfCENspDjxi0lmmQKo9d3imJi76a4AlZmEogc7+y+haiD
	i53CRNIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueL72-00000003ZiQ-47Ms;
	Tue, 22 Jul 2025 22:05:28 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueL06-00000003YNI-218c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 21:58:19 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5f438523d6fso2198a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Jul 2025 14:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753221497; x=1753826297; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XphRFYGKTpOm5xqnRvI7xsnYVXmfTKHiTieuuJNNgkI=;
        b=X057FCX7sT2ogdwDMIFR6BEFDflxaWSlv8KwbQ88nrzylTKUHCwEBZsN7kaALs2KUc
         ej5cJDyNgnQEJa98I+/T2h1xizwE2H9yOnh2dnEFOdkeXJo+KTVj03Zh8F/NFm+9Tey4
         FG0aBAz7Bz4gcgXZinz0Ge+XR1+JGkEf1izss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753221497; x=1753826297;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XphRFYGKTpOm5xqnRvI7xsnYVXmfTKHiTieuuJNNgkI=;
        b=ApLWcf5ESnfUihKRu9mwF+qxHK3Yx9B5EluiKw0xubtUHF0HWfAiZdyRV4tZKPsVLi
         4N1tebTilog/sZdXyOzvAwfs3xnWiDIosEyTuOkbbNMnM19BOeetC0HCgCZzbA5thSyE
         31iE8Un4E4G0v3N7M8GsR1kZhdQnnNSTYWId6BNtbLijFDTKYqRWOtTBAyuZbxk6t3TQ
         NywAdeDiM+fMPjj9CrAxO+IzZyeNS/fMFZ/Ve9ZueoI172SjNvwNP8D1vpHqiel4QX/+
         wMZGAY6KpvdjjzIFgEHGXUkY0YgCfPQCy3oudV3d1N4gp3xY7Ch4tc+h5pwMA7EIxCmL
         T8xQ==
X-Forwarded-Encrypted: i=1; AJvYcCWShJ56TQ9VlKBRaTFn3EHV3+fupVJuMNH5AY8F7P6MO8n1veWGO08n3S1u43sLLJz6Z5bQGmQ4QfDCFqFroaj5@lists.infradead.org
X-Gm-Message-State: AOJu0YyDZSd0cqgooIRjVXTrwcZezA7PgFzzHSk4IHGetDNNLAN8YTG6
	yIe7CtOGV13y4kWG4crahT95FzElJtLyl7oYph9HylULWPEd5ckySOFdVfmD6HHjYeunJYwBp8N
	OxDAZU0NuUxkhVbWkVdeJwNLmdQ4/9dPWcZypyiVh
X-Gm-Gg: ASbGncslBAAQQ+xWSbfRAKhsSHPakBB/QOAjVrBeCbNp8cqCbEGN2LvGM8NNbVq3ucS
	euWe6icXja+JHaaZwm1JJCjXnypGhfoEJvr/yEGCoRAPYJtUqxg22BIsJMbiUqtCDW2Bm6/ceDN
	RogX4ZwVjAWNyzfSNG4046LRdRPvmHTvl9XsgA4vEwqQHXBsc2Ab7n3pOn1w1sNDFOJ4WKRzw45
	PVo2uZdnJmpALw7kTnFNSHQD/USPiySmfbIQLNoDz13
X-Google-Smtp-Source: AGHT+IFp5y+l1fTW8GtjpxnnyEe4EWyuH/zYE3JF5LoJQi9huRUvCNpCO/HKD9InP/jd87P+NKE1aVh/xMR3qwPcil0=
X-Received: by 2002:a50:cd11:0:b0:612:7599:65c7 with SMTP id
 4fb4d7f45d1cf-6149ac2e0b6mr29581a12.6.1753221496595; Tue, 22 Jul 2025
 14:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com> <20250722-ddrperfm-upstream-v3-7-7b7a4f3dc8a0@foss.st.com>
In-Reply-To: <20250722-ddrperfm-upstream-v3-7-7b7a4f3dc8a0@foss.st.com>
From: Julius Werner <jwerner@chromium.org>
Date: Tue, 22 Jul 2025 14:58:03 -0700
X-Gm-Features: Ac12FXx4M-_tpsnv6SoYOcaCR3mVKSUiARmyCSX04o5wxXNHMo0oAxmxSQQ0MIM
Message-ID: <CAODwPW-kVcnVtVakXs7aBcwb_nv0bLTaK5PKNo4zmJaJ=VC8Wg@mail.gmail.com>
Subject: Re: [PATCH v3 07/19] dt-bindings: memory: factorise LPDDR channel
 binding into memory channel
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Gatien Chevallier <gatien.chevallier@foss.st.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Le Goffic <legoffic.clement@gmail.com>, 
	Julius Werner <jwerner@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_145818_517677_B80D35BC 
X-CRM114-Status: GOOD (  13.48  )
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

> +  purpose of this node is to overall memory topology of the system, including the

nit: Might take the opportunity to fix the typo here (missing words:
"is to describe the overall memory topology").

>    - Julius Werner <jwerner@chromium.org>

Why remove me? (Although I'm also not really sure why I'm maintainer
for this file and Krzysztof for all the others, tbh.)

>  examples:
>    - |

I think that's a load-bearing pipe character you're removing here?

> -    lpddr-channel0 {
> +    memory-channel0 {

Just to double-check, the name of this node doesn't really mean
anything and isn't directly interpreted by the kernel, right? I'm fine
with changing the example here to fit better with the new expanded
scope of the schema, but we have existing firmware that generates
nodes with the `lpddr-channel0` name, I want to make sure that it
won't break from making changes here.

