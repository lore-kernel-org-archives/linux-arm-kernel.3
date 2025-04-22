Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594E6C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 09:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tm6ce7FCfnEHxhlUwpit5ul9aj6xgc9Jgba3jLGI3iA=; b=FeE0RZ5Oo0QUFZ2gcyxCU77yi6
	uNhu0mN2TI3ie72KxvtVM2Pi655d2Loa8q4zaDXcfv9LUtH6plNOe3I608nH82wDi/G0MV3vRMB2R
	XoIHM+oJ4lh3UUzSCZRySmdmYsjQu2lGoXbQMvtemYUv37zGYah008V50kkH9r2UXNER4VUNoLuzD
	lNgLIlkr/q9MYXBnjejlq1goWk3vCCLMGFGoF1pdQGVAThhIXQ4+PeCxS1Wz2iQVKb16ZOKyQKklx
	L2K1PaNqXJDQ4ARttxPgcbEwwOHgo4lAdziYYgPLD50+hfzmsmuhETtKv8t8CZ3DcYTP+eeX/IzVv
	hqX0OlaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u79vw-00000006Yrn-1IeN;
	Tue, 22 Apr 2025 09:28:52 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u78as-00000006Dyn-4Agi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 08:03:04 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e61a18c05aso713093a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 01:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745308981; x=1745913781; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tm6ce7FCfnEHxhlUwpit5ul9aj6xgc9Jgba3jLGI3iA=;
        b=ZvROoOb1imrrW0wwU/JzBJgDt/O3FSzBFjyQ9e81Z6A80c9MIaWhUqPpzeo+LwJgLX
         O6aZ+O/4d2BL065JJDuK2DowbuH7x2dJkOGF9iIHxPKka0THufiVKTc1Unalc4ZVVplI
         RiObIZ7OJRIIABSgYD9ICVfMQ2tEsgRMWehgQoAv6XOfxafWcdU0QyOvh3Gy/+35SGIC
         V5LpR1WGObJl5g8goghxMQhkXpw1ZMjDt7sFocgdkJ/WU2NolcQU19+pQvXFdkY9zLTq
         05q7l+tOhA6TLfqLBB6weRL1TSIzF4pmnU9VTrlkdQbHodrus4EtR0inwWh+hALA43/B
         FIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745308981; x=1745913781;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tm6ce7FCfnEHxhlUwpit5ul9aj6xgc9Jgba3jLGI3iA=;
        b=Lxlx9TDgX2s21l05PbnlXbnjMQhCWUjXYWp8miUuiWrvfBIa/pp7xXnctcX4qL64jG
         1vsmxac2I/w9RS30pPwHWUH27g2R/ZgDqxsENwLwdyt17QPZDoAOwOlX+/tJaDeqTj7f
         b5ZAEhDPIY8EcVbf/QxwXDWCyKB1ShaXEVLwObolS/tPKfVgRag6BacegbgWKmxuXsHS
         AklyBlgnNE8FitqYFzl2z/tXJA2Ja8AUlle3ygf+BXoarM2a3OHBKoYjIfiRnRzVuz+C
         ZhqWfFSvk+5+J+rZ9VpgqQIjgP2kyqzSuwHoQOYEn7HYjGypfZy5FfHs0hQL7jCbNJ5o
         QY9g==
X-Forwarded-Encrypted: i=1; AJvYcCUMEntSmmU8k19h2dOyxoDFVXGVdAIZX4QXhM3zJB1vfNN9a/eZnitAjkAE6hJHSeX61q6/5SBDdmL96HUf8lKD@lists.infradead.org
X-Gm-Message-State: AOJu0YxqqMwqc8/hJoRRlJ70Tjf7jyhhUJYJyBXMguNgR231LFG0Hvoo
	fXwSxgRF4+Ovogy8MtAwFHoP/LsI6nf6cB0XJS40YFYrHPOXwE3+sIeSXH7ySvw=
X-Gm-Gg: ASbGncuN9oa6TKkYUUhMD3bF7j7IldboTosZIoq9k4LAlluQ5knVUNOP79EKu5VlRyI
	MeZL8+kjd7JjKl3CkS9DhzrpGXsMbUruWbWAIf/FL5g25lxNOGBa5ELO3/6nX5z7MbEzPdD5Hdk
	MlOn4sH2J7x00SaaBT0/yB6ALD2LFcYIlcbPsDYeP+UzMqdtYUnlarF0tpibZiDSwCBVIA13onF
	UHzCeSnl1Psap2zStmnVePn+UwUKY5lCOyE3d2SqHxWxlq/6eaK/tWPHVJQetOqbTCL8Mk7Gbuf
	00OrMrC5svVipT4RfigkJkuoNrs8uqsBul1opCBwASYKOdUlp6aswskyH2Q=
X-Google-Smtp-Source: AGHT+IEj9zYGHMUVy+ByRdrUePKsN+UNEN7rQuSwVrU8g1hXbVY98bZH5MP1B4l378YIYlw97Pfaow==
X-Received: by 2002:a05:6402:524d:b0:5e0:36fa:ac1e with SMTP id 4fb4d7f45d1cf-5f6285e560cmr4530395a12.6.1745308981069;
        Tue, 22 Apr 2025 01:03:01 -0700 (PDT)
Received: from [192.168.70.232] ([88.154.3.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f625593409sm5532352a12.37.2025.04.22.01.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 01:03:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org>
References: <20250319-acpm-fixes-v2-0-ac2c1bcf322b@linaro.org>
Subject: Re: [PATCH v2 0/2] firmware: exynos-acpm: read fix & reduce log
 verbosity
Message-Id: <174530897813.9276.2456248075934997064.b4-ty@linaro.org>
Date: Tue, 22 Apr 2025 10:02:58 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_010303_030615_789FE7EF 
X-CRM114-Status: UNSURE (   9.47  )
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


On Wed, 19 Mar 2025 05:38:22 +0000, André Draszik wrote:
> While trying to use the ACPM driver, I stubmbled across two issues:
> 
>     * acpm_pmic_bulk_read() doesn't return the correct register values
>     * superfluous log messages during boot
> 
> The patches attached are the result and hopefully self-explanatory.
> 
> [...]

Applied, thanks!

[1/2] firmware: exynos-acpm: fix reading longer results
      https://git.kernel.org/krzk/linux/c/67af3cd813695fd3e6432b0849c453250c4685aa
[2/2] firmware: exynos-acpm: silence EPROBE_DEFER error on boot
      https://git.kernel.org/krzk/linux/c/53734383a73888e6d765aa07f4523802fdf1ee10

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


