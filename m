Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1FCCA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJ2yny2AZyLw5kGAtNbOv6rkTL+h8EX2jliOx5kuaqM=; b=aGB9VhGV7tn8wmBwFtOmBdYTGW
	Em1dOrPspCVMzRL4f3vWxnLKMiMSdsXc/yNYuVOCddRVptqdt95xKcDsRJNe66UVe6YiP2lwvcHl/
	rxMJ/G8pAaxsOn4oU3NDoUKS4r+tROw0LaskslWSfbcUfbC84FDUKdcqwDOIZK0hGDZWnL6WTnvJG
	YFZVLWHg3mJ+R+O94Rl6uQyalPORVfTrQoM0GqxDNOWTLnJ2cCeLjKHuUCjNLy8UNRtbgSdgqjkV3
	XJXsWQSOxV/UUSaCzXmxqf7XgWbrKVGH7TeoxmFAMu7n8LR2aTzV2fnNmID2FMpfxIAjWqOCbqVQg
	Qwb7Ri4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCm8-0000000Cs2x-1mV9;
	Thu, 04 Sep 2025 16:25:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9dS-0000000Bksk-3b0V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:04:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-45b7d497ab9so9984675e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 06:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756991056; x=1757595856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJ2yny2AZyLw5kGAtNbOv6rkTL+h8EX2jliOx5kuaqM=;
        b=Ws9xnwFOYUvyzasoDdHKcZQjT/QX+3zsHxuLPAEfntT4JwizFiVdaCN44r7XDR16Vs
         kLS9P5k7HOmuQ9pQJinMp4Fc2ih0wt9vGJHMNMzd8CVW4A7VCzZN+gyT1qIeBKlDcj/N
         Uc+N6DVg3/j88Fk23dhqOJHDIZ1BBR2xZIYKcdXT4bND0QQY+HpCtYIrgnWI60Btx7IT
         2OhbXWXVi+NdKX45rt58z5MI3J4VTyDhd5mvDPYx2DKmP6i4MX4bZQ9BfOAwXJiLMKD6
         Vw3BJKkI400WZgydJ3IEeH3Jx/zRl55UgBQfixg2EtE1Sl/z+jMTXuv9chCl5+FxwH28
         Sd9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756991056; x=1757595856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJ2yny2AZyLw5kGAtNbOv6rkTL+h8EX2jliOx5kuaqM=;
        b=e0CiFqJhbZiR09nIdRuhZkxW5DizNz5yyBY0oTm4Q6+2oPnHWtLBDaY7oR958zkcc/
         I9UBBmG0WaNWUXbD5T12j3HYESIcQWPPKCmYYVjrFFPwcEmJQUu5eFrN9ocHq609MtPQ
         I9FXwftcL7PMzkuJElr6J53Q42G8ER4cIEs+QHkdDfv3yPtoXZ7ljIVW7swEoN999+po
         syXjirCVLNNWhdntSzhINcguhaWJLGv7numVlUQ65WEI3PVQqzJ6h2+qVlAnTZu+TSDS
         BvQaP+WnBnRoPB3OXCtdj21RYz/yxfSw4l2e8cgDfejFGV6h25CEj63t8hb2Pg42tMpB
         5Zaw==
X-Forwarded-Encrypted: i=1; AJvYcCV4lDM1BcYKyegbp7FsMF91tlHHNSYDm19PbGBZ5Lx7z/UVQO+1n4bVO7c18xC/Bhgx/CIOFIC6efKFh6xH7IGi@lists.infradead.org
X-Gm-Message-State: AOJu0YxIxv3U+s7Tq7Iac2oSzK6VgQZYkOS3tHCoSJJ8JDdhCPA1ZgfZ
	D55irkWy5RIzG1JRhvQy61IXncIsUvLUN0HD08CeLqLts/vlQrnIITvq+bKx2mKBta0=
X-Gm-Gg: ASbGnctBrrQxGZuwba4xZGBoxrATNiFAyw+9TtMHOBSs9a/wD0U3eRDnBUAPsf8X1uV
	V9SYWFxoRicsxXmzv/uTXecAOgaTHeUonrph5u8u7J3K3Sa5g7SnImGooDj2roEngIm8/tEnuC9
	JOc09RXvQUhSXI/MSdoa+WHI47nqq3uALIHKZQvNlA8uCEnBwjYVM1dxIKLLDdUsyVxIUlYINXZ
	kNjZ6Ienf1OcLKbqzGFzmvuiYiDsAYeTVCwN7oOwleY29GHCps8bcLY1J17FCMIUzAUxIc6/osA
	fDfuzTIjgJnr7rNVsRZ83q9ioc6TGE1NLChsznp/HjVnKAmVco5jzQLv7Pucf0OTkOpx2dA+dyx
	4cRMI5nTs0ehRsQrzsRDwlWxRbNWm/XoHrw==
X-Google-Smtp-Source: AGHT+IGxBimr8IyZ1DY86cVwVfp94kA87fe9hUXm7C1nUfS6RvrRyv+/zG+v/lPCzgh/LN8QWSMvOA==
X-Received: by 2002:a05:600c:8b23:b0:456:1dd2:4e3a with SMTP id 5b1f17b1804b1-45b855506e2mr155178225e9.3.1756991055686;
        Thu, 04 Sep 2025 06:04:15 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6e82:a4aa:49e0:a7d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d701622b92sm16393258f8f.58.2025.09.04.06.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:04:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Lee Jones <lee@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/1] mfd: stmpe: Allow building as module
Date: Thu,  4 Sep 2025 15:04:12 +0200
Message-ID: <175699105010.72115.9734506229516403389.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819070458.1027883-1-alexander.stein@ew.tq-group.com>
References: <20250819070458.1027883-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_060419_134085_D97FE006 
X-CRM114-Status: GOOD (  10.19  )
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


On Tue, 19 Aug 2025 09:04:57 +0200, Alexander Stein wrote:
> Export the core probe and remove function to be used by i2c and spi
> drivers. Also add necessary module information so the drivers can be built
> as modules. This reduces footprint of the driver is enabled but unused.
> 
> 

Applied, thanks!

[1/1] mfd: stmpe: Allow building as module
      https://git.kernel.org/brgl/linux/c/df6a44003953fb23ad67f82d299e439e7ff7150a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

