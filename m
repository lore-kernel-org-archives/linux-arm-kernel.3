Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB293C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 14:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZRV0fsadUb2RGyF330MZobT+Dwgs5Uikgpa9gJZ9qc=; b=frUnlmdo4JWV+U0nAwkxxd2NsD
	QUi6f9l1dFQE/QecB6jxDdQ0VhxczoUu7rplowFkuYLP9TazCOs5Bg06aiF04QfBBkfgdVXfKfndc
	9L7ct6osy7NM37TmZavkvmnYfduuHvaiB/MMyZ9VaGm6/45M3+Chp+Gd4idZRbhdMFVlQ85L0/zHj
	Oy5c7hQjoLOnZmyC3UkAwC+JrAo+Ts1hcjYkOVwcU8OV9CkepWhEIGFxWVH67uSeV/F49gA1k4zCq
	pFfDy5tQ7kIgEYYD+QtCtKRlScXV5h87LZhnd7s2Nv3h0tTbrO7FTvQR03JaeRYOdOSAm2PrbYP63
	XP/F8f0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVes-0000000Gmx2-3lbS;
	Mon, 24 Aug 2026 14:28:20 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyVeq-0000000Gmwf-264k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 14:28:17 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cacb8416a1so30637855ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787581696; x=1788186496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZRV0fsadUb2RGyF330MZobT+Dwgs5Uikgpa9gJZ9qc=;
        b=imFz2cNwnS4Ynv/YHltC2+vvTQEo1B97mlf9rWOtSSmXeMAbcSyNV95EbpU+pSSGpg
         28IlHH/5lEl/vgAepZA04W8YwyEglPpgDMNu0514ERiqiWt9VwBFhASwuvu4Bq/FQEnQ
         VSeTdb5y4DInum5rfYiLX8LgbfOg1sG/0aHV2TEWLOTZQIcF/zTZiEJM3r98gseyq2JS
         o+xz/HMqkRNnDbkivnmiqcFn0ApVruysJQ29WMJPkdrEUYJGAoG4rlMEKd10XFbg/MKw
         ZVA5+pDDZJbctq01kfuYaFxEHzHhz+E18CgdiGxWix+FrqoeTq6Lja8u4RYbttkjujWl
         8qyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581696; x=1788186496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CZRV0fsadUb2RGyF330MZobT+Dwgs5Uikgpa9gJZ9qc=;
        b=Z+SPCAl3AmNMzhAxttI0Z99cek1qZdF1VUrmtG7wmx/PiA1u0SUcSH6aARtET1G/f6
         /t0mgVJ0aiC4zu88/zgqNDZNWxlvqLmYmsdSt7JfxYCocvjV476kwEPsy67T9y7kWsxl
         g9HPQduk5qxjZgK2xySy9AulJbcKXKVlmsOCJHYcEvf1JVt3bucBZZmGhDQ9EtirBxwS
         649xpOqmGyqmavDY1KWkhJYqiUhrbgZNTt05+EQVMpIm/ef4AM8OoUizOO2ZN9Bq8cHJ
         J642xMgytLRMTXuh/hVc5RBW6t/Yj7NeUvMVrb3KUx7OJ3lZZls+YiC/8fX4abQXsNxO
         RdqA==
X-Forwarded-Encrypted: i=1; AHgh+Rpv0D4SUzB7viPdrlmP4DC+MsXyb+WfMKDTWqKpOHNRZYRw8O6+V/eOFEcSlXzvJnJwpwVG/z8vZWxz+36LG1uC@lists.infradead.org
X-Gm-Message-State: AFuF++m0xJNOgdVVKJrintFVUDVrZcwBC1e6aF3wI3jog7s11eliZgrq
	F0qek1a6r+oP+2JryqDLbqTG9MFJpvc/SKNi6Xfns0hTzFX+lUkIDshjioNm6EmOQD0=
