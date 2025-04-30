Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67FCC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 07:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2GjBdyaKCtW3zYRYh1auVT0QVvykzGugn0sug1VEl0=; b=SNYivbIP5+AI1Ezj4umjFo/BRE
	uV2bYO+N0lo8/Wl/imVgSiFyIptgO56AHv1w3W7yQxZOQJk7CI4EHIXS1ufcf1B+apfVEbc52MfJW
	DrRlaR7XuqFhnje7l4pe9hWsK1hWZmGE7iBAL4BX6N9KsduzO1O7lybgxjJuIHLuZqXsVwvkMczrP
	JTqSFsqF391EgtNEp/CrcpBDS3c538ZJFQKdEvbJ6sHO1ZtQa/9Fz2PWwHgjV1aqFIDS9x8xFxld7
	eppLiClVnkx8U9GA07YuQS/PUtNRwQqzXJVFaSWfQrTotKMKPDD9HOZ6/XIkSpuefPMoe/4oZyX0B
	iy0JDNXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA20u-0000000C181-2eQs;
	Wed, 30 Apr 2025 07:37:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1s3-0000000BzQL-38hp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 07:28:45 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43d16a01deaso4950895e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 00:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745998122; x=1746602922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2GjBdyaKCtW3zYRYh1auVT0QVvykzGugn0sug1VEl0=;
        b=xmMRmCqPD8mMaMj494G6urvgsoXeadGJUPpltTwfPHcUuEXlFzU9HhkyQU5YrjcY3f
         qou9n+J41kSyiD31Cgty2aQLz05n5d3S6RjMNPONv0cAUYEyZG+j0nhWlEIbqWRyNbjB
         nfAqZkUAGnmDaN+oCbyfn22WXEtwQvtOXGfRClSmwmzcyBdCTit+VqVLZRBFf46y2ajI
         Ex8dQx/yEy7F+e5t/UxxpV0vKNJp/fC5sMxD85Qdz8h/SswQqZYoukXyUQse5kwPZxM4
         R1y3D+e43Ys5HJXLPJdNtBZb56t4lL4NMHDY1H3iotKAhLLHBko+Fh1NtfMOjjdYN2WY
         gQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745998122; x=1746602922;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2GjBdyaKCtW3zYRYh1auVT0QVvykzGugn0sug1VEl0=;
        b=hVPccqQbQlIUXLawk/knsArNg1voSbBAjDLrv6sscYV/E+XV1rLW5nlLEo8y231ujE
         PMjXXDbab27FH/fR/sPKHg0VYzKz6KAEN6YskzomFVYLo289RoCh3owzTh3y5d6LYq74
         ovNQRIEc0G5D11Abc/7DFJcNmP4vb5jMQ9ejZ+nn5s4810Plq19at5sH8GvdyoN/ajNF
         9WVU957UMXWUhrHDK4SfQQSt6vciuCkFWZCJwsFu0iTyTjJ/vHg+jWxE6DCC4hY3pdk8
         b/o2wxqd78kpbplvLa0OtGAeosu4Ca1wZX3OsM6tnWKHI8jmZitCrHfAy9CE7qUrNlxe
         Zotg==
X-Forwarded-Encrypted: i=1; AJvYcCV9Dvfoe/D7i8pvR6hrcHwU1XEHNNnqTFIEDl6Rxtpqx9x8S680ot1Ed3OrFIxPlGgRlhHXOMhSxj9xw6+BIdKv@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4Cfp+roiYBoq4tlbp4u8JbWbsKZONoKHsxAv1AGciiszqVFfF
	Vy3ttRNykuRJaeiYMZACargtmO/aE9gA1LiSWWUemUcVoGQSg8ODoTu2eZq05Ck=
X-Gm-Gg: ASbGncu9+ar7nOVK1hVmnJ/Vd+gwPWIq6FOGhJfRqw34t/avnFEomXaMmsIllJZhY8r
	oLVvdGrSOhnEH+C36FB7QNxAP2Quok45fx8czLougm7+1egh+F6nB+JKwsscWxP+Ako50sp/msT
	VlP9c4K3oohePL4HSnFc6GtvHCwPhLpLiarXskqF4PK0ZazYI4xrDG+Dm8lUu17D5D/pMv77uOC
	ioskB3LyAE/02kVh0sN3OA4fV0E5ZaZwO+snRzQlE89nMtNjy6wWtJVhODNCEjUzc0m9cJ13XmY
	hRGnAJDxP8OJxU+9itj+v++PTC1ge42WxUoJsgWLSalpuEjzbkjnKoZ6Phg=
X-Google-Smtp-Source: AGHT+IGwTtEZNxfD7gnxZYy8bdkJG1uCnoJXegRtohIUB9oy12vNvD806a9awgtKzyXNxJJUksNc/A==
X-Received: by 2002:a05:600c:46c5:b0:43d:745a:5a49 with SMTP id 5b1f17b1804b1-441b2dea5cbmr3804325e9.4.1745998122329;
        Wed, 30 Apr 2025 00:28:42 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ba4a6asm13905525e9.11.2025.04.30.00.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:28:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sunyeal Hong <sunyeal.hong@samsung.com>, 
 Shin Son <shin.son@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250428113517.426987-4-shin.son@samsung.com>
References: <20250428113517.426987-1-shin.son@samsung.com>
 <CGME20250428113558epcas2p1f2980cbc58f71dde78a9529e2b85ac20@epcas2p1.samsung.com>
 <20250428113517.426987-4-shin.son@samsung.com>
Subject: Re: (subset) [PATCH v2 3/4] clk: samsung: exynosautov920: Fix
 incorrect CLKS_NR_CPUCL0 definition
Message-Id: <174599812090.45412.3776257923926441199.b4-ty@linaro.org>
Date: Wed, 30 Apr 2025 09:28:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_002843_802057_46858E94 
X-CRM114-Status: UNSURE (   8.68  )
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


On Mon, 28 Apr 2025 20:35:16 +0900, Shin Son wrote:
> The CLKS_NR_CPUCL0 macro was incorrectly defined based on a wrong clock ID.
> It mistakenly referenced CLK_DOUT_CLUSTER0_PERIPHCLK, which corresponds to
> a cluster peripheral clock, not the last clock ID for CPUCL0 as intended.
> 
> This patch corrects the definition to use CLK_DOUT_CPUCL0_NOCP + 1,
> properly matching the last clock ID for CPUCL0 as intended.
> 
> [...]

Applied, thanks!

[3/4] clk: samsung: exynosautov920: Fix incorrect CLKS_NR_CPUCL0 definition
      https://git.kernel.org/krzk/linux/c/f00aef8e2ee0b642abdb91682bec5af38532faf7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


