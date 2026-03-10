Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FC7F3C27D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 09:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2F848Zif0ENv+dioxwCTNyt1oN71pv8VacY1VvtFtA=; b=ZaBBHr2E0by59t+L+Ct1ktxsSM
	Xe0QHIJsp997M72XG5s0DMRUNSWCqReGQh2IrFVZOrXtp0VAN/KwmGQ0NO5yBSrA1fFvSRn00rOvn
	0MaiR0fvbeYKU/J0Tkr5ZEEgA0aStAmrm1wV7O/m7V1uSvA9DqR0+kp8//IAVrNIiHUcNh885MQjy
	HSnN8r3vEwlEXLPamUfItHAtaTonEwWordQCCvgPo7fpyf3L7wjBezqfml8dYoLK5rNhsHLbV7GNS
	v/+LDIT1DpYl5/p977Wv/YSB5wFCaPh836ymK4/Btm8S725jw+iDTrCY+SPXKjIyeLHQRUmAqmsAZ
	LC27iF+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt80-000000092we-2dx2;
	Tue, 10 Mar 2026 09:11:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzt7y-000000092w8-1uGJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 09:11:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A1734455F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 09:11:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60917C4AF11
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 09:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773133905;
	bh=k2F848Zif0ENv+dioxwCTNyt1oN71pv8VacY1VvtFtA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KGzE+AkPTbDePLOfxxSTz0NJMri0EekeriaoMph7b9Jbqih5Ia32kL2tB0bpRXAaZ
	 Xd6EgwIO3zW8wsj5KPHnW557mQOlYLsZmYMSs3/zPmDxiTQ1jEJyWWcLDAgaOVZ26j
	 8FNpzsqFjoQvFDl4B1/w6djudKuYNee9wTmWamLyhMa75x3wa/pvdJZWCYDV6nWoc9
	 f2cKKUD8Pm9nT3qQuRFerXNryMwk6751oxzDK5gkcVrGPVN+HdpSxKhW+p/6F3f2aq
	 TBbzKVwfBxOwsnrEtZL5vhU6EQaU8FtIppabfHdyf8tNXzvPe1lMPdjxpy8rJPAK6p
	 E1LbYo0/ajrAw==
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64937edbc9eso11502064d50.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 02:11:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+qobh1DaBS5RaMqZtsCL9eDr34qE3SgJG7ol9nTtXhbT6hev1S14qElsJyrrHDujkE9QwBtnUoRftKc3lb+NT@lists.infradead.org
X-Gm-Message-State: AOJu0YyDpX1IZPrlKfirq9PHOxr2q3fwcx3t2c2QaWuDKN1KF4CebVi9
	1MdJj4olrkih5qL4SBXIkR4/u8OOggNjxlRBLwD80Wz48QNaQ8XkaNjQXfL1NvjLWHcIV93XXq+
	LTJ34TP4khXQeSCGGFfEAx2nSokIjNl8=
X-Received: by 2002:a05:690e:b8c:b0:64c:905:6f2c with SMTP id
 956f58d0204a3-64d1411d8b4mr13101525d50.20.1773133904182; Tue, 10 Mar 2026
 02:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com> <20260304-gpio-of-kconfig-v1-7-d597916e79e7@oss.qualcomm.com>
In-Reply-To: <20260304-gpio-of-kconfig-v1-7-d597916e79e7@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 10 Mar 2026 10:11:32 +0100
X-Gmail-Original-Message-ID: <CAD++jL=pOw2ZZqMXFK4cQ67g3yUGho6mjbW3JM8iQDQpiKL8TA@mail.gmail.com>
X-Gm-Features: AaiRm53Xu9gGfY3MrM83r361-dKQ36aGj99vP6wgofH18qCwDYgWNRZvm6MhVmA
Message-ID: <CAD++jL=pOw2ZZqMXFK4cQ67g3yUGho6mjbW3JM8iQDQpiKL8TA@mail.gmail.com>
Subject: Re: [PATCH 07/14] pinctrl: Kconfig: drop unneeded dependencies on OF_GPIO
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, 
	Wells Lu <wellslutw@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Sebastian Reichel <sre@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-leds@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_021146_532738_E0B36156 
X-CRM114-Status: GOOD (  10.94  )
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

On Wed, Mar 4, 2026 at 10:03=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> OF_GPIO is selected automatically on all OF systems. Any symbols it
> controls also provide stubs so there's really no reason to select it
> explicitly.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Patch applied to the pinctrl tree!

Yours,
Linus Walleij

