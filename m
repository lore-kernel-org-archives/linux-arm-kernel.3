Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2ED3C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 18:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ojzj3QqHYKTtweaj0hMdOf0hJWBOPE6yGgnAHCkCHqs=; b=jabKTkEYefTZhp6R9WNV34xsUX
	3JavF1EJrcosObHVYcoPVy8JKoFOzTIlLJs+3enp9PprqBQWrQCmf5LNkHCJlxSY/ATQbS3aBCMkv
	0b3VSfPSZD92OsLhvIlo/ABrgJDDli3M+dDeTQ2B9cW9LETt6SAZUE97bjqQraEi6AKZfyQBA0YQx
	5Vkz828vlKoxGsrJmzgJKq+R+1dL098glpGPNTKdMJDH7urxpjsw+j7Yrs2+8dFaX6NUCc6+sFhRn
	debPBBLi5YafJpQCNrjaPoM404MlKNoMW8T6JCHyuMtoPJ9KuJVw8yRlmC3mR88TlVs/dRqE4cV7B
	4Q6znEVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urhoZ-00000002t1S-1Bua;
	Thu, 28 Aug 2025 18:57:39 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urf32-00000002BGn-48dL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 16:00:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45a1b0c82eeso9494875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 09:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396823; x=1757001623; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ojzj3QqHYKTtweaj0hMdOf0hJWBOPE6yGgnAHCkCHqs=;
        b=lqX0M+waoIYTDYZ11UO3X3k8PDbY9XS0VSsjvZTlRQfHcIJtHgzCMPbcCxADCXYo1O
         BBXhKGNF49MnJyjkIlv4F+u3c1z82OuqZC8glyLNqIKxQYXIqdyxqtnrryYZ9wUpPF8o
         fgR0l8Xxgx/7KZrgdSrObjUOxm+nvER/3PjKZQ8WtVlWZR5uLDjysxARvGW73XoqYiCQ
         qVMmyNZDpai8tIlJ/Y8pNpNUrIHBfRiIu4Gg+xLaAoLQQK+fJrfnVGZw6XFHhsQi/mI/
         rbgY+mc3eXSjtgRVhjmkDbiV82DTULa+MaImNPyZ6kXIip6ABF1qo9DrAUYssXNLPcNf
         6Y8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396823; x=1757001623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ojzj3QqHYKTtweaj0hMdOf0hJWBOPE6yGgnAHCkCHqs=;
        b=PQdAcNJvgIGTYkEdeEIOFmYpPR0oc7Ans1fhVzlF/kzuaS3fCyzC4A6KsIamgiwawp
         U1/LMbVHObKVUEDNMEP+gNntddqiNAmZrDifAkqDtyoEahlx3lJyK5Dz7kXVEE5sm3/U
         K+Y64vxpI7HbMm0mPTJGphDdQyTh/9/iBSx2B0aEmEGiXWQsFlyK0Y9k+JC44qbOYRWe
         gT3e8BONAgqAewmjcrfljM+4/wVDB0hLsm+4mKa+eDYHBB0wVstVsF4UswS1VBHwPSDz
         WLZFoW8XciuhtE6AKeaG1ajKRYJagmQ/dFHAIku1rkGpPZKqObaaC5T3+6dLRzqgPpZL
         HXvw==
X-Forwarded-Encrypted: i=1; AJvYcCX7qHZEXguqwP0w85oVunbtQ55mwqmV5b1Anx0YIPvQ9fKVfCLV5mbpLnpJtsyvoeyqPNo/ujbLkshrlbWBwdRi@lists.infradead.org
X-Gm-Message-State: AOJu0YwOpLygbWD5EAVqj7OdTHmtUG+cspEnSf9ZDStUpwV6z7uetoqh
	R7ef60d3jtoNGB7vQXt21DXo2ZUBtN41fEHJRgDnpPFFjbCpzuEdIQV7JUESAfioo/0=
X-Gm-Gg: ASbGncsOeyud3teQmvTreqsjRgaLeCJTRjUMxfdagNMphVMN0umxIJEGlA0mH0mbVDG
	yKwouEHobHAyMSODEbesrxl9SXxwMw/+G0szpkh8jpvhOfhWHzZKVe0ERsxGw6w/E6uWOZPwBtQ
	6D+bo/EaLCyzp2qCm91LnNA73TrDC3oCPrxpf62ScQdDG09yyQfaj8Z0lMKBckf5h6hqFjcl3aD
	gwWhjmvloNUVCRYH/EId49ZFvLPke/iD3hhgOfporZrAH3c5NXLwvjh5GmCTwhZ0bfzWL7StG8+
	Oyf5OQtRGppjV4yFbpo/8JiTrrfavhqP53Tb6srV5r7PiNf3bBCKsuzGkSuVcm/oBqqueIxwSn4
	7cg6ePQXZIE9DtKZ+VA==
