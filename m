Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C206CC6B24
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSJ0O3sqLFgddt4UaonSmDP16/tngoopJFjM+1I6ujA=; b=Otf7L+NiDFb78u0tfLNor4S7Td
	yEfyL3VlS2ya+zMAVovQwAQGvhoSrsqWImGjkC7tRxKa262kWVTd8ZshtFh8Dw+FCfgYIpxew5Nej
	KAsCcsdvzl0m7sDwfT3xx+LGGrsbB01+edFH0ZFPktvCSTRe8ZREijOVO8Hth0xGshhjT3v2xMN3e
	LUrbrtJds245iwC4exFjot8c03gsge5oRwDbz2GwOfnkPozLjTngH+YEZHNPBLl8ewGiMTP7+I4L3
	PLHHTZDMVsEsZoRg8PB5cLmxs6ZOhsdGOJGWtctmhuh0PWp2MdKB+rEn27b+jDbvLAo6u2WfbQniz
	3MDpQhwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGt6J-0000000Egmz-1ON2;
	Wed, 14 Oct 2026 07:08:35 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGt6H-0000000EglX-1BTl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 07:08:34 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso29812535e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 00:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791961711; x=1792566511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HSJ0O3sqLFgddt4UaonSmDP16/tngoopJFjM+1I6ujA=;
        b=Uaq2RjGFKK2sEdbaC2KCqqC1Vu33mgJWTkxaKCWOUs1uzV9+oAgen9fmnPGInv+QKW
         zSNwpPN9BkmRutkQ954VAE8uZLqL6oKPZcdAD367DFNkUckXY4zNDjj2oD2/hOZzqjnQ
         V0Gi5LydtG21Rm/jtJRKmbpuih6r+EEq/6qD8/i1i8do9uuloWxCeXya3/M8Ahhri3D7
         xp36y9VHkJdVoXNfCBDnNbqUd+XxkFMq52MEZY1Pj64KzGy/rZpQc0qE7KxMRnsXoEHQ
         BaH8LVqlq7kQCao1F79h4NfQO/u/KRT7nLuDB6X20ARBFohouMKrUC3q4PCCPeq87G/f
         H1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961711; x=1792566511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HSJ0O3sqLFgddt4UaonSmDP16/tngoopJFjM+1I6ujA=;
        b=auTDQC9EJV0S/TI5j5F7Ry7p9Zbs9N0RB+vQ0kHIEqq51+gdIjfv46kDRoNH+5TgqO
         l5avxiCAxccXegZANmiF/4PQ9C09alEdzv/IcAzkidEYbaIt11f/X7wNhXDegwt0aFWq
         6TTyO8bjj2v3S9zTYSVwZ3PVzj+3+KSxaqHYTQRlKg2a8IS8zOqMYm6ORrkoIEMwQUXd
         GIwBStDD66CRLrhDaakcJP4/aweuOyiTz+7PBAoq3y/4Bmiub25AwwqgYn7MBXxEiv9+
         +ubrThNzuWrWrxRdHAiRUOWdWoFGdG8kByCN54CXWxCvbriT7+SJgzZ897rOPC9zGo8I
         XOUA==
X-Forwarded-Encrypted: i=1; AKwUvBy9FkYfguh8+PoY6wXzFoYJ+DA9EP41w6nNrdYLlEVtt81/tEfWXusFCwtKJcVfF74d0NAXRbcqZKPRrV3jqDw/@lists.infradead.org
X-Gm-Message-State: AFq9FYL7cUb++0iJ08/CjoCDPSbdbTm3TKHsv77E0FNXSu68oyPZ8NGZ
	lECg4vzi+XXb6w48B/Zs+5iTMHiVN6sqRbvdTdQvZJfNz3th3MzfGXLe
X-Gm-Gg: AYBFou1RdfOJ+fjcipOOpFwGf3uMIxs/nzJ1A8l0RBLzYJeGhhpZj4dX0LHi/mg9wxL
	x4/9ksrUD32mdp8rYRF9oOoTuIjTnaJEPImKIi87EKHQmhA3Nson52jSAnlAQ7It5RibdyjZUaD
	L0mrakWNy7oq2MXWud5d7DEWZyiW8TMXxSzJp0tx9n3vlFynXwqcSqFbnzpTr8giCbBbBSbBta7
	tUGiuJWee3fW7/3YUYsdA/1XkWQ2peVqEv8bfhlS9OORlcFG2wgO46qGJ2Hvj52xhjxowu5K7zV
	O02LDB3oCuUbPCCubCIfPADuHPoatPuzyrGGm/HYmSdb2sVcnStLpjkwGoaDq9FaXnVf2vDq9bj
	WK/4bTyhXtU9pI6ofmF8PWzDNdNazIDsft8U52vzgEZ3FefWWqm4Bn4JH6dI/eRN2e75g+HmaCE
	AixOO3El0gr0dvrI1d3N9LNiohjxj8+NbArWQd71FZ08D83Kizei2d+ZZhdLqnkJWbrPI1pRc0a
	+9t0A6geyWFYrRL3OubMVh1Bsv7RkD/ucJYlgq3X4YEQ4Vg1hYsbbSGmoeThzUE+QD37NbtLHKV
	aDV/L1LQBsMdf4W1Ng9N81c2za7pyqA9ehCUmvB/iy4rOkdBFAMQO369Y7Xb3A==
X-Received: by 2002:a05:600c:a011:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-4a18e447d8bmr284640295e9.2.1791961706847;
        Wed, 14 Oct 2026 00:08:26 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b748cbfdsm15512585e9.0.2026.10.14.00.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:08:26 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Navid Ghahremani <ghahramani.navid@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Wed, 14 Oct 2026 08:08:24 +0100
Message-ID: <20261014070824.1719493-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <asy9K6Gqygrl492D@monoceros>
References: <20261010130024.177503-10-ghahramani.navid@gmail.com> <asy9K6Gqygrl492D@monoceros>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_000833_329013_FD77DB83 
X-CRM114-Status: UNSURE (   7.85  )
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

Hello Uwe,

Thank you for the review and for pointing this out.

I have dropped <linux/mod_devicetable.h> from the GPIO driver in favor of
<linux/platform_device.h>. I also audited the other platform drivers in
this series to ensure none of them unnecessarily include it.

This change is folded into v2.

Best regards,
Navid

