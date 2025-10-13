Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB94CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 01:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2VZD0X6ZKBVyHcu44cQwkRlDd6EuJvxZbXDHRQf7Yk=; b=DyS8O6TjNFrPmBdSOz1OAHhSPh
	eqag/RgNYSVBzTLuSW5lQUM07pdpJd4JodQ7MRu2PU9W/IvdLRegvG943rYaBoDg9NoZd1a3UcJRJ
	aGkuwFRmT4JXfPyV5jUAWgtH0LJ5tJOU9KYv4fBoSw6FeVKvMtRw5kw3+2e4KPcwyvkczNQi+sV+g
	zkOmrhxzXCOUdLXTYSZOr2+bAF9+/tKQTuWR5AJO2JlZP6O76LgK0tdkEu6tEpAmvISDMpzLwA0qp
	Hiju6A6o6Vjca2Kl1cLGDz0tQtmlpRaxVB4up9ElTXPpsT5gdfUIzE5GOycBuxwlfJTsNtM8Z1KDh
	OBkFkKPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86x6-0000000C0ws-1o4n;
	Mon, 13 Oct 2025 01:02:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86x5-0000000C0vb-1GkL
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Oct 2025 01:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=E2VZD0X6ZKBVyHcu44cQwkRlDd6EuJvxZbXDHRQf7Yk=; b=d5YslCOQu4kHvnX24h7gTh1mwj
	srmeLA3qqAS7PuWIFjhPSi8D1cO33hJAzOJy3FUE5xJrKSAD2YVzKdK7jW2gFgFpXjRZVuo6eyMv7
	iVfA+cVW4atT9Fhr2nVX7aIV3cfvxRz8CvsKHCf4ZTUeCnyIk7z0mXFVBa7x9nFxYBXRkzqehgjvr
	IQ2dmRG7NaXfHLgJLi/IuYoYT0bauxdgn+2mdnXzNp83GPn66eiFuEkiXOlspJ8qYRAYF+QkLp1Kp
	haJgm+DEMFRV8IiwMvEy5OS5BZn91yrKxtfInvZH0HJrTiTRi3yOy9Zg2MQ3faw1H+YpPRCbIghdr
	Iapmyttw==;
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v86ww-00000003yG6-0Haf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 01:02:12 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-79b03c2d4f5so27669b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 18:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760317323; x=1760922123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2VZD0X6ZKBVyHcu44cQwkRlDd6EuJvxZbXDHRQf7Yk=;
        b=DUK7Iw6F0bgTpjqwXq60QJrHTA+Vs5ln2KA3WwkIKyu6VSirp+dUtXTDcIkZ7Xwp7u
         mi/pxOhGXS9Gv8o7r4EUlEG9BmHEpzsrg1HYKxoxr5Bfz5mxppm5AKgi1jVHknkgd0vK
         ufDwfoh8AfNegWydX6X3S9aGz+ygqJ/YEnWiYudI06QC2pzg8ypa5ulJKXYKQvWauHDo
         yNgO4Ky+rSXFzP4GPxOx5erZLip2L/iCs3FL/fN05c1v2heu0JWfS5TwjTFcbl9xdA3n
         M9YL9qJZMshzZLNdoLsvVXPdWX2VqHbG8XNJdl8JpCdqZAutrNPS5gwAfurh6SI3K0Ob
         3h4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760317323; x=1760922123;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2VZD0X6ZKBVyHcu44cQwkRlDd6EuJvxZbXDHRQf7Yk=;
        b=r5kD2okP95BK3fAUwqw59a8UnBNl1lV8RJkezgXuT42+HO5BUTiHziywLgQfoQztZU
         yNX7Eray1fm9dPsQ5VA0+UkBs860L96bvNqfxDGSKHYdhu+qG+6Ued7w5TGZgmfkY3kP
         hbnjvmI5kUlrfYzhIUHOdVzWhCcu7OHpktWFKDpZ0PBDNfx7J75+S8LnStdgBH/KnM2x
         /Vp3yaiuLDQU5jJYYSnue2TDm9aegt0h+ykhGdKuQNZRTAUNUXPOF2bopTAxKYvDhJ/R
         aigssZdqsAuT/8QFrNIAMi9RTa/6NnUb3EgHZCJ6NT5bqItcDDRmF1Oe9jIsfnJIo8bi
         0t3g==
