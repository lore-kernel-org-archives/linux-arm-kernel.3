Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F945D58066
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 11:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFECZUVYn+5chgSQNbqMPjSGONkR4VwEA2mP4hQOs0U=; b=iudGORcOJoaM2Xxcf4AFvZnm2j
	6xndjAeBOxj4Qp7frBULwZU7RgTmezzvhL9hPRkcdjIMecdZWGXoFGaBTRUPHD00WEhe3SzJMAxcR
	iAo0eaCgzdf7ao0nhy8UiGtUY5UyGLevLW8iszl7cGJ9XkVIedx70X90GrAR1uAJme4x//S12hLBG
	zu/WGDboXoQutdkDYOSuBRFvnhbuPj9He4tgZZeJx5nh0vqLdqFgsE2MfQ7ijiCxavRsWKfgoEquh
	zND5OKwiU9Qpy0QGOfpPwQg+tu4btySkyw+ICBQENqPxoFXkC8t1AEoGKcKoBAzIgQQ+DjcSPxLWv
	dYBe+nqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXHV-00000007tVV-45AQ;
	Mon, 25 Nov 2024 11:29:29 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXGY-00000007tLf-1fNm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 11:28:31 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e387e50d98eso3392738276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 03:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732534109; x=1733138909; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SFECZUVYn+5chgSQNbqMPjSGONkR4VwEA2mP4hQOs0U=;
        b=bzK5FMg5qvpc4uUHnwsIZV3sfJFjNyvRAHLmP30DZ75/VFV2F3OB8kiiatRJWkkIvt
         35y5wYpNl1oKjD6TfhZnyxUD8RbINL9wkiAAb0SoUfF57jdmrQZjFCAM1RDQVXNSGQbR
         QUERK+dTfJLcFH2XOCN0bc1ClFLxFVfzW9O45PP0zWI8dJaaWNi5lp9WC8NHjW5bcmW/
         fsVcXStVwLkWXpxZZMPGu+KY60TX4jFbGwLEhn/sraAVdJES8GMwKIKgoAi8NaXZpfzd
         +CieonwXyJGenmqY5wreyrgX725BaY8qmdJk+Bh7v0V6yt5sljIhJcF5MZFzSxVY/L0Y
         P7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732534109; x=1733138909;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SFECZUVYn+5chgSQNbqMPjSGONkR4VwEA2mP4hQOs0U=;
        b=GSv1pPfzoJ3X6izDnAKRTV9J3/dLUHCSXNBkLii70e/0B3bIwrHmCzMsoloG5JpDJC
         lrcMD4EFflWqCnG012pzvgKQNPI2LICXMPAfnWAERNgdyVwpUHgyWUsQpP+v8mJa1owX
         um51Rd0z0bAWzVRCMx5wMaq91aP4U0+yGBbPbUZmI7d+xGRb1S9ivBWIzYT3sg+NlbNd
         u63DtJJlYLQcGZtjNMl5/yfNYQW5bFBblQwD6MSxUy5j/POkQ3RQB9Ni9ZoNjPIp/nyR
         EbYZJzjZcrwnhddh9sIZSGWywPxWHWGFaL6jaKm0NYSzp5H/aIMpwVxQmquEOJVY5Pga
         224Q==
X-Forwarded-Encrypted: i=1; AJvYcCV91FO5yRJUAqwKRM2WF10KqfFLZhUdGrKxqQ18hfLTNsUDr/fcqpyP55IC7YW+Psz5tZU2aFjxIYpbMvdL+dRh@lists.infradead.org
X-Gm-Message-State: AOJu0YwTYYv0kofc4SS307d0I4wA0X4J30UQ76VG0Qa6VgMecsXND2u+
	1tgEQwwH9/7ZytRw0ErLXjDIYKpCvtesSEDsfe2E0Hs6+Lz4Rqg2ZKRBw1hEMJWMHpOtM0jgjuI
	IW0iRgvcGk8lyy9khYa122ojN/DY=
X-Gm-Gg: ASbGnctGS97zvKU0lgHhC3UzAwLgKWGY+UeRZANEcy3woTxREkzYgmTaBUw51YlpGD/
	KpRvKyFhVWq982iHmjQ6G2E7sG6E51aof
X-Google-Smtp-Source: AGHT+IEvMXbz/ATLbtPNpdoZq7utk3jT6G8l9B0pfvfJrNTPtha9rgk1sBFORpJxaDQfmVMujvdo14mu83hAF3M4v5c=
X-Received: by 2002:a05:6902:1503:b0:e38:a34f:ff91 with SMTP id
 3f1490d57ef6-e38f8ad814dmr9422644276.6.1732534109466; Mon, 25 Nov 2024
 03:28:29 -0800 (PST)
MIME-Version: 1.0
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com> <20241124-adpdrm-v1-3-3191d8e6e49a@gmail.com>
 <3bac31fc-57aa-4234-b10b-d48d3bbfa344@linaro.org>
In-Reply-To: <3bac31fc-57aa-4234-b10b-d48d3bbfa344@linaro.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Mon, 25 Nov 2024 12:28:18 +0100
Message-ID: <CAMT+MTSDWK1dwgMHbNxAHab5_45xDn7YTfZDUdUL5Zjx++X4kw@mail.gmail.com>
Subject: Re: [PATCH 3/5] gpu: drm: adp: Add a backlight driver for the Summit LCD
To: neil.armstrong@linaro.org
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_032830_430626_B2998CEA 
X-CRM114-Status: GOOD (  13.44  )
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

On Mon, 25 Nov 2024 at 09:45, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> > +static int summit_suspend(struct device *dev)
> > +{
> > +     struct summit_data *panel = dev_get_drvdata(dev);
> > +
> > +     int err = mipi_dsi_dcs_set_display_brightness(panel->dsi, 0);
> > +
> > +     if (err < 0)
> > +             return err;
> > +     return 0;
>
> Just return err here, add a common function to set a brighness value and
> avoid duplicate code like here.

I felt that mipi_dsi_dcs_set_display_brightness is common enough, is it not?
Ack on all other changes, will be done for v2.

