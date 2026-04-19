Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CF0EA71AA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 21:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4jpSLr3O/lNvtNtYaN3mKKdH9bxXsImrwjUfU90LEqA=; b=LI4t1wr4KU/vJ2wjNZY6CHphAD
	2DveFxqdAL9H4q6tWiSryL3Ws/q3XLCgJ7pjjajpKtN5xblvTLiqlsj1Fv1e5oH6TdZW7/x9bcLAn
	fyJDRyhOpf28fA928pJxeEouxq5VniUvV57pjvIrQh6Fp1SqDb3Qfot74Dv9QI0miSP4O6qDHIukF
	6YqMVowX5sNmF2YXUXpjNWlgws9YluRUwPr5LmpBZAsCExc+ECcbj8o6Qv5rF4xePGSwAd0KBKdux
	CIhOry5ZPetE5rjaAKwTeE8hLwqktI9prfQBVE0YyMDoIe08m9gf/hR8ZLQdZBlKAIuOIgGCGftYv
	w8TjlO7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEZv2-000000066pD-0l0c;
	Sun, 19 Apr 2026 21:43:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEZuz-000000066od-3UHa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 21:43:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B37B60103
	for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 21:43:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B31C2BCB6
	for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 21:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776634984;
	bh=4jpSLr3O/lNvtNtYaN3mKKdH9bxXsImrwjUfU90LEqA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hqG7RrtihfJdrJ6OZFOR462gSPMnJHMqK+JIR8x0qWYPS9EZ/Bvxqos3Una4AADqK
	 Ij/7OzGmkoPi/M90hGRcdm0syEZCHXcdLmaNcgIVUQeknor10CL21Lz/gK3pIO/YCV
	 WMXpHUq5bjTF83K9fTxRTTdIEdaeZX+B5/rw0lU5S0+YMqF87A81fnY+ZKHadB0bba
	 WKgq/b/mugd3qJXtRbOm/7eF/nZMDMyWJoRyLrRh9brrWcKtCTxRXI5usaG4XBkh5l
	 YHJbsSkWTiZL/Y7MBleNw4AU+atbQUSPAVtCJ6lhD6UTujWoo/OCmmXln70N+SgmW/
	 wQ3tJ8I1AsCcg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38e96a071c3so25399901fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Apr 2026 14:43:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+324dA6TJBbSRUjUP6EEQHDlBZPbt6cwPElYYTN+vKpjZy80gYkmrRMtKOskV8yWlRFzos0N2ZXf0v1F/kjjP6@lists.infradead.org
X-Gm-Message-State: AOJu0YzDJ4owosBJPFoRxZsNNO8T9jPCx851BdL9uXDoFCWzK6s6j8dj
	kPnXKAWiuIIZHc2/dFgXCy2TemBLcw66guCoiAKc/KW/K5Ymjoc7aNXgLF1jhP3yS6s43a2WDDr
	PS8sFT7QLc1rduzCC5j/SU3sIjshIWSo=
X-Received: by 2002:a05:6512:220c:b0:5a4:c6f:d43a with SMTP id
 2adb3069b0e04-5a4172de516mr3364349e87.36.1776634983477; Sun, 19 Apr 2026
 14:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260416154928.2103388-1-jonas@kwiboo.se>
In-Reply-To: <20260416154928.2103388-1-jonas@kwiboo.se>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 19 Apr 2026 23:42:51 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ETs2q5FYr_zWYFbnqbCx3DmT4MarAHmy_KA1GggnHcw@mail.gmail.com>
X-Gm-Features: AQROBzAepQPgH7Yy776Lv2UHkdRyF0oPi28JCu9KzCWx0YubHgHTG4J0DP8U52E
Message-ID: <CAD++jL=ETs2q5FYr_zWYFbnqbCx3DmT4MarAHmy_KA1GggnHcw@mail.gmail.com>
Subject: Re: [PATCH] gpio: rockchip: Fix GPIO after convert to dynamic base allocation
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Shawn Lin <shawn.lin@rock-chips.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Thanks for fixing this Jonas,

this also uses the function in the right way: instead of using
gc->base which just happened to match the pin base it passes
bank->pin_base which makes a lot of sense.

(My original response mail was a bit whimsical because I
didn't realize the offset passed as argument 1 is local and not
global.... but you figured that out.)

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

