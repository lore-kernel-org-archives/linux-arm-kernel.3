Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4162EC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r2a/aauBkaXi9NTmAe9snehCWmybkBs6Bj8pQwjYW9I=; b=L6hcqLpvCA5PDkrHOG+V8DU6JR
	2hfiI8BTNjHQo+lDVAXxE6nLWYltdXXkvecAm1xCnxamQpjhfb6BpTjVJb+waSvVACgLep9kKNrPB
	TzmUSBnqWvdL7a7F2/e+j3bJ3YSKN9mALZeBOKKz9HBopwnCqlHteRBwrcpH5vlWKLZdJDu0/a4k8
	HJzY40QctVR2MNbkD06f/jMJECeHPU9fMxn/GxOn1tdfWOx7lEkiGCJexgWFS7xWw+BoZCpq6wjiW
	sy25YOh1nn/sXEYwrcOOZ1hM+TjbtsV1HJbXFJLDdjmtkDExwRxdZ+zxqgrqvq/VLw5RxcIMk8Jg6
	1ffzVW0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tev9Q-0000000FJbz-2NcQ;
	Mon, 03 Feb 2025 12:02:04 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tev6n-0000000FIvl-1Ve8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 11:59:22 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43616c12d72so6573785e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 03:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738583959; x=1739188759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2a/aauBkaXi9NTmAe9snehCWmybkBs6Bj8pQwjYW9I=;
        b=Q5oK9+bY7NTm+TKQc7xpWXWy4f4HHjLolFyhWtTvxpAsanuSOUoHTFEVuakYvZjcVp
         4mtn1uthbNV2HLRN6HDgCwFKRNSQeZGFdmTRC5B741BofXjFO5te8KeC1sD5Nk7WqCsO
         rTTZaZyQlUa84vff8FvzsM581Hxb6hh9QYBuKxGYl+hxywPyX8aT7poUXxo09pEWzwFc
         +N78BiMgleOS7zE7iJRdjy0UIk669VoFdNnHP9Ji4IoWy2opDbrgvHDdXBXlO8HJvWex
         dNmd2JB43sKCFBLw8UymU4ENBusOIV1gOw/skOCSaO9y9nKe89i2bn3fTFgANPhkAwgZ
         wLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738583959; x=1739188759;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2a/aauBkaXi9NTmAe9snehCWmybkBs6Bj8pQwjYW9I=;
        b=XDY1Aaz0Y+VYZi6ZgTgDkKkApSl9n+qkhBLzB31h4/GZc4/tq1PyIUccpkrxv+cgsq
         zSpQGotsDdlv6G+fjTCivzSfKHJZxNW19d8fBi0NMgIhuIRzIHxhBPCNpT5Q5LI3jgpW
         TqEJwh4iOxGMgWM0vVFNBeoTfA7iZEcPS9msmxi5Gd72/xFbcnbyXKk2Xg5j/ILL0tpi
         kYrgPZElkoTGIIq+Er+Gd6z2Fywkj1PMfqIkt8UgxBeGwc946mdD0wUlB8TEGneOJcRq
         LT2t0jpFOLT8mDyBPA0HHSC7gAU6beWobwCXF2pY4vjhNiLv6yvnz8wUTRwtrnT2Dbfd
         zPaA==
X-Gm-Message-State: AOJu0YyO5G7LGM7IOt4K5b1SIFtm2/QB8vr/ICCOpevuAB+ajCfWaLUu
	EswFQhw6/EjwhFHpKH+5rdYyv0PXdcRgcGsnzC2urnbaAOQ+TXeYmAVk+hyCntU=
X-Gm-Gg: ASbGnctdcqDTwsohDFRhrOg3kevjmrDIPPwXEiahdwD2QUEZF8aXJS7jj67xf3s5qeC
	ykbMH7guKnQxLaozq3Crc9HsRFBSQw+fypRxCUI+i1LfqW/ceiZMIC2QR8X1G832Em/3zLdEEOH
	RxpLIXFkrDOM3trXmjJFEP4qlqMiXjfwZ7vRFCdg+twYnSDOkP9+4F6xih/NbwfzRlbuOlrb8wR
	IBCAa0xjrtt4yevNSNb3CtcqU68zKyyknWm+CFcaQ/hxPYoonhBpVScO92Enn22rbKMqrVlPeMJ
	JBXbDa6UQgEhmjDFFHX9rlrCPEKytos=
X-Google-Smtp-Source: AGHT+IHGpchhT7QUazlfxFFqFayeGo2FoLhy7xxU/4TbchPpF2cuysjOgifUoOGGAfvTdFlGmzeQPw==
X-Received: by 2002:a05:6000:4011:b0:385:dc3b:da71 with SMTP id ffacd0b85a97d-38c520934d3mr6843694f8f.8.1738583959600;
        Mon, 03 Feb 2025 03:59:19 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c12247esm12921274f8f.53.2025.02.03.03.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 03:59:19 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: daniel@zonque.org, haojian.zhuang@gmail.com, robert.jarzmik@free.fr, 
 linux@armlinux.org.uk, krzk@kernel.org, alim.akhtar@samsung.com, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250203102818.56747-3-tzimmermann@suse.de>
References: <20250203102818.56747-1-tzimmermann@suse.de>
 <20250203102818.56747-3-tzimmermann@suse.de>
Subject: Re: (subset) [PATCH 2/2] ARM: s3c: Do not include <linux/fb.h>
Message-Id: <173858395846.133675.14228724810206295943.b4-ty@linaro.org>
Date: Mon, 03 Feb 2025 12:59:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_035921_400266_3180EB7D 
X-CRM114-Status: UNSURE (   6.47  )
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


On Mon, 03 Feb 2025 11:26:36 +0100, Thomas Zimmermann wrote:
> These ARM architecture's source files do not require <linux/fb.h>.
> Remove the include statements.
> 
> 

Applied, thanks!

[2/2] ARM: s3c: Do not include <linux/fb.h>
      https://git.kernel.org/krzk/linux/c/1fdadc8418bebba39899f341c3acdb189668e7f3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


