Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E686C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 04:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BED0WVH0ui801+fOhuTnComAdNPJBDfJ7ZYmPTvoYyA=; b=195DmJpUqpCJ1C
	ifLcV76FWfHzDHJKWKJtHTYv/tEf2LqTEt4iit5ivYj3pLCfCUq4v7RcbV4/EI9zUyYrrIacDRHY4
	0ixQJyudaBYPW+tbYDR/5oYPOx6Y+a3PHQGAPM6270YaYmYl1BdaT1cKtdTu8JDj6t24svnqir4uF
	gbgKVb/oYrJeqX6X8dIrJ1H1gxLQQDqHbkjnW9d7idz3DQ7QJBYKcv/oyyd+Iiqt4M4WF3YfVfjq5
	g9JSJAQh5FHioY44E93e11qVwJxlVsGNI+Ep8sBpScDpGAdww1Kido0O4f3P/SwxxnarvjiGmB60Q
	tAOPC9D+Mp+S164UCjKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMJeq-00000009jKF-3HYM;
	Tue, 03 Jun 2025 04:53:52 +0000
Received: from mail-lf1-f44.google.com ([209.85.167.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMJTE-00000009hNH-0oiQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 04:41:53 +0000
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54e7967cf67so6052294e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 21:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748925706; x=1749530506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BED0WVH0ui801+fOhuTnComAdNPJBDfJ7ZYmPTvoYyA=;
        b=m8paDU7JVHLcB9SSTpj56l6eWnypdPcgVaYFyl0PpLibHPfU5hlFJrAJNX6fvqPl+O
         Hh27t+Xi5RlDkFPlN6vjsDdGl+3lS6d5tLDEeekXLePPExAnGnbsppvPxxZQvugcLvTQ
         4JyJppZN5L3GoMcIebFeHXvIwOz5TWnIbENPLb4Yh589N4Ra9FtsTn1CXB5TjLc4ffS4
         hsT/OelFRLWAkQIKMs8shOlzqNsVmDO97A5C+kGNSgkwu6Z4VGyhqyGB8GzG0RNpTqmA
         H9Zh8I1DcWW//kKdDT0j6qgIyB+XzKj/FciN7MuGEYTcILBMmmIk8qpXCzz/UQl9wCYL
         IdlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNr0MXtgWUzBsjR76rugTVIUnD8efwUGL25Zfdrnt7D4K20UIGAd4BJC+z5UbWMpNmP2QVds7+pjxsPPPR3dw0@lists.infradead.org
X-Gm-Message-State: AOJu0Yykdvryx7qZGnaNuK4arQIvpBSjK5GYDWcqURllyti9/cTAjMNK
	IrOBRZvxYvBwBGDjURe+OwBM7i7e8IMnvzj7erHNkZRZV6otbN7e81I+K8qFv6TW33Y=
X-Gm-Gg: ASbGnct3nijDA4wIDQmr+UEIe0fzjul0a+lAdQNtt87mU6XF/h7I8jYAg4ignqyFgOA
	fiBc1NUOr/9ugsvATg+Kry7hHJ6mXXrM8kW6+tnsexztBaeWV9nIKoVyzjCBP5uD1Rl1LcLBIO4
	V2M82ahcIfw4wg96M21MqvDiT+Z/kGmWiQCy41bqRQJ6e4X8to0lzo5A2w+1gcMfvgQI2JSK4qS
	/1kz8RyVZzEDWAQESqTIekjAuW2Wi9cmbqnSgfjcYmE/IpmQSLjpOIsHAUBsTjynz2kp53fiMzs
	c3zZJwq1jOrnJMm75Qz9vwQiIIzigvspneLSClmsw27J+s4+xpIC69Imybalbdpkj+hSH8IUef6
	9q8DNAizD0UGx/vc=
X-Google-Smtp-Source: AGHT+IE+/I1e+sqU9mQA/QmjisyDfwEcTVYpbs+yRrbXo1cMXMzGTgtwEW/vjv7xs74hIIRH0SyYlA==
X-Received: by 2002:a05:6512:39c4:b0:553:2ef3:f72b with SMTP id 2adb3069b0e04-55342f546bdmr3023135e87.3.1748925705973;
        Mon, 02 Jun 2025 21:41:45 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5533787d1aesm1815414e87.16.2025.06.02.21.41.43
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 21:41:44 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55342bca34eso2955241e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 21:41:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXeIOcvz30SnV+RANcRnklDICRTXHdA6KRbKW4xdNoJ1kqyhuSqjERJCSzA1b0mX8TrgkPneVF5Xy45ZohlVGzG@lists.infradead.org
X-Received: by 2002:a2e:bea5:0:b0:32a:8c7a:8350 with SMTP id
 38308e7fff4ca-32a9ea675f3mr36137841fa.30.1748925703708; Mon, 02 Jun 2025
 21:41:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org> <20250602151853.1942521-4-daniel.lezcano@linaro.org>
In-Reply-To: <20250602151853.1942521-4-daniel.lezcano@linaro.org>
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 3 Jun 2025 12:41:31 +0800
X-Gmail-Original-Message-ID: <CAGb2v67qHKVGdNDmg_mbT-bkhAmn=NxQBsRZMtGgpdOGh6Z37w@mail.gmail.com>
X-Gm-Features: AX0GCFsButCX6XOPdUHg9gMIjlAItX_YWWR5mtXZWLyYajpbu0GEJNOaxHVxyxs
Message-ID: <CAGb2v67qHKVGdNDmg_mbT-bkhAmn=NxQBsRZMtGgpdOGh6Z37w@mail.gmail.com>
Subject: Re: [PATCH v1 3/7] clocksource/drivers/sun5i: Add module owner
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Jim Cromie <jim.cromie@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, John Stulz <jstultz@google.com>, 
	Will McVicker <willmcvicker@google.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Saravan Kanna <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_214152_232624_F3BB1254 
X-CRM114-Status: GOOD (  14.25  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jun 2, 2025 at 11:19=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
>
> The conversion to modules requires a correct handling of the module
> refcount in order to prevent to unload it if it is in use. That is
> especially true with the clockevents where there is no function to
> unregister them.
>
> The core time framework correctly handles the module refcount with the
> different clocksource and clockevents if the module owner is set.
>
> Add the module owner to make sure the core framework will prevent
> stupid things happening when the driver will be converted into a
> module.
>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>

