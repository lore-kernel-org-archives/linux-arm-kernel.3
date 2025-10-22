Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B368ACCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 05:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01+Fe0eWiJBF/0jGmWtSiJdY8eUSJHrRdRgDTl7S34E=; b=HxyyozDl9bLhCwehn+6CJQlZof
	e9HUb9OPaH1fl6/D0RVorH5W9P2L5rTbwHh1XMcwbqPEYpuJTI+ZHBZZ3kbloiUr5mmxyNRqcLTJg
	D5pZQt+fcucN0Mg67Mm+upJHszNiYB/AcOROUipo/k/wZ8z5gisd3p9RpcXvKTrMhVKggaQxpKyr7
	0RN77ELO46IYfB583ru6FN4RO6KwEkS7/r0NpIKw5wD8Iz9M2EthIoYJvR1bCx4eW0VzsIZSp3qtS
	rBfXjIZUHNKr5Q1kET6yEQ8zJObegoLUqC5fvh5fbGc7iWIY3+Gl/yENu7r5bXjNWcdH0UhK2ckX8
	PnG+yuXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBRsY-00000001bC6-0Ge3;
	Wed, 22 Oct 2025 05:59:22 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBRsU-00000001bBk-40Li
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 05:59:20 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b3c82276592so123685966b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 22:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761112757; x=1761717557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01+Fe0eWiJBF/0jGmWtSiJdY8eUSJHrRdRgDTl7S34E=;
        b=Yv9jqLQvRXacbEW+8/GECMqzy92MG/6M1A1wve1cn148oYxdZBjbaMEpcR6wy50W8O
         ULQ4s0d7pO2MZPz54BO6XN9zG1L4g0bJBDXoV5WzQHbxiwMGLGDc+cs2NgVR/kttr1RU
         NZvNx6Jom1CNOgIKZRagYuBuUBZUill3IeTh2wC/6QglSpzBg7xheDLRM86BOWO33MtQ
         C4N2VyYFVoQClO91ATU/ZhKq/m3tVnghhFCmcF8XGEmuMkfrY0tVN/p/sJhfoEmBvpAw
         TyuDAEXyWda0zuaA/eEg4ynTM7TNynQlFtsB4u8hKY4Z53oemnOWfWX/KpNFaoRB4AXP
         IW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761112757; x=1761717557;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=01+Fe0eWiJBF/0jGmWtSiJdY8eUSJHrRdRgDTl7S34E=;
        b=c/hAEcPJQsrpi05OWe7L/HrUxBZIABy/FK/NJGzAmFopfzr+jX7gdOm/XHs9O2A6l+
         lixnh8uR5XjFmFSXhLbh1cR44Epizc9QhyCXqy+7qXVVXL5XUDbcj2gnFUCCieT2jJWu
         PSmbhyMii/Qe1PsWP5fXLu1sPZMvxuRaVSgXMTgw093Itls4NzLbDrIvn6j6H1/Ny2Jt
         Veub/SgfB3KfVhLJgjCcTv34rj6iRPq8YhOfZEgTOoo7HO/ZOsQ3WrTAhusZ3Phqaszb
         ycR5OWJsr80hyNHqXUC5eRDxsVUvcBp1pgQxGJS9DgP1L+uaZ24IEKCN5ZHt0YO9H70O
         ccUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2OF8nzmcbihnrSk+HP683zSkXH6S9QlGLNEEOU8J8H3UT+cr9DpYx7Vh3Deaq43rD54tFpgGUFyFDUibLLkyv@lists.infradead.org
X-Gm-Message-State: AOJu0YzmaxkhUaUrr+Z95U6DINfJLNaTXeaw855g1w05Wkahc0X9PapH
	L2qpdNSnCt8V1CPZqFmmIArVG3v4nFez0R/Dq/LbfYxLJSgbhQf901YNPPRWtHeljp0=
X-Gm-Gg: ASbGncvMkrFrX5LHZ9bh5FxMPqvAD2yqnBm95plI9Y8BjeoCLUrKoowC6d2q5VGA/T9
	cPxlGLSy3ZobkrL6vWwCcMWtKhYLm9gSGdrREvfVwu11xbdznls4WGQT+p5/m+Nh/CdbizzBahD
	mxGXq5E9YQj+lXuYr4zvy0tYUFT2GKfrvTQdyjzOqdV1kmnx1jm18UF0HOPZnbQ7LPJrfZR/OLZ
	yZzTgOuaXg9JcTmHNcXLK0tlBTI2bRhbGjka6ZSIr6zj9BWvIhxuFaz3g0xuWJIznMemxhT2fSf
	HzHBXMbAuqJO20VBph4ChSDcV3tSrePDqFK9FhmsSiJvL11a0BWC/VtsjwtaTWcg31RPY7ZBrn1
	cfNvhUVj+4yigiYxZEDiIZ5BFoTtHsS7gu4CUZ/yfxlWcdicigmI2xO/OP1rm7YW2lb4QwJDXpx
	LK6TjaR21vjLkVlHiqnVSswipqfkE=
X-Google-Smtp-Source: AGHT+IG1W5Hfo15+e9j6LfyFkdiiBEUF4jK5x8ekTLpFWUxvmYf1mD24olvCsGRfz8UWl/h5IepeGg==
X-Received: by 2002:a17:907:3e08:b0:b46:b8a9:ea6 with SMTP id a640c23a62f3a-b6475a06d9bmr1365635266b.9.1761112756660;
        Tue, 21 Oct 2025 22:59:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da33d1sm1251417966b.7.2025.10.21.22.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 22:59:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, peter.griffin@linaro.org, 
 andre.draszik@linaro.org, willmcvicker@google.com, kernel-team@android.com, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20251021-fix-acpm-clk-build-test-v1-1-236a3d6db7f5@linaro.org>
References: <20251021-fix-acpm-clk-build-test-v1-1-236a3d6db7f5@linaro.org>
Subject: Re: [PATCH] firmware: exynos-acpm: add empty method to allow
 compile test
Message-Id: <176111275526.8693.8621837502734274047.b4-ty@linaro.org>
Date: Wed, 22 Oct 2025 07:59:15 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_225919_034695_7BDC9637 
X-CRM114-Status: UNSURE (   8.57  )
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


On Tue, 21 Oct 2025 15:24:47 +0000, Tudor Ambarus wrote:
> Provide empty method for devm_acpm_get_by_node() if we aren't
> building in the CONFIG_EXYNOS_ACPM_PROTOCOL. This allows to
> test-build the CONFIG_EXYNOS_ACPM_CLK code.
> 
> 

Applied, thanks!

[1/1] firmware: exynos-acpm: add empty method to allow compile test
      https://git.kernel.org/krzk/linux/c/6837c006d4e72d6add451411bcf407e0dea4ad25

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


