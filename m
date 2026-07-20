Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCCAC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 16:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgWQqTl41PqRe7SjquS4u/1d/gci4UsHSjvtso+pedQ=; b=tvBJmyPq6Y7Wzyi7kHDoaaeduq
	IuvPbcWOSo4wpfdnWusveooVBIG0+g8dY6JqCn2lTYInOimxBEZ/dWltiQzJeHaFyiPTDs863X6r0
	vOCANxo27EcZyZAflq18LqbZB0syGUn/1mfqgeQsHEDUMiRRdrHUcTMURSFHAd9qObxAkAP4FNMot
	bzvGk5nnW7nJB51iPWzEuz3xiXISZXYYFd9EmllCE63Aw7TjFRbmrB3DZ5KThC/oJ4rWBTMPx0cJn
	kyz+NmSqRqe2w5nRxKcqkrF9+OkpcFshHawmD2hE9t2jqKZ8Sy93G8NkDbNrv6eL19Et+DJ9x7LLY
	V6aLH4VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqgN-00000007LhH-04CH;
	Mon, 20 Jul 2026 16:17:31 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqgJ-00000007LgT-3pb4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 16:17:29 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-caf707e3a70so2368109a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 09:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784564247; x=1785169047; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bgWQqTl41PqRe7SjquS4u/1d/gci4UsHSjvtso+pedQ=;
        b=Y2P6w7AtnbDKDvjmD/yUB0TEkUTILuMPoo1x+Sr0McidFw2ii9/HKClQzgwhGvpByt
         opZeakW6pdw8Ci/+y4a/cxRfvyHmB9ucJ32VESSQNMdO8bmkXXVTwodJWgxp61KHpH0K
         433arrAC8RGKZhaGJ2WIY5H/t1oFu4z7CjHFILafi1eGK1pg+lpPvINiU3HvYfDz7g94
         cSFgMhZOlDcQfZUBHeu8W/Cqf66xbHy1lyKCo83EnrhonQXl8esCF7vGQKHr2EioxVtw
         jXjEeLA/zbhdNeE9O/Xbg7VyOuGmB1ZkMITN3ce76wvH1fF3jNIExoebO8UyBro2lL/5
         rB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784564247; x=1785169047;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bgWQqTl41PqRe7SjquS4u/1d/gci4UsHSjvtso+pedQ=;
        b=mROmpXDEU8hP9+5J3YZWFJrUA0O/bK1vJKHqfx4rEeSwyrR6Sydu4VsiAxNfaHhLnw
         Tc8BBc8erLn55NPJuLorGnHEGhzHU3CMoscCB6dgv8dEIYGXrk2TLJWM8ACtpYvXmEv7
         1GaYrMJGVLjajnHsUVcQqACthsuZW322qpPG7VpbL23/bjXmwvxbYmDSv9mocyfsz7dz
         5JKNs9bpzXA08/fO4jp2WJQiDedw5F4u9XhqdlSE1DvrsrQSLYmENAWHihLh0go70Yf4
         ssJe+7dnhKbpsAPrlBNcwp9l9mMKRiQkuWKJwN9RpcMNAdyJadMg2Ty2HNVPSCKv4mTr
         lKoQ==
X-Forwarded-Encrypted: i=1; AHgh+RoV+VaN7LMC/ijIhnAaOtvuyzmjUWWz9iXPCWaC8GXowH2eJ1Wb//t+34x7tGlkOEf8o7TjC9sXtJ4he5gfvrKR@lists.infradead.org
X-Gm-Message-State: AOJu0YzIftd5oo+C71R1RdFCMRR7F1EECw6/rhf4IEGiecxgA8+NF9di
	PYDSHSOqEpkKXNOnoLaj6l+tD85rkIb0kwGgWMJ4krNNSDRq9eXnjmu1
X-Gm-Gg: AfdE7cnrg0KQSMc0Iic4QgAGncHACQ7m1PugndavgYmPObEetR1jVSkTBgdO647OlWd
	d4W+nARS4kvtdOKC6pCKGTnwDXnvZo98actmu/Sr/hJF1roDLJx8QMiEj9E+aO0CbNrM3bs85lC
	xw7l+iMRKaGrgexWC8jR25Y1v995xfc2hD0iOCO+zBiNXX4Us3U29hkdgc+jIFtDIztngoXzRWN
	loKgZGqJi15A/5Q1qh59LEbz40rSRoAce7P1uRa00opB8nLrND9CVC/dLu7eMjfAW0PR9iQXjud
	v9XaaWR0k+hFzxGZb9jIQDqzyA8yOr3L+r2YpzjY8/PhMSozRKXEYRzoQaYBUZjIownVcn5sjME
	m7/ubPHMumcZMyl8WDaPILpnM9ninPftj0Sd7Ertf8EsNQA58/CoylFz+oWdi6wzrBbRykZab7L
	lmAXJ+kVcBvgecCW8hoWYS9YhRYw==
X-Received: by 2002:a05:6a20:939f:b0:3bf:ecf8:abe with SMTP id adf61e73a8af0-3c38d512647mr21472934637.0.1784564246909;
        Mon, 20 Jul 2026 09:17:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1ddeb6sm43145565eec.20.2026.07.20.09.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 09:17:26 -0700 (PDT)
Date: Mon, 20 Jul 2026 09:17:25 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Linus Walleij <linusw@kernel.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Sasha Finkelstein <k@chaosmail.tech>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 06/11] dt-bindings: watchdog: apple,wdt: Add t6030 and
 t6031 compatibles
Message-ID: <f0d4a047-5dd3-484b-9fb0-89c12bd93ad0@roeck-us.net>
References: <20260709-apple-t603x-initial-devices-v1-0-55b305833123@jannau.net>
 <20260709-apple-t603x-initial-devices-v1-6-55b305833123@jannau.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709-apple-t603x-initial-devices-v1-6-55b305833123@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_091727_956730_7E99F4CE 
X-CRM114-Status: UNSURE (   9.43  )
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

On Thu, Jul 09, 2026 at 09:30:52AM +0200, Janne Grunau wrote:
> The watchdog on Apple silicon M3 Pro, Max and Ultra SoCs is compatible
> with the t8103 (M1) one. Add "apple,t6030-wdt" for M3 Pro and
> "apple,t6031-wdt" for M3 Max and Ultra as per-SoC compatibles.
> 
> Signed-off-by: Janne Grunau <j@jannau.net>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter

