Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DEAC021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 15:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9h1A/L3XkFtOhpkUoBg9QPTU/Mxwl7Oam9mJp04FoKQ=; b=GdG3RE2g/2B5cEo2EL6jc80V+h
	iqhs6qOmT3K8z8g/Eud6zCajwjwereR4FCbztFMml9jiadzQJ7dXKF1vXerzE6iTzoG0SmNt6S+GX
	NNzBXGyf0stgJWYH9dkA2w/nFgQI7Z9ASdH7sGBDz9tv+q70hb4CSFhzxEhPw6ok6T9GCFHb6LCZz
	sBCDePllng0BeLX8Qw3T994/S9p2zkMqVYqVv4hL/vOM5aGruUVrZHd8FevHrxFgIi7osMzWbldgn
	EQna62p0up3f3L08ZfgLyaEqO++FRbB8fsA0Bdq/StKY0ZT4aKgBzMbEDXgTzP9qhFzKpKzy0KCUm
	t7l2UNAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8Hj-00000001W6B-1MMj;
	Thu, 20 Feb 2025 15:16:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl8GF-00000001Vkx-0cQZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 15:14:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 023CD5C5E04;
	Thu, 20 Feb 2025 15:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79472C4CED1;
	Thu, 20 Feb 2025 15:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740064485;
	bh=Jr4RZS/lLGSYYUJMf0yeHvt9Tqeg9FKGi1tgzkVvkgg=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=RJndwkrSKfX2mzgsQQfynKTyajKX/j2plUbo3YFVKpm6aUFT7VYdMyzN9qc34fllF
	 7usoiCpSQRkDI2NbiDYsqOd0eh2mNUMaYXUCtamP42vvZ/ry+f90XctS7/3vs3KeNA
	 1kSzKEL8di2BgD4lgYWeTWUvZ0EnXfU3XDtITFQDIGjVPovtntDywBA1ISKrizZWsR
	 Q2kbp3LTNV7fOllQy2ZsHa2M4pXotics8y1Yoe0nOTBTXSBTEE/SqXNQehkXkPnvVk
	 7cexNoowoVyRuleDw/cDnHkffNBKU8p8KVbqGcl/gXCxGx8DVB+ZWi2uJxWiE86JmD
	 PFUoUjgDiOmeQ==
From: Lee Jones <lee@kernel.org>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250214040306.16312-1-towinchenmi@gmail.com>
References: <20250214040306.16312-1-towinchenmi@gmail.com>
Subject: Re: [PATCH v6 0/3] Apple DWI backlight driver
Message-Id: <174006448223.804925.7595809321241346941.b4-ty@kernel.org>
Date: Thu, 20 Feb 2025 15:14:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_071447_242198_8477D6DA 
X-CRM114-Status: UNSURE (   8.78  )
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

On Fri, 14 Feb 2025 12:02:11 +0800, Nick Chan wrote:
> Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
> and iPod touches the backlight controller is connected via this interface.
> This series adds a backlight driver for backlight controllers connected
> this way.
> 
> Changes since v5:
> - Remove default y from drivers/video/backlight/Kconfig
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
      commit: 0508d17506fffb6d38df4c2dc737fb4f343a0840
[2/3] backlight: apple_dwi_bl: Add Apple DWI backlight driver
      commit: ea45d216dd4e5b389af984f8c9effa1312e3cd74
[3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
      commit: d1ebaf003a065d5d337b8fa3d69f9b90d7bb759d

--
Lee Jones [李琼斯]


