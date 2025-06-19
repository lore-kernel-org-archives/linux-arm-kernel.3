Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102AEC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 10:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQQ3Ad8xd/gXzhSgWbJo7HjFzyCo0MZmJJg+rjfMpiA=; b=niLLL+T+wTuJMALulxSNaAE1tr
	IsGWNs5cfAZg7HGBrL9YFNVIWriKuLmyiT2kY8cyCzTQorV9nl7hlob0JlFYkC8AbmCL4Xv39y0VO
	0gjrZz7yujhOWsttCrW3u/DIO8Ef09Thr+AsH+wQuOeYz/RhjaKCeheznss5evCiuhdoM4H4cnTuy
	oMW1b9sj0PL/dfpqVx/8eoPSkJ9f4sa2dikvn7DiBOwvgAyqRYXjoscRrB/iEkC7t38ScJi+Z8H0c
	2QdFrfA8PmBsa2N5xrWH/EZV1ScWLCisgklZBf/7owiHm93qEWLs7M+SUB38DnKP6IJ0OzNK6GJwh
	SrzdjCtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSC7j-0000000Che1-29V3;
	Thu, 19 Jun 2025 10:03:59 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSB6P-0000000CWCD-3Ix6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 08:58:35 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-55350d0eedeso499958e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 01:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750323512; x=1750928312; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQQ3Ad8xd/gXzhSgWbJo7HjFzyCo0MZmJJg+rjfMpiA=;
        b=RaOudLYHIkzXqGaBiCOsZ6781kchQIMAGYQXlu36fVycGVFR+hq9iYUgqM9C9+3JKL
         9RAPR1Yn2b2RBy0vgTCRNWyx9Uh9VOIZn+Ym9W87/MBtP1Y7E4bYv09OOAGTOSllWidF
         1Icw5i0ENhqw4hds+uQ0Gx7FlcGxD77pvTmW5IdU1MBBI4NJmGOus1hDIVSD5bHs/uSe
         gQig30HbGIXvMThlvIhDuco1ZkQtWWUCr97zsc31RY8KF1oRNAGjrP39myQDCGrVqGbi
         7JyYKwtD9tiPikCMi5Tpf6L8jd8qGHZ4o1Pd63SWGGPH+s9paNu6FQC82DFd7OvB2JFO
         iCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750323512; x=1750928312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YQQ3Ad8xd/gXzhSgWbJo7HjFzyCo0MZmJJg+rjfMpiA=;
        b=o7WpHVK0ImSs2k+0peDL//sy9vxEqRc/Yld/Z2ZSUPIlzlW6M7lNV/U1Z148lXz8mB
         2ri/xtVBdoqAcmSONN4nyokEexXK6ZaTb+CxVfUqgor+EShQQVoPkjerxeF+BAWixMrK
         9RGaygpCDavswlJAfE5l9UICfF5h2rxbMuEMYR++okaupRcChLqJYwd4BUWAtKeRHO17
         1CQaoBR0QLqDPsyKjUZYrozto6gr5J87q+c6lvzubwNBxOgyErOvg1OPfGXpIDEthTB2
         YvJyWl/O4pTrfpKAZb6H3l1JvHdsBdzLHGY9rLzEEVGFNolQ0q6FX1SIcm0fnP6ldCsG
         W5sA==
X-Forwarded-Encrypted: i=1; AJvYcCUMoKjDvdtopz1W6Ijy4UGZV8kBzgvuVy9ZTf1MskaCfYrrTWsWH0fkKBPnaymWXC3+e3FfzppL6Ri7b3xub/Ws@lists.infradead.org
X-Gm-Message-State: AOJu0YzKZfps6HA4EiykqovqdN3kEjJZQbtz3grJC0h1VHMbMq+lmXCL
	MzgzEZmMQZxTDN/HDYgCj8huBk9OD5TyrBgziYMuyCr/hJbexulKhgFtq706DYy8qNg1vhfKjEB
	oXcRqvnbURdym3/R6mVTAV6dhXbbzaH3HkQaKbDmCog==
X-Gm-Gg: ASbGncsiEpnQcnnC52m7BqQfIa8CNjAxrOZ5OOQU49CARGdGWPzitePBerEOasG104D
	XIxkalFVbglVt5+GHgiX404mVIRnYPFl1ZMUQricowmwOHkpAe0zwh+Wa2n4JHiRVEj+vtpKvgm
	R/cLAV4rWjKeLqupKNiymaBEZZ9M5lVmUWoaKQ9UOxmVhjov74E0QfAXyyEHd3PA72cBKn8Z7aD
	M0=
X-Google-Smtp-Source: AGHT+IFdD/1jTvO6x1IgzidwZt2XK0VP7pgS282orlNSuUnNeGDtt9tznwgJaV6i/23DDXdw4QcbDmhWF5puBYWdpsw=
X-Received: by 2002:a05:6512:638b:10b0:553:cede:6a9 with SMTP id
 2adb3069b0e04-553cede087cmr2038325e87.55.1750323512059; Thu, 19 Jun 2025
 01:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org> <20250619-gpiochip-set-rv-gpio-v2-5-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-5-74abf689fbd8@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:58:19 +0200
X-Gm-Features: AX0GCFvFwqdMku6Ga1EUw2bxcWk7yA8B4y-QiGMepH4vtYQKsxYzuxQuOLrii5k
Message-ID: <CAMRc=Mdrg+0xUcWnvk6Z8bDP9JuU0ZoVfD3kfaMv+a+dO4AzQQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] gpio: pmic-eic-sprd: drop unneeded .set() callback
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_015833_835174_F9DD2808 
X-CRM114-Status: GOOD (  10.00  )
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

On Thu, Jun 19, 2025 at 10:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The lines on this chip are input-only. GPIO core can handle the missing
> .set() callback so there's no need to implement a dummy here. Drop it.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

