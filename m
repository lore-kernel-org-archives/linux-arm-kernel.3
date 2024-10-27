Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76953D13580
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 20:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=32/OJX77QzfcPQ0HvpkF+bqERxGXoeV6PeRkVjO1W/I=; b=I8TsOswN5SAf5It6QmhiFYKcDU
	fVPcPRfbbP/Tb7BfEWG/031g9Vo+/zhqS9WdCQyM8a8xblDeWJF2B05ejwS9ZyZt8aEholZs1dlLz
	T2YbpaoYcC3D8StQaHEDBnn+bWvzpe3WLRkb+7HgPa+Z5fhGgJmotS8RArFeNyAuYylqL7J6t4Wvj
	5lVJ3T7a2nII/um/GnNg965VEZUzFCg0NKk1oIHT9VQ6d107sqTdJSFQj2QETObbcvOk+7sxGkWIh
	wtQn31WQm0ZaLcCDntRhNr9AOkc0ph7GAQoAgf+9YMPcSgwORLb1V9qPW738NFMroIDpRZogq4Ks2
	+uz31LoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t59Vx-00000008nTF-1495;
	Sun, 27 Oct 2024 20:05:29 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t59Qh-00000008mSM-2GE2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 20:00:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43158124a54so4224695e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Oct 2024 13:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730059202; x=1730664002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=32/OJX77QzfcPQ0HvpkF+bqERxGXoeV6PeRkVjO1W/I=;
        b=IlHZuO3uwjn1zLik7lJVbdMBppyxlOzjjddUAO755+M6U/m69bGiz5u/6H/5AUhyvc
         ThwF9JQcDM+wGQN6BYwScBlJFyACxPaJ/pLzgs23JdDyzpCkkotBB3DmumyQOYbgcKgR
         zUd+kiTQ9p92HNQWb0DC9O/4KgQy60cA9HLXyPxos4ztgNQorG6/IXO+AKjAOV5MCPy8
         BVUOG/D/kodcTyn5VFrOhPFcwNBj5xDjgR5A/S9MguOcNOnM7F72NvOYNwwodCYDzMaI
         Ng/SpWRLtXIe+wXA78Ajkpj3pXFutveo+Qn9eR4kpFi6sm2/x1OFd2OZc1vgUuzAduWd
         uuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730059202; x=1730664002;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32/OJX77QzfcPQ0HvpkF+bqERxGXoeV6PeRkVjO1W/I=;
        b=Tc7+SeT09g9gyowjGNMoLzkIs11aq8Beftt9v3CylkTQVuR8MGKf/lVhSmAAHMZNek
         oKPALxCVOb6nylZavzGBo17qMBPzv/hUzlx+HXgQz9sDHYhc432Bzk2oPkt3VW2lqhmr
         rwaawoQXjYvdMvNaCK3LZEt4V3NOVPFhUGaj4P+joPwK+aA/nu4cwNGJp5H84/ImTMLq
         K1nfY+ARGmqAxmkd0jNiab6orcA2pWkKfPnjio/qZjhOU4CSmT4IS/goq0pGPllATFkt
         cONxMGacNhLLfPPQNzvEty1MLQKjrHQJzvgX6cN+7TK8FzzjgWPgC2BkGGwl8MfX1N8y
         0bqw==
X-Forwarded-Encrypted: i=1; AJvYcCXTcc6GpBd2FwlkUFWIcbxaW47I3EHtaId7jUtQLlySmFG37BRFYkulDF+vGGwU/MiEsbe9LaiOrQm0i2HPg8GB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy29iBBUOAWQQV2CBcualwXIQb21n1tWbGiLd6VkrImRhuyFl2V
	7qXXCHQaibrqtJYKWa/dxAYiX9SDYUckwuFS3hYAgYphOpj7PsMNsc4ZzhNoXzDpBoKTXRdOUQy
	H5kY=
X-Google-Smtp-Source: AGHT+IGfqlf/6p5wAoYNymTQnzp8QuSdGR2Arh0BQMxhoKUhDQVHbla9xIqcp976cFbcKvl5ArUS1Q==
X-Received: by 2002:a05:6000:2a3:b0:37c:f388:cd48 with SMTP id ffacd0b85a97d-380611a4f13mr2206527f8f.8.1730059201849;
        Sun, 27 Oct 2024 13:00:01 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b6f838sm7506639f8f.83.2024.10.27.12.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 13:00:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Markuss Broks <markuss.broks@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
In-Reply-To: <20241026-exynos9810-v3-6-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
 <20241026-exynos9810-v3-6-b89de9441ea8@gmail.com>
Subject: Re: (subset) [PATCH v3 06/10] dt-bindings: arm: samsung: Document
 Exynos9810 and starlte board binding
Message-Id: <173005919993.11546.7756823592016380803.b4-ty@linaro.org>
Date: Sun, 27 Oct 2024 20:59:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_130003_654816_6059FC80 
X-CRM114-Status: UNSURE (   8.75  )
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


On Sat, 26 Oct 2024 23:32:37 +0300, Markuss Broks wrote:
> Add the compatibles for Exynos9810 SoC and samsung,starlte board to the
> list of boards. Samsung Galaxy S9 (SM-G960F, codenamed starlte)
> is a mobile phone, released in 2018.
> 
> 

Applied, thanks!

[06/10] dt-bindings: arm: samsung: Document Exynos9810 and starlte board binding
        https://git.kernel.org/krzk/linux/c/0a4907eea61d1b7d602a817f6c1de31609c48367

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


