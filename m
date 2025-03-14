Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45548C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 15:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9N6fTM6SFDsTbt/1MZG+/5cRZlKHEghdhbe8yHn1vL0=; b=aQ1ZMKeLU7T7nu9Qo15jBqFmgx
	sRP0YItpYkC0dn9xW3uC1xGML/MhvhhgGFn9JOvXr2IFVN5m6q+mV0qaFoKhIzTuSaPGdhHgDI30Q
	UAcNHkv6c6hryKh2VAdRj+xa1J3QLzdmAvqvGhdoYOfEP6IeLC93qgjtXVHs/gvV25t0Kx+A7Mp6H
	Qk/GlcZXGMo4EG77qzdZNh/h9oSEgzLq6sZTO/ODNUfBbAMj8Ll6HDT9O5cLQzFNmzZwfN/96bzTN
	O5mJM6rZuCXsH8Cxu+MukWANHtvda9K+wBdcG7DVJud+9ReME87tk0lmvu7nawUkt0fR/q20M0qkU
	uDEMa3/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt72z-0000000Ea8u-35qK;
	Fri, 14 Mar 2025 15:34:05 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt71I-0000000EZpt-1chk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 15:32:22 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-39133f709f5so1395192f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 08:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1741966338; x=1742571138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9N6fTM6SFDsTbt/1MZG+/5cRZlKHEghdhbe8yHn1vL0=;
        b=1AKm+Z5aJasGYG17CLovCEPit4wSEh0mDsa6SgtnqoLdPkAqRN6+4fvMV9bMoNCLTI
         zJ0j/CQgjgDPKN19w+ykZggR1HkExu6dbg657g/1r5LgiF/tTE9uMwHyUMvPrEnQuOWT
         6qTs/45d0Nji7HtH0T757TqA9ouOE5aU5yurE3gdjz6gCNJjXYskGB3wFLbcXRZ7SLE3
         Z3mMvTCzyeWyX5Uto4LCNB3FvCFdJAnqX6KrVz9MnMGJHep2HKQXh60v9mC/YtH4BTPQ
         F2NUEElgXBte/CBvfabuM+hiJDpbtojcQeszkIywjbUVZUBp4f7qfIPjxwCpuvFLUbT2
         AyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741966338; x=1742571138;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9N6fTM6SFDsTbt/1MZG+/5cRZlKHEghdhbe8yHn1vL0=;
        b=SY/bZ5i1qPFBWkn2vblUOIa5xMnSUrObVK6bCSNMXNVPk4WUUZLrQUlUHBWQs/Rmfw
         cqG43AEQ/3V1gaU+Lv78a3wkBgDR+FT0+j2vyDU3qWxsPLgb13fec5siz9AFg6D7OFUp
         JE6BAl+PaBGXPzIPoDovJiElxPVtQ2V6zJ7kAh8Eind3xZpMIG5ADbp8B7wQRrXLJIMg
         TsablNqAUjZScduc+XExfOU6HSPLAJRuFg86HL10Wa0bzBXQyKfMq2T/Z2YTXXhwwiaz
         pQfR88pIuJtOPpTtdKUJ+OwIuAYFqgPd5/uWWUTPSSW7ym7UFRF1e1Ds6Z3+PpmfSEvj
         ct8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3l/y35wlb+nsYlVySr5bMjqPl9TXz6WzOWfiVeX8pHy/5jmobSZIoZezzEGgrqDZSjVGn8eXIe2+cQdlYhTEb@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0XNZvaBn409nB5y0jbW8YfP6ZEdmeqDg2MRkLujBcmPOx6c13
	LkKeH0ftInITjWzYnsRofWVYHz0j3jGSWvCWg+b+Wx6NXMKcTNs9k4s8BWlr1iA=
X-Gm-Gg: ASbGnctFZYnQSEDtna4anji/MorP53pk+RJYzdBkmU4ILrhdWAw1BqqnryGG7bTyUH6
	F9B4qjID0sXXS3D1JewZGbIE7JgVDbRsJb69k/81fexJc2GNPd2OeiqNnPCskAOmespN7S9kDP+
	FXZnsf3V7Lfcf6IBaILSrbBDsHwNEMRGtTiGgWItD6VyQuYDmSVonH4ucCPRqPpEp5d+NIEwa5O
	5rMnu+EO5mOazDHP6fSd9RjkJtqlEhQLneULwtSIScBzzfhhGMKOlewJGop1hqjqGu3x9MM4PyS
	zuWfAmmo5kNpbas5b79UNCjb9TJ68UrhOX+9MEDaq/aJH+aY+qJlTTwEPEBy/VEbYzfcaQ==
X-Google-Smtp-Source: AGHT+IElbbi8SqUshMCl/+GUOzbAuMlg/4w/X9x5Rezrz6ar2Vdo2Qvg6tqIZ2ip3uemwQDmNf/X3g==
X-Received: by 2002:a5d:64e3:0:b0:391:2f2f:836 with SMTP id ffacd0b85a97d-3971d336b00mr3512774f8f.17.1741966338308;
        Fri, 14 Mar 2025 08:32:18 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:6eea:2dc0:eafb:9b35])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-395cb318acfsm6036005f8f.70.2025.03.14.08.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:32:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, Jian Hu <jian.hu@amlogic.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20241231062552.2982266-1-jian.hu@amlogic.com>
References: <20241231062552.2982266-1-jian.hu@amlogic.com>
Subject: Re: [PATCH] clk: amlogic: a1: fix a typo
Message-Id: <174196633722.1526311.3272915728848116488.b4-ty@baylibre.com>
Date: Fri, 14 Mar 2025 16:32:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_083220_427936_84B3C051 
X-CRM114-Status: UNSURE (   4.84  )
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

[1/1] clk: amlogic: a1: fix a typo
      https://github.com/BayLibre/clk-meson/commit/b3c221e752c4

Best regards,
--
Jerome