X-Forwarded-Encrypted: i=1; AJvYcCXhg/wr3FFxj5mfytw9NLa5j+GlpCmadyLqPW1oLM9FnxJT2z020gnyyZW4G0I672oDYt0Bjw4voSYlwzEvdRAf@lists.infradead.org
X-Gm-Message-State: AOJu0YwB+fXI6fuZZBoJ1y8+o1ncBgmZ7QKqnYzBEho0FNM8Mt5rJ+iO
	26VPL/7pMI8YWsUjcBsO+4ajuqP88KQXUuEyqrQmsXqTdPDjIIBosZz2mZ6umv/o9Nsz6LSu5uK
	+Ju16FQ4=
X-Gm-Gg: ASbGnctic2TyCtpAhcmixhzw3U9R6/fJlNfji7ZVc0NYc7qHBGw/dGEkhujTud1ke5O
	Ojb/LSZI8XW61oxOFo7KISRiBg7tsdUGstg1XfwhEjdt1xhkwXRdYf9rbgT82q3M07daSGHqqOS
	1dFgKu1BtNJDnEBXFoG3t2N1XqCLZv64ogPanGqOLfFBGfvvVLrlL18Tz+ypJ88Bsq/M4wXwQFx
	uYyrE8nAXEOOXsTplAJZjtvISQxzAEmLyvAZ3ztwhCXa4FRh8Xz01RuK+cW756iZhvwwEz4yvF0
	YbUHTXtG9j0ZPVOuR2YHhldIjMCkr5V/3RSgibVlfo9pu4yOAQi+/ibmnhhOgCe4X1EOnKrWV91
	KYq73P6NRcbyf1XtJL3js9xpBGaV9AJpdY9ANIYpRiv3G/GN8uNFaw+PLbRSF
X-Google-Smtp-Source: AGHT+IHkhsD8Q/l6W8s4BND2jDztyLoKb3Ag770eBYI8rhYQWaZ8cr9fIADYoln3Ut5t+SFwMBNglg==
X-Received: by 2002:a05:6a20:cf84:b0:244:aefe:71ef with SMTP id adf61e73a8af0-32da8439bfemr12149595637.6.1760317322630;
        Sun, 12 Oct 2025 18:02:02 -0700 (PDT)
Received: from [127.0.1.1] ([121.134.152.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2ab3sm9512805b3a.64.2025.10.12.18.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 18:02:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
 alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com, 
 shin.son@samsung.com, Raghav Sharma <raghav.s@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chandan.vn@samsung.com, 
 dev.tailor@samsung.com, karthik.sun@samsung.com
In-Reply-To: <20250925130457.3476803-4-raghav.s@samsung.com>
References: <20250925130457.3476803-1-raghav.s@samsung.com>
 <CGME20250925125624epcas5p1b8da5d2cca89128d286f740b9896c609@epcas5p1.samsung.com>
 <20250925130457.3476803-4-raghav.s@samsung.com>
Subject: Re: (subset) [PATCH 3/3] arm64: dts: exynosautov920: add CMU_MFC
 clock DT nodes
Message-Id: <176031731657.32330.2231798506683118457.b4-ty@linaro.org>
Date: Mon, 13 Oct 2025 03:01:56 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_020208_672024_519484D4 
X-CRM114-Status: UNSURE (   6.04  )
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


On Thu, 25 Sep 2025 18:34:57 +0530, Raghav Sharma wrote:
> Add required dt node for CMU_MFC block, which provides
> clocks for MFC IP
> 
> 

Applied, thanks!

[3/3] arm64: dts: exynosautov920: add CMU_MFC clock DT nodes
      https://git.kernel.org/krzk/linux/c/e3be50e829aa1aee713bf0c6907acf13d48be310

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


