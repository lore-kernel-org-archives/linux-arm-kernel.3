Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F5AF4BB63
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 17:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uOgWHwMnZx9w1Jooz8cS4Bc/NiNk9mYsUDMI09Mnt08=; b=ZUy3pwbd2D2F9vEW5a5p6P1E6D
	hUpd5SplsfATudw6Jknpqo+Q7Bu4n56X9TVU1A0vYYa2xB7oXsX7pTLRjB7zKJTRLjO0YvSPVjzxP
	7MIfwOWqW9H09Rb+P7IT9xnnmaSmwFn7JfCiUcTt+Vu6r4unFFM2NJGdQCFj5UgVTvXckUpfmReMu
	dRuCuqYMdFx/m2oLExZylMssUKtZ8ubJxGRwPp3tI5/l1KHnoEFRp5OiTMMT7LVP8kmv0xIedm6P4
	aouLG0yUcCPTNhYzwMCVpc9fqI/D++WURjTvX5SNc/ZHHyItCmHW31LFDIPj0BZAbOs6ZyCSqUd1y
	YNIe8fCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwYD-00000002Vjx-3tkA;
	Tue, 24 Feb 2026 17:50:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuwYC-00000002Vji-3754
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 17:50:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD94360097;
	Tue, 24 Feb 2026 17:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49EE7C116D0;
	Tue, 24 Feb 2026 17:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771955423;
	bh=F7LLqRfY0kTwQ8BE+UxIrv/t3EnNWvJa9AHwvWsksOo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=se0fpwda7VQpav9DbJPXRO7d/DLA8vi7fIzX254oV7zg3gu+Wtnl+dPdJCEdzrWrp
	 xDw5+nO88tmQi9tA/kHZBdoJxiFBxHAviXIrWafd/8+lg6uJw2oZPcadfTvR4TEdhx
	 QKnNvcIlufVBQG1F+uJiN1vdFsjmaor2uzmADM054ybRF/6mLlo5UbhmpNdQQCKcrh
	 hjLnonyIOzlvScMp0tY/P8dzsaLPTZTu6fK5X6MRX6DNGZ0nMkIiRGHxFFzxefrzbC
	 lGPgnDnHW/r2x5DC6B9i0+yLHf8FD+0oAgLpyrty0oTW9oWWqlBZeubLmg1JBBOWWV
	 LIPczzX0ArOhg==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 samuel@sholland.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260218183454.7881-1-jernej.skrabec@gmail.com>
References: <20260218183454.7881-1-jernej.skrabec@gmail.com>
Subject: Re: [PATCH] drm/sun4i: mixer: Fix layer init code
Message-Id: <177195542102.124563.4695179649495877444.b4-ty@kernel.org>
Date: Wed, 25 Feb 2026 01:50:21 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Wed, 18 Feb 2026 19:34:54 +0100, Jernej Skrabec wrote:
> Code refactoring dropped extra NULL sentinel entry at the end of the drm
> planes array.
> 
> Add it back.
> 
> 

Applied to drm-misc-next in drm-misc, thanks!

[1/1] drm/sun4i: mixer: Fix layer init code
      commit: 744629904c68bde847c31819f23482d09152f810

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>


