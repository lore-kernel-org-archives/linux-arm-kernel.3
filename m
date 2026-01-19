Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFD5D29C2D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 14:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A9wy6pWTQHz0Jofienvs4z9SFdR5Uupu87H1XvII/8A=; b=oLfseTyl5q1Mm0sMW+1WcYI2KQ
	TkUyTIzOrTPvT3LobaHSAJrQ/ktx9I9dQ7vMSGiszCdDoay/RaQ3jvaebztIkq+n0zf5x/av0d0VG
	CCOVrJ+/hyRLU+oocgsihrgWVQkppwotRFL10mOyswAeZ24RyauiaZH4RQER4NHYxSRbBxHn9tJyE
	qSJfkg8SpPTvQUcCBuc6UmVdKIUVu0vERKCmGWu4wmtoA8Lf4FJ7l1XzyF4jYv6AXzgNovMwu8PnK
	NqIJpLJssDZALDfVh+JoOBVg5s5szkWlYxjUbFob68uHzZIFF6+9Uz51fMwOOqj5oWrhZWU99Rw8z
	e/F6P3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqI9-00000002GTe-0oR9;
	Mon, 19 Jan 2026 14:31:45 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqI2-00000002GRC-0pjT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 14:31:35 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-59b6f59c4f5so5210549e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 06:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768833087; x=1769437887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A9wy6pWTQHz0Jofienvs4z9SFdR5Uupu87H1XvII/8A=;
        b=AH06T5JRHT4xxKpt9jA84G3gnI3X41xDV2J11RoRzpbng4J+A0wscUpPzM/FMTfn0O
         zPoJgpowLd0AgwIA+mTb8TXdoXlMkG2EuSaAKeuJrrIINwq1/S4Sub/I8CiWHE+ws5rT
         KvnpwqzgI6LOKzUMwZaQm5KUt5DBuNZ3zxUdJMobfhWvnELlULwUDzn/2d4xTQDBLg/y
         EroowPTF6arUubrf71B/vpP4gnK+kLx7EQWaJRlZL//RqpV38GMe0xy2i7GFHhjKyPBa
         TfyFHd0vFP+ty0IjK4718HvfAD/Z82y+okd5mxFXFB9SV4joQVPvJ6XlUy0LyIoVcS38
         4/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768833087; x=1769437887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9wy6pWTQHz0Jofienvs4z9SFdR5Uupu87H1XvII/8A=;
        b=BmrD4r2s4u5oRsm8iliUP9lWUQz7sZuzZk/DpiNXpiI7Thw4U3v9axeS47yviykIoI
         HTxY08kXnqaYKSODlXCDwr7vrQ5I9DrZSkk6SdQE8AM29NZWOB2pIlK/9APR6zVM4PO9
         gQn4/Mc+0Paq7ss/e0GAPdLmMr0xWrIVN1pL93uc22twz+lu0gRGb30zpe/4mexlUtjy
         nE46QLNQQbnizEIl6BQFdAlBSxdNTokdDlfeEGPQKl1mA4lpQfamxggFoD2kROLoPkCr
         yiiq6BWsRs1QguXA0463MAAZwqcU41c2P+OjsJRV5jnxYfnQjIs00/Zfez55zevn2hKA
         SB8w==
X-Forwarded-Encrypted: i=1; AJvYcCUF9DqlE8eQjVTKrKgnOUNay93/EYkE4Tan4f/skf0dGHcBs8MPxvBhPQvUQafY6gw5w4iWbLj+58Mg068e3j79@lists.infradead.org
X-Gm-Message-State: AOJu0YyO6pB01CsGbzTX/SYXr0D8ES/RKl89lM70/RHoBAuri4maFaek
	KC8jQL7YcH+QnZuZotqif2uWZWhFfGYbm6XxNzwCDuxM8H/YSRyiD1YAvFog/xrbzac=
X-Gm-Gg: AY/fxX4AKgFbDNFG1yjEa5z2C1gKWVveuIHKnwZmo2oJd4adFDBScaoiIO+p5xxkNKh
	hrJnY/L2Moqx+/9z85/eEQlafB6ODnXZgdUwFmPXGMGwHUe2nvRd4NCvj5hotjOCGUTOgm0dZCq
	Of5n85hKi5ISFfyeXsqqsuc8YRMv89cRw4W5QU1rtb/eBFrm9MacDzfJn47wfrnuIYj64smmbOM
	aCS36XnhmkZISegOU7XAWR+w4J5VA4Cuwq9oNBybxvP/Tg/nsXckp7C68rqSIfKrfwVJBNZST0U
	pxwZ/Dbp8W9xt1oZVlsQ8FZw7xqRRpEUrWZc4/XOZ7iYTtRpzwUkcfBO2CWXJ33TgkuQfX9pAwt
	qwchHMVOv5AVdjgcXvNqlK1LJcvtOX3DpR6xI92FlL1s/2cT136W3VGvnNaFmS1Dl+rByC5pyPK
	kH4N6drsTvpsHCxtvhs5Hjmhyb/cnWyrsAP40NILrngthITzStEdUWlk5qFiza
X-Received: by 2002:a05:6512:60f:20b0:59b:b2ee:d40c with SMTP id 2adb3069b0e04-59bb2eedac8mr2351534e87.9.1768833086912;
        Mon, 19 Jan 2026 06:31:26 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf33e7fcsm3407211e87.20.2026.01.19.06.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 06:31:26 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Dhruva Gole <d-gole@ti.com>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] pmdomain: core: Extend domain idle states debugfs support
Date: Mon, 19 Jan 2026 15:31:12 +0100
Message-ID: <20260119143121.161583-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_063134_263910_9B5495F1 
X-CRM114-Status: UNSURE (   7.70  )
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

This small series moves around and extends the information that genpd shows for
the domain idle states in debugs.

Please help review and test!

Kind regards
Ulf Hansson

Ulf Hansson (3):
  pmdomain: core: Restructure domain idle states data for genpd in
    debugfs
  pmdomain: core: Show latency/residency for domain idle states in
    debugfs
  pmdomain: core: Extend statistics for domain idle states with s2idle
    data

 drivers/pmdomain/core.c   | 59 +++++++++++++++++++++++++++++++++------
 include/linux/pm_domain.h |  1 +
 2 files changed, 51 insertions(+), 9 deletions(-)

-- 
2.43.0


