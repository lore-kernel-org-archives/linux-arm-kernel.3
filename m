Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4006CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 14:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=; b=pkanh7aS390zmYccJ44/QS/XWW
	9ba4nEi6VX6XBKElkSvnZipKUUnoUzYTP5492gyeWTAWDFacPNHqoXKxBOdD0ZRsdj+khSXnYwKvz
	ijOcOuVRvWQcF441yF5K3B7MkKYEVt+NwtPghcLISdA+dqraS/1PCIElgBlaUW8/9TUaYNh+RHncm
	OR+MUaLe+gtfSyzd5zPFVXAtrOVRNTh2n2k+7qfNLCcZ+UR3+MFkFYnJfvGrYiAq1CyyOtO0nSw+2
	VktW4Gx4Fvzxe58AL3iz6KyrLBUBC3HoAWJ1/ZwpB1PIBkWbNqo3QN+4hkPdu7/v5vrgU4ibMtfws
	+rJP8GdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvmn-00000002lqq-1E6w;
	Fri, 15 Aug 2025 14:52:05 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqRP-0000000203T-2Sc8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:09:40 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3b9a342e8ffso1267809f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 02:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248978; x=1755853778; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=;
        b=ahgqli+MgV6RhNoWgmai7LTo95R6UzoZRip71QrfqUGvqZTDu6KXll6JtghstLue6m
         1zM7t35PCvikf1iz2TH5WSd/0oTmgd9c82Mfh510LLp9BtzbKASNSMm1ZujkJdm+cipk
         g0zLZcxyF8cGwt7/2d48sfWo72laob6Tov2FF3iUlf6ks4E1Orrpd1h61HRPC0h/k4OT
         twV/tURQAIz7t1C20xVH+6Ro/K7wzWw+BKQLk+RjJ1arZ+daX5n+Ba3v9YPqblONUmhF
         d0D9dceDr7kBetn6BsFJdEmZTW1o/JPxCL5Wrt3CSbBTewWBCUGqzp03XcQMI1D2L78v
         iksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248978; x=1755853778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JThKrLTPuFVwzCwJhKd4fJmIEtCxHnGrNzSYzGU4KrU=;
        b=lxOUwXTCqzEh1Yv88iXqk0PRx52l003AdGfaOTfkj3lY+7+ksyg0Y9253s0Jd9R8Jy
         5wuWyGwet5CO1LChBmtOJBq/2HQD0E4jPBzszAFE1CQ1r1gCqz57OvtkFomibJJ+aDa3
         mLoE1+3IRkMDeLlHLc8/5MAWVPEUbE7/iXhifZiwVXnUhagb1/v4uGfn+Pr60nWRq2+v
         t3liHQW57oSWRkj6JzlcLI3883/SJBD258Zdw5NiPDBLHn0hfEgsT2htjvaQpkaFBIej
         UwzaHp4lXOJx2c6yAyxrIc69kJnBWy74YnQBDQtI0UL8lQEDumhtAaSDzjqeiBigdzPW
         eJ4w==
X-Forwarded-Encrypted: i=1; AJvYcCUGyGOz8BeLdraDt1Y+mPX1MakmHcvTJxXNw0C2bQhWQqZeZ0me5b7RDmL7zB2VB+Aftr2X7yYKW58raju0tpre@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6B8rwLVbqu7wLPBFgZRO9+CkouOFy+FQN5JGWH7PNbGox3vrk
	olwPXSvfxJrTQnVpbVaqEaRcdyJoMISg0Sk+tzmVNjvPyKGKR99iqYPoOdsdG0Dkbts=
X-Gm-Gg: ASbGncsngqTR0CJNH0BMZh8zSATO8chxotilFnpcjUWVaj1QSiTBpYFSTMSCfhuxfMl
	qoP8iufSHC6SLW+gOl3joFk2riLpxLklBXjDAhdVQFD1qa137I5XddAkcG3/Li0e4SdskMT7LbD
	KF6+ejAWusPyeoyT1OhJW+Do3FDOSvV/ztooM6Fpz3pi97X+wxRmGRuuNxUuW0XBaSsnRcKoYRD
	4/Uv600ov1vDIwTj6bWSdpZ7Tq/gzDEOTQmsDmDEmoJxa7DAZXt4Ivo/akyMQIL9OzCDELUd2dU
	Ni6qr4cpwfMfQlhMTQahX8rPcsrKQVBUnNHAJjnqD5LHSEsEuex2c1ZFe+Roc5WS9MeewAdhIrR
	o/X7NPA+AeoAjb1hBgA==
