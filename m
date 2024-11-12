Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A756D32D9A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 12:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItC2fxl3q3F4+PCf0UD7oi85OBnIB0U+ggjyxuMdhdo=; b=oKcr4ihvFuodJWwzXT2Bpus9Z8
	K9perlhZXHg6io7nTGsSTkasPbqR0Kb7v2l/9XvdaPbs/qqQoemy98B+SyRZNoYuzQJpB7pdG6RpM
	PIMkJweJZsML8WSFQa4Qy7fwfq41DXI3DzbEvk0qu25Xhi4vcAyjRNxNSGiYYsG7Pv4jQxyMh217F
	M7VUcY2+ExXr2nTEBpoPDSfW9tPAMuD2Iku6Z0dCS03fRe8co9gFtAMIXEx5WJY2cSOr4Uc0zsXBk
	J918q+tJxmvTYReprHlM49T73AW+H1q4FpaYJsSAW6ZbLm6j8mxTAjP0oQ00/IOlP4U9N8GTwhVSR
	hzr3/Ffw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqPV-00000003Sl2-42Pz;
	Tue, 12 Nov 2024 12:54:22 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAqNI-00000003SQA-3E1X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 12:52:15 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-37d6a2aa748so3383016f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 04:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731415923; x=1732020723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ItC2fxl3q3F4+PCf0UD7oi85OBnIB0U+ggjyxuMdhdo=;
        b=bl5PqFwrt1eFYT2UrLB/LpNqfI4TzY551idopXRi/+RzzhYTl8ppToUcpo19FKdX4Q
         MAyG6oEfX2xr09lWgPrHMY9NfoAIdhOrIqVsoC91J/90kSNzWmUD0C14JzZd6ccFtX/P
         +MnKSZXEMGzRJj9iOk42FZmUrvrPmAu7vhR6eqmh+VSTIMn8uChVlXpYV0Et1OjRlQes
         u5UVmL/yQ+RYmXCjkddzV8o0XJC7aIiO6SFKGq9kQR0gcgBR5OqsLQy1OQh3V+M81cI6
         0C5mtYGLVIHWPyavpLY4can+B8zxxtslRupIZfgzpLtAu1nGe3Eo5u0KKQaodj2Q6qLo
         zgvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731415923; x=1732020723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItC2fxl3q3F4+PCf0UD7oi85OBnIB0U+ggjyxuMdhdo=;
        b=XrWacPFRNLcAmCHTTW7qAoFoMNv8u/jgItXIIvXSZDQgekGusmx/CyFZ9FQT+aQZqP
         mfxruO+JUId1nqUlHRO4RfaC69kYv5cStTf2NETCK99MYYnN9oT3ncHcIFqzfNToW9I8
         GxyKQDmVYS1NT2z8cKhfD7bkXyZKq0E84lgd+9kfppHsRrAji9z8AF6OcQN3NTZ8Hn3T
         5tQYBft7q4bUiaOzTSI0XIdErg81oCxVPY7/qYFLKV6qq32RvjUNp+NYxPXcOW8bqp9z
         Vodpabwz9UNR0zTGjjDX/8ovhWVeC969Kk0XyDafbxB3GBLETQvkhhezVDEhSfuUV9rf
         OY6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfqs17akznAlo8f3EqI8wITxJPfXdm6yMVzLzTygYUeyxWZq29wnczxYy63HDhqzBRSZDV9v/NvbX+I6aVfNIZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwHFKFiiATVpsN64iSYgYsZU4Gcdgn5tVO9BnzFxuDdA1hEUmhL
	ZRopsWtcuTNr3/YUoq0kb53WUunp11ns4LMPjB1GNshEo/gf9XgdFOA7l9YdJMc=
X-Google-Smtp-Source: AGHT+IGP1vWW532uhucbygG3Lp5or8zZuQTeIPnXLHkrmwfWtKfTiCcJOexZfHzCsZL16ncrBwbjCQ==
X-Received: by 2002:a05:6000:402a:b0:37d:5103:8894 with SMTP id ffacd0b85a97d-381f1881319mr12834957f8f.42.1731415922836;
        Tue, 12 Nov 2024 04:52:02 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:94a5:ced7:f64:fdaf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381eda04ad0sm15287346f8f.100.2024.11.12.04.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 04:52:02 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	heiko@sntech.de,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ye Zhang <ye.zhang@rock-chips.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	tao.huang@rock-chips.com,
	finley.xiao@rock-chips.com,
	tim.chen@rock-chips.com,
	elaine.zhang@rock-chips.com
Subject: Re: (subset) [PATCH v5 0/4] gpio: rockchip: Update the GPIO driver
Date: Tue, 12 Nov 2024 13:52:01 +0100
Message-ID: <173141591574.57283.303844773378689063.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
References: <20241112015408.3139996-1-ye.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_045204_811487_690BDA95 
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


On Tue, 12 Nov 2024 09:54:04 +0800, Ye Zhang wrote:
> GPIO driver support acpi and new version, set input direction in
> irq_request_resources, fix division error and debounce config error.
> 
> Changes since v1:
> - Split commits with multiple changes into separate commits.
> - Adjust backportable fix to the forefront.
> - Modify messages of some commits.
> 
> [...]

Applied, thanks!

[1/4] gpio: rockchip: explan the format of the GPIO version ID
      commit: 591ae6bed250e4067db926313ff7279d23a1c7d1
[2/4] gpio: rockchip: change the GPIO version judgment logic
      commit: 41209307cad7f14c387c68375a93b50e54261a53
[3/4] gpio: rockchip: support new version GPIO
      commit: 8bcbd0379c05c66ce2e842c7e8901aa317cdf04e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

