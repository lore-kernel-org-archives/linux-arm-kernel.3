Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA63CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 04:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1UnSY1pMfytkclFL9S7Wbx4/5qWTLUFOLzTIY/CjLc=; b=P1eaZ0HvxVLzMG0pGdDluW2HQd
	kHbiLXoQ6IBoPM0Ju6IrwpLztsnoDTMEN/BZSAWMH50lHZMoEI57lHl5TIjxdsqhaRokfXszAckAp
	Wq943sU9AA5Fzi4XUv4/frMl054onNHScI+pESzXlGJbegoyhEhkDtz/3LnFQwsKm6/QocLQDrhvL
	+3WCMFTHxO6z23R8LTzpekvu/MC54JdCB3RQjrj2L2If/+LrM+kZtAsc/0z7ylbGk94L9NizwdhQv
	Fs02xmKelaROwRzT69WLG07IMcZIUXxyhWzCQAaX5W6R9IhGAFg/Zg2b2yrroX2E7M7X40JQsE9u6
	72FBiCRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDwsG-000000001RS-0YZ5;
	Tue, 06 Oct 2026 04:33:56 +0000
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDwsE-000000001Qv-0DRn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 04:33:55 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-982d6efbeadso510887241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 21:33:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791261233; cv=none;
        d=google.com; s=arc-20260327;
        b=Nzcyzbett3vB4G7n1FNklcG6QoaYLf44blM3AmwlvLstQcaebzD7duwY5ci8CVOjwR
         +9ClJh6d52MU2ASLfmY97FpdL9cOhwzLrNXaHQvfs5kRqemeZ9UTAOiOGMhoytdk5Caa
         pHKsSGwDC3toG+sudmOEsJ5id6rElufY2pf/ezy1HWF42QggrYTUMpgzM3oaY3QIjfHJ
         5ebOume/QxvECZZ8G0sI0XPBaZZdgRnvrxuwUqPvYB8zE+dYfzcQuf5859wpkwazJTgG
         Ki1aCqLVbwXEprAN+Z+FGevNvW2K3MYjd4JEUtrEx7rzyg9WgICgGnL1s1joDQFwX2hh
         iRRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W1UnSY1pMfytkclFL9S7Wbx4/5qWTLUFOLzTIY/CjLc=;
        fh=PJda2Z7AKTFC6r9xcSoGYrDHP08IdQwK9eYhiagc3cs=;
        b=IRUXiOf3fy2vXaslM0H6ov8dK2yj7utfgO2lehHNTH90yom4Wx1SYAD09kdkEevmpc
         dIkRzSaDsIYM+rQ/OW6yeptZ3ljws7xe8g6B6TV5GOis7ijF51spbOVFhzcmCi/92uCO
         ilBlRvw+hw7pTtb9epDoF6vKQipG/1H6SE1YXtDyCBmXtx1F4Fu4YeQtpVW7H1699vf6
         HTJJolrOo+UKjhENNRvfND6o4UwPIfjPVz9n/IGrinN2isSFoZ2D2MMK09i347a16LiJ
         z8QGPNM/BWJAkKXbg7scJlPfJX0W+freVB68qG3nIczwR2gw3Nl0fZ/J9IZSZzu7BLH6
         Xbew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791261233; x=1791866033; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W1UnSY1pMfytkclFL9S7Wbx4/5qWTLUFOLzTIY/CjLc=;
        b=RXAzu7qPmS65tmVEbb6YdbNmQK16czps5TR0jzqrLDdbUC9hsR6YK2h1BDiLBxna5B
         HWyKV9YRs6ptidq94nJnEtNvlf2WhRMK1NXNtd/UbYBHL6o7+gsvGSGNNrSXHzrysAuq
         XeUP9aA18IJtc33+knI4LEHD8cn+5De7gNLc7FqIT53Q/6f5oGbnXqzJ7B2t3inBVENu
         XxYJSVhs1IAZw5YHLg4wphAsndhxvWPq3C5/2Uih5dA0Romr5G1ts4RIE4WYhxrW+jCA
         OXS+P59sqa11h/X2PgRSldvT+0Rx2zBfko1/RsF2Qv6h6UxyzyJ5HSebs2sRngVvd/4f
         Njlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791261233; x=1791866033;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1UnSY1pMfytkclFL9S7Wbx4/5qWTLUFOLzTIY/CjLc=;
        b=f2cnfNngslai1CtLin1g27eVwDiW9nSlb+fekfHdiUWT1X7aTLTHddsdjj24qPMABP
         OfX3w2ypowAEXCvNaTRiq8JRkIdJhEeXZpbIXUtYVEz1Of6y7fox38SGXL9WV1EfaXo9
         8v1EW4JsdJL2drO9bZbV7sLmMjxUyEuqaOpmjYE8HN5Ox71esqtQO0MMk6iEPZXlEAZV
         E0LPLfgf7E2ppr/HQ7KJButfAHCAmciN226B86krZTBMZss1ch+HLmYEFrEyTS4PO7Zh
         fjuRLdDvMiaAVhKMjAC+JuUPt05d4yTWE21BxoJ9sSghjeB6CHdOy8U5QC3oeBECBzVj
         IyeQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaD/zPte/0b7mBu3yI8ReW8vOVz2rwnGd+VKMlC8WIELtZoGTnU1qA4D4zssJA2G3zRp8xFc404Ut0q1DRMBwf@lists.infradead.org
