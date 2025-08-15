Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3669CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 12:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcnhHIb6eNEwdjxZYrigpF4SQxNgYqLi3t6s+DqhmIc=; b=skrOoyKXRu9djDcscycUvwpePI
	pyFuL6E5qclhTrK0eAI8a5N1jsVJ70VRpdTWLzwDmsUN7H++BL3L4dqFilBeceDT01KHwT4uZxfmE
	z3LSA8l5paZYoVAQSlwCkcnTe+P3Jf2v5H3r1qvQq/RwHac4NtpRBZH4O+WUQsqzLu0jhZ9xP6Dk9
	kqJKxOqXhbg9ilW+/qi/bcfteUxxfNuzyWYnwh7U9hUad4MKqosXBt69KT5U9eQ6heqXb3BMTNlTi
	yiqZ+OuM8DW2KG4iASKvVwHgl5yP+t0Olhvf/EjHP4S1V8KRzFFHv73Dk20E0VKKpNmw059++vfL2
	ry6QcMTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umtXL-00000002Sq3-2uUK;
	Fri, 15 Aug 2025 12:27:59 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqRF-00000001zwc-2KVX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:09:30 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3b9e413a219so1476322f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 02:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248968; x=1755853768; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rcnhHIb6eNEwdjxZYrigpF4SQxNgYqLi3t6s+DqhmIc=;
        b=dz1bB9FV+elIsc8ngKvh3MGjTQujU3F+0nkJgvIgScGcDX3VKYRmQbSpVkp7XqSvVx
         /0CdkqJ7UfaZ+P93H1POIge3cObVqEI1BEeHoP1rv1IpFMUTde2J0KOzdApmbV6fxCYV
         CLRmDuBpW7L4Pt+hCyzLAH7hNvaI09wP4NAZ1G7HCWrP/uirZgmEojstiBgyRFPrc220
         ZplbxU2tcUEjWGA6JJPnIvQvyo5mw2tAU+w0Oa0Z99DO2a1RlQaXzc5ctvgTm8ti1yPl
         cGw4lOLVTaV4DU/7tfx256cJB3lUqup5md8bawgcHXSbpoQfQ2RHJiFVpTY8BaZ1KecL
         zFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248968; x=1755853768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rcnhHIb6eNEwdjxZYrigpF4SQxNgYqLi3t6s+DqhmIc=;
        b=AaGZTr69qZX5yDoNXoqjjV4cam4E+zer9BP0CB8maaLxZWNp7/P1dYb4yB8WvOnmcg
         tTah2SR7U+SmSnGNSHMAjE36Mey5MDy0k+pTsKC9r7WF0ZmwFg+Iwx6kK8TkniC/Uyu2
         tKYA2gPI8cNZmZL+OCcqQFEQfdkHsqqixJuHhtf0O5xlD3F17m3nTi+2g0zuKBRd8Oos
         MeMR+j4+aSaC6Q0Y3LzZn9zq+4Cp5DYJICfuDrvJx6lUXxdJBX+9hHT3qpfYUoQsDjx0
         KYmKrTSDK31jMQwPf4aaLtGlQI/sJM1+PDu1lk90xGRjt6kZzTnRbWhar4mB+0kjAwNH
         hM9w==
X-Forwarded-Encrypted: i=1; AJvYcCWm9JPcsJx3X4/4x36NlgNn3J22JRlivsMd6FCs7BDijJC0W3RAFRLv0o2hnOc08ytkxP+9n574Lk/X0ewgkKsJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzPti/IHTuza1Yl7yOXI4nRj6+xrGlcJMZtVOijb8a1UtL7w1Lv
	fBPQC1kluwXBMa32rNxbFY7EMxBMrmkAmpuwTGhwxJ4sMKIgMxfYroS6EMP8y7J8BMQ=
X-Gm-Gg: ASbGncur9QOz35N/3kGW/nCsdwJ2z6K4fTy4lKyBZpDQE+U3rqQGKQX5T/4Ek+WRUDa
	F7L67QW3dRUAWEb02Ukpdtiov6UU4aOdzSGaIvjpaNZCnQyq+TW+rRFwbFjc0kcgNFD93/fBZAd
	A0kfv2D23ZpOGr2wXF+GE7Z6pp14QHnOIQrmgM8C44vPiKciH5Q5Oz3iE5I+AnKfir220BuRXSl
	DAdoE6i6FWJFLuurfO7kLWpdHbyzBUb2yQ0wnUwvvLFhuZLvRV9vPI3w1xYaxxh46Rz2byMbivq
	tLg4DajQk9fN7qUTQHrjD5p3gMEQ/U9v9B5Ihc6JrNvJakd2hvty+Q6jIHmCcPP2eq3we+FwANe
	+pzPNGAJLWd4B5zprHA==
X-Google-Smtp-Source: AGHT+IECk334T6DAR4a8TS6EmWlh7UZ1cAoTGRWibGBdabTMKZmowz1e9Ft1rEqZaj0/xx+92lKCEg==
X-Received: by 2002:a05:600c:3596:b0:458:add2:d4b4 with SMTP id 5b1f17b1804b1-45a21803ebdmr13438335e9.12.1755248968009;
        Fri, 15 Aug 2025 02:09:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:09 +0200
Subject: [PATCH v5 07/15] pinctrl: keembay: release allocated memory in
 detach path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-7-955de9fd91db@linaro.org>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
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
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk49vTvI4Yqki2vhfowvJ8itgBed07OfvWWP
 1IW0D/2sAiJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75OAAKCRARpy6gFHHX
 co8/D/9RViTI69yJDAM4EMnxpBHjTbkjgLCo5+12MdD6irQvlPH7WAMDEHdgXHTfPuZCBslRHDn
 F681CDNXek0ARfTKOVwzdElXzOuvo5lfXVhpGWSo6l/hIEvn/8FvOQKWjbblDOQBRaPA4kW/SsT
 PX0h2zSSKtBSPAgqPlNsj3Hrjk02z5swiKfVNby/Rf75Gmt3jrn1gicqYNy4XvAdvk8MfssoZ67
 ILV1I34DYFex70AWKbHeILC0np2n1j0JNkhqPrZW98Pb8Fs0D2ZBVUAWwSBYZHOTEJvcetF0ptk
 hgBOxHPAlBP1/ZOqzemRwR6dI9QFVOBr7WXCBrHngAGalo4je2J0NXKdLUKMdxskRm4eC4yalT9
 vRvVjU/79HbKWhgGWCMMx5Yqu4cn8xAgkTtnpB382uQCJA33DiwPkovDMv+sdXi6PT3XORi6b2C
 dw4oNnImVUmuboHfeuZ2yL1MBZjfbpanOwrJp9ctvS1yWQHZG5n42OosyJncBXExsKHd+EdepP7
 UdKsNk5KwjnxNWyAi4y2GVvTE9N8ZJNJlbjNuGv2CIE2tr7kd/JRzZaj8hvlYwXIdp0un3ZUhX8
 ut8bcXSn36AAFe5iXHWX0OLQHgarcKs4M1EDx+6cfYjBM8lnOjLezxbetYfeTZSYpZEZMac2O3I
 zIs9a+PBsdnaHXg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020929_610873_075DC0F2 
X-CRM114-Status: GOOD (  16.53  )
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


