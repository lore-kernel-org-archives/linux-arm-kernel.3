Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D761C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 08:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIkRard6W+E126nlrFH68FBbJJING0uBmwMIZSswXsA=; b=ko2QncOrpm69D74ZHTaPcIic+p
	ZtVj/b/0KppIt4CL39knoPARqESYHS5+4wLQg4C1rD3plOtMtUC/3mMbI2V/WUaTJYokyxJZ5B+Ib
	pKnjz0+zQLJOvhBPV7jX2v13RuQITLSUsXs7uWEpJDgIDo/qpExwmyD4aNqPlEJnDOaiXl2sRqpzp
	nUrK69trtS2iLu5SsOCOlLkNlXXFs43sJZCfT69tZ5kTvXRLRxE7p9frIPF6C7UhqDBTBo7TStDLa
	US7WBuxTKUcvejItb5vGmqyPdzaLsfC4Wjv++cnAjn2VFjlfI8zNGGCzwLme12xLeG15F8aqYbAyk
	5AdYPXuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucg1x-0000000Bxjo-2EQ8;
	Fri, 18 Jul 2025 08:01:21 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucfxK-0000000BwZh-12Cu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 07:56:35 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so1267833f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 00:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752825393; x=1753430193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yIkRard6W+E126nlrFH68FBbJJING0uBmwMIZSswXsA=;
        b=ESsFpS+gfaJ7LYwX2UJrgLRCdvwdIJBni/LoQDwflaHPRze5RRMhg7CirBYVxisl8i
         BLi7i1KFwn2n/f7xdCkCTNcRTCwbmSbru3pjMTHTAMlibiWmqlnzn0+xTdtrUq4MVu5V
         Hjuy4hG+Yx5ONAxuGYutUnRO26lhuE8D3BytdBntAqsCdTXv22QwO5VNu/K6CnzV0Hot
         KBhNXFKYaHu7RMV7Kshz48le+DPA5OCi/M+JfvyauayA5ZEuQkJJ+7x5jLe3GeWKL2Jl
         d7HVV63f0fMYdlyUg2ckOsWcORx7SIZ8QM9GVnK/P12GwHKeS/0JG7j/OlWSj8Se+HDc
         ZjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825393; x=1753430193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yIkRard6W+E126nlrFH68FBbJJING0uBmwMIZSswXsA=;
        b=mkT7fnd2JLPgB2LvRuRa3rW9Ip2b89OmbFaohkFAHyQoYkPl/044SqwKz7deTWX5e7
         hiOJOpmQmuLyejpVVnXjkHUlDyv+kxc0SYRcU0/7165foQ9YfpmAk3u8aEJ92g1imJTb
         8dw4NXZw5OSMbuNmFcMtOu8ggBnNFHcphEdUmwZd222OFCk9uajfVdmRjQYnrfVecJwv
         bSiZHxYliVXvz0yna62J/Y/806Bnc1vMsmmgRKBCMCkX1A7cFKDMgufziOb0dK8LQ4+I
         3ymvCvjNfro0LzeaABJQArJxF1eB0V9tgH5JmrNCyJcbm0urUr3SKkq+yBaDcoAuLcnI
         fEZw==
X-Forwarded-Encrypted: i=1; AJvYcCW4AABclgc48b4gaB44fmtmXkozt+SYHQ3Lcure1AkPdPH43ZKVdlRhmzrZuP1y5mNsRYA1BbNnmEKMI2ScsdrR@lists.infradead.org
X-Gm-Message-State: AOJu0YygNSSiuVCKV9FP6bneD5lSsyJVGarh67B9gWHXRozjnMwJmtY4
	8IOTDc/sRB7UNqPzeQ0BFknMxKutlGBiwOY7+BVOEtQCqfbIu2kRd3gpFOiblbvQqiI=
X-Gm-Gg: ASbGnctCFwRdFVYOWEyhMlNqZxarq4jRC2sCsfFLKyzoEm/vRxRdqwA5A9zBMaswVUc
	DEiVcj6hJTFUfvDgFc77Y7J9+yeSRMeKUP9YbOjna6ZiY6vBQL0WOIHhztTItsV6y8Mb3QNshBn
	gVWpe+0cQrvTt5sv4R3OweeOytTy7VnCv7PlUJazmsSykO4k6ti77sRoNid1yCxo+iLUvJBOdKA
	JxBaZWp2oMATe5HjnfYJ1F//N0eHEaTk93OLYaqQTMDGZtH5FVOG1eYcC1wYAde1tmDoXN0efeQ
	bxnWpHdyOy2oASVN4EVtUIfblDgNJbD3+K6GgK9kmV+P+j8uyOtrhW1NFq0NRAuBytWJGqSOMi1
	Oi4UQp7yNn2iftRz3zT2w
X-Google-Smtp-Source: AGHT+IFR7z0xrtW7kV+L/PWsVn19Mve34KO13llGmq0De9UTBvi6IEowVSVAnjHLfBTTi45HhGu+EQ==
X-Received: by 2002:a05:6000:1a85:b0:3a4:ef36:1f4d with SMTP id ffacd0b85a97d-3b60e4f2c6amr7520566f8f.38.1752825392621;
        Fri, 18 Jul 2025 00:56:32 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:be63:a233:df8:a223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48a23sm1080851f8f.54.2025.07.18.00.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:56:32 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Lee Jones <lee@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] dt-bindings: gpio: Create a trivial GPIO schema
Date: Fri, 18 Jul 2025 09:56:01 +0200
Message-ID: <175282531516.45055.8482528409833116992.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714201959.2983482-1-robh@kernel.org>
References: <20250714201959.2983482-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_005634_305195_C8B15EDB 
X-CRM114-Status: GOOD (  11.20  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Jul 2025 15:19:51 -0500, Rob Herring (Arm) wrote:
> Many simple GPIO controllers without interrupt capability have the same
> schema other than their compatible value. Combine all these bindings
> into a single schema. The criteria to be included here is must use 2
> cells, have no interrupt capability, have 0 or 1 "reg" entries, and
> have no other resources (like clocks).
> 
> Note that "ngpios" is now allowed in some cases it wasn't before and
> constraints on it have been dropped.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: Create a trivial GPIO schema
      https://git.kernel.org/brgl/linux/c/2ace85b5bbd065a4e037970154854dc2b41d7b31

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

