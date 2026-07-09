Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C99C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TPRtn6A80Mn/spKxDN6QBMjTm4oZsTH6ypctlg8LR78=; b=WxzJPZCYK3eqviwIg87UG9XctQ
	tPJpNDwmvI7x9yI0j9rSE7ArXlyHjtv6QOERaVBH+F4btMJGD4VEDXBRZN2dPSEpCdCUSXKYWKaCG
	n6CDHxHN3AL1TY1w+k95xnIa6p6EY6dExlISouKo1l0bZcyJlm6N+DGl1P84ab8cgqbEP3X778JjR
	MWYqXfAYbJoMUOdoQOLZWknSWyipmr6EMF6WxQgn9yiEIU2eol/5oekeXDZLBtfJMYfw/SH10Lm9J
	lDlnjKNH+stYXZy4BMtEpMVnAcCGmjlst0SXupy+HoNdvMIjxc1SUbGdX1dJWlYBVORb24bCiEYYG
	pDGItl/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkCk-00000001Qws-1xvs;
	Thu, 09 Jul 2026 08:33:58 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkCf-00000001QwJ-49lO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 08:33:57 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5aec201b582so1858424e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 01:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783586032; x=1784190832; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TPRtn6A80Mn/spKxDN6QBMjTm4oZsTH6ypctlg8LR78=;
        b=NkJRSX829IT9AnRjgRHx2COkvr/GPG1XeFg8cX2xYn4Re3Iludf7KeW7w2CqlKgIe1
         CjNXNvdcJIqVD74cxRJXd8unyLMULKjYbN1fZWKFy43Y7bLWT7gle6LxcfOX1eWiHcfK
         0hrHe3QTPn/vnbYVSKMS+MQcYo7MT3OwKtQBti0Fo7QXAbBzZyHOaR3i6ApvYujTIXYp
         mFyRomJjS3Vt2kX3khJU5X4GFP/k+jiZMDyCajiy/8YQcyepTEML1S4MgfMpBQzH7uwV
         mbwx248sRjMsI2mYB4Y2lmXbzgL8CJANqQfyn3JabuloOINWNp6oyfsmQ75/zPiRe3+E
         LIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586032; x=1784190832;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TPRtn6A80Mn/spKxDN6QBMjTm4oZsTH6ypctlg8LR78=;
        b=BytKb3VljKdN3FkuoYMYJWlNykbQhVW0T4bLdolFt/K+4ZJR6BwI8sbmsQqGIJ5oew
         /B25i54J+RdV7NM5Ee4DQd9ipVKS5v8g+BwqLqX8S6hPtlrKP1z+Mj0ayZ7q2IIGwY2C
         Ey7KzCCB3VZFE2UTQ7iT8xV1AtUsSuMNbtnmldOZV9LymWmiobESSYN+qUYc2OYS3lIc
         2EKUTBjZRsLDjjDQJcL+EZ2T2hbl4Ki2v59bQsrRWSyszvoFASOy50Vy8zIHosMODJqS
         jQN8WXKX6H4/iA1yLWm63/G79Rt76SzTIkn1AonDnFJfLxV10m1zaIT1KEjcTRf1raNZ
         lOLA==
X-Forwarded-Encrypted: i=1; AHgh+RpZAgMm/7CK82+7R1gnbC0pNiKusMq1JOVyLME8AbeIG4+YdyGvr5bN5p/83eBv25T2dJ0wrE31SnGwBOoD/Msm@lists.infradead.org
X-Gm-Message-State: AOJu0YwrM7cFc3T/yzFuvK7daz5dmAV7sMHaXeB1yDmVjiZYvQDVTeHw
	Tt0nS7Go/5kYsVLVsJUmp9WjHY37KShfaUYYZlInjSQk1CUO9hosvnQz
