Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30445CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 07:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+qJ4YHyeQCm/Bg4W28ChXgXo4YJ3WH+NhGRvqcilHzs=; b=zeFs7pgsmlPxTjxYtBiJ25MZd6
	BYlPIjyXf+J5HYGDLlTl7moMzK9pJF9hUf5yxsJVtlbZTHDF3rSWpyixi2s2pA2J1bdDBoZmwUPFn
	6qVJlfqJPY/F3d24orUc828dj1tMD15SmkRYEVaOj6q7kuLdOrW8aICmCt5mL5FNxbDOO9Of51JMN
	0vWia4eyapRWTIXkXvpR1OQGDcBw+Z8DKWk+DO7ChfuFnrCZ136QCZMlPT57E5NFtkGt9ApN210YT
	dfiCkodcf31FjukPSvHKYG4uM1e6rbqHb42ZUiHDekCcu6CKtCUnQ1Q/OMJyVQV+DlHH6OGpZy20h
	MUlKBv7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKAby-0000000FSZD-1XAX;
	Tue, 05 May 2026 07:54:34 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKAbv-0000000FSYK-3rcP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 07:54:33 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-65c21049dafso4623741d50.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 00:54:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777967670; cv=none;
        d=google.com; s=arc-20240605;
        b=FmdMZVJUM+StQGZ+X915n4MjhpyZKjOynRrOfA0/JXV1bEuVk6a2O5kPMsdDrgZNAP
         loUA5KegSxkmenJopYPfXqBYVbFLFF4Li7IubaKa7Ntsqp/k5cwagY0/h4A3Y/w5zkHl
         pUh8dHqTMiE1pra7KK1oavgOKpVrVCjpTJTCS9rGdhJluoCfDS+OGkah016I04jtj9hd
         tzcRW7dMk7d5J4f4F76tG6pkIJcC3QhAjqlheZODwDS9tNfYgNEfpfGAEVzUiO6lJado
         Fh3Qmma5Jg+8+PX+DO/umcH7nrclhw0C4IycHOq7BVX8EunlManuy9l7cqGBpGpaHL1F
         Mtxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+qJ4YHyeQCm/Bg4W28ChXgXo4YJ3WH+NhGRvqcilHzs=;
        fh=wcC/c6LNN+uTtRxkiLAJ5H2NS/Xa3dwh636SsLgtELE=;
        b=lOXn/1/CKiC8G5eDu4+FWeYBSmJ0kQcqEMs25GvhH5UjwRQ6+3G5JxkW1ib/q9Urt1
         ZE8gfDovTL5eLhbRlM6GXCN0p/jdq7STIpFH5z1w/Y9jZQZXoAnGp0tQskaONMqc5OLh
         Zq+wFu1GC+OfaF1GjHVlNmt5CnNZHrlaLNiOQHpkGzxMLHYqtWa9iqzfSss5DF18XdOU
         kbTvQcUhg5ShCatBySHkchTMdX+kkKOwOnbRIWznxDLxLrLAmxLMewVB9VHn8du1rbX/
         2xHG85Czi165vic64sSIbqcMoOXmxkfueCKMy+0FB+lgoMTqvKFcfQNNpQNtV7h5nyC+
         UuZA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777967670; x=1778572470; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+qJ4YHyeQCm/Bg4W28ChXgXo4YJ3WH+NhGRvqcilHzs=;
        b=lij6bz1tMICsy9Nij9AMawFz3WDHSze63PMWBGeUq7qO7HAU2z4Y1qJEmhgPH7hPsK
         8zXO2597DT+hGu4TFwh2EW/flRA+VE3mR5xSegNTywZfirhK0X7JEK+t0yvUlpR1ubl/
         W/2PRFWQrQ2dx99qveY5zgtqPYO8kwfYMaAC9nhl/nb5l6aXZfoR03dtmQfr5njI0KIm
         4SKLkXtNQRXJHMeK6ZPN2JfFizyq6nKOo9w7weGRWwszwrq1I3eqh2j7mmBHldvWZRbL
         trF2Kg6ToP+TQq8xpK9U57H6LESqYQl/MjT9WOpUV1gd2zu6VgQJdh0GA0c0140YtxKr
         FCew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777967670; x=1778572470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qJ4YHyeQCm/Bg4W28ChXgXo4YJ3WH+NhGRvqcilHzs=;
        b=D05XLXF0hw/lMr24jguOXrqsFt58XOXEV/3TSzL6/D0ew+k7rmExEcVMnkPzqCSQXJ
         PQ7zmw72vb1FAln13klfJSTTJxtq8RdIcMk/OYzFZhly7XoSm0RgGuL2XRYGQPNlNJGr
         rjtYJofj8MTB/iaA3+ZpYbVApLWKQl716ilAGeWunewiwPI4T44XVSoXgEfPsE+NUWQP
         j+JR3M5MJ8dIeoQczHf3bpY3t3NCE3Zqskd6arREAYmdCyNqVmeIAVkma7D6VOGV54NT
         JzYCsPVtbAP8zCUVtEQ9qWB5xbyZWh0Ut//SD0trWzsDQrQntp+kDhpkEqeW4f8friUf
         JQlg==
