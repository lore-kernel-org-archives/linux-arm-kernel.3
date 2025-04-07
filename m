Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5602C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 12:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1pnqaorkLrZEV4we2FcGB2lZ+lYdMYMSEtj/n+/qjUU=; b=1Xj28KIDVqRfOoffDVtzpymX0V
	j8HztjR3jEiIPfcu0WI5rrMHzeKbokWW/j00c8LMQ8AfCkNCNglzOnI8mPinoXNmouoNBcnUs2X0Z
	kWMc6Gt1DD5NLE3qg8R8k1lJQ2BHdw6dEYdNlWyL+/4QXPfDiCIAK7+xnd0x4RHJs7b2E3FObKWyZ
	JKTxkyuWP1AFuk+X36YHAQnXO+zkfWoATmZSeXF7le81xzqxx2Zp4NxLW4+WkUBmd8/08e0aDq8wf
	01VhoyVpWBSSlSDlDrVYv2PBD9YgKbCdhrP1lvGubiBKP7Nx9tm80PPlpXysM9+dgNHDSRqCvto49
	I+NP4nyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lhd-00000000GwL-3Law;
	Mon, 07 Apr 2025 12:35:50 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lB4-000000008mM-0IWs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 12:02:12 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so3735066f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 05:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744027328; x=1744632128; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1pnqaorkLrZEV4we2FcGB2lZ+lYdMYMSEtj/n+/qjUU=;
        b=G+7VQlCMwHy+RZMiW/zBNtexzbC8CsDhteLu9wt93jYIOe36qv0smNPrLI6V2A97v7
         haDCaNG4OVB3QpTW8Nif+OS/3w8svkV4cP2/8tKALneKcLQVGjQFIaj1KoutNJsMW/xb
         JjCQtVoqiHivIb5vzYmY+6BG1FYfpa69yY12776YUnmgjNZQsB8hauBueKTc3MmqvDvx
         PV9L+BFxQKU6CWS2JjCkxNtwGVhTx9QG9xMN/sTkH+qJACRKbB3Jwm1dnI4IM0i4Ali3
         xXuxGUtTDm99xpT8IhaplE9ZD5bAYUQmMpmE8LwtUFfSkF13pA1PzZNe4VxNx6mfnd3I
         CFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744027328; x=1744632128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1pnqaorkLrZEV4we2FcGB2lZ+lYdMYMSEtj/n+/qjUU=;
        b=OzjtbAwHsA26bMO8kOValP5IIWNURVDHMOPUp5S0wa7CQZ8F61JTVOpNQjjFYIKO78
         nQXokzbpk8SSIRLP56hy/VVY4JbX/+MRjU6gwaZptRVJ9HpCS5w4FYKZQwHvCjXSZakq
         ttyoUwiOBiBP0c7w9DJCNR9kj/3PcDMcWnTlaJXCXhU1kT+getbyg8L1MtWU8h8hKHhn
         A3bHAm/EtLW36GnnKjxYp/4jmzqFaafbjgih+vI2ags6vsgGFQCXbMlrhps2BF6uokC/
         xnkO4i3j+wK7C5rlkCmRs05ee7H0rek7HXtXZBsAGNZy7RDhA8/rVAiThHa+10kdjrnM
         PnHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDj+aD52UGCQfFRiTPpZpdvzhozsWDYf2VH4BGYkJcogSzE0Zen5NTQvPNlhPQr4z3Kzzty62BgHBYhcW7wOMw@lists.infradead.org
X-Gm-Message-State: AOJu0Yzm8jc8hdmDj4GHzGcM9dvDC886DEhgBU9H0fRtKchr4y7YzX37
	a49JymP1cHwULsrCdHEGOOMfd5L+fpwI0tvsrqsVpjHFhUXwtVC2gGRwWA2Jyr8=
X-Gm-Gg: ASbGncsh3JToLzUf00HFmEjf6+32vxZX+n59Ir5UtTENSWliU7K4ylSi/OP9iytmajM
	+vbV4bKyAilMOR/mo+Wyp7mame2wLIszwb1phvcQNXTfjv2rfs/tSeoO4VWwSHuYDIpOyzguyp3
	3j7NSQoQKjiyN8z+BGJ1tV/uI/1YXmXJfgdUZ/ki99FuP33Nl76jqUf0pPdofn53iyY8PV5pvNs
	9YuORqghjyQFgtoMxbVZIdg5D6/aBKeex298a/a0d2d9FHJCCHRxlqj03xBVszhAPt+S3z45rqG
	LgWMIto5gWjjQ5UHCo1qRB2r1nYnZfDj0yseEw4d7Nwa
X-Google-Smtp-Source: AGHT+IHQzfBlcrdH5SeBUOUhvSnbXFRgYmEUvgyqEtRbmlRwoKeao0pvP22bOvClSu4BfKDmGCcmaw==
X-Received: by 2002:a05:6000:1788:b0:38d:d666:5457 with SMTP id ffacd0b85a97d-39cba982600mr9594792f8f.42.1744027328186;
        Mon, 07 Apr 2025 05:02:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6796sm12061650f8f.31.2025.04.07.05.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 05:02:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matthew.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v2 0/3] Add support for Blaize BLZP1600 GPIO driver
Date: Mon,  7 Apr 2025 14:02:05 +0200
Message-ID: <174402729978.46356.11201188338288043335.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327-kernel-upstreaming-add_gpio_support-v2-0-bbe51f8d66da@blaize.com>
References: <20250327-kernel-upstreaming-add_gpio_support-v2-0-bbe51f8d66da@blaize.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_050210_113819_7568DF41 
X-CRM114-Status: GOOD (  12.09  )
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


On Thu, 27 Mar 2025 11:27:03 +0000, Nikolaos Pasaloukos wrote:
> This patchset adds a GPIO driver for the VeriSilicon APB v0.2
> hardware. This controller is used in the Blaize BLZP1600
> SoC for its GPIO interface. It is essential for upstream
> support since it is used to provide signals for the
> Ethernet, USB, SD and many other interfaces.
> 
> Adds the GPIO interface to the Blaize BLZP1600 SoC devicetree.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: Document Blaize BLZP1600 GPIO driver
      https://git.kernel.org/brgl/linux/c/5de6156a402b2d2432767478fe75c40f9755232f
[2/3] gpio: Enable Blaize BLZP1600 GPIO support
      https://git.kernel.org/brgl/linux/c/52eafd817651d44ab006c83ebd98f5dd687df2d3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

