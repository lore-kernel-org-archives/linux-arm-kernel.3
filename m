Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251E4CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 14:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RGPGtjg6gfxQd5la71FcBlakZT2mGW9DnwBFYIWLZk=; b=MAwHvqWSHHw1AfYWY+W18ZkQoi
	k4BWdw4luQzTawi7Haot+C3jJ9QlnDJbcIvhlV7Kxg9MHQpXSJTs35SFbOxjMsU7yw9ZpiIoJbhrB
	LBX/jxncvjvp7zSNYNJKF9Qy7SBuG8oo+LQCt/uTcsM73UgUPT0NYeRk5kfOpPfpjr9Zp3slppJSC
	xmnBQ0iUVefU7mOUkkPzGiukvHmI7+nO0pt0liVhQcNWW7ZXzIXjaS5vTi6Q1zcikED2YmAxJDPsu
	8TW9yO8m4G2VIaL753Df/uBlToEbzyrYTIcApNkEVYaoG7Se5AyY0takEW4QpmFMOR320USjAGtJB
	gYzpNL9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdAt-000000014Qa-0cN4;
	Wed, 06 May 2026 14:24:31 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdAr-000000014Pj-3Xtm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 14:24:29 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-65c6a2158d3so1665019d50.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 May 2026 07:24:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778077469; cv=none;
        d=google.com; s=arc-20240605;
        b=Nui3sbF6/m0Q0bzMbPEBe+oZ/Cnr1dERrD4HNb6OOZPtI9+uvwzueXFCyqNqQpmZGc
         2WXXa3TE+2iCy4d9N80y8OhZ509/u5uOtUSlqt+TyfKSp7He+jo1KsVrz+MgnvCHDEBt
         RLYJZEwVQZkjQ9cgtUpTKV5F4i4lVyMmXlhdU41UY/rG0oNYGp4/jNVeRg52FDnBmp0v
         WsaTJgbOvRz8buVDYg6tLNDLux6RCkfXOboA912MSPF5qAKNSIsYH0lfJtglVUrcEEIy
         OmSUDAJD9JjCmTN2MwRaPwF/2bMiOe1iSqiDjb15ok/hTKcOsJ425u9ZrUOQ3sg1OOXB
         3Ylg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5RGPGtjg6gfxQd5la71FcBlakZT2mGW9DnwBFYIWLZk=;
        fh=3YEWEtolHCPgVqfBz9tj9YF5OBTJ0ckOrsFF5xsVu4k=;
        b=JWv/ekBMzILYdMlpB7O2lOysCljHytlU5eo6o7IKg8JcKq0IaqyuXiwQHKxMOdubNK
         /1Ge/sT9VVWH35eXY0irBsYeJKazWEIXAXT8U6pxHav/x0hYNfhmcJpHzePWXCOxmtIU
         pj1eD0aRgBdKRs/g8cFfL5waZjwUcm5vyUdC72h69ZWgopB0IswhTvY6yU92vw52NZM+
         WdkyGyFJkvXLKePuxb6nkyeOn3dm2MKMPk4L2Gz4NTqv5UcuaE9XZ6lsytkH2mH+otdu
         uVPMPnszvbvjMuvj89MZSTn1rMvCjwdmlQh5PSr1CmKFGcF7fLD+xNlp/piq9e9Lt5Oc
         GXxQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778077469; x=1778682269; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5RGPGtjg6gfxQd5la71FcBlakZT2mGW9DnwBFYIWLZk=;
        b=hKi0haCTZM+6cwtyeBZ4Y7dhDYGIWD8/kJXomFTwZ1jYdhgHeBX0nYArRD4bjR3NOa
         y7E78Z/RFLp1TA225A6Jqs8qI8SzdDYUd6VKetUkmZIj0MhCj+3uGDVy6uttEE7ib+tg
         3aRXZ1R6xFYyP0/eBpfmqXtEstkXI0svU0dLKOSlCpnYwNALpVhhL5eaeRFFHHrOfn/H
         jLsThg2mqllCb/9DeoXFC9w53vGoALqv3/kZVF6tHf7Gitiyw2NwD8+eh2D9sx19zMb4
         RLd3A0hQ8SfuzaQOYgFvYzJxXbQnfEe+6tEFJxwrRGYG1hLfYMCt6ohvFQI4LqLsR+Wc
         i5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778077469; x=1778682269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RGPGtjg6gfxQd5la71FcBlakZT2mGW9DnwBFYIWLZk=;
        b=tZij32DxZSn8hBnXtNwLUipFyJWG46KtAqleUFOgu8W+BGJNazw+tnWds5IvUi3X3J
         cPPrY/CXtz8rxI26SUCxndgCnm+O8eKRdRBFBhW7ORNPAKu2iBqVwDCETE+gEA6p1Jpp
         QpggOni1Q1c3+qnTPHZFkDZO5zS+hwG2GUH+9lbWeN5uJQ9vhB/3NcU49HBZjM7YvECd
         JJvAa0/mm3a2a20mkaEWXauRzVeqTDGeyWs31xTi6pp7gtxGO7j3Bpu+BWyoJj/gkG7Z
         fyY7votA5nw1a5Nnr1q6QIHPgEK/KnvqqMQuPYHrzn3Lnsz4IymYDFSmzRb5PPPwmzjr
         psTQ==
