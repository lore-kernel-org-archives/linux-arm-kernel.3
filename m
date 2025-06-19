Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E79C7115E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 07:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xJ7WKC8SwlHWnkxUpPjJRL3c4L2d7RoKGqvzAae/doc=; b=12DSI4ZZB17/6JVvt6Iv/iOQoL
	Q1AJdarIEOqolDe8FqKil7Yc83bpOQPcb9K+wmqL75j0dLwF3FTV89v85QheoXkONGwDNWk8vDgBP
	ai/bURNHaJzL6i/X+l1P95QLC9bKOazvd2ZHynMAqL/nLzK85ANghJwde2FKN1YfiEy2uN+bDRAms
	3tf8YpYekA4gQqSPM+Krq2S/Ovrw/LsSVZRzkxJDjiW1U1bhKYT2ZuUxB1cVB+C8D+OQfjhLcWBFJ
	RdOK6dL8AXbkzhVdamdz4BzTocimEaND7PTCPMSvarss2hETjcVqtKekWPEO3ARBa+gt8V12qoAui
	x4oHqH3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSA1m-0000000CLik-3sbe;
	Thu, 19 Jun 2025 07:49:42 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9PX-0000000CGJu-2xFV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 07:10:13 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3a6cdc27438so127806f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 00:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750317010; x=1750921810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJ7WKC8SwlHWnkxUpPjJRL3c4L2d7RoKGqvzAae/doc=;
        b=ccImUzzWtHhF62dyFqr2IAtqtBd21NI3OYBGuQ/KPxrPk2t/64fvaRyrbeWaXWSNcO
         LN8yjpdRStPRUjjlmFcI34ieIiy5Se1AJo6HPGc8l5EqjmfHW8EOI2Iey8i1fnrQYZRY
         sSnq8mZNikePzpaWEfZmnXq/386fTSMeFn/PGL3tf/8jPYjgE/nENsi/hA66FwOHWaPj
         3QCcvqNWBDULjad5IMRnwwvOijohRTMP1l6sJj4+czDFULR2ORL69Ro638AIAASp0tf/
         aTa/CFm0onHo4vX6HaOnkq7SvP5MshT3yY6nYViH51te3g9HdnunQZTL8hTaEHwAlcZs
         EQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750317010; x=1750921810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJ7WKC8SwlHWnkxUpPjJRL3c4L2d7RoKGqvzAae/doc=;
        b=U+eRsoAY78bNGvCS6/fspvl+1imW4XRnV6Yn7nSTQdwXLefUWiTQpYt5g/yW9+XHqY
         FL2sU98CQS/JHHZLyQAFS/h5EWdiOGN0SwB+931Pc9jaTIZdF3hJOx766fdxXs5Pd6Dg
         TR9OI+EVK8Z5CJoLHtEeXm12eMU5O9GjkQVM8lGnBPyTRdDrTupkpshkfAGI4TzK2XwQ
         AhMkfqLgcHSX3wO0p1Hi//kDMaUhf6pcdKpz1oOXo6G/RtIdta3tpdkH0xFGd7TYfXFz
         M3LqiiWg8JV4LNxmeORLjz7BDIKuA03CekzhvWNLqXoqlZJPteSazPLRTONCyGp05feS
         mJsA==
X-Forwarded-Encrypted: i=1; AJvYcCXL2YIZ/ntDJioFV+0HoIhlJbYMw6PqqiULJr0fAJGS6GYy0K3+TLprm0SqQgt47vT1LGoOB1FEyGXi+mxF6S8U@lists.infradead.org
X-Gm-Message-State: AOJu0Yygs3JkRCX3aekKanxaBlMPz06hL4xgqvdr65wREiy7SOXrVJ20
	4SZpuN5F4n3U6EjRHE2Jt6QUIm4w8LUkIq7Ok3uZ3wt9okV3hS7t9xw9IRIq+mI2gQI=
X-Gm-Gg: ASbGncujlgvMCloNd8uT69nzdjsK3Va1D/ysMRfR/rmZws1H7EffmH0J38zOkNm1RUx
	Xm2CQiofkCDI0GbnemwudnCDuLUce0eNBfBQuX3pK42CYMKL9jH8Q0YmNyFpfQd/qBOMqGCPgKp
	h+EvEOEyBDxGkkAdVBgoPP3G1KIz2/LyRt7p4BDC1o2eLvaAumXaN7mJPmnMAQ1A/v9ytqIXfbf
	DELpG3d5qbGl5yc3eEPbLkQYYlp7fmH0QOE6G1HrLqggkU+anmbgZfEhceCtqhYc3Fls1HDUJlG
	Q9xg3NQjYg+UeRW9tk9hElg5rx9ehKWhS82cpleW5XGLozbJAcjwN80aMtYUCz0=
X-Google-Smtp-Source: AGHT+IHzP+i1T5dB4ay7/aTiSPYaINe2A3Zw6rt9PEf6xWeqmugHB7dSuPeuV0xJhfe2MdtyIcwRZQ==
X-Received: by 2002:a05:6000:1881:b0:3a4:e5fa:73f0 with SMTP id ffacd0b85a97d-3a572397846mr17415430f8f.20.1750317009976;
        Thu, 19 Jun 2025 00:10:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b628ecsm18982991f8f.92.2025.06.19.00.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:10:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?= <clement.legoffic@foss.st.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v5 0/9] Introduce HDP support for STM32MP platforms
Date: Thu, 19 Jun 2025 09:10:08 +0200
Message-ID: <175031700235.8154.11042956002137082224.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
References: <20250613-hdp-upstream-v5-0-6fd6f0dc527c@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_001011_834182_950A7CF3 
X-CRM114-Status: GOOD (  13.58  )
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


On Fri, 13 Jun 2025 12:14:11 +0200, Clément Le Goffic wrote:
> This patch series introduces the Hardware Debug Port (HDP) support for
> STM32MP platforms.
> 
> It includes updates to the mmio gpio driver, the addition of device tree
> bindings, the HDP driver, and updates to the device tree files for
> STM32MP13, STM32MP15,
> and STM32MP25 SoCs.
> The series also updates the MAINTAINERS file to include myself as the
> maintainer for the STM32 HDP driver and adds the necessary
> pinmux configurations for HDP pins on STM32MP157C-DK2 as example.
> 
> [...]

Applied, thanks!

[1/9] gpio: mmio: add BGPIOF_NO_INPUT flag for GPO gpiochip
      https://git.kernel.org/brgl/linux/c/deefc7083414de81aad102b60f0390f600d7eb79

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

