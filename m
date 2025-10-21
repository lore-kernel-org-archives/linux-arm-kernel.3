Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B6FCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 19:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5/SqlA3X/ZkVhbqceO5ccBn+9e7HcyK50UX+eusqGE=; b=GCjGm67x+95RdQX4SnhnbzCFQP
	Lsm4u8O1gALj3ZOk99yTVE+Q6YfcHShXBqNKtoIYvtJjAeby5+NQhwsqzmJV50Nws7mEqK6KL4otx
	PwbbrkUwxogsPsocN+dEecY+j3npBtCXIYIq5zUuT8VoW4kngBKQmqZHSGfJNtzlhKKFiGxhY/5rk
	rEddiZtwg7GSAVN+Bv10vIbeVLXGwa7lEbV+CH+emfpVoHaazBI2S5xTGGWzVtiesVVZPFtMjfkrf
	v+JYclkfxYQhGSn7EbEorkn4AXr4jzbZWgHkFkRPIInXn+cLmIHgC0Z7Ue1MJu/bX5fGu/yoWvKn2
	+ef2mHng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI0z-00000000TvA-0E60;
	Tue, 21 Oct 2025 19:27:25 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBI0m-00000000Trw-00br
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 19:27:13 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-427087ee59cso636927f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 12:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761074830; x=1761679630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5/SqlA3X/ZkVhbqceO5ccBn+9e7HcyK50UX+eusqGE=;
        b=NFV7odLrbmjJHJySKsD7lcFA3q4f0xBHXDijPTC982Ujq3VTZm5d1kEDRwJ/GWJvRY
         xdiWZUuPeuMl7bBiDtC9fPpdqobcqSEEpWbXoGDVNEhIc+obedDeBpdsNTMm8tPCwaFA
         12zBaRIEOWxuNHhWfDlbbfQbCy9xPYJVIpmnHNMTTifiJdukNG9bzQOY9YsfxRAELhsO
         WkZAi8OYOkM9wyQ7+4ww2vAWI0RO3sHWgv5sVLMn2v2g4MhjZrKh9R30IwYObhJlqKsp
         PZl2TMhqnbYs0uIlPja0P5oKXd3CSYEVge43a8whGFTqz4reGR0gXWf9xua72+RRJaxf
         2SHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761074830; x=1761679630;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5/SqlA3X/ZkVhbqceO5ccBn+9e7HcyK50UX+eusqGE=;
        b=IIGsovHGAAzjUhYd4vYoGgb/1J5966k8oK3gNqZ8PiYlz66h9Mp9cxlyCoizIuT3jU
         FDVhWD4YwlHrbaquHpf1lPfBOlRfAA4geAKstxfeKJc9Ymfqil1mZBymJOOpNbM1askT
         nCk+9FSbLtQX960z0eaYcGG+7mioS4MvRRk7rrixxu1+CmFX9cUUCs5TZhtq9C8D/bE8
         LZGuPhacER11G+2zYglvAxQpYI10mUlInqubmSdYgxNtXvvHC+ZPzaIGYrtRboYVwwwN
         1ogTfG+6+5I7qjNl4YZQydrjEAV8fqYiQ2UcVkJ20M/GB0rVkEVrOa3WS0PkFgytHn6v
         qv3g==
X-Forwarded-Encrypted: i=1; AJvYcCWfPzxGalSDm6aY2MNNi04LyBw8e4eLokdKmQX6PXMoezFXQWp2x88wwvYa0r0fgGq/kTrj25TUs07QG0UX0K9t@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0pyUcKiM07uRrJjl5MGreHZuhuKaUdblhLk5uo97PJmVxoL/l
	hOYruhbYSYnNmQ7RVz1s4cyxa4xrlkDLqK5e1wA01CGVkVV2G/QpEFQmnmTgxK2acAI=
X-Gm-Gg: ASbGncsMiJcvVjLeDrrPBgOrVYR2b7YAWUQkyN3XEln3ZopE5eatAa2ymmudnuTL4D2
	n5oJOx1GPs5uTmlEiK98zKoH2hTM9zrxzHhJ3Yj+LiDgocFupITGpXKzlVvz4cCyhc5gGW5C1Z7
	YOa8Zs2Tg86to9PVPPdWNiau6eILzTPGw895RFWW1hOfEFIC/+SW+maVA4jEHZLEokyOwOZpOnp
	gAlqt4j7y+d/QLGivAeHv4tWr2QOEArEumiweObW7BDVqgAmYL2ZdZOKsI0hJCIfb8IZt3pxaqo
	O8kOpBAdbt5j95KYe3x6zed1twkJjj48tz3KzEzmZGLwPWKgT0kMf1vpfnY1z04gw0cddku9Gx5
	nSLPDp4+gAY8CKWrUGC0XG9WlyDI8ZAcH68hyNbS3nT/cwXtkIETBTs0zK6Dn9O6O6jBFAPbs7S
	JhbXZnEofMithkVfsDQ8iNprvV34s=
X-Google-Smtp-Source: AGHT+IGAOoUW0XD9+qwwI+PbL9VG+MrdXs4rR2dEuVGyu8dEGa1T5rx/ZK+RB3yRzWux75q9C21zPw==
X-Received: by 2002:a05:600c:3b9d:b0:46e:5cb5:8ca2 with SMTP id 5b1f17b1804b1-474942bf7b2mr23336545e9.2.1761074830178;
        Tue, 21 Oct 2025 12:27:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c42b48c9sm7839115e9.15.2025.10.21.12.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 12:27:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com
In-Reply-To: <20251013-automatic-clocks-v1-4-72851ee00300@linaro.org>
References: <20251013-automatic-clocks-v1-0-72851ee00300@linaro.org>
 <20251013-automatic-clocks-v1-4-72851ee00300@linaro.org>
Subject: Re: (subset) [PATCH 4/9] arm64: dts: exynos: gs101: fix clock
 module unit reg sizes
Message-Id: <176107482865.33931.12362645662957210185.b4-ty@linaro.org>
Date: Tue, 21 Oct 2025 21:27:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_122712_047641_2DDFD11D 
X-CRM114-Status: UNSURE (   9.76  )
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


On Mon, 13 Oct 2025 21:51:33 +0100, Peter Griffin wrote:
> The memory map lists each clock module unit as having a size of
> 0x10000. Additionally there are some undocumented registers in this region
> that need to be used for automatic clock gating mode. Some of those
> registers also need to be saved/restored on suspend & resume.
> 
> 

Applied, thanks!

[4/9] arm64: dts: exynos: gs101: fix clock module unit reg sizes
      https://git.kernel.org/krzk/linux/c/ddb2a16804d005a96e8b5ffc0925e2f5bff65767

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


