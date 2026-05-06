Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF35CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 09:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sE63xfK9tF0qLxfLTzfosY8+mfJCa4vX8lI44vR4HdI=; b=hV3vsZCGPjGFCM4KXDXs3tSEjX
	lVPvhFWfKyzi7YhwzL49BLrvFSnzjCs4UD7Vg73dTdYT9SIXilWaxgA0og7PTsS/yyWWRxnpR8Sr5
	ghNYQQDAqRptWzemoPY+14HRVK1RUSQd1SJtjw5b3oIR4cgYQzuDLm2CvE5haAh0x36EVoTKex90k
	u7wpWrl/9rmxt0p4ZXxrDs0sukMDHRB0mOkR0+doJlD4UxY8DgKI5X2AIw9WjapbRktj10WQN4vob
	0d2acme0bnTN6NTm4jAt1WpA07dpeOOVBMNeySd6rtOMzesKf23d+XnAZewTJDeDw+C8QcosdPvyh
	rDHLimrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYGW-00000000IqM-2nlL;
	Wed, 06 May 2026 09:10:00 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKYGV-00000000Ipe-3qEO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 09:10:00 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-64937edbc9eso5217213d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 02:09:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778058598; cv=none;
        d=google.com; s=arc-20240605;
        b=CUrOm4tS75VvB/VdSZ8hJfrS7pvbmpXgM8yW+gxQRZ7mE89oyBD8PFdo2y3sPNpOPG
         0FvWftd2f+lQeL0QR5dPRfmtwVwDehbxMUttzgD/2fzp8/w0qpSthVfQ9y3ctekpHTJk
         LrkLHznMPOeIRD/PengtB77tKfM/XzKRCF6MKAABD8+cGyFjlizW4H1GmR45UJzYNN09
         OG+LEA3wH6JoyI7UlCLKhsy579gIMq2c9ISwGrCZj1rEuRkpiZkiNPOOHy/bvdASnik+
         we4ioAuW1u3TxNAd5D4LutvX4AKdwJNpLctGzCGkDriXesJMjwHVJnolutNY6/JrH9cA
         EC6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sE63xfK9tF0qLxfLTzfosY8+mfJCa4vX8lI44vR4HdI=;
        fh=o68EXLELh8VibFYJp2e7O4y4vwyZKVNQkpaLfYLWR+k=;
        b=bdBB1KJvFCEtddT9QBKOCsewZJzFmHSQkP74QZ36mB0iKQ5DR7hOVFmNdeHivW0C9J
         lxjFCxb+Y3OAfro67LTagNxn8IzVs5J7k3CqVAi3ASuCM0XKCLlajQf2PULx4UsbHJL5
         6612WNLy+F3F4t4L9f6UimORk3yKAJbkGVs9iP5NaJP9GPb5TxMRKwCpT/AHUgI8ehs0
         wBFCFWY6fRTTZ9c57NIsOWr6hiXiTVuTopRaNf4EC1VR3+yiGg8JoJuOPWJskJuftuvS
         UN2ESQJQkPTKiq0lm3Zp1SItEG3DAh1Rcj9LUP68w/RTz/vcHWmrAWPDy644BczLRlLh
         0gRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778058598; x=1778663398; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sE63xfK9tF0qLxfLTzfosY8+mfJCa4vX8lI44vR4HdI=;
        b=WSNVo9nz4E5Liza8VMn4yIbcIMi7hR/sOs1AeXz+ITzmB8f7ch5W0XKdm352tgYB6f
         1VwvppvLOdn9QMpUNRWZwRij9q2R5b0eMQX0z1EngGM1XVxMbzXvueTnDYTXLWvo96aq
         7scklipYkoKoiadC7yhu/td8k0aLp8w0STPJjJo6DAv7Ux6qRDE05KJILnQ7H4CptgLC
         H6WQ7c1A1INVuQnjdZ3H0jb4tqOG5bU7fBDzAFKTb77qxAloKhaGytPiAgOoPWCJLiBg
         YbggdEpa2hnRem7+cZKCEEDHzmKvc6MloFpVrC5t7S/cJ5owdXIiGdQvhyPvrBP5Bw/Z
         8Hdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778058598; x=1778663398;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sE63xfK9tF0qLxfLTzfosY8+mfJCa4vX8lI44vR4HdI=;
        b=VtaTlcK4EtNsXrFT6USeZgyiDRdGK8NohjquuvfhTwOrEgHhpmOviFs7rOETMIx8Fe
         bBB9aR+I5IXiUHAYpIkB2w7+Rl4KX1eqzyHnPvPfnCTBgZ3G98RHIQkCmkesZ6W9l5e/
         6EzSv1S7rc+mwYbla9BmoKrrxm0h7Z24zACz5B5meMBPgUc7Nu7R7uLNCzaj7L6CucLS
         nCf2XStx+80sdhy9hfPlThFJ9xuNdwfbQ3lXfQEhVelzLGb4rjU/sU/9AaeXyXpYooBO
         4iBZQWp9RC6JvrkefS4neYvoO2EFioqwsrnSJEM2lEip/1VyEbVn0NUO+oy4IwGsr4AG
         t6dw==
