Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47042C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 07:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joF+0WiRGSv8mD3xiwNWcKl93ysFdtXjIPy5dUf3uGo=; b=CTuVEdepYnHAYAcKcIbliqeRn1
	NIAJ5tnNYPTGO6NeC2y2kA77NJXW1rJIAsxDJz8BHdF2go74sZtBXCnhEA0H0m7RfU4Fh1aSIWqdF
	/xGkH6TWSj+oB1m82ptuuHu879uMUHKddjNIzaRe4hAQoapOkW26ip0nmFNmf0BWDfH77uDRZt012
	oB4TOFLdCjGHzoj8/mSHjsHBI7jgtauSYa0PU5JFmS0NlE92Xgl9mENcNXAdjglgnNebBc4RNUHb+
	Ijh9yGpL9GliazypxILkDKmKkhwhs2ra7aMk41LzWXBEoYhM5CwLlVaMQ9dBFJ51UBw2js2AqrPBS
	dVOdDJ4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTy6s-00000004sHi-0zBQ;
	Tue, 24 Jun 2025 07:30:26 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxtl-00000004qkF-0QSo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 07:16:54 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-addcea380eeso820448666b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 00:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1750749411; x=1751354211; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=joF+0WiRGSv8mD3xiwNWcKl93ysFdtXjIPy5dUf3uGo=;
        b=YPsH3Qkc+i7AsCXkiill4cpKkhJYlrysgATbsQ5xw3gAAfEyvG00QwCxCug8n/anQr
         0wlDUUP3kZ5HxeuBxcM8bGgJY2rUrxp0qnVnlk8o/1nUqmddMNRscz8/Of0u3a+jyKf8
         j0hy+z5OSuVTOKs2SIHfpMBd9X0SFxltbl2BnUuIauXM534VWKGZd4sT/mu9r9oUpdD7
         Jv2aVX5ZZ3I4VtM8PUt0vMhCZwXL1bK/Sb4xdxXCOQsapGovUVkkTK9W54ffXz9PwsMg
         DYNn6DqNMSrrzNqfnqrYajShBLLXCW/Baa5al1fNj09wC6nlSZKEL2wAnqd7vY4z0suV
         Oigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750749411; x=1751354211;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=joF+0WiRGSv8mD3xiwNWcKl93ysFdtXjIPy5dUf3uGo=;
        b=xA5wl6VtaVYjwHW8pl2bTkodnWg9cHesIy5B2i64b6KgRxXeiwZs3uUzUyBLnhaQqb
         jFkIavqOlfEaxr2zGswuwVXUVHhyVAmOTZGi/rKDpxxp+Hpt7OyKg/Xi3S53wiVMefXd
         C52AVwPRuJeyyhclISb198JJK6NFwIaL6Gm9xuRis/2z6n5jFzTBfXUo0uojnW+yfe34
         WiVsgXnKfLMaU5DAAiNzeznOxOBOjfegjOAI/LJYFGk35B+bJu7q9gV3TKqfzRRD/l6u
         I/6xXAcs1M6RFE7+oF4a3AyO1GFMGGQqNDd+qJgRwflU1oAtzBZVO2UQ8L1tKQE95YUi
         tV8Q==
X-Gm-Message-State: AOJu0Yxoq/ZpoLuYw7eITzYkC9fRBPZIZqkQZG/TruSwrXIK4lD0f4sM
	hObim9XukFK+9PpYigVosmOE+XHN8FRLuTluhHE5V/TACxrwCtbofvmqmUsCGIiJUVo=
X-Gm-Gg: ASbGncup8BlKUhOkyLphDxXS483Mkk93qKATjcDPm2DTsQzgXNdLcnYIzyopoXzd8ws
	4S72lXje52g1GRZeLoQznKWexQbGWM1RuYOSE1Yfp6jRHNDBlJ7owHVWUWXOVTqQ0Wj1RJKYzD/
	df88EJqF/irYk9JeZU2npZ6paj7mTWbgej4aJn3FUJbxtWu08LKAslbZL9VawGINu4aepdw2nr1
	bC5mD1JkT2Af4J23zz95aT7d+ibll8Y2fXL60IXYZ4HPLNigW2K5Ujh8B0k38yzkqd5O0+S/cc5
	ZitL7eqH3KFGvGlzehKrnP49W73cNwo8RLGgHSXqpkpYvZuB6ZInRNiumqhqyo3Rj5NfnSg=
X-Google-Smtp-Source: AGHT+IFYy07DY4uYK3QcH3rBfvmrjpR9k+VjFUPDKirwuNclyiAeOOuHFAt+a/TuiN+ccTbZcewo+g==
X-Received: by 2002:a17:907:72c1:b0:ade:2e4b:50d1 with SMTP id a640c23a62f3a-ae057f01cc3mr1588454366b.29.1750749411421;
        Tue, 24 Jun 2025 00:16:51 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4e32sm838522166b.57.2025.06.24.00.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 00:16:50 -0700 (PDT)
Message-ID: <0175195b-ee78-427a-afae-0636a24fe9ef@tuxon.dev>
Date: Tue, 24 Jun 2025 10:16:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ARM: configs: sama5_defconfig: Select
 CONFIG_WILC1000_SDIO
To: Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, nicolas.ferre@microchip.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
References: <20250617140502.1042812-1-festevam@gmail.com>
 <20250617140502.1042812-2-festevam@gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250617140502.1042812-2-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_001653_142293_FABB98ED 
X-CRM114-Status: UNSURE (   6.73  )
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



On 17.06.2025 17:05, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The at91-sama5d27_wlsom1 SoM has a WILC3000 Wifi chip populated, so select
> the CONFIG_WILC1000_SDIO by default.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
Applied to at91-defconfig, thanks!

