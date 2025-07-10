Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357DAC83F24
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:MIME-Version:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HWFTFh/TUDhf+twgmA9UYYg8LGXRjMgTLJemIO/awsw=; b=dWF0nQQxZk7x7JzBBhO65BIqd/
	DR/bn0L7+CmYmB2BIj2FMTNPXikLtLwj70cmLTedx/9qcwCLnUtMmKNFIKlbXeQpEzPiNhGhXkS+v
	+DD4+joejoFvBIaTQ6Gk6lKZxCMZn+PKWCJxA2vvDWq0rrfH8qHalRehZ/OTcbbaJHOZfMN8rs2jg
	25Cy+PTpY8HEEsoCBZvNs8yjzUYyYm3uZ5gvgh2dCjbjzNZP/y5LCVaa7uU06JBB/+mf5NFEjyW15
	FZI76nCLhMMRkdve2jQH2WXda1eJplpVZbrH8UjuhLL85Fc4aNq0U73Y80GLTy6eKumMjAMUy3MOf
	gKrAu03w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2Py-0000000DPuM-3KS5;
	Fri, 11 Jul 2025 01:19:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZyXz-0000000D2D7-0Amj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 21:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752181873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HWFTFh/TUDhf+twgmA9UYYg8LGXRjMgTLJemIO/awsw=;
	b=UPGxPTo4kbkPCr7Y+WBDPjBySKhGJns7hrQmXrI3C17XFbN9J19VmaXfnuMXMiu9pcIjtT
	kFqy85yfkxOSGxP8eowTGddGKimxsgJlI2NzQqvd+s5147KcVsCHDJmztxXQ1jHzSPFET4
	1MGv1afwF8Yw7/Lnnc5XpY2WtAD2NHE=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-3ho0UKtGNt65_nODRkuFBg-1; Thu, 10 Jul 2025 17:11:12 -0400
X-MC-Unique: 3ho0UKtGNt65_nODRkuFBg-1
X-Mimecast-MFC-AGG-ID: 3ho0UKtGNt65_nODRkuFBg_1752181871
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2382607509fso8087405ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 14:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752181871; x=1752786671;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HWFTFh/TUDhf+twgmA9UYYg8LGXRjMgTLJemIO/awsw=;
        b=UUbusqMS4L9HcWvVDX1ErKf7zGG7dGQxA5guGcDX85yepcbZ8Ybk4lp3fNgCEugyYQ
         UCHz1AIa9Bn/q2W5UDDyun5aqs8Vj6/b9syugE2/KjrwuJJ+6LNgvRvsreYlAbfkWSYf
         QTPrn6xEFMw20TG65BuQAMoHmRK863u8Yn+gYcv0zsc++V2j2Iudvk1oJPuOjtZtIugo
         0fUFBSD2rzSrzXdicjsi8+p0Y2scjZNDnJsveb2hKxWKe9VcYGmTDzohUdP6/eWx1WMc
         TFdN8B6VWtU2vbzRcJIgBk3EgIQXRTJHO8IWjEJkFiKGTJDG1q3ItP3y5lefVAiCwaAE
         sKrw==
X-Forwarded-Encrypted: i=1; AJvYcCU9QT/gc1VPA0cuNPUmLGGpWvHxH+r7DHrF57TbQvKUGwxJ1c1ijwRCLoH4L0Ua66HPNjluVAc0qVcTg5E9g4R0@lists.infradead.org
X-Gm-Message-State: AOJu0YzHQOXigYNUTb5E+5sXe2Lpj4BTS2YP/zOD1CClJJe9dQktYk31
	q3q6bycHuRwuRqj5UisL+8COZUKmiadX0K8DirCjmZ9EsRYa5NF6U1HG/gGxXQGsIcR1LO1krPA
	9YGORhSffGdao55iywmpTYX6f6M+ZrO2tF5pCAv6FG/8BesSMdsAiDISDPhQ/RbrcnkyNJm4XGp
	kM
X-Gm-Gg: ASbGncuO11B+NQOQbyHAQxnoxumNXb1Z/kgYKQa6uq5PWmH2lVl6yPzmnezuW6n4iqz
	MdAGuUhVJpLsUTWb06XL1nfX3j3rOPM1usT/viXKarLQ6MEBbwh122ejsWb/VKf8UY+fQhppH9N
	V1KikSWHh9YyYEGD5ZR/GOe950QmSV4aIqis+YDTShvMPL9H45VMLWQXbW7iBXy4mLkWlTqLv0R
	jkj6k6L51ptnaboTqOKTGLAgQ7Qpu72XbcGK4mPkFyWDQ0OTi7+9NIytDkloqyovm3Flkjhw5lp
	0W7BNKKM9khhOtU98vrUmhvWHlcH9H7X+IXPm06DWqm1Iw==
