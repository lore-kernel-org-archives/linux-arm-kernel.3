Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F89CC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=idqGRAR7bH2KEp3wZfnzOTNqKgABlKC7q7qILSds2X0=; b=jH0K3cA6R6hIv1VM0OT3dpYl0X
	xWhNnVJFdlfqv4waQ3QLJ1n9e8VMRHFOzttgKpRnhQPIQdhtKk9uazisaWcQj1N/z1jcS2sc1JISN
	9BY2Rj2hHEAtuRsvm+ib+wU6pl9yhgtJz/uyeojrpjo+3YE7rZz+0RpbP1k6wAcbdq5oMzcKi7XZy
	ExctXUtOGfVkcvUmGDL0fNQgUNgUddS7h9EqXFHACeyMvStpEZPl9b/bKHc3L9mEe+Z00hHsd+m/X
	ccYLO4+iaoKNv3dmB8/5BwWR2HwfUlzJ499NjMOsGII9S//3u00P/YbPc7XnxCsU9spFqdIAY+t6F
	zcP0Y7ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGBS-0000000FtmH-1hbO;
	Wed, 14 May 2025 17:46:22 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFE8y-0000000Fc4m-0It1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 15:35:42 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso46848695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 08:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747236937; x=1747841737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idqGRAR7bH2KEp3wZfnzOTNqKgABlKC7q7qILSds2X0=;
        b=rkP6FtisgNixkYTDq/ceig2yMgVgpDNvXOZPLtTwmxw6qR8IeYR0SUCzArwGYslfkI
         bZN1MaJGBv4k4y3t3GIJC3T2t2tXQMs4js91749ahCZhEEEB58mf0CIdmjWpzLp0PrJh
         zDvE4omKf11mW+Ol4UQs1tAdhakg/nHMbzyCimTMm3rIeYUm3JZ2DC03o4U+RaEICfCg
         5f6uQGz1Y5H8jsYTk6sR3aMPJBVFqN9INgKD+Tyt9hwwzF/FDsxgTEIVk67zf2CaWWU+
         AFLQL1XlG41iKbQjAHHKVvAJgwEftA72eRZghMOc6gqiTZnBYp40NTqT0ce7kjIPHws7
         Q1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747236937; x=1747841737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=idqGRAR7bH2KEp3wZfnzOTNqKgABlKC7q7qILSds2X0=;
        b=Viwn/H4h7nHwH9xgWVK+34UDr+MjFm70v1X/JJawccit6AfD++90WsSjd2fdcrEO0G
         UgWIvbg+LYCvBF9Uq4hJNOf8DgY8NuuNPRmOhMzse4D61pgWae9WBoXM2gHHLrHGs6Ds
         EDIoFeiEqYyPU97gTNGATTfKEJtXbzNOlAD7VS5LehK48UEfpj+6ZiuZVtF2Qmi6SGow
         RdFXpr0KhdaqC0fuTzimNLJEMd7ZoYXy0KYz53Gq/HawMFPkYQUpJKF294YMeowH6jLm
         6Z7M1f+ighLjdE67hYIg0FVH8OzYwSsoD5HHpJ298lUHZ2/yAwQlOYzWLR7AewZNeS/s
         /JCg==
X-Gm-Message-State: AOJu0Yx8v/OvsWt52vVwFR6TX4ESjeoJV1eT/fSLx92zGe5YC4R2NcdZ
	vTyUXfYLQB+wvhy7f+pusb55K+PvNtm6DGl+dFAVUnbKfTIQ4QGIkMrXal6fsUNer6FezIDNFJO
	mad0=
X-Gm-Gg: ASbGncs9WZHPAbDihRJ8DXqEtUs/fsbCDphBzZ7EYjxLzJsox8LyVjxzyp038GczlOA
	3CVD5SHykCNa7CO434l5cwgU9UArmlCMdogX+nfStL6FgyhZIZx9yAgCca5TKLCaH0hy42v1udc
	NhUBhHRyE56D7xUNBKDedbKoPHaqrNIFHwi2nJAJRBr6koO+aGlys4QIzC0Srt7LaiTtVKOB2ds
	HREO/mWJweePJVzypItcwmgICY4WTfLAbR0RxRCtDa7d/du+ts4OUMpzQ+ytvAUo0JlcBupJ12t
	l2YBeiZKio7YQMaQ9sgLMSRr7KHV53MOvn396rHbieIcjlFOEyyA1cK50CYjDzaqb2hQIzblXCO
	98gz/rBHfa8aCCB1QjwKZbG2r
X-Google-Smtp-Source: AGHT+IFCmh05El55ohgoZq5R2Nfn3DDzJB0oWIDYBJsZTkCWw75PyCCcGtGuioFQpwJTvr+52yNhgA==
X-Received: by 2002:a05:600c:4e45:b0:43c:fa3f:8e5d with SMTP id 5b1f17b1804b1-442f20b9349mr36040815e9.2.1747236937221;
        Wed, 14 May 2025 08:35:37 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951adcsm35415105e9.19.2025.05.14.08.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 08:35:36 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-arm-kernel@lists.infradead.org,
	Adam Ford <aford173@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	aford@beaconembedded.com,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: davinci: da850-evm: Increase fifo threshold
Date: Wed, 14 May 2025 17:35:35 +0200
Message-ID: <174723693271.14834.18146148075528464052.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250504102959.81830-1-aford173@gmail.com>
References: <20250504102959.81830-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_083540_113310_26CFF792 
X-CRM114-Status: GOOD (  10.62  )
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


On Sun, 04 May 2025 05:29:59 -0500, Adam Ford wrote:
> When operating at low speeds, the display may throw an underflow
> error and the display itself goes blank.  Increasing the fifo-th
> value appears to correct this problem and the display can now
> operate when the system is operating at speeds as low as 100MHz.
> 
> 

Applied, thanks!

[1/1] ARM: dts: davinci: da850-evm: Increase fifo threshold
      https://git.kernel.org/brgl/linux/c/17f25c977e9eace1b066417b11d16424772a2fcc

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

