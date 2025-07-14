Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9468C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 15:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTrYnqjKlV8yeDLpYJrmzKSqJHoAjMWHbL04xCtle7c=; b=361Cd96MhVsggrKCn94Sedt0Sl
	BLSy1z+FoGCwrKfz0Jt+OCc2tdy7EjVeA9kBiF5woBMvgH/kRVOG3fBSxwFoB4optt5gXtJpzPSWZ
	u2G7kV54meRF2YiMQgMZUsa9aHjnuFXmcTOz660l7ZCz5j1hj+vF6r1J7MN8DUucRfKo0pjhZIEk7
	20Cio/DIdu3a5oM3npWpgHdK9YAPXGTCKS5ri5HG5eXTy0RWFddniONzCKRkpzlgH/qs5KZdmAMk5
	FplMjboVFyHoXphob+FXCYRzEZjvKvQZIPKBGDhTwVYz0UzDGXzEhmnz2DeVZQ9YkogKs+Wq85yWF
	dEQumg0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubLIn-00000002ilv-2r5c;
	Mon, 14 Jul 2025 15:41:13 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKRq-00000002W4q-0eai;
	Mon, 14 Jul 2025 14:46:31 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-234b122f2feso3759925ad.0;
        Mon, 14 Jul 2025 07:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752504389; x=1753109189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vTrYnqjKlV8yeDLpYJrmzKSqJHoAjMWHbL04xCtle7c=;
        b=jaLQ2cCg5CtmtYc45qiYsS83FcCB+58D/wD96dE43CsIzGH4Qwmcejaf5j+7BQ4aKK
         dAyDDHW6dc4w+k/aFDvBhHPnqVQwscHX9gK7Ki43ZojbFmdDnViTxkA158Xnw46Yxzxt
         I+QNhue8z9vavaCmr0nIjkaXcjkB1SZkNP4x5hZhiNtJfTzQNaxRAnQqQBc4ldK+hWnJ
         WTVFG2Ly1jGWe49a1NPAq9g+FKo7Tv++9ziZpgrNCC87lbH4zbYaE5Mjr+DeSzeozPZB
         xOyc3ysJtpoQkZ1TWppwdpLRibBmDRR1TNE28ux1azeNW5km04kd9EhKda6+dWzpV1fS
         t3dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752504389; x=1753109189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vTrYnqjKlV8yeDLpYJrmzKSqJHoAjMWHbL04xCtle7c=;
        b=oVekS2oOn9tZuVpIHvC5f2dk6IIYjQnZgmGTakryeTrj/xXFXeMWxR2CYHq8yUs17z
         HkoEf3VY40Fn2Rtu7wODsZqp28io77pMNBkF3V0TWJEnnHkABi6xhr7Eo1hr+U3kIZ47
         Thxmb52asAWX6B8EgcdKq7cnQXf6dtT5VGHS5ihJEnsG61gwhSG2bqa3lUq86u9gsAgC
         xlldAE2o+ZY2RuMs/2cvfV7MUdXoZ4p2zJCiMHdtIx82Yct0aMh1xdTGso1kyWmtNbCT
         UOqYTaiOy8otf7rPtSerbpuRES8LaD0PxAbmd1wTYMEJSidYStdA0xv/x/vDr9AcioUN
         o9Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUtqD9mpBR+0QKKg/ZdJ370cnd/MaSwdJbKVz+aJvGTrKZXwBFISY9bpvr95h5pD9BIKE5IDVvBOdRkTZMsRNw2@lists.infradead.org, AJvYcCXtpjOG9kw04iWwND3qtsmTiLdNHBgwNLOXfGmD3BD3QZ2sDyhlbIIhH3uQn7Qxc5vJfcReOsr11d+BT2CyR8U=@lists.infradead.org
