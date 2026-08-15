Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D1EC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 12:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=; b=R+iT6282IU4IwU6n+Dg5ZCZ3IC
	6pEYLIoUc4+cJ7m8+f4jmPSm6XzSkNiqwgYtZojocPTJdBWfPWbh/5rgveJFpdExMCzojc6LNsqbE
	JKdW5pcHFwTseckkEh3Ikk7YVochNxl3lHDGORV1837+wDjs/3ORFdX8ABpsJILp0miW85pS3g5Ur
	GHtlKucYXKBpoxQhoSrGwCruR4R8SQc8MYpebLYC9uSm/NyHQLIckw5JYX+BC879Zjga2yY7F4HpX
	UtgzGBzrjjggs+1v9wL5T/zLWP50LqdDttGSnSIaqCy6mZGhocDESxzLhVKBL7eBYoHDiPYzzFBMC
	0v9G4X/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvDPe-00000003oYi-3fmF;
	Sat, 15 Aug 2026 12:22:58 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvDPZ-00000003oTl-1iH3
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 12:22:55 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47fe45db360so222780f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 05:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786796571; x=1787401371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=GCfQiR8NUckIryEqLKUwjqn3BJTWi51kmc3ql4N0FOKqd8R0F/wc4jdeKHILo3fn8+
         +qGTt1aU7EXiPQ4AeF+7EJZSG20lnMmjhTrkkKK6rb65fdrK4GXa4DhrokoW4JW359l9
         S5RNJT7ZKm1SNjpvsS+QgNfqI3ys/kjlTFhuOdOaol4eGu2lOOsxdKgfeFQ0OUUf9+Dr
         4ZHKigDdu1LO1bDZlVVKzbtLJqZESeL4UkGmnNPpj+u+QwKsdpKLZYZwkl3XBZTwF3B1
         cxzv+xHQoIZDsF/H2GZk9RwH3a/POQEul5lMgjt9DOo1LDBDRWx0cCeHNE3ZlG8czagO
         PKug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786796571; x=1787401371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWaFMfECfAcNnDKgk6qhf+kNcK9LJeRhrar57dzq77s=;
        b=aDA6fLI4ahaJKRU9E0WhoAyHK5dvT0bOoNIfueoSw6H9T/Truic8Rvx/YfvCV6CY/1
         bOXL7tGzRSCGdLYPFgeO1aNYSrwDAPBrQbovIvyGdzOFJGZl7AMVpgKwQ6ERud5AAXTc
         KvCtlIda4SqqU5UUo86iAzgxm/i/NBm7+C0lU3KUl1CRPZMmWCAo6cO3GRl05A7v6Faz
         nsfKOQ0F3RlZIHQCHZC6MjgMsIcYEC98EK2cbiksOUHTkJR6Z3pFhchf2vsUfz5S9eCj
         l9lveIIIT4h2+Q9nCxeeW7vBVhZTRDRIABzMZsk5tGS5MmITseYtEjulB5h2hi+7D/57
         6h3Q==
X-Forwarded-Encrypted: i=1; AHgh+RoojdneRg3FrOyWflJDABH4n0ioq4arjrkFKP/jBGIH6fr4soP4L0mLr/ZwvuupKOYbw6UFAtDThZnWHvz70EaP@lists.infradead.org
X-Gm-Message-State: AOJu0YzH3RApqukK6HE7E9Gro0PAA9ACd6MSbMllVRMjmDWfHP6Le6kE
	q0/jPonOH+6eDJdHenshxoJ/CxuqVPPOyXwT1NErOxiGyGx/TNjIVxcGrEl5/hEM
X-Gm-Gg: AR+sD13Iqnr/+9s098dECngqM0jicoCktCjLYsX2h6Po/uEokj3aXXaF7Ju8o0gW2+B
	44K6B2FszRTTm8v0d9KIccAq2JfQou7brmVjMPQW9r67ukxh0PA9FgNHtBz5L1NhggRAYYvm268
	cnKMnZhAqmtYVLmNCeqoWZN+p8zzyMGVsoj/3/NRbQkOvE4lFv6/hVS8dCfgcZHSJdRUzsTuTAr
	EPQJJ6UDGXjT1RdtTqLp5UYVm5GU7c1uu4RNGEXfC7jBT3Ov1vNeElk1qVy1T06tlpJnA7lzOIf
	JJGOTZPjCZjSMxdVffbbhW/vmGMLVRdOU7MUMVc1di03AaFkqAsalyjq7Utt3OGXfdaAGiNWmlj
	kwWsqn2UeM3A9SCSPtTplD+2ZDJCh+w+0SXthBo1h9fc4tYHLyepDqzhKsj1fvPaX+hjos7vPPk
	nKb5drMsQkwFd9TRIt+SzU8ZcTWmGwaWUACV9SPO4A+3KB2aUOUxQ7mWkZD/ewimjK09d+/FPXS
	np5pS3179KG6vjHasc2UCyfVyfqlFYb+T7vfkxfoh6JewPcpFMwdneoUx2R9aCHU8MR
X-Received: by 2002:a05:6000:1446:b0:47f:959f:d5e with SMTP id ffacd0b85a97d-481606984d0mr9483486f8f.0.1786796571543;
        Sat, 15 Aug 2026 05:22:51 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B932600BF05B505F15B0ECC.dsl.pool.telekom.hu. [2001:4c4e:1b93:2600:bf05:b505:f15b:ecc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f1fff25sm26930649f8f.3.2026.08.15.05.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 05:22:51 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Yubing Zhang <yubing.zhang@rock-chips.com>,
	Alexey Charkov <alchark@flipper.net>,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v14 30/38] usb: dwc3: core: add post PHY registration hook for platform glue
Date: Sat, 15 Aug 2026 14:22:33 +0200
Message-ID: <20260815122239.65405-3-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260813-rockchip-usbdp-cleanup-v14-30-b5ad9c68fa11@collabora.com>
References: <20260813-rockchip-usbdp-cleanup-v14-0-b5ad9c68fa11@collabora.com> <20260813-rockchip-usbdp-cleanup-v14-30-b5ad9c68fa11@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_052253_580190_7357A546 
X-CRM114-Status: UNSURE (   6.08  )
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

Tested on Orange Pi 5 Plus (RK3588), 7.2.0-rc7 from rockchip-devel at
ea51774c5c42; details in my reply to the cover letter.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus

