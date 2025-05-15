Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB57DC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 15:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLqMkFSPNEN1hS2qnrOzMpkhN6pHh1aoC/AzKLBLV/4=; b=1iatHEi//hMP4pldwoQG7FcQEj
	Vjbu2EPMGubSTOwm1lmzfKxQ7Ba7JhAz16we6LQtkjkcbalKCSRDXLBoVGTWevpv+Ie00c6EjRDpj
	qP4scOGnZtw7jRNalqKN4mdUdAj0w/Hqx2d37WIXPl3k3ODbwVXjkpXBgb8+jXJTMZf3BPVR3VOAZ
	IvQ4ciPyyMzvsTjnBiWsu7+xCfywhD1Lftx3eI+JNiS2RjZRB21mGGI1BPm+wHrSaIMBWQUgjSrDP
	qrXo9Uus/VX+6vdlZijljNMEBbKtpczWLUSn7uwXIpB2Q0LL8P9lDRM4KB2PmHRBoE5FcWxlMDBk+
	7GBK3dxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFa9x-00000001005-1fXH;
	Thu, 15 May 2025 15:06:09 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFa5b-00000000yvj-0q3L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 15:01:40 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43ede096d73so7648645e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 08:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747321297; x=1747926097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLqMkFSPNEN1hS2qnrOzMpkhN6pHh1aoC/AzKLBLV/4=;
        b=My8yzr9x09UeRACNNFu4HvX86YrX/mcN4SyZAXI3ZIMm1IulCgOHrO4d5vJmwL2MyT
         yf35EIkZZdTBKByiC4kp5KvAIA+jQZcrledEgTtxEEy0yofon+22aTSnsR1GC7WCY0CE
         wsg3+t++tNg0GRRNrDHYWfGQSQSp+hlRjCFRwhsN4nSxNT6hKL01A/VyMS5VuyhNiZif
         hzzm4iz9gNBYoQ6Ap4HoVBlIer0iiYc0+YpdPa6Io066Bq/c8yu9Dps98BKfeWrxp5Dj
         4NE+/l0e2E/+sR3RodgWNC+I3LKATrgmJpq7ihBQHe08UF9cgQ/Ou3NU1Re7ntEfzZhX
         I5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747321297; x=1747926097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLqMkFSPNEN1hS2qnrOzMpkhN6pHh1aoC/AzKLBLV/4=;
        b=fpJg/jIWR30wbTlZuD5gCtxOMmz81mQsfayzLbgLn/ZE9onl933LUJoCSIgq37Olx8
         6CdVEv3Ca41hisoIN06YiwrQNd2ISKESZwtIG47kfnu/K7wowXiv9DnZG+fuXRTX5dOw
         c5kTWKsuIkTwsLbV9fHZ5bIno83OxWweFI+qrGCKzWMZe36egClYZ5aMA9DB76Oa56AD
         +wu6d9tqPGC7N+dkRdeIl22mIV9OsiLAM9KF/qZ/IHAhDnAm4Of/5iQFVg0SNdKXwaWq
         JH5zGQsWZfa76W7RMZJVYyTkBfw6q+oGOESw3mdLjlWIhspBC778IzluQJwxQYJkp5f5
         cxew==
X-Forwarded-Encrypted: i=1; AJvYcCWmIKL0enrRcYtfI7h74iM7QBEtq94iJx72Z/2Qy355Nt1a2brJ6dB0qEP0Q6io+a0voR/Vtf7lb7cHICluBxxc@lists.infradead.org
X-Gm-Message-State: AOJu0YwMQ1gtlzLiKBQhnqTQ67Ax2qZPXTf3yoZ+dpEeljh5jg8brq1r
	/U1C0BTsEFfyBpjUbA3CpbiYSu5zcjEVWfLoNmbWGHBPzaTDYTS96k/RQKL4lsZ4joo=
X-Gm-Gg: ASbGncs5zq90zh9/hHGCOUY9MlWLbrhIT2kWszZkhWtoPAYCHH+sjnKenNtGCIFfk95
	VYsd5LhEHz1DrQsAG+FTDcqljn16bR/coQMS9XCQ6XQ57UmmdAlhDVVvAgU0F0fbRAUz4zneMMF
	WPW/IoFfPBlrvrMPyFVOaI/vW+mrkwdOaQu11TM2N2BkgbgHkaMFlqCd1Bks3L8M9h4Q4Tu+u6P
	lCuM9wDK/7YH7EtrbFb0qJ/yYyBcSGCH+TPLqe6B1l7aUTnCFxZelQ1nOW8sW0u/SvmPWGJ431z
	AlxPocy3ia2ieXSwdltp3nwZcKN0WG8H6K5695KUqwaOrJ3tt+NIjxhXgzpiT+VjOkMC0JvePXe
	Jjf5qQX1+gzpENXFe2geOYGmQ
X-Google-Smtp-Source: AGHT+IGsAKFgjs66CEclWGo2OAGE7x2yF/O4CZXrBnVvBqkKBdDXu1lvcu3um1VWUo4w6Oo4wz8SIA==
X-Received: by 2002:a05:6000:4313:b0:3a1:f67e:37bc with SMTP id ffacd0b85a97d-3a35c7dca79mr128071f8f.0.1747321295486;
        Thu, 15 May 2025 08:01:35 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde01sm23388046f8f.15.2025.05.15.08.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 08:01:35 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: mxc: configure dynamic GPIO base for CONFIG_GPIO_SYSFS=n
Date: Thu, 15 May 2025 17:01:29 +0200
Message-ID: <174732127889.17102.8532614606603162153.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250507-b4-imx-gpio-base-warning-v2-1-d43d09e2c6bf@pengutronix.de>
References: <20250507-b4-imx-gpio-base-warning-v2-1-d43d09e2c6bf@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_080139_240328_BDCB026F 
X-CRM114-Status: GOOD (  12.06  )
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


On Wed, 07 May 2025 15:07:25 +0200, Ahmad Fatoum wrote:
> i.MX GPIO numbering has been deterministic since commit 7e6086d9e54a
> ("gpio/mxc: specify gpio base for device tree probe"), a year after
> device tree support was first added back in 2011.
> 
> Reverting to dynamically allocated GPIO base now would break most
> systems making use of the sysfs API. These systems will be eventually
> broken by the removal of the sysfs API, but that would result in GPIO
> scripts not working instead of essentially toggling at random according
> to probe order, which would happen if we unconditionally set base to -1.
> 
> [...]

Applied, thanks!

[1/1] gpio: mxc: configure dynamic GPIO base for CONFIG_GPIO_SYSFS=n
      https://git.kernel.org/brgl/linux/c/0a45c1a002705c8622738fbd2a2913acf886ea27

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