X-Forwarded-Encrypted: i=1; AFNElJ8jWyUKpVIsx//ympFC254VtUJ0BXxp8PefhOR6iDBuozDyLW0jgrC/TRNClLL+qigI/kLxDpirsVZSBe03gG/c@lists.infradead.org
X-Gm-Message-State: AOJu0YzueRD+himo7unQUBDReSc6BOUxnhzlpQ0KIoywJH2Ma9I3JllC
	rZzo8m/I42XLNr/czfKDMLmycowlkgFzwM0AJDvFNW3XVSBlNVMaLl3maY39vwnlvqcAwRvzX2O
	z+n7h3c2gTqDrnrnCrDbxtxiCI9AEZKs=
X-Gm-Gg: AeBDieu2K8Ck2Ytwpk924in77jOF+QTIBmf4W2HQDCGpOXgNxl3cMmetPPR97wg23bZ
	nJv790i1VmmSw+mmEEIFXnbMNcrqml/6SiztHXXr0WsSw4SNGOFSTeNf2Q2q6fhggs6Skr0f3Tz
	wtk/Y1sWhhCWHY3zTSVhusp2IydO5aWcY56md/CrLUHudo9rp1SDIlxMxJoBIu0U8xwtUTohiLy
	Z0sFEnzpMWDqyU1spGB6tk4gHG6JDItSFIwrdnmA2jqXTzuvAvFPUN9kVItnxKMEQ9N7TlHGNXR
	sXk0GT6GpoJaIszSQ/4=
X-Received: by 2002:a05:690e:130b:b0:65c:391:4553 with SMTP id
 956f58d0204a3-65c3d972826mr13438227d50.2.1777967670455; Tue, 05 May 2026
 00:54:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260502115528.530401-1-lgs201920130244@gmail.com> <afju2dg8fZ_RSD7-@lizhi-Precision-Tower-5810>
In-Reply-To: <afju2dg8fZ_RSD7-@lizhi-Precision-Tower-5810>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 5 May 2026 15:54:21 +0800
X-Gm-Features: AVHnY4LouAC2lU1dj0J8xcKYYWaYsdxpQJ4QBxgr9v4zBA8FqVVNp9OP76U4_MY
Message-ID: <CANUHTR8VCdYS1NdTXU_P1hAkCwiZ=pbTApv3B3ShLB678Son9Q@mail.gmail.com>
Subject: Re: [PATCH v3] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with
 device_node cleanup
To: Frank Li <Frank.li@nxp.com>
Cc: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_005431_962870_453B54E8 
X-CRM114-Status: UNSURE (   9.26  )
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

Hi Frank,

Thanks for reviewing.

On Tue, 5 May 2026 at 03:09, Frank Li <Frank.li@nxp.com> wrote:
>
> >
> > This issue was found by a custom static analysis tool.
>
> Nit: needn't mention this.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

I will drop that sentence in v4.

Best regards,
Guangshuo

