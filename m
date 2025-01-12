Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AE6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 20:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJYZhiH1O+bZsc5L8JaNjFOdX3p057BdE/GBSMGoaaw=; b=O+miB6zLR5wZ9Xo8ljRy8ZzwNb
	HvkSCZseJ9wR08VXVwGYRTpgnPK319+OUYPJHkBZayO4JMqsNx+g0KoZ9wqUJtk+fh2wzP9jmK7yA
	t29ib5J7GehgWpKbKG7hElY+xleWYUT+LNdw3HluMKkpMBWoJx9u20CM4WOsiDE/ibwdHpFHCTVGI
	rqW7OylcbdhrpKyroPmAqqj2US2a4rfLmEEsQ09U6tWawU0/Vk614Fxzy5/z79FGIfMk/SYOVF967
	cisY5L4nQrI4Toney6d10jpAhtfOiSwOg8mb/ItcjTGfTAJY2Ze/mCexeGJCEjrzdbNllNG6bh9Br
	kgH40XTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX4ZS-00000003ORf-1HmW;
	Sun, 12 Jan 2025 20:28:30 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX4YC-00000003OLT-3Fuf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 20:27:13 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e5372a2fbddso5861031276.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 12:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736713631; x=1737318431; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KJYZhiH1O+bZsc5L8JaNjFOdX3p057BdE/GBSMGoaaw=;
        b=RftgS+ROqzxEPtiq2nk5eT6MuVXvrh2x1Sde20HTlpTSWty/EmxQXfeKwuo6+9lWMb
         sJMJcXJcU6yjERyMb8IHBij0Ldqi98L2q42tikYxub2pVD1geMFAyRXVJkTMArsJzwy2
         2+1AtjudcGf+dYCw0e/FjmbSulRiB1DBSFA9zrK7wHpOjnlcGfcH5BEfsVt9m/JGVzYE
         Zp1Xvrxw/HtFskQtFjk6nT3A0QbdOuyKvsw3VfIcVeR2MBEjgMExyfKKEcN+RRiN+7c0
         fOAyb0Ktb3cvWDifAbGLBmv+zL4QR3+jbn+C9hTgqa3YHubc7F4xn9k81tYWHQPkubXw
         bBgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736713631; x=1737318431;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJYZhiH1O+bZsc5L8JaNjFOdX3p057BdE/GBSMGoaaw=;
        b=iVbJ9MFJVQhGmW9ryGwRqLtX3FpjggTtE01Y50ABlrVweTaTpjMc2VuUUmjocI63fq
         pvgBeonkSkVdhAfbg9hIEJBrdNzLRQJhHcTVj1Juygq64wGA086squ78gRBJvuYJoZlL
         U9a98OdyW2OeRXt1YbZ5f0CItUDY6ymGQx+U2/QxacohJuDpzsweq3I/ZDTVKywde2LF
         KXjfB4o4TQaBp4dGVTwgL5cy/VgcOjrIpz/sLAThV8cBq81VPfJXHzyfpKXDcyHxiTsn
         1eQ6XxMTJPU94V0E8wvA924BzxVk08GpTpu1itq5nASjUf2igaXT0JFg9Mm2XysXCwyH
         pOnA==
X-Forwarded-Encrypted: i=1; AJvYcCVx5txIt6fPNmYfpDzLeQhJtSYmxQx04criQvCTQKNDQz6LgXw8LqLr7u8sZTLsPj0l0OPCSxy5Q4jQSOXQYoVY@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwn52ys3YswSqY7KCvjL8MhpXY+VgzBLVu4P7eTOxoVHh1b6r4
	mxw1k8pCuSHgjEugmJOkuQNRdTclDrSLvNpiAjfY0G03XKQlPld2q8al320sTNvdUzY2vvKA5LG
	Ld20XAq+gU1NohdK0+HOdICJMU5o=
X-Gm-Gg: ASbGncvBcfEMVvoEdTjRbsG5S0JIWgM485NgmyuC1ia+KVplb+JL9Jcm9AoLzkeLV61
	7DtxvivjrZAexRCidyGNB42d/GPXHcQgN6OJCatY=
X-Google-Smtp-Source: AGHT+IGZaC/OlbRbsNvYaMYjxRBnL+2yYyfV0AIbRIBDdrnHp3fqv3tpczf0rasT8ptHihHYsOZGlHD6v1QG5rnyZfw=
X-Received: by 2002:a05:690c:c8c:b0:6f1:5591:2c6a with SMTP id
 00721157ae682-6f5311ef109mr147703997b3.3.1736713631265; Sun, 12 Jan 2025
 12:27:11 -0800 (PST)
MIME-Version: 1.0
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com> <20241126-adpdrm-v2-3-c90485336c09@gmail.com>
 <pokf4zrrm7utx4dlq7sfob3pb4m2dh47eyw2g345tvh75x3s2s@ylajym3brih3>
 <CAMT+MTTGtmMvbPy7HvTQ+AdF_X4dTcfXV5n=krm414MnXYqxjg@mail.gmail.com> <qowuzrx7s76r3soelwcvlbnksvstlpdind5xxejuqeeohjzsbh@evmuvvzxp3qh>
In-Reply-To: <qowuzrx7s76r3soelwcvlbnksvstlpdind5xxejuqeeohjzsbh@evmuvvzxp3qh>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Sun, 12 Jan 2025 21:27:00 +0100
X-Gm-Features: AbW1kvY_ntIDfWPnmKQupEStaGCx1YY-X1bjoh686czSMiCWmY8vjsKf9KrYKtY
Message-ID: <CAMT+MTTOeyAKUDYYwN+hO_QVBhPK4w7cktx5LQyrxrfDTq-wcw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] drm: panel: Add a panel driver for the Summit display
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_122712_817626_55976973 
X-CRM114-Status: UNSURE (   9.52  )
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

On Sat, 30 Nov 2024 at 12:36, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> Please add BL_CORE_SUSPENDRESUME option to the backlight device.
> But interestingly enough, none of the panels set that flag.

It appears that setting that option re-orders something in the resume process
in such a way that the entire display locks up and becomes unusable until
the machine is rebooted. I will be sending v3 without this change.

