Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0A1CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RQDIbLgimVbUl3Rk1h7DgepboLPCimSzwadLXc104t4=; b=a0U28AD8nLE7bhMHQFza7A/u0E
	8EtypcUm86LTZkHrQ/y0TJM7NDB+LaHNuB73VyRmXdFxbnosuanxP2FU33wcekX3SNwiErG6k8V+b
	O2Uh7i9ZLN3A50DbeOhC8XLe3ypo815VedITcb2dx/GmbVI6HQwnVpza1miuA8ScaMjM8LKnWZDlb
	NBGdwYMqj+dcFxafRkpSs0X2LzaaZnlLMSVsoNyq1R2rP3I1zqnSo8/KrbUWelwCGXctZWvhuq3kO
	tCaGrMUmrcHC/2CfQ5vikVy3f1IVK92Cy54rPbTXOh+AqXT6MheQ44ZN2qNNOpXtJqBJbnkx7LRNd
	/KVTzhLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQAQ-0000000HIgL-0bfs;
	Tue, 02 Sep 2025 12:31:18 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNro-0000000GZBB-1ISV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 10:03:57 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-336b071e806so33580581fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 03:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756807435; x=1757412235; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQDIbLgimVbUl3Rk1h7DgepboLPCimSzwadLXc104t4=;
        b=si/JKv0F3ZdQi9zocK9sybBhVIUAElf/0fx4jaHYbZR9Bb/dgl6rHjEglM9G8zcCHn
         57BmbUTmMmr/Qbz0l8sfm7+/ld9ac9ceYv7SQCGtAQCueTsZdOSehsjwwlrh2P2E1dxh
         o3CyawVvOFcsxZqcSISiNoWliSZDVALXC3K71hp6KUWt7AAKcXKrEpvxeoIgOi7b2ued
         t+MEKx8eFwBzkgY8lt+LBQaNseKDQFC/54b1ls7gdzndmWxjX8SpUNAb8ZWZNcmtJh5N
         +NwqrVdpVH8wnP4XS0eMq3rQrdzpPNpM0yp8kCEnMSMfvxNc6IjVqS6RjCcQHTO5hOGT
         6nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756807435; x=1757412235;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQDIbLgimVbUl3Rk1h7DgepboLPCimSzwadLXc104t4=;
        b=IDUEFOJwyBg8eiTlqEuLSoFeCJhu89K2iuArdkQQo1nl8nF4leH8dXtV0VIYFzed10
         x9+KD0xsZPs1duzAzT/9LeSlmgM9oexrK3rdixTE9F6ZV13dItfMCr6IZGkR55HA2i4K
         1ISl4uEP9zZ1AQHyG6AiWhspa7CPJl5RbGfoM2BN/xXYOProNN1lWfUuPdObWF3zURuR
         siPqEtUBV9LizRWT2ZEKzvKkeIxiPnJ/6vNVm3+HngGm2J19rm0fXw6O/DZTKi6u7+5w
         oXeqE8+dX0JmlbHk9Gty/B0Nt4T+ekKi8AxapuDJctROg0hJ4ZS89su6Dr03HLUzGz35
         QMtg==
X-Forwarded-Encrypted: i=1; AJvYcCUTy8I+fueGxFGltzItrM3V7AYuAUMwqAczkjobuwNOB3JjScyXNlvVvUnr1yWSbbOnsCaOwXB3Q8Ty6tQ/+zuP@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9y8mri5NqXGcwf8D3nvL+RXAPPr9yDOLKWXwnxVnIqUK6b+kc
	av1dL9JxQbf5Y9yxY0ljAE0RJlXUikqeT4PVnkMR2StrS2Ixe5C4eL8Q94LtMkimTRcKGsoBGQm
	Eg0e5Ienc2XSr4BCZyxU5dlRg2cFa1DQRrTwerA83q/19jxqRexMnpcU=
X-Gm-Gg: ASbGncviIZ2nDPZoQGiLX8X/zlZhr2OmjGDOAwrjodjDidW/y4DCtNbNsJGXENyCksO
	orRjn8RwZccb6jhir9bieAJefwyAzawqHbxYRHr69Zg7w9YkayXdd7VEkeevfPMTdKILqEMvnRz
	cjVtAdg2vNKFG6Hyr8rFOmUnqeVUngc92bi6Q6CxEnQ480mBSRfkH3lLGKXG7qLQx6PJ9lPwEAQ
	PaHu6sUYi8tn38OeQ==
X-Google-Smtp-Source: AGHT+IE1BlKadkaF5kTFrWzyfYeZ1gvEPDs1S73bM6siyQqc2LEO6j2N1sYbNnQdDv++P5uJf3aJ4CJmqxHTwwn+dFc=
X-Received: by 2002:a05:6512:3b0f:b0:55f:3ecd:31b9 with SMTP id
 2adb3069b0e04-55f708ec379mr2871898e87.26.1756807434523; Tue, 02 Sep 2025
 03:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-gpio-mmio-mfd-conv-v1-0-68c5c958cf80@linaro.org> <20250811-gpio-mmio-mfd-conv-v1-2-68c5c958cf80@linaro.org>
In-Reply-To: <20250811-gpio-mmio-mfd-conv-v1-2-68c5c958cf80@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Sep 2025 12:03:43 +0200
X-Gm-Features: Ac12FXzw139kUIsz1dfkuS3UcF1OoGTrZV60kLcfqSHr6g-PiOd7LzRx_KnI0uE
Message-ID: <CACRpkdbuoEitE6ggrmLFBhTCwRzBq4J75RPjFpKzzu=9eXzEbA@mail.gmail.com>
Subject: Re: [PATCH 2/2] mfd: vexpress-sysreg: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Pawel Moll <pawel.moll@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_030356_344742_1C392D87 
X-CRM114-Status: GOOD (  10.33  )
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

On Mon, Aug 11, 2025 at 3:36=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

