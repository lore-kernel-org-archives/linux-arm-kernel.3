Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD50C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 17:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCTshSXQVcM1KFm7TGSucuLFTkQjMwCjolHqQrquCrk=; b=iEbNcUnKR3sxcB1YDev4eOEi6f
	PVKUgz/nfM5wJ5bZwiyfV899nH5FzeKsNZIGYdbpbrgwop6RfTSS6+TT2KbI50syms4n37exxSO4n
	jostQPepDF4C3Wt9Xe7T/i51U0eAfSX9QOJhoDyRkicACw9vkQKymbq++CHAAz8nhZaikIiaq6d5r
	VGta3T1HRgSJ7DaOhqRYEKEvWZulWRy30sRprLVXJnuk1Zp2gJQg128GTxOOLvNYnS1gh8KvXpoHH
	WfQJdS11vfW0ZtPMCPvJviQXOiIemNCuS09ZlmKGL74wp0qwzBg+yzdeYuYtI6XunHoawuxGnzpzb
	Y7VXxmSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0wz-000000094O9-02kF;
	Wed, 02 Jul 2025 17:08:49 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0Jb-00000008wzP-2wIE;
	Wed, 02 Jul 2025 16:28:08 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-235f9ea8d08so65638935ad.1;
        Wed, 02 Jul 2025 09:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1751473686; x=1752078486; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCTshSXQVcM1KFm7TGSucuLFTkQjMwCjolHqQrquCrk=;
        b=VnzsC+lPwPrQOe/mLbfJ3tvJKKc9wj+pfRv0TFSO/RZbBiFFcgYBOS9Eu+8Wz/y4lY
         aVNfFG0EOJ1bUzwl7qBOKlqH2F1nMOm8V2xMbptQJq8Y41RYcRGK0xbrEzKw0ltgUucP
         ThyFc23zqJJZR401lNqyUkJ2kj/FfL/B1GawN8N7o+kj+pDLL9BL5RvSAgHiIkwXvOaG
         wgF84awTYLPiUDER4gLpBrnnF+T56NYfcVB2YrF1OiXsULWMb41wS8DpoRTNMCOB3wae
         tk4xwqsuxNIddFCFY/o5tGn9KDwKDUrvnespFfPNofcEfooLl9F4caAFcF4iPldpxZ/6
         prpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751473686; x=1752078486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCTshSXQVcM1KFm7TGSucuLFTkQjMwCjolHqQrquCrk=;
        b=DRyGAHUgrggyUy5n1uNOrrcecQs3DZqavUlHP6X3qx4AlDae0w3CSGKlLbNSjPxeyC
         s1VyQx/h5tTxhPl7qllEE1W0r+1Vm523KT+8vTjpUtS3QeghvHkZGGc23PtKK24zVkAe
         A/jCd1Rkqg3eEmZowY41JuqhREz85WXXKopsm+/JnofkibFv7OA9yZN6FUBKuXOcrH6S
         bLE4R7TToF5Bs0C3XN396TNDP4cxUNh9sqPmXfl+ONpivRr5Pv9v29uHIld054I8lOnZ
         5aSKsGPA/vmrZ3X5MBfwkS3uzxXS2w4ZxfVYSQtjRtBOWmqvgx+so8W2W2+VWLGepxV8
         fECg==
X-Forwarded-Encrypted: i=1; AJvYcCUj2Bt8lgBtMdFbTzCPXn+yJEf/L3+AmllHNtXUzmXPyOHyLRrkXOJtXHxEWsE87Wb+oiBYiAJxEFOtKFz3@lists.infradead.org, AJvYcCXEoQXypfds60dcwavR82BrxSggUvWthSrblAnZb02ihIzl7RBy1h9koBSAOHSJUEvyYwgLcmVHGh2rCfFc2YjmzA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4nInylns6Oij2UwpN655MaP7vzVTH9i+K6uQ/Dgy+0fBGu0Of
	ZVHAn3SbNo2up7ZdiiE8TXZXcUielhM1ObOowvNJt2tO7NmO1PaQxhbyRZwKb3Plh3qWEiZPmgh
	lG+xYPzkGfSKUXFgckWXRMSDXxqKzzGE=
