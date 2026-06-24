Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB8ACDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 13:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hmQpzJT1LFiuBCedVTY1IO9MEPmTIQMCZ1zdVhoFzY=; b=lhQlGWSc13IFxbP9b5QD7Pvab/
	DbCO99mp+aSbMw3H/QoFYzTQOdkRGD/jpg8CgI2WWp5WAnnSu4xp6mcSihemr/4KHWbmqjyVyv7GZ
	cZspCJFC/t4EtLTUlw4edn7SPmMWQwxKhhI3hnLSyer8Nbg8lSBhjhsslw8T/WX8YU+9x8wV0w2a0
	6gqF6CUzEic5rlE8FDKZoVybnAxgKK4tVIGDDmRZWiufQ02CPvlNq/5i1ejECwV54qcF2vpQOZsgi
	4rlu7Fey/XuO9sIYrsZj6V/vUabgVdolx1KfgJjhJqO2FsdkOhZoqkjR4XQVrffXCHrXXZ7pTJoVy
	Wz3iGblg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNu9-00000007qNr-1idH;
	Wed, 24 Jun 2026 13:44:37 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcNu5-00000007qNE-3N9T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 13:44:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4922244f7c7so9734275e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 06:44:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782308672; cv=none;
        d=google.com; s=arc-20240605;
        b=IoMyMFiSqdZRhCzJEPaOFnYVPAXkYnxydBBRdJiayAT+5MyZCnO8eRZnL2BHtbQwmT
         IseUG1SmvYKWKXo8QGX40MDtlnE+jQnQNEsuBTtSTjwi0G5ZzB6qf4hdxTbp7/wHsjFe
         5wwJXp99rASCbqAZkL6VaDf/rfCR0tRT2U0YOVOmr32PKZdbh6JLSCJQ/QCU6wVdnzgG
         pjJQJtjy6QU2rIkXlV0kB1eYMNoq9lv35a1067s+n6sw5O7djQrUrgdH3s8RKg6W0aD2
         2ulygiDBtnh/C1GOGEoe7y+74ssXKaFhrtGHO5uYpoalCQ18knOvBVtHjbljnhc65PaU
         B+mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4hmQpzJT1LFiuBCedVTY1IO9MEPmTIQMCZ1zdVhoFzY=;
        fh=8NWEo7H0cfBUEVTG6P1IJSEioJhBRsUFjliuP/3L9FQ=;
        b=lTdC9implJAV5yfz8zO+E0Wj7miAoMrU/GZaKXqC6UZWJ+d7nk4qJDbYOLo/OEZNa3
         qR4I7tZ384/699oYtgus5bb3iDD1+KD4zJuAcxX+dLip6RwU7tyefKsgIl5l8Fbx+qmm
         bBrPaHNBikZCDUkYsElV+1+mKqfNoXh4/4tCwt7XUiPm32HveHMhXVLxYjf+aY/3ULhV
         qpEZx94DWwO6YnZeeHufUM6WWhl9J/3/3v4rOoGfQKHhvBhpjhRRWjaGBcyiNszAB90l
         f/GF4q+zSu6Yv3q4wFs0zAT9Ki8Y/9OYOgYB3hk/7BuQ7/6dbvTkMUcNkMSLIc9YtV3k
         +h6g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782308672; x=1782913472; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hmQpzJT1LFiuBCedVTY1IO9MEPmTIQMCZ1zdVhoFzY=;
        b=AYGVgSwu3kZEkZYz0R2msdjv9y2tm5+C3sdmQ6VJcg9BDvdwYqGk9PT7MhEuhoMuma
         zQACyNYXH1JMZv4WznZVJgQd6sOCi78El+wxv4ZJLDZhQw0zBxILsuM+p8byyS3FyUa9
         xkCi9ijGII6/10sUfpsbnl9bSeU4e/D8116kjp4nw4MXiJfP9LvI022byzdaZL+iLVQI
         STF7lVlbBIO2kUHCWGFVLkjQBepO96OM2htYDyGlE6p4przWmvyvEsaVPuK/F5r4YjdI
         ldW8lheqZSvec2+21s+5ayOp6p1ijxSKZXsARQh+PKrD+rz/dsXif6x5qUhtz8mC9XNI
         DYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782308672; x=1782913472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4hmQpzJT1LFiuBCedVTY1IO9MEPmTIQMCZ1zdVhoFzY=;
        b=ZU0q2n/GjIkVXfOL6ZB2kup0dHRnnNLtfu+J4ovWisxxVi1nOcC2mq1gHMs+OdX14E
         y8U6/yhtt2pW6t2yBblkKYo4Qt76R77uLcNzxfpr1uNAMj1QzQh5GziN0s1vrVE/IDEJ
         UMCi0lXy6DVOr3qrfMJHczFp7aCxw3qDyvyFTM7fRtTJ+sx3ngUZ3qv5H2gbO1YoGapa
         J563X7G/smaCg6qdTK4ziGM8eMwFVET3N3V/GxjkYmvjltTkDCNWbvOSE9HFpXUShRc9
         g6JOU1HYF4O5uek6m4m2uFHkL7bJX7rBkRiuetat78aGf3pBsUR7CKFHqGeUQwhVVsSW
         YEow==
