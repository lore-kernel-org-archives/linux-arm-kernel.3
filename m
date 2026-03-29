Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A5DBF3D5FE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 09:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sGDCJ4nnZOaX7PqUwJz5bYB/Xwisxt5pEqmuR77rK0M=; b=lmSZ7m1S/QKUPxA+igR6pC/iRI
	GRkr4qFcU3xYRbBAPluPw6T1BNnEzQ/Esmg4h1re7UAXXsPN5BG5JcW/U3zZQqODHJaRYhaanKuKs
	DKt3AS7TVMU3B0QJOMlwChuhnH5g/4wOQmoHvVeakcfdfwDiTUZw7yVKwQK2OoPtPG0oYfgKC89kw
	AUqFo8cjGj7Lqh8YNesKJS2zC1NMSdAivqVcmuX4TKC90ky14Ti5+JOUJWJlq5ue4poGgXtV6Iq09
	McNRRRTYQAkHuBQHM7iTCrljRfhr56wuYVcxykCWF/FVhLxazw6kRiku5RwFvOWlfTOOVK5YjkZWU
	hN1qUyjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6mLI-00000009mwM-2SWA;
	Sun, 29 Mar 2026 09:22:00 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6mLG-00000009mvv-1Ri4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 09:21:59 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43cfd96354aso61583f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 02:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774776116; x=1775380916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGDCJ4nnZOaX7PqUwJz5bYB/Xwisxt5pEqmuR77rK0M=;
        b=DkCHG6561APyAk6v2qCOPOoQDhKaSkaEiebMxdn3+LTD2+EfvQgnIaw8yFSbiTDg8X
         tlmZLEtJyxcIuA1v+XhcBUHK++fKVUMD+hbLIRExxfzzcxmbmbq+98kd1WHeRYwG2Xg3
         DUBYKH2Ti4e2xWqbJgerxbvHsKg3+3b5fxQzeDSTFrXIiNus7ZUlElHr0YWVAMmsqgBf
         2vi7ZEr82UP+4gdTy7t5Gbb6FGqeQDBX96goRr5b7mAZsrMvAfXUZx3Q2hCvgNWi/K7t
         N7WM4vXuV6oPpxQGVzXX3DQDlZxDB5kuwHDG7w6+ehcUMYws8i3ueFBNmsLJSXs69UwM
         Pp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774776116; x=1775380916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sGDCJ4nnZOaX7PqUwJz5bYB/Xwisxt5pEqmuR77rK0M=;
        b=O4+9QgZq86+zpK6x8R99JtAdeVU5NbZFAD1t9xpL8xK0maVrxwpUxtETUbBZkfDR1y
         0OuftkAPB1YTSKdCxl/7LDIrlm5PLfA6rtrZ3wl6V/3mo1AVqJi6p8BeD9701JltrboD
         FKQIgzjNUxHKVdKAZeS1Md7xgm0rcA5eCyu1JWC3+/IkUhZ8cpDYQqIYUplaFVMeP871
         Zq5Yzz0DSNQnyc7dcG5LGxsbKLIW5QlJ/Smwef0HRGWE6yLfs1sSVWSRPMQlWPCwpjUd
         7sFnQ0wSepiswXLud7W7aPgJ6Y+YQJiS49KLDJvAi9onkfwV++O6bH5OyKEF4FWPGkBu
         +iOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNib9cqTsm9DNI9WNLy4zqYpfc08aYObZzYik1vTNtg16X5DaNyrrmGOdatoUtp+7nfyFLHojZE+Hhb2+vYCru@lists.infradead.org
X-Gm-Message-State: AOJu0YwHGQu/KsxpITbMTnLpfc8MoUf69Ap+g83X2cxBdFmEjiFjgL21
	dprPHhrxMgQgzHYqQiMAinv8LpGOpmEs6/B/J6XmggoUUp31ctISgkLyFxG5KpMe
X-Gm-Gg: ATEYQzxjUmNivN4QzFgkx9CU5dHxUDAcabxwvRBoNJk7OxGh0le4hILWuPJLbFpG6Yh
	/2nA7h66XPcoCgqQJD6JbjtkAUIl9WwyqHyzbhXJPGXvSCbY5JX2LvEEZg94VPok3/tAfbLzzKX
	tiWMH9jjOXEQ6mLUo4kUQht4HHdegwx1YhuVRz+xUl9h4Zu5OEBa3uQ35VJ6Wgc2HHv4XpVLB5L
	Lu/qvgfTQq8/4q10v0SFwqCouXM9TD65jWT580ZoXKt1ksRsmZqNEdF71HepBUc4oZO1MwN13eh
	HiebNZDiVD4T60UTqQbNYqCPkvYdIcpa/iKZI3vYQ3LUsEuT/73Q0UmFVlmZxyo1vrZCQidyPBm
	/NGlWfEA9jBUiwdyWeLW9s16t3HLJnSftQDBdZh2Nl9vhjvFVO2Z/uLryHNBTezXrJQwbbd7uSu
	EA3w68kB41CUpDZBIFXsFbwp45U5IpzawU5+DumzQTe9yU9+3xI74xyQgSBpDY8tK15+Cf8x2t4
	iOekVpaq5gzClgq9w==
X-Received: by 2002:a05:6000:24ca:b0:43b:60f7:2282 with SMTP id ffacd0b85a97d-43b9ea4ae28mr14838629f8f.28.1774776115668;
        Sun, 29 Mar 2026 02:21:55 -0700 (PDT)
Received: from jernej-laptop.localnet (118.red-213-98-130.staticip.rima-tde.net. [213.98.130.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e9e18sm9945848f8f.9.2026.03.29.02.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:21:55 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: paulk@sys-base.io, mchehab@kernel.org, gregkh@linuxfoundation.org,
 wens@kernel.org, samuel@sholland.org, nicolas.dufresne@collabora.com,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, pengpeng@iscas.ac.cn
Subject: Re: [PATCH] media: cedrus: skip invalid H.264 reference list entries
Date: Sun, 29 Mar 2026 11:21:53 +0200
Message-ID: <2823210.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
References: <20260324080856.56787-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_022158_400217_81BDFDBF 
X-CRM114-Status: UNSURE (   8.23  )
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

Dne torek, 24. marec 2026 ob 09:08:56 Srednjeevropski poletni =C4=8Das je P=
engpeng Hou napisal(a):
> Cedrus consumes H.264 ref_pic_list0/ref_pic_list1 entries from the
> stateless slice control and later uses their indices to look up
> decode->dpb[] in _cedrus_write_ref_list().
>=20
> Rejecting such controls in cedrus_try_ctrl() would break existing
> userspace, since stateless H.264 reference lists may legitimately carry
> out-of-range indices for missing references. Instead, guard the actual
> DPB lookup in Cedrus and skip entries whose indices do not fit the fixed
> V4L2_H264_NUM_DPB_ENTRIES array.
>=20
> This keeps the fix local to the driver use site and avoids out-of-bounds
> reads from malformed or unsupported reference list entries.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



