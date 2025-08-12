Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E827CA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jAO2WeXDFkbtwkjKyd1xrqU98u0EGyjojmTyXcAuE7w=; b=Ifct6XFZkLMHPgBWdyruhMPcbv
	qXhrT5a85ZX9bqbyh0/rGaPme2nZjQTtHJ8mvWPVnBJGqyYH17102PjowemPeaPUOdyHOGlT2ZqMD
	57SYavmFnfXYp0yqGEdMawZ4OnTon7Q8Y52fUCWh+Cj3iJNs60oQWVzO+koRnu0yjvMbJti8x6tv9
	0SmYzmmV4YnRqiae0/NxQHDd2/H89etjlSEvqIFb8J+TPnpjZAh6gfnJsytfS+ieNmGInpEtpQRw1
	j6fEEzxAxAvzqGo4rxn+weBpT37mDPYYvMTh9J6+06OUwRaUs0pDjrwxiyxcPCdF+OFdOqRb2LLCx
	rXdyIxUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloFg-0000000AjFC-2M3c;
	Tue, 12 Aug 2025 12:37:16 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkM3-0000000AEqM-1Wi7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:27:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-458baf449cbso50042245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987254; x=1755592054; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAO2WeXDFkbtwkjKyd1xrqU98u0EGyjojmTyXcAuE7w=;
        b=xC5tUxC+pNgCw00JmbxPi9K38b1AOmTTCnEkA57ymsU/bMbbjs0HB9wuwqat5X+3Ri
         75gc7smyX5/CgUwHvyP57ordy9BFfBcOquMz1alf42JRBQHDbV6hJg0X/67ycISA19WB
         J7lLt56yN2TyxvZVEGEaQIkEA0GEE5xXIXddS/q/tvnPzvlIzi0FwxFmuM5coFZq3wq/
         KnzFFqrb0SuUD8TB/caoPd+KIELJgmitrmzWshnyXE2nSBBKhVNRciEMJnP96QlrocE+
         66od21pw7pXN1H6mcgs/MfHcMMOzAA+RMSXO8XQm4mVwp3LDXASECRD8B+Nqe49IxQWa
         I0Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987254; x=1755592054;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAO2WeXDFkbtwkjKyd1xrqU98u0EGyjojmTyXcAuE7w=;
        b=fK7K81u1TosQvdCMmaFx4OuSip98PuBzu5CISrml9xnFWF4nd/P331eTlX+lezbPFc
         SzNhvFLbcEEQ9O306YvowzV9ps41jYmj7n7ZAhqg40Apd3FYR0lxqN5i3KD3MYJGiDq6
         OkmAcT7VVfGPCgP+GHL4YrVTSxP59JdmaJgW1avk5+wIAYrSfnHkkMy4V9ZMsbmRpK+A
         /AdSiPxRwPwli0XGj+Uw7pLL3TWU9UJ5+YHg6czdHCTUFHc4TICwhsTpc90Ha2HE8VsG
         uVUNLFWtfRDYmFdMNJ4btPQNztCtwN8m+8DvZkWvMwmW9NY2GO+G6JtoQXUEmkbOGtz9
         p3sg==
X-Forwarded-Encrypted: i=1; AJvYcCV1Fb4X58rghkMidsn6MHAUrF/af0lLtyL0Byw1YNW4ebI83DPNFjj2bu1aTCSL7u4aurnZ+grU78RR2WJCqzgh@lists.infradead.org
X-Gm-Message-State: AOJu0YyQEGv+jF5hHhPG7Frl2D4OkB5yQeoqPKDtN4WNp2Fy/1yhmwwT
	dRC8eaVtwchHKyctbm3DgDrSKeGt52DSk/p6BZRiX5yGZYvvCH3Wip86yiutIRIXvgw=
X-Gm-Gg: ASbGncuubwriTTO+On7jJP5jWZE2EW4mwuwtHerCrH/SpYFZLX0Q3034EfRw1b1GBHX
	nPvq8BXT8pS5HdLkBMAytBNACGUAjih2X4M+kptUINHl7HFyxRmjDa/Hr2gB4aYFyXmT4BTxOGl
	Xs16I4ibLEAf+OC7s/x1B+tv3lNomthc7k0dcdU8D2nTyytJQvhUFCjtVgHISRC04dD6VnGlbH+
	YXmUxUFlwcfGcRlQLI49e5Kd+39oCwkkvrQLQw0pItY+IbAaT//480yDgoTgdpAFumju+nYIBSy
	+MFR1BOheWeVUV3LKz938zDq0AKM8yONkROKzec8KIL1E1+dwdAdbzspJe3dZpRGg7RY8H7HBQX
	nvlA6Px0B0EdrJak=
X-Google-Smtp-Source: AGHT+IEIkGK210eX4oaAWTvIndQdBKgODaVv89WdHuLZ5yZCYfAUy5DwGLKFKR8W9EpKo9YtXUOSDA==
X-Received: by 2002:a05:6000:2501:b0:3b7:7904:58e1 with SMTP id ffacd0b85a97d-3b910fd9b5bmr1926776f8f.18.1754987253948;
        Tue, 12 Aug 2025 01:27:33 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:14 +0200
Subject: [PATCH v4 15/15] pinctrl: qcom: make the pinmuxing strict
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-15-bb3906c55e64@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1142;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=M6AAfE1ZYIqFZsBoDZ4O1bJllvK/6bMXFJ6Zryc+i/E=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrZaBmeISpiHCVh1NKR4JJvKfvoR7+4TGM34
 qACMSZiq0aJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr62QAKCRARpy6gFHHX
 ci+8EACxohGvZiGTBr0Y9QxyJzsEN0JDEuMPPP2/XSq+kOTHcKkmHErEtvBcohO7KLJzJuDM92q
 Iw3+IzM052WTxd4daM2zpMgweo/2dwzZfR5YEUer3WEroEGm+Bj1fVPmMiit7p1Urk63XsoIjrL
 iIqOXmtlteGyRTKCzz3k/xmfTyEyU7VBHczMECuT5uEu155Bu8nJCumD+wzbe8mmIlfgHaOMDUI
 EhNzoSXVeYCY0FHD/wqktUBCPUxVj3EGM965wJpVDJiroVIyzBPsjcH9gW4ZMI3gsrpLkKSn7/b
 B1DQKX5Md99KuFnktDMJfMeRA9VTUveqdFKrzKWO4O1PCOiNZYTlwh/00gXu8zMpM4AK1/xeHy6
 xv2CMDqxOQQE9pNYsgFWdMK5+GZYlQTAYrjZncSo6RYTzLN9weKlo0cKuhBe3wUVAZQntaTYy8i
 k/Zxwl8sT/axdwTsi8ewRtM0DJYHR7QWCXofS6dAiEDIgSKdzkZJ4mIec2cmwKInyd1Ja38qeyo
 BaUmY5FfX7ADJQDEVQD8b/C/oeUP+bk/MkxTefH5hvrw5RZW6Rm5jF7NwkotqyJwbEKJFZVea+T
 cJiJ5bAYHdIENT0OWfDZvACcGaK8OCdLW3UJoLXH1IZbWn2imkJ1JInadg5ZknF41i/olNLfmrS
 vdUH6mCryqoAAIg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_012735_433207_6B0DAD4C 
X-CRM114-Status: GOOD (  13.08  )
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


