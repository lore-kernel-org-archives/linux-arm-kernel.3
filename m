Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF487C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 11:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pv++npyQsS+0elD7u+7CYZUc6oiH830RRaypT/ZkgY0=; b=NINIBN3Ykb4cYym8/J+FKIYaed
	KGeewQMY1Fkm18KFoLu7TjaAGQWzPTZyaETiXNc6oAN+w/hyMuh2lHt0BPK84aPRYcL8C0qxwHC69
	2L01QSRlLOLV81oDOzz1Fq8WKeXKyNqkO/wvGVjbnt9G3RqE94FRgstjtd/Bp0taYe7fHnldQfZcO
	I2gfdGccTLRRVK39yM/LIZVXrYC7SelAibKMZny5ECrLBpOwDgP8TS87mPtDtv5A/1n7ZxCag97Ob
	oYkyz1XCDIesI+iIbFx9k4Z+YbRIObceXHMfzWSaCvm4wyFLGyZyGo/8GtKNS+9Rzm5x6l5YGp12p
	WLnHdRtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx14K-0000000BSwt-2Lk4;
	Thu, 20 Aug 2026 11:36:24 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx14I-0000000BSw8-0j2q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 11:36:23 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-84eb992a881so1672558b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 04:36:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787225781; cv=none;
        d=google.com; s=arc-20260327;
        b=EpkReFa+xGOsGaTd9SNLJBKfTpwqXTI67Z+nY9hNH0MQm12OMpWm+6QfJPSBAxdZOV
         IcMS5UilDsZHsHUNjccEMFLT7h2cb+SZNLEg9p+p5kZDRj46/NZ+JYc9bgN8OTJD7Qh1
         0qLozP62sc6fn5qkg3YRoLOhsMgi8j16CGTBgzdo4cEIhmVCeWtPnb3hbMMTHqabNEMJ
         pFyKiONbWC2+C/8YQlfu1IetGXshpHYMQa0IpBx019Pcf7kIwyCKw4y1tsYR9rXRxekA
         58SJ6EizOTmwxA/9+ySysRGJG9KJpz5LF4Qy4yfiwVk59urdoOqa3yKVPovLeXcGiCSG
         gXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Pv++npyQsS+0elD7u+7CYZUc6oiH830RRaypT/ZkgY0=;
        fh=mVlkGC1Y+oJSo8eshzLD/ZH+yO2etwh/MjEeityq1Gg=;
        b=ATRar+XL8YcMUZAPuChw6L9ZCWArH3GpT2xFS3B2rn9x7tL6omSj2e3NQxL5/SzVxw
         SlfwJDTXMvst2ymzgaly7fnDtroNMe0yGHcV7VV0iljC7mC7M6qqr2y6VMka9++8Kk6k
         0/fDUG54fzTaKdUaPg7kjHct2fMSUKFOggudr9jDJYVtk2ZbrrP0C8WMcFezrTnV83zl
         47eUmHNwC1p7e1eLFP+MgZzA3MelnXtKdYhj+0if/hyxWEWD715Bii03DYgAKRr1QBMz
         4+moESGG+lRlstwAKPKOmivLl8W5ZYVp30K/D5FCixZXhaKMDaR2EhtuDrGHbgtAQb0B
         0uyQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787225781; x=1787830581; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pv++npyQsS+0elD7u+7CYZUc6oiH830RRaypT/ZkgY0=;
        b=Yph8yWm7/MSpojAxFE0dIpqJGtmArFoTA3clt5JYwrquGTY29lPcaJT+pzHLOZDZct
         OtptxCV/kOi0POibLSkXJKSETK8gLyO//DsflsrMm7tcOKJPl46ssMTaKH82RpuhuZ+1
         gD76jn7eCTHPk+1n3qBG4tvKuC4T/SqPucVzEMTyKkyK2Z65WXHKpXCj40iIURC8hJMN
         W6U/eUGIKCd2h1VjfbjXh/dJBJbJa1tcn2N0ewp+qaBNEyDyc/zAfL8kDPfWXIiJjRI2
         G0GI1VI5Yqgf/W6VImaUaq9TeIIEUdl6gvb7+TSWSmMOZLkMmyRfpZ3+AF8/9MGxBd1b
         ZXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787225781; x=1787830581;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pv++npyQsS+0elD7u+7CYZUc6oiH830RRaypT/ZkgY0=;
        b=TUw5eElkp5eVkJIA7WU9+XMttYW+GjcSRQ5tDGwjLUnZy39aC/D268XS3PWCY/cbLO
         QS82qMfqXBEPfizJjJnM7X5dQyWSnx0LYmHh9WUjhik4LBQKdP9AieufXRiEgkzpPKAK
         e40qK2X6mdO5HbuXFbDCv0ZUUjEvMXOCr05uWQQhGEOnMtRo7Rn8nsOTEvObfPb2Y9Xv
         CmBZEvRMu6LMWyoMRg5M3K2u1o0vk4elQk6VKjaLqQd3TB681uH7wmnI0NZtN7+210uU
         zRUZU4BQEldnVeJmJ/SiqXXBQRV8jBZ/NqxY3yhttAHp5ReiPFDq6IbHLy6vcwF92M6x
         Bekw==
