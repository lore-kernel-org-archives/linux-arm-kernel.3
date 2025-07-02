Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18FE6C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 14:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tp6qbi+ZUsoL8Zvytk6fdxJM4TvJdtmSvks0lRTguZA=; b=rhctUjiBWen+459tYQ5YyUdKCJ
	4+oCrA91irL8+2L61esjmcJQTq40Ek6C/UPioTeX48aoDMHEFm0fmNH/IIVhuWtj/TgySdnvoBAtH
	141zO8snO/6UsvRg8ZXuaULMsv+CA+WtopudzW5ZODWduEu91NGCzWauFQUAajtC0lb1e4JpJGK7N
	OGoYXtsnhCH8iiKALgbyC7csYJBZnk8vpJv/yazzsARYf3EfQr7Igou9sIpx+uiiSArGvYeiXVI1H
	+4/1feLoELL/klC1fpd9x+tSAx9g2fne3YLNBBenYjHmj73xd0kLbZ/r32LpkUqmoT00uT61s7LXl
	/R13YDvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyot-00000008geC-3H9k;
	Wed, 02 Jul 2025 14:52:19 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWxqV-00000008WY0-0LXx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 13:49:57 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-451d6ade159so31675375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 06:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751464193; x=1752068993; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tp6qbi+ZUsoL8Zvytk6fdxJM4TvJdtmSvks0lRTguZA=;
        b=zG42uhKPb8av2ae0xGGfC6u8sRgRpJZKtYjY1IvsU5rPghZvPBuw8pBv7KvkwRQ0ch
         h5YVmmb+95V6fiP0FFK+nmc1UVfHCwWcPenZgnk9x5BUTCKiMatAyedwbkE9JT+FANtj
         1gZ14dxNKrll3MqGrBoNQ+FTS9nIuh3RDrwW+19mB3dBsq07AVJYaIkrIfQyXLFr8ubC
         4UG9LQ7ew5lQJs4+ZkX8Xotysm/D/mQabaMFknydqyVJvFJiGhUVgeQkU5jBWC58wyaa
         s5vTPbWV6G90152AkIYSHqDEk+R2lq+/rg0F7nhlxvnAglbYQHQSBatY9rVlVv2bvB9r
         0pFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751464193; x=1752068993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tp6qbi+ZUsoL8Zvytk6fdxJM4TvJdtmSvks0lRTguZA=;
        b=YlQyEpHflPMv08Fuhdmf3AiNfgZE+IgS5WaQH09hSkOmaLbwaHjaDBNpasg7IuUQyP
         FFjzo2isrAvw7FUBRoQOtXi/OHkbgM7GnN8C43nv7KEjCba7zPukJqJGg8H9oc7Het4D
         fnpvotZ3o4cC07rT1IFf4/cBNawrXM2jh5SknA9q30CRyC1G/BtclwfzmH8hezNX9nVN
         BA3tkqqzfAocZslwrBg/xVu5DsKzpU9UJzoXv54F6WD39i1frwbLzOw2rhY1BtfYEL4O
         SMJ4v7UjBP4rVYMj5z5ZA073fN20D1rXTqjQHkm858MOefxSPa9c/sWaYG6exJlpcN/D
         COKg==
X-Forwarded-Encrypted: i=1; AJvYcCUHCZBsMXHDYg2Ug5teVt3huLSHUP5LBI+y9iBuAMzsXLLv0pC/SXBM30EP+CixrPgdXlHcTaohcgWhs5HZjybi@lists.infradead.org
X-Gm-Message-State: AOJu0YxzoRcnilae7DlUky66jVsP0+vEX+k01hSoW2BNMIZvhoaE78IO
	5aFcuhYMIoCB7KrDmZ3eoSizjDzitpKPZRSTXRdfA10jUjOMGr+4uRQSY8hVsevKt/U=
X-Gm-Gg: ASbGncsDypQZ9TcqOq0jhjuH/SPt7UBkZeeh7JkB+t931aXdJyqF8wePLo+f6T/xZ6G
	Fl+aO0sjJ/1EG5nRu8ShhPAnmrjL0lvkFBSiCmyCrArPL2/IkMh8nBIIU+ApCo+ZFrqWSzcU4Em
	AHaWMcIDTcgwQ8pr60SUh+W7aao3IdGFKtuN94XV02d2WE1IgMkHVALzmuqH2GGRZsCmzLOKywr
	BJnD4C9Z5Msq1dhm9iXENrJtBf85A80lk+T7R9qsdz6JR+GbNGUUbC6z1+B2xIeWHT7Ag+qB3LE
	fWFQBGKuBqCxEJ5BU/LOEblS1nOIpIN6SkTrLgv2TuP6W52S5OryRhaMKdq5cZTR
X-Google-Smtp-Source: AGHT+IE0aYFuuB17fOVm7tTLCtf+dmCjdxDuykMapL/v/tu9OvfMxXQZ2W+1BibdIhnsoHzg8jgH7g==
X-Received: by 2002:a05:600c:3b15:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-454a36e59e5mr27310635e9.11.1751464192987;
        Wed, 02 Jul 2025 06:49:52 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4538234be76sm229611545e9.15.2025.07.02.06.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 06:49:52 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/3] clk: amlogic: drop clk_regmap tables
Date: Wed,  2 Jul 2025 15:49:47 +0200
Message-ID: <175146414026.853943.10828213278410339328.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
References: <20250623-amlogic-clk-drop-clk-regmap-tables-v4-0-ff04918211cc@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_064955_122962_46C1D5A3 
X-CRM114-Status: UNSURE (   7.97  )
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

Applied to clk-meson (clk-meson-next), thanks!

[1/3] clk: amlogic: get regmap with clk_regmap_init
      https://github.com/BayLibre/clk-meson/commit/21ed19d11863
[2/3] clk: amlogic: drop clk_regmap tables
      https://github.com/BayLibre/clk-meson/commit/4cb53fff9db2
[3/3] clk: amlogic: s4: remove unused data
      https://github.com/BayLibre/clk-meson/commit/8a65268500b0

Best regards,
--
Jerome

