Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B76D1359C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 12:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9kc/MvcCGqsHKnuIn7RBxtKONFpaars6wfvKoTsFt0=; b=wxXHR9IlqvyrgO1eV23+4Jf6gZ
	pyqd0f9fkxyqTnLdoSnuvmqZM1+2CTWt73ao02VfHQmLEH6qxf/jaGysHFnDejrFZEFHVb8FsZPIA
	Qg5Vu0q02F1Tk6yBs8fX7YR7HgMoRa5qV82cQ2088KSdf8CwlRO51BKp0NM8epaDBMexSVnDYN5Qu
	mIRQSOvnh+iTKwuHLn/pMG+idxZmrBVp7qUTkNUuCD7ab/53A3rOA6FLexqIBOZ9VnLxu5v8Lf2CP
	AhtPZk0HuPje8jJVJ93M7AOJoBr9XwMiKsqIfgXKz03u9QBtGcUcV73nESg7+Yxb/ydLoIUQ1mbw+
	N2HvSXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5OeX-0000000Ahxp-0N5h;
	Mon, 28 Oct 2024 12:15:21 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Nex-0000000AX3Q-0ru4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 11:11:44 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-431695fa98bso41016495e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 04:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730113902; x=1730718702; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w9kc/MvcCGqsHKnuIn7RBxtKONFpaars6wfvKoTsFt0=;
        b=xkxl+V3E0M2JAHWO7lRSWZNQaJreJjVGLWNk8MS+ygt5fzliwI7HLuPz1XXZQNNsjs
         bnFcY92BpukINXtuTB74CtzXC6uY6r9kBHOcLAoNAFe4ZUvOXpYiEOGGEHxLjNV6fXBO
         NCK7hcz9YvgqXh6uqCSch2jXt/0IhXh/NYi65MWyQe1xWoE7XOt0EIIju4Q6J+WOglHK
         vy+lLjIe5UIHOFFxS15UcL5svlmznjk74eHtJF+6ik20OkjddetkqqWb6BPYDi657GtK
         HVjIHcRp9l8WbgMmecoh21fhsRxRvgXq7Rt+Ju2NDaYXIApNOl8OM9KqKjLOJvEEGxOp
         Y94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730113902; x=1730718702;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9kc/MvcCGqsHKnuIn7RBxtKONFpaars6wfvKoTsFt0=;
        b=occCQ5QOK/ymHbtbQDsFfLHIYNhish+HiOF7mfM8KfEv8nr7IRlCWJeZRd8pBUX7Xi
         rSMKdA9leIiLXDE2phAdSA1d9ciB6tzf5oSTMhaMpj/XJgPhViFEWt75d1W0rYKrXZqH
         c9HDut0SX11MlfJZN5DrOCLrTiNk3lseuHBBbNXjKeLePUaZe7T51Y39Q6TWuvSZFBTK
         qLwHYKhe0cGP+xj2uauA0Jkww6U2P6JPDK0+Q09oLh58yJgtbAkLjwbL/ETxxkDQRqOM
         cqotVKhqwpgGgDKKBzAZB+o7o6HtJAz1qsc2pU11Se8BdEhq7CGgB06wpwzGqE9qd8Nx
         Bmyw==
X-Forwarded-Encrypted: i=1; AJvYcCU8QV/jrSHfkmUzoteejr+eg9Lnyv8GVLId9f/DRMLplvSIt+eJsffiPS3Y8mFMKk+yEF1mvxxzdK0PbgZMEy4u@lists.infradead.org
X-Gm-Message-State: AOJu0YzzY+ga1yaKeX1Opkr4huaqWeJUFTyzRvII502muiExS+QiVK/n
	0UwxRI56wBV/W6OluAwBS8dHqAQX31euH1Ar4lZfWZSCwlmNQDB6r4Rk/xPmqzs=
X-Google-Smtp-Source: AGHT+IE+Z165sXrl550KdLAVYhJzn5VZwWhbSDKWVfm/qVBNZ5a2SDbV2JU/QTEhxtpAj9JuK3Plsg==
X-Received: by 2002:a05:600c:511c:b0:42c:a580:71cf with SMTP id 5b1f17b1804b1-4319ad24423mr63292375e9.30.1730113901661;
        Mon, 28 Oct 2024 04:11:41 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43193594fe7sm105537645e9.14.2024.10.28.04.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 04:11:41 -0700 (PDT)
Message-ID: <f87a0f0d-8501-438c-b05e-7e4554547c79@linaro.org>
Date: Mon, 28 Oct 2024 12:11:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clocksource: sp804: Make user selectable
To: Mark Brown <broonie@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ross Burton <ross.burton@arm.com>, Mark Rutland <mark.rutland@arm.com>
References: <20241001-arm64-vexpress-sp804-v3-1-0a2d3f7883e4@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20241001-arm64-vexpress-sp804-v3-1-0a2d3f7883e4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_041143_278383_B9EF40F8 
X-CRM114-Status: GOOD (  14.25  )
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

On 01/10/2024 13:23, Mark Brown wrote:
> The sp804 is currently only user selectable if COMPILE_TEST, this was
> done by commit dfc82faad725 ("clocksource/drivers/sp804: Add
> COMPILE_TEST to CONFIG_ARM_TIMER_SP804") in order to avoid it being
> spuriously offered on platforms that won't have the hardware since it's
> generally only seen on Arm based platforms.  This config is overly
> restrictive, while platforms that rely on the SP804 do select it in
> their Kconfig there are others such as the Arm fast models which have a
> SP804 available but currently unused by Linux.  Relax the dependency to
> allow it to be user selectable on arm and arm64 to avoid surprises and
> in case someone comes up with a use for extra timer hardware.
> 
> Fixes: dfc82faad725 ("clocksource/drivers/sp804: Add COMPILE_TEST to CONFIG_ARM_TIMER_SP804")
> Reported-by: Ross Burton <ross.burton@arm.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> Acked-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---

Applied, thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

