Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A736CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 05:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHaIQHQAzypExf5bg6wFndJXSrqRhD8ZT8crEHQrTnE=; b=iy6bfMw0U4aE/YXPWW6hDIIZAG
	Fnl1SWcaDw94CFn4YthV7C01aDmYpZzFx81bng2Y6Oyip4FRKmmcrcQ2oXMNne09Ml9n05lqVgqNP
	7889T25TwshL57YowJxRJEA86POgS5QnzUllHBG/hyJVTpchqdMdw48tLs+DT0wYeeZ7yXBk26Su3
	yTKKlY2N0wTuu/co4XPSUs1X5GdLJiLifa/rjmzhkMt/U14mUv1hl1CYxNdYJWD7Rxy9bRXSrNUSZ
	TKDcAI+8zJ2Hw/+GwrqaD9x3KXEcA+FcPoby1HtHFET+6txbQRB67OAe03c0K5mXpgM1ezpTiYbVL
	vSfL+QgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBQg3-00000002O2n-0Glo;
	Tue, 29 Sep 2026 05:46:55 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBQg0-00000002O1o-3Lev
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 05:46:53 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so2653115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 22:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790660810; x=1791265610; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cHaIQHQAzypExf5bg6wFndJXSrqRhD8ZT8crEHQrTnE=;
        b=A96DTktHjXgoufi9b4GqaukPGOgQMNe5KjuaGpcFPypzIScIDbMHtU0cOwRU8x6OFK
         HYjVh9f/x2XW5d3hGFfTtF3DMDVRe8V+mQXXNRGlQkEdDbg5mUtYSJ614Cyv3qDfcy61
         y8oxustKhRH9BNj8yADec7U3/rzgGggKEcBNDEIkRBeRZa9RrSWJne91A/EgCpljtrFH
         6RmJrmr6LrPhvaU3yuShjbPEZF/BBNcMNJaxtvVnR7nNQJAl6V4IjmoU+Hhq92k9EPdV
         Rq1+du3p+KnY/cIr7yqF4LtLIzpIcUoFkqGXJIFyA9JRhZNlZx9L/z2ONk7eg7a933Xd
         bMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790660810; x=1791265610;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cHaIQHQAzypExf5bg6wFndJXSrqRhD8ZT8crEHQrTnE=;
        b=UcgV4iuf8ctIHy8Lkq25CcTbTHwx7LFj9M6AdmZ06fcCfm5ACQv6hoih42a4egLpsA
         YqnJuU6W3t6CAx+W5LlYcHqZtrsMcomJp7ytDZKQn9WuQVtozeyn3PYD95CuAfDCi99g
         XNmc/avVf3i4p+bgCXbzwXeEy+mOG44nxp/HBj3ouEEK2zZ0e94ZPak16xenW0vAO5zD
         c/ZjPz1qhyzh/AKa8O61l69Ze2GfMa+2uPK4FACtUsF1g5ILXc3ZUuEVgZn1+5Yqfm3P
         gzEpF8bcx2nXiZ58l8fMrP+jr+Uh3HBz53Qofc07JPlzCXtBjxwrrk4SkF0JLVot63oW
         KzcA==
X-Forwarded-Encrypted: i=1; AKwUvBzuUvwY1QSuPElA2FGTGv1vHXwjDEo2sCJ960iX6N96s529m51TZnBReD2CHGX8CYN1B7F/qm5tlMvBJJSQsjMt@lists.infradead.org
X-Gm-Message-State: AFuF++lBSSeVhGrpGdbRAmcGpmluJd8c+pWYbuSQ4SEXgNfyo8RioUiY
	sO0lqif4S0qlJZwH6vZwFuCEeMONxvhplh2u3UKuPVmk8dX8wD6rNtg+
X-Gm-Gg: AYBFou3QGalkZbCY2uPi/Qp+aGxqBTLFIG+RE6hGZj18oUcqhlex/CByI28GQB8mH7C
	R5gM1H/hmAcBNxG0WvNyK7XvnEi9P0OO2mv836LeAHF61TwIUTwX8s0c+vicJ5Bxwjqt8+YbDY3
	N9bz0ai1zP6TFNk+M8lUz3g7XpCmMTfJs9+l2d5+26GbMSBbciFbchm/EHCRm/Fy1Hw2ycjJ0zs
	evm8zwFDPucR/leEzZjckS6td4t5IAoopVF04ntM31Z9KbHBf4K1FQqa3XCDmsZ2sci28lFjSbH
	KYTJv82zrz2iTNlhUXPrhaSTY7MLXBg3y0suyTO6kYvZXW29fUJbbH9bxtfmGGbvHA5B4W2cyN5
	PB9psvEvAUeaFzSjbRBUYyFQyfU569zlmowVHrzzhrcf/Fb3vVIPo9TznUkBQQPVHroteIoxvZH
	n9ygmaeifh7USTcmWRN4HGer0hC7pKXOTpxV6FNejnuPZ47MmYd7BaH6RdFru6uIBhFqA=
X-Received: by 2002:a05:600c:1550:b0:49f:fefc:7d01 with SMTP id 5b1f17b1804b1-4a00d778f09mr19426275e9.15.1790660810212;
        Mon, 28 Sep 2026 22:46:50 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00d45ce1csm32021415e9.3.2026.09.28.22.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 22:46:49 -0700 (PDT)
Date: Tue, 29 Sep 2026 08:46:45 +0300
From: Dan Carpenter <error27@gmail.com>
To: Michael Freidkin <freidkin@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: meson: vdec: size capture planes from the aligned
 canvas
Message-ID: <artQxRR3kJUv-mBF@stanley.mountain>
References: <20260928165045.642354-1-freidkin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928165045.642354-1-freidkin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_224652_896717_EC27E602 
X-CRM114-Status: GOOD (  17.79  )
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

On Mon, Sep 28, 2026 at 07:50:45PM +0300, Michael Freidkin wrote:
> The decoder writes a whole canvas of ALIGN(width, 32) x ALIGN(height, 32)
> (amvdec_set_canvases()) and reports bytesperline = ALIGN(width, 32), but
> get_output_size() derives sizeimage from the raw width x height.
> 
> When the width is not a multiple of 32 the planes are too small for the
> advertised stride: for 720x360 NV12M the luma plane is 262144 bytes while
> 736 * 360 = 264960 are needed (282624 for the canvas the firmware fills).
> The decoder writes past the buffer, and importing the capture dma-buf
> into DRM fails: drmModeAddFB2() returns -EINVAL, so e.g. Kodi plays the
> sound over a black screen. 1280x720 and 1920x1080 are not affected.
> 
> Size the planes from the aligned canvas the hardware actually uses.
> 
> Tested on an S905X (GXL p212) board with LibreELEC 12 (6.16.0-rc3):
> 720x360 and 1920x1080 H.264 play through V4L2 m2m + DRM PRIME with no
> AddFB2 errors.
> 
> Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> Signed-off-by: Michael Freidkin <freidkin@gmail.com>

Reviewed-by: Dan Carpenter <error27@gmail.com>

It would probably be more reliable to just ALIGN() the width and
height at the start so we don't have to do it over and over again.

regards,
dan carpenter