X-Gm-Gg: AfdE7cnZflod/nibvwvIQXAdsbeHqAmSPoA1G/VV0Ertb5nlnLHwDQCWTFKVlbcmIY/
	76I/7a0O0tmra0Cymydw8ykeMnfEFJrtDGPu5UagDNHHJNggDz2UeEEvUTw6gsDlQdt4YzAadIc
	smKjLQmRoR8mkfZoRHbi1JTMOlAuupNs7UDQWxdDUpALz3c3P4JnlIY2ciqgdjn88fx2jSdhDLu
	Zu0U4lKXHta/34RGio9AJi/r4koYDZ1ioiyWoNELMSN8CRwtJzo7POupWslEzv8at1qSvNERSL0
	a4ueOZKM5lX7msoyoQ43GCG1TGN5JkiLBESFpe1e7frGr6hC90/Eqg4GGgPHngZWxmuSvbOcqcz
	VKAlfkKodb8l6xUSbUfOSRdQSkgQEJDuLgPRGkw2lPN6uXXalsjAjPxiVYSNCCz8yqayzlZ4+dH
	630t9W6mP6lzzA8K6DSyCw2/jirSJEp+PGP8RpkvTY9zf2tcWTVA==
X-Received: by 2002:a05:6512:3af:b0:5ae:bcf8:e7d0 with SMTP id 2adb3069b0e04-5b011477c08mr1015479e87.55.1783586031526;
        Thu, 09 Jul 2026 01:33:51 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b13542sm2253471fa.11.2026.07.09.01.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:33:49 -0700 (PDT)
Date: Thu, 9 Jul 2026 10:33:46 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Rosin <peda@lysator.liu.se>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 0/7] I2C Mux per channel bus speed
Message-ID: <ak9c6nGBsgMTP099@gmail.com>
References: <20260708-i2c-mux-v10-0-09dca03c8a15@gmail.com>
 <ak6m6srzX8dd6_nT@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ak6m6srzX8dd6_nT@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_013354_071611_264EAA66 
X-CRM114-Status: GOOD (  37.80  )
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

Hi Andy,

On Wed, Jul 08, 2026 at 10:37:14PM +0300, Andy Shevchenko wrote:
> On Wed, Jul 08, 2026 at 02:16:12PM +0200, Marcus Folkesson wrote:
> > This was a RFC on how to implement a feature to have different bus
> > speeds on different channels with an I2C multiplexer/switch.
> > As no major complaints on the design came up during the review, I
> > decided to submit the series without the RFC tag.
> >=20
> > The benefit with this feature is that you may group devices after
> > the fastest bus speed they can handle.
> > A real-world example is that you could have e.g. a display running @400=
kHz
> > and a smart battery running @100kHz using the same I2C controller.
> >=20
> > There are many corner cases where this may cause a problem for some
> > hardware topologies. I've tried to describe those I could think of
> > in the documentation, see Patch #5.
> >=20
> > E.g. one risk is that if the mux driver does not disconnect channels
> > when Idle, this may cause a higher frequency to "leak" through to
> > devices that are supposed to run at lower bus speed.
> > This is not only a "problem" for changing bus speed but could also be
> > an issue for potential address conflicts.
> >=20
> > This patchset has been used and tested heavily the last months
> > on a custom board based on a da850 (DaVinci) platform.
>=20
> ...
>=20
> > Changes in v10:
> >=20
> > - Fix gramatics in documentation
> > - Move {__,}i2c_adapter_set_clk_freq() to i2c-mux.c
>=20
> Can you point to the discussion where it was suggested, please?
> It was like ages ago (too many patches to review) and I probably
> missed and/or forgot the rationale for that. Also if we move
> to i2c-mux, why do we leave it in the adapter namespace?

Hrm, it seems like the mailing list wasn't CC:ed for that comment.
It was suggested by Peter and the rationale to remove it was:

"
I'not sure it's a good idea to expose {__,}i2c_adapter_set_clk_freq().

Do we really want to make it so simple for random (non-mux) I2C drivers
to muck about with the bus speed? Any bus speed changes not coordinated
with mux-locked bus speed changes are going to be problematic. This is
shown by the discussion about D2 for the multi-level mux-locked example
(patch 5/5) -> it is problematic even when the bus speed is changed by
the mux code itself.

I think these helpers should be moved from i2c.h to i2c-mux.c.
"

>=20
> > - Make set_clk_freq() return actual frequency
> > - Reimplement idle_state (from earlier version)
> > - Implement example on idle_state for ltc4306
> > - Link to v9: https://lore.kernel.org/r/20260324-i2c-mux-v9-0-5292b0608=
243@gmail.com
>=20
> FWIW, I briefly read the v9 discussion and haven't got the above move,
> seems wasn't discussed there?
>=20
> --=20
> With Best Regards,
> Andy Shevchenko
>=20
>=20

Best regards,
Marcus Folkesson

