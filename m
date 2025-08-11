Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0818ECA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 09:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Qn1l1+ZBQDpWHIpCv84QlPIvcnD4wklf3q7JJCJ7Zg=; b=SmIXLnNtYfuFOF0gw0/qYXdUy1
	acZ9333xWgnz3LNopDRt7L7tSTgXz4+yF7bCIvv1DKcyJ9bqNFyJQ3b7eXdly47fyofv+yETvG2I3
	P8TLNmLf3QTO995yepMwgl2Q+EKIPVmip8XrmdbEd9kKYM4lV/MqGsZ0a03xd8/47rkyQTYCZV/sb
	m0DHSHOrlNL2/TK1zeIPSAGWtg3LQ/hRIM2wsk6ohNModm9eO1XpJhm0B4VAbJRkshcUmS+li1Doz
	/R/aduunL5wbomnCSGDIMR7ILOl3FCqsIvdF7Kc02a9ujbFeikgtEIjXAq4i1wILYQM0UmLPjfTP8
	fGULB4KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOi0-000000074Lm-2ReE;
	Mon, 11 Aug 2025 09:20:48 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOXv-000000070an-3uTI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 09:10:25 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3b79bdc9a7dso2488255f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 02:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754903422; x=1755508222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Qn1l1+ZBQDpWHIpCv84QlPIvcnD4wklf3q7JJCJ7Zg=;
        b=TYEWwGkeYoqsrmIx7u9stFn3cHLMUeHdGbTOvF6KP9k1gHRiqwDXZKLk39DaG61519
         PuriAeOjMJniTj79hpr4wEB+pZYUJjBFZvR0X4/lyL2TTV+Zx/owtGyITI+T2Y4vUCDo
         vRnR09MkZeM8cTHemEFiLE8lkWRP5wQDFzAa3/A/94WczlKcENp6OcNTfGIix3jH554+
         qOhQRdk2XipfbEZ2mZ2scnUvAux8xJLVa5/ejrQPpEtzE8V65zziTOjYyjCOot8HowEl
         dy0xTr8WBvQzWMrFI/jSKcWwHcYzhAnuEgDN3TjELOV2uY+lcftu5Gx9rEGjX+RTW9tK
         OV6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754903422; x=1755508222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Qn1l1+ZBQDpWHIpCv84QlPIvcnD4wklf3q7JJCJ7Zg=;
        b=E60o1zQvGwqRXCbV6+tr7O6MWCBCEjrpRkYNQoG5ryiYzrcK3ohuyoShI7sGFu1XkW
         NyDlg2QgRKPGx+/Uq3yJD8bXF/z7gUX2ckS8o8Iyx9guFY9krUW7v5FS/8yIEBG4YKWc
         gIfbcv+zV57zb0HaTP0qy48HN5zoT4r2FtDBLZOvzgWNKxVUppapATdvA3MqRcrWTkCq
         B6DieqrOuzKzQxnJxMKLMu5gGMofNMg/eCzPCOtWapFILXn336H0DxszCepd9M9mep4p
         9fgehpP9Qkm5Nx5/Bij+u+2e+u0p4SywwgodsgzlBmLk/DuI8l/e0MsYlucGw99Zp6VI
         af7w==
X-Forwarded-Encrypted: i=1; AJvYcCWrPy1lO5e78syzcnXawvH8VxAD9VItrbzGucSnBZ9dKLkyVg55JUDhMA9vtnkPUjdKc8FLzVd6UFWpeIwqtJJ8@lists.infradead.org
X-Gm-Message-State: AOJu0YwkVT+5tITwDS+ieWhPiPBylOY7Xza3KQ6x+XpDJZX2UVSNA4sy
	lDRsIfH/2Sok03xX/rWcWkh58pXloyQkcD8uJVA1NGbY9j+JC9l7fvj2M2rXtLK6yxs=
X-Gm-Gg: ASbGnct5+/6DoA5zvRHN8V74E4fpzUNpvElxFqO4YrPM4igk73UjYQTyk4Nc7mLkXCG
	QRk9+IV9IZvn+B+N6ybuyVdcMpkv8GSqDv6kABdGMLL6DswzEpudcC7sifJrq2DtISpYfqx2Np9
	Y+rE+KxYbD6extPgSs0l1U4W0tha8A9LTTiFJsn6wPDCMhhgkvxdJtJ3ogV3lqyWjFfcCMqKQyP
	wGSTCTQl9CJ9rny4NRnLE3lveZtmgh56fW89L/3wOB8erV+6pv5Mq9JlkELo7+k+HrjbFhP1mdG
	782kl4FFyafQKeLkoxMgmYjr0zUdghUGiyAL1swmLTZIRWbFI5K2jJ8YUOhT4QsWpnoHBm6X9gG
	nrmKDGhynEBLS6009nfZnaMLo
X-Google-Smtp-Source: AGHT+IFdVlgR2Uf1ca3NIwmvbqqLhuhd81ZtRnQK2kc8IJiQBuEcYZM46ftlzImE+aVrkBs1IL9pwg==
X-Received: by 2002:a05:6000:2010:b0:3b7:9d83:5104 with SMTP id ffacd0b85a97d-3b900b83ce4mr9953008f8f.51.1754903422254;
        Mon, 11 Aug 2025 02:10:22 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6841:8926:4410:c880])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c453ab0sm40220239f8f.44.2025.08.11.02.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:10:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/1] gpio: stmpe: Allow to compile as a module
Date: Mon, 11 Aug 2025 11:10:16 +0200
Message-ID: <175490341188.22509.14430833125542251906.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250728060544.18169-1-alexander.stein@ew.tq-group.com>
References: <20250728060544.18169-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_021023_969499_2044A1FF 
X-CRM114-Status: GOOD (  10.71  )
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


On Mon, 28 Jul 2025 08:05:43 +0200, Alexander Stein wrote:
> Add the necessary boilerplate to also make this driver modular.
> Keep the subsys_initcall to not change registration order for built-in.
> Also add OF match table for module autoloading.
> 
> 

Applied, thanks!

[1/1] gpio: stmpe: Allow to compile as a module
      https://git.kernel.org/brgl/linux/c/03db20aaa3ba3998b5a025e243b04e33b5bdefa5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

