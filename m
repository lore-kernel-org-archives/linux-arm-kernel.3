Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CACBC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcnhHIb6eNEwdjxZYrigpF4SQxNgYqLi3t6s+DqhmIc=; b=itmQhJss/8QeuDmS1X0iFicg4W
	5UGx+APTjoor66XdMC4qIJMUi+PFaiGJVb9idu+gdEh0V6hNyCPGRaCrKcCV6lzwWJKOmxbV6MaLb
	hHeDITnzy9KzF6F8gzT/qN0hnTh2J0wIOr/y6hI33s4EnsBbYmYGtvTiOt5xdcpxNHxA/w+qTpxjD
	3fvY4M8OnNN7bGzH3r27/jawGgemSsDAruFf8kFnCIgv+51nxQ7JLfDyS4x6V5x/Ch7Z1QqOwnolm
	VFnEKkV/sLoMNGP1sBzBcpzDlpj1ADLlWCad++9ajv5gxA0gbZKuPD7pKJ9O/+PiT3TzKcEpvukBA
	Nc5qPlcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloFD-0000000AiXx-3nK5;
	Tue, 12 Aug 2025 12:36:47 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkLq-0000000AEhs-1791
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:27:24 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-459d62184c9so30571425e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987241; x=1755592041; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcnhHIb6eNEwdjxZYrigpF4SQxNgYqLi3t6s+DqhmIc=;
        b=QpMibtELazcFyZylMf9dNnVr2gElN4x+eBoMcC7/Fe4hDmTJyZNUrGrvLwuCKrdevL
         iJBWozKusbev6wDRveVusUH0/cyC+OmV93KjdN2Yiy0YqmB+DuJPNqoNjPLokVkE3gdb
         KkxGWFOy7Hn53yC6/ARHh2Z/37UVFKEDbV0j041y8YkkzjMpcewPpjcC/DUhZoKXGWa9
         hoaIOyMywmsEkMV6ct4wy9lid2xuEkTcH4cQNJT3UIOByW+tl0Rg4jaJ1C2TBGyCwf+u
         KMxDKE0UfLEG06qyOa5b5y+ss4QiWBg0qdDXHEbNVcHtAa5rCcLT1+wqM5J+FPwNjcFK
         aCqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987241; x=1755592041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcnhHIb6eNEwdjxZYrigpF4SQxNgYqLi3t6s+DqhmIc=;
        b=H8xMzCSXWAKSnoeUsDc1hWBJEQBl1riD2JJ7jNjeiPXB4lcFrK0h6KlTUsutfZjcjg
         eb3ic/gkAjux4v9FXf5r3kPGhAjGSf9ZBhSciUx9vBsQM3mQP01S/FCpq3Ui+bSfiViD
         teaYmh/lNTYUbHvztL91vMvWUnv3H+j3ZS2wiKc5kY5zFHH1sgYlGhJSrRfW3A9sAITL
         bOKsyvUp3/nnh2Cu6i3NTySkZeQSwep4YFhGKeUdq35tUU6M4IfgveQCKu3C/Fbb1dlr
         qTk9vE2URyLaEaCLx8U8O3yns4PPhn2sd0frKgOhaf3v2Cd62sgJw0ls/aZUCxQrZ8Ul
         MI1A==
X-Forwarded-Encrypted: i=1; AJvYcCUrWjYRrOjLLojzGN6U+WYC5hOXqs/+cxiV4obnRxe+WTBVLQLLjgQ75bwNmYPZ2J6mhnMMPrqFynbp5GA/eY7T@lists.infradead.org
X-Gm-Message-State: AOJu0YwhU/tdkbsVbTNbquWcPKsjSaozFCcrIZNM1rDmexH6NALHhP5e
	iuKzvAAdRSg0Eq56XFd1I/IK5v7ZW25TLHWJTJXsO2Vq10d6aNDhYxGb/EsVDzpnkrU=
X-Gm-Gg: ASbGncsXzP881JD/J/CfVQmtcoF98RgfPvl8UvAWxxazj5TLAhuT9kPwSu+6N07kRqR
	FX2i0h74ObObpoRfmA0BFc84v0sMbSGIvSdAg5QaHupEFjpIm+cXgRIJjHk1thyLfeT2YncPBLt
	qMGZa1/dt322vE3HRtOr50nCsuIacQCePZ8Zs8FgOXAt+WMjzhDNqWVI0g8xqiJO/nL16mLMG5Y
	26/jh3sfSkjgQZEFtczstc2EbZQeN7k3lobHcIiZSwBlpUOka2VNijjn0eb1y/DEqhEvK18DNc4
	um0qP5c1hNQUYwKyUFwoRwmPn3RxHK8pacnreUQACbpinjG4rzq8ib5hyLuEgWQj6aXiLMonCGW
	49wGRleica46dqN4=
