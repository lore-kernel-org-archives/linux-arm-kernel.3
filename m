Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA8FC5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 02:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6DGwzvD9/IQFl9yYfrwzS70k4e8kTkJHKmvyNHmKPbc=; b=vQQsJp6XecFD6Pgi4oEu4FR0JL
	A98R1kS6S6r9nq89Cyg7UiIpIioPE72IBRrx783HmUlsEjMBr1E0+uhU5l09MD2COktFvfuR4Yv62
	CnTUr4fA86upJUnZ/gzW2SjVBUlo21aAJ0kURl55nWxT6E5YCBDdu67cwFuUDqymgu3AnQ4UokYuU
	08RojAcNWfraH2p8uJsXA3E2HsO/XZ0ja8hw1pHm/vqIaoAtuwPPAmcBO02OoRJR/LLvv7TpvZd7D
	OG0W69ShzeR8Xqh0QQ9IVf6123w6Rm/2hsbxXnz9jwtpaVvgOqGqFRkY3woFeUKzlsP31MsWxJO4Q
	dR5WZhAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtFuK-0000000AvG5-1NWI;
	Mon, 10 Aug 2026 02:38:32 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtFuH-0000000AvFL-3oaq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 02:38:31 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso10870825ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 19:38:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786329509; cv=none;
        d=google.com; s=arc-20260327;
        b=gQ7xG7iNCmgVvZ19XpzDXtowEc+bNZyA8gGk0ymCuOSoed6KAigNii8fLo/CjbOu0S
         uZXMlNi3kZpl0vurkAFXNJjhZDNm6GplGtejEeEfZYGnIgalEzpSiVCfXgXWqz8Ho20y
         9Ij/6wRZeStOyF6khjgL0oISrxrXVJlgrLR99NwRWuHnV3q2+l8oIUlgpR308Y6n+9xf
         76UOztwxsETz6QiLbx1sV5LfVS+yp1UUKhMX7Qy8FL2xy0rU7F5R0rpaXTzgzmT+xiDF
         5khse4m5ghM3FdK9i12yFzHba+7gAmeKvnj68U/6cqu7eeMhpTvuPp3xMbUTfrlHB7LQ
         yVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6DGwzvD9/IQFl9yYfrwzS70k4e8kTkJHKmvyNHmKPbc=;
        fh=RylFkSEJLkZvOxfm6kOpgK4K2YSV62n4ONCa3P12/Go=;
        b=nAz1GkrTqYEApTTLc0sEpmtOXaDltWea/adoMsCy3DtvfWR4WQoVsK7MoWMGy4fDRI
         DBTkqhBQ38//EEDn7lsb3BXU6kB1EXfYcPprHUqZp9/Rj+RA/2UcsemVGZp5kraKsS/B
         tEOmB2e+1dErob5WT03P+d6uq2+uc4kaNUuXKkoY6UHZIjp/2RV8uy3kAvmAj9ftU/am
         Rd3tOQaEZJhtWxYJoQhgZ+oYxONEw500NdZflgezW/Tt+sEzEJvHmHJKm3BRTpbehfjo
         DwjwI1E9YQpZcCZklwODx8lUTiBdjPdq3xz6IL2Lhox1KTkZg03irGbvCK1Ke/KlIZYF
         89mQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786329509; x=1786934309; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6DGwzvD9/IQFl9yYfrwzS70k4e8kTkJHKmvyNHmKPbc=;
        b=RBkwn0Pq30OA9wFfIZa8TSbY/TDGCKdYGQS1pH8xChP5CeEqPBSv8HDO6XhSzVamMz
         rbDZZnBv9zwTeeNCH+YWWtUdr6lOiVhRS3E+5SqYAPd9CP6+OjaIsuxcRahRVlU0TsNa
         Fgb4uXgbN+72mdqJXkTPI375eYmxi/hoh1cI7fUKPcQQuCqVkiPXNEIlply/pfwrwJgd
         m71n6leYGTdYvV/kHutdPrMTUw6A42/xTP1t9XYk5AXE+mgElf3MGP6tpwVNFO9RNo+1
         E6/9wqhE38rDXlEsK8founPvO6zMlhXB4Ut2uyki3W9lhtvT0y6ZaNbCHgfGzboBGtzM
         8GmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786329509; x=1786934309;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6DGwzvD9/IQFl9yYfrwzS70k4e8kTkJHKmvyNHmKPbc=;
        b=XarZfWnr2hed32Unlfr9oGdOWsKuzvBnVXva/Cmx1i+LEY6xyr15okPdFfaBYQg0Q3
         d4s9L+SzE93nG/xToehkAe5e4hJ8PKuqhRerOqR8TihDtKENZqWt5oLj0a1jO98vUs/o
         oLL+R2C5EZERBCYknH7VIw2/FEYCv2UdB2mUFuYtIIFjgNxlep1T5t0pvYu177LXuozg
         IqpVv2+GJbjSdNQDnWqQXOzBsTCgEDRsG0NSzeKTRUqcDWhQtMGaNnJyEvWOgepgJAxq
         o77k1LlOYsNVC6ju9ALDf/ipXphVKnB3eA33fvXGOjufXuc9BR1l5CEYpGHsSeLpdJoe
         hghA==
