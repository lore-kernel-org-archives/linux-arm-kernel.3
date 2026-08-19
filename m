Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF36AC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 21:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BxA7XcUttIdzHWbOyyyGM4mWiq1VkGr6i1wmE/8c1I=; b=cEMkKCMbh3ET10wxZOQn8554qt
	u9wR0PRYQ+qgHa3iSthu5mw/4208HmKZvv664emaEq68AvXHU7jmsDW3aNWG/WjlpGmvuAHluHgXr
	fgzuEECK8LDnH1YV0OUUCmCDHMJ6qOG6Kqd7iswXLnJzHLnedgmvhNmFiE5Kmy5E6FYyXM3f63kr8
	ts3pBQqpLzDDndLM/D7USw6n0YVzdjpEBZuyFd64Hg1O9ORoCD5TrOU36UQxABCrCMVIYrNK8oA1p
	KD33z6tXmC3dw8ukqkHl5KBPugMu9WEfA7E1gQoSkDSEb6C6DH628fo5xc+qUeCM+4DDtl08ScbbV
	iIGthfpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnk0-0000000AYgG-0Ca3;
	Wed, 19 Aug 2026 21:22:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnjx-0000000AYeu-0wVD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 21:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/BxA7XcUttIdzHWbOyyyGM4mWiq1VkGr6i1wmE/8c1I=;
	b=crPmYIgzSTlR8YXiekuPdGLHcp3c7bFY97cGQvep9gLvaNO+SfGI8gTq7f7f7J3cXwGr/d
	x7U2qfXHuvI4Sx010/7Bk4LE6qrGxCUPRwn8/gu2NvpLklu/mmKTTCuQImJAv2c2uW8d0v
	h3TVECgUwW2JW6aBgINrv3xm6HY2XRA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-X0TVqmSsNxSzlc5m3jlIAg-1; Wed, 19 Aug 2026 17:22:21 -0400
X-MC-Unique: X0TVqmSsNxSzlc5m3jlIAg-1
X-Mimecast-MFC-AGG-ID: X0TVqmSsNxSzlc5m3jlIAg_1787174540
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d28f8737eso24153371cf.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 14:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174540; x=1787779340;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BxA7XcUttIdzHWbOyyyGM4mWiq1VkGr6i1wmE/8c1I=;
        b=fyFjxYQfLStbCDf5qtBY2An0Go1wI0q5jj91prxwaAo/rSSq0S1GBowKuh1H0zQmy9
         96lLH5lnpjpiwpP/sW6KIEyszQlBwTVkvavLkGOCidK+x4IbsY/yxPLUO3s3TQa2Dgc3
         2RRY2UlxlY7m2B+yHluzP8MJ3LKzsmFnrCmBUJbegvM4A0YX1ztAqq94OWpB+IyJA9v5
         1bbdk2ICPAuVi98CVPaRoIFbTCxRLrdda2qT5irdI6X/fwwFD7+jth5kCI7phWleMvHM
         KcbhGoashkbtzwmsX6f1MABouCQUSTHwyim3rK2j1SIsMYxhaQ91YFfnaySz0WLHPAiL
         OtnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqyQktBr/k5aRi5LyBcVypD6VgnlFyK5e/PH5w/EjAkRGrxgU15iH1I6lCeLh16Rl1/7sNeaob6h9FLGSz3QEDq@lists.infradead.org
X-Gm-Message-State: AOJu0Yzlbt6KOxKPP+WRuJgZt92Icy7A5tb5gDOVO8mktTzEGhZfmarQ
	qb1IsRrd+i4w/vR/0Y1HznPLSpCzWC7FSXZ45iRU1xpk79ti141Jj5nW2g6HOkslX4ENZ0nc+Y0
	0+i7FRr1Ej8uRgpWCyTJGpkDw5eo01tLiuX8JK7OqKyLrp1/lehfTQZSLbiiEFlkzFjsJiFhNc3
	+W
X-Gm-Gg: AR+sD12V0AwLbH2RYO/z2pjlbEnZGWW+yiTn6eaU8/KdkhjHKFAlejTlQ99dUVmAjRF
	Zi02cPjkwRw6fhLjz4BcfNKxESLvV+iitXG9flWn2XtnYDQ3JIvL1tVKOOCcqyOlGO72NhNEh/V
	RE1S2snekcRJJ+Fe5TU6Pl8RPoqOxRlD5Wp1ILfH/XAJcHwi3NULsM/cTjXvU1Ry8AQyeCv18vY
	HvSMcOgLFoxwgaDLqS3EnEhlAqnRtGNKAP0AZ3iHQwsB/5WqEfzeMuKhfVBAs+ABtxX0b2Rem8j
	+86PP8lZ7ngIWV5ceu64iTgou+fgkdEhKcHKF0sz2UEWaDMLJpPgDAAS9Jnoe4Wln7Af/KweDC2
	qNwDFl+ppKWfL/dNL7i7wKV/wtRMNwTVyl20=
X-Received: by 2002:ac8:5d04:0:b0:516:e249:e30f with SMTP id d75a77b69052e-52dd5e05a70mr71524991cf.42.1787174540397;
        Wed, 19 Aug 2026 14:22:20 -0700 (PDT)
X-Received: by 2002:ac8:5d04:0:b0:516:e249:e30f with SMTP id d75a77b69052e-52dd5e05a70mr71524431cf.42.1787174539914;
        Wed, 19 Aug 2026 14:22:19 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52dd857b36fsm18734791cf.5.2026.08.19.14.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:22:19 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:22:17 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Nuno Sa <nuno.sa@analog.com>, Guenter Roeck <linux@roeck-us.net>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux@analog.com,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH treewide 3/5] hwmon: (ltc4282) Make sure clk_init_data is
 fully initialized
Message-ID: <aoYeifWtRNoksCoR@redhat.com>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <8ec3c5cbd2df675a938f090470f5da5f22008517.1787165329.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <8ec3c5cbd2df675a938f090470f5da5f22008517.1787165329.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cE8TZRwGPLgG7qpNui6MbyfTdN69T80rkBjkq-Xv00g_1787174540
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_142229_339045_998878D9 
X-CRM114-Status: GOOD (  16.26  )
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

On Wed, Aug 19, 2026 at 09:05:17PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> ltc428_clk_provider_setup() does not fill in any parent clocks, and
> assumes that init.num_parents is NULL.  However, the latter in
> uninitialized, and thus may cause a crash.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: cbc29538dbf7d740 ("hwmon: Add driver for LTC4282")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


