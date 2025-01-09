Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20ECFE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 11:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2nCc8HbGldw9LfhpiTbhmTYOxJteiO1laY4NCBBSAE=; b=k4N0Hhupt2XCV9R4UTJ9uxbzXJ
	weLwe+s5gX+zv5OMBnNcuVtOwG7JjY1VhzDsQBGXqZtfzKqedMn8FuYjKiIC5nb3jHj/JxG7Sa+Ye
	gdM6IPhgaz1VQfEsuf6+H3a2orbXSwtyuaqE7HKgQ4jDvguGl667v7dKU7gbOBemFiWyd3RUVFpya
	KUXAduJZlpJnWdvLfgEdNnaN4iosliRCd/MgjImS8LskVCFuhBy0nLibKNXp6ZvO3zouBHTcqBrT+
	8pqzfBwKVUOyhOEFNKfrW/e5hRySIP3xIb1pBLC07yNC3Go2Nhx8vA75c0IeBoTwqNLuIIo/dyqv9
	k+QqW1MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqVZ-0000000Bg6U-2rvS;
	Thu, 09 Jan 2025 11:15:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqSL-0000000BfQk-0Axm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 11:12:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 89998A418F0;
	Thu,  9 Jan 2025 11:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AFEEC4CED2;
	Thu,  9 Jan 2025 11:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736421123;
	bh=Wo5MXuhqnIS01jK5J0cbjGzNeqCVSl4C/i7jg4stBgk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WI0jm7vB6NvpRBFwW5kIEydC7gRORnVQX3xfpfuy2B9yE+o7VA4B2+NMRc5co96gX
	 hxDhgYRXYkMcjVhHsyj50CV39mVLuuCzV72gtg6BB+NzheAHiBoX6gX11GkkywqhJI
	 v5wfyIjjup1r+b6R1km2BjgNjSLFtwVAOnDCuHd7tbhs/oeXiQgyTeEZ/N/SZt1ifr
	 iDU7Wx72Jbo1z0SGJ799MtoNLRL6uZD20WjtKvEX6fD8ufhmkaYUjzkFY2LYCj5L9k
	 fIUkMmlDVmQn2PopWU5UE52t0Cq6ciTLYx8CDB8KGQUnIyXXdVtrJb/vn9bmrA69aT
	 LepL57iUrRilw==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Pankaj Dubey <pankaj.dubey@samsung.com>, Heiko Stuebner <heiko@sntech.de>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 John Madieu <john.madieu.xa@bp.renesas.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20241217-syscon-fixes-v2-0-4f56d750541d@kernel.org>
References: <20241217-syscon-fixes-v2-0-4f56d750541d@kernel.org>
Subject: Re: [PATCH v2 0/3] mfd: syscon: Cleanup, fix race condition and
 remove platform driver
Message-Id: <173642112103.2599649.16413367066154581013.b4-ty@kernel.org>
Date: Thu, 09 Jan 2025 11:12:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_031205_145532_D94A6F1C 
X-CRM114-Status: UNSURE (   9.03  )
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

On Tue, 17 Dec 2024 12:11:39 -0600, Rob Herring (Arm) wrote:
> Questions from Krzysztof and a syscon related binding review got me
> looking at the syscon "driver". This series is the result.
> 
> This short series drops the stale platform driver part of syscon
> support, fixes a race condition in device_node_get_regmap()
> which is used by all the lookup functions, and allows for registering
> nodes without "syscon" compatibles.
> 
> [...]

Applied, thanks!

[1/3] mfd: syscon: Fix race in device_node_get_regmap()
      commit: 805f7aaf7fee14a57b56af01d270edf6c10765e8
[2/3] mfd: syscon: Remove the platform driver support
      commit: 26769582bf353ae613f5113a1414ff3a80e08264
[3/3] mfd: syscon: Allow syscon nodes without a "syscon" compatible
      commit: ba5095ebbc7a83965ac049a50fa493d7c751f19b

--
Lee Jones [李琼斯]


