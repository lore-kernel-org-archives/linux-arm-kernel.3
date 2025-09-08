Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E13E5CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 08:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1ihnPj/Q847d8ksRu6ToPjh3J6EYfnXIG0faI+BDt0=; b=dqvYZGtGNN+/Gdg4tKvqvXG4PZ
	u0ReyWr+scqhEFUX+9RdjCN0WO+Y3S8ewrEox7pq+nuGi6l6sJmQAedXO/2yktLZqALvNmqXNoxYJ
	68Ga+yHQaBH1oyrW204TAIM4yH9qSduHr7vz66y3vVYLLO6IiabevpT2/zOAyBha11gjnO14F/BxY
	lMfzSVOh6Tk0YBzrMkvJwDtxcJuzBYMX5Co3TUcDHuMPlxKqWRNv8KNB4V18rvpduaMJLHPGzBeMX
	va1VURVt08i+sZaOI2e3ZMMBrFiQEmDoOe/3Ex0y66KMWcq4Ijh0gKuqtjrcTLMQIBpD8l3WIz+Ep
	1s82ClIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWn5-0000000FWYs-2VhT;
	Mon, 08 Sep 2025 07:59:55 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvWRf-0000000FLo0-2KuK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 07:37:48 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-61c78dc8b12so528742a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 00:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757317066; x=1757921866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1ihnPj/Q847d8ksRu6ToPjh3J6EYfnXIG0faI+BDt0=;
        b=APtcs+mZcCKTt7ykmijp/ZS85UCnaHNs3eimJmzR/zLS1P/nomWCu4xtKglxbhN4pR
         +VYWSPIvo1FXcPlQk0CLR5BAZUEN3gOiDu9sX0rZ+Srqq/nUALlJBheWcW+Mm2iMSB7l
         b3uHJM/qvi3OJY2w3AxwLMty1yli9/DtGwBpVkISbE/3DK6W3VHSusEI02MGiTTHOFzQ
         EKvuiMRyE+O77Y08z13rWt2OnI/yfrwZyHsjcsS7EtiFg2GhEKrBCcwFlTu+2mhOs0qM
         /iBAGee6RjPWH1aOgO8pbERR94aJ3VJP1Ftn2zLtjLrC9fteeVESuwzqmJ5Npq8bjQxb
         qbvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757317066; x=1757921866;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1ihnPj/Q847d8ksRu6ToPjh3J6EYfnXIG0faI+BDt0=;
        b=OemjaOU7BmYfOFvlEb/gXFhgxy057RQ0tjsG5todda0DHE14kW1dHSca+7s/U984ip
         4YXGpFuX1btPbIwyUzT9AlqI4vMbeFIWP+xV2T1sIfg77p5IlFn+OmLH5QRNb2N7Ms+r
         3Eb3uoU4onA/05/KLJ1lmCRaK/UNn4BsTGQ24V87zQtXLdArghAyayjSj/CYbqDxSbUZ
         UX0dDguOSgzoBk1/B4Tp4jb7Se5zQi/DbZGA35s6sN9khZcKtOEpE7uNTX8hbVmdwA4a
         qzz+lo9XuSb4i1X1iKgMcl1MA2werQYNpauaiSLyXmlM7HDf3gOlehnnM5QD1fNP0/NY
         CTFw==
X-Forwarded-Encrypted: i=1; AJvYcCWTTMrwbFTuGFRVaA+Rcwt+QNtjFOMD8JL8P1oF6pUwjg086TRcu5v7cosG/OGFCtLT4kpztp9t/LYBIKGen59l@lists.infradead.org
X-Gm-Message-State: AOJu0YytHyONV+/LN75HW9JKe8butgHhWM66CQ79dUr/wi//zPDofmSI
	Vq3qwhljzCv7r21emi27SB5XTC/NaYH5VB34YfAFC9RFlmg47Q2tO2W0BQDa7h6GltuQYUyjFuL
	iQzr0
X-Gm-Gg: ASbGnctCpljm/aDbEnYEIqiH6EKPgTjlqKEKmJSLRa5ivi4B6yIY20JlNPJqbeFFPHY
	q3JpeduK7a/4OzAaKZ+ieNF9iWuL99uIU8kp/RMqflgQ+AZ53FmG0BLCUi6dMtIs2fYai0z2rP5
	UNn4RoQJmtXxn+UxAnrtTqOSLk8tYYX11gz/VvuCSewyx2igjzQtqtseOh1aufMBI1YLU2xt5D2
	okJFpxeLi5kfDoKX9HV/FoZoXeJyNnZPuRbphSOEWm3dhWFmqAovBjsOk801ygXgmWkTbqG7W5x
	mlPmH7w+cvNkzZm/nYymXvPwTD6Bha9cbL5ftfgEAyrV4r4v1YJfeyJIXf/dDFzp11HnUAP1G73
	4UMDeexk7nDpivjQrl6TUceYjs/U61ohAO8qOKj3WQ/GF4QG7wQl13dxbsEh6
X-Google-Smtp-Source: AGHT+IEwOfCfMLqhq1au4x2wehLLoFF6Zs3TLFmLiTfUckQkop+xb6mWxOrGK/1CnN+pfhpIuxlJSg==
X-Received: by 2002:a05:6402:3547:b0:615:aec5:b595 with SMTP id 4fb4d7f45d1cf-6237adca141mr3186598a12.1.1757317066001;
        Mon, 08 Sep 2025 00:37:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc1c7edcsm21955357a12.6.2025.09.08.00.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 00:37:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Henrik Grimler <henrik@grimler.se>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250908-smdk5250-sromc-v2-0-e91b2375d4e1@grimler.se>
References: <20250908-smdk5250-sromc-v2-0-e91b2375d4e1@grimler.se>
Subject: Re: [PATCH v2 0/3] exynos5250-smdk5250: describe SROM controller
 and ethernet port
Message-Id: <175731706457.18620.18138563656034990579.b4-ty@linaro.org>
Date: Mon, 08 Sep 2025 09:37:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_003747_611551_51B2C88D 
X-CRM114-Status: GOOD (  11.58  )
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


On Mon, 08 Sep 2025 09:26:54 +0200, Henrik Grimler wrote:
> Based on smdk5250 description in Samsung's vendor kernel [1] and the
> u-boot dts [2], the smdk5250 board seems to have a ethernet port
> connected to bank 1 of the SROM controller.
> 
> Unfortunately I do not have access to the board, so this is not tested
> on an actual device, and based solely on the linked sources.
> 
> [...]

Applied, thanks!

[1/3] ARM: dts: samsung: exynos5410: use multiple tuples for sromc ranges
      https://git.kernel.org/krzk/linux/c/31f5a855f706f8b14055b6b4df083c3997e42907
[2/3] ARM: dts: samsung: exynos5250: describe sromc bank memory map
      https://git.kernel.org/krzk/linux/c/6016813c888ec7d4a1f592eab3aebf289a42e865
[3/3] ARM: dts: samsung: smdk5250: add sromc node
      https://git.kernel.org/krzk/linux/c/d19b1773362adfe8c0d5ccc4faf6aea0249976a6

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


