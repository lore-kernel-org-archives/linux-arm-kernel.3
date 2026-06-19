Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CEECD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 18:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=; b=DaNjPpZiIvrIvBP1ANmx2DkZ/i
	vOCXEr2EqLxXfyt4e/+loaP8XnIBKKDTXah79I8ZdD+9ATbjgWvKzmo55k7h42RaqG/ZzBbcjyYVY
	5mjYEjIE7gk9+ammdBSdDID6Z+R7Aa2GQz+YMw4drlrwIRboPE3Q4mxToJC//5OVdI5SbL6CTSjIo
	7m3xljrHMYbwXSEvpEj3IRrprmaIJa/25L9ZEGkKKcFYqHkzS251ZJv6/ne2XSvtOTxfyGGLdoCx0
	mEXwuObpouj46JXlT6IB4TIGFIcyC43wTYKYjGlhSk81jA0QKkd2NbUVJoKH1DtDBk+ygQuDkKLV5
	Yo4AMrqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wae74-00000002syt-0BHe;
	Fri, 19 Jun 2026 18:38:46 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wae71-00000002syY-0NFt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 18:38:44 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c074142cf6dso363667366b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 11:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781894321; cv=none;
        d=google.com; s=arc-20240605;
        b=WSf+MPg65KBZd3YV8QMrqRr66MA9/ANiYfvNQHCdJTfOV/gJrizi+fxGZJYhBdhr1C
         JjmRCbzjRVnoJbJdiaF9dQDsMZMqsC1QOYq7EenG/6bIyt0dcfI3y6mMHRnulCSf24Bf
         gqTv5LM5lUw7XU0JSrexyAStybAOl2U5D7Ns3y9nL8H1LwyWrL7ZkgZJDQxmUCp99zgu
         8xDI8kqmcAQ7+2XVIezirJ8st2UFDADV2EhesRfmK80NaVsTm1hajJXfNzjN1xI9ZZhU
         TcjmD6g8ZgNVTUKS7t9/l65/nqJTSdY4HLCElSWq5aHRhXQhL7evAK3JoAMUfmFTIdQQ
         Di5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
        fh=V0unrTljy4ZteuEMq7Pfhz/WYQYi0K4hAlaP0YsIzCc=;
        b=FEgr2OL4NQb9tRFn4tCpZgmCx7J32xWfJCFfBLUhBgF3Caf/LH0ZZN7hUYAxwCuQL5
         iwJfk+W0iD66OWK9+/8TUER11rGUMNtnuZ64T/tO+w5Ue0mjhVjI6oghXPptb5d+ZiRe
         JbZlbRa1JC+O8vdO0fehvEKhn6A1Ua58GSIX1a21ToFuoWSohJgYqixwJJosi0eaCl2E
         dl0P9phGFV1LOVI9CD1xnOIiAsTgOx0teWJ6NR5W8Sn3mRsaf/QrCAfLv3Hy//OleY1P
         z1w31/vkUVsQEkUXwXvXRrWD2sZgDYtOnkhwlRUtizKaiAWFiZa0+xG1tUK43iArAcI2
         IpRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781894321; x=1782499121; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
        b=h5gl1TfbToCE85zxwrc+y+KZhpt21aaDmbwVX0/9i5fCvSMGOBqdcU3pbO0u1mUdsV
         BjYitfiiUuGDQu5i29kMvej0M0i9lcO/eQ4HB1kZwbZcEq4zjJefAr4rxaGHICSi6WFr
         Ko0hgs4Q+wFby+RUdf+JxOJtoHvl6BYZ8NV/RdMORIUhS5IMGC0L+MBYK2nWhNsiBBex
         mVabxaELs+isayEa6mCWwyHibtnfGkIvP3S+5mxhomcUv0pSfPPvnTnueh9ju+0TZo60
         MeEdqB+CCczwXUPBNVf6Iurikuob04LyagTXo/wQYDcmOqayO6JnKgFtvRrgfaoi/gU2
         lOtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781894321; x=1782499121;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7sd/b42PKGYPWc3g69c99WO1tcNR8oQqqaoqVKqNcok=;
        b=iYeP+HVVPBVdMuCEdnchpXvyZtVAgZwNo/j9KaeaAigtZ+mfB6gwJ1hCcB0Pp2eeoW
         snQpfuIHdxedMQr/GojVgX8/FZ+h/F6SzRhtQt2utrRdgQROu0toN/PPkkVFILc8fwA6
         l1r4ZynsMKANDTLDRalmFtITA+uwJdJlZ+Um+o7hIcqdCjSYrfGfOxgpEIfSg44jyqdD
         DdcNNPs+SVRMRXhtmdZ99fraSC7SJ9FWwWf85p06eY14KkoN1Nn4oIF9xtlXcYAVubsU
         cV0xIrAORqtuUFGShfYEJ3rC169OyWTYMxJvQAvqs3ZBVGVr7baO/r/eTNhI2B61i8Gt
         DAsA==
X-Gm-Message-State: AOJu0YwBcV9q5sKw9QA+EGUKYf6zSzqr6NNdxl7uygZ2PCbHZiPjBULG
	zZLSUr1QD65UeZptVlh3YLnJTbsBil/qetuyzDHywOb5kwyeUXbffp/cYo3Deaq1eOA7CRGfY1D
	JxE6wXOki1a1vGu7w6ulcPTeGf8IS0/eWVpdUigTbNA==
X-Gm-Gg: AfdE7ckWrgKAY+Hx1Mp5yuEKqobVQjTOR6MiT/A9j5CRQIklO7HKaOUnSS0UvETfxJo
	Toz75iDbO81OaKSJeKZyEp+r9yzC+OZOdrgBDluymC4QR9T6lur6uOfSet4R9AOdKjhV/zP016l
	RatSV9e7ED3cHhcCXF1Y097bqzm6nu53WWdyUUIA77l/DKUJ9RhykxMmMJ0I2+kerF2kBJWbugS
	A9m3bNSNK21yPq/I+PXBTqCcWnOvVO5LFdJmmfkMek+rlfwIKlNuq6jGXuTYPolXQ4j8MoNOX5Q
	QODyYEpE
X-Received: by 2002:a17:907:1caa:b0:bf8:6dc9:b319 with SMTP id
 a640c23a62f3a-c09b9c76917mr245634066b.24.1781894320897; Fri, 19 Jun 2026
 11:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260525031312.1341109-1-dbgh9129@gmail.com>
In-Reply-To: <20260525031312.1341109-1-dbgh9129@gmail.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Fri, 19 Jun 2026 14:38:29 -0400
X-Gm-Features: AVVi8CednOIf8DbLQ5bp_77HmGEdIqo4B9MQoprCazQQ5QlMs5Ro9aH4nhy5Kio
Message-ID: <CACrCO_WVp9oH8R3yi56X6p=ktmERaSLcKe35_puKCCRNJ1y0tw@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: highbank: Fix OF node refcount leaks
To: Andre Przywara <andre.przywara@arm.com>, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_113843_158139_600A9514 
X-CRM114-Status: UNSURE (   8.28  )
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

Hi,

Just a gentle ping on this patch.

I would appreciate any feedback when you have a chance to review this.

Thanks

