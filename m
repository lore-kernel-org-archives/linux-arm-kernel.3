Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F89CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 15:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hIXKln0CcY8+dmF/mGHOQKELRUsVLfH9Caoqcta/KM=; b=VAPOQyxMgtVU4Z/3ClBK8Ga0nV
	CItYzrrTBgT5HhTwu83RtEW7ZgkSud2OMdUFxuMLkXf1oxajMTBycTsRoxyn1nKEZxw0PP2l4mdS9
	H95+leY8zpcxN0KdcWNyPsogOeLbANMgYWTW6tP8FCCVFDXQkUoJksF7fwRjI2o2PlnTEuy3IHd0t
	lypgZ92fUdoYzixmuAelcIIdQYgfBMcg0Xt7Mr/0IsQ3A8RiwG5CNWULSYVl2lzVdxd1bTBVgCJXF
	A9l8Bd8yjwUiw/mOz0XF+Gx+3nH1WMFQHAb6Niai78PLMThfyqHgsYr9fVQ0GQwXY9/RrvvWbytNd
	lRY1DoEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGI9T-0000000ApiR-0n0N;
	Mon, 12 Oct 2026 15:41:23 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGI9Q-0000000Aphj-1g2x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 15:41:21 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-4af81963f35so1250178b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 08:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791819679; x=1792424479; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6hIXKln0CcY8+dmF/mGHOQKELRUsVLfH9Caoqcta/KM=;
        b=Kiyj9jzzSWnA0iXP0fxoe1elhySw0TjoJ5NHzqOGL9d7JJwD1Rdi7BUmJiSb+UcMIl
         JGLvVTvmgYy/FirYgypv2NEbaFPX3AAbgb5okSiOlPLf9chs8/wogWKketWfKaZFKoi8
         zqSh0GfSMPnMWTHPlXJ9Cr2KGX/jarnPaHQElepM31UsKO43lQzOT+fKBbNhSVeqnh1A
         WVNZkFgql5fPzLYZPY8y+5PyDqm/sfLrIdxDYwbROthfQY69hgKQc6IN0x/HH4iX0516
         IsBi9sTd3oA3Ncm81WNzi8eWb3iwhyl8T4jP+KWFh5N8BtwQFlIZ4TabNNESC1V5t/Fi
         nqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819679; x=1792424479;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6hIXKln0CcY8+dmF/mGHOQKELRUsVLfH9Caoqcta/KM=;
        b=YM5AJM4ZdqbqYcuwOuhj5XM7cWIaT7oCqC+pmmFRDo78AT9wvDLF/6VAYNLimvTAgt
         J37GxYLxfjAlJwunjXgSYaKs6c5hcbpvtlAGgDuK8SB80wpYJK3r3aiDUl1befWrBsVk
         srKv9jDuFd13HPVP8x6FtvsYGudmwGKbSxIDm2HqezWgB6+++HOG9W1yoDXfUlFmdQQz
         B9Q6ez27jDZgUHH9IRyK+4gyiwr2ziVmvAPaOnSCWM+SH2k5H+xfNy+5r5G7x/Y7GHut
         cqTZ4tl/tBmZiT2Cj6Yq7xT0eHdH9WqsNRWJDeJANdH3r92Kjd2hUK3UX5wHJzoYFC1M
         YRmw==
X-Forwarded-Encrypted: i=1; AKwUvBzmLnmT2nWUUTydqtknhBwRYNtI0WMwggKURqsZyS1c+Wig21d8A3kZppf14vUWjUbaPm8r0RpA8ds7sve3PEHg@lists.infradead.org
X-Gm-Message-State: AFq9FYJnN2qjYWc7tlCt7SJeVOOxTBa6WX9ugqhX6fSyEJeRsGJPpPRi
	wCqGD95d6kOyPRVissBKf3BaEoE/aOIC0FHq53BZHo81uYOYSqrCV9i3
