Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A47C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 11:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Od3wbNXS9rJBhW02utE5o2yh9IgRySqZm0ekh3uR4Ts=; b=o0QuHGTfNBYewUIxwbgvrIv/5R
	B0by7i2lgKDpKg97sxU3DHSINsqIKfZQ/Wb5GQBqoif5WUKIY1YAhbzc6lrQu/CIxlCUJdqz8589h
	DnfbGZmVsa1RUgrYnyoUzRHRlMT0SZet9JY3vqy6p5bTFFm2GkWLqT6dpF2AxXhypenpFUrMg+BBP
	aPSZ5QADOLbnAlhqAYVYQP4EpyxziG3H7z4z8xjbR1k2Zrcg04AQ7YXMx9TmhMyMd2/kNhN2M9puE
	8eh1Jt9MmksxH6gH8t9sXuaOBRmH+ve2PlUd/TNFkZy5S4yxh4lzgS9qy8kpFbdzyMazUxBx1dx6d
	Bi4e0qRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuq5W-00000002ah3-3G3i;
	Fri, 14 Aug 2026 11:28:38 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuq5U-00000002ag7-0HzC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 11:28:37 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4815b8781c7so402397f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 04:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786706914; x=1787311714; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Od3wbNXS9rJBhW02utE5o2yh9IgRySqZm0ekh3uR4Ts=;
        b=WuL07T+oPfta8y6TkD1xsp/hbh2N86ic/NmLaf4emG+k6HIRqiW6q7WeNMSwQUZ1ns
         wCvEc9FkhQxnwXM7Uj7X3asQIIoprIkuFay9tGxdxJp2uPHIpA2GV87ZXjA7nqcVnVWn
         At4lf3dhqs752a54NRZU/EeC57f3XKuEIh1c7Ky6K+HsR2XAk1BiQ0GWapxd8887MQ5O
         ZNa0LlxkU8+QxZuDvEi0Kh+Lum+Poxxe4EYwwnwNUwc6UkPuld/T0ys7QOdS+ePxKdoa
         TjL8QRrQFtyNysUWwoErxi66O25dCMAgS1py793DHaR1MsNtGGeBgT+8VsBRpaQr/4jV
         h7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786706914; x=1787311714;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Od3wbNXS9rJBhW02utE5o2yh9IgRySqZm0ekh3uR4Ts=;
        b=FpwCtWht4bSS7+0rJ04OYI3d+0ZcnY0TBDFJWzc5F3eeC5CY/PcKegjiDSsyfKJSNJ
         MtJWKmza/t/DMEz9WoUW53PBwvvc4n/UQqsOc8R0HOcv6P3pFXekE26p7SUIG0Jjek2e
         dvJ+vbXvekiXfa6Ytp/DSUB6JqfhD1+7myTg5I5Qtcnvd9S0hicZiOG6EV+AMpVBdYPJ
         vAL5ct+qWIXiZcbsTyRW22gC267hzNJzca0/ewZVJ9HrnVj4v++7Yau2HF2cpI5nJyto
         ipz5Ai1Iy9TcQayEUtLEk1fuAGOcCj3URdSqJuyQiVmV96nD/GI18uIzPF20sGDX2xMK
         oXvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7bPu4NWszR4f61wvrALHKtCyApXiJtZV7oe0bfpsK49zMH2JqRE1FJlhlySkEiXZZQc2xdLG0S7uXRgEZFaDH@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5bY6FN4Gj/W1kEo0BBzrqIBliHXSquDMSt7our1ZUMoUg6RWC
	tRmOI+eeYyycTAs2o4oQ7DyrMJQQCoDk/z4w04M26mxC/PphK89mopeMalbc+IzsKtU=
X-Gm-Gg: AR+sD10TyQglis+I2Ch6oR6Q+Z0exhJg6G1v8JD6P6zU/1xnAc64Q1doFQE4ONQZPqq
	teRM6H4pGjBw9ppWgsZP/uQRZ6O2Oy8XLFMkXTvAYhouKIY2GCVNUsvSUJHMuG9TRx3Lxk/gdWj
	bmrCrFHpIUApTYVdH+9HAKIYB3gm88UNHOb5PtSkAd46VhVE4Nx654dFKJscjW9me4CzH/QmHQh
	m/cqPyZXpFe2SYLY7sZAvrW/YXRykaxBq8l8MJ+EbPaVqQe3Ilfz+voorlewQQvm14EXuqP6mp1
	NXenXA+VYwPBRPKREbIYxtIpaqiDWXNvyOaeu8FAh7psr5Ta5xNIaf1CChlD68DywVM5Q/9UbDs
	0j03CA/ex1kySNg5D+Gn1M7UAV0ddOey754onFkCdXUhmr7DzSGkY88/2+b8whUwMKT2FPqAoaw
	QyOsSc9mezkHeGPZpc5BogMHGIGoWprKBJ+ijeyFQ6eo3vgl436PlVh7zlXmI=
X-Received: by 2002:a05:600c:4708:b0:495:6396:8b67 with SMTP id 5b1f17b1804b1-499879419bdmr54955745e9.4.1786706914115;
        Fri, 14 Aug 2026 04:28:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:9886:6a22:ee2a:d5e1])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-499899753ccsm24626765e9.0.2026.08.14.04.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 04:28:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: meson: meson-card-utils: Drop redundant probe
 error messages
In-Reply-To: <20260814094211.25151-2-phucduc.bui@gmail.com> (phucduc bui's
	message of "Fri, 14 Aug 2026 16:42:11 +0700")
References: <20260814094211.25151-1-phucduc.bui@gmail.com>
	<20260814094211.25151-2-phucduc.bui@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 14 Aug 2026 13:28:32 +0200
Message-ID: <1jzeyplz4v.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_042836_111738_C1FDDA88 
X-CRM114-Status: UNSURE (   9.14  )
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

On lun. 14 janv. 2008 at 11:42, phucduc.bui@gmail.com wrote:

> From: bui duc phuc <phucduc.bui@gmail.com>
>
> The functions called here don't log the error themselves, but the
> error is already reported deeper in the call chain, so the dev_err()
> calls are redundant and can be removed.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

