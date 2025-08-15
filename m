Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71961CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 14:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAO2WeXDFkbtwkjKyd1xrqU98u0EGyjojmTyXcAuE7w=; b=dsU1NOaAAOn2VxJJb3H3u/kIqs
	gt6T0DNpNSbTNezQcbkd5teykqniwvSGsM9scNQbBXW52H7FjPwfVuJYTr9nh4zN94e8dSmdbPWBU
	qRiCQhZtRcwQQV34+DaBTz1qgH7jAqxRUHxn4GiMFriZYH5drGkUv+ou3TBdRdf6HpFRzquj+T17x
	rIFaCNz2Pm7+ukWzeoGxefPVDAqbZ/FM1St1eDOm3ILc4UtS/t2oUOzMD9pa03LLy9HTgSvjLRWp7
	hKpkFl7N8vyhzJqVmyOlTA5/2Y0ah37lNIDRaW2AyOm/xAzOKkHDkeBsTPm/11ZEr2oqDD8Naz57W
	HXGa9rfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umvrr-00000002mEf-09y6;
	Fri, 15 Aug 2025 14:57:19 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umqRS-0000000205K-3O4S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 09:09:44 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3b9e415a68fso1581129f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 02:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248981; x=1755853781; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAO2WeXDFkbtwkjKyd1xrqU98u0EGyjojmTyXcAuE7w=;
        b=kTyrWAK91Yr7tG/Ss8C86y2JDXtxWlYE9+ysRB40BBawOsnXIJ2S6E5fqmun30WI7W
         nQWJaCkTp+vOsL2KshX0168Vgla+WGu2FE8GBP/QWdjfoyp6msaE7BxfuHx5UcVrTlae
         /BSALdpshC2cG9pICRagP+zrIBIXucn7xwlaXWrlr1QZ7Xut9v0LLdv7kFID7+F4w514
         pFfNfZ3T5WtxYaPZcRAOaRLvLKTPcONF2U9UZT0jvIPVyRZNJEXCsk6IoNJe7erlDX2w
         a6eZb+Zi6Qu3E3Jr68FdSK6WUo65Z0hQgfAXex0SoPmBh6M7ufdeCtOxfAuOdqKSgWf1
         O3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248981; x=1755853781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAO2WeXDFkbtwkjKyd1xrqU98u0EGyjojmTyXcAuE7w=;
        b=s6gCi+1/264vqJVHgHoeGVWyqcBcONH7Q8dEkc2O9348A8vOMB+WX67EJi4X+AaqKp
         JzmXVLkTR2c93MWqRKxj7u+W+dLmZ9lwOW5pWLisGt0zY+nJ4FNQUG96qNsdp7Wwi08S
         cBDNq7Hc0TX4JOsSLMlC34BMvg6xlpNKZOX5CFCOhA90p98DiZXVNF0OAxet0xG+ti3F
         nM1tMbLaR+zCiwfqOLv/fkc9sJLyXGTqkxrteJ0GCOiRsqiVN6jzotFu6RhTpTbGV5E9
         tM4ZJ6ud/OnDmmwYuAW159AVozYpZ+tif9da9eDH0xAxhToCMLYPwaCe0lNr6Mipgvli
         J14g==
X-Forwarded-Encrypted: i=1; AJvYcCUYcKP4jfbC5MqQroAvqO4PE7UmOOEGAUtmVw6+xlIggEw9TLkzwsr3/eJA6NmgX52idsRVajJHhM4rHNYW6zIv@lists.infradead.org
X-Gm-Message-State: AOJu0YwLnRrOnwt5VUs1yTQY45sV4eI3zDnPpIw3dKoNfi+/izQmybTR
	xUPy3499+EO6vluMXsFHl6wcyr2gH8Lc13p/6LZlaecF9w7huHajnEyWqSb9ObjLdiU=