X-Forwarded-Encrypted: i=1; AFNElJ9pGD2WG4SXBQ6ujWY5dVwM85LvlQDe9xq+jtGnLrZXxRJjJYJdAPu4HihA2cW7jRrLb6Zp59H5DzIH8b/tliy8@lists.infradead.org
X-Gm-Message-State: AOJu0YyxbL8IKT4bXqmzK6V0mhLANS6IZbOlPIkT8FRm/KhUyTn0k/Ta
	MmOgdwGSyAD2PcCCDWRifUk+C2yWjmWlMGDGtM6k03U9SOepi+FPJu02wI/ybtmvcqzmEKGs0QZ
	Y9fjQ8WgJjgsQn+2uDYr6pVFbfZxSTLk=
X-Gm-Gg: AeBDieu6rwsAmSbOt9VoQFDfmTbalqPgQLsZ2bV8D2VhvnTv4+o/KwpwCy2dQF74NNc
	eithjJUfAeJG0PL7VQSBg4i85WCS42FkZ6rboOoIEQzBG+SbUNHEn1XZkt2NZ6EMTpIzH4ZRQZ1
	3ns14WCYM3IHDPQv/avYsHUiPOQE7NbyWGw1ENn0yhlSd6ef9Zg+KUpk5VbXJCDfp4I0J0g9mYT
	fxv2L61i1Y4LZnxuTaEbRUSlUbwKO21wNmNz9oxKpcX3hdVEGOXjpfqDi3RLZcjTfSc6JcBabmP
	YPsmGaHxb7p/lXFYO8FUk5mZFTrBWw==
X-Received: by 2002:a05:690e:1447:b0:651:bed1:19ef with SMTP id
 956f58d0204a3-65c79a4a569mr3077966d50.62.1778058598028; Wed, 06 May 2026
 02:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260505082145.603262-1-lgs201920130244@gmail.com> <afrn-zcfiRpJzIcO@raspi>
In-Reply-To: <afrn-zcfiRpJzIcO@raspi>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 6 May 2026 17:09:47 +0800
X-Gm-Features: AVHnY4Jk9YyDPydkL71fov0bFSSu9j0Lq1UdfKpQsP_hQX1hR4bNL4d9pygNLng
Message-ID: <CANUHTR8OD=uNMC3aVDc2oNeUwAWcsPsCRda+9RckpaUOhwHSqw@mail.gmail.com>
Subject: Re: [PATCH v4] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with
 device_node cleanup
To: Liu Ying <victor.liu@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_020959_968218_7A2B797A 
X-CRM114-Status: GOOD (  12.16  )
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

Hi Liu,

Thanks for the review.

On Wed, 6 May 2026 at 15:03, Liu Ying <victor.liu@nxp.com> wrote:
>
> Can you provide a minimal fix for stable tree by not using the cleanup
> action?  You can add the cleanup action with follow-up patch(es).
>

Yes, I agree. I will make the stable fix minimal by not changing the
helper function pattern. In v5, I will only avoid using the cleanup
action for the endpoint node in imx8qxp_pxl2dpi_find_next_bridge() and
release it explicitly with of_node_put() after
of_graph_get_remote_port_parent().

> Why do you need to initialize ep to NULL?
>

The NULL initialization was only needed because v4 changed the helper
to use an output argument together with a cleanup variable. With the
minimal fix, ep will be a normal pointer, so the NULL initialization
is not needed.

I will send a v5.

Best regards,
Guangshuo