X-Gm-Message-State: AOJu0YwlPCLFpt1fGGT4j5RaT5riiWH1z7KnL7mDcY06foX9j7kYgJPd
	hHItVImzI20azPkAqz+lyWX+VOYt1pInuHj7FM1s9kkzRqG9nwJ7jt40k++JlA==
X-Gm-Gg: ASbGnct+qDdnLhQ117YwP2Y4DgA+jpvkPos1kBKebmMQ3ndKNWclygKW7fUi5/JxlKO
	+NjEYFf8T6HPxPGYnilRQjuoeQetZdTPOG/TgjvZT4QUXNGf4Z91YejGa8tT/vO9OMbCtGbAB6+
	I6mXL5b7kT0UA25Y2/wA0NJ+nKhJ2ORrAjYHOlgM7Y0lfel3L6Lw6cTRRPobS61RM5YeLBjeUrD
	c+a9FO685QW6FcQhybITeUt0bhjkSGESgpFCu+N1bK0682yFQxOWvW3cXWW4N8TgKITpvwciU4a
	N0ZEUt69IzjVmjIFld55S2fX6XAp1LkVjrh/UKlNm/MjKDku053ZVA0ruVI9BdrKZc+VUAZ3rUb
	W0LRoAqWuheoKVvt5i1iabxw=
X-Google-Smtp-Source: AGHT+IFAGosVVXQkVk2nnqj6/hurytlHP1Idv7N5hzLwKlkWrcvqLlzgh+DOk6qF95MalA4WEStwVQ==
X-Received: by 2002:a17:903:18d:b0:234:a66d:ccd7 with SMTP id d9443c01a7336-23dede388c2mr76047905ad.7.1752504388871;
        Mon, 14 Jul 2025 07:46:28 -0700 (PDT)
Received: from rock-5b.. ([45.32.55.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4345e6bsm92622375ad.192.2025.07.14.07.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 07:46:28 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: detlev.casanova@collabora.com
Cc: heiko@sntech.de,
	kernel@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	mchehab@kernel.org,
	nicolas.dufresne@collabora.com,
	nicolas.frattaroli@collabora.com
Subject: Re: [PATCH 00/12] media: rkvdec: Add support for VDPU381 and VDPU383
Date: Mon, 14 Jul 2025 22:46:10 +0800
Message-ID: <20250714144610.258372-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2229133.irdbgypaU6@trenzalore>
References: <2229133.irdbgypaU6@trenzalore>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_074630_194293_5E8913A1 
X-CRM114-Status: GOOD (  10.76  )
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

Hi Detlev,

On Mon, 14 Jul 2025 09:35:19, Detlev Casanova wrote:
>From the linked code, the max size is hard coded to 1920x1088.
>The driver sets the frame size type to V4L2_FRMSIZE_TYPE_CONTINUOUS, so the 
>snippet you pointed to doesn't update the values for max/min. See [2] for the 
>discussion about using V4L2_FRMSIZE_TYPE_CONTINUOUS.

You are right, the code of chromium should be fixed for frame size type
V4L2_FRMSIZE_TYPE_CONTINUOUS.

>> 2, Playing H264 videos ends up with green screen.
>
>Can you elaborate a bit ? What videos ?
>Is that on both SoCs ?
>Is there any logs in dmesg ?

I am playing a 1080p h264 BBB video[1]. There is no error logs from both
chromium and dmesg, but there is only frames refreshing at the top left
corner while the other part of place is green. This happens on both rk3399
and rk3588.

I have checked that this issue is not introduced by your series. After
reverting this commit[2] which adds Support High 10 and 4:2:2 profiles,
chromium can play video well on rk3399. I will investigate further.

[1] https://mirrors.tuna.tsinghua.edu.cn/blender/demo/movies/BBB/bbb_sunflower_1080p_60fps_normal.mp4.zip
[2] https://github.com/torvalds/linux/commit/5e1ff2314797bf53636468a97719a8222deca9ae

Best regards
Jianfeng

