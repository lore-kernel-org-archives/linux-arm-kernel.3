Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAC0C531BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 09:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iHuLEbDSaZejT/beyJkVYabylDCBHHg7aam/fEkHqeg=; b=DNEoAMcV9MnHL3QGi4cJj/zrFW
	bbdnhZvdOMgScAU6qlNB1/T2WZuaoZStb/M5htNrYMyRChVJe3r+fUNJiPb8DthUrxbMifqgpHtgQ
	S4ANnbrvxtwyj28nIW8LY3OUUcTohb+JVjY8l+rGd8J/oq5UMcRD7kOpS9PMlNfK67nQVkXSbkOT2
	0UUAcf1RnNK40JFe3lR79kIvaKozVBhZMD9DhOUPUbOxB2QnrDtneH2EWm1FdTRSX73utFTZ4AIxY
	sqhwGuVAs/bBWVbZ1nzqxwBUayW/cDr/OeYRz/DKbqyOTTJAfeJ2CIa504XW0xi6cN6Tdd6Ck9GJy
	Hu6z9zPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTgg-0000000BT3L-2AMK;
	Wed, 22 Jul 2026 09:56:26 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTgW-0000000BSye-2Vs0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 09:56:17 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47f7027ca11so2641329f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 02:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784714175; x=1785318975; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iHuLEbDSaZejT/beyJkVYabylDCBHHg7aam/fEkHqeg=;
        b=CWaF8BmhUtChMclS83svsyRrgqMmjOKIHQa3Aipy2lNK7LbV2vNJ6pPP0asRXB1IQo
         TdRAqeHLDENJZA6r7A4s26Rdy9Hn9piZvpV4X/wCPwlld4mZDXTJONa1oWwOEYgh9FNH
         zdCmDAlfI+djnU0yH/MxaQ2n2RLRGcPdyJmTQh6AMeI27hix+Dxhq6xuxVsufERxGr3I
         Bt4rTv+dsQWqoaKJRrpo53wn6GgDywlRGsZKZsdqgaSZU7q+xm2JIDxLMrBESRNKVlUh
         pofREHGP1toKcM8kOXlC5uCFkXZqR3T0GMoBfA98JH9X9U5KbL93VBkXdlLyA+rMCehi
         pZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784714175; x=1785318975;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHuLEbDSaZejT/beyJkVYabylDCBHHg7aam/fEkHqeg=;
        b=G2i/PVJAGqGSsOJOw6ekcGvWu4x9i7guTj1IDOGwHW8qrU57r5U8EWYQu9jx/rtxGd
         FBxmYRQR2zXTniaroSh/IF9kuW5I1ugAKI6qKM+nA3LlP+Zo+iYeQZxHpa4v8HVlvafP
         a1t6Hq2XUOasOLAxC4XMvWpU41/+wBEAeuT9/lBKhBbESCHhJ7AyuhAT2hv3lTSlQium
         13I4zyfhrLLVVU1BOZAJBusGv9YI6L0eWhst8jVx7WTC2qZnJI/UObclh9PwqzHJSPeK
         HRL1CTGV6gJaF40vsbjTurjoEAY6xNvo53FayGen6my48t/+NSRxitK6x8ewyNkCbceT
         953g==
X-Forwarded-Encrypted: i=1; AHgh+RqBeKePMQ3BrAphh7x0BNNZvDl588/CUSANBxJS9oh/E2Rg1yZUbCA7nMpL9yqFLHSKd33DKb3LAWkdq16uLhlk@lists.infradead.org
X-Gm-Message-State: AOJu0YxQWhUAX+hYp4VxhLMAUNMfE5ANoc1V0idQ/uBO5VPatltOjgBh
	HHJcsGqXAopEI2T9RPzBwBLhRrpbzJoO55zzFe87d8WbKL5oCDrmDxSF0mFD7tLt59U=
