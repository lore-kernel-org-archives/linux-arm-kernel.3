Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83485D609D1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iYyR3yXYjz0YbNKKTg5cy3mGbrW5Do8TFUwFkEGO9kc=; b=0JJedzB/XbXYQgCyd4StIMrN0S
	yEI8PfSMs1LbivVp0Wvm5ZlEHelNqjte79An+JsGZu2G0BWR+pR80Dx9+9aMCQnIFiCciDVP+S9YM
	HwNInGwjD312bhBkjzlWK2YRVLbaTt4fu6Kq0s3gwItDuD9SJ0BqOyFJkugMO2GopuaRC/P4FMwDQ
	7AsyW7HXnf66ss6RkD3bvi54EU1fPicH5L/uSkzcVGvN2j5nYwFcEqHHlMR7DB9TbMRMzelodp6di
	y1+y7Irmr/9ZED14Ljd4d+OkF+nI0Mu8VaMcZQypC+Gi8JDrayiYUNvhqluU2QzFfaN82QgsMtJIA
	CwnBH0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFdK-0000000CuPh-2Bys;
	Wed, 27 Nov 2024 10:50:58 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFbi-0000000CuBd-3HFe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:49:19 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e3889bc7ec6so6291391276.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 02:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732704557; x=1733309357; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iYyR3yXYjz0YbNKKTg5cy3mGbrW5Do8TFUwFkEGO9kc=;
        b=QRbU+bCDXmgYAfO8hcJ/BORiogqn9ZkO3R6sp4DQRVCstCpZAY/PUa7Ad8SaP1gLTi
         AW8SpZxzEWk7bx7otudnBJbJijs+RulxM4LfzUwmXrMQyA5yNi+wIWctA4iSul8Mik+C
         Sjhf954P1N/KdEOcjlwUSvEsJ8Kf54GZIAEJPbDGiWf868hC813DQllSLar/i7XX7KfJ
         DgZlJkUsbbsREeilnimWGAMGzQmqTXY7KFPy6JSsuITslSriiRXU0gsxERQ+joB9IU7z
         5u3cn0C7MYqTdQFKWXSQyO6FgUlYC75DKHim5RnPAvV4kBN/cD4+TldEKR9q4jtGBUG6
         3tSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732704557; x=1733309357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYyR3yXYjz0YbNKKTg5cy3mGbrW5Do8TFUwFkEGO9kc=;
        b=DOG1iBQ+E1ZBfSv2yy7gngWJJXy3XU54wHJoS3zq7uE3f93BYvoBad+JohW7bo57dQ
         7FxJdlJD3IU/FlNrJs2tNp03W/0YGtOZe51fPN7Qs1rgpVcKIxMLnt8UDyhcIiMCs227
         mD4aydXZYpyKna7d+usAUAmcPEgs1wNYPI/lXkquK2F3/Ht2bL/8A/hCvsQHn8NL6OFe
         REGzlz5VMRFiX8Eg1BzsM4u6H96NjVPi4QQhN5LZkgjQ/MRO4vnZm5IFa1b1FOx4bvKQ
         vSHGoCrl/sK2jnT4vwdidGyHn9p6kqXmvczk6a5VLe0l1tMpy14E+KDC6N/Zk/fa8LjV
         t0pA==
X-Forwarded-Encrypted: i=1; AJvYcCWeipQNCuFanktdyJzThY85EqcvFiNGLabVvfPf/waO6xpe3Y7qCkIL96BfDZqe12EEjVP0kc8lCzy/xruKlXKB@lists.infradead.org
X-Gm-Message-State: AOJu0YxK8XxGdm3UlPfDNfNpLfNLNIUgFUdmWu+7Z9eEIOnVSulOOPUr
	pXbMBxyet60hRSrX6sxMiSsgXmJAaWaz5O4M2dH9MUBjAcelTWpPNoNkzUoJg0AWNFdKYHTS8Ee
	7RDibSn9QMVTWMVXoznmyiwQsJvw=
X-Gm-Gg: ASbGncv0QHeFepyEFOeU/UYPEB0JRv1FAKL+YWhyTPiQr6y5VNOto69lgzGszw3/lev
	pfYo5ehWuC4SFbFHSHnSKRyi4vX1Z5crR
X-Google-Smtp-Source: AGHT+IHuUBgbeWipGcuuSeVvP/LgXH+YzaHYRbIiLarVanu1jwlInw1N972fZqN73ZU9w+/mGXihRtV+AM8sbsNIxlo=
X-Received: by 2002:a05:6902:1588:b0:e38:b889:7efb with SMTP id
 3f1490d57ef6-e395b897916mr2246859276.21.1732704557583; Wed, 27 Nov 2024
 02:49:17 -0800 (PST)
MIME-Version: 1.0
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com> <20241126-z2-v1-1-c43c4cc6200d@gmail.com>
 <zwdpx6c6qxm5674u2sea5sgwdd2fwim4waijb2qvixf62wrshb@yqs6zurtf7ic>
In-Reply-To: <zwdpx6c6qxm5674u2sea5sgwdd2fwim4waijb2qvixf62wrshb@yqs6zurtf7ic>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 27 Nov 2024 11:49:06 +0100
Message-ID: <CAMT+MTR46HbUJWQOwG+MY8OffquekynUs_BRCbuAosLrmc+smQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: input: touchscreen: Add Z2 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_024918_817296_058AD47B 
X-CRM114-Status: GOOD (  12.58  )
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

On Wed, 27 Nov 2024 at 09:47, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> What is the meaning of these two last compatibles in the list? What are
> these devices?

Those are generic compatibles for everything that speaks the Z2 protocol
multitouch is used for everything, as this is currently enough for the driver,
while touchbar is for userspace, as touchscreens and touchbars
need different handling. This specific schema was suggested
on the previous version.


> > +  label:
> > +    maxItems: 1
>
> Why is this needed? I think it is not part of common touchscreen schema.
> Drop, devices do not need labels - node name and unit address identify
> it. If this is needed for something else, then come with generic
> property matching all touchscreens.

I want some sort of a property to contain a human readable (ish)
name of this device.