X-Gm-Gg: ASbGncs8QH52H4t++G6GMxctLe0zFfuE1NX6HORoc0YQSuvg7w/3z8viPHK9E2Pd/13
	4XdsfYgIPvxqMj/1P5AxcomZTpJGSOhQGgMeIYlqsFMPm5oaDAHZ85h4+dPAU44jSSegXrt8+wT
	+O7ETr0Cd+zPCof7sdkkp2P1aifADdijCXPlBzdbAijYwpo4A1aX4598jatNLjJAQykNd81LPE4
	8ec
X-Google-Smtp-Source: AGHT+IF14YYWtSQVLNWBilfTD0yTzo9aWZ97ZCPc9J9lKF7t4wOtrLhQknUMxWAgb+WT7kDpQ/opeNe9S8UxrZAnEVk=
X-Received: by 2002:a17:903:1ae3:b0:22e:421b:49b1 with SMTP id
 d9443c01a7336-23c6e5d61d7mr51904205ad.48.1751473686514; Wed, 02 Jul 2025
 09:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250628015328.249637-1-da@libre.computer> <CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
In-Reply-To: <CANAwSgTH67T9SBQSFQgFjvyrxNCbtfd9ZaCDZFACWA=ZQ-PYtQ@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 2 Jul 2025 18:27:55 +0200
X-Gm-Features: Ac12FXxvG-ViHEbQFCSslz9e9T4bovXAzoVxc9U88YSGNB8BC_29uQExD1MkQUM
Message-ID: <CAFBinCBwTkVwcBTWOzS+G13+rRM2eftMXZ3GHzW+F+BY0bBBzg@mail.gmail.com>
Subject: Re: [RFC] mmc: meson-gx-mmc: add delay during poweroff
To: Anand Moon <linux.amoon@gmail.com>
Cc: Da Xue <da@libre.computer>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_092807_749480_67D22D4A 
X-CRM114-Status: GOOD (  19.28  )
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

Hi Anand,

On Tue, Jul 1, 2025 at 12:00=E2=80=AFPM Anand Moon <linux.amoon@gmail.com> =
wrote:
>
> Hi Da,
>
> On Sat, 28 Jun 2025 at 09:15, Da Xue <da@libre.computer> wrote:
> >
> > Regulators controlling the SD card power need some settling time for SD
> > cards to fully reset from UHS modes. The regulator framework seems to
> > ignore falling times set in the device tree causing a few boards with t=
he
> > same hardware implementation to hang on reboot because the SD card stil=
l
> > had some voltage and did not reset properly to be initialized again.
> >
> > Add a delay sufficiently long for the voltage to drop so that the SD ca=
rd
> > can reset properly. Otherwise the reboot will hang at missing SD card
> > especially with Samsung cards.
> >
> Although the driver defines reset identifiers such as
> RESET_SD_EMMC_A, RESET_SD_EMMC_B, and RESET_SD_EMMC_C,
> It does not implement proper reset controller functionality,
> specifically lacking support
> for reset_control_assert() and reset_control_deassert() operations.
I think there's a misunderstanding:
The meson-gx-mmc driver calls device_reset_optional() during .probe
which will internally call reset_control_reset().
So I don't see a problem here.

The patch seems more about power sequencing, where either the SD card
or regulator used to power the SD card requires a certain amount of
time (delay) when switching from ON -> OFF -> ON (my understanding is:
without this delay the card sees ON -> ON which fails to update some
state internally).

To me it's not clear if this is a property of the SD spec or rather
the regulator.
Ulf, Jerome - any ideas / inputs from you?


Best regards,
Martin

