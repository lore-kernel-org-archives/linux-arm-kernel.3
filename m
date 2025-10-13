Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE15DCCD18C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 01:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1TEQtBfUYYndvsc8G1MAwUYtk9BHiNm9VJYBElay+b0=; b=kKOLnvaWdM9R3i9tgxS439Rncm
	yzD3T5M/b/E4yClgjV0l1Ok/irCna90x1Nad9WvHoKw5z4X6aufhbXAbppxZwaAKXVwtWIHnDah1w
	+0ofhGa5ruWGDffrf00j0FX2ZQanb80cziZDORp5KMSwXpd2V9xuEglvPj9EYzHNZMy30854GoM4N
	rMAxzcXceqAFOwZrInSaV1vKnHYfnkBpM1ZVZiUKYh4bqwn8KJQZsGe9qrjMby9CNS2pas4R3Zf++
	GdQq4LXX4glNee8jAiY1eBs+V4H0IUZG9Yt8Ueac+mn/k1Ji3qE7gaTiIHR0gdsUYoEy4iEgXgfd+
	RjMRybHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86x0-0000000C0sS-3NOH;
	Mon, 13 Oct 2025 01:02:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86wz-0000000C0rG-2aMq
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Oct 2025 01:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1TEQtBfUYYndvsc8G1MAwUYtk9BHiNm9VJYBElay+b0=; b=F496U5t6c78kOcR/3UQCoS0HUi
	GFRQimmZda/mlZj06MtaciyEa4b4RW0lBqWbHLjbP8Q0slVhpESpcYwxpR96vZ73rwYUsR7EpeUVg
	G+0aYhpmEENxdtbDg1lY8bBAuR/OjtVUwaciAA50wA3cXh2iU02pfIpw5/vadO7UPDvQTU1M9xX7r
	E7mNVeud+f4GT1nP9SfUNUbeDtGtXffG6B7TQ7A4mIqcIEqLSwbMQAnMW34BHDiKWwKLpss0YyCPf
	UU9zknjwcHCITHLk/BwAI5CRv/xGS/rhAT03Bkfnt/z4vxdQpWtRzPmt0Vzkgt9vMnC29+wjsBw30
	nVcv/jCg==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86wp-00000003yF0-3XLJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 01:02:03 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-76e2eb5c9c9so105669b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 18:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317316; x=1760922116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1TEQtBfUYYndvsc8G1MAwUYtk9BHiNm9VJYBElay+b0=;
        b=lNkkTTJpOml9L8CNbIOpXOsQpewzsDjUpechzGZOgeRmjQs6Z2BTTGt03WfPI3rMj9
         XDp/SX/Ahe3nZq4IZXw4GJRrXlE//FgerSOB9yxL/AgMxOYuIVVLSv3V0l6nzU8u5iaW
         VEP4RQle2XFtlHk7sj0kOOUzZyw9oICRkZtk/G99pG0XCjSN3OCWcFp1LtrSSXcpviRC
         HybG0F4S0ztuHncJec/Rv6uKA0kqRjLMY7ZXpGSQ3lHT8kI0Q6KYRvdqAk6jF6ila0V4
         3V0pCn1QbZfizSOIDopJKYnKnNRtnoEVQZSi5dcfDRHs1IMD9FrOTsnxb7shpv6hC1Gt
         KJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317316; x=1760922116;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1TEQtBfUYYndvsc8G1MAwUYtk9BHiNm9VJYBElay+b0=;
        b=nr4zlTxbp3zunRlm9QkRaRCoT5z/n2PvSn3jvKpOG/seaG9ZVXErW90cBgIX8gP43p
         yQgxE33fe1NF8BFQTB0F6AeFES/AImQ8ApMjkT0sGS02Ks9Gj44nfeXbsptDDlE909NF
         Mu38YQrD7ll86VP6d8xVe1RvoSwfQz7gcjdyumS28PlBDoI3FzCWMxKVs/Sq+dGZbNSU
         hijtNOOej+zYPGeK/nc/rvBHEaRA5zB24b/8epu/OBQ71I/lne3KM7dTWC6dYMiPvpwR
         6ZeROiyyRMIaUeVCC5vBhVsQy562RcraRtT5hb2NyrXFt1K6IOeGzgr/TdTg3JFx+nf7
         dBkw==
X-Forwarded-Encrypted: i=1; AJvYcCUIv5Z+rlXykDvi32990qxWgbKIXJWRw6/uZ2oVA5cC7JEDzTXyGLbRdnu388DawqoSZm6od9USlIwPUV3HbrGu@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1oTURAkNUQwu6MxjQRlR37xMMFgvLDqK3eiul0+pDv4nymWTn
	qcqLkh4slXgvLCWEbOM6UszbyOdHPOXGzFVct3nsPnHGCzPTRuk15h//tA3aOfKNrzc=
X-Gm-Gg: ASbGnct+0shGKoKgOgZzEtVX7cD19iz/w+j00dawj5Dw+GNDtQz3iiKcCJIHaMqovTY
	8WJh+7GsiVVRQgF4IRV7zCXiZnxDirb374RxVYApfCzs/fhFoJcNCoUUFq72YmP4zx09OkRvw01
	dxjmvyquXaTAAsv+icPzTZfCPVbbSTP+vKSalROn+hIZGB+lHS6Q6wESPREtWUEa/ewGkE4a9G5
	e2hDKXy0YahUhDYOqCrlVAxui+L3Ys2+cWNOI4XCQJCdzvRde7y8ywminiKNz6NKrTNGsWkF63D
	SCpCp7IChk6LeIhQt/nPakp0tBUHn2bj4R9VhuTKcSxzAnuBccRiIV8clJkcKg2VIegVvfU0bML
	JA9GOF+AFsMqMQbdGMRmGJSmAe2vFy1txkrfPU8ziFzytXdndyLV8N9GmL+hPMkhpsXp961I=
X-Google-Smtp-Source: AGHT+IE0pV2SdSy2BtqzzreV56Z2CBh5fAGnmk9U/0caCiZx4MMe4ASrcDCjjfJh9mw5C6vsUpzf3w==
X-Received: by 2002:a05:6a00:2295:b0:781:220c:d2c8 with SMTP id d2e1a72fcca58-79387146ba5mr12386110b3a.3.1760317316323;
        Sun, 12 Oct 2025 18:01:56 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:01:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com, 
 shin.son@samsung.com, Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20250915095401.3699849-4-raghav.s@samsung.com>
References: <20250915095401.3699849-1-raghav.s@samsung.com>
 <CGME20250915094517epcas5p2186fc92cca758b6fe610c0ec91ee51bc@epcas5p2.samsung.com>
 <20250915095401.3699849-4-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH v2 3/3] arm64: dts: exynosautov920: add
 CMU_M2M clock DT nodes
Message-Id: <176031731074.32330.13412044019926403871.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:01:50 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_020201_993858_0FF919B9 
X-CRM114-Status: UNSURE (   6.34  )
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


On Mon, 15 Sep 2025 15:24:01 +0530, Raghav Sharma wrote:
> Add required dt node for CMU_M2M block, which provides
> clocks for M2M IP
> 
> 

Applied, thanks!

[3/3] arm64: dts: exynosautov920: add CMU_M2M clock DT nodes
      https://git.kernel.org/krzk/linux/c/7b0ccabb873de4b4dec3214b2a0ee3c32c326101

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


