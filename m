Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767EDCA5FC1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 03:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAY1dTOwRRbIO6ceOMbhJ+KO+bFWSEcRZxVi+y6APPk=; b=E4Snoyo1g/lmQowRiIxKnb87Lr
	XrWpy/QWEBTp35M9qsQP4jDmJFXAvSA6UkPHSLtvQOqc9hKowbBdLtzLuK2mVGY8Yqnw7UF24MImB
	iLCo0Z7cIg+gHGl7PQcRTvtdEEqLhzC1qYsGzIZKJ5DN0jZ1rgD3m5pTO2lOlEUgzC2nv7unEFYC8
	/YCQKw+ypKf5T1PLVAgFgF4ysYbbjbAuvuroDzAh0aORoyIZ5Hmq1Rw5uy3V4yiZAYvPfef4zyu7m
	Ti2yzdWscVyHYFviumZmirXh6VbrB+VASB8vBETzJYgIQTk6eF65zJToOBMFp6jfrhy3fAZfwPX8B
	YR8Vb5gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC7RX-00000007fGI-2gtg;
	Thu, 01 Oct 2026 03:26:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC7RW-00000007fGC-1RaO
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 03:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=XAY1dTOwRRbIO6ceOMbhJ+KO+bFWSEcRZxVi+y6APPk=; b=B78XqF+k/MlZEjhCRPIv6lRqlS
	EAaeojUg5FDqmr+xdxI6zbIaQ1+Svu+5XM8psDZskLPTeta+4Rtf5o7kKkyhKl+cEyULhkg49BYBj
	Op+jrlHt3dDW9chjbmMdpD2NjstJ4EJZjbRTam0RiTAU/hSLdFtYAQCiz/MgDRb4oV1wrh85sRsAC
	ngTmoV95vhv4JlI3kXsk8STJnYiCXWo0rSKIm7w1wX7MVviMb7Hg/BpD2KdCl0DW/L0PmcQORUUHB
	c2hxECQTn5T2tKYgOp4miDkpgE5Kc7l9hm/xapzCaMJENXimvDAWNkkzmEiv3+t6s0UzXJewoDoru
	u/vkx1Gg==;
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xC7RL-00000004Xam-0sYN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 03:26:45 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so31065625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 20:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790825193; x=1791429993; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XAY1dTOwRRbIO6ceOMbhJ+KO+bFWSEcRZxVi+y6APPk=;
        b=kX1Bbr6OQ9DKvsCxnA6h7u1lu2LShiiQLgomrV9Lgt3rQ1ZLYbA24CIIWa5gRRBED2
         1FvrNIbrKMICRAOGMVxSqm/t1+vWCS6iqO69y7p5lyImkkv87qKXATO4mbgGIA3oefYN
         evGkiq1mhdrAluUOqZDfD/HeB2IANwKUZsDNvUxeTI6/yXmuRmx0X6DGG8gY6Zxul5Se
         x+64pWgEqdp96gppQae6vgc/ZRKtVZQSdPbbLrb2sZLZpK83UQWUutXzsOEGn0RX43Hu
         694rtW39lWJ/7fBsaP4XquWxXzajdMUr41vWpO0+QmlnvHjC2mAIkCsdKs/1JaJNOH4C
         uQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790825193; x=1791429993;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XAY1dTOwRRbIO6ceOMbhJ+KO+bFWSEcRZxVi+y6APPk=;
        b=bcxlmvUcIZVtNhzC7l3O3pN1tlFPKebTGhM6v0jzYx08oT1wFXAk9maPVNIbzDj/X5
         SebWOe1xLV2+L6WWamORJ/0eVvIqnpHzNgrxTGKGBMZd4gLQTsUoYFElyAqEi8omFyFd
         L9DnybijCW3sL3sksRAesN6QDx5BwT2MG/4spaMOr5AbWpGbp5LpRbdKyEKgbMklUrJG
         lUzp3Clpnl1qQsOlHvzqvfP5tT0E3uQUGvEAolFnyCvD8dzHqeGkD6XIMot9BeX8ugxC
         zYsPH1fh2r4RrkZCWobtvfegtcu32PrM8qA7txN4Z0b1NefuoyaxQG89ogUajpMbSnIH
         zQIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzebHAD2tb8yx0OgoC40EiB/EVsRwx0ZKtJgMoKc5XAj2G2KILTfhOUkuZ2gQZmzXlxJivFkcGaPvbxjujdPU7N@lists.infradead.org
