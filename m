Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E1CCA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 18:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6eTdAycFKzyoelmWzAqDQwOHsmx7MWbf93DwQ7V1xow=; b=mRV5pac9KY1vlFPfcDwDL6X734
	oHtkfBYkbAJnCoRmt1LXLqkB5zJVNTPeVxGYdIsItHLwfvREJTx2g4QrWh6leHEMpwvzv4HXlygRJ
	ButTdO3rY2Gp37nf8eCHxyJr8L0o2QHJzOcsJhXNuxJZ59KHgTpmro8uhygZVkyiZVTkivkBLMl3k
	smB10w7mUtUZsoBDNgHgfK9Fff7pMR8FaseklWUw95JxVtutqvV+2lGs6T1qHN8Jovi4PTZrcdBvc
	S/2ft9vEdaIUguRcdSotjw6MMgmHFuLyJh2YYkoBppyDnBBQ/QnYPfEGImCJoaFl866AvkOuFC4YQ
	2i5cSTOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFM1-00000006ydK-0aB4;
	Fri, 09 Oct 2026 18:30:01 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFLq-00000006yT1-1TGy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 18:29:56 +0000
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso12763015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 11:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791570588; x=1792175388; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6eTdAycFKzyoelmWzAqDQwOHsmx7MWbf93DwQ7V1xow=;
        b=XSSjE+lxPhJJadSbpnDlo81itQ+5Fprw1kqZr/FgYkgjUI9XJ7B9IiKXfxF5R0ked6
         tMowsIHGWVi2U2ap/4ZPtZLi1LG2p3bvbmKhllO2H5VYoccRfvlEawwXqnleV2x84Lr3
         p5KPzj+OEw6PXPRwyyamnmI06OCky8MlHPu+X7LkRJ2bZAEgI6QFM29tB9AeCdlD/YPL
         vDBAqUjSiYK0NYA2C5KXaEIrj3OX7DlO1hzrfPAlyNug2Lhxhd3NC8EMG3/IQOvCiRft
         F2WO0ZtKxnBQNBpZ+BxKFkl3uEHZOAh2kQ2O6tFSUUUNPUke8JEEYtIIuxcUTVlEabuV
         36Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570588; x=1792175388;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6eTdAycFKzyoelmWzAqDQwOHsmx7MWbf93DwQ7V1xow=;
        b=Umn7eXcvhXC4pI69XzA3vse0aj53p0Y7rXpAIxBJg5xLZsfq5WAZjxjzWpnURzV569
         XzU5Yx0Ixzcp62mXlhiahxvNjioy1NAGQbXF3uI/+CJv7xUsJIIWsFaiVDpjFmCZBMqv
         8e9wBr36ULHeNU+5U01FVBkSjwcfDqKeDZHiIx7OBhnoMLQ08I4FRFw+PSpB2fSdwWfb
         gIDK1vG6/3i32FkyrkoM6xqJUNhzvSq6JfiRgFBKx2HgB2uTjssqL4AHiJ3C9ADd1Feg
         Vthnoq8g3/fyJPtImrnwAUb8LiAp6JFdo433O5QDa1RM+hYH5TjlcY5/EkcDcEcmON8q
         tGaQ==
X-Forwarded-Encrypted: i=1; AKwUvByUzdPLFmLjMVzZROtQkW7Y4iRCOT6afg5mK1US1NsKtLnMYTrBbA0ilh0HQc+3rlb3UtLecvNbtkX25fn2aPOp@lists.infradead.org
X-Gm-Message-State: AFuF++mZVPDIgTniu2Xu4Mw+FebhgO3r7FJ9CricPXEHkfLojXUo3RJw
	Et8OwE4JXHxep/5RP8GrXCfZUQwQG/7siXxpWfpeASNGumuD56fJwHBUYzUIqGPOIGw=
X-Gm-Gg: AYBFou0AcquRRkajUmjc5CjJnYpdRnVvI//AKHFoDRmsm8X6KxS1PraLwCS9FqpjQ3M
	TudxL+nIc3+ekDMokomgFHuHhoUBotpeW7CRDZ48NZ3rF8+jSu+zqSCueKgxWTS0j3EiShuECZ8
	sVhB1ZgDwNynxcRBLSchOtztcCZUp/b7UFAsmtHXEsdSRqYBGTpJzPooVnKQynZGfpE7NP38edx
	Y9UZ+/NXKHvZpKEeiwdmlufbj4LLb1GMgSbVywnXAuAoEKJWk2yX7tEmHWU46bXFU5QYpMwk6b0
	s43Yrl4z5221pj73I+1Y2LRaietvbycw0IDph9DlKPU8Y+eq1zVOFak7qrm3g+4RKK+qxJ8PC9k
	Nkvzjqd9XLf/C4cFrA+N2m/py+ovtwjr+isVGsaHLvQoRKuUE/YtE4oOlUb81a2QmHsYV0ixl6O
	szAaf4fYUUNTepZih4iVZtZ5d/QQ2qCjFqNfnSxyMGUEnqtBZM38UmUewerslH9D1KgMxxsy3Vz
	eopqsCJTD1J1+QKHA==
X-Received: by 2002:a05:600c:3146:b0:4a0:34a:588c with SMTP id 5b1f17b1804b1-4a18e4a7cb9mr54978795e9.14.1791570588129;
        Fri, 09 Oct 2026 11:29:48 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm111362245e9.8.2026.10.09.11.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:47 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v15 09/11] clk: realtek: Add RTD1625-CRT clock
 controller driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: jbrunet+clk@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 bmasney+clk@redhat.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
 james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20261002074331.3066919-10-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-10-eleanor.lin@realtek.com>
Date: Fri, 09 Oct 2026 20:29:35 +0200
Message-Id: <179157057524.266328.2343186062671086748.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1049; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=I/1PyQTs9JiOymPOiuzFhvwhZ7XqmQsZMTD56HnUL+U=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknjaY+v5c248QzibkLb21kunR8D1/LituXzsQ2tD9P/
 iV/+gZPXEcpC4MYF4OsmCJLDXe1+DtJrS+zpuvchpnDygQyhIGLUwAm4m/M8N83YEvPuYu5lRa9
 ehNe/CzZ+37h77KfreL6/8P4p29eEnaHkeEn7y8J9Q2/r2i8u3L2os2d9b8eB5n3+86QuZjLJtM
 +fycfAA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_112950_434999_F77BDF4D 
X-CRM114-Status: UNSURE (   8.98  )
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

> +static const char * const clk_gpu_parents[] = {"pll_gpu", "clk_sys"};
> +static RTK_CLK_REGMAP_MUX(clk_gpu, clk_gpu_parents, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +			  0x28, 12, 0x1);
> +static const char * const clk_ve_parents[] = {"pll_vodma", "clk_sysh", "pll_ve1", "pll_ve2"};
> +static RTK_CLK_REGMAP_MUX(clk_ve1, clk_ve_parents, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +			  0x4c, 0, 0x3);
> +static RTK_CLK_REGMAP_MUX(clk_ve2, clk_ve_parents, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +			  0x4c, 3, 0x3);
> +static RTK_CLK_REGMAP_MUX(clk_ve4, clk_ve_parents, CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
> +			  0x4c, 6, 0x3);
> +static RTK_CLK_REGMAP_GATE(clk_en_misc, "clk_sys", CLK_IS_CRITICAL, 0x50, 0, 1);

You are using the using the old global names but there does not seem
to be a good reason for this. Your driver is entirely static so the hw are known at compile time
and you can use them. Use .parent_hws or parent_data when appropriate. Not parent_names please.

-- 
Jerome


