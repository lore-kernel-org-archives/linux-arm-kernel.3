Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7830AC88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+LP4xptQa+2C+BD1oGDKA67ZCLFNM3ainCw+VzoD2s=; b=xd9Bs0Wf+tJBXUK6NYHRsEFg/G
	HHpewE/RTe5qIivSKN2bETaVjXxohXnnUocS/SuN084EmFiE3AptnNgVoPXHYmAcJ8QkJZqnKfQ+0
	7s5m/6gKvfxLcMP2yUBHiaZz3SUz33wjuPSe5+yqeQ+tPxOf7SEzJY6useDfZ/ZsG3IY+YoGRIOWj
	mY4zjUgMfsxvtfv1jLR1qOP/gGWL58TcMZtsUD/XTyTZl/+/Pj4jq+w2rmxcTTxsBzar7ODTpuvr8
	FQGDJ0s+EaWa6SHxK4BmHmN34NN3tOj6Bl+U7imVh3dMhriIq/cuVR/5aDTTjJMlBTPddi9m/uJ9m
	F0kKjd3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mV4-00000008vfy-1j2U;
	Wed, 16 Sep 2026 10:04:22 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mV1-00000008vez-3Xi6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 10:04:21 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6350f89so361807f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 03:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789553058; x=1790157858; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+LP4xptQa+2C+BD1oGDKA67ZCLFNM3ainCw+VzoD2s=;
        b=EOiXVdu85uo7PVqNqNkRl6YzcwAYOWu8rN2AO8+I40wFobYGlvN1Y4imkzPK37Wgpo
         gPnDMUeXxz6WyH2Z4H96ZXbFPlqHH0JhXoIEFQDP6z0xZ6zaKxk27m3poLHObQxYm88w
         NiofLzMEbdghUr/jSGWwwKeIaddkCLsWUqZ8sWas0XcmfnYHbPgforXNqqSZNI5NggUR
         EpBZOHUGeWdbGgSjlDYFUg27sA08+ROfaSJqNgtY9BaeS7M4EAzRiAozc2aNv3MlQu7w
         eXyhMI2zKUsTTt9+BADezsRVDrblFB90NxwXRI9RhVZA3uyN6EMM5k422HJzm+4KYke0
         xA2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789553058; x=1790157858;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1+LP4xptQa+2C+BD1oGDKA67ZCLFNM3ainCw+VzoD2s=;
        b=1ysb3g5woxjjtPe9EJKuWkC2TmWRznpetrgcmH7qSTiMaGN+V7sTkLA48d8qjbvFhP
         U8LbteEj5FW/b5UEoojaExFqDMy2HqwhfD07s3DlYgIjp/r4JA9v/avxkbHLM+oGH6bb
         oF6U3THVfGUmCHt/7W6OsUTbCRCZ3vQ9835WVhXpHDET5UBtNdwwxjXX40g9pQKHdgFD
         MjdYhnG8CyWCLoK9Bmd2+nsl/sAl7BemHNsmvrlI+rqk5kd/Z3+5yn2wWaqAwKsnUR7F
         7stvC9leqQqrl63SrX5q4EQ14QRH3ZMQg6y/YZwatT7VXbePAvnx8r9Zzmbqsp/J7CJO
         ttWA==
X-Forwarded-Encrypted: i=1; AKwUvBzbAZbvl8+PcnOpkXPSWDHqciRG+3EVr45sf+14pAlUBUpSonjNYA/npYTgY+rJcpuJ37cozHf5ppvMYTUkhY0G@lists.infradead.org
X-Gm-Message-State: AFuF++n/wl5LcjQdEzVG74RB2iJalsSYRyqpjgYLtAzI4aC0CxVuB4cR
	6M5umPykH/bDinOLl2QLmPYpOKMLfNPiVh5/RtRu9B+wTpjI/myFCOqQwMLAKYQhTXE=
X-Gm-Gg: AYBFou2UUsLTwpluUMENtmJfXKpahTqf06l6+o/uy5cudb4dpJalfDQlcjL+p26C27B
	z0FoKHU0zUYkFYgQAmiG+z7YoXQIbHPQt+l5tDnlizV4WRQ1c28g1zEB/rgOO4ZIpMFewUWTJqm
	e1b+X/u9rfGMC3muEQNPbt/IC+hPc7LLfjhZ0zuFtfy0ex/x5E0zmkvgaaRohs3bkg1uzU4B30M
	2uFLzT+RyWTPgS00CP1ncjhX/+6cq0f63vGdFJE3yYDHr1v1R9/Q51LYUovk1hy5xQTt3c8ayYz
	N0Ec7hNcaIws2lUcLV7xYkB0Qj9CO+cuABvCGT4K6w6mzYao0UKlnvG6V8O4IaCZwYUTJllhHcc
	Ui2QvoacHZs3rTBaitc/wsE7/LbGQLqZKmsfyqg2CNAm/NeI7yKp0cGHv8epQ/29lOhjevL5g3r
	cIq6GOi6vLAULVgm9Cwm5PaRiPtUgX2DznXWFpOzUTZ78I1281C70F0yfeJMXrfrwvwvndXhPz0
	ujzP9fgs5S8
X-Received: by 2002:a05:600c:3584:b0:49c:ee36:10fc with SMTP id 5b1f17b1804b1-49eac4678b6mr26145655e9.8.1789553057754;
        Wed, 16 Sep 2026 03:04:17 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e84805db6sm35844635e9.3.2026.09.16.03.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:04:17 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lucas Tanure <tanure@linux.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, 
 Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
Subject: Re: (subset) [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline
 clock real consumers
Message-Id: <178955305678.2918771.10810230842213506975.b4-ty@b4>
Date: Wed, 16 Sep 2026 12:04:16 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_030419_914894_83925D64 
X-CRM114-Status: GOOD (  14.24  )
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

Hi,

On Sat, 05 Sep 2026 16:32:30 +0100, Lucas Tanure wrote:
> The previous series for the intermittent boot hangs on the VIM4
> marked sys_ampipe_nand as critical. But as Chuan Liu from Amlogic
> explained, sys_ampipe_nand clocks a pipeline stage that the
> hardware design inserts in the bus path between the SD/eMMC
> controllers and the NIC_MATRIX fabric to help timing closure.
> 
> So the clock has real consumers: reference it from the three MMC
> controller nodes and drop CLK_IS_CRITICAL instead.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.4/arm64-dt)

[3/4] arm64: dts: amlogic: t7: add the pipeline clock to the MMC controllers
      https://git.kernel.org/amlogic/c/065957517880dc7053e0723cc9532b6e78c8855c

These changes has been applied on the intermediate git tree [1].

The v7.4/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


