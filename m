Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49144C44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9OVTt/KuhBx802gK1GpNosauIrh3LIrN95gUsSLZetI=; b=fpmOg5Jd9wUg8IrSejXm0Fdkx9
	eB1W8duqicYNg+pQPTSFsARh5zdIyZGjUza0qg7IbJ3s+G/Z6m5Rd3NpfUpNkpgcAU9M9P668omXL
	KU/mlchgALinQRrGwL94UKR5plHLCEDZgMJzCCsvvCnjAlRmH1CHG7gUj0ZrLzrmN2AuiO5etRu4e
	rchmdl57d6YMU29U6zx6Dhn3gHYQTKprHMRgZoqJZy2NISSKLz3YywT6NaP4LmZZfhhTEh0E3Tz6G
	P0wT04Y/9i8RQxMMjMPLRnLVSIStfpmONAvxcpKb0jxdKxmSXVEKWhI/r8pccvlPSLxSg2hUXOAXF
	2zq153Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwLH-0000000ENew-2cYA;
	Wed, 15 Jul 2026 09:55:51 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwLE-0000000ENea-3rds
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:55:50 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84874b52eabso2602267b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 02:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784109347; x=1784714147; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9OVTt/KuhBx802gK1GpNosauIrh3LIrN95gUsSLZetI=;
        b=Q8UdhGBOsEdE3b8HKHmPC2uKQ5fc+n+uaBywE3tJy8KAcdDBDWooE3eGGgoPtJYQY7
         SoYgAlv7sKWwlQYhV3gOfObqvmrs08gfYIsyQcGNFO/QeZQmtUuJaQF9I/UmWUaoNltO
         M1DEgKwCKe8X2oVxt/qkwTimHi/LCKFsm2UsPt6oAVBD1TkgWBV+15c+4U6Z/G70e6V5
         ZGpsDhnpSMkY9nUmryX3ROT0q7A6fS2L9fNi9kimNvIt+t0sl+sMSWfMvhezc5Ae9+LM
         SbUZVNL1lRsqNqxsh6Q1QwzcOT+TbK3KyBJin44bvsuNWy646nHp4bSCNg2fQ49nlFoU
         CFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784109347; x=1784714147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9OVTt/KuhBx802gK1GpNosauIrh3LIrN95gUsSLZetI=;
        b=kKQPgoFuAPHEG1Lt6Jelk8dl65U5LtGDyTFw0SFdbV70j+yoLNZwPRO/Nz+W2ncIQG
         MAc0Q6X8cIE8xwDt2d9UkaHeAPnCigNR7grHLZycYDgf01XKcnYKgsKAE4DGORe0zsX2
         l0ZG+H8YMLnRBs4AuMJOF6XHXg4/IbNGAty0J897701wJfZaUb58oAkMTGYpX0waOFcp
         m6SboRpxE0qGPXzTZj8Hoa/2ANr2DrLQW/ktdo3UEG4JtC9yjV6iuuhbPFltmyDBo/84
         Ri8w81754sxcBBCV2CUlASjSxA2ZpvNedSBxxNw5ZYTQlbiQvGUwFaoMpuMxDDXe7Bca
         KZNw==
X-Forwarded-Encrypted: i=1; AHgh+RoAvTgKzv2PO3ZENaMss5bvOrNa/lRubp36JkWfa453nvTavxceP2VyVRg7ubKm5kq+XVq9zWVJsLiweTm3iys/@lists.infradead.org
X-Gm-Message-State: AOJu0YxqvHeBcnOxLxyb+dxzUyjtrMPoSyQ02hs+XXysorSdYsJyyYsx
	lWnfBAHQw1yqFdrQvQVeAhseNZBsU1A/ksfOr9IOyBI4dTAPvilUNP8q8n2kXg==
X-Gm-Gg: AfdE7ckiCQfw1RJbMn78pxgs3NRP31ennu4VdboC8ThEHx5BA4HL5o1uy7KefuIrgeU
	m8a3zQV+lTY5EfJNnfd//O7TS/dM5cXkTmz5XBwDUFsw66fh2ShZIBpq8MbNFhjU/8yv+HxgWk0
	S3wzZkwBcEvE+LDgZE/c2oGaC0j7GVus/V9LD+iXZxUKv+P+CKf7d0EHqEvox3XUiYM2sPnb91r
	SjP80xE8YIFjBiQK5lOx5OZbdtZ8Q0srp/upbKaEUEwobxLHJUv6puKNYKyHWU9y2Q9y360Wtw8
	sgtzPYhrcWhqBHXg/h1li1GlwN38wFHbVJXubs0DfIUEeYEy0UwG3fgRoWEn6HexupJW3F7AaBA
	eJVFWP9p3LHctkUmVCyk71hqm7gQqJtR5m5KmFmoBzSrbD3aaosCIsbeAB3v5iO1FjpxAG2axHi
	vSHcRvXUg9LJerx03C6f1GgSxNVbKLieCgGOtYyAzLkqhgwZA=
X-Received: by 2002:a05:6a00:b50:b0:848:80ec:5d2 with SMTP id d2e1a72fcca58-84889738aa8mr15665520b3a.51.1784109347404;
        Wed, 15 Jul 2026 02:55:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3643399sm11628908a12.22.2026.07.15.02.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 02:55:46 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Chen Ni <nichen@iscas.ac.cn>,
	Marcus Cooper <codekipper@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	u.kleine-koenig@baylibre.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/6] ASoC: sunxi: Simplify error handling 
Date: Wed, 15 Jul 2026 16:55:19 +0700
Message-ID: <20260715095525.40668-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_025548_965809_1CCCC3CF 
X-CRM114-Status: UNSURE (   8.15  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series improves probe error handling in the sunxi ASoC drivers.
It replaces suitable probe error paths with dev_err_probe() to
simplify the code and handle deferred probe errors consistently.
It also removes redundant error messages where the called helpers
already report failures, avoiding duplicate log messages.

Build tested only.

Besst regards,
Phuc

bui duc phuc (6):
  ASoC: sunxi: sun4i-codec: Use dev_err_probe() for probe error handling
  ASoC: sunxi: sun4i-codec: Drop redundant error messages
  ASoC: sunxi: sun4i-i2s: Use dev_err_probe() for probe error handling
  ASoC: sunxi: sun4i-spdif: Use dev_err_probe() for probe error handling
  ASoC: sunxi: sun50i-codec-analog: Improve probe error handling
  ASoC: sunxi: sun8i-codec-analog: Improve probe error handling

 sound/soc/sunxi/sun4i-codec.c         | 89 ++++++++++-----------------
 sound/soc/sunxi/sun4i-i2s.c           | 28 ++++-----
 sound/soc/sunxi/sun4i-spdif.c         | 23 +++----
 sound/soc/sunxi/sun50i-codec-analog.c | 11 ++--
 sound/soc/sunxi/sun8i-codec-analog.c  | 11 ++--
 5 files changed, 63 insertions(+), 99 deletions(-)

-- 
2.43.0


