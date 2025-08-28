Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1F5CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 01:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0ckteGAESBs8jcf8OZOftDZRFDWIXrQjnpmEjqlDzI=; b=xorxogBpJx9PvFSViyW6O06gAk
	IoR5cSvrL3F9VJCDYL78/pgXci7LVlXbzbpr641ozdxWldePpk96GQBEY07Tb8yKIAVYZ3of8cexn
	EUdFG+EaQN8CHZBk69jdDKySaOzdWw6R5IcuL/N8OmSyaUlQmQoIzx2m1AAYwf8R1v01zXYgtXA6O
	sUTlEqUbLfbsWSPYyC0kngC7BXdtMnW9p3phAXleyMYNh0wsHIX5XLYQZTzI7glIWasSYEazGLyPb
	6tiC7n5C/ToPZDf9Ctol/wdTzBfsCezhCH4JJyy0f6wtWhXzA88y+u1fjeCCYW4WvkbSZx57BZBKy
	ZZ0REV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uro50-0000000427t-2ZhB;
	Fri, 29 Aug 2025 01:39:02 +0000
Received: from mail-lf1-f41.google.com ([209.85.167.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhWn-00000002oo6-0neL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 18:39:18 +0000
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55f48cb7db9so1242564e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 11:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756406355; x=1757011155; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0ckteGAESBs8jcf8OZOftDZRFDWIXrQjnpmEjqlDzI=;
        b=amlX9BP/KekEXqqSVGGL3j6iZ7/5D46+jcnp6bwt1XvVO2ljjj+blE56u6YSgK0XeK
         +oux9MFnw1FRe1gLPQqy2nZW8DieJxBY9ItTNKC2hY5eT6jP/I/B1hIDKVnHpqtA3sun
         zeRD7rXrg+lo2hp+evbpt8izATwNeUwi7LlKWT5PKvnZeuBfYU+a5DaCchXRuHSyrLmW
         VYYKBS/E9RwKV0vIXP2cSg5KoEa+KEVYgGsV6d5lABIwHDOjD7yGRv6FJzIzrj69LIFV
         T5hSFYXq0v55fnESZTZB69wDqMffI2va84LMz44hAhKJEXJNhhzungOct4IDZfdD17Ng
         kuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756406355; x=1757011155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E0ckteGAESBs8jcf8OZOftDZRFDWIXrQjnpmEjqlDzI=;
        b=qSAIJ8818nu36PMRV6TwimFw8ir0I/w3dZLW80sbw07qIqrcz5YBuQcw4ZFtbw7pa5
         ZoTxi4QomQcHa7WpuSL7NHdirQBaca0Q08BmvbwHJD30Kppc91sldJxgD9QRrrMjlbg8
         svor6UjmDdAKFJ40FADOfbR5owBWGt5sW13ZwCw7TEJNCcAcgmuX6dTPnsmJkxaXsr7o
         RtgyxXfWFHjMAhK794JJCjdG2NbC0WQsxdsZkvT9j+6ojF8gDhQscHqmyhb1Gd8GInoF
         AkpFLv6D4NHtflhtNTojyyiCsSubHi6EF6janXh1NAjnJbWuBOE6WP+Ni+0wxJ6H7VvH
         3hhA==
X-Forwarded-Encrypted: i=1; AJvYcCWj22q8G2JknQcltc8UWVlO3mDxKvuuAHZJmxZdD8MwmwGECUnnAy1x0mpCC0hTmtNbDyK3JD3XYeFKmjDZSzzi@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4WLwIQ13zvUyx4inf0wbabIcBE6ZHsTlfYTrZyYQom5hFq+Wm
	Hn36I7WbkXWcpP4cY8qv5V28Ay0UNfOiRETV3Lyhok5yz6mx2W7HFL7IHZIOHI2WvsuRQ+s1yxC
	0/baSRi5qA1vObOtvOZCOP8S5+iA5hv6nsjpvq2MuBw==
X-Gm-Gg: ASbGncs9sIuw5evmVB9wuhfxUGEw/Oe4gSvcDGq6hUzoTAp7ey445TyzvGgzJzg4TI9
	NKsBnhvphHkfSHVMnpeeEW+bp/uRkEeGM7U7+3u2Xi83+LIbFWbybDn7z/mRUpKgtSGBPxiYarh
	RCDZAcLxSI6SV6zcZglY2tlfQx14fxYhLbAUb8c2ue4dR76e0DPzgUqRM29XU5/K9IKF6XMmJ1X
	myNL/B2Ks0W6J66cA==
X-Google-Smtp-Source: AGHT+IEW/rZTrjCCovtsKbGN3zvurPp8ZHpS2GVDC7ghNOSAMSVHLkB9FDrrp1lAJKfN2C09p5nry2jkSt7wbvI4iYo=
X-Received: by 2002:a05:6512:3b09:b0:55f:4839:d05f with SMTP id
 2adb3069b0e04-55f4839d30amr4000473e87.49.1756406354836; Thu, 28 Aug 2025
 11:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250823212732.356620-1-alex.t.tran@gmail.com>
In-Reply-To: <20250823212732.356620-1-alex.t.tran@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 28 Aug 2025 20:39:03 +0200
X-Gm-Features: Ac12FXym_RsvFHR0V-adi-Z38di1fxjCCKa-fkpd5JJ5TmFdT4-cHh1WYo-j-eg
Message-ID: <CACRpkdY4sCFZqK2D+XP7ctK_EJD3aOO4CGh40uQsdACyAUOofg@mail.gmail.com>
Subject: Re: [PATCH] arch/arm/boot/dts/st/ste-ux500-samsung: dts bluetooth
 wakeup interrupt
To: Alex Tran <alex.t.tran@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_113917_261039_760A770F 
X-CRM114-Status: UNSURE (   7.96  )
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

On Sat, Aug 23, 2025 at 11:27=E2=80=AFPM Alex Tran <alex.t.tran@gmail.com> =
wrote:

> Interrupt support on host wakeup gpio for ste-ux500-samsung bluetooth.
>
> Signed-off-by: Alex Tran <alex.t.tran@gmail.com>

Patch applied!

Yours,
Linus Walleij

