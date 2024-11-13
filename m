Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D29CD42BB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 13:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ns9y689y8f6zmCcg+0fPw1Yh+V6fP1NKoYCbI8gIu3E=; b=3BjFoIx5ox9GoOD+6lkTWP9mnl
	CBRnUmpqRt8OOZVyZTQtCRVen41md4hM343F6LUbSV8sOYObpxOXD1lTQ3s6Zh7Voo1W4GQytpJsu
	BPloBcUnjv9SR4JF9/DrKTypxLvZk5XqFFalRqZ2umQWJi+VMWgNgSKLIJ1xvja27Ca4wQW3jG/St
	nE4KhvmynrL9E+STzRMyMXreOQCUmxwN3bz0P7JKgJ43KWaoye+Bypig8/E+MdXo7mceLfMEmshcx
	cmDG0PIgzs+0RNlUInxtwa8JhLyLxanKSI7S8BFAIyMdytYtQQ0yve88Sy6EMr4twrwWkpEMyA/oz
	vO1HAJNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDPD-00000006uSt-3FCe;
	Wed, 13 Nov 2024 13:27:35 +0000
Received: from mail-lj1-f177.google.com ([209.85.208.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBDMD-00000006u5z-1SvH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 13:24:52 +0000
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb4fa17044so72167131fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 05:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731504266; x=1732109066; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ns9y689y8f6zmCcg+0fPw1Yh+V6fP1NKoYCbI8gIu3E=;
        b=reuth4ARW6zryspRaEZui8JcSwDtbpDAKY1MeO3hWLU4iL0+Qac9HVLCWKdbzLCL1q
         Dky9fXO5k1dyf4SmEt/3KstKEP1w1FYA6HyATCYsyowTEgNdwgx0kZzWqV46GoVEwcxe
         jgH/VoR8bxPruWH9E7vVaBWOlSmhZmcrflTfR0CShQxJ8Ukq8lJpBU85Mr5gDnDH8S9B
         i5okyI93cZ/daviR2N9GW44ldM9KA6J70XcGSNqxPtqvIwQlAiUmLUJnG/tvZPhjVBX1
         WMFYZCXfCDWFyxVzE9S1JkYSaq+/cRHsqcpHGqVeHOJ42GeGTYWDLWYcSoU2qeRk3TsD
         LQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731504266; x=1732109066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ns9y689y8f6zmCcg+0fPw1Yh+V6fP1NKoYCbI8gIu3E=;
        b=YADh1NcPi2Wt8uSMF7dekqcTZvR4qTzRHN+ELMCYCI/hSaMJomZSrdn1+XY8AIXG7W
         43tEHSZmDpjOC+jiZwt/t5bTURg3rqhNgHzAbcyl5ogIBy4cs1gxOxWurtgI3NH7K7uZ
         MxXujeRbMqny3A+qZPFe8KSHp/7TGOMoA4iLJojtzv7iwtPsSZ4KBT62G+k1zc4WVOt2
         oP/rvF5kF7EHET8ldWrHDkY8ZUFYYQzTEj10mO9gHPKK3pj8vkR9PSFTm8igdHeIu/AQ
         Fh1MkV+W5iFn6HY4RvtYqUOhhGH9r6sDRtIZXKTAhA0HtWl4xqbjq+4QQDjSPpKBDbh4
         3nvw==
X-Forwarded-Encrypted: i=1; AJvYcCWrw/RIiwA2ohAkPPripM+2kTlhcnd5KoRh8HIzDenpZs+on9ZYlXgOGCxq0JL5XIJrf5C6j6EYuIAAma1S2F4z@lists.infradead.org
X-Gm-Message-State: AOJu0YzEOb2/WD7+BLPEXWnwUP7c+mOnVMuHNoVUv1MIjNUf8FBuqqYB
	uRqF0puwjc38WcCryS2yPwj5iibhrNm575V2S2/SeO2X+/jwlZbN2sIXlzz8A/B/BrXRk9vX+2J
	OYRXCuTyLbsirz9SkwZbPH+ocefrYrhAFtvuzVI0Hp6kX2IpXmgU/MQ==
X-Google-Smtp-Source: AGHT+IElutiwbB0GChUIk6s9+3Hj1zTtPyYMVahc4j+aIc1M11PmzAL7ureY4EqXBaAJRrLw6NSOMokzms+jMIpiufg=
X-Received: by 2002:a2e:bd02:0:b0:2fb:3bef:6233 with SMTP id
 38308e7fff4ca-2ff202ac4f8mr110018711fa.33.1731504266571; Wed, 13 Nov 2024
 05:24:26 -0800 (PST)
MIME-Version: 1.0
References: <20241111023412.3466161-1-ye.zhang@rock-chips.com> <20241111023412.3466161-4-ye.zhang@rock-chips.com>
In-Reply-To: <20241111023412.3466161-4-ye.zhang@rock-chips.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 13 Nov 2024 14:24:15 +0100
Message-ID: <CACRpkdZxO--q29BdAv9OLu4tBWx1rAkXM8qaXNYEQSta9zjPOw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] gpio: rockchip: support new version GPIO
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: brgl@bgdev.pl, heiko@sntech.de, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, mika.westerberg@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, tao.huang@rock-chips.com, 
	finley.xiao@rock-chips.com, tim.chen@rock-chips.com, 
	elaine.zhang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_052429_557285_871C4580 
X-CRM114-Status: UNSURE (   7.74  )
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

On Mon, Nov 11, 2024 at 3:34=E2=80=AFAM Ye Zhang <ye.zhang@rock-chips.com> =
wrote:

> Support the next version GPIO controller on SoCs like rk3576.
>
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