X-Forwarded-Encrypted: i=1; AFNElJ/u5uSsb0QqwL7rJ9DqWYnl5UGOAHT9ZqgnM1BZ6XR6NXX/TF6baRUAUTrsxTgO+LqzbAVqxjpc/HtEWfrbQWKo@lists.infradead.org
X-Gm-Message-State: AOJu0YwFrfCMnB8KE0gX4FMp3V6TZAiL5slbdOeJWNZToL4aqsKDfBnd
	TwJy2b1Ek2R8zbHyB6fqK77LrgVOl6/XI1gkHShP4kXH64J2lCsFjAvAvdwixAOqmZRSW4SOuAr
	g3Un9QWbkCumZO9pPr5b79Jl79ltX7Pl2j0JR58tZFA==
X-Gm-Gg: AfdE7cnA6I4BahrwvpYbSejVRqHFgtyW0nQn6HPJS0LMIemGlNA3TieO9D/qOqOE1Ew
	Lm8gMMEJhs16UGAqjA5sHCnKo04GqTxAt9uH+rRhuXRoQEidEV3EZaLskiMRe6wL1CJtELrIvz2
	APzzf5JAR4OH3ic7sn7P/NHapSZhnZihkOMAPTBgoqkOr+XJECT4Co7EwC7shth7zInX9254/pk
	k0XZOnuZVGlm8U74lglTcpPcQ17fI1YRrfdWI/7DLRyJKkewDPZkKyDmQBA9qFwTG9Q9ASoc736
	P58M0nTrqvgyDeITk0SdKqlyo4Wt7Co+wNdHFRwZLc4DB69CLbOq44xL3g==
X-Received: by 2002:a05:600c:4ecb:b0:492:37b7:607a with SMTP id
 5b1f17b1804b1-492608796bemr50951345e9.31.1782308671484; Wed, 24 Jun 2026
 06:44:31 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1782224059.git.gregoire.layet@9elements.com>
 <30aedaa9ffd5ba2d763d8802a07b77ef2d5bfcf0.1782224060.git.gregoire.layet@9elements.com>
 <20260624-copper-albatross-of-youth-6abae8@quoll>
In-Reply-To: <20260624-copper-albatross-of-youth-6abae8@quoll>
From: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Wed, 24 Jun 2026 15:44:19 +0200
X-Gm-Features: AVVi8CevgRC28tg2RrmLdkUxp5ymSnVB-xqiyZURryTvD9U9Bz7rA-Yxg2vjrr0
Message-ID: <CAFi2wKY+JZZV5vKnKKO91Bk-903+HVKm2a6NF+fufri0r3EjCA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] ARM: dts: aspeed: g6: Change vuart compatible
 string for ast2600
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch, 
	jacky_chou@aspeedtech.com, yh_chung@aspeedtech.com, ninad@linux.ibm.com, 
	anirudhsriniv@gmail.com, linux-serial@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_064433_891866_AA2739B1 
X-CRM114-Status: GOOD (  10.21  )
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

Hi Krzysztof,

> Please start testing your patches. This for sure fails tests.
>
> It does not look like you tested the DTS against bindings. Please run
> 'make dtbs_check W=3D1' (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sou=
rces-with-the-devicetree-schema/
> for instructions).
> Maybe you need to update your dtschema and yamllint. Don't rely on
> distro packages for dtschema and be sure you are using the latest
> released dtschema.

You are right, I had tested my patches but wrongly. It is indeed failling.
I'm very sorry for that. Thank's for taking the time to explain.

Best regards,
Gr=C3=A9goire

