Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3142CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 12:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTEYsyiptWWjSso4TZTiEeMehJGAEz0s92KPugL0Mwk=; b=fS9Z1i6pyyQoMr+qCVX+tBCtyZ
	Pzz3op2h0CDDR041GPAEcrRUHhy17TszR3SWP40FT33FTsb0rvo+RAFDjYno5V25nxSB29NfEbomo
	R0gmXQ9C5fT/6VJYgtuqyj26KFo0qcJOdTZBB/AXbL8pWVGbR+TvJUXnKZ4d8ZGU2h+T9ESIgfc53
	hpI82UOIjeSKAmWPk+xny9VvSgfh9pXd2pOA+kdHzQuU+KDWykvBLMjqLS4edVfVGUbHfLCS403id
	yGS1kfxqsHJpZQlbikD5Hq9P6F45lnRyrxL7r6g7LdblHXyJD7jMKwLAz6s7XDUEnptS9NJbZSf5B
	F3nqeOlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umtKW-00000002RMz-15Ro;
	Fri, 15 Aug 2025 12:14:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqR7-00000001zqg-1fMD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:09:22 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45a20c51c40so3938705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 02:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248960; x=1755853760; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTEYsyiptWWjSso4TZTiEeMehJGAEz0s92KPugL0Mwk=;
        b=zCj9D6YUkuIe9hNfXidtv707vBm/NTkIzjxzTRXLdaeuaRYQSgIiEXqhIP/1dC+Nyg
         RII/xN7UzR9tdX7R0l0sztOiNeVCYTE/0dXgbNpEF482+e4or18zJO5+TlbsQxPNYKII
         +Tb+nabMV3NT5Fvs50tmx+KA209KiMr9LYVzJL2lEGVDEB/TNhWv21C3+5eRsVDXphSM
         wnrbdNczY7vLNgYjzBqkzkHGf+VBATzij49jgDAV6uPVm+cakr3IbxrzKrb1EarBz0Pj
         NaMyLIGEr8QxbXrxkOjUNNEXs3onfsjBww6m8KT9q22Zs86WkrJyDmySvm1dZKbFgyV0
         4LOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248960; x=1755853760;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTEYsyiptWWjSso4TZTiEeMehJGAEz0s92KPugL0Mwk=;
        b=jfqh9mg8kXPX3nU9eXj/nYExTWTu9JkgahqU5/eJIeJeqFyR4RAjplVzKmbG1wyWMR
         BH9mzoyhKJWi3fkjMVCuIHRVUG/vZ7fbPmGQHnLW9pt/l4cq/W+8IQrLbekWNcZU2wnD
         jmTDfWOfj0XFGvMXDfSpJZqg0LK2sNenqj9cIpCL/r0ZiJEsxqszrY1OdSo4o/JBBO1j
         tozCB9jUqvt3qQ5UdKY8sr7s4p6PpzQOYoQ1YXG+jPIPuxwrOXCTjvDC2efBmVvucTh/
         X06NVI3Rfd3cM/j++obOm5h15nKvM7nE3IG6CvRG/QZWjSNWYOFAvEikycSpLK6Td3oY
         Gljg==
X-Forwarded-Encrypted: i=1; AJvYcCVpLonNNZNy9a/jgkIN4y/n6Qw/6wl8ly0NshM+MbZHwqyyj98Mx63Txkq6I8AayLx9LO+HslCt8GOw3PipAT1t@lists.infradead.org
X-Gm-Message-State: AOJu0YwM52o8TXFRvhea9pFfPuanct8x2VVUhcRZCg6P/we5Vvy/7MRz
	bxulHSNXg40VRT2EU9Ri5WaaJuBfnVU8EnhJTSPqbzNuM0Q8dk+I1QWy9F0W6bi4F8k=
