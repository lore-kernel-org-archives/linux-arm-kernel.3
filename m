Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84EDE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 12:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qAr5MJyxW4tliQqtSvIibq4rtO0kf94wwATw2mUtoLU=; b=QZu7BlWV0B6YWfaRmb459o/9SI
	T5uKRfJM33eAaXPItUGE6PjN9EOJxxL6+R/1w0JtsP7VhVYlc0mNzbV2OaDu7TaocPRLvfozkxMyZ
	Aimgav5RusSN2MgpDxbW/LTICFo9OemTjqgmQY6mDs++OcP92wFZIMLOR6yd/wwMI/Iwze5Q6FD1j
	Il/jkkb6/jQr553rLwyE4+DjoTqTCMS788vku/sFzdxxX9/pcLY4sHtEzUobL3Ipc/OSYjr8MhBh5
	G1Ta1MCqSgD4kXk5wqK33osd4j9tK0x2phjcPuj8vSmiiDCj6zQb/oIuCo+UZHzIhIi+g1RFo5AiR
	qPEjOaNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR9l1-00000000CJp-1MmJ;
	Fri, 27 Dec 2024 12:47:59 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR9jo-00000000C94-3V4U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 12:46:45 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-386329da1d9so3254984f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 04:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735303603; x=1735908403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qAr5MJyxW4tliQqtSvIibq4rtO0kf94wwATw2mUtoLU=;
        b=JPBHqXRD470/UpYoROGXjXUV6+wWYdXcYUkcSNfHQ6+O6W4yZOyoEEIlT636JqbGQT
         UO5iP0ss0hOeyysGdiiXMeJcIHkL6ZGVTzgcId5q7BXLVz4Qwg393WU6jykGGi7obtN2
         O0U7uLAmb7lpQ48tfrrz9GB+RHlH/N+Nc65rlQ5uirURlg7HpckMY/8RU2TCTUJ1akMV
         817MXipOIpoqoYVukGzwyCdvqUZK49MKKoTn0h6r8WYSqYB60tjHBAwctVTRP66+vmTH
         QOQ2o7SWluDDqunuR6OPb4HAzIdXYVlRjBP3gPaXL+NAMVxn9qzv9KB9yAo3uuup9G4o
         Hbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735303603; x=1735908403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qAr5MJyxW4tliQqtSvIibq4rtO0kf94wwATw2mUtoLU=;
        b=UI/vKG90cNHmUOSTb1WQb4YkKxYcA3bKdZKEkvnlXwCspIWfpeCm9nDJsAQsKglPjF
         UXafLcOmQEi5VSi/oXWluayniV+QQeHVRYQVOvMDcI7TMAm3Ts0F//pZPj+es/7ueDkV
         CMMVbO/Rk2w9iunwb90uaJ1g6qCe+95597iG9MJTF9/ziFLXdz/+6kDlWqKwoD07sD73
         I/yypG9bvutZ2bBZVQAXIHlYa0rTK8RblO+HAKexQ6rEcZl/jU0wPacnFxpOKCfbf+F+
         Ju56THdwhXzRmxEUI5wzctaLaf1hCE39dnRJY1jKUaQ7FagygvsHKCYRIPatcpzF4o34
         jLWw==
X-Forwarded-Encrypted: i=1; AJvYcCXAMqDpQcHZj4cvfZIXEbpX2pwAUSwYVMgOkACmp9ehtP/qSMX2qR9pj1EaSb/yiG9mYqMFezOSmHRDTvO2de9L@lists.infradead.org
X-Gm-Message-State: AOJu0YzV4r0qaT7Awu2TIOhblWN+QZm+U2ZrLc11yfBrn0sc+NmVaS8T
	YbEPebpymykMK9ef9rG8Y5vg7wavtJQganLTcL/AQxWA0FqUeXtpedmmUkJHx48=
X-Gm-Gg: ASbGncs7uFIV1bF3bzeLoZhwEozY658TEndcehtNalh4DMsrdjCthLK0aI/118CH6S9
	5RSJp0iY06g+V1wAX0lXMR/JT5y46yPbGj04ul37Ps9fqvgum6ifuPIA9+OnF7N6n6+304TDa2s
	0HhRR8iqbHWt7c9BiBEkjuGwI+xXoL/pag4oKhSNtEyz1/VOIOx1WhlIdYbykLY8Ps0Yf0aOnyc
	gxg49HSL2f9SPqzeqHfkhsz1YhCIEKRALZY63E6YxDR1RNlRg+m59OA
X-Google-Smtp-Source: AGHT+IFOSyN6MsRY52PNGIySqb8jJ3jiAJ8ipn+mH7OpC8pga8Vo0BdkKK7utvCX05gXYmLza6GGZg==
X-Received: by 2002:a5d:584d:0:b0:385:e0d6:fb73 with SMTP id ffacd0b85a97d-38a221fa9cdmr21953130f8f.15.1735303603117;
        Fri, 27 Dec 2024 04:46:43 -0800 (PST)
Received: from hackbox.lan ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11495sm297172905e9.19.2024.12.27.04.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 04:46:42 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: linux-clk@vger.kernel.org,
	Marek Vasut <marex@denx.de>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: imx8mp: Fix clkout1/2 support
Date: Fri, 27 Dec 2024 14:45:59 +0200
Message-Id: <173530350106.4140483.17403614068290152779.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112013718.333771-1-marex@denx.de>
References: <20241112013718.333771-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_044644_880454_B717DBF5 
X-CRM114-Status: GOOD (  10.61  )
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


On Tue, 12 Nov 2024 02:36:54 +0100, Marek Vasut wrote:
> The CLKOUTn may be fed from PLL1/2/3, but the PLL1/2/3 has to be enabled
> first by setting PLL_CLKE bit 11 in CCM_ANALOG_SYS_PLLn_GEN_CTRL register.
> The CCM_ANALOG_SYS_PLLn_GEN_CTRL bit 11 is modeled by plln_out clock. Fix
> the clock tree and place the clkout1/2 under plln_sel instead of plain plln
> to let the clock subsystem correctly control the bit 11 and enable the PLL
> in case the CLKOUTn is supplied by PLL1/2/3.
> 
> [...]

Applied, thanks!

[1/1] clk: imx8mp: Fix clkout1/2 support
      commit: a9b7c84d22fb1687d63ca2a386773015cf59436b

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