X-Gm-Gg: AR+sD11Y1folvway8nHbv7AGfqvlzGTywcoe4/PSAPw4NL+L8jCurUcdwaPwNloTZra
	jjJ73AUXnP+E5twlgF/WXASnBrneb0U+eATexyZqvGIsFhlUmJGstostdH6VcFCAZqUqy07aRUE
	a4hE/LIVOL78tTzj6UCM3K/qLWDmTzDaH8UOFBV8i/uQgNWho3dGO6A1FGpmqYyrUfTmlNZfwVn
	CQZTNon7I4DFBmFtsNbVgPSw89EP3zs3VVsWEgvgZ4KlMF+NcmsB6S2vbr1Z+Xvf9fmI7rt/S5K
	Fqq5ikzb1hhb7/G5wTk+nmEGLDMA7zQStLbJMCbr6M1vyYFGGu8mo2qIswwvuM5GhM8qXynUXMs
	X0ow6J4ivrW+rlzHi43QurPi1lbGr507sG8xh4GjWUabi1Y2JJmebQWlYlq9nRmLYomDI8ZCJTH
	0uARJeht3FID/qJ4JD/0xs9hFQicBk7cV/uKdwXlfSpRGeqGmGwYonej0ApyQn8xBUlixmv7RHJ
	HVk9T9K92a9aYLjpXeKG0ezob18EuhSC/gJSs9iplMVlNZvi1Kf
X-Received: by 2002:a17:90b:224f:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-395c354d445mr44970306a91.2.1787581695499;
        Mon, 24 Aug 2026 07:28:15 -0700 (PDT)
Received: from hanzj-mi.. (ec2-99-79-140-187.ca-central-1.compute.amazonaws.com. [99.79.140.187])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4a1597csm10201997a91.13.2026.08.24.07.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 07:28:15 -0700 (PDT)
From: hanzhijian <hanzhijian1991@gmail.com>
To: Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hanzhijian <hanzhijian1991@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] clk: mstar: msc313-mpll: fix off-by-one in clock array allocation
Date: Mon, 24 Aug 2026 22:28:00 +0800
Message-ID: <20260824142800.3497263-1-hanzhijian1991@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <67ec3261-9f3d-4dcc-b916-19dc8be56a6e@web.de>
References: <67ec3261-9f3d-4dcc-b916-19dc8be56a6e@web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_072816_546701_9880AEB1 
X-CRM114-Status: GOOD (  12.71  )
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

The hws array of mpll->clk_data is allocated with struct_size() using
ARRAY_SIZE(output_dividers) as the element count, giving it 7 elements.
But the probe function stores the MPLL clock at hws[0] and one
fixed-factor clock for each output divider at hws[i + 1] for i in
[0, ARRAY_SIZE(output_dividers)), writing 8 elements in total.  The
final write to hws[7] is past the end of the allocation.

clk_data->num is also set to NUMOUTPUTS (8), so the clock framework
reads hws[0..7], again accessing hws[7] out of bounds.

Use NUMOUTPUTS as the element count so the allocation matches the
number of clocks actually stored and exposed.

Found by smatch:
  drivers/clk/mstar/clk-msc313-mpll.c:134 msc313_mpll_probe()
  error: buffer overflow 'mpll->clk_data->hws' 7 <= 7

Fixes: bef7a78da716 ("clk: mstar: MStar/SigmaStar MPLL driver")
Cc: stable@vger.kernel.org
Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
---
v2: add Fixes: and Cc: stable tags

 drivers/clk/mstar/clk-msc313-mpll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mstar/clk-msc313-mpll.c b/drivers/clk/mstar/clk-msc313-mpll.c
index 61beb4e87..bd45aa0ae 100644
--- a/drivers/clk/mstar/clk-msc313-mpll.c
+++ b/drivers/clk/mstar/clk-msc313-mpll.c
@@ -105,7 +105,7 @@ static int msc313_mpll_probe(struct platform_device *pdev)
 		return PTR_ERR(mpll->loop_div_second);
 
 	mpll->clk_data = devm_kzalloc(dev, struct_size(mpll->clk_data, hws,
-			ARRAY_SIZE(output_dividers)), GFP_KERNEL);
+				NUMOUTPUTS), GFP_KERNEL);
 	if (!mpll->clk_data)
 		return -ENOMEM;
 
-- 
2.43.0


