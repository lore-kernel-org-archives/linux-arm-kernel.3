Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BE01061B22
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 21:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nahCW0+Ro8Vy+N/mWFUvcaNK++QL1eNsUklGbOxkbK8=; b=p/mlZmgQ+hBqiOFIC19b3wUd5o
	hiy7Joh2kGbTJonkxX+AE3GgyJWjN7vg7cV45nUcxgCZErC6A8JsvWkYSuTUq9hgiMk35qY9vSkbF
	+7yWeDp6jb5mtxCQycbXiTVNJyE0Z2MNAF8G8tIrKDtq9kN3t7q+tmmCLZFjEo5lW2aj9ve7AuMc/
	7r3nuZeWtTBA4ESH3RZscV56HMh65M4hLc0IZqtuZ6js2ueShf1B8DNmN9oSH6Og8HP8mrNZ+mLTW
	359l9e0/v+XVn+WbSBMHluNGTYeRskK63F6s3Pu69PavAXvFE0wNO1OhosDQTJ8kBHjS6ALsN3sOH
	2Pf+pvWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KXw-0000000Bvtc-2qBe;
	Mon, 30 Mar 2026 21:53:20 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7KXu-0000000Bvsq-1BBU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 21:53:19 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-827270d50d4so4459364b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 14:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774907597; x=1775512397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nahCW0+Ro8Vy+N/mWFUvcaNK++QL1eNsUklGbOxkbK8=;
        b=vbxbqpDFLZ6s7ZDTbz0ZdIJdV5a2+rg8hroIBvtN/17VysEINClBK4N/UBs9AptVDf
         Z9P3J6SWtewu3obuVhqPAZoS2JgvX58l6wYR7BSc/gXtCsuTN24ztl+C4AZHoAArpc3F
         2Llv8S6GL3LAqFLp512wGUV++0ihX0J3fQu5g/fcJybflFxsdPlOJJqfYfMHKDcjoowP
         8S6aibTjOjcQzvCtU1ZJQ092/DvqFMjFkUtCPwEB0ncULfWUReEySdOXdZr5Dtok/YZm
         glYJ9CTr7zDDl8mKgxlFPpZu8M8pU4j+S/H69mMApmKtmayJauL2YogT8fZ9cmJ/dWLi
         ItLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774907597; x=1775512397;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nahCW0+Ro8Vy+N/mWFUvcaNK++QL1eNsUklGbOxkbK8=;
        b=fqT62SvOlukvAfamgqjX9V1XhU88DSA1I1DYTzrfBR5ezpytz9JOLDCXE0YjN2M9Kf
         iKnZb5HzCpVLSIvAEYWuemFC5I77qmiWPGBhqBzGxmDUKhQ02Hz6u0gpgvi4mcNmcrFW
         cNJtkTh+5q9yMoBihQUw8NZ4uYdNF5VO7FkoDpcq0IZUumpG/uqvTNrP+7yxwRLIz1pS
         iBVWtqIYcRbIgeFvCuokRDmzCTgeAWGOKcF2Iafwz9v6a8ZUvSDBQc5SOF2nx85WrAZN
         a4mA9hHMk4gwf1/kLyxvr8kcAEoZ7r5e2yP8SwfPGB5GeU1gwTooX0L05QKy4Xek3Zb6
         KApg==
X-Gm-Message-State: AOJu0YwiZo5jfRqlzFevofW+Q2wv8M6eNb5s0k+MJLVXomKqjjx/X63a
	WMxWe8J3HKr1J+80vLY4g17gCSdLF93hH/B1/cUu6kQwihmRMst7YMnEVBLEAVrY5OA=
X-Gm-Gg: ATEYQzxaZuY+7hvyAn3Icfr1UDCA19ju//1mawv54G9AFFnm2dv3tYt2ogDbNR7Dp/1
	67GxvoG4q34v3yv79lETLjL3oK++zoZeyuG22YXCiOzxvkuNX06CeP+S7d7P6MlARWH3edVKNz9
	W8o6ERHTxX5RCoa7ju8EXrCIMt5KANhv51TQWw4BHSzMvwl1k0JehpHRqrWUe1Xf8gULlLB5jHd
	JEkuA0VjChDCfN2UkwrTHbMR5hUh4NQlTozmsKQ7CN+4SRPD0UTEAuwEALECzO2EzeYXzEpV6yW
	g8vs9MSolA2sVeeCdw1dv+OE2BkNEn1xx/WWllygDzS0v/OMJlkP9WKRCVbTSp1AsdQCvPmJLSe
	jb2Mjk0T3EIDLVmd6NlCFD1xZC7DgVPArprsmXpAZKXgR7ffmNFnGda195PvkBGt/jgMoYo9Sr0
	OT/4NBLl8NAuhT2yzc2io=
X-Received: by 2002:a05:6a00:cce:b0:82c:d8c4:35d with SMTP id d2e1a72fcca58-82cd8c40707mr536001b3a.14.1774907597268;
        Mon, 30 Mar 2026 14:53:17 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca846e08dsm8289266b3a.24.2026.03.30.14.53.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:53:16 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, 
 Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <aca7HnXZ-aCSJPW7@darkstar.musicnaut.iki.fi>
References: <aca7HnXZ-aCSJPW7@darkstar.musicnaut.iki.fi>
Subject: Re: [PATCH] ARM: OMAP1: Fix DEBUG_LL and earlyprintk on OMAP16XX
Message-Id: <177490759624.2030917.6444864958465208539.b4-ty@baylibre.com>
Date: Mon, 30 Mar 2026 14:53:16 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_145318_328862_D1ED862E 
X-CRM114-Status: UNSURE (   8.80  )
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


On Fri, 27 Mar 2026 19:15:10 +0200, Aaro Koskinen wrote:
> On OMAP16XX, the UART enable bit shifts are written instead of the actual
> bits. This breaks the boot when DEBUG_LL and earlyprintk is enabled;
> the UART gets disabled and some random bits get enabled. Fix that.

Applied, thanks!

[1/1] ARM: OMAP1: Fix DEBUG_LL and earlyprintk on OMAP16XX
      commit: 7e74b606dd39c46d4378d6f6563f560a00ab8694

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


