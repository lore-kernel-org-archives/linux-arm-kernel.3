Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E56CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 15:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bswhw1GYJgLkiQcdAy82i30rP02s8V3NVyufQL1WnW0=; b=sxOcrCafZwLVVMc46tz57HOgYk
	u2juAzyqpb2GzhXucpBJOPlBW8eHcqUlO7mT6p13FJ+GReAt2E9pK18FR//xYhhLT5XZvoJp5ULAN
	UfhNujk4fzAGItTZrLS2aPCvKchxWp8KopK/p13x56W5fIlpq/FYAT4/cUtj3Xz2ATGBuMulHlj9z
	lnPLwvJOaUyEbgzUCqEHGS18sdQ2avgYQ3FJrKZ7UUCOm7knKjwZErCpmcIHWfK3lst8wl++DzZHT
	Wwy5Z3c2hLlKJEBRaay2oJm2x7lIHP2pHVYHmutQoZ8fTBF2zaLLwDQHiYIzCtzHMZz4tlfHYzb3C
	tvJQKGjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utSXZ-00000000YhZ-2e9D;
	Tue, 02 Sep 2025 15:03:21 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utPfb-0000000H4L4-1Cjc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:59:28 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45b79ec2fbeso35720405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 04:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814366; x=1757419166; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bswhw1GYJgLkiQcdAy82i30rP02s8V3NVyufQL1WnW0=;
        b=gASOM29M+XWCy7BV+w/eE9FsRPvV2rdOBDgZF+o+Nby+gtBkWEnJmzNVB4ZpOChNE8
         vFz3ZRdxu+A0UYm0WIAsnhIpW4WPryD6irKaQ+Fqv3d3Huapy6ranQVf0LtfeeveXFk0
         EyiYCyNedTJUXwG4yR4bWklgmoy7VN9Bz3O123nFsqu9YxhkdvS6oMXrYpb58TWr6xiG
         noGda3Wz71DCICT0NfMyII6hNFZGw3bouANQPUH1xRKCcFxIQTpVBjXHlO8ssm/umL1p
         dbzOXTX7T53zKrCZdF0mXxeiCPLIFCPJd3p8pvcevGYZtuQpwmtVE37vHUE+dVyAi+8c
         pp1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814366; x=1757419166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bswhw1GYJgLkiQcdAy82i30rP02s8V3NVyufQL1WnW0=;
        b=ATYFVBi7eSiXEKIoSnAnLtEMGJdmHYxmxdCQiFDXYXilkrnHePgznOAUoLy7wg+evq
         HWtxeXKzviaWPTuRwrlECDv3VhUVPiqIWdQ0I2XOXhAGEDo6spV3e1W6+rTE1MBoaMCj
         BC6kdvOu+UDzSXN3v/13+KWKUqKdpaHXeQw6sRZqizuCSkmnm9OeZWXTMP3A6GfaLUNU
         Clxx/NujUAUDF/vquQ3TBa5tY8oOjHO99y9btgTGFFXioY4w2K7Nj8J/9OF6j23M3LR2
         JH5AkkUCVz01Ej32/QUqzM+8TPlaXIEThfHQxZ0uZxC3ZrxKuOzbKsfAQ7pK+S857g87
         uahQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEbju5vW+EBWqpopt1PbSlLioLw+EAet01QdgB6pCWtXCVRALPKMIWS1/DePpBnfwQj+jrSeK1MRCuCa3MwkHn@lists.infradead.org
X-Gm-Message-State: AOJu0YxNAgSVrGi3TljwBVX4E3kZlNUgXndlqZpeSwCZ8da6YeBzWFH2
	DbIebSN5r7KBbA9O3QwijskhmPxg1L8N/lmG60wYuZs/8UKLwsqkj+RKFzNZtq2FrIo=
X-Gm-Gg: ASbGncuO28MV0uV3Ub9RojY2N252uHaTmKqqlFgsEAlhU8R4gBNxkl8E81MvhKJprOg
	qP9ZySUIpUs8ocDS9zbj5PFYRSidk+hKlc1ITPWkeOZSpXLJBJzcqFv28Ad5f3T67JR0IdXuUT+
	ZLmIguCNyJM3nU7JO+QVh1k7rIRMp6usYUi/FkWXzH9t1hqo0mFZGX93GTiTxeeeNvNZenYXPcw
	++VpZbV9JgYdIhkPt44VlQ+R6fhTy8eKHCbHrteRpS5ilb9XFoPE0E5vGwQrcS76PmxLeSS38x0
	1H1BrkqKSo9ouDyALoVLiZ5wAe5FhnaWx8mLwGF781TRAd7MxurUPTJbjpM0DuG7G19e5OH+bd/
	WA7f7zgj7d20oeuaQ
X-Google-Smtp-Source: AGHT+IGIpBaz6r7FFnIRCIEC0+a7WcaTtJlzxcvaE/LJOrX7ntXW3p38zffYBjnK1uGkAz25Buql4Q==
X-Received: by 2002:a05:600c:1c15:b0:458:f70d:ebd7 with SMTP id 5b1f17b1804b1-45b9353e81amr25870145e9.20.1756814365845;
        Tue, 02 Sep 2025 04:59:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:13 +0200
Subject: [PATCH v7 04/16] pinctrl: airoha: replace struct function_desc
 with struct pinfunction
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-4-bb091daedc52@linaro.org>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2093;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/XFuHQ/ODPhn9fKCd0Ju7j35cIiLPr5VI6W7KxiJtqQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwSXkG4aY2cOKQ1+2ZlnidJXDf5tdbvHx7xm
 T6spE59tAWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcEgAKCRARpy6gFHHX
 ctGBD/9MbKPzAcDoovqTMIPxr8BtMxjfGlz3gLMXljCSbdBNiVKbz5YkKncvqSgoWFE8RgJf0lG
 4MXXFZah6ndL7XHk/j0H5Vk77deGulzZJPpYB/vTdKdTEXoqf2UNSvfFdaCO4GrYQCP918QKMbX
 Y3s5IeIFgdIKmHIOPtdTujxu+9GB19fBzWGn3Xn00xS5oq5wWcLacLqgtBNZ3zbqJAzJ/uNfJPs
 qN4Q0Dmp++ZUAAJw6r6umhTypcX6Zg8iMC61jkRLgnU/D+2n4dWGJizXrMxhUBexefXxLOkpp9P
 sBQ4DwOYb30i6GHdcCw9HykSNsNDvjDGgYjg207NXQ1aVGkE/9pE4CMyafvGn3AuGndzULmR7zt
 F/DShfIHttSBvsvdDThKnIT3lHMC0y8RBeoqEkg7NMd2lj5F2IXSblwbWjmfH2haAU16IoU8K63
 BB1ibO9AbrpHX2s/1ZYVXpD2knkhUXnwr29hJowBAuxojdr3z69Zs2oxlj9hUoQmrs4F+XAqsmB
 XcnxELikDisTVpBMve5oB/fjqGZp2rWuGuC6sykJ5jY00e9mdKF21zIYYBAygClSBwbdekEKGWy
 u9jdXOcXRRsC5p59bShjaSz0LjR1fU877tgST2UoQw6XScesIDYv6cUiRWjgnFQkhjQkOqP8/4R
 AWXs/njP4gntjFg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_045927_361420_405BBE7A 
X-CRM114-Status: GOOD (  17.34  )
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

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-airoha.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-airoha.c b/drivers/pinctrl/mediatek/pinctrl-airoha.c
index 1b2f132d76f0aff78768ed846e8d5980e5b46770..796dc2461ebae167d9daccbb26c4ef6f358851a1 100644
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