X-Gm-Gg: AYBFou1diOU0vFgOrDz+p86EBT5aNvYxlVYG1z2hUzaUMpWVmZfweav/81LA30AXGNo
	hJ4vYPXhwbcj+gA9+wPBBs2bUNuti85hNyqVtVl8c4a3eH0NhLHoibVD4ZNXsKFZYqb+SdwwFHv
	9KrEVc3u8nJ9aW0/j8LGLE0sdC4xmhQCVvNhdpx52xIdEJ3lB+YqPssNkSvzx2mYpcm4dGF0Rh5
	YKb3G0doE3LOQLZmyXDdkmzelp+mqGpaUOSB97MazW8Yk4S4VdkNgZEK65eg/Nf3PN5O6O3SCef
	BCePA7gH6ua6VFgvpdG+4fc7JnMfl3BED/f1gFQVApKvAKSyg/N9IV+uI8RNNe2NXukY4t2H8zw
	azpmofKPOIdrA8WB4EBKXFZK1l+eqnzlZG1eLD6ilm6Fdrl7655bVqNFYcJjSmJse868q+Cx85Z
	UT64YAmx4bQMrykswmIJHaXYITH2wgE4CtunLvNZstgitTdoF1c4oooy3lp3BZ7cvh9mIDTRjWw
	iLQdapLGfPAqUL9/SMjWVnkJiTuik7m3hsE8VREAVu8iZctQ7U=
X-Received: by 2002:a05:6808:c40f:b0:4f4:d914:8603 with SMTP id 5614622812f47-50c4c7a2ecamr11290630b6e.15.1791819678716;
        Mon, 12 Oct 2026 08:41:18 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-518a72a6048sm5842486b6e.5.2026.10.12.08.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:41:17 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU and PRCM
Date: Mon, 12 Oct 2026 11:41:16 -0400
Message-ID: <20261012-a733-ccu-v6-a7s-test-eff62a3e9eba@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011200153.575096-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261009-a733-clk-v6-0-ae8178fce7e8@pigmoral.tech> <20261011200153.575096-1-vinicius.eduardo.pedrosa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_084120_446152_7459C8FD 
X-CRM114-Status: GOOD (  11.21  )
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

Hi Junhui, Vinicius,

I can add a scoped result from a 4 GiB Cubie A7S using the vendor boot
chain. With v6 unchanged, unused-clock cleanup enabled and no
clk_ignore_unused, all eight CPUs reach a RAM-root console.

Ten cycles of 15 seconds idle followed by a 64 MiB O_DIRECT read show
mmc0, bus-mmc0 and ahb-store disabled while idle and enabled during the
read. Two additional 4 MiB direct reads at each offset give matching
hashes. Card-write counters stay zero. GIC remains enabled at a reported
480 MHz; MMC operates at 50 MHz, 4-bit, 3.3 V. The board returns to vendor
Linux after the test. This agrees with the parent-gate behavior Vinicius
reported, on a different board and boot chain.

Correction to my earlier storage description: this is microSD on
SDMMC0, not eMMC. The eMMC footprint on this A7S test unit is unpopulated;
this result says nothing about eMMC on A7A/A7Z variants.

The test kernel is v7.3-rc1 plus the public dependencies and local
pinctrl/MMC prerequisites: IRQ-bank allocation, firmware bias preservation,
a read-only PF supply provider, MMC error handling and two DT pinctrl
retry/parser fixes. ITS is disabled in the board DT because enabling it
still stalls early initialization with this vendor boot chain. The GIC
clock is already marked critical in v6 and remained enabled throughout
these tests. I did not add critical flags to the storage clocks.

A further eight-CPU run read the full 119850 MiB card with O_DIRECT to
EOF, with zero card-write counters, and returned to vendor Linux. This
is a microSD/boot test report, not whole-CCU qualification. I have not
validated LPIs, voltage switching, native PSCI reboot, suspend or other
CCU consumers.

Thanks,
Enzo

Assisted-by: Codex:gpt-6

