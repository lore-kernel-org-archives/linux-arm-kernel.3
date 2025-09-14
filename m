Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6CCCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 17:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJ9ovkCr6DqOwPekQL9mbbfb8pXGwCeM0TnyH7IdLxU=; b=Z8n23pZd8VIYufZ1oFtqMMq6O/
	U8bbrgbGnN7B7ZZINs+lWN+vxx56gKD7LxK2/dvdDlKxDglmHSalmYkk8RiRDroNXPE6Uz+11JHvQ
	IBcRyRJHCzCcTUo7OUanuo/AegTjAHzrx+1iF0BS+7JI1eOE+thQHa82RE+tz6wYQ2qYRAjppYLTo
	SOcX+LlOd0wOeFuKGgbT4AxBzc835k9R2Djm0SvGJjy0J2XHskCR6+ogQZ1XsK+YdjfhtEID86EQc
	o3zRwjcUBfjfsXJ9Kw0RBgF+FBK11KqQcyUgVptOMQLxHx226p1ZeKUCQKq1eHWQu1Laayo0GZEqF
	NEj2xi5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxqL0-00000001udz-07G6;
	Sun, 14 Sep 2025 17:16:30 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxqKu-00000001uaN-2fK3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 17:16:25 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-620724883e6so6627091a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 10:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757870183; x=1758474983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJ9ovkCr6DqOwPekQL9mbbfb8pXGwCeM0TnyH7IdLxU=;
        b=Yzqr0dCc2ZFg9ra9b0c/THnz0raoK4HjG+rd5j2REXajAgBxGLNktwoitr2PwQtuc2
         WpepzTDeVbRKCvBCbI4dMaoWgqdvIZC81ZvhkGUp4ZXThPCph+dD1F8z7W16ozLARYY5
         5L2Ck8u5umm5+tEU6kh8YhizRu9rIjQGCxYGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757870183; x=1758474983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJ9ovkCr6DqOwPekQL9mbbfb8pXGwCeM0TnyH7IdLxU=;
        b=KyULPxxgT+bvvGDA7eOUS9pX8jC9P0Uz0Z3zd+u867258vYjXzAjOBmUgGcvM0RXVE
         5Jj9Ym0/O7ePl9DdLjlnguK2lCMUTVaCHXfndMkr0jzlijj8C4bvEMYGmXYfy0JQMIGT
         cjeIipzhu/LaSzNSDghPXTd94dme0uLAby6AxqFR1qAnUJ3H05U0AfeAfOjGrRVjfvoB
         pdqkXVFT0whSEuxsvPQbaF6Dy4hy7aG7VgLUdktBqnKoc14tb0rK49G/Ctfu0A2RdZ+t
         /DrNWY/IdoPln/utwVrMpQ/j9W6ducKnR4NuxkDyX8JDBOOmBk9y+1mh4PsiSl7ePha5
         WcDA==
X-Forwarded-Encrypted: i=1; AJvYcCXqUO0j3SasOPeAvLQF9fjd0yTq9wtYSRSIKJiyl6ERig3Lo5nbTNAbqVW5w/npHvhm2UtKdNx/dkZRvg7q3uCg@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl2pIHVfpsNx3FclVAUYXM2qpwwEWDKrbpMOnSWq4AnAS2togx
	Z8CYHdEnhJDTx8JbpSgwhc4tbbH1BmO43N8YkKbYgTxTp8pB9uHdLBrHXUFRdowsbfg=
X-Gm-Gg: ASbGnctiL+h3VpkR+Mwp1i12pFUG1JazDc1TBxH2M8CMpJb+0nGnh/+wMCucQOPqCyn
	2zsWntodn4dMPLlXawUybHvQk6Zj9wvFjgCBi7SFEwD1yqgqaCPN1tdwoiTkOvfcZfl5qUhoG65
	yBIU2CsOjoEJOSXuEI+o0ovYiOny4+JBp+ze4x7Gyj6ja/L5w1bIj/OmwaStv8/LW3acLEhXHNi
	EvyVvHjTsPcBiIyuBQ+xLIrUkdUMps5lt0ClnWUdP2VJ02MGq6gyNdIAeIlr4MPGLFVVuOFu1RQ
	+KDkfESTuS8b4KgxIY//+DsVMPLoigHr51jxb7q7pP7wvZ9zXdiMX+vT8bAKSMZn/S/zJIcyoJX
	u2Y0RRylxsWtAD/VLoo2UKsUYiurXPC7iN8+aRQZ8nyupSpUcQckAFK1Gdhp+B7cfF7DzvxhMQd
	K9GBkcKHqtaqq8+2fUxI8JxnJ0AjhUI4lzIk091x4bh9Oeu6OXfeCgXzySYz9HV+xw
X-Google-Smtp-Source: AGHT+IGvSuqYu1iID/ihliDiP5cWiNfNXKYVhuVRH/gmTXAOtDLlKa3rm5WJL/vzrHXGf7HRci4VUQ==
X-Received: by 2002:a05:6402:1d51:b0:628:62d0:fdaa with SMTP id 4fb4d7f45d1cf-62ed82c5a2dmr9785589a12.23.1757870182851;
        Sun, 14 Sep 2025 10:16:22 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b334e76dsm776980466b.102.2025.09.14.10.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 10:16:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 5/6] ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch threshold
Date: Sun, 14 Sep 2025 19:16:02 +0200
Message-ID: <20250914171608.1050401-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
References: <20250914171608.1050401-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_101624_686255_4901667D 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

This way the detected signal is valid only if it lasts longer than
62 µs, otherwise it is not sampled.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
index 279d46c22cd7..f12084d8f2a0 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
@@ -154,6 +154,7 @@ &tsc {
 	pinctrl-0 = <&pinctrl_tsc>;
 	measure-delay-time = <0x9ffff>;
 	pre-charge-time = <0xfff>;
+	touchscreen-glitch-threshold-ns = <62000>;
 	xnur-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
-- 
2.43.0


