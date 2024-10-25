Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216E4D10399
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3N7tIFZ/AxOAsyxDDEDsOJgBWk6XC0sx5+hvyvRCSE=; b=0KwrbPhkpjFhF9J1PJrjIb/jnm
	s7mgEwQDuzFNEz4QGxeTl81Cf/LLLFsvJIO7sFEKS0POfS3s4ZUKh+iIFzF10qsd7EjodpP2CLh5F
	Eqeat7zeG6r8Ii2eN6sb188ZI1QBCubWwAKpI73/rWs1Dowb3B6QXnwW0Wv4opEvNk4TxV1Bz6jwt
	Shid5IbyhLJn2zmHj8HIjsSrWK+ZRGMDNAfUCANMh4UdP8jx7FpzzYYvRFVt1FsPguDIp3r/th8Co
	MHb6gFYjYRrAMrNXPPYkYwnVIGxO049NwMMiimjynkiBkOsJnPZnJXRaVAqgFys1GZEexlNV1wwwH
	6jH5vffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MGm-00000004Fih-0Uhf;
	Fri, 25 Oct 2024 15:30:32 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Lt1-0000000491Z-3di8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 15:06:01 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso23935201fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 08:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729868758; x=1730473558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3N7tIFZ/AxOAsyxDDEDsOJgBWk6XC0sx5+hvyvRCSE=;
        b=cQzr6hBcsnZnbhfAAZBIVD7DjSv7qfOJTEYt9wCcih4clb7YpajiRIt04rS5zOMd7Y
         LFIdYTQwjVDs/aswbUUU3AsAryftcm4/altBLNvDFFffb/rBnSTTV//saXdQdi3TH6cP
         7f3K0QN6y02zWB1hFDE69itXO0uISked5bltUxkYPMBoI3RYvCJRh/Bw6I4Av25ij17/
         XlqjHhOMe6rIS2Cbfn/s9oz8Adi5ps9PLFgDHHBQq3gVLtyqpajNn/h8h1/3Drqcu5mm
         jLgYD301bOAzFAWNuTg5p5nil0ZvCq3AL6fmkQM6uscDFOr4favkO2hRQKG084KcqA73
         BQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868758; x=1730473558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3N7tIFZ/AxOAsyxDDEDsOJgBWk6XC0sx5+hvyvRCSE=;
        b=L3Gu9WVz/dnIBHYtjO8S6lAH8IuQWRTPEI/QRMQ+gDV06Ji1hqgdLS8Es57pKrtxY5
         H0sqBpTrifgUCbEUir8nVr+/4/Xnn/G+FSOkH29HOygxxAaOo5WLN1BcEjSZhRdl5hwQ
         w8LcDI4osibXS1rbydXLQLF4/xh+amYLh5s0mXFNSEzBf36nMLcI4ZFbofRxjE/DxB/1
         Bwtv1PTEucw4ey9s8s9VNPpVSYPVYIJua0S6oJ1sNpc8K/W8jfCO5leK/TC0WjT6XIxl
         Aze4+rwdzBxfjD++Z1UIpWddztC20ciqpfS7AaA+8NZSZxZZmvCjC9w5j1XL0iXs1uRD
         BSQw==
X-Forwarded-Encrypted: i=1; AJvYcCUqyzeODpdBcS/9wCMcnQovuo/u16adtIpThXsLKtg9vL6YgINjKMWfLSIHgngkGsYUuKjFDQb5ZE1j7a7p12IH@lists.infradead.org
X-Gm-Message-State: AOJu0YwvfymscrHWAVUIgFgvm6OnGbt5k/x4lpGEtGvvzRDoa04i9mMk
	lVGlt9CnxbyZlM/rBF750I9+LQeKf0Gk0k1bWz5l3s/mm63AjTqL
X-Google-Smtp-Source: AGHT+IFrsZWEoyBnhS3RPaZ5Zmw4dvGHO73/aCwUsgK5sZG6dgINNxsk3Az1YMPxmoJf6izmtskC8g==
X-Received: by 2002:a2e:a9a4:0:b0:2fb:2b5d:215d with SMTP id 38308e7fff4ca-2fca81c1cc1mr40595521fa.7.1729868757321;
        Fri, 25 Oct 2024 08:05:57 -0700 (PDT)
Received: from localhost (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b57b472sm52204835e9.43.2024.10.25.08.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:05:56 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/3] dt-bindings: Changes for v6.13-rc1
Date: Fri, 25 Oct 2024 17:05:52 +0200
Message-ID: <20241025150555.2558582-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025150555.2558582-1-thierry.reding@gmail.com>
References: <20241025150555.2558582-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_080559_927736_41BDA87E 
X-CRM114-Status: UNSURE (   8.67  )
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

Hi ARM SoC maintainers,

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.13-dt-bindings

for you to fetch changes up to 1f451e2493a66345aefd13490d058e46dc25b459:

  dt-bindings: arm: Tegra234 Industrial Module (2024-10-21 14:53:37 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.13-rc1

This adds documentation for the AGX Orin industrial module.

----------------------------------------------------------------
Dara Stotland (1):
      dt-bindings: arm: Tegra234 Industrial Module

 Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
 1 file changed, 5 insertions(+)

