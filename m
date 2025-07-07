Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B88EC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 07:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+M88naLnUJ0t8QJIK0WbEzaLOGjlUjQqADUu0a4dJSQ=; b=z0IDJdpx8fKUOfsKQqeawrlG1X
	lJCO6jp1WU7Jo3ZLcro+AEImnOrN7E3MUGFW9YURKdlRp5yM8AraPa5gZ6fXbLIPtOpS2gWNsfbhK
	yzG1yLxh8lt1tyBjj/9P9gy71SLcIKyFAy5jZTTHRQxwXAjlMwQVU+ll6kLMdmGGdIVH9Qoev2Zvh
	qwsvPiDkdvRY87r0B8qr0ZBDv6T9nc/3ixKsrAa9dftqrDXX7W1wvPZsG52bVJx8LBTtSxXO7ptOD
	xKi2Yj8JIZ7Dv1Ruc5Yqxjkyg6OEesacMg8SpPJVhDNjsDTEYZc6gnk4sXP/LfJdv4HSVTjJprIsH
	JyR+lsIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgO4-00000001i4z-1x4s;
	Mon, 07 Jul 2025 07:35:40 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgFN-00000001gKi-0Jch
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:26:42 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4538a2fc7ffso26432665e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 00:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751873199; x=1752477999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+M88naLnUJ0t8QJIK0WbEzaLOGjlUjQqADUu0a4dJSQ=;
        b=Zh1Crs0JhoCwYJpmJro040HdLTFIeN65h7+NvNzMM4zs9WqHS4DdRcht/AhcGWxg5l
         sydy+DmAHUdwR+VxQwBbl0K6hKMVa60nGnBsEQGJX0Gl7vPoL6vqElt7xWFb6/Ljrgrw
         jaGrulx+vZjdCpKn22KzbrhyQefU5bfZP/FHE1H96x1RALxEQblu3BS6ydJ9JLxEoe/g
         97YYmqvek0Iv9baOCljiX1vPmZNZbGI/NERIzHinWdKoTEc5hF6z/8rB2d3nahukvfWr
         1rflvCMHhlo+DfSOdr7Ypq2Zt8YfNMr1kcq859n7DSjW77V8HH/sfIjVCDM36cpOrY95
         CqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751873199; x=1752477999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+M88naLnUJ0t8QJIK0WbEzaLOGjlUjQqADUu0a4dJSQ=;
        b=AQRU3vIAtriYutQQZYMwCnjwUmlGrQnv5Zkh6ZVlxr7GosJ32MjfJ8f4Muytn+p+xi
         LkAOlHDN4rkjbqUzm/y0yGCBXTIlbPS2oEMOEgeWJbJ2JsDImaD8z3iL9T/zlhfL6T8Z
         HcE8+urUnJCMoH5phlP62PGJ0uKiVec7WHUYIcPtyIPtHSTWW/6KfAT39r4Lrnjn0Q/E
         9yuP9M9aVSfeWWzix/wzdFATAEMEowIm8Sl/vN2KQSaeNKSToXa3eDD3DmA6w1ySjF7V
         Sy+Kxql4rPngzmrJhYmyPqL3OB1pZFdcKNBH+kEYm6gpSWyzou7lZ1ryOEhKtWjnkA8R
         rZ+A==
X-Forwarded-Encrypted: i=1; AJvYcCWzLoZTSBb4k8pCVYn310o/V2QUf/BNGwtdcnRDSsuseo2KWggbZ2trRyZxB1sL2DwhINenRVmMAJhtxqPPLpud@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi3MpjS9lKdZuCWHuFbaeDnSjaFM1fDU2VzyAJM1qRfhCiatM6
	1HGwfB/Lg/RGQpO94HonMSSg1xIEknshYvRGGK8IWt2eV5mtvveLeGGs0pbv8OOHELw=
X-Gm-Gg: ASbGncu5PvOxR8BqPlPPV5+sOeHirgWqMwRZZqSbACgBCdj5kagYxzhEeUOvYPZz3cW
	L5dgSdycsGJp+AAfVUdia8AL5vheq6zYGLYRtyTGZr2lKlysyMHhrM5CMFXe4oP29CEZRN5xDly
	9c+T4hBADDsA2+5DqP0eQVcivaeJNMnSh+iq0gjrSK2d3zujUQeIr7QhcXg0nPNjvXZay9ZxkDo
	KMPA9kjwGh+fxHlxSNmca0aUrWfHF1glXvB65zNOPCHAitbeTRXfF3unkelkHmHKcegISm/5Lmb
	LlZEOZvXDNK2OL4qvdBRy2lU1zJMDDWoIHxLGA3yeC7oMyQU61oV4g43P3DpGkQ=
X-Google-Smtp-Source: AGHT+IH2a4FQU3gjAoeitT9FgQsVG9Ag0yKWeP/cCvV7/BHHehw8QBk9ZW19zI7R7BKdGB7OsX43CQ==
X-Received: by 2002:a05:600c:604d:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-454b1f69c85mr83094335e9.12.1751873198957;
        Mon, 07 Jul 2025 00:26:38 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9969aa1sm135733875e9.6.2025.07.07.00.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:26:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3] gpio: reg: use new GPIO line value setter callbacks
Date: Mon,  7 Jul 2025 09:26:36 +0200
Message-ID: <175187318871.9037.2163001449380297521.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250623-gpiochip-set-rv-gpio-v3-1-90f0e170a846@linaro.org>
References: <20250623-gpiochip-set-rv-gpio-v3-1-90f0e170a846@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_002641_121610_E09FC93B 
X-CRM114-Status: GOOD (  12.05  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 23 Jun 2025 09:57:16 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the legacy generic
> gpio-reg module to using them. We have to update the two legacy ARM
> platforms that use it at the same time as they call the set_multiple()
> callbacks directly (they shouldn't but it's old technical debt I
> suppose).
> 
> [...]

Applied, thanks!

[1/1] gpio: reg: use new GPIO line value setter callbacks
      https://git.kernel.org/brgl/linux/c/527db0a8811697968df30797eae2e1d5f8b6964c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

