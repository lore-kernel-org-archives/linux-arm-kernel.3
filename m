Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82697D44D70
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgJxednhr3opq3LZItuuNkskAw/GzNLN+52jnrBsQ/U=; b=tgFojNxJAc9HXIr+2zHfSYGq4s
	QQ/VXQTpX0qgi6Dk6HyGZhs1TB3FNHCmpUBYlKFhBtaPG8Z9SxdS5At4dEJg9rQwoLVMynRufN7VW
	fYLuDi1xaT+iLza0/QDMpkqeGsxh4J6asWNgo3+Va4MobmoywpVt/+O2RzJnbF952OGUpqygFPxtM
	ioV2cmhMPSQJYGCxkG4CzzS0T4rR0snB3+GEWRdJhmpGQNl+iFHASbG4oHVDO3zc2HSBrH6ssOJBJ
	S//QOVvlKvJqz1+0aMp1IYIL6D1KZAe82PQ7ot1nhJo5SCaxOCOcAOCTDUAc9KJy5r668esXtTk+T
	fPs5DwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gVd-00000003VYK-3aSi;
	Wed, 06 Nov 2024 13:55:45 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gI6-00000003SSB-2bLn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 13:41:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d473c4bb6so5970211f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 05:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730900504; x=1731505304; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgJxednhr3opq3LZItuuNkskAw/GzNLN+52jnrBsQ/U=;
        b=VSA2GifkmS5bkbfZvH8Yc4RijhqqY/3bZhNs5ePDmeFM+ogKEW1jCoCB3qEGuBcRBe
         iyqugqbfsj6Orh2xHby0k9122w4lCCgcNl+hN32hgNVPA/K9Q2BezY8hdLPl5qFQLuQA
         dXZpCzJ4n19G9Vr/3iLTBUIlEjieF79TDKHICusUtrAWumK7fcqxJext31ATHGp0uTh4
         OwP/ZquMMKY8vUfLOThdfKoOIYtkBYokVKRZoeg7uIZMOc7f6zr5wT6ELhVVDOe9/Wp1
         RSX7otMXLsQpn5Og+92dkl58inMdOhkYhiy13+0kyGHEZL0xkdlEwsMBgaN47SgTuBVb
         5/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900504; x=1731505304;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgJxednhr3opq3LZItuuNkskAw/GzNLN+52jnrBsQ/U=;
        b=IX87Xy8A17xQx709gcLAxsDmWcGHqLv8ac6VE/fVjM9dqxCQ/axmLpTHlhs3gA1qT0
         5S+fUAXRqOD22cZ7ncodn2MKe5Gv5vdeFSFZWbi/vGld9sN2rL1oHODdvuvx/H7t4DEb
         mS6aTn/UPQ8aYvwEdvzWKyQ+OkKgMOgOITt7Kr4V17/2Gs/if+TMfnwc4JunviHGpjHd
         LuirPxR0hRKaDS6kgnI3GTJkkpVJ8SU7Fmxbul6uffMCKeFWQ7h2WrlOy91h12/43fSf
         JFLyDsdqOlBc3IJ/B92bo/+aD9cSCokAlYwPkrM8KWe7DlkaNN7hvkt5fCajxtWnVj3x
         WRfA==
X-Forwarded-Encrypted: i=1; AJvYcCUk+ffiVIrnFCkJsW0+pVjJeW0NeQpRplA0qtnMePstzi+HaC2sdCsbtnsrBJFWfe79vUz4W3fALxvValUEqCUs@lists.infradead.org
X-Gm-Message-State: AOJu0YwUMs1o7w6oAGJPUORa9jXJgo88YZBicDk22NFKhdfBFQsPwFXU
	/Iewy/euZXgTwaFMyNTq0Hl+uHsUkGBVsB08HKOWPK2VVfW6t9/gfBOV06ejlODgrekuvxD2Ydt
	A0vM=
X-Google-Smtp-Source: AGHT+IEyaj+1sTsFmFtwwzgISgvluY1k3NLJkFphoe2OvRRtlByJCOZac64u/gC+dzPW7X5Bu9rwjg==
X-Received: by 2002:a5d:64c7:0:b0:37c:d1fb:82f4 with SMTP id ffacd0b85a97d-381c7ac46e7mr21350952f8f.36.1730900503962;
        Wed, 06 Nov 2024 05:41:43 -0800 (PST)
Received: from brgl-uxlite.. ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1168afcsm19150857f8f.91.2024.11.06.05.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:41:43 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Heiko Stuebner <heiko@sntech.de>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: Use of_property_present() for non-boolean properties
Date: Wed,  6 Nov 2024 14:41:41 +0100
Message-ID: <173090049917.17542.13429958441997211039.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241104190628.274717-1-robh@kernel.org>
References: <20241104190628.274717-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_054146_960122_6DDE6C78 
X-CRM114-Status: UNSURE (   9.39  )
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


On Mon, 04 Nov 2024 13:06:27 -0600, Rob Herring (Arm) wrote:
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> 
> 

Applied, thanks!

[1/1] gpio: Use of_property_present() for non-boolean properties
      commit: c6789170ddef58d28cfbc3342933713ce1e2c860

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

