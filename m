Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91601C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 16:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czHhdDldz+WtRX7ZZCzWNm4N0HL7u5F2xQoqfhztS9w=; b=B/j6Y3Kwa2gPvf7ZxOLhAkeZqn
	jg/AjJZ4spV0egGzLPtxHyMCriYB81NxASHc51W9ApyDMHw+tmJRLS0qbWg9L/n6wolc6gSGG/tc3
	VxYjjEw4xp8LRfKwlpLUm+u1oWWEuJJwd/2p+JwC09z4pgaUOHphZJJ7oaTMiN7VBYNpmZk3t4Bgp
	FdoOXnrBkOxLw5+TjB/2SpReSYlkgMa2jbJlHvo9YtwyuOxze1XHYMb9LqcwQ9NEbaOA/UeQ8Jh5X
	VG0X8zVS8Qhm0cYDwjVKBi9Fox/C0qkuezgOkynKPQ0nPvdAY3NSMz3pwm59nhTxwnERf0JN9Lxl0
	lKjBFK5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXqI-00000009Kmr-01SU;
	Wed, 09 Jul 2025 16:40:22 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZVwy-000000090bH-2ts4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 14:39:09 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45348bff79fso60283385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 07:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752071947; x=1752676747; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czHhdDldz+WtRX7ZZCzWNm4N0HL7u5F2xQoqfhztS9w=;
        b=06Vo4W5X8GLIUl4M+oQM1ZtoxL6QVUx9VyoL6Wz3KfZuRi1qG1fJmWI9oQ9pDntEQJ
         jS1TIQnCXZ4ujmEc8e/1hrNuerS9MbssrrqfvE6CvTCfWn5k8o5pFHCyuMYoOIr4qMcm
         mRN9KYgQN6u3u2COmTepc7eMe4h84H3axUl7tnxWFfmN1z/sgbAVxHeylC9loQTK/dgE
         ylJCvjhRCcQUzqYIzQpg70A/M5p6B+fbrDajAafzjaPAMviKGnmZRwjsyI98aaTr1YaS
         TZNlcy/Vm4l8mDh5N6zga1sGGMW90rVG1qXLPIVuUECqrW1ioEVr30VViCh1vwY9Wmgz
         ApzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752071947; x=1752676747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czHhdDldz+WtRX7ZZCzWNm4N0HL7u5F2xQoqfhztS9w=;
        b=jPtVFj9AsDiAArnoNvZZSymDe0f5/J7/BY91Y5gX/kL6CbhAt8vnd3by/N/eM0sY37
         rNwPwPrXYU1ez0EtR7SkB7X1Qz72A+PbQEVJljfRKT8fojIsKezkZJ4Isg3od9jnHNok
         sozoXGGsArJfKXD+xwcFvMFRA8BwBXCjOygsj6HobKUJwhTcyclOgzqvJ72+Fcac+RPo
         cW3goxN0q1lXVcgJO0DmUTiBPpeRlnlPSxgLXkpJ92g08h1NirtUDJ02qNVt7NSk6Gi8
         TKol9hDnW0C1im8tgbCUcwHe/+u79GCRQbAZW8NFrEqreAgYo0R8ta2RLYAoRCExiN9J
         kT6g==
X-Forwarded-Encrypted: i=1; AJvYcCWLaKCFyQg5roOL1sjCp4SnSnPeXz1KeNUFe2AAaoDl40K8UuP4pOj6Dd9xGbAMuLfTuR7Y30ta+xlg57XMS4J+@lists.infradead.org
X-Gm-Message-State: AOJu0YwRwBYSYUzPpilih3PNy484oikleN953RPiCjEEmi1+E5cv1a7U
	x0VPtT52os7hv+P2wdJw5QdzWLy5W3ZAidkrS/Ag8lM5PZ93ATVjk+xIjRAPvknqZg0=
X-Gm-Gg: ASbGncsFNdq+lBAyhmZqPeVA+xq9yjOCu6PIS8xWGDtKqJT4EU+1rIh+MdXxUC0QYBy
	/uoT+eJ/CgPkT/PX0kh3H7Rss7+88dPDws4NbnyB+/oZ+b0dKnncKon4ATGj42sdQfBmyrucwJy
	fYCP7BggzVTPreKrmo6XVZzKtNgc9zn/a6TTm58qLa055FdALSFnWvJu4jr+CmbDEb8eOZuygME
	Q/Gvqbs6MXwf8hHo/J4OMcIaxBJAtDZC38wLHP6A7mWwLum1w2/UnBOIF7S2Igtb+XMBQLkA0UV
	cnT7lTpRvKSZrIotcaVvsdcqGPlhqlEri5/Tc05AZLfWn1pnjIb/VwU=
X-Google-Smtp-Source: AGHT+IFuSbTCbzm4UMEs0fOr+CcLrwO9ZHO8Nn8PrkMXTiXu9SqobdbuxW9HdZqI8bmoCu470JLWgQ==
X-Received: by 2002:a05:600c:1d1a:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-454d5325799mr34930475e9.10.1752071947136;
        Wed, 09 Jul 2025 07:39:07 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5dfbf56c9sm4480687f8f.79.2025.07.09.07.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:39:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 09 Jul 2025 16:38:58 +0200
