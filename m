Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C906D609AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 08:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=njd05bArOgKjbgLgjHcusDaTScXAtClI9n8o3C7sop4=; b=NNEyQBxD0mosCgkh/FIWj0uLCx
	e3eho9AJx5ZpA77OKoeWYdSZR3U8COIYyyJUBCxU7UF8atuq0eMQYHzeG4PjuDvZv/Tq9LmuCMBi8
	NWFDDkl4DPfST0c4GK8mheNq+rIXp8bKKSdvx7hUZkB8AVJTeVaV0US820UczMPoS4oUFn/ix21fa
	Kwv9hUG1hT4mDR/x39J5dyHpBUth2z9cgxwRTjj8Kv0zYRcZWCwF4oLop0oI4XKPRU2j3ey7Ze7tm
	SFSjBZuuq7sHraBDIH+gGRdG5v4p9itigOH4lXHA6LmSM6em5GymJwY3cymh95hbn0pNzLZlSJZxs
	PNIuH3dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGDRP-0000000CZnl-1hn0;
	Wed, 27 Nov 2024 08:30:31 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGDQS-0000000CZea-02KV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 08:29:33 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e387afcb162so6608766276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 00:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732696171; x=1733300971; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=njd05bArOgKjbgLgjHcusDaTScXAtClI9n8o3C7sop4=;
        b=Iuxgcs58oSoqEGsBNVWzUMf0jL/eo/hl+1D/7AG1MHNsJSbj/w+F8BAcI9Ur2lP82t
         /Z1GnWPpPhFluRwWmVm4fOJH58hZZYqf5tQRACyJ1Sp8iW+fo1TYbumwOadJbu3j+Qan
         PEiMkGzpGXLbjPrpANRR3C8I/fgyo9QRtnziN5Ek2wihZljuWKGn4p56a+uJt52krAR8
         2QrjEmyTjPjyiD6ey1DTrr5JujMnc50ECPCOdnd2NbTBqF+9KLAMS2Olig1mxHYaDht2
         jCoxl6zuiXJCeqMuIfj/J8aH+weM9MwXuU1N7QKDwnj+ihBRp8yVM7MI6VxFEw68zVP/
         7m6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732696171; x=1733300971;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njd05bArOgKjbgLgjHcusDaTScXAtClI9n8o3C7sop4=;
        b=VO0CF6AMLSRsesa6ezD73Svp+vkilvpAuThx6OE61DsWnZm40Ev0mYCgdFB7zsRUG5
         X6WCdrnBoMp9P4xS5IKpTWzvu8SDJDgA+EBEigHp121LZuoxth6KSTtByCsSSOh3s03T
         yHTeamkCTrJ+oGCLfw8WUEgVrlc9TyqC5nvcXxFEzd2fnX8QBzDmwnnySsFwNaMNO+qS
         5NmBKpGhqunYAEiWZ7CCq7sWvCfGZlrC3HSytJSZC6fVPdt4Ky/CKmx1GlbHiiszn2h8
         CH9vnuwDbV1z+ZIeR2Z4kjnVRpH88rmTkWtRR8vAGzCIUgcNB1J00KjhSoL75HknTNt9
         AMjw==
X-Forwarded-Encrypted: i=1; AJvYcCWVknhn1i8N+YJqLXMq/R9L8ZxfdhDfmD3DRJsixiVpupFXrN1+p2weLOT8e31kX5U2aZv+r8a+XuTpT6YbJJu9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8Rs4cvljOcGQRMXcR9vEVDW4Sg/ulaiyR1eVzpJWka7oapxij
	VB5JR+4Ra5aiZKr+RMmE9RLLpX8gS01wfP0m9GXpeY3gYg/7hmTGsrrVRLMPPR/I30MXamNgJj3
	XlajfCPasbiYqtC8sVJon4m5aC1s=
X-Gm-Gg: ASbGncvUeKenVfc9zvrd9GNkYTsxXcMyb8QS/dobRCqCK+GBU0rxC0LIpKxNRhv/hHz
	QG8WzOYdR29jI8MX2kGgyc+prsvOtIsnm
X-Google-Smtp-Source: AGHT+IG4T6iCfTuQRbFcDR8g+9gj9vnb1SF11d4ey59iqSnin7GgRZc6RSmnNx6SkL9tm182e4/IfH05c5ENgkbSLA0=
X-Received: by 2002:a05:6902:a07:b0:e2b:df40:2588 with SMTP id
 3f1490d57ef6-e395b8a1b09mr2315229276.21.1732696170745; Wed, 27 Nov 2024
 00:29:30 -0800 (PST)
MIME-Version: 1.0
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <Z0Z7Lrv3rBfzac_e@google.com>
In-Reply-To: <Z0Z7Lrv3rBfzac_e@google.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 27 Nov 2024 09:29:19 +0100
Message-ID: <CAMT+MTThJoYLYhtYAHwh6F3LTApid9Em+eP2AZYc3JChC2b9ig@mail.gmail.com>
Subject: Re: [PATCH 0/4] Driver for Apple Z2 touchscreens.
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_002932_045008_046AB034 
X-CRM114-Status: GOOD (  11.84  )
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

On Wed, 27 Nov 2024 at 02:51, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> I believe this needs to be done at the SPI controller level. See
> "cs-gpiods" property in
> Documentation/devicetree/bindings/spi/spi-controller.yaml that, as far
> as I understand, allows overriding controller's native CS handling with
> a GPIO when needed.

I have already tried doing that (adding the relevant gpio as cs-gpios
on the controller)
and for some reason none of my attempts worked. Since there is no hardware
documentation, I can't really tell why, could be possible that we need both
native CS and that gpio, could be memory barrier issues somewhere in
the driver core,
but the method above is the only one i could get to work.

