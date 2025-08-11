Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03602CA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 17:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LvvYWX4uUCJA11NdZsypviiNiCsCxuB8xCdKgutIRlc=; b=Wk9oibs+iUekmPFe5PgZybHntc
	1tiyHWyPpiKFedXwR3dKz9h0iYo6EnrTLNVN+JtRcxAoyzHOcVncLFH8IItDknB+lvvduxYpzSOo6
	9wsyVoa7rjMWEo06hhsPUIaIxZFWurb3yqOirf1am/Yw0zapDTPl9V1jU0wa8BLaSoKqolm5jEBG/
	Mjj1HEBcATMzeO5wLfdvTh/q+qryGON92yAOhwefACC1FYPW+kBXJlPD2LFz1fFZGzaPy28Bj+fDM
	k5ofTx0jGc0VDjiKn2N/jW7NyhbE0EBNIJ9RjlLM6l6IHGJGlfNAo5iqKR12/+nXOK106HLzUHwLv
	DYQxmBXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulVt4-00000008UQJ-2Eij;
	Mon, 11 Aug 2025 17:00:42 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTlw-000000084zM-3G9Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 14:45:13 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6157ed5dc51so6748634a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 07:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754923511; x=1755528311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvvYWX4uUCJA11NdZsypviiNiCsCxuB8xCdKgutIRlc=;
        b=b35xfiYX8wvIZl0VwXfXttRDnmRY3BDYILRCz6++FdWKYOd1K76Eu8oK79Oo3BmB7n
         gXGEDnOrJ4kkVCE116xm4Snghcwh42XMyQdBazepJK7DqAeOCPXJKBk7TH/ijxJ6vh7q
         C9hxhKYBKIUUK4ls1115/kak+/M5J30dwPIXmUi5a21zZMJ8veEBMbTrcluKAmYIdhEb
         Tg8hW/UjV+gX9flcRW7LE575ZAUb/+CjPoprA8pHA4qYYTRi9ScZSBCdq96DsQVsDgfF
         64QcgSzcZ+upZxXbKkJ3e9e2n6hkN8+PvcYobXirKqdG355F9SpLOQamFxaNnTGM032B
         Q4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754923511; x=1755528311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvvYWX4uUCJA11NdZsypviiNiCsCxuB8xCdKgutIRlc=;
        b=OXFUY8COs3+nsDwpXfoh/l95pZLda4t+AVf9wy2M8pdr1Q1all/LQgZYwcmwZFRA8Q
         9RTu7i6OxM67To785JTnIS94KiTuSd46ZagJ39ElUlTxh+bD8NBeu8qo5+TJwlQHEIyP
         mFJmDTKIoEflM1XkHP+PELgnigwqFsZK2Uc6PVPnl9QbBypMJJghwTrW8IiztUzXU/vi
         /OUx/jgf6sJy6HnDutJXi+idZmedt2rdCZAFS7FN9QgvZhzJxXuH8ywwc7ZPWFY0qL8W
         I4B3JsYUOeayqeTllTcxLI0aUOaeAfgTNLLh4clRn9hKwCMQnV5A6D+E8i+HAvYfS+tz
         yBBg==
X-Forwarded-Encrypted: i=1; AJvYcCWW1Bzdr3kxavSD24iySER6jyIEjiDYsKktD8al+LYqFAWlWCcTNDCJ0vRPqq7jO3lBoqUxc6g18W/bVKlgu6yD@lists.infradead.org
X-Gm-Message-State: AOJu0YyRck/r/QYF+vbTcrT/H9iCH4QZ5qPmbEecjZyx98pywWXJXKnW
	I2guV52qnoO2jD5B9sQqqyK+mowUQZQsvlm3CQboUNW+2FTJRuIzpNEBQL7xVerDEfA=
X-Gm-Gg: ASbGncusRNmXX5EvkdPqOOty1U49gjZs6o9MciRdrIj6PTalVisnwE+r0AeOV6p0a8S
	DDBURMrNe493ZQdyQXhStOHuy1PvnT6PF2qXwEz3HxDVl1ynrO4gNowvxf2V6ns8zUEcQW9+Wmh
	/BA5L4DLAe1qGHnd2gQR4zQZCQn/cPKUMD3H5dWtgQ4p6ezgIP6B6e/bCJ846nNWzVsMBIYfnL1
	sIhaOmsWQmFpqoS8XkzTwIr8GPjwpXUWXKgyR+6wz0gdJpYFwl2zkZC2YbhPZ3Mlosp6y0LUFsh
	CCLos7P3wX86m2EYVSNWXmW1F1o3o7DDyR20DVzVMx5614a14hjwlFH7doFZRSvct5/Kb2rS+QB
	K+UdW4I78P5D2yLfiFGZw+OmZY7RQ5wqdr/rxrGv19FCiX1KxMt3pYhL65TL/YGbGXQ==
X-Google-Smtp-Source: AGHT+IGIMsN/o17k+oKSTruxBNbnndkPTU0uiI+77stT/J27GNCFWaBwTt34E55lvek8PqTlJtXltg==
X-Received: by 2002:a17:907:26ca:b0:af9:5b3f:2dfc with SMTP id a640c23a62f3a-af9c6542d9amr1187895366b.47.1754923510770;
        Mon, 11 Aug 2025 07:45:10 -0700 (PDT)
Received: from localhost (host-79-44-170-80.retail.telecomitalia.it. [79.44.170.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af9965a8d17sm1042961066b.63.2025.08.11.07.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 07:45:10 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: linus.walleij@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	wahrenst@gmx.net,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	iivanov@suse.de,
	svarbanov@suse.de,
	mbrugger@suse.com,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Phil Elwell <phil@raspberrypi.com>
Cc: Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v3 3/3] arm64: defconfig: Enable BCM2712 on-chip pin controller driver
Date: Mon, 11 Aug 2025 16:46:53 +0200
Message-ID: <04c67a8fc50f2688fd3a6616bc03b3ac4d4977fb.1754922935.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1754922935.git.andrea.porta@suse.com>
References: <cover.1754922935.git.andrea.porta@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_074512_814599_BB772247 
X-CRM114-Status: GOOD (  10.27  )
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

Select the on-chip pin controller driver for BCM2712 SoC.

On RapsberryPi 5 devices it is primarily needed to operate the
bluetooth and WiFi devices, to configure the uSD interface
and the power button.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 58f87d09366c..fafcd7851eb2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -592,6 +592,7 @@ CONFIG_SPI_TEGRA114=m
 CONFIG_SPI_SPIDEV=m
 CONFIG_SPMI=y
 CONFIG_SPMI_MTK_PMIF=m
+CONFIG_PINCTRL_BRCMSTB=y
 CONFIG_PINCTRL_DA9062=m
 CONFIG_PINCTRL_MAX77620=y
 CONFIG_PINCTRL_RK805=m
-- 
2.35.3