X-Gm-Gg: ASbGncux/dZwmscXlJQf4E1XTdDAS6cBh0QyCu2tt1igb3K84rSBepFzDujXy8cQE1W
	/Y7x8TuEEPiM4zQgBWptPoC6DnmqpN4QDnmXVQLpCb9niUaDltjxRNHWeUTNVEJjVkMEGb59r3H
	RWhvXmpDeKRmmIfan3nRV6esUPJwrQoJmgtl3u6L8jYQQ2555GzTGItXKrqPUFTq6pvDn24fsge
	dfN/hvIsMS9KNHX4aNZSpT7mg4KfG2IRiqcBZ8ZH50YnabEkWpVZJwXXJWfnjWA4wdmG+LhlCev
	ltHxFhIREKMC4byTDNS85GckDOdzl0GvuUqQ+6E8X5zaHcF1OSwp+PmLDLlYSyJb/gDO07muYi1
	dR03FYSZ+WRVhfuEsQw==
X-Google-Smtp-Source: AGHT+IH6u9qd88jYtkMUMO7Pk2wdt7IioAAqpR67Wlnaqpb4Xq5KR98LGHT/fAn80hsOAq7ogVV7XQ==
X-Received: by 2002:a05:6000:3108:b0:3b8:d8cc:dcf3 with SMTP id ffacd0b85a97d-3bb68921b21mr916109f8f.29.1755248981350;
        Fri, 15 Aug 2025 02:09:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:17 +0200
Subject: [PATCH v5 15/15] pinctrl: qcom: make the pinmuxing strict
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-15-955de9fd91db@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=M6AAfE1ZYIqFZsBoDZ4O1bJllvK/6bMXFJ6Zryc+i/E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk6E0B63uoFwvdNfdM6shEMGyPseEvOlsf0/
 xE/Q7RcUMmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75OgAKCRARpy6gFHHX
 cgUiEADKwU+j0rwTCMMo4gp+q9WJ8f3aBc4TC+eTJd7Rb68K/vvR8mQoOObnc5vYp4f1bGS5hjx
 nhb+kFiHt9322cnLeohSt3ZOFPCzHPEj2QRLHCoHJ/Z//LaWVcxvSNu/k5B0wuFON9igEj3HZnu
 cpu9eGKkr2mIAfESMNu2yXlUPQB5vXtiZ9y0GkHRefEdE18uLI39sKYfWLR/ZeMGcUUp86JjYUr
 2BJ39RDdZCMbvLjh8df1T6RwANJSK2q7RbAnM1uvo7hUhvPnQYiTe8yo4a3aELWbv/TVbD9jT8K
 ZXGeUzH85xQKEQ0JTjzReXrxA748Oyq3uLoLuL1GzHqTkRiMnu18+BBTvaCr3u4TB8SVgkbF6Ls
 AUXyGIRAk5hGTn6lf6aeYN+NrvwvlvPtCtdN8ZTpi6p4GT0PfS0o1QOMVO8X0DrcDLo6nilrVyp
 GKZ4vywviTy/wxChO1vznkIdtfA5ylI00rp9tKrccz4rpnda311StQvjVC9o1Py9DeKtv0cGGh9
 SJ4Mcj0suKefpRxOr8UWj05HldOdGpacP8CC7eTEE6LPapXVPDfkem2wLu4/01B+kl8N2cVPOdn
 io4s9PHmIyv1eMTsFNfIOUPPLb+j7PMBFXlGzqUadBKgYD6NcwP8wBOIeXNI5r7bkDQb8eF19oG
 qT+jLfULiytDlBw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_020942_874100_FFEB8B23 
X-CRM114-Status: GOOD (  12.43  )
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

The strict flag in struct pinmux_ops disallows the usage of the same pin
as a GPIO and for another function. Without it, a rouge user-space
process with enough privileges (or even a buggy driver) can request a
used pin as GPIO and drive it, potentially confusing devices or even
crashing the system. Set it globally for all pinctrl-msm users.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index a5f69464827119dfe2a7781b558094b283fca215..1751d838ce95d6138c824b90098f74891dec7656 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -268,6 +268,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.function_is_gpio	= pinmux_generic_function_is_gpio,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
+	.strict			= true,
 };
 
 static int msm_config_reg(struct msm_pinctrl *pctrl,

-- 
2.48.1


