Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6135EE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 12:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UN1PfYXNv5GA5EWcDyG0SuUKxMnngW7vBJ/To7wqj0=; b=ZcIj12ImBUUZyrhzFlf5p8fHEm
	n8egSRUpmgucoOH5MNOBfZrDqG5JrJu7BCYc3BzkdrZpHusQittYbZSTxj9918HY6pUl1A0LzyjGP
	f6INJFPJ4uiJFkJxGKYlizVCrhLHz4hXSmmmuHQMy/uekkR8ctc2Li8Fy2zLfw0uJbhmJjikkl2+O
	JlkDkQmuiJuNGcz3xKCI6temX0DR6oMGYmodhSXSZrn0Qt7pgQY0vnZwE/yFCjBtJdQLSY8Llez7S
	Qie8i31dYk57CyXcG/PL+rVm2KGkwzb6oKhlgYLgrhT3hjnt6vdvh4ctE3DbX2WpkSojIq3MNDyJ2
	G8FYTOfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR9oQ-00000000Cfi-2Dhp;
	Fri, 27 Dec 2024 12:51:31 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR9k2-00000000CAj-3NRS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 12:46:59 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43635796b48so43698005e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 04:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735303617; x=1735908417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UN1PfYXNv5GA5EWcDyG0SuUKxMnngW7vBJ/To7wqj0=;
        b=GhxE/6ExcTeE+VsAsgk5s9emTx+waruuW0Gp7Zx6gtaRpmFr8isTtBCmwv7M4YCvui
         V6eyf5E2TDADke1hYYIAagqWE8pn90aEsYTcILsPNzBAMIzie57raKZHeueXn/BmQARn
         WjeuoxGVDzEllFv/2mLKspJ2EaVGdWlD9Zkljk91Lfg/ZPW0LT0yGVHrBeaCzwjCMh6H
         yHwCVeexpqyycQEF6435aRsUYI22cMAxAKE0ojx9uZgZfMMkZi1faNyL5iU75mGNEnV1
         laGT6j8yF1tRbuqMSnlB29rWqahV67n4rQKmBcLnW/TbdFrglEi7GtZelza8kB5fT9ZY
         jg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735303617; x=1735908417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3UN1PfYXNv5GA5EWcDyG0SuUKxMnngW7vBJ/To7wqj0=;
        b=COLw2qPDmHOliYDoUEw9dehU413bqWPm9hJltmVa+AR6XPxZLg7LA4uHigJtOHhB+s
         wWYtVp3Vtoyie3LQayIiSRTqXr+QH64yohbcEpv5KWaOfumY30X5RsJyP1ddfFFeQw52
         6Dv/sSz4gJO980wrJs9ShC9wmUKqFKjiwJxZKMmc4LN4WXGuWMuMQ6gMpj4WZkcYFcBg
         IYrZlGh790K1H0/vzXn0JjtJAcwddtr53ROSe5KevhCrbgcasHQixUTuOUQvup4tcuME
         /zn+RwUgecOXGJE7HjwzPxf61/uR0zp8u6HHRNlkLnlei8q3YWPc3jai848OgTSLhL1R
         8BQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAxACIbgA2Ak/W1TQTpDGFlBjUyz+mYQo+xaVZXpSixNV/1hRhCOEoO4CpaVVBWZcLP5aGXa6/GB1pU4SVuBbt@lists.infradead.org
X-Gm-Message-State: AOJu0YzwgSMMfJYn4S6RgG9fduhg3q+a9Pw9JrOpwRybeqUZ+ntkLney
	uIaozy6kTfBNxg+4LsjOK3dkWtFqsHQtJcr4Q8Zdu2nPJDI/Xx5H6ZLjSMRfxsI=
X-Gm-Gg: ASbGnct6sNcKYWvOF8CpC7mVUySPjjKMLDfejSCm+3kHcCFfYR4UMJGBGDAt6beEW4e
	qfqbJ6UF7PzqlFg40+QhFUUZA9w5i/p2oZrUimtMZUzgMrI4SmOrqKEamVh7JjB9S997fmcKSGt
	Ukyah70+m2BxkQqkYBHfNldP4jYQ3rCCPzkxBM2TwD8QVUDPNG+1M4jSPZ0Xwcpa+eu/T+ZXnpM
	gJxwSqJT2uRDMnnfSiOULRxXf4t7dl2wizqbRabidOVUMuytXQ2Wy2Z
X-Google-Smtp-Source: AGHT+IGUz2NO9FEIpAO3AKn3yA2N+FizKlvW523dxOyulaD8vq0KUtWqJu6Qzescg3PJZW/KKP45Nw==
X-Received: by 2002:a05:600c:585a:b0:42c:baf1:4c7 with SMTP id 5b1f17b1804b1-4365c770795mr216692485e9.4.1735303617020;
        Fri, 27 Dec 2024 04:46:57 -0800 (PST)
Received: from hackbox.lan ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11495sm297172905e9.19.2024.12.27.04.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 04:46:56 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	shengjiu.wang@gmail.com,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/3] clk: imx93: Add IMX93_CLK_SPDIF_IPG clock
Date: Fri, 27 Dec 2024 14:46:02 +0200
Message-Id: <173530350112.4140483.13164625485950770989.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119015805.3840606-1-shengjiu.wang@nxp.com>
References: <20241119015805.3840606-1-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_044658_845254_353922D0 
X-CRM114-Status: UNSURE (   9.05  )
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


On Tue, 19 Nov 2024 09:58:02 +0800, Shengjiu Wang wrote:
> The IMX93_CLK_SPDIF_GATE also controls the gate of IPG clock
> and root clock, need to define them separately.
> Otherwise driver disable IMX93_CLK_SPDIF_GATE will cause
> IPG clock is also disabled, then register accessing fail.
> 
> changes in v3:
> - add fixes tag for all 3 commits
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: imx93: Add SPDIF IPG clk
      commit: 32e9dea2645fa10dfa08b4e333918affaf1e4de5
[2/3] clk: imx93: Add IMX93_CLK_SPDIF_IPG clock
      commit: 6a7853544482e2336b5b8bb9a4b964f9d687f290
[3/3] arm64: dts: imx93: Use IMX93_CLK_SPDIF_IPG as SPDIF IPG clock
      commit: 570b890e66334f283710af36feb2115f16c7a27c

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