X-Gm-Gg: ASbGncs3nzwGRd/sqOJEEng1xAD14jeEm5Ingc80V7Dq0QdmNftbWK3AlCtsRAlxdpM
	gGbsMgvywcH9pvsSrQLlM2+0Hf63XKjAfj3LrAnkNo1AN4yj9+k7hI2q7mWYtCYbqO39JtaParM
	SVoJ7XHF2IMZEEuNtLACGdZ5rGCr7NSENByDUrlNQYNPFnBupb8tEkIKKbIhWAkrXLvDQ3Iuj9E
	iGt4SL4ZoW2QdZprlyHohyG0Ry+E5eLIawx7B+uFEzy9NtbL9V6gfeSPUPrGYEeSnzreSgjPrXK
	ZlQ2OXVptFx523H1glExBhSH1BSFbWrl6Z55U+q6vdZJP3qcRPWt0K/sgUv10R3OytzgAHs6uai
	aQvw021FYb8k/zhk7LQ==
X-Google-Smtp-Source: AGHT+IGuafEDk2fUEQZW8KQxsUxoxuS3rrKRRLnSrxZzWpectV45Eo45G/o23FjXP2Wlz7Hukpjj7g==
X-Received: by 2002:a05:600c:458d:b0:453:8bc7:5cbb with SMTP id 5b1f17b1804b1-45a218575cdmr12294135e9.25.1755248959721;
        Fri, 15 Aug 2025 02:09:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:04 +0200
Subject: [PATCH v5 02/15] pinctrl: ingenic: use struct pinfunction instead
 of struct function_desc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-2-955de9fd91db@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8989;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ngwvMKiL7WjeArNFSdBs/AB2ylnC/fm8iV0Ni8uhrlY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk2tcCKZ9S8bHWzstarqLTKTQ1YHnUbV92qt
 Qb2VsamRP2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75NgAKCRARpy6gFHHX
 ck8UD/0SuZ1lRn709uM94ELQ72NHYzpEjQtAM1QFRsNdAYuKoJOvHR364Fj3HhkJd+zCrUp2Fry
 +ZhqLaNDtcJRXi1guJPKFuBw4hvA89fdoQ//Ji5sBF53l09eteQmfQkSZ9cThUuqb2ppQNrYg44
 Uw4SQi59wIEjNkFcCYmIyGi41ZLTjWLkTqEEaHYAvXtnckyS4dLq0u9JmxGlvZAqO2gzhZSJj9v
 H4jgBrzkSytyTLgC7Aoy1Ju/+fjgpvCvtJexa+QgAUk48BQQ+zS8k3FlS3nZrKbeXo2J22IX9I/
 x9hgdRao6lACMKXTsVVsLyzt2kQTPya2dr+NWOvuvJJgoK84111q5NYsNGvC25tGN3Ndj4XECpx
 zaMsN9OT7tWOAF6oQbtQs+tOg3FdD7BmW3CjFvi/r/j4/JJAdC0zp7S80TP+yWQJyR12NJxhgRl
 bNkFazTTH376z0uBVticwi6kKpfaQ17JYnYGH/op9YKw8yUgnv7rJc+HIsXz+AJS8U3sWSBXLyU
 vRLs/hlpZVM7nClvIR/bjL4h4xKl/dFzH7xUq5WB8Mu7zgllTIg2XPgznTS4I91Y9Iq3J7IGzRq
 DRr9xrWrp2X0YEM1881AG9tbg22WDeuvO+aPGY7m6KSFgNR3+mLQCq0KBikOArR7KN0yRdAm7dz
 fywtlYsuxDVymgw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020921_476796_2EBE9040 
X-CRM114-Status: GOOD (  17.95  )
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

Acked-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-ingenic.c | 45 +++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 2900513467fa4e2e9374946fc9c7a30d48aef9eb..af9d2f3081859bc4b22f6820f3b3753eba36f959 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -96,11 +96,8 @@
 		.data = (void *)func,							\
 	}
 
