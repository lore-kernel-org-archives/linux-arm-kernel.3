Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B0FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 07:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EN+uHHE8PV9NsxzDe/4vVMLQJV2WuEBnbmW7nc4a7jQ=; b=LvKEp/m4IC9DniGLV2jeBWFJpS
	2TrK0ygrKby5s7JGsWt4Iu/r6644ONSc3IMF0yQKWbHoEDOidBJ8hhzlRCMU8a1Jx+AOJVe7RRwLB
	cw/+/xln5YRJFJYxQyEl7/IwlncHcPB9ITDLfsvhBHtNL5u06ZyfvA9Ic3tW+hYdfM6wrXB5NaOYD
	JmK8BtwmiqcPPx3x6YhkCEWYJfxOIRGYJP+f5nniDgW7/DALruXf9rTl7UbHqemmTrebwAI2s+1NQ
	RDMxl9tpOGGZTwzj8+wf1URPV6YzNW4PES4GQLi8/iHqc63GhmHBImsfButuKi2C/AkezSqpbE9M8
	f2EyYcCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucfzV-0000000Bx1Z-2xQn;
	Fri, 18 Jul 2025 07:58:49 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucfx2-0000000BwWM-0wha
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 07:56:17 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3b611665b96so965201f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 00:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752825374; x=1753430174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EN+uHHE8PV9NsxzDe/4vVMLQJV2WuEBnbmW7nc4a7jQ=;
        b=lAXtmpi2O3gUvLmJJBEZsjbvO2O3wX1XaujXj1P0feTApdBpMtLDYEc2oxw4OOOrSI
         RumEsmT8JfREoOVcpziQf1D4YruQMNY/5CKDTzWdbZAe+hnpZanCUrBxdTHuYCPgtQc6
         Q9SHHtGf7fGTYV4aO81OSNZRII+oL7gPLsB4d2OhLxJbqRxS9+zksxXzCpCKlvPbLmue
         fY7RoaTkvV4wltkU5pe79CpP2ozy89R+p64rCVq4i9zLhEiDTl7uvx7vyq/FuhQ5B6kN
         YleFvUFwjFOOwU9JbdWVqYGeM+oUkEvN7IJ5xrkDlPde4XtLm+GaM6nJtdx/fZAJuLuJ
         T4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825375; x=1753430175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EN+uHHE8PV9NsxzDe/4vVMLQJV2WuEBnbmW7nc4a7jQ=;
        b=Vr0lfixllrG8HdRaIDmHFV2fpus4IWRcIoACrdqDRtNXg2cSUjFKdHSC1HTOwlE2hN
         6PpEVx2G2UpKdCY41frlCQ5hxMLIAdTAAdh1yxvDuo3ulq/N2Hi4RWFVzshtunF7QmuQ
         M2kXglkwhKl/rMRU261HN8wOKaLyJUTfEcHsd4/Y9u1JEpn2vlMC5PUhmZsr7L+1C+uz
         Y8xlH1lYDCM/OUqPHwKXq+YUCvhoF92Vy8BEXVp2Qw+2DVy9ke61i0Wst8+t4NoV2RfF
         pFWYLx/HtZjP15NhQQngPVkPQdL8P6VjmrGqsKRXbB1fyS7cb0BCCvskVZ6Baul2MGR5
         X6aQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsaXuRhticqERIqQyh8ZiICprTGNNKu1zRgdD64+SxviE2IGv7gW/U+PaoyVIAgxVHba5zr61q8sY32LaFKNZ7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywtk8xTb49mdIqzzoUIGXRHBm7cFL0jpr4Urj98tWMe+o5Fb+Zv
	rGfQ0Yn+JkH4xAl+QGtj/Vu0DfCpsoS30JVPEodiZfdTWeXKuavhj/CRtfKBGuqpJX4=
X-Gm-Gg: ASbGnctHwzpZa6sWDTe2dOZk85LGYJFakCVxLQrlJ0Fp50BFCJcFjeeQfHKefWjioaw
	iBsS8x4ffBEcUk+v2sZAIi/EATa06FuZuhqdn9ABhx6g7AASVNSzKrIFCgjm6fP/Zx7vhVUzyI2
	1ZiVw7yrn3z+10T1vJl7jcMcmgCf32c6t37RWH7Ym9zmStPJW/poUYoTIwDtWy/sCNm9505Zeaa
	b5wFs+zjCTELmDSREnmcy8HxaGZTDn3eBy+lgzQ+suKXhHUYfIg+aMgK9r0Xv5yQPqL+5rbzMLE
	T8OPUY3EUqEYMWDrtUeQB5i24igsSP6ifVaZTatJEkd6CX6fXFN4ZErE/ctaXbpaeJrikeyIOR4
	U0kKOdZkjHAm4m6O2Wa81
X-Google-Smtp-Source: AGHT+IEiAzcAEAiQ9ayFP7S55kjzIXFer1zIeY1cYSz5UvgjCnvHPIHe5gFVJIivHGSmeTQprnBFYA==
X-Received: by 2002:a05:6000:2901:b0:3b6:1ed:9ad2 with SMTP id ffacd0b85a97d-3b60e51b8bdmr8413573f8f.42.1752825374548;
        Fri, 18 Jul 2025 00:56:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:be63:a233:df8:a223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48a23sm1080851f8f.54.2025.07.18.00.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:56:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: xilinx: convert set_multiple() to the new API as well
Date: Fri, 18 Jul 2025 09:55:46 +0200
Message-ID: <175282531509.45055.666620085878969574.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250717131116.53878-1-brgl@bgdev.pl>
References: <20250717131116.53878-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_005616_504450_2A7BD60D 
X-CRM114-Status: UNSURE (   9.27  )
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


On Thu, 17 Jul 2025 15:11:15 +0200, Bartosz Golaszewski wrote:
> The patch converting the driver to using new GPIO line value setters
> only converted the set() callback and missed set_multiple(). Fix it now.
> 
> 

Applied, thanks!

[1/1] gpio: xilinx: convert set_multiple() to the new API as well
      https://git.kernel.org/brgl/linux/c/906b955c60770bfdfae141aa993ae5fdb3eab193

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

