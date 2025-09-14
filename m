Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4EDCAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 12:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6/x/F9H1jnt9+oD8dGb+mTu5SQ8wNiEgVuCPP1souw=; b=1kE9W6RNkRdn8KiH68CKXl9lGn
	Z564mD/qyxOAFUrEj/gl9DLkqWNIbv0mKCDEj9mbbBtWzFMUPeyA9pUp9yaUnwmwSkLN6tD5PzKaC
	U6LjnCk6q7YOieDy3NQ2LExZxexKEgVAS7rZD4mEThKVNbU36lOJwR45yMqo24LA+Cwd+ikNEHiby
	vNc75njw3k26JYagv5UYzOPR6C+O/g0WpMvftPeSuBG8oMEz7qOZwN4mvfegHRgEujhGh1I5A3xeU
	mV564qIodHWzfRev/vcek7HXvgaeUE4nC9H+v7x4NS4wryMQZdGlkYmV7BFePsqj1QqTIYQ6EEh0Q
	tZhaIdkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlTX-000000013wG-3LEb;
	Sun, 14 Sep 2025 12:04:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlTV-000000013vX-1kFM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 12:04:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757851496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x6/x/F9H1jnt9+oD8dGb+mTu5SQ8wNiEgVuCPP1souw=;
	b=HmW7IKijo9YBtew6ZyocKIXibVimANFTyoqu9R7DcAalTq3dLYAMDgHKIkrq+X3LbRpN0h
	u0YWzuDOwUaE4s93NYAnPa00ac+pP4aYBnKIUA5OBukvKHCpUusZDkT4XYHVINkpF9unc3
	QLNP1rCjzDx/0G1c+eyY7i6bgDC4KLk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-60-IRHJU-TjNyOOzvMgAawDNg-1; Sun, 14 Sep 2025 08:04:55 -0400
X-MC-Unique: IRHJU-TjNyOOzvMgAawDNg-1
X-Mimecast-MFC-AGG-ID: IRHJU-TjNyOOzvMgAawDNg_1757851495
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-7721c5d874bso24263816d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 05:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757851495; x=1758456295;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6/x/F9H1jnt9+oD8dGb+mTu5SQ8wNiEgVuCPP1souw=;
        b=vYphEDQzYTVAGRAquz6J62dJUWDxnlO1bXeV8Btp7l2B2ZfnuyGZe8EfJtNy9DBXPz
         qzWNgh3vlxsKyto2FTYTZu8ltT5wJJmhsKtL01A9gnlXeCE8LRyBznNJw/ZOB79rNRCF
         iEllxRWVfJ7PCbiumut1d2oZSDhjjmWfYVJZDcifbINmF2+RF+wtmrA5IIrLY+fFJDXZ
         SPlFxiyl/XxF49FivpX6pdVKwBs3QpqUSGYfKRoqrTqsr5bF9mpurS0lH2CW31vtDqPD
         Y72CLeYL83mg6JwfotTvlcHilj+A8IE7moLfKreQlFQGictoBcK1tL6Oow+GBwY9tz6H
         ZbOg==
X-Forwarded-Encrypted: i=1; AJvYcCV5Ln9/4A91AvDdo5cLpFqVcD6UZy+sAHQpAZy0brzmcJVNuP9owfK0iD4JaC+xinGTracF8dqq37I1e/z9zAGH@lists.infradead.org
X-Gm-Message-State: AOJu0YyKWMv6mrgduRWFddp9xt1bJqfPhTfgCwv+k7LJv6tkBAiopjpU
	vMEF/HiCS8aDBgj3qIZyqgpsw4ewy6Gp566M4V0R7EYr12XWaTQJBWSnd8kJKPnxRrPRd4KyUjz
	szqepu9wWEBGPrGG8xmgf2v8pYaE/nGVYFkQu2DQKL01Z5qoedn6qCrVwv8T3l9vuJJdYhhdoGK
	80
X-Gm-Gg: ASbGncs08ciCeyfcQHeyd58urxnbYo4qldfPB9D+eF1kDXdPfDr1cjV64piOtfxSPMu
	hWGhIyhQpFTdh6AwqSsFjtlBZZDb7Rl4ftOSRXP1H19Monqwz5zK6vTsxz7w3FAAQdtWFqkSjYV
	q1zehss2ZU3DUgFNjRqv6L7H8LiUzXsu8EhMZHTmw1NgQMPx6YYbBY/DAzhB3V+7SWEIS47W001
	5Ar9XV3pWlGbb+f1tyD1nlcSbhI/4IZOZL7bQmG/kaCBU2zoSe7biqeNnd2SF0Ox6TAN5YnB5Xk
	uXiP0JB4Fhk18OnLQI7DDteLQFHuolNndI+NOEFoNMfj1Hc6O9gRvdDpCk4t5ciJYvzm8gm20Zx
	6ZChxVMPaV0W/p34Qv2IfBkmqhVlJIUQ=
X-Received: by 2002:a05:6214:a54:b0:77b:dd92:d8d3 with SMTP id 6a1803df08f44-77bdd92dc85mr17330236d6.7.1757851494631;
        Sun, 14 Sep 2025 05:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECmPphlLafTRPXos3E/qMQLqgcw4g6SL9e96QNHBNQO+FV4Ve60CSx7PadzySEh8hyBowFVw==
X-Received: by 2002:a05:6214:a54:b0:77b:dd92:d8d3 with SMTP id 6a1803df08f44-77bdd92dc85mr17330016d6.7.1757851494267;
        Sun, 14 Sep 2025 05:04:54 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-778d99113d1sm16067766d6.68.2025.09.14.05.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:04:53 -0700 (PDT)
Date: Sun, 14 Sep 2025 08:04:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ARM: convert from clk round_rate() to
 determine_rate()
Message-ID: <aMavYz5z_CXMh8MD@redhat.com>
References: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: COP1MuC3Yd2AST0azlIkde7x1MoS53F0i-nav8r6NTk_1757851495
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_050457_526336_91D813CC 
X-CRM114-Status: GOOD (  14.09  )
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

Hi all,

On Thu, Jul 10, 2025 at 07:42:15PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the arm32 subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.

Would it be possible to get this picked up for v6.18? I'd like to remove
this API from drivers/clk in v6.19.

Thanks,

Brian


