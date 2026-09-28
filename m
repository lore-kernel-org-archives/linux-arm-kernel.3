Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA74CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tHHkl+PrizyhmQl262VvRoaJ4qE1pvxLqUjujb+MLVc=; b=J9XX2RJYDJQyyTMqI3+sY7svvr
	0GGefYlUN5vbAO6OtZNQWg4sqyBeqTJHQ5/uEG/UrGEjd4KQcRkQq4+Cxw04YFxxJWmWBF+0+mLiM
	Vt1EDnlnpXklGI4e96SmFSygwFfP7yPo6/fmc0CYdJa0iFOmKNNZsCTddakhslBpnFh7Qri9l9jUi
	bEZ1GM/DQEb2r2gNhpQI2unubJk2REAllYBT8CDLllRhxzBFQcqgwszFNORuMdh8k1AcYDI+sjtW1
	bgiel6VWpPvGnMtjOr1NyrqauEAp1klZviN6C5aMcJDwJe4E4a853UDS8BzOm3udsMMvg/w1SgbJR
	n2py2GGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFKJ-00000001C9v-1U7Q;
	Mon, 28 Sep 2026 17:39:43 +0000
Received: from mail-pz2-x0c.google.com ([2607:f8b0:4864:3b::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFKG-00000001C9J-2VSa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:39:41 +0000
Received: by mail-pz2-x0c.google.com with SMTP id d2e1a72fcca58-87c90648f99so2515899b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790617180; x=1791221980; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:subject:cc:to:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tHHkl+PrizyhmQl262VvRoaJ4qE1pvxLqUjujb+MLVc=;
        b=B2qGRuvh4o5TAnfb1wupdPtEWM+/CeYW6NdGr4B5kNxYZyUWbi19gANZX83gCjLHfe
         TWISNHXyPsnyoQt+KnJ3AP6MnaPdwqhdcKpPVpFQGuNE0dRvSkFv+XH0MA0unD5+fpJ5
         hfVfwzytAcNyH2YMco63kCex9YJt5Jh+tkyvqSSSXmglql9raXgqEf2b2HBmA/yXKgkb
         MNtdOZbMdvGpK/6LMKKDc3gCheytf1h6Wkdy4iBfIBlmuIor/qXNuBHTm+mICPrJlc7I
         IKF3pd6LVe8vlmoI/lgtzaMkM6FisGoHHnHTwTA0SxDtITDPgWhirVRF9vPcgmJEUzMU
         y7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617180; x=1791221980;
        h=content-type:mime-version:message-id:date:subject:cc:to:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tHHkl+PrizyhmQl262VvRoaJ4qE1pvxLqUjujb+MLVc=;
        b=Gu3AFFtNrqCpzbqAOMt2iugw4paY5sHCofdy7zJI06KBzpeg1WYKysaX+Ch0yEnDI0
         dQOWsnpCqX3IZFsBZMeh2IOIjhZCsO5A0k87Y1f2fqrJfZa1yrRVrdUN0kUV3FizRIJG
         iHV7msmkLx+My6SMuePueoUgW+OVs9BvsgMAh1eh83UFAWpV7VwpHp91cF1AJuSIKdqY
         //YBWEVJ3eDnANzY6q4ozbpwYrob0JpUX+bkvC+l4NC54MQJXX4laUxAymyL7EDb+rvb
         qFtl1TZ9AZnkOfyG1eU3d8s8ak3TMrT8+UpBL5xC2ooGCsl7HK7M/3F9wr5A+pkdZmDr
         4Dkg==
X-Forwarded-Encrypted: i=1; AKwUvBzAwasRH9qobz3xHTfQMqGbOwr4Xzlkq/O+B8AYhg/bj7Q1f46maCSHJIRKaVQ8Wala11PLbHwRcqrhjRfMxQp/@lists.infradead.org
X-Gm-Message-State: AFuF++lWjvf/NOP4D4MHKYlKIJj5phn7eP6GG4Fcy4fI/VXWS5bu8ttx
	nnqR8muvyvEwLAqFHVE8vdN9AAD5L8sLhY3z/hdDfTL+eYqvAUPqyeRJRm11JOR1auORFr8aifc
	oR60Y
X-Gm-Gg: AYBFou3CBAFX7FUTe2FWI8Eli4Qcfvc8p6vDv8a89JHFKQpQPptaW2BSnjE7002yZux
	+i9Gv+DZq+8oGcsfynpr1Dzs3TY7aMqR9EdDsaXbIVEOH4l6IRDTgM0+4ZugwAJhF7KmAqFh0Ad
	d9Nea5n+zrPFvjmB15lHrp7HrlKnALezHCG+NrTD/YEjAd1eYsJ7R+IXzspzhizEiXsUEEKdpJ5
	mzvjML1du23sU1DuoVodVcjANYBxAYig1BhQ5zYqhfHC6mLAj/dZYoYsMbAEFJpniuX1X79s+vs
	96fuY2EOfzlUxijAJp1bFKv8F0iMqkjHyN0fvVCMcInd8Vk95e1rSnmJ/OIS0Bs6AUijkU1jAD+
	vOIu98gDurOXxdnyyYeTbFkTTT1dRVEem4no1PhQnhahDqMB7D147LaKT/W8+plgoPL3PP9xNUR
	riAu/AWGWt3CsOSxemvq6wWix/jXkJNmApPCpPaxgUSuxDDWhHCfmD+jW1tyWtc0usuMI=
X-Received: by 2002:a05:6a00:a90:b0:882:359f:ef17 with SMTP id d2e1a72fcca58-88235a00258mr4914774b3a.12.1790617179575;
        Mon, 28 Sep 2026 10:39:39 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-87feb97e845sm4583378b3a.54.2026.09.28.10.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:39:39 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm: defconfig: OMAP related updates for v7.4
Date: Mon, 28 Sep 2026 10:39:38 -0700
Message-ID: <7htsn99sx1.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_103940_636848_F6C8EC57 
X-CRM114-Status: UNSURE (   7.72  )
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.4/defconfig-signed

for you to fetch changes up to b45c06f362ee5ce9ef6402fcf57077a740cf1063:

  arm: multi_v7_defconfig: Enable SND_ALOOP (2026-08-31 11:09:59 -0700)

----------------------------------------------------------------
arm: defconfig: OMAP related updates for v7.4
- Enable SND_ALOOP (omap2plus, multi_v7)
- Support for compressed firmware (omap2plus)

----------------------------------------------------------------
Andreas Kemnade (1):
      ARM: omap2plus_defconfig: Support for compressed firmware

Sen Wang (2):
      ARM: omap2plus_defconfig: Enable SND_ALOOP
      arm: multi_v7_defconfig: Enable SND_ALOOP

 arch/arm/configs/multi_v7_defconfig  | 1 +
 arch/arm/configs/omap2plus_defconfig | 3 +++
 2 files changed, 4 insertions(+)