Subject: [PATCH v2 02/12] pinctrl: provide pinmux_generic_add_pinfunction()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-pinctrl-gpio-pinfuncs-v2-2-b6135149c0d9@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2925;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=sZ0ZigWm6IfbW3HtRq2G1M+nzP2iwa8TzMOAiF2WDhg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBobn8F72btxi5xeLl0VGir38VLpRye250ZBWXiL
 84+vGLy9YyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaG5/BQAKCRARpy6gFHHX
 crSgD/9hLC4vMhdUuY8NHszXt6pGR2JOyKALHXCJqrcP120vpjqVcXV6Yi2hSZFN5tt64Szp/+s
 k7YylnJQ+zLC2IAqbqw1fpG6gY0fc8RceGTgqd3aEJIxwmekzOanlrSlfYOIz92Lj5hkfK1fQcN
 k1oXCPeX/oiBsCBKMgaF7w8oJ7H2kk2WFsYz44TN6CgqwpPH35bdMMtoD28g72S8FXLjdCHP7FD
 XepmoIsrZnknzd/4SGXiwlc4Cfl04BG9WU+kdB/+L8dOM23tvqZdCOiRrGdk0Y4ir4J+FpXF5oo
 +cCtRWMvmseaVLsSXqmHgNmiE7FzA0jGXqk4KHB43zZEi0m6t9/LKC3lUA8LQQgVeD0YH7nftY2
 deBpEtvp8lZw6+a1B3Y8/CzikfdewCMMB1j/1Wi1gDYVqyVldNDtiokONcvXIe0HZT8rZ1fWOhC
 nlzGki7r6QHuQ5/91jKveZtcw+MBK2cdqASSzFzeTDhvnSg+9BVhlHQ+cdsE5dl1VPj4c3xbzZa
 B3QWEpWthBDOhY8wbnWCOvOpK0C/IJx7i7j4eONBtNUK/JuWNAIO6HAgttJyeTUTbtB+aE2Pk4m
 1sNPDY4sXpmj2JJiu+FN8kf8MUdXFxrIcMq85K+dk69b737YT8Kxr29poEWjBkE+arImbDKPqBs
 3ClmLcrCq4JhxBw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_073908_738298_9518D566 
X-CRM114-Status: GOOD (  13.59  )
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

Several drivers call pinmux_generic_add_function() passing it the
contents of struct pinfunction as first three arguments. We can make
this shorter by simply providing an interface allowing to pass the
address of struct pinfunction directly when adding a new function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinmux.c | 24 ++++++++++++++++++------
 drivers/pinctrl/pinmux.h |  3 +++
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index daa7a11adabf672f802a8e9577c14e4da56b8678..8f2fe7ffc4f682cd966728f3c77c504489f7f8a0 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -876,14 +876,26 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 				const char * const *groups,
 				const unsigned int ngroups,
 				void *data)
+{
+	struct pinfunction func = PINCTRL_PINFUNCTION(name, groups, ngroups);
+
+	return pinmux_generic_add_pinfunction(pctldev, &func, data);
+}
+EXPORT_SYMBOL_GPL(pinmux_generic_add_function);
+
+/**
+ * pinmux_generic_add_pinfunction() - adds a function group
+ * @pctldev: pin controller device
+ * @func: pinfunction structure describing the function group
+ * @data: pin controller driver specific data
+ */
+int pinmux_generic_add_pinfunction(struct pinctrl_dev *pctldev,
+				   const struct pinfunction *func, void *data)
 {
 	struct function_desc *function;
 	int selector, error;
 
-	if (!name)
-		return -EINVAL;
-
-	selector = pinmux_func_name_to_selector(pctldev, name);
+	selector = pinmux_func_name_to_selector(pctldev, func->name);
 	if (selector >= 0)
 		return selector;
 
@@ -893,7 +905,7 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 	if (!function)
 		return -ENOMEM;
 
-	function->func = PINCTRL_PINFUNCTION(name, groups, ngroups);
+	function->func = *func;
 	function->data = data;
 
 	error = radix_tree_insert(&pctldev->pin_function_tree, selector, function);
@@ -904,7 +916,7 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 
 	return selector;
 }
-EXPORT_SYMBOL_GPL(pinmux_generic_add_function);
+EXPORT_SYMBOL_GPL(pinmux_generic_add_pinfunction);
 
 /**
  * pinmux_generic_remove_function() - removes a numbered function
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 5c039fd09f7474b4c104d3c36e0e8b8dc73a2ddd..bdb5be1a636ead9695410824b5557937c5baa89a 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -161,6 +161,9 @@ int pinmux_generic_add_function(struct pinctrl_dev *pctldev,
 				unsigned int const ngroups,
 				void *data);
 
+int pinmux_generic_add_pinfunction(struct pinctrl_dev *pctldev,
+				   const struct pinfunction *func, void *data);
+
 int pinmux_generic_remove_function(struct pinctrl_dev *pctldev,
 				   unsigned int selector);
 

-- 
2.48.1