X-Google-Smtp-Source: AGHT+IER87jaQoeShvQsyVmSj0aSvRTPhiF3pGP4th0wCUHmIaEcNjSjK3S9hh6ajKAZPWgkTqzJEw==
X-Received: by 2002:a05:600c:3baa:b0:45b:7699:fe6d with SMTP id 5b1f17b1804b1-45b7699ff37mr39397625e9.17.1756396823201;
        Thu, 28 Aug 2025 09:00:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:22 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:11 +0200
Subject: [PATCH v6 03/15] pinctrl: airoha: replace struct function_desc
 with struct pinfunction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-3-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2038;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Q2YZTvBFgTu9mhuvELDYkYIT0089SG8/1kg34izHMkM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0NV9d/sWbKuAEo7ou0UURrmodfCJaO+QJj+
 5MPwqZx43yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DQAKCRARpy6gFHHX
 ctzoEADbwEMqx2TH4E23rUTlqfPLcS3fHDWD+epEgWLvTddWUX8zN0lfF4FdFwiys7ELKxR/XwG
 QQO9szL6/l5nLBeTUoJNYd+5mk/+O8TNscJuBmxuWHrkFdS502g9bhW1ECKt6zIdhveGlnOpm6G
 uWluWMTXPYbpEuB7ezYm2R757utNZGn9oMoJOpgFXPoJpfivFPV/oumKI4k9Iy7QThSAon5HZt2
 k0tpgOUW/dRXd3NjVgKI2HKa5db6VTmGO8HljSZgVCiftk7ncKE2Mm9a9iq2oYrDJ1Z2Ht+o+IW
 Rd4fsCsXHoTWenwwIarjTfN8fSBhFWsfQzLZ9eGffhMOkn4HvMkKuthX9hXJN9441LES8oK0K5K
 yeDSnZWt+aqfrHK1oiGHZn3GJaKmOFDdvceLg/lUpV8R2Dc4DUY4yA2lX8NRgTXEawWajpJWElG
 +V2pCZfQmQvH/AixL165s4kQj9MSQUgT7j4g+0QiP9H27ht7qfkRBvNOcSb7LEA+D69MtA9t5wQ
 wQCWYtmFXFIyEttClIKmrjfl0UkXbMWiXX0OdeYgNoIkDG2wJb4jxQFXh9Ck7T9zC7KQrWhrnNX
 IXfuwfBD4wDRjDnT6qJc2SAi7vZcnjaZE1OR00slPWK0bn9dRYLmlRGy3EYl/+YjsktwDYpm1wB
 0XpX32OnfZ6PasQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_090025_038469_09E0694E 
X-CRM114-Status: GOOD (  17.00  )
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

struct function_desc is a wrapper around struct pinfunction with an
additional void *data pointer. This driver doesn't use the data pointer.
We're also working towards reducing the usage of struct function_desc in
pinctrl drivers - they should only be created by pinmux core and
accessed by drivers using pinmux_generic_get_function(). Replace the
struct function_desc objects in this driver with smaller struct
pinfunction instances.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 5f1ec9e0de213d587b68f41d3458cf504ee1b21f..eb6cd27955fbe462f479fbe92c785588caee5ebd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-airoha.c
+++ b/drivers/pinctrl/mediatek/pinctrl-airoha.c
@@ -35,13 +35,8 @@
 
 #define PINCTRL_FUNC_DESC(id)						\
 	{								\
-		.desc = {						\
-			.func = {					\
-				.name = #id,				\
-				.groups = id##_groups,			\
-				.ngroups = ARRAY_SIZE(id##_groups),	\
-			}						\
-		},							\
+		.desc = PINCTRL_PINFUNCTION(#id, id##_groups,		\
+					    ARRAY_SIZE(id##_groups)),	\
 		.groups = id##_func_group,				\
 		.group_size = ARRAY_SIZE(id##_func_group),		\
 	}
@@ -334,7 +329,7 @@ struct airoha_pinctrl_func_group {
 };
 
 struct airoha_pinctrl_func {
-	const struct function_desc desc;
+	const struct pinfunction desc;
 	const struct airoha_pinctrl_func_group *groups;
 	u8 group_size;
 };
@@ -2908,11 +2903,11 @@ static int airoha_pinctrl_probe(struct platform_device *pdev)
 
 		func = &airoha_pinctrl_funcs[i];
 		err = pinmux_generic_add_pinfunction(pinctrl->ctrl,
-						     &func->desc.func,
+						     &func->desc,
 						     (void *)func);
 		if (err < 0) {
 			dev_err(dev, "Failed to register function %s\n",
-				func->desc.func.name);
+				func->desc.name);
 			return err;
 		}
 	}

-- 
2.48.1


