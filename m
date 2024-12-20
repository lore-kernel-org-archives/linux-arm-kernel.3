Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD75E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAGVHkBAv4DKPBWXbvZEL50b7QWLDGXfPoabj2FSbxY=; b=YnRMEkHqpSdpVQ+iRyo7U0Z7ho
	i1eD+DX4MS/5NfJZMGidUZ4a0vNSCWzucZa+J+fc5uVne4oCr1xt7/Sg5nhZ99h5Swkd6mSfkLTmI
	O2ws/QzzDPCMXUKlhwm7wMlPGvpzsJctvC0t0c6P1GZdjHy/qGOd2wVZo4zmesjD7muUr4rQ4mANM
	t3gtrgda9b7DY4e2n9C+a4dUehMkRf6RC3KmIuFVO8ZHPw3Y8oBDgCA+3pz9/TIIh/ZA26yCK8WIc
	QTKhlBDjQ7nbf64Fd0WJeJofVJRIr/2r/+I+a2GfkqxS4i8OoyR94tYdzNLZoGEu0AUwItzu4aU8a
	ddD0YbDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZHi-00000004Q8G-1rmJ;
	Fri, 20 Dec 2024 09:27:02 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZEg-00000004Piu-11nT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 09:23:57 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso11546775e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 01:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734686631; x=1735291431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sAGVHkBAv4DKPBWXbvZEL50b7QWLDGXfPoabj2FSbxY=;
        b=nN+1O8SFGS8wXVJekP0EKKqaczXoWIEDenzwG9oFCK5PMxTDIqZSq1e4TxTor1lT+3
         m7kcVWhnHmTH5HLSd8PZB5Z5NlesOJymUTPswokdUi5/htIQwElEfGVdYqoZt2TD/cwf
         jofs77c1UcZmrmBWllp4HLCwj9doxxd+aUZpox+aihbYpvfpSlnMHivNklm91RaOoUVH
         Fl3ofcLApwv7eDEfG2PGiCtM1qxxOFLl8xK9cZuv9T3RaTR9aJudZ3Sky4hBiAqvgEx5
         vVK1WNhFc8+jyzFnLfXa8/PlwWTn6IaucAoVm005U/A9fjPJn5gPrlRJFQjypBV3ke3Y
         Gu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734686631; x=1735291431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sAGVHkBAv4DKPBWXbvZEL50b7QWLDGXfPoabj2FSbxY=;
        b=fv2kuj7GJiqgTKh7kkylyY6NcdAYjvTmDnNA7LVw3v0GjgWaTC4AIAezeDZR6ucy9X
         p8Is/SZ52EL2iMElkjA5FUnxcxrGThTPQT1BpjyMIOqFFggUJ7UKEr8/uqP3BYtHOg/r
         trNab4UTUV8swtXEzmoU974IAcNPInkS1USlxZmVhIi6FTGCPw7PyGQYlhCGcWWleAn1
         rLqiuUX2VI+eKpWabyzVCcWWXy+J/083pLFkZWA4myczf3UFxDsbHZ0pwTd6FsJHsfKp
         IX0FaLN6YB5r/+ozsVfZIEiY2sdXZnT9fZHauoslwG2ByMweOdn+Fx9Ahuw7KydcF3Vc
         kB6g==
X-Forwarded-Encrypted: i=1; AJvYcCW1CAoX1RQkmoAjUICS00DtXIYzWi/cHI5nDl4u0qUmTzJ4WbmiPW+ZCgXO9bPMPsyM49k4DO+plp6b62cHzzPb@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxyzm4pGUyzKNdFzDB3J0YKwF8u6wV7yCwO7NEKKEV+G8kHAo0
	xXdNL8HxPSOiF4Aays3o+7Z30u80wSByuWwp0Mb9+JDen13FpuWZv71HG0BLt80=
X-Gm-Gg: ASbGnctmrAyqnMTY/5hfW2HEJWYnXtqO+UmJiw2GIhpEzSzQJwIMRbdetubwsukxLgI
	xVSMDqJ1R0fNCFapZeqfCYt35APHWPBJUHDQPVQlsjArE4vl0XCLWBHonq2FsIZpLZ9WbVtDj37
	8vlxsLegeQw7xKzMHRF2AvFrPcuMMsMvwN9B1XEUxKl4imXQktwXzvlHaw8LLv2Gf5fsF6Bsz+m
	lUg77U1BdTWWplqB1r9Fz6vyB5HZrfsacMXTXmgmQhkZmY6Xwp6IMkA964=
X-Google-Smtp-Source: AGHT+IHWOjD/ySetVcGFfENJkiWJiFBUr1+JfvjdK6eG9oGbSiFLzshOfEXMASqPgSzH7pcRRzPmsA==
X-Received: by 2002:a05:6000:481d:b0:388:da2a:e48 with SMTP id ffacd0b85a97d-38a221fb99bmr1646750f8f.23.1734686629442;
        Fri, 20 Dec 2024 01:23:49 -0800 (PST)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c828f8fsm3538787f8f.12.2024.12.20.01.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 01:23:49 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: amlogic: g12b: fix cluster A parent data
Date: Fri, 20 Dec 2024 10:23:38 +0100
Message-ID: <173468657763.2759236.18371740322790756565.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241213-amlogic-clk-g12a-cpua-parent-fix-v1-1-d8c0f41865fe@baylibre.com>
References: <20241213-amlogic-clk-g12a-cpua-parent-fix-v1-1-d8c0f41865fe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_012354_275371_077A9AE8 
X-CRM114-Status: UNSURE (   5.73  )
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

[1/1] clk: amlogic: g12b: fix cluster A parent data
      https://github.com/BayLibre/clk-meson/commit/1909d0d351ed

Best regards,
--
Jerome

