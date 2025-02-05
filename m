Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE19C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 08:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+es5DswhUHJuqnAtb0R/kgWj5lIvrRgBlmdAByRuO1k=; b=pw6LfeFFWZ2CnIHAa2f5in71pK
	YyeM86QFjIai/QmCjPbcs1lgD65budKz9ZWJ3MMycb4cfIv1qFFG738lTEqVrBn0CJBlRN/JrgIqO
	DxSAiDpfJd9wqEg3d/oiuyZDifm2oLH46AY5ZwghpDxjsFNAFf0pv79JIo8lhyu5gZ3Nf1m5owvmG
	ziAFEdVNfUGIR/LN5EEv/zoSF+w1zdP+kvENXrS933WUT9FwkkH2oxUmmnELw3RMOHJJ9P0BGGck4
	ImfpcWCTg2U88Yc1T4fZRAJAzLVIc9iInpitD77QXwhNmaDFQ1SfzLcRiT67pYzAqFcFi2bMzKTg/
	QHkuKpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfayl-00000002bLi-1hDo;
	Wed, 05 Feb 2025 08:41:51 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfaxO-00000002b9E-1Y0w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 08:40:27 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-38db104d35eso997152f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 00:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738744824; x=1739349624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+es5DswhUHJuqnAtb0R/kgWj5lIvrRgBlmdAByRuO1k=;
        b=vAAhAf4I/96hMCQQ6wfT8kh29+2UQ6JlAN3KBsyypgDcONVm6vaHgGVofbbrbkiuUa
         4BXZVhwY6k55L9xQ0KetexuvFuQ68xcA4JZsYro9+crgLS4AvKQn2g9j44LVhGx/niCZ
         mroAZAgilrESfXyu8kJjnjwzA+5R2cikSvsARqzyTrOwoj5pcfti5PRfBQXDoOt4Bm+N
         4qHVhh72rYr8mAbPTWiy3NAWs3xzDOOJKJYMKeQwJTyK36RR+TRTMpKFYmKCrtKQUIjr
         UhQxHnGlKFtHKZOQdaomcep00DqhpYiTiUbqYKSKZz85X93wa6jUD5rJlAKN8Y5tVTK1
         HdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738744824; x=1739349624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+es5DswhUHJuqnAtb0R/kgWj5lIvrRgBlmdAByRuO1k=;
        b=lkZWfymorwLx1B/xkVC8EtAFYmnJTlj/g7fz3CeocKXzkJ3a3Qgh8FFOxLHBcEYa9t
         34oi5OUlFBnELtWhTh3on1/L1QNrw2nxVhtAJsJD79JFYdMOYUE97DjVmnQyz5ZVeWur
         6ik90hFnQo9raGUEtw5U2BzaN+9r4gwsxrSAQEF1ZjTnWbNRewPuEwGAQg+gYR17PNKy
         8FPfJi2TbTfBAVe+Iz6ZkgWPtrUChsFoJG8SI5evu6NHSJ/QglH0rxAii6MmOnBsea+e
         UOzZ+jgAnnlslSh9ZeZYWnxQFTyfH5R8lIcEcVEDUAgRT33Jj5P7qL/f44Ez5UR4GRt2
         GeGg==
X-Forwarded-Encrypted: i=1; AJvYcCV9GyJSAF+pSGVsipCpaeCLZ/w23omHn1w+r743dq6FG81/zFaLYtHsUKq1OjAivj0qa1wbsBoSBWB7oO1SNYnQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+i4F1eqV1OvoY5DkJRzfQScxdMXw7W3+7b5Au/JjOMvU6lZ0Y
	jpQsS+Sc4rnEYd1YOSwpcJP4GOsjc7i52sbMtH37uQVujfeqVfGj0udlPFSU0sg=
X-Gm-Gg: ASbGnctlA8Be/8zrzfcYM0dbX1txW8LtQgg5XqgVBXgGgemmDk+5MzPQBBDBb70QB6B
	TJvrisnvjvvYG97pMbWf/LwdlolKt16/qsfbM9ghLVP2FWobEkbYkvzBNzesQHQObVT6b9XXG8v
	m7xgSHR9eDWj9OuDqc+aPRS/xaR4g2+UA80A9BKAdDrWoxIx4yVZhDmBEgUHhPeffS0Ty5PVbLt
	AUSHpGh3wKYPu66OOZbWYcjjE3UNK55HP1gmlRVjXc+ptFRB7Ma40YNGAfk8jRue5roRB+XWmLx
	8cI+BxnsGSFcbqo=
X-Google-Smtp-Source: AGHT+IHufl43yH4h42TNeRNb4pIxJfhWtSlcWpDN/3IHQPb679izKuQl7RiI9837Q+o9LDGQeygmhQ==
X-Received: by 2002:a5d:47a4:0:b0:38b:ec34:2d62 with SMTP id ffacd0b85a97d-38db48a0aa1mr1427352f8f.24.1738744823940;
        Wed, 05 Feb 2025 00:40:23 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a766:1fb1:99b5:1d5f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38db6d7fb3dsm704259f8f.72.2025.02.05.00.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 00:40:23 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: brgl@bgdev.pl,
	linus.walleij@linaro.org,
	minyard@acm.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	openipmi-developer@lists.sourceforge.net,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org,
	eajames@linux.ibm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Ninad Palsule <ninad@linux.ibm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	andrew@lunn.ch
Subject: Re: (subset) [PATCH v9 0/9] DTS updates for system1 BMC
Date: Wed,  5 Feb 2025 09:40:21 +0100
Message-ID: <173874481706.6250.3472033617115260753.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250204194115.3899174-1-ninad@linux.ibm.com>
References: <20250204194115.3899174-1-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_004026_688413_113ED063 
X-CRM114-Status: UNSURE (   7.85  )
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


On Tue, 04 Feb 2025 13:41:03 -0600, Ninad Palsule wrote:
> Please review the patch set version 9.
> 
> V9:
> 

Applied, thanks!

[2/9] dt-bindings: gpio: ast2400-gpio: Add hogs parsing
      commit: e8f2ca6be61f1cae2ff12932fa03224581b6b231

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

