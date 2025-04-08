Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8937CC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NlrL4zXaJRiVzmccsssqwmA6IrlfBxz76fjvGhSaRWM=; b=Bjf532PN1p/8K889IaAUoE+Ts4
	Jf3N8B+/BdympWn7loyLmoOdGW0P76OB4+XYMQGyU7Ch46poynOdBouUkh60/a6T9KO4CjELoE2sB
	W+fuK62qwHP112vX2zC07fxYqfygwpEhJv+4EyyVpXtx5frYZQy3+u8T03wSRpLDAR/KhumyHPpVL
	eNcpcam+KghEzHh/AnptZ3DpRyQ5zxaqbzx73ZpOxAz0Zi8uxp42h1mk4SWv/VKzyHcA/EwxqpIDf
	x/eGqATM4+4/rNtQRMZxh44r9XxWx++8zBFSBPl/DsOoBfgLOZBl3jaWxmA/nfED6Ta+llIWX/3mx
	hIdJ14cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24z5-00000003OWV-0Avu;
	Tue, 08 Apr 2025 09:11:07 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24lQ-00000003LXu-0Mp9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 08:57:01 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-39ac8e7688aso3920127f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 01:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744102618; x=1744707418; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlrL4zXaJRiVzmccsssqwmA6IrlfBxz76fjvGhSaRWM=;
        b=b/UEgy3dj3Fi7dBR7wbFqhM3dYsf5/OwHmUzdrKHicEaUvDPWqzKUq/6gJC4bdSr0r
         hJ9y7/TH/HY5CUDdIL0F9i9SSTOw/FbaLUqJgcuAuhHquBv2bUnXqPZGk7hy4H2b2cpf
         lCE+nYcW8N5N1Jl/DkReGc/XSBEfRAxwLyfQ7OkHUAARQuO4fSqQHJYBW3zU4HyBV841
         8ind9XPjmJhnLRvsltML/r31O3vnfbatBle4NUX4ZS8pWDFSQZsKUgHvlHlnHH9u20LB
         pB1CfsEGOXmup9yt1SJ0p57I+7ObZe63zMa/4dsHqLC1cuNlkAHiMh940wsns2aRdyeH
         V4Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102618; x=1744707418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NlrL4zXaJRiVzmccsssqwmA6IrlfBxz76fjvGhSaRWM=;
        b=qtDhb792D0TzF2Ub3k6xH2fbBobla3vfWE+8FzBTnOVs4cvs6E7BvDo/kyqWBtCMiU
         6UmxcrYNduCcvrJlYFhzRSYn/xcBCM4qkmeT+SsdGjDxA29CmQsMA8+ec3OgXias77al
         FUGf8QtyfYFcW3dwcoH+wmH3z6gD/uWvcGQo0zZBWtpijlzq7b3S5Mpo726gtKRwrd/h
         /ggv8M7BdtlBGL3IlLklje/7Tv0njE/n+CPd5z6c4PX047IUYqRXX80tjpIz0WQOT8GL
         zZUyLwPz4X2wNTxWrGlXRJ3o30KALbCZoIMEp4XXzNdqSeUOcD1U63ZTJ3RnWId5cIPk
         H6WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvwUQkoaOwYDGqUXzzAb2NOuGOXldviWh13pyRnQdC4bNPcspoBtLlrUKO7iszmFiYtnYWZ8ogIc78NhYDYap/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1pm1o7fB8ddlMdpLYxYypwF/rd9e1RXIvR6pdVdNaOdaIxAaq
	sZxjWphw1X42cu3fosaEc7KydtmYWqVIRNvul9iN94GvgLJE2vxfQyQhbEV8gNs=
X-Gm-Gg: ASbGncsIdZGvsxdr5y5YjhO4w1JdEu2ufDgwdlhNLKJJvWTepV/NtDJKFI6LmDUePTe
	CgGPXtbgL7sdTVq7BTJ3ZMCjt7mZny/wRBMzDNe4Fuz3OoWCCSoIQXcg/jzaXBVwUOYHmd3p4LV
	Aln3u/qrNlxX9/UC8W7AMZQp1REY9mk2rV5QnPDbIVb9MqYy93EkQTPQqFVX67KhX2ZEGMTN8Ep
	br21u/3FTvTKlBHRGVET0Aw0/3vGiOG2vHCDCyJ3sWKh53m/WrKqaa0js7HVu+VWQx6iCWfvWbO
	ZuwEDIAflk4Htdrn1/jDdYMUTXLtC0kq/h2e5qCZ/XGa
X-Google-Smtp-Source: AGHT+IH+3XHGTXWwLQ8aHwnlELIPNmZTRMwkmMqzpY2GuqnkctbVgWOC3EDFl2D0p0YtAgR3d4+z2w==
X-Received: by 2002:a05:6000:2287:b0:38f:23f4:2d7a with SMTP id ffacd0b85a97d-39d6fce1200mr8698026f8f.40.1744102618452;
        Tue, 08 Apr 2025 01:56:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d66csm14778725f8f.63.2025.04.08.01.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:56:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/2] gpio: mpc8xxx: Fix wakeup source leaks on device unbind
Date: Tue,  8 Apr 2025 10:56:56 +0200
Message-ID: <174410261480.40984.15525439488118757533.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250406202245.53854-1-krzysztof.kozlowski@linaro.org>
References: <20250406202245.53854-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_015700_137896_A5A45239 
X-CRM114-Status: UNSURE (   8.48  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sun, 06 Apr 2025 22:22:44 +0200, Krzysztof Kozlowski wrote:
> Device can be unbound, so driver must also release memory for the wakeup
> source.
> 
> 

Applied, thanks!

[1/2] gpio: mpc8xxx: Fix wakeup source leaks on device unbind
      https://git.kernel.org/brgl/linux/c/da47605e43af9996eb46c8a060f259a8c34cc3c5
[2/2] gpio: zynq: Fix wakeup source leaks on device unbind
      https://git.kernel.org/brgl/linux/c/c5672e310ad971d408752fce7596ed27adc6008f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

