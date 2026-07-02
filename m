Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409FBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 23:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rFReXlsu8fSc3FIw2rtMwcoHtkhhlcoHIpQXyaO1YRM=; b=pr1gR/pcpXNpRjjqBwQLTiC1N1
	3gJW4GILqK4kc+H4KnDgLVbbsadYjiVCCK73fHc/+ISJpbElouUwehXeLF0vMm/m6ut4d8+QEevI2
	hBh9lCRA0Ju+xbRvjlIAt8GcJNKzSGJjgVVO9udUVssih3bwlWnFXYTNv++VY5qjOjVsC14NGrCMi
	WjuVYk56Fn3AWEiyrpO0nXzSsGQ1YP/5hrhCxAiOMxzHLhr+YmyuTvnfET562r3N260kyeBadyrkY
	PJaHM5NfVDhjFBjRomWQ6MX1ymkXRECNpPu4PncfkLuN7b4RMCvEQTRohy+j8fQ0u9n8svk/gvteS
	GPJA+ZzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfRBz-00000005lIt-3mi9;
	Thu, 02 Jul 2026 23:51:39 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfRBt-00000005lHh-1PEg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 23:51:38 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-92e6c4a867cso369385a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 16:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783036292; x=1783641092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFReXlsu8fSc3FIw2rtMwcoHtkhhlcoHIpQXyaO1YRM=;
        b=TQYqmGjmK3WOa1ykjlPWsrrHw0vHxVTm3tStc8Y5HqMiqxMdJh3NJOJ85/FkWkxFh9
         efOlclmSxcMsP92EPwMImKajmOZwGBfvpGqY4AfyqugiENVczkijkJieRGbKdDDHHFGS
         DFbAK4u/yzzAXchiMGFvfmJLK1MDmZIESryde3r9CxoijX1Bc2q4rjx9YOD/X6jKKeSP
         eUQ8xrt8GZz6hkZXabLPjauJEvJiGJ3tAJRGu0q9oa+y3HIaeecZsbblj0n8iNzITrMD
         MPfkImrlfLbXUR18TPMlgalOlE/0qTsp8n0iwEFnpmMUj/fMr6AoC/D3opXp7BiHeiSL
         NjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783036292; x=1783641092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rFReXlsu8fSc3FIw2rtMwcoHtkhhlcoHIpQXyaO1YRM=;
        b=PeA7gfMrHElf3hJUJtUQI0+arx5GeYFGrgZ9oOP9/J68rMWk24Bniso9VZa9ZIeyM5
         GSY/8AoIdfn7TZOAkAwTKiPpL/vYmO13fQobI2C/J+VBJ4jrMI8iRZar1nXHox/gD/Qm
         QqnpyE3yoIpJS2epHSBxEkRlZ4++LmYtZA6lLB/hmDzlVmkAi1KKYfAJI0dB2bqmuGCJ
         Ge2dT4ozq4rY7UfZUnkHIT9nofzd++682QfeySMx/wu8/S2ks/OcrLY0NS9VW2z4ZvMX
         0/4ipwMT/Mx+uZFx5jRB0+ENg9Vh8/w82cWkGpooWcRCpDpWVmdo7TMo3xnr6cvP3lq5
         yRvg==
X-Forwarded-Encrypted: i=1; AFNElJ9cscfT+umC3GRBRM+6NzuvcOskCcqKv0+ulB10J5CWL6vVfp7pnRUKUHc2fn+iexvX4C44OMcEfhvYqTn0KpRd@lists.infradead.org
X-Gm-Message-State: AOJu0YwB6LIpVH+eS8ybBk5zNEAQEzQdEYxDDSLRhP07hj8bUtY4mPZN
	tzVotFINKBZ80QJVE3SwBqoo+4nNoCI1rDT62HjUuaHEqWM9SUpQZLls
X-Gm-Gg: AfdE7clre+ONQpIkFN0w2HNCmhZvad2F7J8/8p08pfXcEPeAsKicBTMom4hc883PHf7
	le0wkEbMqYrznY6lJNWvYLUq7r/Q7KrzkxBRwQx+gRXUOuQqnHUEIR6wPPKDhByCSHL2tJHQpJg
	zL0WTN5rMuR+GkhYJz+AzNNVZpmIPrdwK6FJ2kaBvxzPGPe7IZWXHSIGeHinZd9Zya9YxEqeLt1
	A4xwiyDP0uIuIPr62N+usr3k2D2Ll1dKtXr8lhUz7gpKQr1vU94bcRkMHGbt9rCxly3i8CGPXMp
	DAhaYUXUxYqvsSBP8CwJ5cf3WAT3GHT1iZn6So6JnSp64Ha7F4tL9PQsONAXme/7JB6HxeTfQUY
	arKjw3u8xEwyetM+XW6oz2B5cn+AQd+3jnOrYnOs9RkgaUA0ksmFMFgtf4PUv9k4fn9Ij4Zu5Q4
	2cMAegsdtN6d76uzYbCbHTzDf703QbacqgeQ0TKLJmK8e/m+hHHnDNr03edpG8
X-Received: by 2002:a05:620a:4410:b0:92e:76a1:96d3 with SMTP id af79cd13be357-92e7b3e82bfmr983241085a.34.1783036292031;
        Thu, 02 Jul 2026 16:51:32 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b80785sm11476585a.3.2026.07.02.16.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 16:51:31 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH RFC 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU and PRCM
Date: Thu,  2 Jul 2026 19:51:18 -0400
Message-ID: <20260702235118.1225793-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DJO79318OW0A.2RDQOAXRTHNCW@pigmoral.tech>
References: <DJO79318OW0A.2RDQOAXRTHNCW@pigmoral.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_165133_385982_00AC06A0 
X-CRM114-Status: GOOD (  11.60  )
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

Good to hear from you, and glad the series stays in your hands. I hope
the move went smoothly. No rush at all from my side, please take
whatever time you need to settle in.

For whenever you get to v2: I posted register-check notes on five of
the patches earlier today, so they are on the list to pick through at
your convenience. Take from them whatever is useful and ignore the
rest.

One offer, entirely take-it-or-leave-it: I have three Cubie A7S boards
here with serial consoles attached, and I am eager to put them to
use. I can boot v2 the day you post it and report back, if that would
save you time.

On my side I have Cubie A7S board DTS support staged to follow once
the clock and pinctrl pieces land, so whenever v2 arrives it will get
exercised on real hardware right away.

For transparency: I use AI assistance (Claude Code) for the register
comparisons and the test harness, and I check each finding against the
manual and vendor sources before posting.

Thanks,
Enzo

