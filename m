Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B522FD5F87
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 08:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRd+Civy+geLALzWFHgxsIesA9wBU9+u1x5Mut66okY=; b=XPbyEQMhwH6PupdgKmREj+ahdz
	lEtrFUAhKWN1LaOAE+niRotPpj7CLBjKSz9DmFBN7RMZn05i24YQAISxwq8fbni9ke0EXNR2O8amR
	fMep9KrvmvWVlnj7WarNsEHwbDUXaumKgvZuD/eXt3oBi01RG0e3Ti24S0+FSMUdlqaRTUl22rgki
	NBt//ahMVoOM+94Kv0yD8oltvxRW6kl54FjX2hHFgWYt9vl2oNGki+C2rs88YdHBcWE2gF4YEoOJt
	kQMmnH/M5ETdNgMcxAkgYbe311zaCD02pO+MNHlBtWWrSkLNwhvMj6SmZ7WuCjDC1C1KbMD7fcxM5
	392vqseA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAO9C-00000008Vu6-31N2;
	Wed, 08 Apr 2026 08:20:26 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAO99-00000008VtO-1q3R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 08:20:26 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43cff5dafc3so5114024f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 01:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775636421; x=1776241221; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRd+Civy+geLALzWFHgxsIesA9wBU9+u1x5Mut66okY=;
        b=EtwK+rDW5DCVN/WklLdwj2E4Jhvg7zl+uVAUe5eRSpOCXy+8UJ3S4LMKQUNFmmhT/w
         ftlHibTcTJo9jjt5NyHJgKR0Vf4i6UZxwLJAJNbbyWVGbgkwkHGlTQLSnjzUcwQdrAdS
         0E1ECrh+beBjOkBmWPPz0V3UjIwFzjYjPcyRB9lqZwAWUFSY5xb96WsOnC32cSzgy0Cw
         QiNwqvfN4tpXifKBjBRe4pqhm63SQCe7F6XQsUBwxxM0IpszwwwNQPUleR4Epu3A5Xnc
         qdUmyvIQE2CXhr/2KiEWooVkIwK3zDt5VvbVYLnpHbkhuEPUxm+5I07CcWAcEdc5sZz/
         4UNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775636421; x=1776241221;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VRd+Civy+geLALzWFHgxsIesA9wBU9+u1x5Mut66okY=;
        b=dqbdNJo/L7jQrH7S5wdoPS1VCE5W44pCJK/QO4HttOlO10RLIrLjRJGXex0+8RxGnl
         hXK1xMETxhyEmSOQNHHou9yJTISzEUfrpzccDdsV+l18ean94xOOKZYieAvHooc0Zzo+
         o9V797FU7UOfuemgvBFjwveIEQPCagvs3yVaTPaXa8SFHchtaGQ3vp36inIzz1fz7uXu
         RN/wJFV5V6uUv0m3a8Ec90wLTNe0sigKw8hO8v5iwowr5GtQ/aKPkT4FRCQ+x5M4fSYs
         /GlL4qBqLcaXy1zRLTQXIcNvR2vq9Xpn/CsTn1LKERC8dmiu4h6J/nd8fTabEeUwb7B4
         FKTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs3p+3Ap5Yx8i6Comp9X9rE3wCZvQAjwBx1OhrPg9Q4JugmHQadU1xj/Bgux/xU/1feyao7puLHlSw6iONhd2p@lists.infradead.org
X-Gm-Message-State: AOJu0YzNwcERGI2T4gVKwB+pUMzs+OgUMfbv/hBxm7vUXf0FGz7ieFlV
	nAJg5aoJn1dMLfwKEhUKSo1ZQQBS7ZjI63e6+nMLocRobGJ5Yp9UMrLCBGjFUGA2Eesg88Ct1Dt
	Fa0RC
X-Gm-Gg: AeBDietLqFDS+t0FycC0irag81aoXwXMDRL7wfnlYfJKS1cDGTXS4EZFLKXGHhH6iE4
	XyAnOPayIRaYDWbLOMa/3PRjxzVSzlJQl+b8/xQuqvg3J4YqijYGi8l6NpZJmmMw6a2KPwx0bdQ
	jYl5Jh8TwRmigbhg7sJO8Jpmgekm4ecPj4E5iWk9QdlHEHFfuFaAzJozLoztj4PCFBaek4Ia2ho
	YM3ME5DZ7++BzHQX+j8vWvsMfOrnyvkwQNKEhK0MXyAQq6qs5sDwKhzdE5LaZ/1qtLXlZkzV84k
	twPwUkbDchCOHyXKLKHYQnQ8Pcpnw3o7CHOelOxJj1qpArDZTQ8dNdSQaDc/NuprG2Uk3p4/GP7
	GKbOLg5jMxQxfYvIX78H466ExaiBB5HMTCG4zsvYcjOh2F8CkfI/G57oA2qRYj66ZVRau3Xj7ox
	5ZObtPS5KugzhteysKyAPiow==
X-Received: by 2002:a05:6000:18a9:b0:43c:f90b:5663 with SMTP id ffacd0b85a97d-43d292d4753mr27905582f8f.37.1775636420996;
        Wed, 08 Apr 2026 01:20:20 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:6715:3376:7379:78d8])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43d1e2a6f1esm54494851f8f.2.2026.04.08.01.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 01:20:20 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>
Cc: devicetree <devicetree@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Ferass El Hafidi <funderscore@postmarketos.org>
In-Reply-To: <20260326092645.1053261-1-jian.hu@amlogic.com>
References: <20260326092645.1053261-1-jian.hu@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/3] Add the missing mpll3 clock and clock
 controller nodes
Message-Id: <177563641892.1659838.16115307647051827681.b4-ty@b4>
Date: Wed, 08 Apr 2026 10:20:18 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_012023_637442_41E54475 
X-CRM114-Status: UNSURE (   5.92  )
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

Applied to clk-meson (clk-meson-next), thanks!

[1/3] dt-bindings: clock: amlogic: Fix redundant hyphen in "amlogic,t7-gp1--pll" string.
      https://github.com/BayLibre/clk-meson/commit/6d6be1cca2c9
[2/3] dt-bindings: clock: amlogic: t7: Add missing mpll3 parent clock
      https://github.com/BayLibre/clk-meson/commit/87edca62c4f5

Best regards,
--
Jerome


