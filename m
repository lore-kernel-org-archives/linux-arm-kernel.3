Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72318E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1BniwaVTCowROQnATdcgMHlEoMA/xTtbAYFVm4+9btY=; b=Nf8EH0V8vQUalsTHvBORL1qTxZ
	+NPc/uYxeAdguiq+u96wWU9BZ2h9yEWnp0kBd5bLUKhWZ3mrJuioAgL6mdSLM/lY7vXJMhDK4EjZ0
	KvptMm9lTxWK8/1IrHFXs0YHsTSAenJY+ClRpBuZHSLdRf5eJm069VZjXnPYJVTpdsoIJgdOTY5dn
	kpEaeTkdEJf+fx3i5wQHsWnUeg3Uu0hPTLoRJePvjiufMzUXdhb55NwfpRptBhtg7+JBZ38R671W1
	2zHqtgzeooSirs9LwIBBiE3cYEvXe64TGl9EsPLoFgyXatsUrKSRaSswMUATjrzOthaYiJcpDCTT9
	FQUIds6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvmo-0000000Gz9c-2BNU;
	Wed, 18 Dec 2024 15:16:30 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvlX-0000000Gyof-3LnJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:15:12 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-21680814d42so56037225ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 07:15:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734534911; x=1735139711; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1BniwaVTCowROQnATdcgMHlEoMA/xTtbAYFVm4+9btY=;
        b=CK68QmTtMnRNZlet803breMum9xwhOXhEC8Ad0myqyTVKtFJnl+RWK6WS3bqGDD0Z3
         3IzGPwHYOvx1Nfqj8gPua+BBy4elGzjL1+82bdnFH6zLMNCv/Vet9o7AojwL6jsybZmY
         +cq9SxvzPQk9Qp666mOFBQQCqlFLb6yxcdnOE4L59TK1LxzwJ5DYhm+JP1di/EMLS9qt
         yeT+HY2tvsNFBG4Ir/uyVgkqO+QJ7ufGY6tj05N61osVsPGFRPsI25lb6yiJVm8KivIs
         iJ0yeO6nNIPHXNEe8AfhF6veJXZrsTFeMS0bgkCrWz0QqCLJsvSFpSSH8FvwmlqFaCEw
         aHXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734534911; x=1735139711;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BniwaVTCowROQnATdcgMHlEoMA/xTtbAYFVm4+9btY=;
        b=lie50m5W6yvitYH7Rr4ntvOQrSO672ZdWXRpRRPBOOORuW03f58mwAoEnm3i2RQ2V0
         cUMaRkkRFWmcBiKwBSIArWgDVgQ83rB+ICy//cylg1PxHrIZn7Y4IdtKlEncHv4jGtuX
         uCURwQdszTywL8llGY6/VcuCYqtWN0c1RLQyzPEnDQZ3porUm9oMGlL1II1DjIULPM5+
         KRMIl/s3fzMMrWc8iK5D9H/YHBfrW4KvLFRHvRZ2pojiFEsAAmZMyReQJ04JI1DcsXjQ
         JIuaMCmHpHbJOBQxpto/OOWRvpDxBCWaiJ73TL/Ws3T0ztsDWkyP22HT/aJle4Grr9Ev
         GLlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFxfeorlzEFP/g4gngeT+FyEmBxUXeqoIUyoIK9q5sn3B73FQXb9mEVQ4PoFgVZV0Z5e7HfzYv6bPgp2Q5Sb8Q@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd63x2NTHCvkgoEG3aDQ0xXkrfNtQywpvH5l+/JHOTrOQo+9Oq
	313zYTwf1sO6zaVwk+Z0GIMMfJ/Ps1BX4yUFzlVdBI46q08fOWL+
X-Gm-Gg: ASbGncvx3PHcInfCWd1iTu/gpRciUwc6vqEIfK+eLhvZX4QUuWnBp2uMh0OlyTypupV
	6zyVqKmC9seh6y4fAS3hxPz4Mdq1/AA+3o5FZLasAsoUmr7AP3FbYKodENNy1/pNdSw9a1A2YVT
	9WwVldBS5W8t+siW7/YRs5cyMbtcrYHB7ez2X1ZzIXdsSzjHHlqP7bZq6vyCj7UkN4Ftl12RJr4
	cpBqd4iKQwIFfGqXogwsncUjNWcsuJ07iQIO2CLAsY5V6J8FfqJfmCQkGZVney9nMCP9A==
X-Google-Smtp-Source: AGHT+IE/4h1YDKKtjFs+zOt9aPjTBxQjnBuzdbZVp1TZRkO/LfYMNmgU1weizT6Rb4caps0E/nTJOw==
X-Received: by 2002:a17:902:da8a:b0:211:7156:4283 with SMTP id d9443c01a7336-218d7252824mr43701715ad.43.1734534910892;
        Wed, 18 Dec 2024 07:15:10 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1dcb47dsm77953085ad.61.2024.12.18.07.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 07:15:10 -0800 (PST)
Date: Wed, 18 Dec 2024 07:15:09 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	eajames@linux.ibm.com, jdelvare@suse.com, corbet@lwn.net,
	joel@jms.id.au, andrew@codeconstruct.com.au,
	Delphine_CC_Chiu@wiwynn.com, broonie@kernel.org,
	peteryin.openbmc@gmail.com, noahwang.wang@outlook.com,
	naresh.solanki@9elements.com, lukas@wunner.de, jbrunet@baylibre.com,
	patrick.rudolph@9elements.com, gregkh@linuxfoundation.org,
	peterz@infradead.org, pbiel7@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v4 2/4] hwmon: (pmbus/crps) Add Intel CRPS185 power supply
Message-ID: <3c7d8856-d58c-4ac2-84fe-7a7374fdddc8@roeck-us.net>
References: <20241217173537.192331-1-ninad@linux.ibm.com>
 <20241217173537.192331-3-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217173537.192331-3-ninad@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_071511_837734_7D4E9DA0 
X-CRM114-Status: UNSURE (   7.71  )
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

On Tue, Dec 17, 2024 at 11:35:33AM -0600, Ninad Palsule wrote:
> Add the driver to monitor Intel common redundant power supply (crps185)
> with hwmon over pmbus.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>

Applied.

Thanks,
Guenter

