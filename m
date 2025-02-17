Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C1CC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 07:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Iuq9jtDgHZUGKQlgExINfZtY7T0OwXIUJbx8KDqcL2g=; b=4hkHIvE17l/alIp0+fB+6ZRvfn
	gig4qkZOz+aly7z3tIDZz9CX9lDv+d3rtYoGfVw3QNapiPAYvy2MNg3PZ4rGz3lz3Bp0MNiIe7skp
	7hHGSLol/0VM3eOlppHETQ+E86/jSmkkvtZLsNtOr5W7J4lybyz9L6ybx7LtiPnuYkyv7lDt5DIzr
	8fi1taIkPXVg+jeQhas4IiojwEQFCcaA3xrrbXlt2f4eTfrUDx83WSS8FpwKJL0ImU+DhbjAdVyXJ
	T2PaVaqQuGhKZEPY3GhGzuGuuug5q4/eBLr8g8jZ9mNwTTuoGoarUGKk3yO0oK0DARTUJ629TmeE2
	R0oF01DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjvdr-00000003c7h-1EZb;
	Mon, 17 Feb 2025 07:34:11 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjvcM-00000003bn8-2b1B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 07:32:41 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-abb90f68f8cso174439166b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 23:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739777557; x=1740382357; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iuq9jtDgHZUGKQlgExINfZtY7T0OwXIUJbx8KDqcL2g=;
        b=viuL/J1XekrIldNNm836vDvxixk7vOVq208Url7lojlH+FEMeQXAWkE7+UFx/94NVN
         nf42hd9ZJOXSNsw9q3u5ng1DFBjM34p52IDpBGqvpIc9YE/iUQVraqlPgHBsPd0+YnVq
         OCAQgybMm7hvRd31GxA1Gw5ZA03XeXmIhEJwkr6b6BarELweU8WM8NeiaMpCTvqfrJvu
         IfqMmu7ADgjQHnost3K/S6QNliEQVbhcQvyTtUgVuIrG0ag1aoCRpMyRKtXZUf/YNWrl
         RzBEMjsQoJ9g2BYVnyskQWRB8iQCUie5M/zzOgOwcZO6idCTH4rXvi9v3pqBvsxrljuI
         PCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739777557; x=1740382357;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iuq9jtDgHZUGKQlgExINfZtY7T0OwXIUJbx8KDqcL2g=;
        b=HpOIi5J+2x/cpBhaMfleGHCAqSDfqpoD5zpBP8F/qmo2ajFpmMvHJ2E3+WcHBVsoCA
         elSPo+cn/LHML+fAbJ4ec+1+OmiVPU191Z+cMj/dtwPSz2PuRv/m6w2sTc1NcsR/fHa9
         JJUzD+GLD7sSSEIJR0B4WfXSPe+x/q8OWBj9noBrZ8XMyKVJAIXDCm8KTnAmsle8DSjv
         W9trTW/N3eYikw3w5z+sT6OmhnSKRNV4xf4vh6pEgetGVEKqMYV5iX1yHf2L+6ydjtou
         uOOk/C390NC4B/a7REZe8QvlVfQXDv9joTwq+g3mrGkLxUzmHTdrfKerV6HrACi+jLwm
         JTEA==
X-Forwarded-Encrypted: i=1; AJvYcCWVHiCdSqch1LbMxBmwYTF8leBqYcWlIrwoydHnP6nzR0O238XwG88WHsyKrGCSzUrFP7ynndRMWz93pkSs/pXM@lists.infradead.org
X-Gm-Message-State: AOJu0YzDTsj7FStCiz7xVFoiLh5mHyiu5crNssjwgLLRh13G57IqWTZt
	RdxGBadl1VgVmTNMwpz9i9ampwfFtHjAbJBi3UgRjcFO1q6/8zQt4YNE7XpUTI8=
X-Gm-Gg: ASbGncu00u99923PmPIVsPRKMdzY4opxBbiTqCr7XQpJzhhZzC15HW8Uzjz9dj21NLB
	GdPg7rUGZ2KILpbOXaC91K44xLn07/qZ2sOxLL9WToWBA8ce3W1p++OODiUV4o8xo+OWdzDrIrA
	0VUGCDYgv9MFZgH3/mXxS/TDWYhhKkGCC2R68a8crMmPZGC39IhKnZrpH6O5IUjXjeDEx/h0pU2
	6d6gmLRjBKfkcihYT0X3qHWDFF4n7kRxncvxg3bwwus/bI1fGLd2Cf3mi01/MMazZC4s0/QqKEZ
	w6CmAe3ZPe1wQVGJBAYX
X-Google-Smtp-Source: AGHT+IEcdCzKmfW6zdCdnOroccwgNmmDLOlJUJcE91OJUWqcSxVf6IhB+cxML7fRc8rv7wfAKU/7HA==
X-Received: by 2002:a17:907:1b23:b0:aab:c35e:509b with SMTP id a640c23a62f3a-abb70e435abmr973427866b.55.1739777556866;
        Sun, 16 Feb 2025 23:32:36 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abb916db37bsm238238266b.165.2025.02.16.23.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 23:32:36 -0800 (PST)
Date: Mon, 17 Feb 2025 10:32:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev, Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	sound-open-firmware@alsa-project.org, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/2] ASoC: SOF: imx: fix a couple Smatch bugs
Message-ID: <fffa1613-72e8-4cd0-a4db-b6b13a5222e9@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_233238_656207_EF97E4B1 
X-CRM114-Status: UNSURE (   8.65  )
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

Fix a couple of bugs which were detected using Smatch.
(https://github.com/error27/smatch)

Dan Carpenter (2):
  ASoC: SOF: imx: Fix an IS_ERR() vs NULL bug in
    imx_parse_ioremap_memory()
  ASoC: SOF: imx: Fix error code in probe()

 sound/soc/sof/imx/imx-common.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.47.2


