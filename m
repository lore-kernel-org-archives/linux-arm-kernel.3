Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE22C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 14:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VapJVpk7Upuq/4IsumhznTZhjSgCFeW/dRXr+/nOOSk=; b=qbhxjAhAJlPY54VgQtaO/4e+v9
	vyw8kM30J/JPUlEdgCnxW08dBInUlsjC5YbfUT0MJIwqM0VA87jRErDFw8rifTRn/MpLXpBChHJ4+
	X/Yf+pZrqzXhZPXdTxi2Rnpewt/QfxO6uFy34urM4dhSAG31w4sfJobgviWSr1hr0PdTZcV3E+83p
	0q9jSysl2NP5d6ap1MOnQgvwvmtVUiegpb0TedAqlThVIufKlg6POaYBvgsOMh5/iONTr+ojcRUPZ
	i6UCBykl5Xxf2wxifDiKyykJoxIWsh9jfuOzmjSIgb0ADI68rVAl0YL1ql3kVO8Ld3R/Omma7rRh2
	F26/MLhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl6J8-00000004BIt-32cN;
	Sat, 18 Jul 2026 14:46:26 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl6J1-00000004BDj-2TnE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 14:46:21 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-9305a2121a1so532031185a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 07:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784385975; x=1784990775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VapJVpk7Upuq/4IsumhznTZhjSgCFeW/dRXr+/nOOSk=;
        b=aT0n/KqE9tldr4M6QCQsYhN8SYoBCO03fcVuUAHkeKlLRJeQtvG3FYEIWpV/B3A8dB
         58Cya7X1YqxXCw2HOFrgTFpNwEBaAgLvsC07GgrywO/6OaXIVghnO7rf9/50KzL8IAVN
         aukiCFPNIhYyaF45pwg3GCnzntBhzS0ZFC1hsm/jRKiqohuZXstyoA7lsPA2PIM47DLC
         DnTjnwG6TJU2X+/l9J2erTR1rOU377PLnsJGBR0mEVQ++HLX7vqf5NMv23yOjSIAfZ+g
         d9jbxLmf4ig68pMBNGxGd2x/+2QdXHBiS9pqXHxT01YDINv5N48AcmFQogkdsgBBVGJN
         lR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784385975; x=1784990775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VapJVpk7Upuq/4IsumhznTZhjSgCFeW/dRXr+/nOOSk=;
        b=iFCRJJtvr5XcxBPR5t68UlnL+QuwFXomRq9y/oWNqwc83umXsjSodmSsfpPYnnS5fx
         M9jQl0tVjwAyFfr8F569gBz0JZQ4lrKqutBGNHuQnveAPNvY7H5Z/0h1/4GRf9I+ynQA
         Fec/gSKx+V1a9tENxjchtX8MXY7HVU2ZiRIMoMRrPFn7z/t+AQgCREWWWeHqfECjZtg1
         i0uhnANefAZncK76muLdL6cYASGGrDIVaVJrnxRBJ8zCxHIE3RbebztCzPd+vCSLmGAZ
         F288qXcTcOd04PclSY1AHpNG9UQIifK/DznH5Lz+WeQyD5S505j/Oly0OorUzha0FD5t
         rpmg==
X-Forwarded-Encrypted: i=1; AHgh+RrwGsoPuG64AnmUMjBwjLeCerVwZ74KfOaLdH0nG5hLc0UPV1h2nLBZxUy2NtmT543cJmQmEJtZNUYQCLu5Kt+4@lists.infradead.org
X-Gm-Message-State: AOJu0YwiTWrfdnOsAAuzVW+OHD3bp30y0MEctS9Se6iXSvCWecfUgGyh
	7gm1mtZOFuvrOjRPIkLVkenaLiH61rWbEOmgJzzFSzm7qUzATnfQvuJ2
X-Gm-Gg: AfdE7cn5NPAwLNxZ/Uc4PLCBoxn8mCBtw+gdCka2L98l19gvWNDy7NjXKY280e97RoU
	llxaLcePdiDXSykZgIXk0FrdxdpE5cjysuaWFeDVi2vw6MWWQgivLhl0w7rXLR36lhr7HHotm2w
	VA8NEvQ87wQ9jLu5nS9jWUW4hi0b1RJGvd70B58dY85341lhFDlo9LnMENKVNc7DlQ5Oy4AN/pi
	8m9D8uzcxQEpQnq2T2mBhEJ63fDYk882VZ3RGjEZlhpDXiTcBDpRy+SaG3WvrRYqWp0rUWp+RT2
	a5QIhUWkktBEUK7tn6SewUw/VmVJ6+uYsFlARlDDeHlqlsSTfIlj1iD76nohwl016j0a2Z5kmJV
	8DDuPEflQX5jkknu8ictYUiJ9GfTSV+ydApqEWKkbWQo5IXbjOK9oKFiKxiSLAIdvMlWcLMWiOn
	dN4rUqZrwrLK73KtMuEgT0ULKSLe0y2wxb1yplqtrkvX/QY605kD2vhQ==
X-Received: by 2002:a05:620a:400a:b0:92e:e252:bb43 with SMTP id af79cd13be357-930b4381a6dmr700628485a.77.1784385975182;
        Sat, 18 Jul 2026 07:46:15 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545ec44sm418682185a.34.2026.07.18.07.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 07:46:14 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Date: Sat, 18 Jul 2026 10:46:11 -0400
Message-ID: <20260718144611.1523567-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711-a733-clk-v2-3-974d188cbe0c@pigmoral.tech>
References: <20260711-a733-clk-v2-0-974d188cbe0c@pigmoral.tech> <20260711-a733-clk-v2-3-974d188cbe0c@pigmoral.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_074619_645081_036B9B24 
X-CRM114-Status: UNSURE (   8.22  )
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

Hi Junhui,

I re-reviewed patch 3 in v2 after Andre pointed out that my RFC reply lacked
a formal tag.

I compared the RFC and v2 PRCM drivers and rechecked v2 against the Allwinner
A733 User Manual V0.92, chapter 4.2.5. I checked all 11 programmable clock
definitions (register offsets and divider/mux/gate fields), all 18 bus-gate
definitions, and all 13 reset-map entries. They match the manual.

The RFC-to-v2 changes do not invalidate that check: the four R timer clocks
move from the MP helper with no M field to the P-only helper while keeping
their offsets and P/mux/gate fields unchanged, and the R PWM identifiers are
renamed while keeping their offset/mux/gate fields unchanged. I also checked
the gate-only BGRs for R-TWD, R-PPU, R-TZMA, and R-CPU-BIST; the manual defines
gate bit 0 but no reset bit for those registers, matching v2.

Reviewed-by: Enzo Adriano <enzo.adriano.code@gmail.com>

This analysis was done with AI assistance and each finding was checked against
the cited sources.

Thanks,
Enzo

