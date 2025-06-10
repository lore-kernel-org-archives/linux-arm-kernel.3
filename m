Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0394C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 08:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q9WGI4IbP//61XrnIlM+natAC7ecS9zG4vex6G78gZY=; b=QVnXo8e625ECqIy3Z5qxcrWugh
	mgOzxteey/gCpym63LAwzD7Ii7GpqQNCSYyQVi9DnJRnJIZXAlqCbwVEg9uWBQqgwr/FeTrNYfz3S
	Mr/vouOtfPNJTqfoCWH5pOWXp/F8gcKh+37Kcn0Lqg2kG11x7Y/0j9+SYcBiRIvFtSNt86SOKjQHc
	Q3hCXNGVEcql17q8Ga6ZVdFOeDgZt11LNwZ668xquPinKEaBbvwQVQQa5Yo8Y0nFGBvFlwvkdBsg/
	zo7If9n1urcayAZZVQkTj6/wwY4ICuHWK9uFGg3M/X6og5US/UOvDFn4KFQ3Y9nufs5Vlp9GnmtJJ
	8YLHQt8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOubO-00000006DMP-18pM;
	Tue, 10 Jun 2025 08:45:02 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOuGy-00000006A3z-47Tn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 08:23:59 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3a4e575db1aso687296f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 01:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749543835; x=1750148635; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9WGI4IbP//61XrnIlM+natAC7ecS9zG4vex6G78gZY=;
        b=UTKpuy8u/ttfWWrxOgJpmWhA9CSk4ESFO1J0Hg8leow6IsJlA6nqA/xUQo/pgVP2BA
         YVt5ha1aGaaOcfclnpymjgGka1HkH7R5lMBnpKJQaMr5AO/gjLbhZ64tfwxvfP/H0PcT
         13Kc68mxn4Bu4BsxQCRHfih7M4vZbDb6teLwF6aJ58RPgzMvR/Vd39bfDh4pH05WLpT9
         WQGkLGlAItgRvBeTVuCMtWJGxSdkoJaFApg+SIwwtewJJmiWdtGfFznC8TIRaWXLSvww
         ID2erewjQAekZCabUyYx8BH50EJjIxQ4iakv6AEAuSFomr/IPvwx9HLixCIATpooD71R
         amOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543835; x=1750148635;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9WGI4IbP//61XrnIlM+natAC7ecS9zG4vex6G78gZY=;
        b=RveoGc24nkqMjMZqseFiYHmvqKY0v6EXZSgkKL6JW01t/eRzP8uIIPi6gcqMW1N6dT
         jFe6bxVUBXXKIoictTEg4gbUd+iMBFRcym99Xm8/F4A1gXVROHCEK79oBgTQpdHgYcGJ
         0SxKaH6s6dTGOXiXGanU4ARmApU3Niw3l+pbpf6Y/Xo0llg0nXTOhi3+t26jGxZI5y+l
         KKkcuah6B9Tg/Fo3SMYzD9Ns47N4lm5kMQ0x3T1CzkLisTciMNzbkCzxoX2rG39zXc/b
         RmrEpiUZ/vROj4FPz4ABKy5A3zx1HztK88f5t2oPuZgp5nENoul/3s4z3dZvlHyd+eAB
         wf8A==
X-Gm-Message-State: AOJu0YwnD2Mm9pZBgTiWxSwl88z/kHRzWWGNoB1spCP1IpKzf5nJFo5z
	8uOEu7qBLQbg5C80AMg434nqdJAAC0+DtSM2JkDcvMeRjzicmK0GdnnWATrE2HukSd8=
X-Gm-Gg: ASbGncsdTIZf6I/gDBwi51i88ydMNfi3aMHYxQV9e0oWbWIG/nIddb/16K5b1t5scLP
	NG0m6yLnSz5qrV/VmC9eDBZTKfir6ffySiBcZpAPKIlUaUgBTnBV1Bjhh5B/TBLdPuIA6y91eYN
	/gSOYIrtbdjdlJvWMp/XjnqWWYiDdHoLeQ3jUiOLIxfVPzOpP7j2R8u66wNK4SvSsYRts+7s15f
	sQ8+zc8aM3UXNEhYY8XfBOh0WqI97NzqEj7EZ5V950WH5+Hn/ejbQnvx4go3IPje7mf5h+QuXxg
	7RDZnxnU2D6E6mt8Ay2rB5/OF6YQufPp2oeqARSMo5tXULG94vXK6zaeVva+kMYQYbvj/YIXBK1
	51To12g==
X-Google-Smtp-Source: AGHT+IF3umgoC1MXVewYqSd6NXb0BxRbXdgsSHg+n+0cmqeui+0FYUC+7otmqctsYZrl7Ig6A8Aq0g==
X-Received: by 2002:a05:6000:2409:b0:3a0:782e:9185 with SMTP id ffacd0b85a97d-3a53313fa5emr4137414f8f.2.1749543835438;
        Tue, 10 Jun 2025 01:23:55 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532450b08sm11378980f8f.80.2025.06.10.01.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:23:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
References: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
Subject: Re: [PATCH 0/3] clk: samsung: gs101 & exynos850 fixes
Message-Id: <174954383375.117835.6950854237763688291.b4-ty@linaro.org>
Date: Tue, 10 Jun 2025 10:23:53 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_012357_033197_0F779570 
X-CRM114-Status: UNSURE (   9.32  )
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


On Tue, 03 Jun 2025 16:43:18 +0100, André Draszik wrote:
> The patches fix some errors in the gs101 clock driver as well as a
> trivial comment typo in the Exynos E850 clock driver.
> 
> Cheers,
> Andre
> 
> 
> [...]

Applied, thanks!

[1/3] clk: samsung: gs101: fix CLK_DOUT_CMU_G3D_BUSD
      https://git.kernel.org/krzk/linux/c/29a9361f0b50be2b16d308695e30ee030fedea2c
[2/3] clk: samsung: gs101: fix alternate mout_hsi0_usb20_ref parent clock
      https://git.kernel.org/krzk/linux/c/ca243e653f71d8c4724a68c9033923f945b1084d
[3/3] clk: samsung: exynos850: fix a comment
      https://git.kernel.org/krzk/linux/c/320e7efce30e2613c2c7877acc46a8e71192cdcd

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


