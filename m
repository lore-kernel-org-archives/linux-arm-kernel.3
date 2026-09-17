Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D79C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 06:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+K4jEI7K5jG3d7ElsjaI4ZZGrcnnZ/RJPFxiwdiWFHw=; b=G0dQmqPeCWvArjFgksivTu85fQ
	mH7wSDNw8b7SUEg7dF46EznTYZZNIHOeN050mfdUtfGnwg3vFjWXSzRj/JbN38THP7aEl59IkDzyq
	/AnNvV9V987Rs6ocySBBEElT4sEOM2M+m9dV9WgRlNGAler5FB4o15ntTpX1ZFTRTnLtC628107te
	xaCWiRemC2UTYR0LLqhPx5Z8p/PevnwKydj86jsjrkJ87D0jIHBCK0Crzy/awSLe/XcEXJLQQ26JM
	/ijp0xlb4Wu/jTlHwWTcaWKMebygHIstIRDgdhiTbgtEn01O+JohQDZuzHP+aBZtTb7zcCGxDw+iw
	jQtn18rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75PR-0000000AeKo-0ef1;
	Thu, 17 Sep 2026 06:15:49 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x75PO-0000000AeKE-17d3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 06:15:47 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso5966695e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 23:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789625744; x=1790230544; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+K4jEI7K5jG3d7ElsjaI4ZZGrcnnZ/RJPFxiwdiWFHw=;
        b=g6O7ymcKdOGGIRE5hibp0If7n2027YwrVsluvYzxZiZwE0zBeXSJpIZAzi3lRz6VMM
         HnYuJK50si/Oq38JucshaQQL/WiU7ngtlKCrdH+nXx45AI1sqrJ4gxJ4DrR2fHs6bSyV
         P+gLZ2vE331DWGacilSH7EhF4bx16qbTDWr/M2qIxRD0QMrKY0yswE4gvFKoYpzrbnxU
         MmcQUQbqd9AwNvxtI99qw35CySgZc8YoaV/let0uIiwdFmY4uVLTHzuL4oPRaKO0Jxy5
         KKi/TYL3wFulDlpvHCx2/6Xi9EWZgPbqAo0Qp/1fclvhCl/SLAUq8mNGWGZqhwTNVjdd
         xsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789625744; x=1790230544;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+K4jEI7K5jG3d7ElsjaI4ZZGrcnnZ/RJPFxiwdiWFHw=;
        b=VyZfF20D/qeMcJNSOV6sF86hZYEUvxTYtvfEyddHmR4AtULeSqYMrdeF1iVN23TxIB
         UVa2QUfwOsV4RxuoktP48oCSBEK06nldbzgxzfEGJ/kq04UFjzY1sxT7veHiaesNfrfT
         ZTttOWKOybI2drOWwa+3WwDnKp3deIlLUewYFVh7DQtszw5xo+1YmsIzzjcx+mmiZi7F
         Xlhh1I8B/E8V2XeFzC8bhi+TGmmiJTFOYw4RHpZM3pFVxrnbmQV5qKFRdVDmz82ve9BW
         cfBHr9oaElBAABAE2ZRZ60kSMOKc4xQbFT5Ri7U8vTLtE4fxZqmZ9fT1RQTn20fOgY/u
         K86g==
X-Forwarded-Encrypted: i=1; AKwUvBzQO19zYZKXErfMmV9pXHz0VXooZaHK0bVuQb28yUB17Bn1uiB7ZJRjwFRAUN/l1WDf+L/UQtw4k0jEIOUXRJKd@lists.infradead.org
X-Gm-Message-State: AFuF++kJaf+78WLSvq2NPMxyHczo5phOMAsLLFXCKvHkNDEI/PJBzMQb
	ldQJUPqL3lB6tkXduJeLurVWb3o7rMyfzPLH6h+CVbNy+WrzHMSGxaX1
X-Gm-Gg: AYBFou0GPFJBma6WKdJb943lH50smau2TJazjFcrYGAUfuWbKuIsfIbKV1WE1hfb6e3
	ie5BzLl159UaYIdfj+igWjqaG6IPA2DoRDs6i7bRMCaN3cCqTxTLBVv0FJrXoDWNAO9um67NTB1
	saDyFYf/EZCoxdfFFv4fMbiAS5OoakYXQT9hhqerpHig26LTb4BNjnv1U6p87puWuyQntziky7n
	sVzEKD+M0z2ch5EeWzNJVJIsmC69395cmfxexOdc/6XJpR3hUSEZZBBERDfMMdYqlXn8HgMF+S+
	wvKBIFhgrs3QFLwfBquyeF7dQmx2zp7G2ej4wh1wgCSSioZ5ASSR78b+Un1U7UpcBP/+1mQYN1p
	3PYgDgGARhnVaDzZwb6/odJu3L8cGFUt6PGvO2DhmDseOZyM1gF89Gq8H7oNN4LqktC9ZIJcx21
	fpQYEb4Rjf6nI7fkp6+b79eg82vteK/cTtmmZNedn0IdAiVxXuj02b9rfeIh95urOXnXBo9X8It
	Jl2OEx9PLDjeq+FXF26DGvJnZQut6C+d15INeI/C0zI3fc6JNNhT6xw30YIRZkJ5WQ/r/hLl31g
	eYjzXGWmjHdKC0GG/jvMXZFIWJt+6T8fDg4AY7xvJIZm334ZtSrekxg14Y7gDyRlKW4SV+AqL8R
	J
X-Received: by 2002:a05:600c:6296:b0:49e:602a:b4ec with SMTP id 5b1f17b1804b1-49eb730e225mr109105555e9.8.1789625743878;
        Wed, 16 Sep 2026 23:15:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9dc6-c001-54ee-4741-4927-0a28.310.pool.telefonica.de. [2a02:3100:9dc6:c001:54ee:4741:4927:a28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd23f4e6sm55558105e9.8.2026.09.16.23.15.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Sep 2026 23:15:43 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Joel Stanley <joel@jms.id.au>,
	Brian Masney <bmasney+clk@redhat.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-clk@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jerome Brunet <jbrunet+clk@baylibre.com>
Subject: Re: [PATCH] clk: aspeed: ast2700: select AUXILIARY_BUS
Date: Thu, 17 Sep 2026 08:15:39 +0200
Message-Id: <20260917061539.51943-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260712160301.98941-1-kmehltretter@gmail.com>
References: <20260712160301.98941-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_231546_317581_AC06F2F4 
X-CRM114-Status: UNSURE (   8.60  )
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

On Sun, 12 Jul 2026 18:03:01 +0200, I wrote:
> Select AUXILIARY_BUS directly, as other clock drivers that create
> auxiliary devices do, so it builds regardless of the reset driver.

Friendly ping on this patch. It already has two Reviewed-by tags.

Adding the new clk co-maintainer addresses to Cc. Is anything else
needed from my side before this can be picked up?

Thanks,
Karl

