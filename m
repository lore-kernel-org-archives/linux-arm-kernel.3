Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C604C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 15:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxsp6oGjuNOX+xuFU08PlzO35fGhJ/ry3v7K7kSTtzM=; b=HkOVQ8AVyXwpjCmc2HhXloz4kZ
	N5bg5RchMsxxgwkVGMCehM3cBDg0IhXx0O2kPmDQsBX8nPjloQiwx3f/2WLOlHVW6M00tH88Y6JFs
	S5M+fltj8SqjGwAW3o2Wcip/UdnSfkMkYCcCbEuSTraA0RXkVuaRYQyfqYmAn4HG0yvGuNdQ/Il4L
	fAbClMC+XROFuzJHwiylBXabbPEUxtLDaqHyMx9mOu/bqxzkil45jcGuWRttqbayONtN/nGEOP7gk
	KBSjUul5+xnhQi5+8XtTBBttZjBNN4+p94PI3SiaAyZBoF7UBQUc3ez/DIAjXtWsSowXYPs0Zowl5
	yTppmBIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFaBy-000000010Tv-2DNU;
	Thu, 15 May 2025 15:08:14 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFa6u-00000000zJi-3mNb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 15:03:02 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43edb40f357so8293585e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 08:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747321379; x=1747926179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxsp6oGjuNOX+xuFU08PlzO35fGhJ/ry3v7K7kSTtzM=;
        b=XsIdLGpnaxxyuKf5dO/+muQW0GuTEoAeJgoar4iaTTqmCXTn2LlyjmMgeCQNorsyc/
         QiwivMVzfa87ULFAjPBWsoAaef5Lc91DFcMroGLIXcuSTDIZejGVxKBgN2tNIGHmrxSJ
         fcLE+REbAi/OJ2T+XE1BRPKZH8skkXkPRt3LA8t2RIrbhaYTVjOsFzRD/ml4eKl8bk4p
         ou35lTvr7niDgti08kfZAhqSmJpLTIBVAAnS7a0D7TMpybdGEJ4gWWjnEXP7iDtMq37w
         O7iIOs4EGWSBlsdQ7cxR4RlgW7clzvA1F59qTpx5QV4ASLGuMcsb10qZyJYEK3eDTPyc
         un4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747321379; x=1747926179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxsp6oGjuNOX+xuFU08PlzO35fGhJ/ry3v7K7kSTtzM=;
        b=Ar9HO/PhdjipSJgDqx+KKbASmwL7pLzqDPJXomkH4/u3LVNtK/9LYMBSjEwULuodCA
         bN3NVYm8rSBCV8MPzN9b2mapfID0oYDA0be2hboi9DHyUCWG8W2uia9pYDkIS61hhT+p
         d94s0Mp+aJYl2XTDOBgUADrg0jX/Px7RfAVwA23mDbhm3Eqdc/LfjCzEOJ8IyR/zxtaX
         SvaTMct+CaBknAMa4Izdsr73/v8k+bNw4lfD3gyoC7dtFspN3tCnDRn6y65Q+UHdrSAs
         MyGqKwT1ULPbo5ryI8GiIygKuinID+zyPoGxXV++oqPSzRKxlzUjxJnOuL5VxIYpKnSL
         iggg==
X-Forwarded-Encrypted: i=1; AJvYcCVSmcmGnv7BVhps3wpW+vm9gNUe6VsKO5utvNAXWE6rPAwP74BP0O/KUqbBmi6fqUirgX7+r+Ru4ObdiimTa1kK@lists.infradead.org
X-Gm-Message-State: AOJu0YygvMuKezSl7Y4trZOqoDrXFCYIfCAGb7F4wtSh7usQPS1niPzV
	lD3CaCmx4FsRDdPazbFXxyO6WzgBeyLlFuuSVIwo2jZY0zmYrjFOxXtc8bAppvM=
