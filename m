Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD766CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 08:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Czcihnqa+RdFrhOYT/oFUcxYUUGz6vVNGz6e5p2QTY=; b=tlWVTgu7b8B5AmzJznYUq0/UmI
	X9KoeEp+mBNoEcIaN1qxg3xagIxIF8u7ike2z56B1sDiRFbFuQQbs3nWfsZxvKn3Q1yfGy4/APIs3
	zXFPVU8erKcTppWfdG4dbep22Pk8p/HcDhCsHSAEIh/ZtzJfT0a9hEPe1ZeZjKqnF/AB3yf3tf8wT
	e+dD0PvK9QzV7+sq7ZfWxRRApwYCf+UeEHkUEJrkn4W0ggMWdCHNAd442odO51PSsFdzV+MBQq0zk
	Fdl8NmZdymPjERjZ01+K74U+u0GqaLFAznJRjM24hgToM+dCYbwq8jiAXT86gSAGUgV+s/ckFF2QY
	Vr9t4suQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTn5-00000001z3w-1G5P;
	Wed, 22 Oct 2025 08:01:51 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBTn2-00000001z1w-0kT1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 08:01:49 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-33d28dbced5so5643200a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 01:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761120107; x=1761724907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Czcihnqa+RdFrhOYT/oFUcxYUUGz6vVNGz6e5p2QTY=;
        b=CoYxVR35C7xJrw+5fBvlvW7VSX1FKI6datoSQlmXjDhIinEV3tY4+Dh6AtnuLX6tcy
         kTFVJSa13JAvj1Jl0CxFFENvHl9Y4U6KchDlOSUK4TwNXnlZnfCHjFYGSbFfJ2VxVeT9
         OTtyy02wcQaQ1YufwYAiZdJjBj7mLKu5LAvXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761120107; x=1761724907;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Czcihnqa+RdFrhOYT/oFUcxYUUGz6vVNGz6e5p2QTY=;
        b=mm1uOZwvn4zsTvTecm+i0MvIVSQ6dfDDnx4XmJKF6FYgiH1NnPNZPc4tf/Yt4mKzU1
         TbsgMY76AySeNkIiNPUPgvIet5I8dZmmme9qzGa3naa8CZd0bKbqTGd4jsW99FV9fEC6
         Gl14ycl4xCsd1+GMqS6RisFRMJj8D6trW/LMy6eKWz6xq/B4Vpvspa1CgvrOwDsZgzHB
         aTQqP4/w3nr8gt17sJuiP/NRmFbImlBdb67HeUplI6yiXFx4lBC46MDkTKLHb5LWsqDv
         MUOmWxsR+D4JZoqYmF8HKeVK8xlX0zNaUhtrYuFEoid16u8x3CUrXGqMlTekOXEbPUaz
         XSog==
X-Forwarded-Encrypted: i=1; AJvYcCVgESerptItVyNXOzn+J11XcTRpxZSNOTYbMdh2/JLrdcb/ASBRSDGTU0yXQN+SYIq/1jCCt7xD8H4nLc8bNjxb@lists.infradead.org
X-Gm-Message-State: AOJu0YyBwaM7PWaV1LApmOLTSRom/HpZfK9Wlg8b8KwMVV0mpFLRXut6
	yQZdUMlPRKnZkXu9AB03mgHWHTXzaO1bd1pemjKbaXMilErFQqYB2jvkTPEQCd0XGw==
X-Gm-Gg: ASbGnctoC39PUwQbaHe1hG3bQTmdBYJXGVSQRIuZs4+b+iSuPXmSfON6qRNDmy6J/Dy
	pasSdBB134YDXmc4MQb5iOefqjQPy75HdTPLwgD4BSEIjxyQWR+eeM96mpGoqRSh7zY3/UY4/KD
	5cjAikkAPdoo5jU+wOTrvGmpPausnzGUQ/7IorYqPqUyNMQwFzJ5RtRkeDPhpVNsq5dn1qW94z/
	xWPXLYmcwqaY+sG8MREBWHD3NyrpzeKdC8BY3ceoEUPolOQKr9l+ASSZhWtxUhULlF+E6gFRyp+
	GuGsZ+ymU3c0Ivs3O8JDdwEhTrK7/YzkUrwQ2JoeBQNWe67OEjHsaWXc39B0ulP77exTox6xdYk
	XJqW2pbJwI/egElnp9TnlilPXb+9B8wmBF2uR0BvHntcV/xwQSr+Dgby3/Z/2wcig8Q+OFTotV6
	ZOMBLGo3A//QMTMyxAmmBlomC7F5au9QoXXg8/EuAUMQPr/ZZsoODG
X-Google-Smtp-Source: AGHT+IEt15ezmGTqR4A8CJGFXTvCgrS4gO8P9rtkeOmGm46bHNcAFHWrZsKB4y1EeUubGMyQT47cig==
X-Received: by 2002:a17:90b:1dcb:b0:33b:b033:d7e5 with SMTP id 98e67ed59e1d1-33bcf9186f0mr29084769a91.35.1761120106936;
        Wed, 22 Oct 2025 01:01:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:5534:56e9:528e:f9b4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223dfaacsm1771401a91.10.2025.10.22.01.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 01:01:46 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
X-Google-Original-From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251020045603.2573544-1-wens@kernel.org>
References: <20251020045603.2573544-1-wens@kernel.org>
Subject: Re: [PATCH resend] MAINTAINERS: Update Chen-Yu's email address
Message-Id: <176112010476.488381.11368848750305962943.b4-ty@kernel.org>
Date: Wed, 22 Oct 2025 16:01:44 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_010148_221874_C3F900AD 
X-CRM114-Status: UNSURE (   7.57  )
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


On Mon, 20 Oct 2025 12:56:02 +0800, Chen-Yu Tsai wrote:
> The email forwarder I'm using has run into severe problems with Gmail
> lately. Switch over to my kernel.org address for kernel development.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: Update Chen-Yu's email address
      commit: caa2f6ee91d4e2dab39b30de34d2c74b6f45d0a3

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


