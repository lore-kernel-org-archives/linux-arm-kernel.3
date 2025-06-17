Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E62BC71157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 09:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnaoVN6uaaPExRjDgZo8b3KkCScwP4IUmjW/6H1GBX0=; b=sqcg0aANDOr+Hpxz4n7EtTLkZE
	Fkdha37yw/a91PaMO2dL1jHL/pJMzpl3NapZGvw6mwRHA+9P8TkuU0LKNJ//QHOv3SHA6aquT4VQl
	weaefeGljPPf+xWEZnmxGCFIEwQrkBeuSrKHqdykXp4zOJqIW00jdtvv1ZKVTAQLEUy21qQvd8ilL
	dBnYnOU6+fx5bsyjh7fDUJABbijp2/JOCXFBa6vBGuZ7saXd3d2qpGXZkqAEAE2bj+W6mklo5RcUi
	i3MB1o0t/hC7u2zy+3YUmmbIXEZ4wedM3yCyN5A3jeOvT4+v5M4OwvgsGBd6G3eoJf867DULL9JxP
	67LwnopA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSXt-00000006jZM-0QOB;
	Tue, 17 Jun 2025 09:23:57 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRSOc-00000006htQ-0yij
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 09:14:23 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so4438197f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 02:14:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750151660; x=1750756460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UnaoVN6uaaPExRjDgZo8b3KkCScwP4IUmjW/6H1GBX0=;
        b=PVQq49Nb1etgNCevYuRDvwSoY58mGMpbHPw6NLsMqNOEaiC2aLJENMBSl+XjCzcu0D
         1090DxKfIy52n40FjMGivRP71fRFj4Yhfpv8jNY0/7thPwurE8+gPqebvKi30ocyvP/Z
         1Nnwv8C/KS64bS8LGRSEOOfPreq6yMaOj0hL0PkRxaFoW9PkztENTWUIRUMx7K10Ri7e
         P68RWDwUqpyXKc3SgGKWBey33xWA6ZNjgI+ATl1FqVgb9Q0abJQ5NApw0CiBidK6Ew7g
         XsLjgxUHNJsbsDkH/NSlWGcIXBD3APHZsnVaEG/0a3TzmZGIgNaXcjduv0ZmWU9Qvgt0
         45rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151660; x=1750756460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UnaoVN6uaaPExRjDgZo8b3KkCScwP4IUmjW/6H1GBX0=;
        b=a16hmQAv3tU2C5sG3VDW6uICt2BlXRX4Gn9v/RO+vy+PSjXu4kUab2kQkJl+6uKvaQ
         xOp3DIZ43ziNBRLW9Jm1+Qaq2zoJs8Pql9sB16zswtzv6NvzCkfiyAdoOcYtxMvMfV0R
         PWCSxz5EWdDsXv9DI/77f9vCF5AOsJD49CA84/HwGvCb1T1QsUZnsr3GqmZIybOFvCCu
         FhDKdTRQRCGDzsKj509AFkoGYem0VJ6SMq6elDHL9183ix0/Py7HPfTxj8W0+8DaZy32
         pWOYF7GNTxJUjdOP8Z/nNomWSCRYk4IcXGtDnd8Aa0DwODFL0NY+A9C1Ur7ynMjSZqtj
         VQWw==
X-Forwarded-Encrypted: i=1; AJvYcCXCEkjv+KM12KPiHWvCdE1Q0wRmDza/isN06rxA/kHAehhUUhwOCFW8fnvqvyucpixuDm5W+l+9s6+LjxNDjKM3@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4GVI3Wq+lYF+jDUdkeTYD44Ai3Nv0yayeFpwF/ERBqlcaud2v
	s2wm0x9njhk1xwfxEvRxF+L/znd1vcA865bToJes2HOQGRBh1o7UaFlOvPWK2ZSZ5pI=
X-Gm-Gg: ASbGncufcFqsVKyBi4WiOPqGTWtTcHTwWUpDAXCYAoL8FgYfL8tJDTzRBBv4IC9glNx
	NJ5mJnsVYJ63cBXunuKKHqocQVKzEpTVMWJFx8ZNwHDaw/LTuPsCKA8KuBIEsFrbO4xD5OnwTj2
	oKSXoGNGYqlyaQAAUxXtUh86jfy0I4/8TqaDfAZ2vvz87wT4zW3OMf/4Vn0yAAF7rGpppKEESXU
	jGG/wfrhBN8wUT58Na9pBF6Lq2pSgkuQ64mcdrqHM5fOI2O4cri/4gy3f6jJB84KuqvB4fq0yFA
	AKPPOZae4QO7FdmsdHK73s9X8G31kjkWziGw2I+mABKPwiV42nPlmnwu1hAsFwg=
X-Google-Smtp-Source: AGHT+IHTn2wDMsbvMniANLwl39rjbgUv/TbrwZjrJk9B4M+SEDhL4V7ekAYBvqmllDgC3dCpG6O08g==
X-Received: by 2002:a05:6000:2504:b0:3a4:e624:4ec9 with SMTP id ffacd0b85a97d-3a572384087mr10329583f8f.3.1750151660151;
        Tue, 17 Jun 2025 02:14:20 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a633ddsm13280685f8f.26.2025.06.17.02.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:14:19 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-kernel@vger.kernel.org,
	monstr@monstr.eu,
	git@xilinx.com,
	Michal Simek <michal.simek@amd.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Xu Yilun <yilun.xu@intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Tom Rix <trix@redhat.com>,
	Wu Hao <hao.wu@intel.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:FPGA MANAGER FRAMEWORK" <linux-fpga@vger.kernel.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3] dt-bindings: gpio: gpio-xilinx: Mark clocks as required property
Date: Tue, 17 Jun 2025 11:14:16 +0200
Message-ID: <175015165194.21779.15497760973651030426.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <94151cfbcff5e4ae05894981c7e398b605d4b00a.1750059796.git.michal.simek@amd.com>
References: <94151cfbcff5e4ae05894981c7e398b605d4b00a.1750059796.git.michal.simek@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_021422_278196_09346779 
X-CRM114-Status: GOOD (  11.46  )
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


On Mon, 16 Jun 2025 09:43:18 +0200, Michal Simek wrote:
> On Microblaze platforms there is no need to handle clocks because the
> system is starting with clocks enabled (can be described via fixed clock
> node or clock-frequency property or not described at all).
> With using soft IPs with SOC platforms there is mandatory to handle clocks
> as is explained in commit 60dbdc6e08d6 ("dt-bindings: net: emaclite: Add
> clock support").
> That's why make clock as required in dt binding because it is present in
> both configurations and should be described even there is no way how to
> handle it on Microblaze systems.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: gpio-xilinx: Mark clocks as required property
      https://git.kernel.org/brgl/linux/c/d03b53c9139352b744ed007bf562bd35517bacff

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