X-Forwarded-Encrypted: i=1; AHgh+RqLs32HDduodivjYa9P9fPXEpbo23Eo1kZCrLHmRIzZNpKWs9NuJESnwqGI4GOv7pnDX7roetmDlFnDwRwvU435@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc5SAP8zBU63JZQhjjgOcbc6HdwXjy0Dq4jkeDhnP8bdg7izcQ
	JGfgD6zUjyN0R9uGnrssDysy6s6E9g4VmWPn/zdAdZy4yw5bmoZX/WYtcKhkMq68zS6pCe7cpmJ
	0/xPwy0WeAJvzj5Ug1IyBLaP20Yveals=
X-Gm-Gg: AR+sD11pxRgVqZ7Br0e3MFvKA+QwScl/VS2Xf0kpRTshmLsWTgIOHg68/dIZG3VjVwF
	AwFsV2Jx8cUAVU46mt/TlLxB1wIWScAbOuc7sSwV0XT+8EgwYN0353yKFN/0Oixm4sGPOTGzE5b
	wMkHoFwvv96Yl8j/VV8jc5kqb8RgGTtxf8I/1QTiQlphdcldwBhxw1bvJzF2ccTkdIfN3VXa3bo
	/TevwpcFVnULD1qn/4dWodtzAuCvJD8UwuRinSQjFvXHMH2UkY9t5T1Ua8435CHWjnyv+5y4hAJ
	1Wl6nRAQ4kCC+t46o+MwKHr9FcgWAUri3/kyaakQYsjssx63OAUZNLOmWnWNk6CYEnw80TnKwpe
	Gb1Cuz2rOv6vUdzvPSgesykzdA4kHPm1ku7W5werSFo5J9ARAMmJkkUvBgFUrSqokuWnzFArciH
	4o7jJ4JbtxljNS+g==
X-Received: by 2002:a05:6a00:2e92:b0:848:2c5e:305e with SMTP id
 d2e1a72fcca58-851d382f3d1mr18117690b3a.6.1787225781272; Thu, 20 Aug 2026
 04:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260820111253.97866-1-phucduc.bui@gmail.com>
In-Reply-To: <20260820111253.97866-1-phucduc.bui@gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 20 Aug 2026 18:36:09 +0700
X-Gm-Features: AcwNN1XBwQbXQT6wc4CnwLZAJqiHhO0ddYg-yE6lNaCe8_uhwLKGBMlMjT7-UaY
Message-ID: <CAABR9nErEB6c-nQH+mvP2V+oz-tACQsiH0hY54p17CNovmZraQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] ASoC: mediatek: mt8186: Fix clock error handling
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_043622_214859_BBBEF89E 
X-CRM114-Status: GOOD (  14.32  )
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

> The changes therefore assume that the clocks used by the driver are
> required. If these clocks are intended to be optional and
> devm_clk_get_optional() is preferred, the clock users would also need
> to check for missing clocks before calling clock APIs such as
> clk_prepare_enable(), clk_disable_unprepare(), and clk_set_parent().
>
> If that is the preferred approach, I can rework the series accordingly.


I apologize for the confusion. clk_prepare_enable(), clk_disable_unprepare(),
and clk_set_parent() already handle missing clocks and return 0 in that case.

So I only need to confirm whether an optional clock is intended to be used here,
so that I can revise the patch series accordingly.

Best regards,
Phuc

