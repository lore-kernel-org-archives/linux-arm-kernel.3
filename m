Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3046CD735FF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Nov 2024 11:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=My+Y64elRWi2729TcRQADy3OD/AZrL+55nSA2jzZWWQ=; b=mWnuUewHFlLrZ4v8knxd6R0Nu1
	omy9kkt4Vx6CLYKxdVHtDmDbDWGKA7wNN0OlS+aza4iG10lf9UTH0jDkYsXKZL30Ss33yfLlj3Rb4
	I08/egHsoc0jucKaIEMIfKW1d8te51+8zx3bXI1lnllBY/ImtfVk9sWArJbonAhfjUwxlHxqGKLQL
	GmMoXmjq7dXe54Sm4EJu2GER5qZ9dn4HV6ftbiYfdZtvfcVlFzK8GQj6W12LnUYSSqMfSEiSRctgP
	fp7POrBVpfCm6E4W1aYQ2ninigZu/i/V+p2GAsF4GHTIEZXpMOTDcZFeqCFkXQRXaUmVAnoAlkdxK
	HvmiJFJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHLSo-00000001wnF-2SuH;
	Sat, 30 Nov 2024 11:16:38 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHLRp-00000001wh4-48mw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 11:15:39 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e3970ac2dddso2106458276.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 03:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732965336; x=1733570136; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=My+Y64elRWi2729TcRQADy3OD/AZrL+55nSA2jzZWWQ=;
        b=SoD1ASHWdsoJedat3CdkZuiNO8aQkggitEhYV8rI4QNpzHpJlPHTXLog0bNSpe4ey3
         ZfJqsV+ILAKEhLi2At9C9t2HupzSdznV9E0OKa7G2D0+R/O6moStx/TVG6zX/mYrXggw
         wzanetR3yvKvqMgJMFRsRWRAlXPqatL9hdNb+2KspZtX5EWVitIUHBhn4Lb4uZmePj1j
         Bukjuvb5EWYRNIzfM2wYBIfKsQy7kcbgMQArydpbvLYwHW8T7V/2Y2KKFC2846cqX/ha
         6XPdHrDvH7dromuhZJszQ6ENj6EU0MsFJ/U3A6LFdp3t+qL64SKsEnC4gs5/uzNsZkn/
         3BSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732965336; x=1733570136;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=My+Y64elRWi2729TcRQADy3OD/AZrL+55nSA2jzZWWQ=;
        b=Z+7EjA8A8CpJQ/RzGhEOBOFh6Wx+Hgi2Xkjg1CWfZ+leKVQUK5P7B9+z+9oJHi27N/
         4jJ+XAhoLcoYZdo8yunq/BIHPAw8DNMajBVjfuX0kBRt2JV2cwBOWANf9upD0n0+0NLs
         gFlcg47ex1SJhm5tk2x6sMmlmTo+ED0O5kIyk95Bsagyj3HzmnT7KHghbwh3tpOMb9LJ
         lkAYtoYtlAFx13zZr86zx5AJ1zjL4MMrEKEhWaFXgA+9MV6QpdMPsLFFHFdcQZBOg7+7
         L5Kdj41EpO9OtEb3+Mjlq90kTG7/bulyHgABVhUo6AJ8J49XnrmZeBgckoP92DUlpC5H
         Zndg==
X-Forwarded-Encrypted: i=1; AJvYcCUtM+fvG9JRK0Qkrn4PtIr9M9s90wrphZZwdR8xt6Fa/HtYQcFcunMltYXrJPahmUxaO/4O91jNYwms9kdtCdRR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9EKCJL0aWrwKU1Pz53+b4DN2eNPYdmRCNvzRwpTj4BABWM3oN
	RWFKAmt37fecGlLB0/ojQfqJRWv52kZ9PqqmY/cPWUl22wBIqlkt9VY/GvzX/3GSlFeoWN7Iss9
	TN80f84i+3un9ftNwtCVje5PEXHY=
X-Gm-Gg: ASbGncse1k0J9HdmuXsjgg3X8w5iUuL4RzRPgTSp76q+XMycYpNbi3gtMn/Utz4Z/GS
	HX83XF6ZiVG2gADs4SX8CusklmvGFsgqO
X-Google-Smtp-Source: AGHT+IHnjY+2Sxuoh7d1Wcmkvzc3kysfXGBiGIRQr78j9FBJPnq2iZmfGEF20LZhC0dhpWjwOiR2FaJ4YhczzVfR9XY=
X-Received: by 2002:a05:6902:154a:b0:e29:1099:9047 with SMTP id
 3f1490d57ef6-e395b869ac6mr13767408276.11.1732965336132; Sat, 30 Nov 2024
 03:15:36 -0800 (PST)
MIME-Version: 1.0
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com> <20241126-adpdrm-v2-3-c90485336c09@gmail.com>
 <pokf4zrrm7utx4dlq7sfob3pb4m2dh47eyw2g345tvh75x3s2s@ylajym3brih3>
In-Reply-To: <pokf4zrrm7utx4dlq7sfob3pb4m2dh47eyw2g345tvh75x3s2s@ylajym3brih3>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Sat, 30 Nov 2024 12:15:25 +0100
Message-ID: <CAMT+MTTGtmMvbPy7HvTQ+AdF_X4dTcfXV5n=krm414MnXYqxjg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241130_031538_028861_AA5979FD 
X-CRM114-Status: GOOD (  10.18  )
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

On Sat, 30 Nov 2024 at 10:29, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> > +
> > +static int summit_resume(struct device *dev)
> > +{
> > +     return summit_set_brightness(dev);
>
> Doesn't the generic code already handle that for you?

Apparently not, I have commented out the pm ops, entered sleep
and the display stayed on.

