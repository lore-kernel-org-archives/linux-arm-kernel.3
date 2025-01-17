Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BA7C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGwzPY4c5gn4nEKlnu01wESwyE/Yu3m4vbeoQZY75XA=; b=WDPtb8qztMctMUfL9rhmvlmODg
	u0SZ3KfwvyDKjQqPh+8yL/yJ52qLD2eenoXbRG/MzPTpenPrWZRJylaAJNPl2vKtNWZdnZmlMr3RY
	v6peLzv3qoMUpzoi5xeJcxgwysJPQJ5t9oDg2BFV+dJFf8NEHOdiL9ygoKOcaJcYGcabeXVSO/Iaf
	9LG11kKg2lYAR5CunqMc4L3wf5+2K2FfAS4s01cNxT8bSpsEfk3fXcomM0TP82XPwobBJxCKZ+Qxw
	pkzDX/ciZ0AlrT/iC/w5YH0ms/G5wsxmMuFW7Ym14fuMajJwQvQ/L0N+ACltgf2rt+cZ0tUn2snD5
	irvx5a0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnBg-00000000SYv-27Um;
	Fri, 17 Jan 2025 14:19:04 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYnAO-00000000SJP-2J8N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 14:17:45 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e461015fbd4so3271615276.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 06:17:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737123463; x=1737728263; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aGwzPY4c5gn4nEKlnu01wESwyE/Yu3m4vbeoQZY75XA=;
        b=CxRTWf7LK6buKE/cYIUPG9r7j61E6RyNUlv2oI8u4p0rCAqStMJDHNB2cVvNlCwvbE
         XmaUYFEUWYg99CnyyLyLBgm5M/ZRdiBjKx6RCnzwTA3ySFcquvNLk09o3Dnti3GFxA+M
         bAJGGj9E5k9ybzghc3jBxAbfIYDeGb4+4imPuXEp/5WhjVTPFxwO8r/sHIWqS6d73CH0
         y+3QXfcuwxnNDptbCY9lQYvlnzEKM9aNhMXsmWY5O7GLSOuTbn2vMKy1vUGXaRPB7n//
         HJuRAe4UG5R2KuZzntHC5S36lj5dCIuqZO5Zmk5sZ3JA6zG88lOqADtp9hcq+0OBx+DH
         Yg4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737123463; x=1737728263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aGwzPY4c5gn4nEKlnu01wESwyE/Yu3m4vbeoQZY75XA=;
        b=HaZlr9jJlqQiioseE4+xs98eXTmF/TgfNx2/zx7xsuweCfXxhB708pO+GUjs/DX+Sk
         SzHc8uRv9kPvkggRhaWLHdI2KbYgxZxuW+ZcQj02wBb9QvMmPfIBepx0ceJIZGsZ4E0H
         EVnH0An7ODNQRLrnT6G9qHRfVSzTHLwC4m8z+ylqwbh7He+yFzp/6UcHQZat29eH/ou9
         nExSevMRI5kvyaxuSdKKgPnPylELAYzSfC9B8W02jf2eDP+BzezoEpXWS9fD7HW2t50k
         MFNgZCp9DLlwIjky7MqDdh5Sa8JHqtHYlfJgHOAvdPdJLD31v6Uq/z/isqTwHw8V6kQI
         LJaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVezaDUXVuyYZFIa4AJHvNsDnn058Jw3h+gWAJLM4wm1P6lckm8SzbUKuItZ1ZOaDJ+3Ok+BpnrMXGfohmBW0+K@lists.infradead.org
X-Gm-Message-State: AOJu0YzrPnN6H9I4/0cMQH1SEaGbnV99TL7Gq9Hoks83W802tECo2OR1
	rucolYhxYMAu90m695EtSmNglpq7avk3LJ1FOISfb0jqK5rBtrVzImpca83AOBhzciNFfBUaq1x
	CBaLdfi5kzU6hH5h3ktFfOVwRgt8=
X-Gm-Gg: ASbGncuHJ6g/RO6Zu9Y3h1x6dWzURmUZI434VJfmfdh1n45uOv49UO6g0ErthollGrV
	pm3EWY3MyvaJTbyiGR5EPuWv6I3SfM2AB5O4WqA==
X-Google-Smtp-Source: AGHT+IEgzT2Y8X/d+HOguRWOezTmCdaDrvMrd0xyuzC2YC1+k0LNDI0M/Oo8/mnNOxO0+kIgTEzO5F/+UdmBoEnNI4E=
X-Received: by 2002:a05:6902:1b0d:b0:e49:e085:c0b4 with SMTP id
 3f1490d57ef6-e57b104668amr1782609276.8.1737123463394; Fri, 17 Jan 2025
 06:17:43 -0800 (PST)
MIME-Version: 1.0
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com> <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
 <20250116-vivacious-congenial-nightingale-cb2f6d@houat> <2alm7gds4k2lnbk36gjdw6yhzhpls3ce5baycdiv7lsigxsbzn@rhwdgnphwwp6>
 <20250117-neon-unicorn-of-plenty-bbe639@houat>
In-Reply-To: <20250117-neon-unicorn-of-plenty-bbe639@houat>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Fri, 17 Jan 2025 15:17:32 +0100
X-Gm-Features: AbW1kvbN_g2HyuopLeZCoB8YJ1kzXFaQ1lvT6Fub5esd6CPjCjqmkvDJ9dDJO2Q
Message-ID: <CAMT+MTTrvXsYONQj0V5U+dPJtCBOAQ-Lfg7NONMB6onMvJ+3QA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_061744_589469_D812848B 
X-CRM114-Status: GOOD (  12.06  )
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

On Fri, 17 Jan 2025 at 11:24, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > I was thinking about using drmm_ here, as the DRM device is also created
> > and destroyed each time. But I might be mistaken here.
>
> Ah, right, it makes sense then, thanks!
> Maxime

Not sure i understand. The drm device is created in probe(), and is
destroyed by devm.
I do not see a path where it can be created/destroyed without a trip
via probe/remove,
and so tying the lifetime of the bridge in question to devm seems correct?