X-Gm-Message-State: AFuF++ksm7zLTzTZA3RjrOezhmHyO7Dw8KjlO2MaPfogyaj1RBlMa93m
	c/Ecxj8w8v0xCpyHEwUKmum/2/0L+Jjy6rGHN2Ms8Qsw9vDClvgVNLXN
X-Gm-Gg: AYBFou3t17XoKl7JV7qFTpUgF+KyAnlXNxKZPaU7Nattv/DUd05XkWv28nYYwz9CBye
	HG+O4F0QyqqCDqXb3bgih9mgUFNfYfTQiexT9LdELlpjFInowk/JTZqCQXlOhcbjbMJ1PR7pynO
	ytqkAM9CCPO/ms6jI9cgdxTsfB7vy16qaTPG0Q6SuYHO3dyjCzXRoAdXM6vxeYvQCpdD2Z+e08r
	dBh0xGPHbnzAp8nkfu5Yw/OcJhRTUhvvmYVtINSJq/jlBEa/wF5il7vlctBaE3mLxovPzHJokuz
	/duNhl/Rpo0d06ip04kclEvOZ9o3c7PFOmIxooQS8zjBO+IKNOspbkwKQV5gwbzpKjBLCjIDrQp
	azlf6V5P5e39AxAtLYJmEnNGZ/ScW9/1uwhyNOuu1440bpZvwQrk5jII78aW4soLB9hyZYkOL4e
	51YgwodpZW1P04tL0fIUIRjvZYc5cmue3/qxMInVUFBTffjfJljJCH6K8TmXjYIFVTfT3K/5kQv
	uNDJc2JClPeQelD3KUJo22FrYboAIEUeQ==
X-Received: by 2002:a05:600c:6815:b0:49f:f963:7093 with SMTP id 5b1f17b1804b1-4a01b00d679mr55372455e9.23.1790825193330;
        Wed, 30 Sep 2026 20:26:33 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f9851efsm36483535e9.8.2026.09.30.20.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:26:32 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Jason Li <jason.li@cortina-access.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Subject: RE: [PATCH RFC 07/10] tty: serial: Add Cortina Systems CS75xx UART driver
In-Reply-To: <SEZPR01MB42087271C56AD1C7E926AF35A28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
 <CAD++jLkzcf7gJB82XT3-xb4jLujtWSNz1kT2r1-4N54rRfRNMA@mail.gmail.com>
 <1d81c2ef-7a5b-4306-83d2-ff96b0eb6a06@app.fastmail.com>
 <179076749140.3134070.3869742286743401078@gmail.com> <SEZPR01MB42087271C56AD1C7E926AF35A28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
Date: Thu, 01 Oct 2026 06:26:15 +0300
Message-ID: <179082517588.138645.14615134489246049313@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_042637_946883_982EB3C9 
X-CRM114-Status: GOOD (  15.53  )
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

On Thu, Oct 01, 2026 at 03:17:28AM +0000, Jason Li wrote:
> Yes, they are actually same HW logic. But the brand name of CSxxxx is
> owned by Marvell instead of Cortina-Access now.
> Will there any legal issue if unify them as one driver?

Thanks for confirming that it is the same logic.

I am not a lawyer, but I do not see a problem here. The part numbers
only show up as compatible strings, Kconfig help text and comments
that say which hardware the code runs on, and the kernel does that
for chips of companies that were bought or split up all the time. The
driver itself is GPL code; your additions would be under the GPL as
well, with your own copyright line. Nothing in it uses a trademark to
name the product.

The plan for v2 is a neutral name: drivers/tty/serial/cortina-uart.c,
SERIAL_CORTINA, port type "CORTINA", and a binding with one
compatible per SoC ("cortina,cs7542-uart" for mine, a
"cortina-access,..." one for yours). If Cortina Access would rather
have the CA parts described differently in the help text or the
binding title, tell me what wording you prefer and I will use it.

Thanks,
Fil