X-Forwarded-Encrypted: i=1; AHgh+RrRBeL45lSS77WcFZC+LeYqhYKOujFpFT8oBSQwuzjNyzmp/v2PoVrpXmWsA6LK6hSnP+3q1bsLcL1i8+gtwmrN@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ4L5PbOIbzhjOx+Nek6K4RakFsq/t8Ur0Y6UxpAiccMu+B2uO
	Xkzr8tghnt+fTfoW8TLAR3M0+IIaVmiU40EnuQpHPMEPcKrtahU7GkTtwr12QBIWzAcDoyR4Mw8
	OURtp4MNuOaXg9TTOvkWYRmd4Ejmd4BU=
X-Gm-Gg: AR+sD12XxnkkScgU1LET7Rox0iV+1SPEOSFuKcfSONFqJXWiWo5l+ukc7p4g/mPPC7I
	sxGdI8DuFVGrUPRIt8xObc5lbxK4kHoi/UnEoU+IhrLIA6yqBI7nOa0gl8w7lxLRr5z2E70vHgF
	YsCZgV3EE3Car6TcaT0Y71hZAs/PJrCDxi/HCvgGLRp3iq973Ctn+wyvK04SgzJiGoBqgTH4CIo
	5N/TZj8NCKnappLktHiFpK/zDmWI2ECXn6TsOGNHVbsKqMpdInSH91W8InCrNkS1j/zMJPiZbkt
	L4it6TXd5mwn2auCmu4lP2MMWgpotrcygOJBZFjilixm7N23L32tPNqd2hmIyI+BHTyVyJ12jdk
	FSI7WSFjsGvJKx1H2IGoA2os+nhMuJ/1ZZQGdL4GNU/ME9SGjjkuQsKSR
X-Received: by 2002:a17:902:d58e:b0:2bf:27b2:4b80 with SMTP id
 d9443c01a7336-2d2a8d1d97dmr211697695ad.14.1786329508803; Sun, 09 Aug 2026
 19:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260807081652.38692-1-phucduc.bui@gmail.com> <20260807081652.38692-4-phucduc.bui@gmail.com>
 <1f26fc28-da13-4ca3-990f-676b53d23630@roeck-us.net>
In-Reply-To: <1f26fc28-da13-4ca3-990f-676b53d23630@roeck-us.net>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 10 Aug 2026 09:38:17 +0700
X-Gm-Features: AUfX_myaPy--xKkkil0mfKwIudM0kq93jPRIr1aFF5iubyuHeV4xAEUrCHwB2E0
Message-ID: <CAABR9nFy=GD4afdDxzsbp31Sq=smGVFf+HvqsrJKh_FjqdUrJA@mail.gmail.com>
Subject: Re: [PATCH 4/4] watchdog: aspeed: Propagate errors from optional IRQ lookup
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_193829_952889_113AE4D1 
X-CRM114-Status: GOOD (  12.17  )
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

Hi Guenter,

Thank you for your review.

> > +             if (irq < 0 && irq != -ENXIO)
> > +                     return irq;
> >               if (irq > 0) {
>
> This if () is no longer needed.
>

If we remove the if (irq > 0) check, irq can be -ENXIO and would be
passed to devm_request_irq().
I see that the irq argument of devm_request_irq() is an unsigned int.
Would it be safe to pass -ENXIO to it in this case?

Best regards,
Phuc