X-Received: by 2002:a17:902:f603:b0:234:d292:be7f with SMTP id d9443c01a7336-23dede7d45dmr8541085ad.31.1752181871128;
        Thu, 10 Jul 2025 14:11:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZTNelfVFxvxHSdAlOlXRMFMf2/RyOZ5QtlGD9msicHprkJxdJdgF83ESayB5cXzsffEjyTw==
X-Received: by 2002:a17:902:f603:b0:234:d292:be7f with SMTP id d9443c01a7336-23dede7d45dmr8540815ad.31.1752181870703;
        Thu, 10 Jul 2025 14:11:10 -0700 (PDT)
Received: from [10.144.155.224] ([2600:382:7716:65ad:9491:c054:6f2d:80ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de433e51asm27790595ad.180.2025.07.10.14.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 14:11:10 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 00/13] clk: imx: convert from clk round_rate() to
 determine_rate()
Date: Thu, 10 Jul 2025 17:10:32 -0400
Message-Id: <20250710-clk-imx-round-rate-v1-0-5726f98e6d8d@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEkscGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc0MD3eScbN3M3ArdovzSvBTdosSSVN0ky7TkRMM0M1MLYxMloMaCotS
 0zAqwodGxtbUAfAjR6WQAAAA=
X-Change-ID: 20250710-clk-imx-round-rate-b9fca1f65834
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752181866; l=6081;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=VkBZymHS4NSLMC7bHgMfljy60rdX7BJ1DlxpAOHOtqM=;
 b=CrzLst5JnkrbKUpNZRNqaXnvvYvt1GcPkPG+C45YmBjicrsMj6s8Nm5XOFjqOO+Kg+zCXpt3F
 RsqbGkgNN4PA4SdWkh6apyXXBaECQKvPe6pDyulRd/j5BsPuKYd5aYu
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: X3Zr_0u_L7WGJfeaUub18SnOAipu1FY07GCh1do5cpw_1752181871
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_141115_160534_107FFEA4 
X-CRM114-Status: GOOD (  16.80  )
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

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops. The first two patches in this series
drops the round_rate() function since a determine_rate() function is
already implemented. The remaining patches convert the drivers using
the Coccinelle semantic patch posted below. I did a few minor cosmetic
cleanups of the code in a few cases.

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (13):
      clk: imx: composite-8m: remove round_rate() in favor of determine_rate()
      clk: imx: composite-93: remove round_rate() in favor of determine_rate()
      clk: imx: busy: convert from round_rate() to determine_rate()
      clk: imx: cpu: convert from round_rate() to determine_rate()
      clk: imx: fixup-div: convert from round_rate() to determine_rate()
      clk: imx: fracn-gppll: convert from round_rate() to determine_rate()
      clk: imx: frac-pll: convert from round_rate() to determine_rate()
      clk: imx: pfd: convert from round_rate() to determine_rate()
      clk: imx: pll14xx: convert from round_rate() to determine_rate()
      clk: imx: pllv2: convert from round_rate() to determine_rate()
      clk: imx: pllv3: convert from round_rate() to determine_rate()
      clk: imx: pllv4: convert from round_rate() to determine_rate()
      clk: imx: scu: convert from round_rate() to determine_rate()

 drivers/clk/imx/clk-busy.c         |  8 ++---
 drivers/clk/imx/clk-composite-8m.c | 16 ---------
 drivers/clk/imx/clk-composite-93.c |  7 ----
 drivers/clk/imx/clk-cpu.c          | 10 +++---
 drivers/clk/imx/clk-fixup-div.c    |  8 ++---
 drivers/clk/imx/clk-frac-pll.c     | 20 ++++++-----
 drivers/clk/imx/clk-fracn-gppll.c  | 17 +++++----
 drivers/clk/imx/clk-pfd.c          | 18 +++++-----
 drivers/clk/imx/clk-pll14xx.c      | 29 +++++++++------
 drivers/clk/imx/clk-pllv2.c        | 23 +++++++-----
 drivers/clk/imx/clk-pllv3.c        | 72 +++++++++++++++++++++-----------------
 drivers/clk/imx/clk-pllv4.c        | 29 +++++++++------
 drivers/clk/imx/clk-scu.c          | 36 +++++--------------
 13 files changed, 146 insertions(+), 147 deletions(-)
---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-clk-imx-round-rate-b9fca1f65834

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


