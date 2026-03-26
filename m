Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD09C10A3D81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tv7QpuJVdTf1wjKrhZUMjCEULkwSK8/1efhKcAaxLgQ=; b=IFGdlQi/JBDVXUFg+C9+6hwb33
	DwJBzVy9p1lhz5XG5bM/+9lmy1tCvrvGbQG22CR0AgeZfy6LFjIlL/BSIHSWOsp/GFZZttyVR9oIT
	7sr96JdO/hXqVkDg5JSmIEQe49zOtJPYqVH3PUADODWg8q1GfMzLUOc+toOQ/cP2D3aZ+NdUH7PH3
	W7/beSVipQ667ImYcD4Gn+r2eDpXGOSvyVJxNJFaYmHosHv0ZNqmf06in7/xeLfeb2KEchtx/nx9q
	awrnGsXpz2Atd89p1OA2oTbqy2GsvsJuM3N2VDIVH1Y2bBSAuZlEI4kb3rSjjxpBJECKubXbxilJl
	S7QJDkPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jR7-00000005ObA-2cVr;
	Thu, 26 Mar 2026 12:03:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jR5-00000005Oai-0xB1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 12:03:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF8DF4067D;
	Thu, 26 Mar 2026 12:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2684DC116C6;
	Thu, 26 Mar 2026 12:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774526618;
	bh=nXhBTq4rlMGq3oWCWKDipgnde+DqeqIFykqfsBS8++M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FSgCAk+QgxiULXZwRGkDHP/fy1R47SgqrJ3PstxUiF+M415/SNMLm649aFGuJQ3/2
	 jCXJT4qtG+0DoAfEFASVDyDQY34+eDl588ia0DRor4y/vPpo2nPmIayr59PMDkeMJY
	 Z4YEzHlaOqXQ6kOKZwM+4zoiQF40FUd+66rVNlwNHRdwUV3GscWJPf6XddN/mhrr1y
	 gpvs/1rOWpOkw4lcAe2nZ5Cy02liIcEUQ9uvb6bQRTjQbUMgl+k7Chc2Y6HLhpIu9F
	 yYfVmGJezaLAstBVGCJwpRz5XTsMO/8BKIjTyumvhKNC3oYpaOS5JxdAaDs90IQeZ+
	 LBsnsa2GppHiA==
From: Lee Jones <lee@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sebastian Reichel <sre@kernel.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-pm@vger.kernel.org
In-Reply-To: <20260316-gpio-of-kconfig-v2-4-de2f4b00a0e4@oss.qualcomm.com>
References: <20260316-gpio-of-kconfig-v2-4-de2f4b00a0e4@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 4/9] leds: Kconfig: drop unneeded
 dependency on OF_GPIO
Message-Id: <177452661287.1970463.2525511615617194577.b4-ty@b4>
Date: Thu, 26 Mar 2026 12:03:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_050339_339333_3FAAB441 
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

On Mon, 16 Mar 2026 10:45:24 +0100, Bartosz Golaszewski wrote:
> OF_GPIO is selected automatically on all OF systems. Any symbols it
> controls also provide stubs so there's really no reason to select it
> explicitly.

Applied, thanks!

[4/9] leds: Kconfig: drop unneeded dependency on OF_GPIO
      commit: b727ba2560a8a806680b45c9acc5a49bc39b8e43

--
Lee Jones [李琼斯]


