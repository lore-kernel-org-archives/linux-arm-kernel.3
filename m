Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43A5C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 01:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfnvOZjTArTctD/ymBYhfyfCvi+YnaKY+Ax/UmDkE0s=; b=tIVvXMv+a9Z5PCFkuNHiqyFMcV
	pZdk3ZinHhcMUIz/kf1soq6RO7IZVHHJ1CpPt9H0Avh79KB2nYjiEgpdTAJojK6vlMACU02jjShOa
	4vkkfWDYOHpKWtsCRzzHUMmNOCsYmKUU0t/6zf0DB960Ur7zJjFa+lsncvjcH1IvxMl3fWJ78oXG9
	HtLC0k/L98GAIDyaEnLHL211C5bd8lnw44TRdP35NE2kJ5Mh6Pw9+dYwhCXl48V3PIgT+tPxKij5P
	A6npyWCVTrc6hXcZ7vu/xHJb+uQlpCJVGGAA8LyfALNp4hS2PzxLgY9QwRTBQQwaiXXGQpuhNX2dg
	81PQhqVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDYmn-00000005EtF-1JXk;
	Sat, 10 May 2025 01:13:53 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDYkn-00000005Emf-41nS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 01:11:51 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-52934f4fb23so2024370e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 18:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1746839508; x=1747444308; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xfnvOZjTArTctD/ymBYhfyfCvi+YnaKY+Ax/UmDkE0s=;
        b=b/OkrWzbi2zwTIFZLNgzbNBztcmyfSwa3Kvjpa29SY87jZI68wOr9ZK7pEpS0gktee
         AzfzAlK3n9zyylNWHcV4umeLYdjkfL3cGLm4p8N+5C/6Y72JgEDqVAtpQYF2Qezq1VIc
         M6NQi4iG8tsm+kC/OIEcCGN6DrR65qPWqoOl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746839508; x=1747444308;
        h=cc:to:subject:message-id:date:thread-index:mime-version:in-reply-to
         :references:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfnvOZjTArTctD/ymBYhfyfCvi+YnaKY+Ax/UmDkE0s=;
        b=iT0MJvmgwqkRqsbsVHJ4fK95F7WgW8AdekOjl2gfE+jJLzjzbj04joq0W1SN8SIq/S
         mkEabb4Ix3Z2m73o3qrdIs7ZTHHe5OCyx+CIcHVTk8g4KPmKP0wauLZaOQd2HXGMWvf1
         692wXx8CoaBpEZnV+2Etkq8z9cHL34Ae0/ymFisNES595XPMAzHvRV29glXPxUMGlRhe
         mH20RjOvTJS8PuceJDErFarYoHnFBERfG9QCgrA6Jtk6OsMZBOP4qp8Jer0RBKefQhA2
         sUyH2SxuNAIGBHOefqBZaf3ZTrTL7bGN9HvzD6XxYGATOGTnVIV6oUUNhqAUOWrYDJNS
         Luuw==
X-Forwarded-Encrypted: i=1; AJvYcCUkh8tGs4zAOzZT6HBsx45mYty9/OAIOWS4mdk/7ddiLpd70khEQT5tAvJ7026yXLl0inIwmqvgVYszVYE5SMnt@lists.infradead.org
X-Gm-Message-State: AOJu0YxOZpeGH0pikJKvg9AUuiVpPD+SnsJtOWeFozurTX93N+Nj2UJl
	4LCx8GZH0/zKMPuPeqCHaAtzNyY324Q2dY3WZN5UXGEQR7vpbXTvRxViJbR/4jOaKpzYOsnt8ay
	Sd3uNfkAd7ZP/ynMVc4/s0Zq3cGLrcPBRBGRK
X-Gm-Gg: ASbGncvyR/3HbbetbleXD8lMXY+Ak5jvwSCoAAhH012q2+2xWQSqW8jniwi/yUExqcI
	4ZwIG50U5cODO8FE+Rdt8+Q9wuunJr0+bcevtJPtQsHH3tWaUIjyIY8wGXFCK1oZ6piDJzPx0E7
	bloIWyAMmP1UZIP5ReQYbltzrXwk/nComarQ==
X-Google-Smtp-Source: AGHT+IE4sXvyNXjG8WNaadif7bxOPhLOe1y6Ry36uIIGYYJZ+WmMezrfm/fmhMVuBl3XBtzwwZHReyMQPEltI3gIWXE=
X-Received: by 2002:a05:6122:3d0d:b0:529:1a6a:cc2f with SMTP id
 71dfb90a1353d-52c53d2f883mr5596955e0c.7.1746839508202; Fri, 09 May 2025
 18:11:48 -0700 (PDT)
From: William Zhang <william.zhang@broadcom.com>
References: <20250406-bcmbca-peripherals-arm-v2-0-22130836c2ed@linaro.org> <dc47e9ba-e23d-45d2-bae1-cac8bac2310b@broadcom.com>
In-Reply-To: <dc47e9ba-e23d-45d2-bae1-cac8bac2310b@broadcom.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKk0Iba5S5vFfMGFNn0Sizjy9mbxwHgAqlcsintLgA=
Date: Fri, 9 May 2025 18:11:49 -0700
X-Gm-Features: AX0GCFt3K95Ms68nC87j0n5IDLINSfLeg-FuKXyKdXYqk17d76prYmspWacWdcY
Message-ID: <ac86467d6f0b2c531f7d1356ade78e17@mail.gmail.com>
Subject: RE: [PATCH v2 00/12] ARM: bcm: Add some BCMBCA peripherals
To: Florian Fainelli <florian.fainelli@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Olivia Mackall <olivia@selenic.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000624b6f0634bdc44c"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_181150_043916_B8E57D2B 
X-CRM114-Status: GOOD (  32.02  )
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

