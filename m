Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D09C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 19:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fgIFZoxkbW0KwVO6zN97CfpiFd7piOBwwsm3LQac8GU=; b=2Vu3WhPQcUkCfsNu8J1UX7rr7Z
	nRwkculq26EX/dDhsXPwswiMQmBRP1jSbwo2wpKz2NfaZMLkWbUJD9QasEeQc4vWNf5VobV+wUBGq
	uNK14dEywTAZp+Qm0SX/YMaeI5UY7+P5O4hkcXlKpF3D4MiQBHmtqmkqEUcAjPtNSTz1PTwa1k7HK
	89Fes11CdbjRj+AKT7lx4tEEUayP4uZ/1HJ7+gb4Buz/McM1U+YJeQvQ8YNKxdmveT3jsmC4SOcbA
	Wzy3Gyu1haVZj1ksA1QR1KbXKOwOTOmPHjVcW593HcHdn3Bc0Nf2B+sBsfowb4XY3dmPJEDNKCrcp
	EGoqwj+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpufn-000000096kr-3MSL;
	Wed, 05 Mar 2025 19:44:55 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpu7g-000000091zM-48ix
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 19:09:42 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4394944f161so8754315e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 11:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741201779; x=1741806579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgIFZoxkbW0KwVO6zN97CfpiFd7piOBwwsm3LQac8GU=;
        b=Svh7tjVo22oWuJ8ZhO0E5MeCz0nq0tuyrxAUCDu4PmjV88TchpTF++iYzZBX/OPOC9
         B9wld5oqVp6RAfdBGUguRgv5RgstOA32rmKWpRuG3esIkzN64cFz71ED7+EuR7W0iYTK
         dzATdyLYDsT4zJhaWe7LD6u0x1vSyAsvgxaJHKSaufFzHVTyQlvSEbMPXdpXqdWmr+Ml
         NbiJulN6ZDOyRnW6pCpqAI/jrmA5Oj3/5vn3xGZ1M1HUZYt7gcMZQ4kpgJLcDFlvSN38
         cUkA9K85np0zrGLzMqWw/DrDEwIV2uHPurKfd1aWf3J48dBxzJO2qylekkBPriUP8I6y
         9mNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201779; x=1741806579;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fgIFZoxkbW0KwVO6zN97CfpiFd7piOBwwsm3LQac8GU=;
        b=FfQFuMLhkyDeJAj8XdrfiFFxuX8jt1WO5s6t21VWTl1TmMqixTL/i5aQhCU1a6cw7X
         I5mqwRwckp+3uLIv3yJOvLbHl0lc4ST2dvfkOwAC2bZlZUZgolkn4Lpqx+YALPBJh8CP
         4JWO4VBQY2z9o7thWfvcCxUcSib1LNd8bOvCLZDxiFkde1rQfOT44e0GghffTML91Iny
         Ry0P3dLufQs3hC6tasFbMuM2xDg8U87rf/+LBY4Qd4WwfUgUinlXxXKABM2PLFU2ipAJ
         OY7ixxf02B8twCUC88aM9WXD84jcqrVZMw5NQTyfaT/IE3DQi9I8Mx9YpFnF3ULqRRX9
         tGXQ==
X-Gm-Message-State: AOJu0Yw+5Yti6K9rrGRNO6b+biePu7cZLspQJSu+waqt6dD6zQ8wKvOK
	qgEEzgs3NbOYsxg+5BFpMPHaQi3Tig8AiTt4xSKZDphPwLxcGL6Hi2tehrcSZW0=
X-Gm-Gg: ASbGncuOyaz6CYLwqS0X69QuLU7XeKAHkdo6itcOjq0X/uYtLIyHbpirXz1ZmlJVOme
	R1Mr8rRWtc+eXuTv7Wpof6ltSoSMu12ou/e69AjXpYH1oH8WFjZ8NLJ0HY8UIMkD5eYNSYN1upY
	ewA851ewd0HEUB0sLk21itwE7GwnxJ9GZzj6MQaWGd67lSipA36toc9AqBp+xkYhRvZXJXxHeMK
	VYkOz2fcyknvgq2rftxFPEMbcL8p0PgbfIwcPEdgrR0hsW5brcfWaYokPo8Uycdf+/9liOCCeo8
	Trl5c4mUUv9fyS91MwvlZTBT/koYWM+WD14becVZFmW/xXQlUebAC0QLbmG7
X-Google-Smtp-Source: AGHT+IFrSoo3gOE5FHktH87GAqLOOH8zzQprfwlqJYQydb/cjo2MTzmjtJwGHriaXSDaH9mOaM27Tg==
X-Received: by 2002:a05:600c:4750:b0:439:9b3f:2dd9 with SMTP id 5b1f17b1804b1-43bd29d8578mr15177295e9.7.1741201779287;
        Wed, 05 Mar 2025 11:09:39 -0800 (PST)
Received: from [127.0.1.1] ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd4352eb1sm25628705e9.31.2025.03.05.11.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:09:38 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
In-Reply-To: <20250303-clk-suspend-fix-v1-1-c2edaf66260f@linaro.org>
References: <20250303-clk-suspend-fix-v1-1-c2edaf66260f@linaro.org>
Subject: Re: [PATCH] clk: samsung: gs101: fix synchronous external abort in
 samsung_clk_save()
Message-Id: <174120177454.75135.6216013717633178470.b4-ty@linaro.org>
Date: Wed, 05 Mar 2025 20:09:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_110941_030674_DF63B20C 
X-CRM114-Status: UNSURE (   7.61  )
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


On Mon, 03 Mar 2025 13:11:21 +0000, Peter Griffin wrote:
> EARLY_WAKEUP_SW_TRIG_*_SET and EARLY_WAKEUP_SW_TRIG_*_CLEAR
> registers are only writeable. Attempting to read these registers
> during samsung_clk_save() causes a synchronous external abort.
> 
> Remove these 8 registers from cmu_top_clk_regs[] array so that
> system suspend gets further.
> 
> [...]

Applied, thanks!

[1/1] clk: samsung: gs101: fix synchronous external abort in samsung_clk_save()
      https://git.kernel.org/krzk/linux/c/f2052a4a62465c0037aef7ea7426bffdb3531e41

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


