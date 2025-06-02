Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8D1C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 15:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3ov+Lh/6++7opN5JtzuefcSmMhE81eYS7f93OD6TWo=; b=DhknMCu5+kYOT0vfnNSF2LUEVf
	yBWLfTo+fxrHKB4mTDTREE9NfE1N0y30Ygj7vhzOVskxcDszEuOO/gXGZp88F2TTS4oYtVoTCq3Ea
	W87NFK2mdBRVu/wbNbk6K9N4UdZWzwOG7NZNqMvYA7BI6Db+bJkir2jnjmQYn4MEZVcCLhm/zdgrV
	m/2jd8Jj5Y2T59sSyYEoHorsT4R1Y83LO4HRqzrNeGw9XjUxty7UB8q6XTrvzQEtHf3zrrSrD4OXH
	PwyXIbk5NFgGcYALAWWFj7iXT7t+j6eErcUDeBz+b5ExcZlis4bn8DAm3VMGEtsJE3kad5i8eYQ8C
	1Pg2dTug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM7Bo-00000007mES-1Q4P;
	Mon, 02 Jun 2025 15:35:04 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM6wJ-00000007k1J-3zM6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 15:19:05 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a363d15c64so3179023f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Jun 2025 08:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877542; x=1749482342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c3ov+Lh/6++7opN5JtzuefcSmMhE81eYS7f93OD6TWo=;
        b=kzwJmwY7O9pgwfklo35mztl3/DDvhBZQmg4jrHWDE629fvDXPJGPGkm1axvg5+rlvy
         YB2YpqDqG5Yad2l/TE7FaTYi8E7P0aWT6M4rU+WHrjCB5Xs3IXvzGKE/FUsxfU/psMYF
         626rSTva32cCUKAcBMuChQc2IdDhoj6cEss9tOajJmGVFD/snMNv/5Ndri1OU39LegJ5
         cDPEDTUMJ9+H/gtWWeg3Jqw+wRDUC/KS0sppPgKWqO1AWq6Rz5y7EAEDvgUI2UjexcPQ
         oMHPbNB60eMEhVDXc2HAQHKm/yhGfFDL8b/jGG0g0TI68qRgLmCuAsrvVODMB8cX8R8a
         Lc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877542; x=1749482342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3ov+Lh/6++7opN5JtzuefcSmMhE81eYS7f93OD6TWo=;
        b=W3ygbgKgwTUams3RHpwCTrUFXY3pKtn6jot/ZXmKssoh7qiNp2fdC3NJk8n480aSgy
         Wbl1hyTN1grYTkjM/t3brThMwdkG6U0LNCddy9o8bAfh6jClb0EcYkDsaOzQnpjEA4QU
         7ZPk1rNVfwqcHG3Xcz19RCY4qHOKtBz+QNhJ/eoBWG2afdLg2Z3AcMj9aTiWy4Z8J/zg
         7zCfwyild+Ldo68Om8w6NVsTDqxzHi3Sh1FVUMwTXoMFVlphTKqhhqsoDCKFQspk8JSj
         nVnrJrvAXc5/lyDho+Mjep+2Zog/yQuTxZ4b1FsnWGTcYAbsnRq0edu2pq/Uq0L6FDaL
         Gk/g==
X-Forwarded-Encrypted: i=1; AJvYcCUjjwj3DKwHbWKjZThwU/eHpWOdBQzKBO5U/HjNopigVlb0zwM1G0mwJf2bC08kT2PUpMINRa5eKygVcsd3Ap8C@lists.infradead.org
X-Gm-Message-State: AOJu0YwHUtXxZbMA/kFHvZk1EAUd7D7+3EpHHiCzvJLLViyKMjkNY9hl
	y5aN93Hc6zQ1hjI2ycxnP0LQr6jFhYjxt/3ECrRDVrikoqsMkzYko8P8rGEB04nqPVQ=
X-Gm-Gg: ASbGncvEJIb9lNW+bXb7i0D83O2gcktgRe3DvNvgViglUfKZEcrFNAEmcBJy+YjOPbe
	9V7bGH3kvTyIcT9YBQAMe1Q7ccfHgukfF6Dz/HxJKsWMB8NmZtNtBHujK+QRHagdX6XxlZ6mYls
	XDDSZ7aJyx/r1Gh5iyq8rxUmoZ8YwvqPalRKT/UgwAvFDzfysmNgEqYResZzrJa65NQpVBJKmui
	k5GOPtLCf0bK+LnQkKxCGcF/GBVtfll1yu9Z01P37N92xMWdpnApp8U6dRA2bi5esBkjHua0a2T
	xKU4FYi1kFyttXMQe2irdk2tlmbmZJLsMBXTSzdEKNcZPUSgMltFiLCy57eRQgR0mV0G4MyrpCh
	0sB9WYeGQnwj9clcycQ/Uye4=
X-Google-Smtp-Source: AGHT+IHj81bY8BwahqqDfoqRAaq8f0rnARhmXR6p0QX+Wj5JW6k3OiLTjugCeEjr1Ne+gZ4EEgbmkg==
X-Received: by 2002:a05:6000:2906:b0:3a4:e2f4:a86b with SMTP id ffacd0b85a97d-3a4f7a6d22emr10375633f8f.37.1748877542385;
        Mon, 02 Jun 2025 08:19:02 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:19:02 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	John Stulz <jstultz@google.com>,
	Will McVicker <willmcvicker@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: [PATCH v1 4/7] clocksource/drivers/tegra186: Add module owner
Date: Mon,  2 Jun 2025 17:18:48 +0200
Message-ID: <20250602151853.1942521-5-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_081903_987248_BDD9FCAD 
X-CRM114-Status: GOOD (  12.41  )
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

The conversion to modules requires a correct handling of the module
refcount in order to prevent to unload it if it is in use. That is
especially true with the clockevents where there is no function to
unregister them.

The core time framework correctly handles the module refcount with the
different clocksource and clockevents if the module owner is set.

Add the module owner to make sure the core framework will prevent
stupid things happening when the driver will be converted into a
module.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-tegra186.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
index e5394f98a02e..56a5342bcf78 100644
--- a/drivers/clocksource/timer-tegra186.c
+++ b/drivers/clocksource/timer-tegra186.c
@@ -373,6 +373,7 @@ static int tegra186_timer_tsc_init(struct tegra186_timer *tegra)
 	tegra->tsc.read = tegra186_timer_tsc_read;
 	tegra->tsc.mask = CLOCKSOURCE_MASK(56);
 	tegra->tsc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	tegra->tsc.owner = THIS_MODULE;
 
 	return clocksource_register_hz(&tegra->tsc, 31250000);
 }
@@ -392,6 +393,7 @@ static int tegra186_timer_osc_init(struct tegra186_timer *tegra)
 	tegra->osc.read = tegra186_timer_osc_read;
 	tegra->osc.mask = CLOCKSOURCE_MASK(32);
 	tegra->osc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	tegra->osc.owner = THIS_MODULE;
 
 	return clocksource_register_hz(&tegra->osc, 38400000);
 }
@@ -411,6 +413,7 @@ static int tegra186_timer_usec_init(struct tegra186_timer *tegra)
 	tegra->usec.read = tegra186_timer_usec_read;
 	tegra->usec.mask = CLOCKSOURCE_MASK(32);
 	tegra->usec.flags = CLOCK_SOURCE_IS_CONTINUOUS;
+	tegra->usec.owner = THIS_MODULE;
 
 	return clocksource_register_hz(&tegra->usec, USEC_PER_SEC);
 }
-- 
2.43.0


