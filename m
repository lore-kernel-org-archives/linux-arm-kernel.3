Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7189DC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KBEhlJoNhEUfCpIMUFLTjnuolbIcay5rAFRembGkrg4=; b=yx0Xwws9eK06F+BhGhEEEuSsMO
	Bv0de2LaKe78grS6SPtAboS0iTYBYs+IxU9U23ODrCaWkjXciGqzrOV2sIcTMh8be4O7xfJCkdjJn
	s09W6s6C6PJdvg3TyCO/Y32IomIkg/LKOKumkbr0amjD5KYfKgTa2rCY90OYIkf6490PefwJs/xn0
	lKK/cbUGdrnIpxDDIqvHonRYHM8uWyOn6rcvqSy1cp7n4GtmtCHp+yN7z77foYasM3HL9wFToSJY5
	qQHmaiu9BmkZzzCovYnvmk1Df9A+9zkdCxICNxbcrTcWGNLiXWncWUedg5qwl9r6rwqgqjTagnmfT
	PtdrkQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOOO-0000000DJvh-0wFj;
	Fri, 21 Aug 2026 12:30:40 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOOL-0000000DJuX-40U4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:30:39 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cedda2ce6fso5484085ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 05:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315437; x=1787920237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KBEhlJoNhEUfCpIMUFLTjnuolbIcay5rAFRembGkrg4=;
        b=AvoGmj+7ED4Sp0uEvpQhL3NSKjNa51/Vs1Ux1OBUnO05wu/t8qXNGQMAOuTC4PAjOC
         jQ/Lj84L3zcAZbCPRrXIIG9+9dfKeJ8vIzSCWTFWR/b2QW43AYWdYOFQrFXib5ebTZ6C
         hmFxPI1+3UoOugnSYITfe9dxlA820KgNYxpxN2yfFJRIITK3CK840XBkch4N8ayV+K9q
         MndtPINkBourck+puvaOYtrD84f64LFGuXkFA4zI54UTjtxsFaUGFh2E4oiHoXOtnd/v
         V2dMoLf2Y+JZDXTPH4+X/gB93pc4GIp83ZlHx18ky4pvNONllAsad6Apvnr39gzUh49k
         DiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315437; x=1787920237;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBEhlJoNhEUfCpIMUFLTjnuolbIcay5rAFRembGkrg4=;
        b=cRtoUPSvTv1jMwy3bxq05qiqNidnz+dkYRvtxLtOw6ZmMIAZnXs0Bu9e9MR+9Yc2FR
         aa4vNSEOlEtB67u+UzyImzXMV3skEpwWztg3N5SJ5hFPfoTYdkrn26xQTdw3n0y2n+uF
         w8jOBemTXmy4ar3+8egy+n9s3/mMGkU9Pkq7AQ3V37JkWSj+mJLIGk9KofQ5TFy0JEVW
         nqLU1d1fkv2iQAaqJHJIRSa7eblyU+OR+ijXUpWNYSm2TbrBGCGNn/8xlrfD/3FBybe4
         g/8h01mMLQ6BOmoW7HYbJwmEtelQhDXku5X0PRWKf++GyjMpDc56+Qn4A0olYL9j6g5c
         opfw==
X-Forwarded-Encrypted: i=1; AHgh+Rq2KQMYMuq45CtnCpDbK8cTgSfRfBxY6Yd864eX4SQm91yEqFuKJslxZKZagzbV5QQ58YR0mXSF101NKiDOZGuX@lists.infradead.org
X-Gm-Message-State: AFuF++mWQQYiDozWPW+xffSwHasuL4Bt6+vZOAtAGo57SfuMZFNlrT0/
	aJrq+yiT80ICmwRLvYXJRH4dEr+ASUjr+9fNv9mxoxXBwllnqnOE9Qb5
X-Gm-Gg: AR+sD129FbAvVpRbpVZs4trAEv5bVPj/aup56AU4bLHqQF/YQ4320VxuJahTDkOnL38
	fpGyuGTWWA3SOyoYxsG4GF4zRMoRcR5jU+mHv2PKy9YlP8aqR/eKq5gaL1K+Q59a/igCW3WwR9w
	oEB4qghHLS/1SmVZ/KUyKf6XNqv1i0s8tunAx/d5Zh00WKiB91ArBg4cGr3VIPvkI0REEGUS/ho
	y3itbmKf6hffXBlKyFd1+KbSHw78Ab8U85B6nTSXPqN7DglFCZG2p0tOplGe+DyiCpiBTM9108J
	zTgZ3DGj4ZhA2EcOBNWgmZ1pQ/kd24cDVBWEWWhC6UY7Q1s0B2tlduzb/raLwtO2jgwc/qThyO0
	wQeWxEvtnwdMPpmXMI+ZZIhV1JOr8fXDzU0JsY2uk2f2wcBIW4b0my8Bsnsd+0fkgPnptMEVWtW
	m//7gUItSb1qfHwfYS93a7SCFmhTz1PoUDiXB+swjYLLyCU9tQtnU+tQrhDt+Kat5yMH6fGksyT
	DTjT/eP4NE2lZGBm4CiZGGx3yy3rmJqnYpWe6KzzQDysynUeiIqSUj7XBc0XifIwoQZ1WqoeIBl
	t8Aw
X-Received: by 2002:a17:902:f693:b0:2d3:7c58:b0e1 with SMTP id d9443c01a7336-2d64a9a6dadmr114013055ad.0.1787315437005;
        Fri, 21 Aug 2026 05:30:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e1besm18302235ad.53.2026.08.21.05.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:30:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 0/4] ASoC: mediatek: mt8186: Fix clock error handling
Date: Fri, 21 Aug 2026 19:30:17 +0700
Message-ID: <20260821123021.41390-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_053037_999863_7CE5474F 
X-CRM114-Status: GOOD (  12.40  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series fixes clock error handling in the MT8186 AFE driver.

The current code may fail to clean up clocks that were already enabled and 
may not propagate some clock lookup errors.

I also referred to the MT8183 implementation, where the clocks are handled 
using devm_clk_get(). However, the MT8186 code currently behaves more like 
devm_clk_get_optional().

I could not find any indication that these clocks are optional, 
so I dropped patch 5 from v1. If this is confirmed, I can send the change 
as a separate patch in a later revision.

The changes were found by manual code inspection and compile-tested only.

Link v1 : 
https://lore.kernel.org/all/20260820111253.97866-1-phucduc.bui@gmail.com/

Changes in v2:
 - Update the cover letter.
 - Drop patch 5 from v1.
 - Add Fixes tags.

Best regards,
Phuc
bui duc phuc (4):
  ASoC: mediatek: mt8186: fix APLL mux setting error handling
  ASoC: mediatek: mt8186: Fix AFE clock error handling
  ASoC: mediatek: mt8186: Fix APLL enable error handling
  ASoC: mediatek: mt8186: Fix MCK error handling

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 103 ++++++++++++++-------
 1 file changed, 71 insertions(+), 32 deletions(-)

-- 
2.43.0


