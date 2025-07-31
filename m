Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2E2C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 04:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5Pt2D+lJivBS28/plTuvgaI+t3rSje6fmXy3hZeQKs=; b=KLkwexEOfy1I1BkkKKNQa9EOXl
	NCtvJQq7PAFRuFePthIsW0NcdmLj/VMAWl0V2xxl9uwia033ucA9aQMnBm4M0p6jf2TbFkl0P+DSj
	ayvEGABkofokwhTQUxaamIAemO/vOU9s33Hn2H3zpPRDLWqc7QrebPjnSQgNZaLkSuA9eqxF467g6
	x/L1wsEbo5GwmPUJGFpfYXhbBecT8ImYXPWkg3DPGYwPWHaU7YsUnFY9hUsS7ndrQ135k2HpjVP16
	dSXwQ3simAq/WKYpu7N38m7nBa1OHcKW40n7gW6mf9hLKhEc5C+Cny0UcVwl+yzxqmD9kdHtb/7ls
	0ZtWs0UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhKua-00000002slE-29wV;
	Thu, 31 Jul 2025 04:29:00 +0000
Received: from mail-vk1-xa2f.google.com ([2607:f8b0:4864:20::a2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhKs5-00000002sa6-45S5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 04:26:26 +0000
Received: by mail-vk1-xa2f.google.com with SMTP id 71dfb90a1353d-5392af666aeso175654e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 21:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753935984; x=1754540784; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5Pt2D+lJivBS28/plTuvgaI+t3rSje6fmXy3hZeQKs=;
        b=acQyPZqJgLggRcdLUpEnS8oH8FlWMiaq5+7GR1/HQ9AjOBFxbQ4b6ksGqCILTwMxKx
         jM8pA6tDrk8f29b/osqZPX7g2lXxa+Yn5OwtNsbTH1R1o2N55UwfqA96YqVbmbpypbiH
         DN6iUrKNsAPp6/hi9ODbgxeOgYZm6fHDxEfH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753935984; x=1754540784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e5Pt2D+lJivBS28/plTuvgaI+t3rSje6fmXy3hZeQKs=;
        b=Lvq7tout1nZ9BykR8gFHHgap7uN3GtwTIFdlgp+2R6K6aCveSHzVs0LajOn97Xjftf
         Mw3Tnq8aLXfqXcT0VTLlBviWCp7OTtw9p0xLa5lbEcKu8FjXL7hNXRK/2ZDV4dZcIDzc
         kOd0oDVNjv2mGmxcYFsrE1yKyMFEJEQ8N170vkwD7oxE69JmoqpYT28rNj0baTByS9ls
         5DG9kp7uchm9HfFyVmnIBULxV+goiMADZ5AlMEN+ZIVZ/hx1wulOQd1KkqScJ1b6kK85
         MfLCSicP/rbDgBGjgylbYZZGxPlVBB3ORds/YR3mb4pfBYzBg0qZtiwgBwNYBc45p/0A
         uC/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVIl1yGwgLaoJNLqt8OZy/P4G+oKJ6wiRyDzJUh5010cRK9rI9oHyBgd8TrYoBKSWmtO6XTupdoq63B3lKTugk7@lists.infradead.org
X-Gm-Message-State: AOJu0YzR53iWkCWUt92HESP/uzFSUDPuNRP0h3pG+7e0ozPDWLLA8S7t
	gEdjbHPSM44RaaZFW3P+SanT/l+uxmdF4nNAzPp3+pFMmxi7rkMtef+WfGXaEf90Egd0Ty/Z5k7
	NHtc=
X-Gm-Gg: ASbGnct8LMWMYL5R30V8jnyBJzjFtpJDQCZBGFEVdUxrwr3opPQpepLOgcN7itDhFF4
	YaCbEN8zy/8p6st38n6+5WHLiUWyxRGQ44kthooqkRkTnSJSVWfjUwokPWDjDz6Bfb7DxpAUraT
	ntcAVuFmmgFqO37pSyjfVjdCaxNKt/O2c59OtDJr5yt075CJ0IcN1r/GalBT4dWoNmtt5zhFycq
	c+GzJaR3coyWSFbsvYXWH7UZLMJ7uWyXDwtgZRoXuqzcgAbVIE96Ru604ZfRJLgsZe4rMnTG3HK
	emTua6UNVbZh/vbMK21KxfwtuVxz8Nudc/jeaQKF980htJwCl4LeTrbI8WdRgAlWa87LW2dSD//
	6UfrYuoTSospm8VXBGDb4XCFx0BI+hVLs4UB2JpEqjTmrhKWi6YCxEJtF/6E+2A12AvXmpASF
X-Google-Smtp-Source: AGHT+IFcfWUP15oWHioWo3Q+Hh6ju9inFVXOCgNBOQMBwCp9mxRooFxGbz+creiBvYgWwAG9+3nwYw==
X-Received: by 2002:a05:6102:3c84:b0:4e2:ecd8:a27 with SMTP id ada2fe7eead31-4fbe7efb067mr3218595137.4.1753935984537;
        Wed, 30 Jul 2025 21:26:24 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88d8f44dc5bsm202981241.28.2025.07.30.21.26.23
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 21:26:23 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5392af666aeso175650e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Jul 2025 21:26:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLxJkLQzsIxtWObhw2WjKZWZ0olf3VEbloDTEp8yWXYsQTYomcgetb9qZ37k8iOf/r1CcleJY9D6zCI3dAaTjj@lists.infradead.org
X-Received: by 2002:a05:6102:3c84:b0:4e2:ecd8:a27 with SMTP id
 ada2fe7eead31-4fbe7efb067mr3218583137.4.1753935982767; Wed, 30 Jul 2025
 21:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250730152128.311109-1-laura.nao@collabora.com> <20250730152128.311109-7-laura.nao@collabora.com>
In-Reply-To: <20250730152128.311109-7-laura.nao@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 31 Jul 2025 12:25:46 +0800
X-Gmail-Original-Message-ID: <CAC=S1njcFhyY6+dT2MHU02ZsLDq+k_vAVv==bWuoGt3KA18PHg@mail.gmail.com>
X-Gm-Features: Ac12FXzpMbFxjUu23GFYxUNlitLi6oNpjwDf0fTbw3kLbAuwV_H195C3EX5jG7A
Message-ID: <CAC=S1njcFhyY6+dT2MHU02ZsLDq+k_vAVv==bWuoGt3KA18PHg@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] thermal/drivers/mediatek/lvts: Add support for ATP mode
To: Laura Nao <laura.nao@collabora.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, andrew-ct.chen@mediatek.com, 
	kernel@collabora.com, nfraprado@collabora.com, arnd@arndb.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, wenst@chromium.org, 
	linux-mediatek@lists.infradead.org, bchihi@baylibre.com, 
	colin.i.king@gmail.com, lala.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_212626_006292_841C840F 
X-CRM114-Status: GOOD (  12.84  )
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

On Wed, Jul 30, 2025 at 11:40=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> MT8196/MT6991 uses ATP (Abnormal Temperature Prevention) mode to detect
> abnormal temperature conditions, which involves reading temperature data
> from a dedicated set of registers separate from the ones used for
> immediate and filtered modes.
>
> Add support for ATP mode and its relative registers to ensure accurate
> temperature readings and proper thermal management on MT8196/MT6991
> devices.
>
> While at it, convert mode defines to enum.
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

It's not visible in this patch, but a heads-up that I see
lvts_ctrl_start() also depends on whether lvts is in immediate mode. I
wonder if anything is needed there for ATP mode e.g. a new
sensor_atp_bitmap.
Feel free to ignore if this is a false alarm.

Regards,
Fei