X-Google-Smtp-Source: AGHT+IG6tpzUVovgoQkKFLGI9UZEr33h0FppCamYKXGjED9LEMcOygc6BNR53lxBsyNw3EXRvTetsA==
X-Received: by 2002:a05:6000:4007:b0:3b7:8071:f902 with SMTP id ffacd0b85a97d-3bb4c5b80bcmr1159773f8f.13.1755248978027;
        Fri, 15 Aug 2025 02:09:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:15 +0200
Subject: [PATCH v5 13/15] pinctrl: qcom: add infrastructure for marking pin
 functions as GPIOs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-13-955de9fd91db@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1TtCXH0c1SnNyHC+v6gZsytFHMfkLN/q6H3Fm9nBNlI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk5msNNj4Ca68fb7+G6bZ73KBx3fzutVpC0Z
 9VENfY/MhyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75OQAKCRARpy6gFHHX
 cqCREAC7WpcFRL2Sb/Hk+HNXVI+dbXjLvxVLapxOlsBcpesaDrR/NahYb6p/G62D/kWHKA2KVii
 lU/tMlPBnJHukaRydH6794HwaY5/+/S9wFa5rDdnOyj2dBp6a9S3jbED/+o43IIUf+rOrPuqibD
 NVr66kEWQYaOLX/t81nHetyX+Dd+P/d++xBXan8oWhwtXd9zHLda05S+jw/RrBxcx3fSK6UTtD7
 dNW9MUo9bAY1tlkU51qsjDfW+eRq5dAzdNdeURgAreCH162KFT+bIIAZQtswc6RS1AsC5M1kj6o
 S9cX5AF5K0XMaIorq5coITsfpWq/OxWi4L4P1TMTB6ctqiL01wOF/z3BSefdpr0MjAr5GsnAf/y
 LqKsz5hniCLTvZjgU1Ayvwq8usXkT8xaUY2zb9GfGdgGgmBRJSoleQR4XHmpHYNi5542R1lj46O
 y4qPwttgalxFYhy/FBpTsvlflTrGhicrlq+7hSDpjlvSXR6CYWn1w7gkVRb1cuHFR+Xj0BNYXvG
 A4i7Og4mKksF2x88F+5NOrW5SRklexTs4SBPGNo8Rz5cp+tYslwZmceoum3xCfLAbf0CVyMRym/
 +eQd0GP5pUkNj2Jtjub8fvLlUFd542dMVBls5yK0Vw2zFC/nKbLCz36IRltDZCXJlsYgs5j0tVX
 dAwrcGCy/BjpcWA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020939_620373_0E1AD49E 
X-CRM114-Status: GOOD (  13.06  )
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

Add a helper macro that wraps PINCTRL_GPIO_PINFUNCTION() for pinctrl-msm
pin functions and assign the .function_is_gpio() callback in pinmux_ops.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 drivers/pinctrl/qcom/pinctrl-msm.h | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 96e40c2342bdedb8857629e503897f171a80e579..a5f69464827119dfe2a7781b558094b283fca215 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -265,6 +265,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.get_functions_count	= pinmux_generic_get_function_count,
 	.get_function_name	= pinmux_generic_get_function_name,
 	.get_function_groups	= pinmux_generic_get_function_groups,
+	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
 };
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index d7dc0947bb161868c8f433dc2536719b8afc8bd8..4625fa5320a95a4d24e3a0c98a249e4f163dd4c7 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -29,6 +29,11 @@ struct pinctrl_pin_desc;
 					fname##_groups,		\
 					ARRAY_SIZE(fname##_groups))
 
+#define MSM_GPIO_PIN_FUNCTION(fname)				\
+	[msm_mux_##fname] = PINCTRL_GPIO_PINFUNCTION(#fname,	\
+					fname##_groups,		\
+					ARRAY_SIZE(fname##_groups))
+
 #define QCA_PIN_FUNCTION(fname)					\
 	[qca_mux_##fname] = PINCTRL_PINFUNCTION(#fname,		\
 					fname##_groups,		\

-- 
2.48.1


