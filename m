Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B25C43327
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 05:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O6xbzpfwgYUtwGh6OVTjg0pM5p2w7pTevIQ6kY/2ozs=; b=NGh+NmKziVy6iLmdvjqL8vP6iW
	6/e8ReN0qsJL0gNqoXVJlQbap6IgojOp5zXiLmVEMa3j083876iKxKjarPQUzixVSJZY1YMWpYL5+
	yFp+jmwN+x11nWZEF2ZIT7n0nudzRxj3DIgrmjdluHTQcTfSUzuSG9IS+ydQJDUCyBL/D0wof0FCz
	U7r/qGjujHcp99lUiTFgFwgJScmVOrhtuclYJ0x9qt6rSuT3VJOvPN245/sATo169sVNy8GerMhx1
	Ydo68coMsVaKZzMprSZd/Gtv/SkZMQbhOd2gVbqfFWfKJ+CgUneSD3OtB2xY8zYzCLouZubC36xE6
	UYd2pNPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wenoa-00000000hfG-0Til;
	Wed, 01 Jul 2026 05:48:52 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wenoY-00000000heq-1cTi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 05:48:51 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-664cb440f9eso288379d50.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 22:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782884929; x=1783489729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6xbzpfwgYUtwGh6OVTjg0pM5p2w7pTevIQ6kY/2ozs=;
        b=qWsqojBKY9XAp9fvJZ//IlAjpZglIRnzYjEzH3fI+zhAO3zIVpZjCUUwtttIPR9h8d
         tUsqMxLLZgsCqgLJxJPwrtzi68tHJMLFWSocrYNPxd9Nundv1EOuHPs15D7SRXY77KVd
         UKsjefdqUJqBALhw5gMhkNChkcc3ZyRfL49IMhL9WgMmd+Az/So2H6gIVV7ww09ywNxy
         GjBFRO0Gjdn9qs4NkiqOMdv/Ddpw7SlKfiruizMgn3TDEgE1q7G4LjBZbnJheH5JAeGE
         t7dmQNinXQk3F1haI6iGl84gJUyAwPMD3OZ0S1eVgAlf6WuU0Ow9HpBvlQ4OkniF8D/W
         tISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782884929; x=1783489729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O6xbzpfwgYUtwGh6OVTjg0pM5p2w7pTevIQ6kY/2ozs=;
        b=V5dPAiqFsOYWv6+O+xjDXaOpxICNuhGUtBLTppt8zS90vVpST6/3Ud5MYevegCaTyO
         LEovRobSNj0O6VD7ZDNtKTK0svggKF+W6qncwgaNAu7gM0N5AKk+g7nAaAQvKCa/gZ7O
         HhMAYyqD+czRapmOK+hs0Z3QQQtq0adDp1IDvzBNzwUguAhCuHPVLc/vRVW3P3xovfGO
         imZyO5hPXthip2a3eLKBU0X4+h2ShMj7K8tDJC8XoSDdkGch5+M5H6NnIoOv/3bgmj/2
         NIkfciZ6F2yUyOcdn0w8aqmiHQqAtyWAQVuAlMi0KK2sZKLv2hw5c7WBFDdNSZb9PymQ
         W7Jg==
X-Forwarded-Encrypted: i=1; AHgh+RrzsLl/y3siUl8xsyVcW3g9sCgJB9yWnBFVu2tIG4XBY3sHJr3WKUkwiTXXI9y+qtx7ame8ttBGO88cK1UVxhKK@lists.infradead.org
X-Gm-Message-State: AOJu0YwrGE7NOiA4LxZ0QhgdysihaLcfFrK/6qwz562iTZ/jvhVxYQ3D
	Y7c/CBkqvPhse3z5K059sYpf5/kG/1RBCIdtzNzYMhEFX7R/OOGL/JCM
X-Gm-Gg: AfdE7cmbXbI1ukaPdFsBd+HmNo+36LWfnQKaRGx45hMm/8qrecxRz9ZsvKTvmNO7nkm
	U5mEL8qogKmARP2oFEZcJcZNzm7l2QjKmrZaNUaW8ZEIdE0bBDNE4G0mfPz/3knagT2d2fmHk9j
	xT/C9BYo9LdwPk5bTeZWVcZITG0EtkQn368nkqIDAf7RbxoH8qZQqAAcjvNtKnUHT39GUhTQEzz
	CLqFUZS9TjJPEIgHEUvZPIykdNXPbwBAehPi3t7Okpe7KynXxmai2knNvhS9u8fvye5LKY7YoeJ
	qzazEZTxOcbmtJZDn6w5vGxzRtXKlMG9/CcUagsBiPwiWmRpG1Bh8iipQcI6/9AOtsJhyHl5duW
	6yWixyozxDRaduqB9JbVqTvWX2/NJ3Sb1pLVG50g+HVYBBglEJ/McPQYqY6inUzypNKcXnjyIn+
	+oCP2ShCENAE0/UQD+sVOm57jS5p6Dm7Na1us2okEJlQujOpcSjy469yLtEfLx
X-Received: by 2002:a05:690e:150f:b0:664:c7b0:f655 with SMTP id 956f58d0204a3-66521ae384fmr205145d50.53.1782884929334;
        Tue, 30 Jun 2026 22:48:49 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-665000c8152sm1920856d50.0.2026.06.30.22.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:48:48 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/6] clk: sun6i-rtc: Add support for Allwinner A733 SoC
Date: Wed,  1 Jul 2026 01:47:44 -0400
Message-ID: <20260701054744.3962458-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_224850_484929_FFD0CF6A 
X-CRM114-Status: GOOD (  12.50  )
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

Hi Jerome,

Thanks for reworking the A733 RTC support.

I ran v2 on a Radxa Cubie A7S. This is local validation evidence
only, not a hardware Tested-by.

For the A7S integration test, I stacked the series with the currently
visible public A733 CCU/PRCM v1 and pinctrl v1 prerequisites. Focused
RTC binding validation, targeted RTC/clk builds, and a Cubie A7S DTB
build all pass, and focused CHECK_DTBS=y shows no RTC, main CCU, or
R-CCU findings. The remaining findings in that base are unrelated
A733-wide schema gaps.

On A7S hardware the artifact boots cleanly to shell and the RTC driver
probes and registers as rtc0. While the board stays powered, RTC read,
write, and a short readback all work correctly; the readback advances
as expected.

I am deliberately not adding a Tested-by. The RTC value does not
survive a full power removal on this board: the published Cubie A7S
V1.10 schematic exposes the PMIC BKUPBAT pin but does not show a
connected backup battery or supercap path, and Radxa's A7S
documentation describes no populated RTC backup battery interface. So
I can confirm the driver is runtime-functional while powered, but I
cannot honestly attest cold-power persistence on this board.

Happy to rerun only the persistence phase if a valid VRTC/BKUPBAT
backup supply is identified or fitted.

