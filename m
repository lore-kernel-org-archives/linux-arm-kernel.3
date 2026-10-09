Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F44CA9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 17:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmxj2lj4Q4GvWHDzZDgnLPWqXygKdSJybIHJoEn8ViA=; b=fX6XunIhul5j62fzVLB9WRqEDa
	ZpFRrpsEq++RWqhoRL5v0lZfBwzTKqIaAyeVp/atmHGjuWny9MN9cCRcUNpDZpOLjc+HD01HfnFfJ
	lAiPOvU+wDvmoU4h85d/4NOeKQmUhad5qLZQIDw6adfbDVu4y4+SSmkUn503ULabS+nNQJiqdJOPo
	+r2SSFClqUJzitVGAIeSpQ1snATWR6KBotHU8ZBBjvHYK7ep4GAH+HLbg/fUbLfteYGiwodrfDzNu
	KJrx/WKoZoh94qElYmW0DBbL9vBTCjSKQNHToKKDxcxhDsAxANz061CCqWXjwoQG6FVqz0azF6Rvt
	/MlpoOzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFE7F-00000006lfW-0OTC;
	Fri, 09 Oct 2026 17:10:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFE7D-00000006lex-3uAo;
	Fri, 09 Oct 2026 17:10:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5EFCA60DC8;
	Fri,  9 Oct 2026 17:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3431F00893;
	Fri,  9 Oct 2026 17:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791565839;
	bh=dmxj2lj4Q4GvWHDzZDgnLPWqXygKdSJybIHJoEn8ViA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fNJmsG4zhF1In7gUjuHjtoK0y53A40lP41waKw8zUGqnvv15X1G9pdk5Lqech6gOb
	 yENDX+AjLLoSkDSU4BS0Ai0SxkRgfATOzRdD3r3tPsEJk2Iay3psi9yFFAGXc+AWS1
	 DFsJRk0BPOk34qC4wTly5FvQz0LcAo8n2bKwNo7xK4uS/VLou944qNzjR3e4HsEBSO
	 MI5o2jheNu3TG3rZ3M0WWGXTr8pWgNxTq50I++Ve562U7XLK7oWCLYemapQpHy+tNi
	 HK+A4l4d7tQo4Bcl/iqDPtnjREwKxdM/OBHgSctFsX9WIZACkNqTFllxlMRgrlOPdh
	 8GoxcrYGpOICg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>,
	Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Scardovi <scardracs@disroot.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	jay.xu@rock-chips.com
Subject: Re: [PATCH 6.6.y 0/2] gpio: backport CVE-2026-53226, CVE-2026-64241
Date: Fri,  9 Oct 2026 13:09:48 -0400
Message-ID: <2026-10-09-1-daily-reply-0011-gpio-rockchip-teardown-6-6@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008191824.98662-1-artem@trailofbits.com>
References: <20261008191824.98662-1-artem@trailofbits.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

> Could you please consider this series for 6.6.y?

Queued the series for 6.6, thanks.

-- 
Thanks,
Sasha

