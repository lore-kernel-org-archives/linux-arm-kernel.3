Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6578AC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 23:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00gtyCYqXrSE/b5izDUf0f21xEdhdcSgRFslmdAQqPQ=; b=Ri7kP3Dl2WjYh+z+cW0UhB5xnU
	NN91bcmV4K2/a+X2nnD1PhfmjBqczu7Zk+0WmNcW0fnzN5V+wfpQmZrF7+qkaS5Qy55vmsYet+2az
	VUll8NBwZpm7ynb30KmMN6OR4Z13EBXb0iI34VU0xx8beELtBJLZKP/LJI8DUrftp5BwOeHK0bj3Q
	D22djn3HNVgAdwVBqKhBX4e4ePXKnH1hyw7xL66auecWehVNQF9h08MhTh69OZUAHbqTd/UqXceut
	Gm3+e8WSlnHH6Ds5Fl2u2zTrXAf4l2nzqa8kb8wembWb75hFUKjF0+naVpg/2gEVS45LtMpOPTTFG
	BL1usB1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnOl-00000009BWn-06DQ;
	Thu, 27 Feb 2025 23:34:35 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnnDO-00000009A4e-2Wep
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 23:22:52 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54843052bcdso1306719e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 15:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740698569; x=1741303369; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00gtyCYqXrSE/b5izDUf0f21xEdhdcSgRFslmdAQqPQ=;
        b=LunxNuIBvXr55Qk5eCAO6E9mI7+zw4Rj2Ei+dogJ+AryI5k30HDdyKJFWLn6uT9K8p
         o5fw1r+C5YIIxSZdeiHkNsf8juRsbiLB89J3N9zuIa1x/1zhG/l90i3IOqmcFmIoPKPs
         oXUWTMCZ57dfTlKUQwJ4NEmjA36eoT5HzYDVXOOxnnZeaXFojlj+ntm4zPAkzAfYYSfO
         AKervsvNX264wrCXWhh2H+3QNi/t9SnhOWpO82faknzXIywFwVQO5Ld8qd/rLo3oj//h
         iAE0WndK5Dm+ZVvqQp40g5qyX9Si6ccLXxxgAGhRdLttm+Z837JdwN4YR2I7zjcPa9Gk
         mF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740698569; x=1741303369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00gtyCYqXrSE/b5izDUf0f21xEdhdcSgRFslmdAQqPQ=;
        b=NfY73tnv8H4/jzvMOdFHEvdixkKpNSUWtlZqERmn+Ud8vckuoj5DMA5AhTG/crN0Uq
         oRewY1Z5aJBroWQw/l6+UoINVbn3YJznsE/P3yM909r9K8gddvzepvdPw3Cx4TkgRKsa
         +x0utY8r5LhMpmUX+6rRGzpOQlb14iEAJPm9ZYXEa7Z9PYTjhPbin7ee/lCEBoJOekZD
         yeu/HxuOyrHb1QnTU3BT0kC2WFQMciQTvnNqyvdaAkdf3IvIHP+ro7q1dzN+02lmvGvw
         SXBFWDm1w68Dwq86aDw1W5LvTswEfeFDrmabU9NahxSxgXivQzKZQGz956O97nhGJLpk
         TUYw==
X-Forwarded-Encrypted: i=1; AJvYcCW/Tsd4clxI9yYc296JtXc+0/GC7gAQGvBllOykhMdqrrfAVryVuTagWow0Yz/eJVrp4qJWiQB4GVL3AZBCyDQ3@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/u8pmwv4kue9/AVRVENWoT684c5jnOu1rP0G5l96wpFIisPwF
	3DVyjlCsfo5A03yzA2ZonTtChaVEVEMqFaDjE3u+WKaT1TB/3OuVV6dQebVwDE1niyhXVtJxObZ
	e+cvzCtzV7SYE+fu6tA5mTisD7CByGhqBwSkaqQ==
X-Gm-Gg: ASbGncvbqkubF8Jl/5sjNHYCD+8esXoOui2SKQm+x0SpDbaDEcM52bulbI8JF2pDhFs
	bN3Bxoe/7PNEhVDu9+SYqvyFKKDMmWzXTlkEt9LnMfp/V4z8IKu74fW68XD3QIDQikXS92Y+8Ul
	CPEsAXT7o=
X-Google-Smtp-Source: AGHT+IEQkWRbl/rqTGPZWE6RWd1+bUR4lNwgs9fA64RyFVNEkrdR+tkoe+YfJ+7HwPOazZ+bfaaXCKna4jvoNXdJt58=
X-Received: by 2002:a05:6512:3ba8:b0:545:81b:1510 with SMTP id
 2adb3069b0e04-5494c10c90cmr386304e87.2.1740698568904; Thu, 27 Feb 2025
 15:22:48 -0800 (PST)
MIME-Version: 1.0
References: <20250224125414.2184-1-ceggers@arri.de>
In-Reply-To: <20250224125414.2184-1-ceggers@arri.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Feb 2025 00:22:37 +0100
X-Gm-Features: AQ5f1Jp46qVZUb2P-50a9KhXsYzlOeRhxfka-eek84I0uZFyIaa4wogc1XO6a0o
Message-ID: <CACRpkdau2cYA=+UOprqj7n9HCf5xQqpZWxnX1gMmuntr95E+fw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: substitute OVERLAY description in linker script
To: Christian Eggers <ceggers@arri.de>
Cc: Russell King <linux@armlinux.org.uk>, Yuntao Liu <liuyuntao12@huawei.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_152250_644838_21B9EFD7 
X-CRM114-Status: GOOD (  13.21  )
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

On Mon, Feb 24, 2025 at 1:54=E2=80=AFPM Christian Eggers <ceggers@arri.de> =
wrote:

> If linker garbage collection is active, we must ensure that the vectors
> are not removed during linking (by using the KEEP keyword).  But it
> seems that the LLD linker doesn't support using the KEEP() keyword
> within an overlay description.
>
> The GNU linker manual shows an alternative way to accomplish the same
> result without using the overlay statement:
>
> https://sourceware.org/binutils/docs/ld/Overlay-Description.html
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202502222158.UhwuvDZv-lkp@i=
ntel.com/
> Signed-off-by: Christian Eggers <ceggers@arri.de>

Looks right to me:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

