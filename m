Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B8FC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIR7kxuCYlEHmDo3YVqs1C3HW9gsJqd1zOT7FkNeONI=; b=oMyIJw4AfG8P3VsdvQO4clF0xO
	n/AqWNmuZWjqVkdpkTs01rp6bcQI983jjbfdo60lsDLgC+UoZDyt6VYaYyL0rbRxvpf/zL2TqV99L
	tBl74WXGGcgoxxh0Afexxb9huR940cVIGhi3ngWRekPysGK1q9i1Zp4kDpHGh0GH6S+lhQIL8C/yH
	EXquUO0hLhLE/4o3+sCfn4VM2KP/xDRiCSCwTFUQ7KiU7oOYSMXDPkgk5lI2XwMf8xdwnDJbx53b5
	gCXxpoM6HZkwMEDbLf1bI7eGBnkhSUn0ewtlvFO9PSF2FzZ67hZWCqWh3Mmbni/Z3y58luhHYIoTG
	T4wV8jYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9jF-00000006wUF-3EJ1;
	Wed, 12 Feb 2025 10:12:26 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9RR-00000006sGD-04if
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 09:54:02 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-38de17a5fc9so1756020f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 01:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739354039; x=1739958839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIR7kxuCYlEHmDo3YVqs1C3HW9gsJqd1zOT7FkNeONI=;
        b=iBmlHoZmqZmsiHNK14l0fcgHRizI0aMoXx+slZ8NDE8/zXat5sXZm/Me5dYfGXy39P
         mTEHExyBUkiNm8AQmxZOpCZXt3mArpKY8qXIe3wN2zqpgRzORmsX/D+lCK4N+YI8XNXq
         1BGk2o/j6DjsBNyM5bEz2tziF9TdKbNqrH6OescBcKq7yr8UpgB5vrkpsPTORFGvjAaM
         gAzay/CRtsBkqMELdytB5zOKZNN+pDLhqrAKHI5OwoMZV3KRu8aa5agxqLREq2g68JTB
         niukMOV0BQu9/HkkBLkWo7hjqetlPjvoxDmj8MrZITo1MvBV7RoYjhKSxWNlvlFeUWnh
         4VLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739354039; x=1739958839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tIR7kxuCYlEHmDo3YVqs1C3HW9gsJqd1zOT7FkNeONI=;
        b=VqOAoph2FyP7RUSG3MkteUo0/MwYwWiu0yEyMzDGkRvVlvByurkrW+WnhFvNcDSjW7
         CI7ltPGwBwAkHMOGW3Y6v41oLH5pE3mo/UkPfegPYtBBLTQuwZ4HSgmUyMviqpMZDhGo
         MGlpnxUAIx+soQyLC0KjpySe5aba4fYY6axUDnIup9hY/ntOrkQRZl6856lF+RaT/Ljr
         rLJVFVjCCK7dVbqwFtwWk3ZXFWnlzb5qzV/are/zuITZk2xC4byCJYbBtA3c9osJo093
         D7pB7SF7VKH790G+uiBR6rEK/x/XUeHF0JM1aSeqyFWFeW27y2uhvs+Z+RC6JgbD+NfU
         w9/g==
X-Forwarded-Encrypted: i=1; AJvYcCUqXV767hr3fMBXY4HBWCc1KBk2sCmytWm1Q0EetBaFwwi5wqtby1dzSmGRvhnj9wT4IZY++3B7OnReCJIOi69i@lists.infradead.org
X-Gm-Message-State: AOJu0YwRw2v/FjWmp1u4pugIT3Pjvs+jw6mMsKVSvDGkCYJKh0y0Tiop
	DZlwtGV9ph8eB9oyqCYtktuJnKfsSSFUifK3JOmxcmJfxdfkeoubOjf5WO+0gwo=
X-Gm-Gg: ASbGnct9tGcKHs6LMmG3qUTv+Q2Pu1TDc4N6whGGgFGOdI61Kr0nc1xMQOLWtdfLgYt
	E1P3yuy3bUBqh7gJ0QR+gUNOTveJWtT8E1hdShhOR9xqEHjMY0bvgrMBzTuBZCPgmC7TGylKAQV
	1srsFh8Uap8pf/cVynmHA9rrC/Lx7+utCF4QZvcxhYH/BNJy+79ch7xjvBxvs+bm67f5tvQzpNK
	rHPj1FanZQiTkAcTtRQ714LnaPPB9MBBehYUCGqpGVpy9PJrUuZcioQZcngDRh76TIX87xepRhh
	o066vDl9wKCDDeg=
X-Google-Smtp-Source: AGHT+IE1AuIEYHupLeeT9Nxbe+qdld3vOkKKKz82MsP6O3GVbjl5NUVtbZU3jbI1vKhF91kVaT9XZA==
X-Received: by 2002:a5d:6908:0:b0:38d:db8b:f505 with SMTP id ffacd0b85a97d-38dea262832mr1371554f8f.17.1739354039252;
        Wed, 12 Feb 2025 01:53:59 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:521c:13af:4882:344c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38ec2d9b299sm842935f8f.56.2025.02.12.01.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 01:53:58 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Wentao Liang <vulab@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] gpio: stmpe: Check return value of stmpe_reg_read in stmpe_gpio_irq_sync_unlock
Date: Wed, 12 Feb 2025 10:53:57 +0100
Message-ID: <173935403447.13404.4893974637827879328.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250212021849.275-1-vulab@iscas.ac.cn>
References: <20250212021849.275-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_015401_079416_28EE323A 
X-CRM114-Status: GOOD (  12.08  )
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


On Wed, 12 Feb 2025 10:18:49 +0800, Wentao Liang wrote:
> The stmpe_reg_read function can fail, but its return value is not checked
> in stmpe_gpio_irq_sync_unlock. This can lead to silent failures and
> incorrect behavior if the hardware access fails.
> 
> This patch adds checks for the return value of stmpe_reg_read. If the
> function fails, an error message is logged and the function returns
> early to avoid further issues.
> 
> [...]

Applied, thanks!

[1/1] gpio: stmpe: Check return value of stmpe_reg_read in stmpe_gpio_irq_sync_unlock
      commit: b9644fbfbcab13da7f8b37bef7c51e5b8407d031

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

