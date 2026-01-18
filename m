Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C6CD4A5F4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 08:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sRCewco8tgHw4XXcafKVb3dqNsijWHex/AmSsnm9Nw=; b=3vng9/iAKpcTW13INTJ8rchybA
	kZPo8x6LC+5ge0r9fz0ma8Wb9/jO43G0vBZ+Ep0LsVhJD1RnNFPHD33h7HFQcqG7eV4O/HNoynRR0
	+b2tuYheuARKs8PHphbP2UKZb/2MYp2onKxo/OffTPJGH6iu+eZzqnBpPYShxrOC4E57xP5quF/Tv
	yJZzARH3QcBdv9QWR2ZtV+n5+vBeioIn9AmnzY8iX9ZQpDvZaSJPSrm0n9wYQjJMpCBr1BhgLzuwa
	8jzPYigvC6PeT7WHyhTF85A58goZtZu9hqW/JDeYWOp+cVhnfWmscsDyIvpGtJT/2UEXsJriVDbqp
	oJCfIlQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhNkj-0000000H46o-2azF;
	Sun, 18 Jan 2026 08:03:20 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhNkg-0000000H45B-2gIO
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 08:03:15 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-2ad70765db9so3146976eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Jan 2026 00:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768723394; x=1769328194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sRCewco8tgHw4XXcafKVb3dqNsijWHex/AmSsnm9Nw=;
        b=ehmrMKqs564AT1jaC7HA5LyeEIxoeJ3qCwQQKYekZ8HsUZLUwnrErQs/twjEW0Q1Pi
         8HCeoj6nCqVS3mDpHNfmBX6+sLLpxtb6VKWv3tFeewhq8HyKN6CbfrJXtpO3fvulXDFc
         LfLM8YBe6Kcud+Tw2n45giDQ0MlPrUlw7VDwDUNhfegZ7ZrZf56QsmbdOp2Dt1Q2maiC
         jL6/FRP2HMH8G1QTQ3f5CR1pEf/a6Q8KSrJoNxdt9lj8aTyrQYd/BiXJjyrmomSP5Tzs
         qoJ76mBBUiv6XuhAfeObmKbC/TxxPnCPTfFD0zzNpITUpExwOeJNYX1tx2Mb3BoDolM1
         W0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768723394; x=1769328194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5sRCewco8tgHw4XXcafKVb3dqNsijWHex/AmSsnm9Nw=;
        b=gU+UkFn6+IOr+nV8GGmNRy6MYRaKsAZgdoC7bldoJZjxHTwOFyJNx8iy+s8xDUOKtz
         fXZGKdAgeX2O/CqpbJtobf34DgQymnRXWTQcuv7HkLFl175lQ7U2+fls+goEImxGgj6q
         RiE0Ygh7U6Ba4u/AlaS0lI30ufbJUjm+GU2RmGL5oXkK++db9HT+9gW1eveDXhxJoAy8
         /3mq0G/YD+wXKoB3aSsE0nDT4nczvrr6W8+dm44QvF6CnM0Ck0py1P/2iorLAK1RNT9p
         KnrAQpenDjjaalK23A+skdHGrQDgUikkk9XFJj/sq9ixVzl2OHfTPW+6hTMgDH0xVPGF
         B7vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuwVFXTcgoLsnZ8Vs51tKu0K82smOCEU7bP2O2tYFoMtQRZuEm2u22L5NpOtJEZDGJgwwCCAkSamvtkJIPqeuW@lists.infradead.org
X-Gm-Message-State: AOJu0YxqEpCHIn40TbZONPJto+wJAAqEfUlbXmno2XAsDNyPcWDzTZ/7
	ItXJ8kgngsHIN8LjSzA9AACCyYYDLpMeopoVFW28RE2TaNFWbN0CQB8b
X-Gm-Gg: AY/fxX6Vlbk0bx6F4VrfUmzBSk8q14Hl/ksUr/3DllhK1r6ZDsiPvnVIhztCBaw51WT
	ImecacTJdwjK2fwDlOV0CrwAL38/RAwg2XwJC46PDopOmHUl6J5UuXPIXKNFrHW0u8cEpdbK0rA
	jD2TA0GnGDyAXrhrzTuu54vhczur8y4e1fo/NPrnTnV23YHvoj9HNy0NoXdmWeEjXydxOLuqyaB
	SVguUE/t7EV+SbFHwUjSmekn6LWnkJYXfc0t0j6sr/xTX0Jl6ZlnHyxGhLx5E9nsWfkYCyHFJoM
	nknYBJiRNQT4nV8ANcD+Hc3X6cHAIQdJ6qv+kOFmyeHqwhIFu8brMTs/B8NCX23K82refPMSaES
	sUC1L3EYEwyT8EfJVGThulq/kb3yIZtR86pwQ3y9xKTImAl/8mgryvz3HwuNS3xuMT5nS7H3AU7
	lZiB+els507DOil12E1MPccyJpqMlZYzho791pQAbrnQQLj4D3ZUrvZ8H6r3uAzD/bNuFwNnzqr
	1KGd1QPFo+PkrNUFg==
X-Received: by 2002:a05:7300:c86:b0:2ae:5275:6901 with SMTP id 5a478bee46e88-2b6b503d29emr6365433eec.34.1768723393925;
        Sun, 18 Jan 2026 00:03:13 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3696f40sm8460212eec.35.2026.01.18.00.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 00:03:13 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/4] ARM: tegra: Device tree changes for v6.20-rc1
Date: Sun, 18 Jan 2026 09:03:02 +0100
Message-ID: <20260118080304.2646387-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118080304.2646387-1-thierry.reding@gmail.com>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_000314_744870_FCAC7EC9 
X-CRM114-Status: UNSURE (   8.63  )
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

Hi ARM SoC maintainers,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.20-arm-dt

for you to fetch changes up to 4d93678236678c4b6b0076fd11f4611a22b7e70b:

  ARM: tegra: Adjust DSI nodes for Tegra20/Tegra30 (2026-01-17 01:18:38 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.20-rc1

This update corrects the DSI Device Tree nodes for Tegra20 and Tegra30
by adding missing properties (nvidia,mipi-calibrate and cell
definitions) to ensure proper MIPI calibration support.

----------------------------------------------------------------
Svyatoslav Ryhel (1):
      ARM: tegra: Adjust DSI nodes for Tegra20/Tegra30

 arch/arm/boot/dts/nvidia/tegra20.dtsi | 4 ++++
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 8 ++++++++
 2 files changed, 12 insertions(+)