X-Google-Smtp-Source: AGHT+IE8fEgiEn9lwBjUv2uob+aBCzOy3kH39g3JVI8xm0JYVluln+IusGsEv24A0i5bbeOMk/kDAw==
X-Received: by 2002:a05:600c:4f91:b0:456:29da:bb25 with SMTP id 5b1f17b1804b1-45a10bf510dmr21937425e9.19.1754987240452;
        Tue, 12 Aug 2025 01:27:20 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:20 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:06 +0200
Subject: [PATCH v4 07/15] pinctrl: keembay: release allocated memory in
 detach path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-7-bb3906c55e64@linaro.org>
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qPaUa8oAewMMgl8vCYU8JU6h4WrDoK89nonD2PTBKh4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrYc40u0edePr0EkIpRoNV/l6AhxW+gy+qoJ
 DRbu/5uoWyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr62AAKCRARpy6gFHHX
 cr0FEADfv+WVcmzOaStfsm70mXUw69iAKQ+QB7ceZ9BjSwzet76pU/4gtWAVho7oelV+euRBcs0
 rI79EvWGS9pbM7J6fBEPxlORgTWjhZ68KXqcPbqBLiBSldQTY1ZILTMVi18urPLCWQ3mj+w+Kju
 4MbUSfSaeCLqLiFFCETd7te4vFDeDMpKmDmKxpTtqBqt8ZFzShFGXV2vxVtYLR7ztkmE1QAI3u7
 DzjZ7r/jkB0IfHAG0G7RyIfDdVHgRGGw/Luhe0ppGZA3Q3qJalbn0K487GB79PLQT36ptT2Ey6C
 kcr9rYtt9kyoaXybtesyYcENhiUdkUSP1StOc7c54IUPOjlZ6EDG7fD72/LrgzRnCtsZ/WADH0G
 w6u6iuLcYQdpYxtED6m7q6rfDBsuzq6tHiZ4w3rvfvjep0xGXNo6s3bwioOPlDCh7ldFD3AEAUJ
 Ulgn9cufPkFGzcCwVnEc0mRvdlTavOeHzjQIt77zX98T6+AGs9rBsIDvYazO+jzAIU0TRSy7QqQ
 8cE/3vgeDgTOzpTxfqdUm1HKwiHEuebwYuXdr2mI50EV4MjJbX6RN0C7XWKJjcLl7Q0l7aZRt4x
 MzKCL1YVBkfo6txurpQA3wRqXkgDFUW6ek8GoVdzy0LtGZirWgtY2Q3RAMVsBav9S02diTip1P2
 w/nGmj49yU8wsew==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_012722_298765_E8F8BCDF 
X-CRM114-Status: GOOD (  17.17  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Unlike all the other allocations in this driver, the memory for storing
the pin function descriptions allocated with kcalloc() and later resized
with krealloc() is never freed. Use devres like elsewhere to handle
that. While at it - replace krealloc() with more suitable
devm_krealloc_array().

Note: the logic in this module is pretty convoluted and could probably
use some revisiting, we should probably be able to calculate the exact
amount of memory needed in advance or even skip the allocation
altogether and just add each function to the radix tree separately.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-keembay.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 60cf017498b32a9f36a1f8608e372951c2b8f12a..6aefcbc31309995ec1e235416b40aab3e4a073a9 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1603,7 +1603,8 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 	 * being part of 8 (hw maximum) globally unique muxes.
 	 */
 	kpc->nfuncs = 0;
-	keembay_funcs = kcalloc(kpc->npins * 8, sizeof(*keembay_funcs), GFP_KERNEL);
+	keembay_funcs = devm_kcalloc(kpc->dev, kpc->npins * 8,
+				     sizeof(*keembay_funcs), GFP_KERNEL);
 	if (!keembay_funcs)
 		return -ENOMEM;
 
@@ -1634,7 +1635,9 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 	}
 
 	/* Reallocate memory based on actual number of functions */
-	new_funcs = krealloc(keembay_funcs, kpc->nfuncs * sizeof(*new_funcs), GFP_KERNEL);
+	new_funcs = devm_krealloc_array(kpc->dev, keembay_funcs,
+					kpc->nfuncs, sizeof(*new_funcs),
+					GFP_KERNEL);
 	if (!new_funcs) {
 		kfree(keembay_funcs);
 		return -ENOMEM;

-- 
2.48.1


