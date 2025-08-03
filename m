Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617F0C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 20:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vm0SxJu7Lne/9TVu7ssZXea18OLLC2K5dYsygJBt9M=; b=ycwVA+2rDnggyl0n5Xq4WLj1hu
	Naa5yBwPj/4MnvhwBHnZ6YwNlcJje/Niq8RqgLA3bK5heCnuHQowqxO6xMuwZD2mkiW1edCdzy59C
	kE8nNvs+Cwl+E/dJPMAlphjOyCLBstfeetxgo+GT4T/Rk3C1+HjVURyWp8WOP8Ilb1SAeUMEkKjWr
	OwTrs6/z/5l8YW85lRPfuyBG68Zhgt53ulG2wwPPyHV96sXst8LsOGWwGTrLEj/zmDk9iEgBBtH7Y
	R5+5Vw5KTp44vwbX8cECJldcDXh4EYHcW7eDtfReoeusN/YvUI1K1eMp1OfPNKmyRmiA7aaqTE1qA
	ZnZviuOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uifXa-000000096SD-1CoH;
	Sun, 03 Aug 2025 20:42:46 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uifV1-000000096IE-39HI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 20:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5vm0
	SxJu7Lne/9TVu7ssZXea18OLLC2K5dYsygJBt9M=; b=KKRVs//S+sQ92DcZ4KMq
	u8nsdEZ9MfJ8tF9+2mIEnMKa16OXkFhageH6Q3dusOQHzpClzDFxFhQ6DqxKIqyK
	Uf3NBHVB0NKgalwxkup9TG+R7v+ahB5EFSvjt8WEnHBdbEx3SmTO6JltOg3rUBQV
	kx30VnagDoDnl085prpZDQkQPhnx3BeetweZr9+itITcepP1ErvhOlEutMUVlCMu
	oG5ZgggbyNfeSyrs5j7AHZYstpvrNGAfHGIR7jUIcMYCfycsPBiiImpXM45eWsM9
	un0A3l69l+xmhVFCkT05XjGxeQNA+OXeTC4vAwJOBCeZl7ifxDL/zHPzY62FsRnj
	qA==
Received: (qmail 1644961 invoked from network); 3 Aug 2025 22:40:01 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Aug 2025 22:40:01 +0200
X-UD-Smtp-Session: l3s3148p1@0xPE/ns7QIoujntd
Date: Sun, 3 Aug 2025 22:40:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sven Peter <sven@kernel.org>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
	iommu@lists.linux.dev, linux-input@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 05/11] i2c: apple: Drop default ARCH_APPLE in Kconfig
Message-ID: <aI_JIZhHGg9GcD-D@shikoro>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
 <20250612-apple-kconfig-defconfig-v1-5-0e6f9cb512c1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-5-0e6f9cb512c1@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_134008_062368_840FB314 
X-CRM114-Status: UNSURE (   9.64  )
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

On Thu, Jun 12, 2025 at 09:11:29PM +0000, Sven Peter wrote:
> When the first driver for Apple Silicon was upstreamed we accidentally
> included `default ARCH_APPLE` in its Kconfig which then spread to almost
> every subsequent driver. As soon as ARCH_APPLE is set to y this will
> pull in many drivers as built-ins which is not what we want.
> Thus, drop `default ARCH_APPLE` from Kconfig.
> 
> Signed-off-by: Sven Peter <sven@kernel.org>

Applied to for-next (for 6.17 mergewindow), thanks!