--000000000000624b6f0634bdc44c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Linus,
> -----Original Message-----
> From: Florian Fainelli <florian.fainelli@broadcom.com>
> Sent: Saturday, April 26, 2025 1:49 AM
> To: Linus Walleij <linus.walleij@linaro.org>; Rob Herring
> <robh@kernel.org>;
> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>; William Zhang <william.zhang@broadcom.com>;
> Anand Gore <anand.gore@broadcom.com>; Kursad Oney
> <kursad.oney@broadcom.com>; Florian Fainelli
> <florian.fainelli@broadcom.com>; Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.p=
l>;
> Broadcom
> internal kernel review list <bcm-kernel-feedback-list@broadcom.com>;
> Olivia
> Mackall <olivia@selenic.com>; Ray Jui <rjui@broadcom.com>; Scott Branden
> <sbranden@broadcom.com>
> Cc: devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-
> crypto@vger.kernel.org; Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org>
> Subject: Re: [PATCH v2 00/12] ARM: bcm: Add some BCMBCA peripherals
>
>
>
> On 4/6/2025 5:32 PM, Linus Walleij wrote:
> > This adds a bunch peripherals to the Broadcom BRCMBCA
> > SoC:s that I happened to find documentation for in some
> > vendor header files.
> >
> > It started when I added a bunch of peripherals for the
> > BCM6846, and this included really helpful peripherals
> > such as the PL081 DMA, for which I think the most common
> > usecase is to be used as a memcpy engine to offload
> > transfer of blocks from NAND flash to/from the NAND
> > flash controller (at least this is how the STMicro
> > FSMC controller was using it).
> >
> > So I took a sweep and added all the stuff that has
> > bindings to:
> >
> > ARM:
> > - BCM6846
> > - BCM6855
> > - BCM6878
> > - BCM63138
> > - BCM63148
> > - BCM63178
> >
> > ARM64:
> > - BCM4908
> > - BCM6856
> > - BCM6858
> > - BCM63158
> >
> > There are several "holes" in this SoC list, I simply
> > just fixed those that I happened to run into documentation
> > for.
> >
> > Unfortunately while very similar, some IP blocks vary
> > slightly in version, the GPIO block is differently
> > integrated on different systems, and the interrupt assignments
> > are completely different, so it's safest to add these to each
> > DTSI individually.
> >
> > I add the interrupt binding for the RNG block in the
> > process as this exists even if Linux isn't using the
> > IRQ, and I put the RNG and DMA engines as default-enabled
> > because they are not routed to the outside and should
> > "just work" so why not.
> >
> > I did a rogue patch adding some stuff to BCM6756 based
> > on guessed but eventually dropped it. If someone has
> > docs for this SoC I can add it.
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Linus can you resubmit a v3 addressing William's feedback? I will drop
> your series for now. Thanks!
> --
> Florian

I wonder if you get a chance to review my feedbacks on this series?
Let me know if you have any questions.

Thanks,
William

--000000000000624b6f0634bdc44c
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
YDZuuBJwnyCzevMoPtVYPharioL5H3BRnQi8YoTXH7/uRo33dewYFm474yFjwwnt82TFtveVZkVq
6h4WIQ4wTcwFfET8zMkELnGzS5SHCl8sPD+lNxxJ1JDZYwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUq65GzwZxydFHjjYEU/9h
xHhPWlwwDQYJKoZIhvcNAQELBQADggEBAA2hGG3JPAdGPH0ZdohGUCIVjKz+U+EFuIDbS6A/5jqX
VhYAxZlzj7tSjUIM7G7IhyfqPC46GKJ/4x+Amz1Z6YxNGy71L68kYD6hIbBcA5AM42QBUufly6Oa
/ppSz3WoflVyFFQ5YXniZ+eU+2/cdnYZg4aVUnFjimOF5o3NfMLzOkhQNxbaDjFUfUYD8hKmU6v4
0vUBj8KZ9Gi1LIagLKUREn8jku0lcLsRbnJ5Ey5ScajC/FESPyYWasOW8j8/1EoJksmhbYGKNS6C
urb/KlmDGfVrIRYDbL0ckhGQIP5c6L+kSQZ2sHnQK0e0WgIaZYxaPYeY5u0GLCOze+3vyRMxggJg
MIICXAIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwxuh2XG3FXRL1W
JOEwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEIIVPdrVjlcOl4I8Q0jep9/rh92DI
ogokI8lm7HZahfyrMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI1
MDUxMDAxMTE0OFowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3
DQEBAQUABIIBAF2w0r0/SVecb3jpat3fLGJzTbzfy9dPfKkrUvKhxLFrHsjCpvaibjq9aI68I3yn
+E1CvE0fGBnQQcqexrcygBt1GD/uz0FpZq2bwNUzlsFpTrtgWdRGUlxGfWPqjOa062vzRzCaTA3E
QX5iH7uf9ZENKebD9dChv55mB3OQwpCWBQwiPqMOVkikujRa1ggStYgsqJTL93sVUyNYdiDGjzaK
+Jyq+HRJcRXoHHTzR1v815FBz5WHe6yBzutuUB97fkHgGVIe2BkebhT2H0Ybayjb8Qniy/y0+ysP
H1H1F3aJ9PWBuMxcYAHY/Uz3ekqiaDe8XwC9+zx5KWbpJcUCMxk=
--000000000000624b6f0634bdc44c--

