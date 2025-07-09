Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29EBC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 16:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NgqgvxwCqFfnj3D+ZyyXgE4JDdDG2zRHT6bfz+Oub50=; b=I33OlWug/AVtYf/4WN6t77UhCe
	phH4R7vLZruQRP0nzTW8PTEt2p8EwLJlT+nWWBiibKVImP+Oqyzr/RgyobzRe6SRuhKUFYmy3kVkO
	FhImOgEDEwY4onGEBST64baKv0MkbtwAgZnD5I4c+4e/U4GQlasujn7eHV8tgN2Mo+RmOvLfebX61
	QRR0opIbJRBXAKWKRKfdfK4aFCvACmZFcVu8kX0GB09NVDq8IK7wcm3J1OFD9RPtgnrVhRTqSj0ky
	ir80urdpTaZZ8HIcEk1ccG/ZCzRyzo2ObzxuJVoxky8k8/u7QsOS3hfrtuMbV/AVKEr7yqsohKtpm
	b9Z9JA7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXny-00000009KPS-2cOE;
	Wed, 09 Jul 2025 16:37:58 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVwx-000000090aN-2oyY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 14:39:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a54690d369so5620602f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 07:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071946; x=1752676746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgqgvxwCqFfnj3D+ZyyXgE4JDdDG2zRHT6bfz+Oub50=;
        b=cUNTIPxLHFpiZlLwjLxkjnwITxNUFVjuJrZIziRCya1saPExo+Beon/HbvIqLyHBDn
         vxEh2yHGZGAEd5oG79UW8y5M4u9IQckj//d1bLzi3Wuhised0jpetYgTVMP5rnYS+XIW
         bhnQiJ0Vu2DqEXHidw/ntyTUI/Wrq+0X9+nj23TT/A5f8EkFV9KWKk5ST9j1a7c13vPm
         pIsKVIoX42eltMTRuSp6Veo028D2IH6dJW7254atd9I2eEArTXGubmoafBCNHpccIe3p
         IpWj5RvbJxtfSR0yYZfMAIjAp4WFG35/8IZvHGCB9VDcIEDV4Oc9/8sETXOXhud4tnt9
         jMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071946; x=1752676746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgqgvxwCqFfnj3D+ZyyXgE4JDdDG2zRHT6bfz+Oub50=;
        b=RDvADQt+eYbHL47jEVFl1f28JrAr58J0dCiohb9HWQ+LSTVEpQSQrG0Wm/5CzFPvDS
         f60RcsZA9qBptqeeW+989FjQiMCtySQ8HVBhL6nEX2IvUww/Iphv9aT/ln8Mt2w8GWk1
         YPaTZvz+wrcex5fAkBLT+6W108C05lDxRhfWbcHeq3bUZwpWL2xyQQKAOMv6kIMSRnnX
         Krz18z3MT4hRagQnPmCbMo+x6ko+v6aGXORiW/+JZ19MFaIwRpMo4SkIkjTj5pxIB0Yb
         av9SCeXi1K+suCpD5SP3CoY+3c9BXLBa+NGmPqKUS+VdfJoxHcj6HIr1QMU9hI+Cw7HD
         tgfA==
X-Forwarded-Encrypted: i=1; AJvYcCW0bH9Js2elTO1/O95OGb8bnnz6Cdw+U9ptJwEtrEJWccj9zhDLT4au2y9gOFV7cdCqaPigid+5cBhG3YItrCKY@lists.infradead.org
X-Gm-Message-State: AOJu0Yz46GNmytX3UI8GfqlfRWBKgL19yzkaJpleWPZm1gCZ9NzFpGS9
	pgddWrGKZJgfQjXLropOAPaOoLVzdW5BPRie8XIDO11wCpEWEmtk+K8CWiQAT2doU9w=
X-Gm-Gg: ASbGncuIbw0jPdLRlwqWzcnzSORALfNG8A9lac/0M05bs6E+3OCdbw/kY7niFoCQ5W9
	9qvDo1/7FBfv/uVdcE91zghnw2aJblD4aHpGXIbzC0uSRvs3Ybyjc+1yA0G8pfLH4n8l7QMdJBH
	qVCw7qk5Lxou700FgloDGQC9KMy8Gyi3sC+MOD7wHXL6TGqQk7f+1fhMlfONoOLH7rC/pzNLEC7
	PR3NawCji/RP99pXzMAtD8Bo3JX0vzdubyVsRKbIPmXZa5uHQ8mVnxjYRi31a6JocISUKszklkl
	Bk5PDRpOmDadar6Yd7vxOdYOvSV21GRNiTxNiiYxTCGTQTmhN7sUl/s=