X-Gm-Message-State: AFq9FYKtJfNnSbN+Zd1wLb/GxCVHrrIw7vIer0Kp2XXtQbEcSWxxoOi8
	jkRCi9AtFbMHBnIs5uk1e65GBvXkTNuoSBGwQxAHkJhZA6R/mNF/xcoGTx63SwYqxn+Gw6ZOjVs
	1BDsLlMJ4No6V7ggzt+PzOx/UOa4cLgDw1jd2c7w=
X-Gm-Gg: AYBFou31cRxljgIWCh+8J3T/j8YmKA7lG2V57jqbnEmoDEBq+yf2fSTATKKV4yp0Hd7
	9b71PuOl09raJ40HWVZO5wS3DEfSA8VME8+JTg8QfuAogeavV4LR2rbvg/a9KLhmQA/DjeRcubj
	HgzaWkpv6E5c/42L87kSF/jU5QkhUZ/ocie7icV6fBBrm+b5bUh+2hVkzSdLxFJmLwnH2M5O7/B
	rnL/r1hGbj9g/wUv3Qg1jXgnQcEc1ZNz7WKEiPABoyblF4FOM65obm0+B/a+PvuG6m8zVVe6YWE
	ZDanAD1/FNRuZNuD5rYKNK3Iim6bRFgcZL2gdpRIk4x4WlooJAGCpNBm6oG3gHYC1/jjSigA/iM
	i9S8jsNziKcNctOzGl1l/hqi4qzym7K99vlSzDfZBhvFLElLC1RS2XZatkFT65ggoYLx/jEZtVA
	PY//UQC3Z2MND7GF//YfwZT/si2xftJr/izJvUPU2MsfFT
X-Received: by 2002:a05:6102:41a4:b0:7b2:508e:3d40 with SMTP id
 ada2fe7eead31-7c244b9b1d6mr2226954137.15.1791261232672; Mon, 05 Oct 2026
 21:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-stmmac-irq-unwind-v1-1-0c8a053761c7@gmail.com> <179082917987.31693.16306963663623790870@kernel.org>
In-Reply-To: <179082917987.31693.16306963663623790870@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 5 Oct 2026 22:33:41 -0600
X-Gm-Features: AclHuK82V5DkOUCqaUhJZE59pODmUlafKc3ZXKL-nCUbjbXn78J9QhKq5piIljM
Message-ID: <CADvTj4p8u0A-6hZ1Z231Z5usg5v8riBHtmskz_ozgO4ZrP36jw@mail.gmail.com>
Subject: Re: [PATCH net] net: stmmac: unwind the WoL IRQ after a safety IRQ
 request failure
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Jakub Kicinski <kuba@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Serge Semin <fancer.lancer@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_213354_123183_7912622A 
X-CRM114-Status: GOOD (  21.78  )
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

On Wed, Sep 30, 2026 at 10:33=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

Found during fault-injection testing of live XDP reopening while working
on the larger stmmac MTU/resume recovery series.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

Yes. A failed safety IRQ request produced a "Trying to free already-free
IRQ" warning and left the WoL handler registered.

>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

The reproducer used QEMU with the real driver and IRQ allocator, but
mocked MAC/DMA operations.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