-#define INGENIC_PIN_FUNCTION(_name_, id)							\
-	{											\
-		.func = PINCTRL_PINFUNCTION(_name_, id##_groups, ARRAY_SIZE(id##_groups)),	\
-		.data = NULL,									\
-	}
+#define INGENIC_PIN_FUNCTION(_name_, id)						\
+	PINCTRL_PINFUNCTION(_name_, id##_groups, ARRAY_SIZE(id##_groups))
 
 enum jz_version {
 	ID_JZ4730,
@@ -128,7 +125,7 @@ struct ingenic_chip_info {
 	const struct group_desc *groups;
 	unsigned int num_groups;
 
-	const struct function_desc *functions;
+	const struct pinfunction *functions;
 	unsigned int num_functions;
 
 	const u32 *pull_ups, *pull_downs;
@@ -263,7 +260,7 @@ static const char *jz4730_pwm1_groups[] = { "pwm1", };
 static const char *jz4730_mii_groups[] = { "mii", };
 static const char *jz4730_i2s_groups[] = { "i2s-data", "i2s-master", "i2s-slave", };
 
-static const struct function_desc jz4730_functions[] = {
+static const struct pinfunction jz4730_functions[] = {
 	INGENIC_PIN_FUNCTION("mmc", jz4730_mmc),
 	INGENIC_PIN_FUNCTION("uart0", jz4730_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4730_uart1),
@@ -370,7 +367,7 @@ static const char *jz4740_pwm5_groups[] = { "pwm5", };
 static const char *jz4740_pwm6_groups[] = { "pwm6", };
 static const char *jz4740_pwm7_groups[] = { "pwm7", };
 
-static const struct function_desc jz4740_functions[] = {
+static const struct pinfunction jz4740_functions[] = {
 	INGENIC_PIN_FUNCTION("mmc", jz4740_mmc),
 	INGENIC_PIN_FUNCTION("uart0", jz4740_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4740_uart1),
@@ -474,7 +471,7 @@ static const char *jz4725b_pwm3_groups[] = { "pwm3", };
 static const char *jz4725b_pwm4_groups[] = { "pwm4", };
 static const char *jz4725b_pwm5_groups[] = { "pwm5", };
 
-static const struct function_desc jz4725b_functions[] = {
+static const struct pinfunction jz4725b_functions[] = {
 	INGENIC_PIN_FUNCTION("mmc0", jz4725b_mmc0),
 	INGENIC_PIN_FUNCTION("mmc1", jz4725b_mmc1),
 	INGENIC_PIN_FUNCTION("uart", jz4725b_uart),
@@ -606,7 +603,7 @@ static const char *jz4750_pwm3_groups[] = { "pwm3", };
 static const char *jz4750_pwm4_groups[] = { "pwm4", };
 static const char *jz4750_pwm5_groups[] = { "pwm5", };
 
-static const struct function_desc jz4750_functions[] = {
+static const struct pinfunction jz4750_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4750_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4750_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4750_uart2),
@@ -771,7 +768,7 @@ static const char *jz4755_pwm3_groups[] = { "pwm3", };
 static const char *jz4755_pwm4_groups[] = { "pwm4", };
 static const char *jz4755_pwm5_groups[] = { "pwm5", };
 
-static const struct function_desc jz4755_functions[] = {
+static const struct pinfunction jz4755_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4755_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4755_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4755_uart2),
@@ -1106,7 +1103,7 @@ static const char *jz4760_pwm6_groups[] = { "pwm6", };
 static const char *jz4760_pwm7_groups[] = { "pwm7", };
 static const char *jz4760_otg_groups[] = { "otg-vbus", };
 
-static const struct function_desc jz4760_functions[] = {
+static const struct pinfunction jz4760_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4760_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4760_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4760_uart2),
@@ -1444,7 +1441,7 @@ static const char *jz4770_pwm6_groups[] = { "pwm6", };
 static const char *jz4770_pwm7_groups[] = { "pwm7", };
 static const char *jz4770_mac_groups[] = { "mac-rmii", "mac-mii", };
 
-static const struct function_desc jz4770_functions[] = {
+static const struct pinfunction jz4770_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4770_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4770_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4770_uart2),
@@ -1723,7 +1720,7 @@ static const char *jz4775_mac_groups[] = {
 };
 static const char *jz4775_otg_groups[] = { "otg-vbus", };
 
-static const struct function_desc jz4775_functions[] = {
+static const struct pinfunction jz4775_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4775_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4775_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4775_uart2),
@@ -1976,7 +1973,7 @@ static const char *jz4780_dmic_groups[] = { "dmic", };
 static const char *jz4780_cim_groups[] = { "cim-data", };
 static const char *jz4780_hdmi_ddc_groups[] = { "hdmi-ddc", };
 
-static const struct function_desc jz4780_functions[] = {
+static const struct pinfunction jz4780_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4770_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4770_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4780_uart2),
@@ -2211,7 +2208,7 @@ static const char *x1000_pwm3_groups[] = { "pwm3", };
 static const char *x1000_pwm4_groups[] = { "pwm4", };
 static const char *x1000_mac_groups[] = { "mac", };
 
-static const struct function_desc x1000_functions[] = {
+static const struct pinfunction x1000_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x1000_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x1000_uart1),
 	INGENIC_PIN_FUNCTION("uart2", x1000_uart2),
@@ -2341,7 +2338,7 @@ static const char *x1500_pwm2_groups[] = { "pwm2", };
 static const char *x1500_pwm3_groups[] = { "pwm3", };
 static const char *x1500_pwm4_groups[] = { "pwm4", };
 
-static const struct function_desc x1500_functions[] = {
+static const struct pinfunction x1500_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x1500_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x1500_uart1),
 	INGENIC_PIN_FUNCTION("uart2", x1500_uart2),
@@ -2562,7 +2559,7 @@ static const char * const x1600_pwm7_groups[] = { "pwm7-b10", "pwm7-b21", };
 
 static const char * const x1600_mac_groups[] = { "mac", };
 
-static const struct function_desc x1600_functions[] = {
+static const struct pinfunction x1600_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x1600_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x1600_uart1),
 	INGENIC_PIN_FUNCTION("uart2", x1600_uart2),
@@ -2779,7 +2776,7 @@ static const char *x1830_pwm6_groups[] = { "pwm6-c-17", "pwm6-c-27", };
 static const char *x1830_pwm7_groups[] = { "pwm7-c-18", "pwm7-c-28", };
 static const char *x1830_mac_groups[] = { "mac", };
 
-static const struct function_desc x1830_functions[] = {
+static const struct pinfunction x1830_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x1830_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x1830_uart1),
 	INGENIC_PIN_FUNCTION("sfc", x1830_sfc),
@@ -3225,7 +3222,7 @@ static const char *x2000_mac0_groups[] = { "mac0-rmii", "mac0-rgmii", };
 static const char *x2000_mac1_groups[] = { "mac1-rmii", "mac1-rgmii", };
 static const char *x2000_otg_groups[] = { "otg-vbus", };
 
-static const struct function_desc x2000_functions[] = {
+static const struct pinfunction x2000_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x2000_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x2000_uart1),
 	INGENIC_PIN_FUNCTION("uart2", x2000_uart2),
@@ -3449,7 +3446,7 @@ static const struct group_desc x2100_groups[] = {
 
 static const char *x2100_mac_groups[] = { "mac", };
 
-static const struct function_desc x2100_functions[] = {
+static const struct pinfunction x2100_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x2000_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x2000_uart1),
 	INGENIC_PIN_FUNCTION("uart2", x2000_uart2),
@@ -4571,11 +4568,9 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < chip_info->num_functions; i++) {
-		const struct function_desc *function = &chip_info->functions[i];
-		const struct pinfunction *func = &function->func;
+		const struct pinfunction *func = &chip_info->functions[i];
 
-		err = pinmux_generic_add_pinfunction(jzpc->pctl, func,
-						     function->data);
+		err = pinmux_generic_add_pinfunction(jzpc->pctl, func, NULL);
 		if (err < 0) {
 			dev_err(dev, "Failed to register function %s\n", func->name);
 			return err;

-- 
2.48.1


