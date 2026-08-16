Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB0BC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 11:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jc96mxmG5lKaawG+ldy1b/MyHnPfRmSyj6w7fW+V8nE=; b=vQkxRMr1yszfGYuQpdqU5hCk5B
	0TXYWVUQHYsgqmNjENVvy5a+ssmMvz3ndfMsPN4rNJKsgLB0PixG1JJ1jWX/QwkWdFERKO4F7X+AW
	cd1miqcqRwrEqkZwgtVgnmoZZ1fD6A+nBvMOZPvyuST1dW2vjH/mkWcEK5Vbzto/zx+J3S+08yl0r
	ilQ2SubYJMu5ormd2QpjJgXF4twYi7xtsJkXUwt/vHjjUncXkpbOhcBulNvAsljb/7U7M5Rj+2XHd
	8JD0/9MdseLpApso3cDNCQSi7rO9N5vR1X3Lx4vyTylrGi/89BANgbfOJr/+X9m5yUKmE8Ch5jMgd
	fes7XFvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvZJT-00000004jJM-3Lqk;
	Sun, 16 Aug 2026 11:46:03 +0000
Received: from mail.zlab.su ([109.73.193.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvZJR-00000004jIm-2sfH;
	Sun, 16 Aug 2026 11:46:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CDF5BF955;
	Sun, 16 Aug 2026 14:45:44 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zlab.su; s=dkim;
	t=1786880757; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=jc96mxmG5lKaawG+ldy1b/MyHnPfRmSyj6w7fW+V8nE=;
	b=WGjL7sglgmjOlqBkToICXDxrXVgFe2epa5glSZBr561V5iYakoM4E5RDIzAGzqPXmDqHXT
	cs9ap10YICUaiQUVVtrNGlXxFoMd606h/RLNvaz92K4AQVJYykUA2FKCzi5v2oG14C0mhE
	Il2SZp2Iv8cwyF+OMPND3rn6YETClrPjYVAjG2d6ynFv1XBhaQNQMPjjhR2F9Hsb2uc3s8
	Q6I09PRlKwcMgmjNiIs5eS8WXp37I/YvvYluRogeaMu9aY5qfP5yrKqX7BMh/MhnBoMRsR
	GdLM5qFRFFqUXz2YCcyHQrkJgKJqm/JqdPnLDCQKsaY/pLfSooqWP0L9yvMtZQ==
From: Vladislav Leonov <vlad@zlab.su>
To: jic23@kernel.org
Cc: andy@kernel.org,
	dlechner@baylibre.com,
	heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	nuno.sa@analog.com,
	sjg@chromium.org,
	vlad@zlab.su
Subject: Re: [PATCH] iio: adc: rockchip_saradc: Add support for RV1106
Date: Sun, 16 Aug 2026 14:45:44 +0300
Message-ID: <20260816114544.35502-1-vlad@zlab.su>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260815022036.7c47585e@jic23-huawei>
References: <20260815022036.7c47585e@jic23-huawei>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_044601_930145_6503D04A 
X-CRM114-Status: UNSURE (   4.66  )
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

Hi Jonathan,

Sent a separate patch for the dt-binding fix:

  https://lore.kernel.org/all/20260816113636.33635-1-vlad@zlab.su

Regards,
Vladislav

