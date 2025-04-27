Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEABC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 19:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNcCWpWkCjlURmIOiT/Xyzz/qjRhgBURVuEZyl4hvPc=; b=Xdg9l/6zh6l+V0CZ8GO9RgBqS1
	d6FvJG2J4UkdsBjEUKK3+CeLEcBahRSfqmu9zGMwWOON+Xxd3OoqdvbxJtFdouqIf+VOT82PZoCjI
	qzObotY4MpImkZIVcqI0cvQ2s2C3nEsHiER4lRtEFzDuk3cbI1gTDDMDAmtGJRhLLDDXuqEbkhfD0
	HB5yiourBOl3Tqjen4JVOcQGX4eYBJ4dyxJdx7sQ6UuIT4nWgyS1EgZT9d5i7kCrermaCy4wC4RAy
	jUQ3uHG3oNOIibVd+jeKnxekMrCdqBnYq+7eteQYF14q8SWc3W3UYZ9FGscfX3KQAeGIN7MSItG/i
	scd+zuMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u97ig-00000003vwW-0Fle;
	Sun, 27 Apr 2025 19:31:18 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u97cx-00000003vPv-0fSb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 19:25:24 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5f6f3f2af91so487054a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 12:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745781922; x=1746386722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNcCWpWkCjlURmIOiT/Xyzz/qjRhgBURVuEZyl4hvPc=;
        b=pQg0Xaq1o2AyrrwB8SY2jl7Tmngw73UPqpp/hdo4+nkkBIfI9jQrW4PgYm4P3AdUzi
         JMXq8ww0YIbNYTsEvSdZl1qXIjlKJLSc5ML90rq/OZAztJvCPb79cdnMFKKq45WUGABv
         T/qjVtAeGxRhTw/TVt0fFTt12ASg6rBPIYVhgrmTGcHRR4jWWFNZqblcXvFQboDcOs3A
         kW0pFLpTrI3Zbv0GVy/Y8ygjYpNzY8gZcx6Irz/Vk838Nqp18uQHG63SjKj7G+Tyg084
         o7rRp2Ox6D8XwmNRXawLv997zaZej7kth+z2n8PaglnOi/J3ZTBWQRu35ApKIya22e8v
         Ch9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745781922; x=1746386722;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNcCWpWkCjlURmIOiT/Xyzz/qjRhgBURVuEZyl4hvPc=;
        b=FuIwFkj6j6wv8AKVkenMSZ47sQdiEwS0g9mluCRmizbi7qVtvM63VNu6i1QS48P5tl
         V9ZGAIOCK40a30EwqxeKQIiLveoP/NBKdavK569eLUNmus8WAt6/VoPOEBxZOkqLWSPG
         w0WbDfJdg7F/jTgF5QjsONDVFINMeL7NuPwUoDHML5BlBpzY7HDuXZ4+SGI7YV2vuLi/
         auYEGemDTRGDGgZ3hZPZcqtTt5GPUXhm/K2qSvxNy9IT4D8lF3sLhtk1ck25uR2ihdBq
         k2zaDUp0bvu8ao2VIWi7m8/lWkBxyx1gPhlvk+U6KhRfXIsADlr9Az1EwDuSsuCBH30W
         dXSg==
X-Forwarded-Encrypted: i=1; AJvYcCUDf49ygAl2s8s2Zu3WfI3G+n6TjnZ2lwTpmdhTy31Ggqu3V31xr7z7lqDjKSTywuiIoRRm4ZtJu/2irywsXRBp@lists.infradead.org
X-Gm-Message-State: AOJu0YycQwOQykCgozGk+x+pWIP3pZOLEP3eLkrYshYGnhEYvwGuAnSF
	IShTTZ0X+4Cwc75iM4P/Sv1iwkDlxkXgy/ACpVaMhmt7C/1OkKDq/jeWFbFthPs=
X-Gm-Gg: ASbGncu4BgjvB/cEQQB11i+jewpyymQH1WOMmScfyaRrU6XcdHVU6Fw3cjGbSnL331s
	KzzWJ6dokmaCJNAziPlUgAejGLrsrvwh+XmADO30TkAXf4DfS/ySs+NEOAtoVmRENYndMXFX1RB
	wpen1UqbvGBgqUpTdGg8JqccbncP4dNaXJ1UzhWjrrCHKPW7rfKC5ckzIJz+EHgaHrSaejs3ykk
	udvShm1XGvBuPd6zVNPFzdevIIrAVYn9Lw7HOK/AvwmvJs4+TUmQWjN+nY2tyz3PlQLJLG4GcTy
	KcgyK7pvDZGnGJ4C6uglOEFQ1zhKNI+L9s+kRcJtj4I9c0bws36ap9X58EA=
X-Google-Smtp-Source: AGHT+IHbfxdly2O1fFQ/MEQQRx0A3uENOeLc1JJa8cSN//BYdEU12hN+C6YPmm2uTekVvJeuxnfO7w==
X-Received: by 2002:a05:6402:2353:b0:5e0:a4ae:d486 with SMTP id 4fb4d7f45d1cf-5f72352ae9cmr2474742a12.7.1745781921729;
        Sun, 27 Apr 2025 12:25:21 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f66b7sm4650196a12.46.2025.04.27.12.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 12:25:21 -0700 (PDT)
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
In-Reply-To: <20250423044153.1288077-4-shin.son@samsung.com>
References: <20250423044153.1288077-1-shin.son@samsung.com>
 <CGME20250423044159epcas2p4a2e844c6ab502d7d5e6e6c18ecc7ee97@epcas2p4.samsung.com>
 <20250423044153.1288077-4-shin.son@samsung.com>
Subject: Re: (subset) [PATCH v2 3/3] arm64: dts: exynosautov920: add cpucl0
 clock DT nodes
Message-Id: <174578192026.47282.1370567375954176035.b4-ty@linaro.org>
Date: Sun, 27 Apr 2025 21:25:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_122523_201927_5DEE4FF9 
X-CRM114-Status: UNSURE (   6.53  )
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


On Wed, 23 Apr 2025 13:41:53 +0900, Shin Son wrote:
> Add cmu_cpucl0 clocks for switch, cluster, and dbg domains respectively.
> 
> 

Applied, thanks!

[3/3] arm64: dts: exynosautov920: add cpucl0 clock DT nodes
      https://git.kernel.org/krzk/linux/c/2a4067c89e4137c477ca6f367e65ace0f2132922

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


