Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397DBCA9EC0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 10:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElWk8fKGydcvVdEATDJFrXGRGjE67AASQOUO8YEQCOc=; b=K3DYh09BmhHId7xxjAPV2mqVcx
	x4xE0YiSP8fO7IiM8G3VCZ4ZIhPrIyZYLUagsWsKUCBjkU0mn/eySE2eBskaEuYrzAwLVcjTg4WDr
	0Xbelwaa+YnArUaw8jTG+HmZ7c+gWlp7Y+Aam55q08LEjAgRYBpPcCm/G3b0r6F/cxM5GLND6tw75
	rD7W8Fm4c4eDWmRUFPJnzVVQ+uAW61CxZa8AF3+Fa4nqh8WQOLgV7rkcFhiKzz8AEJgpqX+VnXetW
	j4FHjWguNBa6i9p8HIn8E2Wdsz7jBDqTkFtnn28gdRB2QEcJZS1yrYAWFgbC3HJnPmGA47BUtQ4Ft
	yfSNc8lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTyr-00000007ox3-3gug;
	Sat, 10 Oct 2026 10:07:05 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTyn-00000007ouu-1oB7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 10:07:04 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso273788f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 03:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791626818; x=1792231618; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ElWk8fKGydcvVdEATDJFrXGRGjE67AASQOUO8YEQCOc=;
        b=fGoylwPrjG7NS2WCJiM8kJEHodZm/d5uVBitoCY9gfru9WHh4I2tjE9LnzCmDZZcXQ
         0qiwi51yDRw9lbvpgpKJrojCRLzLCckDED4/TlpN8yrynEYa8lPF+Txs/h2+ZgtYAxo1
         uDrrwt8mzicKr5XBudj2qOPvm2dVoI/BCMcXMsq/67RP1AFNF7DBUFpHdUxf5O/m4fKw
         vvRrZUypI2mE7T0R+SIMXGwdVv3rAzQt4qF3RY+8yShzMwpG6V75yQbVI3rkiCBlQOe9
         yKcxhGUmC02GAA/IBonTjZ3Oo2HzHQ+rNXuXnFA4+W+dPHteb90bzOyO01N4kUYp/Ly6
         JMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791626818; x=1792231618;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ElWk8fKGydcvVdEATDJFrXGRGjE67AASQOUO8YEQCOc=;
        b=Sqx2zkC69qShkpUkPx/agBATViB1Jq9E/U7IoB4y2OTsSQXllhXuFv3SwefSIH2Tlc
         ijq4z6I6kRpNcARWNUF+T76qCRW7ZFcG5oGbMHFaGTd+2Y0UyVTgzLmyJovBt0QlgvgL
         lsxlCj/YZ9rGdxZwuQ7B8eeiCQcane/TPjglMx1YhRbIx/CcMsAa7ypsla+eaU/NOA5W
         hCRX+5JLIqa+pfzmbs4nPIEdMRDWtzO44x8YF5G2haBZ9NVCePAUq/qkUfaelIMmdstG
         Gubz93xlUqXZXnuD4KnxT3CXy/9hLBnTQvLsaUJhYWFVkptSfdcqfImnwWhBpZIlJCpo
         rtvA==
X-Forwarded-Encrypted: i=1; AKwUvBw4UcHQUI8kFrbLLJDOnwMDMrvf/HGThlY68qO1cUDWuli8d/C/v9BeDXKGVdjewG/A5axnNYhhE/Sqh5vZSVH5@lists.infradead.org
X-Gm-Message-State: AFq9FYLhFyA22oCZQd8R75GEMN4LUVVf9uaZrWdvVgPYJIuj6+wll/av
	rehe5sJVMXt+pP3fQi/kKvpl5yU8Mov8esPxjLRWjBUuRF1IN7RqDhbCz3MSn1kB2o8=
X-Gm-Gg: AYBFou2DobHXnQ6ABSZrX3u1y7Xpu5LPAL7SK6lNDQF1qrQFnTYL+g9pcyGeLGKgKLd
	Mhtcmvndqjfr6wiPEDasJgCmKY0NYC0a8OvxTvxE3AKTWXmI1jeB6VGeig08oCg07EBlvf2S+A7
	+wGcyBFhFr3yDgqvzyoGu+ooSDrWKEuzU72xfhMntbKPbFF+fPEFUGFZD6XGKQpCNo4WV0ynfG8
	iGRXZBixOl6A09swTLBm57iQ7yBu2lGVMUuhPzejpN6QjZwkvD4eknsnkI9V5i0cZdddciRgwBV
	53aj8N0b4pKlif0RPIiUcHRszuo3cXjKA7eaPVJMwodPhSNZO0rGK+6J9fyCTPGQWDq5Mqvf9BX
	GAJe2Tw2U6n91LBmwsi+9BfuO/MpWmWtlPQg92bYmxCt3m1gLBQBqy/FUmcxzKC/ic4L4MJkZfG
	CnSguW8KfhFjP4gSpD7a7aP628dtq5WH/HEVfpXFqIFRZ7oyoxhl2BruuVi00ntcShBm1DYeg6p
	RWJZq/d8WltBH5cDA==
X-Received: by 2002:adf:f2cf:0:b0:48a:fe3b:64b7 with SMTP id ffacd0b85a97d-48dbacf6ef6mr5914261f8f.53.1791626817764;
        Sat, 10 Oct 2026 03:06:57 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac6a91sm7389151f8f.41.2026.10.10.03.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 03:06:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lucas Tanure <tanure@linux.com>
Cc: Brian Masney <bmasney+clk@redhat.com>, 
 Chuan Liu <chuan.liu@amlogic.com>, Jian Hu <jian.hu@amlogic.com>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
Subject: Re: (subset) [PATCH v2 0/4] amlogic: t7: give the MMC bus pipeline
 clock real consumers
Message-Id: <179162681558.457042.13976808955805070898.b4-ty@b4>
Date: Sat, 10 Oct 2026 12:06:55 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_030702_774026_58C8D402 
X-CRM114-Status: UNSURE (   5.47  )
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

Applied to git@github.com:BayLibre/clk-meson.git (clk-meson-next), thanks!

[4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
      commit: 363f97a1ce635b86be7fd263d56a040fbd87bdbb

Best regards,
--
Jerome


