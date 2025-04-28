Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1429C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 06:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+ortHNrfOvVi3JtuuibxSl/bmwTJ5xWjzQLpGiIwY0=; b=iTLJKMcGGvHmjISf7hgK9bezgj
	5idRq6ZJDH2YQvuW2dRkFqfER532z8cOMLWGWi0Y7GaQP7K9W4R91hrKX+6oywHJMkYbLaBk700Q+
	4nDT3RxZGlxS5YZTDwHOLqgdpI38NHoxnXsHm8R3erht3sn/EZE2NEHEUW7WiH657ZIDqhYlw+MbF
	lYI92YuiXMS6rKTcc8K0dlQzOiLfy2sWHvADnhhA2jg2klJMguu0kVmJwN86kf+k+8jn8X14G5Dmq
	EXQbJdWjMvwMWz+HEClvv5Oi7Gsr6bJAvPnHA0uvFQsisM8HVJdV4iYFx51AF/Wd2hDUPdSBQ2wQ+
	r7FyjKNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9ISs-00000005Aip-0lso;
	Mon, 28 Apr 2025 06:59:42 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IQs-00000005APF-0kzb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 06:57:41 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5f6f86580ecso555190a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Apr 2025 23:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745823456; x=1746428256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+ortHNrfOvVi3JtuuibxSl/bmwTJ5xWjzQLpGiIwY0=;
        b=mn1kQwEdsE5dO7Z00ZB86vkg/ohILKxkE1Bqs56VJyGnJvBqLV8aqdmoUuwp2mCF8l
         7BpIpgvtFCfZ8Bxr1jMeB2kojTa6ocFVHGlF975UNndmSLWMzfJie29r/+rtc12UGwFS
         DW1MXGm5JE3b1M8rqSavaenq8Ej/fEwxc6A2Rq8MtDTh90EIKr7W6xvE3RblciAuR/dN
         7EJv1w88asHKAwwzu7BwHPLGWyfe1RbR5n8hQCeOOXOCuDWJB5plnoNucm6QQZs4lI0N
         T3o97+WWmQuicJFfwHc/8vmoQOxVOKeUxwv19jSTAgx74XHaoYTZhBO0d9EYTt8UqwG+
         0PmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745823456; x=1746428256;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+ortHNrfOvVi3JtuuibxSl/bmwTJ5xWjzQLpGiIwY0=;
        b=KzOILK3MeIt6P5dMhfiZwhSYEJxo/8uLA0oPLgdob3cl/RO93oPogbyV7MODweKOFj
         7hzoIP+B/9WkciIdHtNeonCWJEAgZUs07BzuHRUkkT7A3LxnROHfDb8bWsP7ohvGqzoP
         bMNMGZPQ+3EdLZRq3aPREF9qyaz2yKReQNlsWO0g/64sbWgjLlDTB/605Q1wjjod+9pj
         3gPpOtDiLn92tlZdduN+b4X3SVkuvwcPlyl8YIecQIxbBKpOF0MbHFNK7OAT4mWYbsl9
         nYRbupk4eFRSC954u7hKhr0JFLdAk0/DODR/a01QcPQMMDW7JnKvGqWGA0uVuYyKWViW
         O7pQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ5Tu5VQF4DwVRAwHDDCt25ihKcBmiNK/SHUlr0GZ7ww2Nf1bHpcx8YurInu2RITGeEMpR79xiJMxaRTbDbQdA@lists.infradead.org
X-Gm-Message-State: AOJu0YwyuXptDa1/6gvCR5r9aDki9IbbD6AvMLVwWsasYMu5ceJkvVgj
	RdrFPcNt1taEzJSN8QH+YMz6+4F9x26D4HEOAQGmWKKTgS5riquF7jErjiK22eg=
X-Gm-Gg: ASbGncsOihDLK7qo62Wg+PahPPDEfJBqYjKwNaf+pbtLKABNo5+TEVaxEXeueObNKP0
	wHJm97yJBzkyPZv1zfZSDO97sVuIWC5+KJcCbvlOoJ+lX51uMlAyQ6yc7tVygPC38Wj3oTt+BDC
	BHFvIz2Ggd5fUYf+WOAToE2bgi/q2YN4VHCQt1fe2Ok/8kf3LwzugWEySfIhgm2JM/3sq3jD23P
	jjnV5Ft2KIxTcKWQ+BnXUFpsgVZU6CcbQRauobEjISe1dWbx7BtHPL+djQcC5RUI3etakH+Hggl
	qbeU2Zi2ZGmIC1a5LuywU1Z/Yfu0bX48bXsPLA/rbGwPsqHEo27+ii/i+Pk=
X-Google-Smtp-Source: AGHT+IGPXwdKcilrH0EaY87ltjYS5IfxJmMxGOJymVoJWkuZjfIeQ+m0X5W+e8qJFuxvTNyVzNvW2g==
X-Received: by 2002:a17:907:2d94:b0:ac7:2aa0:309b with SMTP id a640c23a62f3a-ace7102a77emr346405166b.1.1745823456326;
        Sun, 27 Apr 2025 23:57:36 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41b2fcsm569109166b.26.2025.04.27.23.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 23:57:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20250425-apc_paper_binding-v5-0-3aef49e97332@gmail.com>
References: <20250425-apc_paper_binding-v5-0-3aef49e97332@gmail.com>
Subject: Re: [PATCH v5 0/2] ARM: vt8500: Add VIA APC Rock/Paper board
Message-Id: <174582345507.19754.6996971204397782519.b4-ty@linaro.org>
Date: Mon, 28 Apr 2025 08:57:35 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_235738_237526_8E9B8CAA 
X-CRM114-Status: UNSURE (   9.91  )
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


On Fri, 25 Apr 2025 19:02:21 +0400, Alexey Charkov wrote:
> Add binding and DTS for the WM8950 based VIA APC Rock board. Paper
> is the same board for all intents and purposes, so reflect it only
> in the binding description.
> 
> Split the series from v1 into several chunks by topic so as not to
> spam all the subsystems with unrelated changes, per Rob's suggestion
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
      https://git.kernel.org/krzk/linux-dt/c/5ff150fc3755516937e7b1747722687ad4f75eae
[2/2] ARM: dts: vt8500: Add VIA APC Rock/Paper board
      https://git.kernel.org/krzk/linux-dt/c/927e1b7ac361fa1a76fb29caa21853c9d8ba315a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


