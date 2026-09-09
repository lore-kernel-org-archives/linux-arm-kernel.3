Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92733C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJk1P7W3r94sDQAmQK29QSXw1byQg92FvIaPYKTejbo=; b=12Gk5pPgz9cpH7fS7GLEg8qgRj
	AYEgOzYfjncjJVwhUGq6SxsZWj6a6ZrcQ7s6lU95wpn1d/eU3XwvDEGK87qPLWHzKJpvdFZIhwX0+
	cuNFyUunS29FcKTLoW1TgIX9Wi6TZe0lW/l1m/Hnc4qZF4WOL9yvoAVEhueAGIH8DZmbwtlNxBSSW
	afOO/21FVEouT3HCvAd3X52qA5TYw2TCmthsP7OjY41HXSPo86F6hSSBwfhVuwYRqcZm2QR+tjys5
	AIWKGS2chJTYnMemXCWBHlICAsdArn2StpH6STTcEFNG+K+du8LlCYCuS7FqFEk3QlRDT+WGAmoPS
	EJnLT5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DLy-0000000B3zp-1yql;
	Wed, 09 Sep 2026 08:08:22 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4DLw-0000000B3zM-1iFS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:08:21 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso46375165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 01:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788941298; x=1789546098; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sJk1P7W3r94sDQAmQK29QSXw1byQg92FvIaPYKTejbo=;
        b=L9IJWmJS8cy1kZd/OnIRdKiC1nFIcQV1q+EqZq8p/umIjs5avR9Bg82snCqll0ecEX
         n2jL2NHrC+0d2P8S9XbxuJ0y7Yr2sNx1XiMIZ7sJ/oWp8KeIX/20SJ31oCt5Y+7ngjxY
         M2EjtgP/k2qELhTFCqgGiuSvdVBUAcvhhrGqrAIBnz3j7ImX2VjRAYdzAOXLzYKm1TT8
         vZehwcnvBj4wQ/IjAO4JGQ7sN6N2XFR++0rApoVh9FyMhZ6gSlh8VmkB7GpbuAZc7Z/2
         sW2+JdgurgggAcO0lKZSAWDnFmLiApPJp/lO6Qm2uBGTgtEWricnjiOMX9gTwJMyGK7h
         /Alw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941298; x=1789546098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sJk1P7W3r94sDQAmQK29QSXw1byQg92FvIaPYKTejbo=;
        b=rd9JQHs9BbHORuuI/hvE6ZT0l00iRhqZK3iy8/pJPj8Du3jS+DObVLZiUqDA7WwAyn
         bS0SfqZOTH4i7CwhjuRy+ZzKu4/+vHmsYm1zHyAwCRASu1uPwrweDylsTbmtPXYE3qjN
         h6jVpvxA7A7bP1xL34oOkIiO7C8R50ONsjn4zsHVC8gN+3Qx/uHtBNmjY9+X1DstAXB4
         RiEIa7NBAoFrZ4hK1itkdS8IKmhq2Zp/5HReOfvazrit7Y7lbAL/LHJc6gjc9swD6hGJ
         FL4rN/3BFHTcl+gePQHZ+3HSns/woiEWHwXJ6zfOU3CRnSVc9dHp+WqMuBlDZcONlIu1
         jCaw==
X-Forwarded-Encrypted: i=1; AKwUvBxNNhkjUdTu8KlykHQRtZeGl5+8yuzQnvfBeUhqC3De0ytiRZd3hKwnCTbuPdYC0+LqY6yk0pNSfryUuTGdonbx@lists.infradead.org
X-Gm-Message-State: AFuF++m66fbP+FmCdV/VpS5wYitpQ94YwLCzbBhs/CWjTxMgXReHX+b1
	UtyqbSxx6wp4bP8NMON5kc5IgKpyzrr0Z6O+LVR3ZLVGp6hjgUgcDlqr
X-Gm-Gg: AYBFou2ovT5HZLxybbLL7mjDX19y4jJVe9yA9kgPZaq966vlOnJ6F8sOqkUNhAOA870
	odhVSK1i+0nQ2RIv1mXsLDY0NxN+DngxUUF+kRhi2bSMJJdubZjoPU3IYGr5gLIOErK4VvHhJnS
	8HMLyaxy8w9sDyAF3FKVlrRe12SoPqLXVK7QlvVUPzoz05Iyt+dTzMjy8rH7DejcmgXKBF5W4x9
	Xc0/YeJuaLvkEC641dgQcpHh+qz6B0Ot31g39krouQxD4McRgmYBbxEbm61RJODXkg++6Qw7Ckx
	g4tOtDELnngce+c+PwozKtegLGi7tmTb0iPdVIzDatUFL9oAEaeUQqb+t8Hn9z7majIfmEfid92
	bVOKkXu+y8A1tEzM5dcb/AYpWX8r/yHmyJVScGTzWPs/KwDDYvz2kHP9T8dJ9WWnKJ8XhipF5AP
	ByfGFUDrPqBbxil+kTATgqQbc56rRyazcyqEaH+6aK5cCnViBFmfQMFkP7ygOn2OlcrjjAs41/L
	gPf
X-Received: by 2002:a05:600c:3b1f:b0:49c:ee06:9c58 with SMTP id 5b1f17b1804b1-49cf821eff7mr338313485e9.4.1788941297583;
        Wed, 09 Sep 2026 01:08:17 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20db6e76sm46285355e9.3.2026.09.09.01.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:08:16 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: haibo.chen@nxp.com
Cc: brgl@kernel.org,
	linusw@kernel.org,
	aisheng.dong@nxp.com,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	ping.bai@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/3] gpiolib: add get_config() and gpiochip_generic_get_config()
Date: Wed,  9 Sep 2026 10:08:15 +0200
Message-ID: <20260909080815.2297127-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909063018.sajfn5vjk4y3oyi2@shlinux89>
References: <20260903075940.2089367-3-mehmet.fide@gmail.com> <20260903081432.278721F00A3A@smtp.kernel.org> <20260909063018.sajfn5vjk4y3oyi2@shlinux89>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_010820_478977_A8614315 
X-CRM114-Status: GOOD (  13.81  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Haibo,

On Wed, Sep 09, 2026 at 02:30:18PM +0800, Bough Chen wrote:
> > Should the pre-existing setter stub also be updated to return -ENOTSUPP
> > to ensure consistent API behavior?
>
> I think Sashiko is correct, better to aligned here, but in a separate patch.

Agreed. v6 will start with a preparatory patch that makes both
CONFIG_PINCTRL=n stubs, pinctrl_gpio_get_config() and
pinctrl_gpio_set_config(), return -ENOTSUPP. With CONFIG_PINCTRL=y a
chip without pin ranges already gets -ENOTSUPP from
gpiochip_generic_config(), so every caller of that path handles the
value today; the only other users of the stubs, gpio-by-pinctrl and
gpio-aspeed, are pinctrl-backed drivers. I will compile-test a
CONFIG_PINCTRL=n GPIOLIB build with the change.

> If changing the CONFIG_PINCTRL=n stub in include/linux/pinctrl/consumer.h
> to return -ENOTSUPP, then I think you can drop the explicit "#else return
> -ENOTSUPP" in gpiochip_generic_get_config()

Yes, the #else goes away in v6.

Thanks for the review,
Mehmet

