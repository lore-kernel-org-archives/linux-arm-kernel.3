Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C63CDC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 13:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p7jZQ+YS+lWYeVwEC8VFaNnmqDYcJYXkLsLKJpyV1y0=; b=5EBYuXkchgnqZ4L3HFVfYXO5YL
	neQonZmxYJDF41J0E21aXBcNkJ9oLEV8ELwfr+znumTsAw0LOCd8b0YBPuEjyIOevXXnGRkgFYuFr
	uFCGmA6YxBo8uPCePzc6towA7kkTg+AXKJ6gswMgshm0S+Ic08dR9SLrLeEJtz1WKuIIt/A8yiwWX
	RRCEYe3KEfs2WNFPziEyCc7fx6aSAC9Igp/Ug58wKD5F+OBvp1PBO57JzAWQw3GU+W+fETZFGM2TC
	b4nbqEgdKrb0ZdJXfxdt7oMxnJjsLVJMgoOGZ3IxcrTg5tEWCstji74pU/8dB1RosEzz9nlLl0zlw
	j+ZpmMBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsqW-0000000AITI-091f;
	Wed, 18 Jun 2025 13:28:56 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrhY-0000000A5QJ-2Sw8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:15:39 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-553d771435fso43130e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 05:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750248935; x=1750853735; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7jZQ+YS+lWYeVwEC8VFaNnmqDYcJYXkLsLKJpyV1y0=;
        b=DOadpy4PZ0urT3TeE29lqxwaeNeI03JCFIXHNA4e82BYXjHwFKYNREKlBd9eKlVnwF
         zveAh4EQrd9jWHMEntobQg8SHV63FloutVG3Zp2uHOg0eUrrArV59yCQQo9TCFRf47px
         60Bj2n2fcb2OC0hFTHa/5SbBJQWrqnC3IBnB35vWNmobfUtreqPwPp7eWKXSWCloT2P6
         h/nat+SMJMbEYh0oGJTtydmwVVddOLqiYsjOBDBYau7KBIlRAM/LHazn0Xm17BB+rOxl
         Uj1dTUy1Y/nUvaLoJgpwtEJ7pmqGPIsqnmlL/zOJC2+f5WcnkD+BJaL/F1hPPglLjXX1
         NLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248935; x=1750853735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p7jZQ+YS+lWYeVwEC8VFaNnmqDYcJYXkLsLKJpyV1y0=;
        b=T9VyWuXhlxV8h1gh+d9GZWd5KKp0DHQ2v+i/jX6ZG8BlQwC/J9oGE+Yd8xSuGrdXKc
         UGB8CMG09Nql/LqeC9G8JnVDjCg63fKJ8ikqRuqz8Tw7OiGON5JOcM+yvFd7c+oEIjUE
         jh1cE2ga8gQq+zhohI43GKrWTQ++ejgPdje6woIViYPom+3KI0foSQFL27S1aX/Vdwjn
         ZsG/lfzpFQqo3KyF6DSzZJZKkJcMSR2BFOnkGP+DhJ801ZB+pbG1cPD6ZHQkWGkMqhG6
         crzU94Uu2wtTUTzqX5cz44ry9/Nw5q/YV8ll/0Gz+J5ekNvUoyzzCCo/PW5PsstXYT2F
         wLaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIlsgDtJCamqHpNvOby/ANM1RJC/Aw72ZvNxook5sRpwu1ndifeaX1xdwUoCPaSFiW2YDOEjuGdYbS1HYZ9Lar@lists.infradead.org
X-Gm-Message-State: AOJu0YzY5fMdoUgdscJ/7rzQdzSQTNKvzRsQlpkU4jdgjN1T34f7EW0l
	GZ2yfRPQ6nMMH1hNja3ZO14Im7U9gm1i2DcWWE+0r5WTI2zsm+U83FGXNulDK7zvbCmt38asz1X
	MRreKJP1UDXEevE8mO5ffyPpyx67aZyfdcsTI91RTng==
X-Gm-Gg: ASbGncvwcSBj0fuhQB7J9EHH7PkC1izNl+rnjjteTgk726IHg58cuyT0gdiFXkQ6ETl
	hPUsfo/Y3cTUIVbzKAHjETz8eO222+ArtpEPVlY1adu4Ef3PtLx0Gs6nPFPOqQL2hU+v/6St+Vs
	DloCp5OzAvB6+3yK/Guohp6dL5521aXNpR8kllSs4XAAU=
X-Google-Smtp-Source: AGHT+IGBMbnQS8CZK59QUADw6V+D/mLT8w6YMYDnxWivA5Amu6Cgv0XDSbL6jWX7zdVZfzp8QG5Ih8L/ToZVwFJNik0=
X-Received: by 2002:a05:6512:1285:b0:545:6fa:bf5f with SMTP id
 2adb3069b0e04-553b6e732b1mr4223465e87.2.1750248934811; Wed, 18 Jun 2025
 05:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250613033001.3153637-1-jacky_chou@aspeedtech.com> <20250613033001.3153637-7-jacky_chou@aspeedtech.com>
In-Reply-To: <20250613033001.3153637-7-jacky_chou@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 18 Jun 2025 14:15:23 +0200
X-Gm-Features: AX0GCFscY4ky5ebft20JokFvuO1y3hVcQ04FGalsWAeschf7cTa_SUmnKoC4ETU
Message-ID: <CACRpkdaX24z5YsfcrB2oqbZpdexZJNREGkWiYgq1ar0c8O0QBA@mail.gmail.com>
Subject: Re: [PATCH 6/7] pinctrl: aspeed-g6: Add PCIe RC PERST pin group
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, andrew@codeconstruct.com.au, vkoul@kernel.org, 
	kishon@kernel.org, p.zabel@pengutronix.de, linux-aspeed@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, elbadrym@google.com, romlem@google.com, 
	anhphan@google.com, wak@google.com, yuxiaozhang@google.com, 
	BMC-SW@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_051536_639647_C53CF19D 
X-CRM114-Status: UNSURE (   9.44  )
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

On Fri, Jun 13, 2025 at 5:30=E2=80=AFAM Jacky Chou <jacky_chou@aspeedtech.c=
om> wrote:

> The PCIe RC PERST uses SSPRST# as PERST#  and enable this pin
> to output.
>
> Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Can I just apply this patch 6/7 in isolation from the others, to
the pin control tree?

Yours,
Linus Walleij

