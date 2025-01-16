Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0380EC02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 18:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epUccpjDGRE9EuJbLES1VkaNPQIRZSalTXoKeOQ8Ry8=; b=VJDmhlGQnU0OjTKvhci0hYTApt
	Rr2vyWbN5otpOF4xqXfP5Roa2npWs81MYwk1aiousxLB5xQJfaek7YZ9Pmeev4SiFceO0OZGugS5B
	kDt4icYdb9Abp93qOVIhvVcCn63KiVnukEy2dT6HXhtjPghVVIeVtg+/7LKx0u9Esoj9HybtWO4SM
	cefl28/Sm3VLxu6LkU6Kr8uoCeP60g5EGJWN1wvEhlL7+5Bl5RgzcFUVNJwTJpTQYNVUQD69gUenq
	6F09LJ7F1PB0+exvZlPOy/UbCd0giCNHqIG+EdVLHJB6ztJcZUf3s3SjW1BYjJzvPPO8eftVempxe
	gjlumOmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYV0B-0000000FpMY-3rbx;
	Thu, 16 Jan 2025 18:53:59 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYUyv-0000000FpFG-3Epl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 18:52:43 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e399e904940so2054553276.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 10:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737053561; x=1737658361; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=epUccpjDGRE9EuJbLES1VkaNPQIRZSalTXoKeOQ8Ry8=;
        b=jJtrb8Pwlyf74CqYqa113HAFrOyVUBPGpHxDuLTd/JS2LqojcNUY6tE24fWRWgotRd
         qFJxrnBTnxb4LFkVkfxtHFrXR4q/kFUE42K/sgfroxKIjdN5PVM0E1F9IIr61ibJU4iB
         4B96CFMa4NKFv7j19QJv+DkInO/Wyz0JA2j21Mp/bK/w06Z9dqU4RWKUWgcmzgnl3wLc
         r64CrsaNh7OFPWmAHeoB4RnbWfbFZwqtxmZzDYumT88GLOZL/FGNG5BKzu1z/KcbVmr2
         BJPS5wNXdhANSHyu+ujmY1AZ2lIXv9GmR5Y3Kbn+KtscLq+RZVk8k/xSOb5lE0mIQO6q
         fJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737053561; x=1737658361;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=epUccpjDGRE9EuJbLES1VkaNPQIRZSalTXoKeOQ8Ry8=;
        b=BLIczwtHp14Q6iQXO78CyifgPnlXimZfD30Cl7aQgVxFn/SUxgcCFjcMedVRlrk+fY
         rN4KsIhy9dv82I1cHM4VTUqsSnETSC7Yqq+EQEYyUycUTB1dvc9gHBTjJoqP1BTubUPX
         JKAQN+2pYXS8xxe0iXobVZeVoAxpLefcbT/2xy/z5xpSsXvF9Agf3yCsP6Nf1XcY/M1O
         9uKoQYTB+aCKI1PB8nM4vFCzQVHb6RCtqhvR86o/wg8erHyisXGUdwzHtTSaMBWKS43p
         +ugFNxkjNWKfBjFfcTKEbmiolU/M5e3QTCRLWSbFjfNGXNhafxkNEAr4jnM1XaDfnOVx
         AMbg==
X-Forwarded-Encrypted: i=1; AJvYcCVS6Gn8I1kDCesshlLxJquDNpe2T6kqMjvryT8sS42mUZjYOOi5H/tsN16zy8B3aM99VPrvohwbBHnPBKXyBybg@lists.infradead.org
X-Gm-Message-State: AOJu0YzMsppbXVCb9GDTOTS0Haokgbup/Igty5i+OmdUc60wkORriGpn
	X4qDM9yR9Wrf8e3/4ldhyCmLnVhSa0xzq0jA6K2BWsxJ3E+1iWQ1HQIk1Z73g3xkcIK0QtydzK6
	a5C7Rh77vRid9+HdUH05IIRHYADY=
X-Gm-Gg: ASbGncsKn5GtqBzjJZ8ZlywOzkMmCd8twTv3CETzd0pAkPyI7jeabqfNdV294qVFoHF
	p5ek/2/7IqBu0dfPQ2M6HFqaKgIvyaYGT9xexr+0=
X-Google-Smtp-Source: AGHT+IG/5CjKhXh96Nk+XB/+aMWTA4imIkKzPQiupTR0gI1gGVjVyFbBQFaeqBYVq9D6f+2cUD0dR0X8JEvKu0ia5Qg=
X-Received: by 2002:a05:6902:a09:b0:e57:31f1:9722 with SMTP id
 3f1490d57ef6-e5731f1a429mr22183513276.29.1737053560928; Thu, 16 Jan 2025
 10:52:40 -0800 (PST)
MIME-Version: 1.0
References: <20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com> <20250114-adpdrm-v4-2-e9b5260a39f1@gmail.com>
 <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
In-Reply-To: <mu7qiybhj7tu5hauk7izfxqlookc3awpknhjk74zwpkbznei4m@kewap6vivzoa>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Thu, 16 Jan 2025 19:52:30 +0100
X-Gm-Features: AbW1kvbipHKJwElTaiGLwN0S5Fv6wP5xVACM8b4oZ-wh_e88VZ8Pe5kxngHqc80
Message-ID: <CAMT+MTT+_ER+mFP1yUY+L-47-sZfNmtHUp09rqpPG174OKMJKA@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] drm: adp: Add Apple Display Pipe driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alyssa Ross <hi@alyssa.is>, Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_105241_815952_07BAF5F3 
X-CRM114-Status: GOOD (  13.74  )
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

On Wed, 15 Jan 2025 at 11:21, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
> > +     ret = drm_simple_encoder_init(drm, &adp->encoder, DRM_MODE_ENCODER_DSI);
>
> This is being deprecated, please use drm_encoder_init() /
> drmm_encoder_init() instead.

I seem to be unable to find any documentation or a mailing list post
to this effect. If you are referring to this patchset:
https://patchwork.kernel.org/project/linux-samsung-soc/patch/20200313201744.19773-3-sam@ravnborg.org/
according to my understanding, it has not been applied.
In this case, the simple encoder api provides all functionality i need,
and a replacement would just be a simple encoder, except copied and pasted
into this driver.

> > +static void adp_remove(struct platform_device *pdev)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     struct drm_device *drm = dev_get_drvdata(dev);
> > +     struct adp_drv_private *adp = to_adp(drm);
> > +
> > +     adp_disable_vblank(adp);
>
> Isn't it being helped by the DRM itself? Anyway, I'd suggest moving it
> after DRM device unregistration and shutdown.

Not sure i follow, as this call disables generation of vblank interrupts,
shouldn't it be done before all drm structures are torn down, to prevent
the interrupt handler from potentially operating on objects that are in
an invalid state?

