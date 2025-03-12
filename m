Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B76C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 11:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3UTwYNTvM6JFmZc1v1+SJmO6PLUGJ4ZiGsTHyzVMLo=; b=2eDXmHa25JKCmSQihDrfj37lhZ
	fxr3dyQTiVSxCY2H1x3K7m3PXg+0B361ZxlL/8F5bz5sb7i/aoxMQOGKxhC/LO494RmZuhlfhi7x6
	VuFF+t5vgKRzYOIiudOTcLnFavF/qn+AORdZUspJJRwp0ajC+lNUZh94IqJFJI6HijWYp5UK4YecQ
	rPzCLUQLKwWjsiYg5HoJK0Q0r1Gz0Bw4kagdzq2Mh+A3AmBDiZo/Lm1vHUfBBnWI8jklAq4aBrWjy
	AuwpdRrXtp5DlkWVoVnFA1ubxEZFU6tqNoTpInG6u5YU6w7xAJ1FkAUn3q45XHMOKp0Rgl5XpWktx
	LURwczzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsK6D-00000008EU9-307U;
	Wed, 12 Mar 2025 11:18:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsJtV-00000008CmJ-42qr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:05:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3E9D1516;
	Wed, 12 Mar 2025 04:05:09 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ED5533F694;
	Wed, 12 Mar 2025 04:04:57 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] coresight: configfs: Constify struct config_item_type
Date: Wed, 12 Mar 2025 11:04:49 +0000
Message-ID: <174177747268.10135.1485424994901107067.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1011717e5ed35ec12113a0d8c233823e820fb524.1723368522.git.christophe.jaillet@wanadoo.fr>
References: <1011717e5ed35ec12113a0d8c233823e820fb524.1723368522.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_040502_051865_72A5544F 
X-CRM114-Status: UNSURE (   7.56  )
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


On Sun, 11 Aug 2024 11:30:20 +0200, Christophe JAILLET wrote:
> 'struct config_item_type' is not modified in this driver.
> 
> These structures are only used with config_group_init_type_name() which
> takes a "const struct config_item_type *" as a 3rd argument or with
> struct config_group.cg_item.ci_type which is also a "const struct
> config_item_type	*".
> 
> [...]

Applied, thanks!

[1/1] coresight: configfs: Constify struct config_item_type
      https://git.kernel.org/coresight/c/b5060c17

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>