X-Forwarded-Encrypted: i=1; AFNElJ960+jZ18v0HWjidelsAxsmVJ3EczZqYlElY0r3MLe585MotIH9hWZa3SXzxUcXMQ1LNkD49wQy5nphct1qRmdd@lists.infradead.org
X-Gm-Message-State: AOJu0YzY7TgP/gtM305I8YyaCgs/y1GKklKweB+5GNdDlgp3kSYc3hd0
	P2PLbeVyOGjRi12BV54M03JAbk5zaocQ5QsHYTWm93Uhe28i+X9WmgNSuFBtq+YwUs+fDKiEipx
	F6Ons/bE0ALKiu+5Z0B1reRy/kofCdJk=
X-Gm-Gg: AeBDievNin1gFRmQ+43ZtqfsS5cDDdlIlwC39lLl/wiw+zdQdDrm2jurRRnlUWrfiBV
	mZUdpPF5fe4J34EKbvMdDjO22rDRLsAJcp/QERqvFcFXSLl/JnfldrdfZvGvtqkOIPT+ezQl4ef
	3JVDHREFdoGi9uiISStucbUrdg+jRuFBSMDyOgoRDW0ZS10eBkH5ehVcVvqpppwp3vg4qb+3KPK
	QrUZHEIyA57JOaQU0L/8mlNXMmedcjdr8yjPhIJ1Djay2HCd2opJ2rYtDC9b1I5sMiHTJN9rpPU
	HLPZR3TTqrKC65ig3VQ=
X-Received: by 2002:a05:690e:4844:b0:650:6cb:a720 with SMTP id
 956f58d0204a3-65c7999803bmr2796421d50.39.1778077468595; Wed, 06 May 2026
 07:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260506092324.635014-1-lgs201920130244@gmail.com>
 <afsO9TxVuz79FFQ0@raspi> <CANUHTR8PNO-3hfEMCz4Zz_2ERLonE7OyNzPWtAaDtVpNB=YGhw@mail.gmail.com>
In-Reply-To: <CANUHTR8PNO-3hfEMCz4Zz_2ERLonE7OyNzPWtAaDtVpNB=YGhw@mail.gmail.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 6 May 2026 22:24:17 +0800
X-Gm-Features: AVHnY4KKgBYwbo8b0KFKRUex7D8jzHNmM2otoNT3MCUewJRlzLyKPSEF6hD8vf0
Message-ID: <CANUHTR_201tMArsXEjuPKW=drk5hfyfneG-sJDqScfxNLLM=Rg@mail.gmail.com>
Subject: Re: [PATCH v5] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with
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
X-CRM114-CacheID: sfid-20260506_072429_890757_BA315439 
X-CRM114-Status: GOOD (  10.76  )
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

On Wed, 6 May 2026 at 21:58, Guangshuo Li <lgs201920130244@gmail.com> wrote:
>
> I will also drop the unnecessary local NULL initialization for ep,
> since the helper initializes the output argument to NULL.
>
> I will send a v6.
>
> Best regards,
> Guangshuo

One correction to my previous reply: I will keep the local ep variable
in imx8qxp_pxl2dpi_find_next_bridge() initialized to NULL, since
checkpatch requires pointers with the __free attribute to be
initialized.

Best regards,
Guangshuo

