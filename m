Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3415DCD98F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPDHyNrMcgujLZEScT9ZWB7ZjuOqeA69xZgdQn0M0M4=; b=HwCpW/yM6zwL8tne4mZkWp9K4M
	jyH0RQTSH0LkmvLp4+VwZmo4YZRyf9YVN3kCWaxGSBXFzObNsweW8aeQeFe/6lyi8VQgzQ9JETW0a
	7bLaTugv4+4yxtSNAYZfhoj2RYCM5NUT83uvQN36dHhSj4qKjUj2KY5eZavdXyKgJn4X5YL526VJA
	sGpu6PNizaLFMHMJqR5GFBW4jvBCwN2LLql/amm+LDeiWnmSm4EWXJGHpEzTjgew6pdT29A/BF1y/
	xyk5vbpVML0Knc8ZeIkVxSAgsIGLmBcUvomQfdr+VZB7fAp+ITyIEhWHJy6tgo5BBeY8CbdH9GW0k
	WGbvAAFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTfr-000000026rF-0bhz;
	Fri, 19 Jun 2026 07:29:59 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTfn-000000026qO-1bhf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:29:57 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4908b92904fso22668085e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781854193; x=1782458993; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wPDHyNrMcgujLZEScT9ZWB7ZjuOqeA69xZgdQn0M0M4=;
        b=e6MCCajNoxZx9HaQbSvOPnpNxRPH8r9hiDEYulihHFhn2Tu62+3Y6OLTKdhgZPnB+v
         mxJhLEZCP4W3JG5b1vZtVTTbAyQI4JKiXq1MY+nSgdjpGXaiFTfZfp2IKCg775pEwUUE
         ftL/NYv7sTifq3lpenFVO+UbnqQgS4H+ZsCs7vLdkttqibo8VDYLNQyBFxWaEuSsMQz8
         8V9FSlvo5icdxg19GgZnK3AvoxxH5gmSCPjcC22uxeAaMbI63Iz+4vz5VF/oz+r9vejy
         b+x+5Pp041AQqQG1JyekkfSS/53SHqU0ADb3EfUBP1LIPfFEpp1/8tkfvPPYWpctZFT9
         qIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781854193; x=1782458993;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wPDHyNrMcgujLZEScT9ZWB7ZjuOqeA69xZgdQn0M0M4=;
        b=l6VjD8CddQ46bmlHkgozqU4UzolyJQmIxIfeJq9aCOKFDR5UqC9CphNRb1KE/rL1J9
         GkkNrcH2Xf4LZHSmszv36FjhnuRefZqrvrwlGReifmOEEWt/dGtp2nvWynIFAm2TNDs3
         pn5WFlTzniam8AiFrYZsI+fWaCRwVrdbpF953g7qgIBMpKoDsFe7AgdlbceNV6YPyeuQ
         nGutLLwJulDrNLW8STxXHKdvQ46HoaVxAB+u7X1xEheTwrd7qbsDuWnqrPRMzEE1kFzz
         gj60YnxkGGohfhLV6B2NvpXh8KdIsLC7z9yaad7sr/XJ/IKdn+ovGj7twR8BwvewCi7R
         W6aA==
X-Forwarded-Encrypted: i=1; AFNElJ9Tt79Ietca9WNyjBV+Eki6GcKlnAk+V3jtb1wZ4hVpgIYkQqcHlzG0e6VueEMEwwmDjvvJ6ODuL9kzeAK2wvCE@lists.infradead.org
X-Gm-Message-State: AOJu0YzbdqewX1D1TYPU4mSYlSwcDJUGrU9jInV6wytmbXMGWOEIc08N
	Unxk17SVEO2FUOR98Cds7fQOvMlIpdQTfgvioka2Yv27zrY1/DqohTXYR8iSjA6WPqg=
X-Gm-Gg: AfdE7cnS+LmjlMOEcYjrnfY5CA9uUD1Lc+f70jS6HUWQMyHPRGentu/oJ8kyP1Bdduy
	LgYCacfcUgMAfU4UqoC5GC1bdsxCpRn63fVuZZh0wu2m+rBiJwjfBHCn73ec0TAsJQIdcPfaZhC
	vaNPy73CVu6Vs9sJYDOewYkdXs2P2edLFYddXkaRwrkj7dMZdOcUm7dApcyMyZrVfG63vXBtQgn
	EI75SMh0UqVKR64QBUW/lZGvkq1O9ooC2uBAW5vYeisyuiAn2mBHzB4IEzg3pHRjlkDZTf5+y2c
	bk6Va042ks+SjMh6u/Pp4cAzevTfdPiXtqLGufGpNBwiXYh0W2hFivYxFbPMp6KAXA5LO5KdLRq
	mYWb92+rvO+rC4/BItNxKcrjneaxZ0dmByc3gpQyJONxXkC7fCA+EK8+sOlYPeV+JifAWQlaACK
	SBYgWaYeHqFdY=
X-Received: by 2002:a05:600c:46d4:b0:490:b58b:a8ca with SMTP id 5b1f17b1804b1-4924257c483mr21687735e9.27.1781854193037;
        Fri, 19 Jun 2026 00:29:53 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:95ed:eac1:5731:4e21])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4923fd30078sm46219025e9.7.2026.06.19.00.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 00:29:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: jian.hu@amlogic.com,  Neil Armstrong <neil.armstrong@linaro.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Xianwei Zhao
 <xianwei.zhao@amlogic.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] clk: amlogic: Add A9 AO clock controller driver
In-Reply-To: <79b1a519-5723-4e0c-904c-b7fdf9564ee1@gmail.com> (Julian Braha's
	message of "Thu, 18 Jun 2026 19:56:12 +0100")
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
	<20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
	<79b1a519-5723-4e0c-904c-b7fdf9564ee1@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 19 Jun 2026 09:29:50 +0200
Message-ID: <1jbjd7c7ip.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_002955_452795_FB83023E 
X-CRM114-Status: UNSURE (   9.20  )
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

On jeu. 18 juin 2026 at 19:56, Julian Braha <julianbraha@gmail.com> wrote:

> Hi Jian,
>
> On 6/18/26 10:49, Jian Hu via B4 Relay wrote:
>
>> +config COMMON_CLK_A9_AO
>> +	tristate "Amlogic A9 SoC AO clock controller support"
>> +	depends on ARM64 || COMPILE_TEST
>> +	default ARCH_MESON
>> +	select COMMON_CLK_MESON_REGMAP
>> +	select COMMON_CLK_MESON_CLKC_UTILS
>> +	select COMMON_CLK_MESON_DUALDIV
>
> Selecting COMMON_CLK_MESON_REGMAP is unnecessary since you're already
> selecting COMMON_CLK_MESON_DUALDIV here.

No, regmap clock are directly used so this is necessary.
Relying on other module dependencies is not enough

>
> - Julian Braha

-- 
Jerome

