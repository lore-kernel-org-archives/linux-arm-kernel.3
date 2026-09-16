Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B673C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3FEA+oyST18v1zQTtRjBsrs8LKBIAI2sSiAsUdrn1Q=; b=RaVmEnVTP3GmtVyHzzGGfF8NWo
	3YHgzaQIB6pBrw0e6W933TpPsYwB/PmfrS0DHJQGuLGSiIK0DzwstY4lEbtCcDitYrj+ZlWeJ/q0s
	4x/+LEs4WWHS8zf2jRTFv/l5ZP/UaAcL3pbnxMr6YTuh6/Lrq5j5qVp/B3JuuCK/VCfLnZbAsVpQ/
	mqo1RnR4jATTyAYdd0Q/akswZLaGMiO9jwGvwZR+53G/4eHXydr7QNyT73Yix0XUOEZamxp78dR9w
	7HgBdhB3WlCpCRDHlnNM8qjWsiD8kASAbLSvOPCSaeFYiHIrEPern2MoDYxnJ3/GGFvb+JsOfPHod
	BX5C3E3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mv2-00000008yis-2Uff;
	Wed, 16 Sep 2026 10:31:12 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6muz-00000008yhu-2L2K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 10:31:11 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so4030045e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 03:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1789554666; x=1790159466; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t3FEA+oyST18v1zQTtRjBsrs8LKBIAI2sSiAsUdrn1Q=;
        b=cqdWoCvRgTKRyo8eMHLGeYWz4cP4MnYf898Ob3OIrwfSeYf2h1wL6cC2VXVwmBJgdj
         o7KhCaj+31pmb0i4X23FVNMpTs3HH1us26Ldf/hAZWUdSRkQlVcWQRQePgvauzuacXVt
         88xQJEL9Cffiqp0fdOcf+X0wXvmb/QCCzbVS61irBMfMfD/GHoI3SVVAInErscg+xxQY
         Klanhc3wbgX7zwl0E8KvcXVqDoFMUjw4vf0SR/1Y+T7OtcY2JQSNNX7bB0dOHHG2/Fwt
         AykvqVZOUvqlhs9QLqmmHUHkt2v3byveKEa2amQcn02ieZ8Eetp2/smTar7LTF8AQNzZ
         v6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554666; x=1790159466;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t3FEA+oyST18v1zQTtRjBsrs8LKBIAI2sSiAsUdrn1Q=;
        b=FXa/Laiqpot56wWVBjSLKUxlC0y5SLahBqf349y8Rb1i4mQNJDXuYG1JYjfzvTt7bX
         kMByHBh/YYtPT0ZufI8Qd8Kcf3IY7xEoIo9jf7asBUQH/7RMfQuZbHEMDpJxrz5AMmRc
         x3NLom8HcKie+4/Ld80eWhaCCIwvG+PACcLpRhNo9QK4YQUFiJFtoKznrCPMzUp+t8cO
         LmOMawZ7+9vckNAtg9QFWyWrJ5H3w8uVFnU4S4YAPLrWbMsao+63fn2CpLTMc0whodTP
         2kpmCwl8+fcpQ9ZbyuZk4cEBAYQoJn4/55oSxGzmzMTwZHbbnGp5nkQAGiePcCq7EMll
         RqRw==
X-Forwarded-Encrypted: i=1; AKwUvBx7AqxfhC+dbRf5go/qwneicEyq+csfMQXc2qyvgTc+P0dpsZXg7xtBNB6NcGxDgvlbNUU0GL8AFWtDhSTQMcEx@lists.infradead.org
X-Gm-Message-State: AFuF++lNaRGfzg3IVqSSakYvyrJ0Cdn99RlapmiUSA4c1NwibQlPDy4p
	TIOiHWWBs/avRLF5dSCdI2EnUD39smfWiIg9kXSUMzWqz7fYmFW3hrbAmcK7Xn2z8Zs=
X-Gm-Gg: AYBFou3r9CMGaPJCS8XmiZDFUxLow1Q+Sg8cA26gYqoRbQ51Tie4e0/LyJMbxXnnfUB
	Q2PWDvvYjCePPS/EBnqajVLCPesrzvFFckUqd6OrLAmguf+K5iiTSHSGunGaHTorABHwdBdSAxA
	zSOnNYqFpEEJmKvyCUmN6J06lCfkI3zeCW6YHb95ou9yN3mjbO7VJ17MWBUZvLEHHsbETtsyz4M
	Tbvxrdh4Jtw2B+h/49iB0T4AXMXaUKNxlPwPdkvOge4tVQzrKD3h2uCD6s+sk4jczHky8R57ccp
	HobRCAcvtXzo83w7q1H5olHHAU6zg9rYP9qxwt43/3fWo+ot29Cp2uDTbp/+gCD8MY8ZJuPRXHh
	5m23NkAoK3HzZgf41OtcWoHFsgqlMWooH5V17fNSQk9BrrggiLzP692eYn48/j8k4fX6t53GxCO
	JjDJw3p275BHPhQtISOUBgRsYSDsbMzn0cu/FpqDyxt2KmSvcsH+zoRzgVzQ4bJ2X03hvDjjOSo
	Kod/fte5ejL+g0=
X-Received: by 2002:a05:600c:3492:b0:49e:7c4b:1753 with SMTP id 5b1f17b1804b1-49eb72fb6c2mr20631655e9.12.1789554665907;
        Wed, 16 Sep 2026 03:31:05 -0700 (PDT)
Received: from dev-ag ([102.33.165.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71813665e9.14.2026.09.16.03.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:31:05 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: Julian Braha <julianbraha@gmail.com>
Cc: linux@armlinux.org.uk,  dvorkin@tibbo.com,  wellslutw@gmail.com,
  linusw@kernel.org,  arnd@arndb.de,  afd@ti.com,  aaro.koskinen@iki.fi,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: fix PINCTRL_SPPCTL=m
In-Reply-To: <20260904121825.43320-1-julianbraha@gmail.com> (Julian Braha's
	message of "Fri, 4 Sep 2026 13:18:25 +0100")
References: <20260904121825.43320-1-julianbraha@gmail.com>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Wed, 16 Sep 2026 12:31:00 +0200
Message-ID: <sa6fqz9ij2z.fsf@dev-ag>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_033109_878976_BC852640 
X-CRM114-Status: GOOD (  14.25  )
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

Julian Braha <julianbraha@gmail.com> writes:

> The PINCTRL_SPPCTL option is defined as a tristate in Kconfig, and the
> help text suggests that the user can build it as a module by setting to
> 'm'.
[...]
> Note that I have only compile-tested this change, since I do not have the
> hardware to runtime-test it. Please advise if it would be better to change
> PINCTRL_SPPCTL to 'bool' and remove the help text suggesting that it can
> be set to 'm'.

Hi Julian,

I've tested this on real hardware, and it fails to boot.  I don't think
it makes sense for this to be a module, since most of the devices in
this SoC are pin-mappable and need muxing to be configured before they
can be probed.

Let's rather fix this by making it a bool.  I'll send a patch shortly.

-- 
Andrew

