Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B54C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 06:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5t+Qqh0K4cEtDBqlpS0V52GxkhQMVT7/B+AKwKDVIG8=; b=B2AjvLeORssKfJA2u5pVeekctD
	1z1pE8uawsKNcGobqu/rAp/gbY4ur8dJUy9cGXVyeoT9NpP8htm6jKWRXaph1C61IjNsRvvuL94MO
	jiYs0SfbXDuoLdRLL8RYSrBt7csFIrOsY8kJZLyIraNxashW9O9T5cNyIdpQt2FCu3OYTg74PCF0W
	INTNdOlhHhUO8j/fRhIA3eU0gvfjZKFLPDja7QtjUBC52l7rNEtomQWm0zdO207nRjIHLrwiQrrH5
	I7EjUwlsEzADaMMXH+BoROj3tTaGqoRsJgzCJTWSJqTwETR/kVbq06ovGAL1JvC4lVUlNj3p2k9T6
	U5eZ4GSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJwu-0000000B9zu-0XfN;
	Mon, 10 Aug 2026 06:57:28 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJws-0000000B9zN-286b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 06:57:27 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-39fcdaef6e2so10267471fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 23:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786345044; cv=none;
        d=google.com; s=arc-20260327;
        b=pZBPMkqsLh1G6eLDcXYrCF+4ovv3DpU1sHs+Jd3blr2cp6V1/nNMYhbPnhITqxPCWh
         qNd+3MjU8HEX8daNKFDo7NLFjjfZW4ocpwNMeqCYNoHW/inNxbDkK3dxL8ypSrA7A6B9
         GxDYryr/5watjSooYnxGfwnN+ha3t66OpN81P50P5TOCHAnGvKUu+QLXwZinlwD0sIfS
         Ggw6ChXMqwXP6AQO9w7D0IXCcfChJZXM2Qcc6lkoGscgB/sPeEdFo30uezp41/Y/PGGU
         7SLYlFYQu9MM7RPGNjgrozOu5DU7ierQGY8Cir9W0/6QU+2Z+NQGIILGWFVasyKtYFN7
         54Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5t+Qqh0K4cEtDBqlpS0V52GxkhQMVT7/B+AKwKDVIG8=;
        fh=jRw6QNrBg72LR632ENx2JJAkSrnQytdEXgQJkF85iXo=;
        b=SFGxbYqE6WgcTx8jINiVW14aJOJAkavxB9W42Ma+Gdhzownlw7wrn1rDcEKJ0F3L3z
         38eafLIgqmiBTJauI7CZW8rGTm3KpOTcfBm7KequkQjOiFaA/ukx1dOZCQgVEJQE48h+
         TZNb0zBxnKBqV8AsZ+anQ5tJxFOsl+Stbs+DS33hPy5E3wfSMRQQnmNfcb5N2Z4KjutY
         LAA4zPVz9IqXd7h1B6wXmx3pvqT90Bw6c4L4DDWNu1gyqE0Y8ydiBVVgVhGkXlAt8bUx
         U0eEUBX/cLoxZIXH7r9P0h8Lnk9OOO1rkJnYVW3FTSgBCtbGAqXk/EluNtbypWGUw0PW
         8MKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786345044; x=1786949844; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5t+Qqh0K4cEtDBqlpS0V52GxkhQMVT7/B+AKwKDVIG8=;
        b=Kzkx6RHbPCcmUl0ITc2ZxMgPXiHF0a782EUMgr3E0XKev6f1BX6HxHbGml0WfhOmbF
         H9rfMMcoivmaddmbs37m5ffBAXK6N34pUMTnsEyqsIXubN2RdKZSgzH5L2F1i11kEfr1
         LOMyhLUu2gia2BAvsDDRj/iODSKcfnqTH6rC/rzm12/kwdBCVDh7Wj1rJ7H+TyslDUzi
         jxPXVKA4SG5uWnFQPNd24ooJpFCwuuMbErmSKMRzMyXRf28hcxRZ0raePVMdccGZmwns
         vDItFMIFPelCMvhPS8kUWx6rrADFvHRxtVYOXPukRlVm9NR72AzeiQB4KYQD0POOEl2e
         xRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786345044; x=1786949844;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5t+Qqh0K4cEtDBqlpS0V52GxkhQMVT7/B+AKwKDVIG8=;
        b=CesTTNbucz0DYHXagMDTnYXez8aPlKdxFUFiKg38nyNEkNvzmrMjZMgNKlCwB8NAA+
         kU0p5AQ6uHRbMVg6SU3Pzy4BIGVZb9HPVI5VHqSGayvCTz8ENBYujJj5ivwdT5w68PJM
         1PR4VmGIXCd2CH+y9F8VudgYhRHIem7SWxHYZopykU+LPUlRFGeFD7YbK8fX1AcqPovr
         SgrxeWM1ezquU3sciUp6eNVSope/ByGJK3gdKGI0Gsr+6UTmHaW5VncKmSdOYwWEHpsK
         OnytHZhvWhstlg1+iD34m4UbQxaE5gghsP85XIua215ZRJCYKTJQHaTIKStLE228RZea
         mhYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq80c8xzeIgLgxbwrnjXcbraiOvT29VRKiSquiHsmVdekfNauLDKQa0mz0LWrJFens8iLKi84r0vNz6P1bbWzU4@lists.infradead.org