X-Google-Smtp-Source: AGHT+IFCxWrONhSHA0cousnCUUTqf0HNUo6HXPenRsFNCAgJUX4vg4QvqspTli9NjL302vwuxtMC7Q==
X-Received: by 2002:a05:6000:2410:b0:3a5:26fd:d450 with SMTP id ffacd0b85a97d-3b5e45291a1mr2441471f8f.47.1752071946002;
        Wed, 09 Jul 2025 07:39:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:38:57 +0200
Subject: [PATCH v2 01/12] pinctrl: pinmux: open-code
 PINCTRL_FUNCTION_DESC()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-1-b6135149c0d9@linaro.org>
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
In-Reply-To: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1679;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=SCktDGdssWrdS3fPrm13PpkBLbdVvTkxfS6ntdt/GdA=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8Fn5vbkSWEZGQidWF/DLtAdBGAPpe0LBr6s
 hA7h1HUlj+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BQAKCRARpy6gFHHX
 ct/ZEADXo1zYj3JGoOxHCAszamqrd3iGcngdepn9Nn73ljY3c9cLbxU9cu2jwSNgPpAh7Dh5iGm
 KfJ7vvZaC6SCUUj8UHwIOJl8W6uiYdJh8DdR+amPrvf7vp+XSV5xzj0Oiy4B7AZ3k9zfdi5Zqd9
 6rXUNWprQ35uNz4SZ3ZlC+nR1GeZwh440KfN5xaRc0I2NP2oqZNgwZdjI48LZsVuPYKIV3LiuDv
 30/FkUZSjr6uL4Y3htJwW3bvYZSamBDzPkpUtLmEnoHDwLUOjL056vSIFTB3arspJp2hE4MNKKf
 E2ZSHXcN7V8hxQblKeqwX4hKEPKOLksyRqCcQYIhjnQGTF1OOQdJAtpW/liqQstCHd+t3hEYySj
 1TWsXiFMF2GmwMrOQkI3hZIVMLVU/bwFerouobUyraWcNiqQbDDlr+NED63W0FnLgn58M0aHrH9
 lrwr/As429fr7Z+NKMjcMIaD67YQnESCyufKQxHBaOlJbaFGq9qOq8gPrUH+C8DQtQLIPBaifyF
 bRmK+g5Yjkkb6ZePxJWYpEasghmbbEip1pzjgL4oQaw33MXgGLLA91yvu11b034rbgjUuwVLYZR
 TQJQihYTxefGANWzFUr2rHEC9UfEan9NXcptfoMn6+Hz5LEkfeTmhiIHY4+8Xx0BzbHqNIxoaKR
 jFu1SE0AegXKSbw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_073907_717274_AB9F02A2 
X-CRM114-Status: GOOD (  12.87  )
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

This macro is only used in one place and pin function descriptors should
only be created by pinmux core so there's no point in exposing it to
other pinctrl users. Remove the macro and hand-code its functionality.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinmux.c | 3 ++-
 drivers/pinctrl/pinmux.h | 7 -------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 0743190da59e819d1c72c1ed1ece72f206d60d65..daa7a11adabf672f802a8e9577c14e4da56b8678 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -893,7 +893,8 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 	if (!function)
 		return -ENOMEM;
 
-	*function = PINCTRL_FUNCTION_DESC(name, groups, ngroups, data);
+	function->func = PINCTRL_PINFUNCTION(name, groups, ngroups);
+	function->data = data;
 
 	error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
 	if (error)
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 2965ec20b77fb360ca244800e30f1eafa988a2b1..5c039fd09f7474b4c104d3c36e0e8b8dc73a2ddd 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -141,13 +141,6 @@ struct function_desc {
 	void *data;
 };
 
-/* Convenient macro to define a generic pin function descriptor */
-#define PINCTRL_FUNCTION_DESC(_name, _grps, _num_grps, _data)	\
-(struct function_desc) {					\
-	.func = PINCTRL_PINFUNCTION(_name, _grps, _num_grps),	\
-	.data = _data,						\
-}
-
 int pinmux_generic_get_function_count(struct pinctrl_dev *pctldev);
 
 const char *

-- 
2.48.1


