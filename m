Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7020C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 11:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nw9fysjUFNBnPqpBPahG5IhvqPdfXTNqHeGEK7bkjVI=; b=AHwyQx+80WJAlyT9qgNrN/zZM2
	48NYfo6kIn6gG3bG5cXfhZP0mSapVDVNg+/7PVc0CpMYwqRwjEk9gfbpKvzZLkxXbxdq6F5XcowQz
	u2+n0GuwHiD5MLkZWK/ZLrOp6WMg730R11N9tlFk3yBTK8Rn1ribMhl43y+aN/oKynBb0nH7SOA3s
	y5vdZ6JrzgfdCh7s7Qm01LRfupm5dzLKvyFU09Xi91QlJb8Knil4jdbeXau6UkEyTzN9DmpACQE3I
	yae3pzR9zY64Xy3wXD/f8XEDV98JTMYqjtUNzSy21qRg472iqeXzYh5he3T3eymQYRqXmMNIdo39G
	uYEyHpvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXtH-00000004pz9-2JMU;
	Wed, 23 Jul 2025 11:44:07 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueXqq-00000004ply-1pJi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 11:41:37 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-e8dbe824ee8so1350047276.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 04:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753270895; x=1753875695; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nw9fysjUFNBnPqpBPahG5IhvqPdfXTNqHeGEK7bkjVI=;
        b=Xz1my9abWObQd/abZY1jprv1+VKrTy0SqpTE6v2kVote7ogOIOOdFJ4g5F3oNyvaKx
         k3C1qNwrtJL2wmqLJ2o+BThnhcntvVKP7ScO0numXSfHCTpalvCc57MbqNn6f4PPCHib
         I0gXPugaD5ml7zaUgPArnRle/KZDxqYyMFz7IS8gntVHQpifwsUsjGKD7JSaTH1pvBGP
         uz4Bm0Y82uFaIurYb/2WgxCQOovTEWAIcSqtG5z/e1haM9ah03G7SS3gDGYQL4u8km8A
         lmgPYlVG+9xvMLBIzyQR48dde8q0jc6vLW3hn450lmr+PDkQMmIKCK+KD/q2HsEDkBjw
         iwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753270895; x=1753875695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nw9fysjUFNBnPqpBPahG5IhvqPdfXTNqHeGEK7bkjVI=;
        b=wYTx5GNLXMrdTExbyk+3wDtGpPTt8P5NogBRNE8l25peSsjSByqzd0mCy1czdK/1UE
         YUoZAdDx9U9bkRzR2vXhLsrF/jQMPbb3CwzRKXKJ6YtLjzKOn6rLnSpmxmBodHawVWW4
         gHSQpGhb0kZKkVZRJ9HAW9ebbIO1uV3pbhPB6KW/eapfKieeAGKLYw3ctJAtRoa+si+J
         UiX2btXo8g942fRzxsPMiiHotxMvBGhwMqqatOhK3R0dWFXIy2nEUZ70UlGaKjowdMcS
         a9Bgz3866/5HX5Clq82raMULZiiB/VNmc8SbowGnXoTD9PUkWhDuDbN83kk4J2LWwpmT
         LIzg==
X-Forwarded-Encrypted: i=1; AJvYcCVwRISXsplJZarIv3jpbZ08Ty+4/OWNAkdKeFLRDzZflyCbm60ai2Ig8lLQ8gIPh6+nWU0CaTu/UHca9i8TIb89@lists.infradead.org
X-Gm-Message-State: AOJu0YwSahKdevhBsN1zAQkRBT91P8vYYReT6/ddf85tV0Izmx2EPyE1
	mz9mISOwWbWuoBb3GAn0UsDIlfo+eeGBzRnKJftHHBwJna/gbfffbA3Ym3WsVkaPoM7COLmoY1X
	AYnZRP383y86/T4P+yYNTmBrERepewIQCukFt1cndWA==
X-Gm-Gg: ASbGncuAlYSSdL4iJ/eLkfHGmmyxMkERIBOVpLcBKWwLe5NFNEnvwTu2nid0mkpqisB
	A5kQfkAfC3l+tn91x/FNQLBZMkRz47LLZGChQHCY6zETZPMgOysZEJsTptvbgpKdHUHAvUSWLpL
	4gwti6rS95Ks2NSEoF3Fl/g+8dOc/8XWGw6bVfmzoTVk+eE/7msvLzAsU4ASh2mPFynM5751viO
	aZxUYY=
X-Google-Smtp-Source: AGHT+IGWcKhCVXkg1msIEVmGS/ymhKW5BdJC9jUDzoeyLepuP7cjRQ71PwnfgzcSt8CZwmzRfOwOfwnqwnX6XBuUIMo=
X-Received: by 2002:a05:690c:3347:b0:70e:1874:b914 with SMTP id
 00721157ae682-719b4133d40mr34871357b3.9.1753270895185; Wed, 23 Jul 2025
 04:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250720022129.437094-1-yury.norov@gmail.com>
In-Reply-To: <20250720022129.437094-1-yury.norov@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Jul 2025 13:41:21 +0200
X-Gm-Features: Ac12FXy4Emm7GHQ8mjHs2JHTJya8z2HMRXPPehvvRCGdC2DlowB6xUhZ-7S2d3A
Message-ID: <CACRpkdYuXuTx_JG_7Zd666v_5Axv2jWV9OYJO15DQEZ8AkftQg@mail.gmail.com>
Subject: Re: [PATCH] ste_dma40: simplify d40_handle_interrupt()
To: Yury Norov <yury.norov@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_044136_474984_C9120189 
X-CRM114-Status: UNSURE (   7.55  )
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

On Sun, Jul 20, 2025 at 4:21=E2=80=AFAM Yury Norov <yury.norov@gmail.com> w=
rote:

> From: Yury Norov (NVIDIA) <yury.norov@gmail.com>
>
> Use for_each_set_bit() iterator and drop housekeeping code.
>
> Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>

Neat, looks correct!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

