Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7620EE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FnoZGxzHG6LZDyvVjX+CssXgRHCJAKynJ1wSQcpNHJ0=; b=lrdGOq6IDC7xochdkMO6lyYv54
	GzeObOMcP/llOx3gYQTms6mt8+xqz859WoPcUC1luUVqQV3RyLhMZHtKYDRZgqsAI1kulD2j1tj3S
	i04SV9wicpwZRNr94r3rODikOE59IF/OVEWUeh7mlrNo7K3rjCGVJbPcSCzq1VGii1xl9Asp6e2mS
	uOIckZdWkoe4wJS00la+YMKaByY9QrTAtxSCNxv9yujFReSEBaUnFqIjEDRIQhDyGCtozwCeM333+
	xUu4Fv6tpiqeqTht7O2/NS3LyNxNiXwXEiz73/bnnNod3m50wC7pHk4jhJ20uLsIU0TUfTndpDKdu
	NUM/pCxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAVj-0000000Fpgb-48PA;
	Thu, 05 Dec 2024 11:59:11 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9JD-0000000FZSw-2m0O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 10:42:12 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-38625aa01b3so16795f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 02:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733395330; x=1734000130; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FnoZGxzHG6LZDyvVjX+CssXgRHCJAKynJ1wSQcpNHJ0=;
        b=R2Y80oauMyzXkHp7k860sPLuE2diaeA8G8D/mj5NlbAKIDMnTzXorwvMgX522AZ4cT
         bPI2+dEoLjH9OAI6NHjxqjUcf0bdDUfKd5cHyIsLSVOtXXh4S0UB0e8ABNY1dNM51Jd5
         ye7LmEMKhaH/rAySvKtawp19f3uWM0YRi/6gmhxOjykexdL7CL5YxYAHPstGrJXYVjVg
         p/jjIRHcf0VvhjA7oWdaJcbHLPPiwC159T8+XUSvdzqKd7FHu7xXQu4CCUV8AokDATH/
         p2x05z00Re4ye1kanr9aOXkkJac19xnq0is/A+S5aYKTxtP3udbcwEYeKseS+5H2QVuH
         ehCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395330; x=1734000130;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FnoZGxzHG6LZDyvVjX+CssXgRHCJAKynJ1wSQcpNHJ0=;
        b=JlanDM2bLa+Itw7CE5UzLVwU16+3lez8IQOezDbPOYbVkxT0Rl1bi+dlJZwo3rR101
         n9aNqX8ZQIxZP6lM2G3zUVQh+KO8NuKHylQ/bI07c2+z/R6TNMyDxPN+aYt1dE5U+cbb
         aW5owB6qiM8p98ICihMSEC/U0iuwQvdoG10sgFzv0i5+3Xzf4s8oaRdZXy4TWjPnr4P1
         KbT8JdHK4rrSCRZ9fz6rP5lnRExjUobOShX/uIx9go6iR8LNw73ujtswlENCkxIXUlLL
         SO3HYnWF51K2Y8C4w86OS7VYGITPpA5rd66TNhrW3hQgb5WdMy/+Ck2mtWj6H9giPWqY
         SU4A==
X-Forwarded-Encrypted: i=1; AJvYcCUqDA5eKkBSuMKJn+dOsjMoSysdaayUo9Qmc2Q6DTJel5MVPnbpUHfS0lIgSG38KLFxKTEGdiLZonV0FvB+ZXM3@lists.infradead.org
X-Gm-Message-State: AOJu0YxFjplfQyrSJ5PNnnTU9MzPmVM34Um4UGYWIoCnZvocDWNqi/20
	srxiD1iRSVAxOC0gn/jNoD8ycdk7uYUsNfXhKiHPbpmbQaiB7CVcR8jd+yPlcyU=
X-Gm-Gg: ASbGncvnbUKrzMGpSsWiedRnL1kHvcVa2LTp2vj7ett6312+Uacq92sKvqoPLgTp3MR
	zGo2iGryqqthuaxf080ulqI2ALaAt76VkemC9qtLlkN8hiz7EnKW7MeAbN7ugb2DCKoyz5gw6uE
	AkdBTIYR3s9A53X1AdIvCmdIkmEEt4qwxDDBaVFq4N9gY6JnI8LpYp6+FtTEex1vZahjWuW0WNP
	yG2J5hDxApHNCUfZUvKsTGyMhqjIqczD4y2Bjk+mdnjaToWQ/go/NRuf4MMPHcJSA==
X-Google-Smtp-Source: AGHT+IGz3GjcyfBhQ5HlqLVmhmG7Qtmhnbj9BaPJEz/QzVaC6xVbnrbhQALk4UuX4nKmsjVBEJ+aKg==
X-Received: by 2002:a5d:6d82:0:b0:385:e8e7:d0ac with SMTP id ffacd0b85a97d-385fde34d9bmr2947632f8f.13.1733395329824;
        Thu, 05 Dec 2024 02:42:09 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861ecf406csm1662701f8f.3.2024.12.05.02.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 02:42:09 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Nicolin Chen <nicoleotsuka@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Adrien Grassein <adrien.grassein@gmail.com>, Adam Ford <aford173@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-mips@vger.kernel.org, alsa-devel@alsa-project.org, 
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <cover.1727438777.git.geert+renesas@glider.be>
References: <cover.1727438777.git.geert+renesas@glider.be>
Subject: Re: (subset) [PATCH treewide 00/11] ASoC: Clean up
 {hp,mic}-det-gpio handling
Message-Id: <173339532775.70936.4554643874403091214.b4-ty@linaro.org>
Date: Thu, 05 Dec 2024 11:42:07 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_024211_705672_23438AC7 
X-CRM114-Status: GOOD (  10.61  )
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


On Fri, 27 Sep 2024 14:42:15 +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The "gpio" suffix for GPIO consumers was deprecated a while ago, in
> favor of the "gpios" suffix.  However, there are still several users of
> the "hp-det-gpio" and "mic-det-gpio" properties, in DT bindings,
> drivers, and DT source files.
> 
> [...]

Applied, thanks!

[03/11] ARM: dts: marvell: mmp2-olpc-xo-1-75: Switch to {hp,mic}-det-gpios
        https://git.kernel.org/krzk/linux-dt/c/62f95d8a4920706e94759a8f5e34677528530cf1
[08/11] arm64: dts: uniphier: Switch to hp-det-gpios
        https://git.kernel.org/krzk/linux-dt/c/751df73d825b3f7e6cad42ed333c28096635784d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