X-Gm-Gg: ASbGncs+D0BZR2MQXwrL7fBxbv3s2ovRPzqroW4uZNZaecjz5dDFDlN8FcNiwvbGrsR
	HY62J/MW6O28Tk9kJlgfwI0bgc5V8yV3KZL3ZdFtxg4+YIMwla3HHxUdx5YGrkHzS005O5DGT1j
	x0MPoUOP4TXTbxDPnN99qn7tE93ngVRpkBIpeZm5O88F9KD0ve3XgxoJ2goQKPM41Sjs3hr7lGl
	1vCHIy2BUPrXPPkBOf57fTPHYGWMuGseA+PvpbzuanbLoXzIGYXy+bVwe9gtObuNLMyw8CIN+43
	4J6mNZ5Lmibr2MPD9N/fEoay2ffHcH8NEKb4aSMyY9oXfkvkFQb2/rBw2ViT+RIU+HAVvaiARLn
	l0T2jt6nhvmPBg9izA1XbV+HW
X-Google-Smtp-Source: AGHT+IGdEWIBywfQs4PZp4JdP7brwhiYv1KCdKAMM4y/BZUvPvXwZEzy3DFDz/jA4oHanSe7ld+P5Q==
X-Received: by 2002:a05:600c:358b:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-442f20e8141mr72625715e9.8.1747321378848;
        Thu, 15 May 2025 08:02:58 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3368e3fsm74756025e9.2.2025.05.15.08.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 08:02:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Ray Jui <rjui@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Keerthy <j-keerthy@ti.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC 0/9] gpio: make irq_chip immutable
Date: Thu, 15 May 2025 17:02:53 +0200
Message-ID: <174732137152.17517.12381683522631139304.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250509-gpio-v1-0-639377c98288@nxp.com>
References: <20250509-gpio-v1-0-639377c98288@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_080300_937687_2C3B5798 
X-CRM114-Status: GOOD (  12.15  )
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


On Fri, 09 May 2025 12:45:31 +0800, Peng Fan (OSS) wrote:
> This might be a bit late to post this patchset, since it is almost rc6,
> but no rush here. Not expect this patchset be in 6.16.
> 
> This is an effort to make irq_chip immutable to elimnate the kernel
> warning "not an immutable chip, please consider fixing!"
> 
> The major changes
> - add "gpiochip_disable_irq(gc, hwirq)" to end of mask hook
> - add "gpiochip_enable_irq(gc, hwirq)" to start of unmask hook
> - add IMMUTABLE flag
> - add GPIOCHIP_IRQ_RESOURCE_HELPERS
> 
> [...]

Applied, thanks!

[1/9] gpio: bcm-kona: make irq_chip immutable
      https://git.kernel.org/brgl/linux/c/7b04f98027afd2cc329d00191dfc8284b382565d
[2/9] gpio: grgpio: Make irq_chip immutable
      https://git.kernel.org/brgl/linux/c/a30be40bf1d4437646b6885e7e4e71530e6f82c1
[3/9] gpio: lpc18xx: Make irq_chip immutable
      https://git.kernel.org/brgl/linux/c/289e42df1358abf85e49a140f7224c2abd170b2e
[4/9] gpio: mpc8xxx: Make irq_chip immutable
      https://git.kernel.org/brgl/linux/c/7688a54d5b53f2e3160c00f19b00bc601fa3ec98
[5/9] gpio: davinci: Update irq chip data
      https://git.kernel.org/brgl/linux/c/62be72bdb00ef52a0d0f02ce077e36b1f48ef0ae
[6/9] gpio: davinci: Make irq_chip immutable
      https://git.kernel.org/brgl/linux/c/3f50bb3124d76653de0bcfe251faa357711e3ae6
[7/9] gpio: xgene-sb: Make irq_chip immutable
      https://git.kernel.org/brgl/linux/c/580b3264cb252cae00fa62d58443af09c25f7d61
[8/9] gpio: timberdale: Make irq_chip immutable
      https://git.kernel.org/brgl/linux/c/2993d2dd8ff4e8257a88d4d3f8ffc6df95928b94
[9/9] gpio: pxa: Make irq_chip immutable
      https://git.kernel.org/brgl/linux/c/20117cf426b677e7aced4e7a1b2b37f6080a46dc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