X-Gm-Gg: AR+sD105qdi6QM6JrB0+QOaGucjrPj3+XsJWcGmiuNGTujzmdLmBmP5vShO+tsmo7kG
	L78MLnUFyPrTqG5Da4rxCW8TDN0eSsaLNRh3TEBMmyNFL4BEuExHtUKC+VRdT4KVe6QeaOQqNnq
	J//pcXRxQW2RvhfUDy4RppYqUgRMzEAt6L0WQf7UKX3evFLLJSWGEXbqvUwlCgDAE2eR/3G8fdj
	TBJ2yHQrklaf3wMnzoh5h139nIAR57Ky9NYNOa7lBfeHkPddxJt8W1IASU0Skd024EwlSDz5nxb
	zgHRTe8tVnqAY+vZHJlsFA8jy5aJO2lSvrMEztvhPvBpV87KxvWvNsE3atQLXSSV0EUBjY9qk5S
	6QUDI1R636iPyE6jSFSbepHNN6CjPu0/3V70Yg6Udfq8ch5ZI/ZGF6LTKbXR9C0pV6bAuTl24Xt
	x3RYOA9ed2U8h4ubzB6XUrH/IEgiB27OAq5Q==
X-Received: by 2002:a7b:c054:0:b0:495:5172:661f with SMTP id 5b1f17b1804b1-49551726896mr145313155e9.19.1784714174726;
        Wed, 22 Jul 2026 02:56:14 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:314c:4601:ea7:d5d4:79db:6d52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c532d4sm4414533f8f.22.2026.07.22.02.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:56:14 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 22 Jul 2026 10:55:56 +0100
Subject: [PATCH v2 5/5] arm64: defconfig: enable Tensor G5 SoC family
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-contrib-pg-pixel10-initial-dts-v2-5-3abae9717feb@linaro.org>
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
In-Reply-To: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-serial@vger.kernel.org, soc@lists.linux.dev, 
 Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
 RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
 William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=677;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=oIzmlAN/xUiGauIafN2ymeVSPRAXQ0H9cGKuE1HfPGQ=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqYJO3DxirCREaSZRzg4By9L4oe1J/cKMZY4ZRt
 ZPqiKTOSPuJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCamCTtwAKCRDO6LjWAjRy
 utGoD/sGLlwsGbwkdHEoU3rAfAkSpRk76WlD1svFDSQzLco2bqGuiTMl95XleeZ8dmzd096IdtW
 H30hsxlgxBJYlta1JVJ9bJ6Pr4QZdcqUozZHu014CLJPwbUgN05bdvIPEo1PPWzxmqU5Gh1nwtS
 MRQWy4EGtgrITrtH/nFixj/0hyF8ybyszDS7TXB+pJm8PJO0zpKs5afVVF2laknXV/aIwGCtl35
 IrUkDWIFLztAUmtjRgQ48VRHKgUoKVaGpyh2BKm9DfBDWwBn+wkHL+ReniPyQZ/ilLOx1XvjhnV
 7NofygNm8k8wD1uUtqLpWjZyhLipwz9A2eRG9r8wz2y1zfcNxnHb1yBtIYGbwQGGzE8aY2z+3rn
 gfTc/LZywh1O7NMTE0Wgn9tdfHTJCQSqN1l1GR4bL6eZzIZB2WJu6LMVkaaPsTLRRWF04i1ScrG
 UCLELmalD5o44hHK0IRMwgbCgo3gZqGtTSTCDWuLX+vZArU/FJ97qZ73VJUkUmWpHPg2ZTNuwyp
 IhNuRKnMPh66HGyXCx34fj76bLz8dm8zeQeSKWLl9GbpVKU1/fBilq5BoSsG/wiQ/ianK2TNYkZ
 fVXm4MVq//TvqkvYyLr8o8co/LJT81FTfF5gRCU9Vm0hAwz0zG81Q/shtwCJa1ZzyOAhK0Ei0/9
 WKg+qry3+sd1fyw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_025616_658914_FD172B84 
X-CRM114-Status: GOOD (  11.68  )
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

Enable the Google Tensor G5 (Laguna) SoC family in the arm64
defconfig. This SoC family is found in Pixel 10 and later phones.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f4dfd0cc853c..930a4f27ee56 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -50,6 +50,7 @@ CONFIG_ARCH_BLAIZE=y
 CONFIG_ARCH_BST=y
 CONFIG_ARCH_CIX=y
 CONFIG_ARCH_EXYNOS=y
+CONFIG_ARCH_GOOGLE=y
 CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y
 CONFIG_ARCH_LG1K=y

-- 
2.55.0.229.g6434b31f56-goog