X-Gm-Message-State: AOJu0YwjbZpc75KB08RQUsZYnTfJH2XhGLzXu4NxKpzceMEyBO3/f/Sc
	Ks9oCgi75vAN06irZ2Vt9AGo2NHTp1U/2Ys8rGLOgXHA8QI3QhF576yE1VtP7KdK5e1IlKZ/YTB
	06RBDCpXbkaeWQMMf8NzYxDnsHpfupIVnTS8B
X-Gm-Gg: AR+sD12MvYKQQG6lbfUVslfITzfpXShemQQI93cktWm8c0mcbMvMmveBN8957TOLGMs
	mUP29+uP67UJ9tfUqs2WdMHNel39PzCrOTb+NFuJAEJYOjO4Wdt9QmJvTq2fzGYQSVRU936zblv
	apNbQbFXjSeWJINUwzzKF2LAZxywpc7qI7Hn/U5bZodIunhV0PZQcTmQQ5TXOrmRtqMk2CQc++s
	A2mZFBRvCKOatg5gZU6RfvWtlCWnuVjFaj5z8e3WcaEbEg3izEwvHZsRCvlZnCQ+1tHIa23CExm
	UZisAa9UmS5bAqHmBlJd5TtWJqYNkF9d3B6ArZQX7S0CIAC85A3ZY/imdFPPIxln4uuIVQOusBP
	vSk9I5ifQ8bCm52KwFR0xunIWCFq8fKM4WnK2zDdWEszQwxX4/pyCb0OYbSjy26Mh5WFzbDuQqb
	ka8i/YRaMCAaQnTWvfZ228qcqWtSWWlni9AxrJ937cCA==
X-Received: by 2002:a05:651c:19a4:b0:38e:84d3:f2c9 with SMTP id
 38308e7fff4ca-39fe5679ff2mr22729031fa.7.1786345044371; Sun, 09 Aug 2026
 23:57:24 -0700 (PDT)
MIME-Version: 1.0
References: <20260810053142.27938-1-phucduc.bui@gmail.com> <20260810053142.27938-3-phucduc.bui@gmail.com>
In-Reply-To: <20260810053142.27938-3-phucduc.bui@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 10 Aug 2026 09:56:47 +0300
X-Gm-Features: AUfX_mxqpk2lPsLbi0ivPrR1zdGwBROKmy9jREUOUWrBbWovbOKjxDhH6APGZ-Y
Message-ID: <CAHp75VdmzguH3e7BOu++mE0_-uOhQXTG9poPE5KeopTsoOEV5Q@mail.gmail.com>
Subject: Re: [PATCH 3/5] pinctrl: lynxpoint: Propagate errors from optional
 IRQ lookup
To: phucduc.bui@gmail.com
Cc: Linus Walleij <linusw@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, robh@kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_235726_747474_F641F250 
X-CRM114-Status: UNSURE (   9.84  )
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

On Mon, Aug 10, 2026 at 8:32=E2=80=AFAM <phucduc.bui@gmail.com> wrote:

> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no optional IRQ is available, while other errors should be propagate=
d.
>
> Propagate all error codes returned by platform_get_irq_optional() other
> than -ENXIO.

Same comment as per Bay Trail version.

--=20
With Best Regards,
Andy Shevchenko

