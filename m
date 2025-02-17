Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912F3C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 07:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rEayik6VOEEEPJcIMY5xwgGCKxgBYCRm7JNtr3cWVws=; b=P2OJIF10uN1ki3JC9VcG4k0t1y
	C4oADXHuw70LvGHYMKYRmS0hGQqM3OiAdvf2ybiPNRqTvsyHmER/UeRuzoJKgdEx/tYeJWn4aW13D
	MKY0Zz8KYgT0Bd4IkgAX/qIqCaon3TB1G41spE215+cR6Ahpe8e4hwdkQrDRdKBYHJgIS0bKVDcb8
	RVysRzuF7Wa9CCiorkPG9F7tid7dPM5T25CgIcQhIVuYWD8sFzVeGXIeNSjaph3nNvtU7J6SyymeR
	XhAyiQm+Udi7WdG8VDq5TezewF6BwBc+W94KHtPPXNFF61K417hUra+S3bwf6kdkIUD+REi4dmqIe
	hmmAjTxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjvgj-00000003cgk-3ias;
	Mon, 17 Feb 2025 07:37:09 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjvck-00000003bvI-30Ag
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 07:33:03 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso7360893a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 23:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739777581; x=1740382381; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rEayik6VOEEEPJcIMY5xwgGCKxgBYCRm7JNtr3cWVws=;
        b=EKHd6C9rD75FQi52eMaV9Yd3ORpzWzPC+qvH/jK5en01D94Xx0rDz0QaIQFgWXxOxH
         J7a34JyzKH/XavV5PLiy5vq+TpXFY5JavwNOMtwNNyyDoVH+PCW8WdY3B9hHwx07p5MV
         fTNH+b/mgn+VYKTNs4O+FKPJFHaGAEBgDO4Rty44G1o8W0UkXCinvA8Ih8BHCmUDXFhs
         bH+9fnb3M1JHXORPO57OP69eM0IwobWmY8oYh1mhHlc25fue5WHk34P67D5nVY8/uevN
         HSqWnL/AGBEI21WtBdIVsYj4YQjuJsw4/q2n1RtHbGU0jBDLZtZLVxzD9qKlvGwPHAsQ
         ID9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739777581; x=1740382381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rEayik6VOEEEPJcIMY5xwgGCKxgBYCRm7JNtr3cWVws=;
        b=s/xTrIaTi7/vJPuCThft7ym3ZAArXsbV2QBBWfCqZlnQncq/5OBIK0zGoSzL7dAyZ4
         RcNW2U7df9oG9FDxlyxEYsk/TYl9SqfBJDjDNZGB2IcDnkICUNo86k/ZZZCCjOMUeIq4
         L6jp4zPWt0jv+N1QmUtzQFV6XNmHSkJn+3I5IqTPM2nyfYDkw9lGS96IAt7z/6V/SThB
         MrqiO11Y71Rx+aHrpU8DZi28YOYZShrPiwhGteGCqrGlPOT4ikyFOGMUaKev4dUH638n
         /bl3ibp3WXOZz2hYkhjbzy+S+tIzN42PRVUsvY6ML2w5Xh4rVIy0LsmLYQ6iw+fkmV7m
         qqrg==
X-Forwarded-Encrypted: i=1; AJvYcCWsTRuQ3wdJhpGgyu1EQU6uuA9lemcpLFt5kLfFH+9QRvuCIFRZs26Ecr/xSxcnj7Ikt+JqZxvPnWW44XmWiQkv@lists.infradead.org
X-Gm-Message-State: AOJu0YzeRGZQTVmG8zjhh/uaDdk/5yJgFY4RTfkwU8jhBBENmiu1xmhP
	kABSmR9cvaUFRlk5UJoC2QP5RGtsmcB/QEBbsy73aT+bGpnLO+UAPn1W87jDc5A=
X-Gm-Gg: ASbGncu6njHpwSvb2cz3yqGGhkKdqpGbWqXXQDB85jvVjkSQ+KWTIcb+ij3Mr+WwAxX
	F+VNg3WhpttG/EvVYd/QmLjByDP/kcW4dE1m3CydH6Rm1/JVCppRAFKM0vuWMaJqHDUekUNkTZE
	Il8MUpEjr/86LKmwHhjZR4a87U92LWVPvIV0MjLvEu6ehCr92QL/1DdSQjh2EtIlbqEBcIWkMiW
	13TSkmTPKFlnyqX+pifcNdVgAJvFplk2APG8mmcSN9lOcD2hXI1M9W2f+SbwKpwhLLMhgzhS79r
	v3zo8BqvkjqoRdnaYnLL
X-Google-Smtp-Source: AGHT+IH5auVQWVVUALzd7Oc0j1nTT3hXLvhxHDF3eAMDVv+bnSi3aCKfLrXYNuutS90Ras7QTpnZRg==
X-Received: by 2002:a05:6402:2384:b0:5e0:36c0:7b00 with SMTP id 4fb4d7f45d1cf-5e036c07d5fmr7098145a12.31.1739777581089;
        Sun, 16 Feb 2025 23:33:01 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5dece2867a1sm6812015a12.66.2025.02.16.23.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 23:33:00 -0800 (PST)
Date: Mon, 17 Feb 2025 10:32:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: SOF: imx: Fix error code in probe()
Message-ID: <b30ffe7f-21fd-45f9-9528-d6d689e04003@stanley.mountain>
References: <cover.1739435600.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1739435600.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_233302_750927_BD10F48A 
X-CRM114-Status: GOOD (  12.45  )
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

This accidentally returns "common->clk_num" instead of "ret".

Fixes: 651e0ed391b1 ("ASoC: SOF: imx: introduce more common structures and functions")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/sof/imx/imx-common.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 5a385d140bc7..b8df8bbacad5 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -424,8 +424,7 @@ static int imx_probe(struct snd_sof_dev *sdev)
 
 	ret = devm_clk_bulk_get_all(sdev->dev, &common->clks);
 	if (ret < 0)
-		return dev_err_probe(sdev->dev, common->clk_num,
-				     "failed to fetch clocks\n");
+		return dev_err_probe(sdev->dev, ret, "failed to fetch clocks\n");
 	common->clk_num = ret;
 
 	ret = clk_bulk_prepare_enable(common->clk_num, common->clks);
-- 
2.47.2


