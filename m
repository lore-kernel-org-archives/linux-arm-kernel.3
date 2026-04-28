Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D717FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 08:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0YR3KYyrJHMzK7TT5yINHRIV+CmuyKhWAYd7Ad/XHk=; b=OVUvvIx6F0PZ6w4m+z5mJzuTCh
	ypngl/KYO0MJHJEAA3NrVyoHa7dFxOZNuGmj2P9q7KRBuwSezI0Y2/3SE2uNH04IruaVkptsXJgKZ
	ybkiSj2EVJMDyQ5MJ653XHbjTq6TgLML6Q+5WYOFKZFBEfyWmeCJfuXBg90TmtSwV8ntOnf2gT8Ri
	EN80tks2HH8iDLjn0YlKYbdbXfUzh3KrD2efrn2+jUx+ZCBhINZREgpLRrAI494+/Jcog7p69NxsC
	Jz+AmtWKSYSVlmfwQXN10ikGrjEmzu7ExQg97t9sRnb+9T/c+XKJS+UvhXDgLHmbyv6sA1Bqw1pbI
	OYu5DinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdUi-00000000r7Z-1M2w;
	Tue, 28 Apr 2026 08:08:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHdUf-00000000r6h-3idh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 08:08:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E6A6E4485E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 08:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116F6C2BCB6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 08:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777363710;
	bh=wQ7+PJSmEwuKa5Wm9vVOQl441ts5aBzLQ2j+pt+YQsM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=kYMONDpPMl064k9Bnk/LCuTXAdtBo1J4GX1HgwnWrg+YqA0iM8lMAMv0sKz3T0wHM
	 7P2iZMkfhuco+XKS4MB4tEZhUPmLuvlWquFLryXRuqOXB8RXZ7VlEveKC2ufMCHfO/
	 CEMcvAzegBXZfB/ownWI/xabOqCvhVBVSjNPCYOTbORmbBR3q9H/nOP6Nbef5x/6EO
	 BQGJy09lDdcp6txWaI70T9BunnDcN0YK/ZvapZZX3/e/KGqeCVJb1Bv8ZKqgN3+Ve/
	 4UKMRoqkHu7AWpQeItp8uqyoO0K/AdGy/h3pQMl1fXm+zBr9XWccGKRAnXEtEku1zu
	 JVD4SCkesh3AA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a2c9c5ff87so11570375e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 01:08:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9DjTlV4Kq7b12tRXvqKMLk/8qf4qAFXVBO1Z3f4Wl4RvdAmR/65La48vmn85qR4oMdgfkQLMh5mFRMthUh4Gpm@lists.infradead.org
X-Gm-Message-State: AOJu0YwpZZgCrGZ0YdEqYb41EVHtZIZ0OfOlcKmr9maGwZqxOQ0wSw0Q
	8osr6GCRzofK+Qs1ZiPvhdBtST2f26cjOUsufIzIO2fnnu+Yay4b3nOB+x2wg8JDCHvBQq02yz9
	uJHavAL5B73oMfA3SOKa1Xq7fNTs+bL9ZPnrayr8f8Q==
X-Received: by 2002:a05:6512:2247:b0:5a2:d239:cb9c with SMTP id
 2adb3069b0e04-5a746626970mr854062e87.28.1777363708792; Tue, 28 Apr 2026
 01:08:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:08:27 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 Apr 2026 01:08:27 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <1441dc76-764b-4490-8d7a-85dc3b01edac@app.fastmail.com>
MIME-Version: 1.0
References: <20260427143546.3098519-1-arnd@kernel.org> <1441dc76-764b-4490-8d7a-85dc3b01edac@app.fastmail.com>
Date: Tue, 28 Apr 2026 01:08:27 -0700
X-Gmail-Original-Message-ID: <CAMRc=MegU6W8pQm+CQEZ4eOESX1HykaXLaA6k62CY-PL7e92NA@mail.gmail.com>
X-Gm-Features: AVHnY4Kzvp3OPVMuci59w2HJynq7CNcwzE5dgFc8-UQ4n_fxMJn7lfLy70-B3RY
Message-ID: <CAMRc=MegU6W8pQm+CQEZ4eOESX1HykaXLaA6k62CY-PL7e92NA@mail.gmail.com>
Subject: Re: [PATCH] ARM: s3c: use gpio lookup table for LEDs
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_010833_978438_F3533D69 
X-CRM114-Status: GOOD (  11.27  )
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

On Mon, 27 Apr 2026 16:38:42 +0200, Arnd Bergmann <arnd@arndb.de> said:
> On Mon, Apr 27, 2026, at 16:35, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Sorry, I accidentally sent this without a changelog text, this should
> have contained
>
> "The crag6410 board is one of the last users of the gpio-led driver
> with plain gpio numbers. The driver has several ways to pass this
> information without using gpio numbers, using a lookup table is
> the easiest way."
>
>       Arnd
>

Ah, here it is. You probably need to resend it.

With that:

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Bart

