Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C73BACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 14:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2XlaJwSBpPWg5uTVaQnN9+A5FFLDYX24zRCV5h5kec=; b=m/omJq5yZ33AeSMNLxmnGSvcwk
	PGxbxBVzHEn1Qk6HUARbU/y6iy7Rj+25Gdkiz/F7C2liDyKUEdPYJIK3J+j4NDzVp6GJKZUn9T+X4
	FXV7Z8Gt9yACYVxigXM8rcC1qW2z9c5SXuTu8XPD1SY0rr4qyLJMjZJYY6i3Ov5Y+NWeAaShq0r/6
	lNrqCnrZFAdX0JIJcHpYnBWtjNwyS9fwA92+5mbGSbvie+3xhaPUzeyvHbJ5pnkwuuyL6w+WM7eWk
	ch6YNhE1z/eHmWa+CFDygZJHzg0YkQ5aSYA3Wtyb2aIn+PdljdkIXgbkfyfZ/+owQYHVitqNY8Xiv
	0mBePD/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAp4-00000002xoK-28yS;
	Wed, 13 May 2026 14:44:30 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNAp2-00000002xni-1Srx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 14:44:29 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-13317450f83so3076379c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 07:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778683467; x=1779288267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2XlaJwSBpPWg5uTVaQnN9+A5FFLDYX24zRCV5h5kec=;
        b=ZWiwIgG5dW3QfGMSC/+dxOElFnEtrx23DRAG5mGwl+5WQAVLve0xXuw+mq3uoa4VOn
         EElujens4lNTXi/H7TEMVi90p3dDAbRFItTRAHt7atzl6dGE9Ot9mjUXJ43bPX/GtIqX
         sFC/0ExlTj8nFXE4rb9BL3J6jeqqeUF9FPfaCiMfv6TwKK++HvLejG4rN+VEhTIdfK/J
         WvpsRU6lCV+J10LT3pP4aJz8RFbO9RdbmF3oIpxPHaZln99yZrp1P9hYmrMwGrvV1r0g
         kO+CqQZQgF5YfnPwb0bGhWNFXU7Ya9lBC5tKv+aMH3AJYJQUGZxOkvEUggS7Oa10fRCs
         PeMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778683467; x=1779288267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f2XlaJwSBpPWg5uTVaQnN9+A5FFLDYX24zRCV5h5kec=;
        b=Hil1I3yUNeAo76m5BeeOT07fFpjnyiJYhkOlCIWQOI8Uo4RB0GKTj7hzI+AENiThER
         vK17hYZqs/rblPPTmJJPd20E+/mrwbYXxwu8ssxASGfSnnYoUHtL3paO2g5RgTDcuqdN
         YTRXWQi5CdmO1lJnRmKv67HoCndRt1wMDU6uKl4aPzgGbmfWSuTIrROmLGX3gQwbGMc9
         ytwKjSYHmChpPh4vi5q3g8cNrAZRVoDou4/pAVZPnceyEXSDpSabQ6b0HpIrW7CXvyqN
         9LGVQOP3KMNbEtjFNire+AAnxw7tf+yMx6X36xt6tWX4tyVz/J9P3ebCAJ82Fd+A0baU
         IpRA==
X-Forwarded-Encrypted: i=1; AFNElJ9jVB9hTEgJcwPLVR3gcvXb8V6EFWfh7lSTrbOklWE4fOreYMlMXbrZcQQrSRbv7YIsIBoMaObt3O3K9IbNzN0b@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb0C6QWjbGadNPEVt0u//UWqq/NzmNOs1ub/PFndHA5KfL/uJD
	dAANWG/tdt0fOkqrKYlnDI6jLBADNVflnRFcNk1XqV/voGrlvkx+qVl2
X-Gm-Gg: Acq92OGcT6HosOV7SkcywD5Agg+1+Fnt4JhLKXqycOGArjqkB/wv5PKKk7Ghp1oLonX
	uBS22SnSFD4EC5eC2pAfKPIZk+ufuoF3sF37ACFFy9qhwq7bYwLJvq96+29F01S+JToDPhBHGHo
	0QsaI1nkYb2dmZInNyV3q1CU+ZxPz11fzunwGSB9PegaLgb0BxCkFN0RT3s1giNjQ3ytRk6zR/6
	wYBnUWgieqi8Wsbd29nqt6/CnbR/Nclud3Vr/UhpKoyqjLRTGUVx6f0djOoqKGeVLJxp5wLGS0M
	MnhB1tOqkkxBdgetIKzLHPKk+im/T4m1bnfxGq2x3Y1kJKjnoVyDN21FA8gha0BLE5HWBPOJxd+
	xsIvOCeOBCkuHqvJqaU0D1671a/KYN8cR0JnIhlBvkrd6bM8EuDRXX2zgRgKpvolmTeFx2R3Jz/
	u/PT0cLOiWBJDQbldxShgkf6+SUdggsj+taXpn
X-Received: by 2002:a05:7022:128c:b0:132:83e6:41 with SMTP id a92af1059eb24-1342f2230ddmr2313170c88.13.1778683467152;
        Wed, 13 May 2026 07:44:27 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11:5d6e:9aed:ce1b:4ae9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327865955fsm29768228c88.11.2026.05.13.07.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:44:26 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linusw@kernel.org
Cc: alexandre.torgue@st.com,
	andersson@kernel.org,
	andre.przywara@arm.com,
	andrew@lunn.ch,
	baruch@tkos.co.il,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gregory.clement@bootlin.com,
	jerrysteve1101@gmail.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	lee@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	paul.barker@sancloud.com,
	pavel@kernel.org,
	pavel@ucw.cz,
	peda@axentia.se,
	robert.marko@sartura.hr,
	robh@kernel.org,
	romain.perier@gmail.com,
	sebastian.hesselbarth@gmail.com,
	vincent.knecht@mailoo.org,
	von81@163.com,
	xuwei5@hisilicon.com
Subject: Re: [PATCH 2/5] leds: is31fl319x: Fix shutdown GPIO initial state and remove redundant startup pulse
Date: Wed, 13 May 2026 22:44:10 +0800
Message-ID: <20260513144414.244968-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAD++jLk0BrV+MAh4n6+wAqNX+O8BcHcoehbX574F2_Vcm4qvGQ@mail.gmail.com>
References: <CAD++jLk0BrV+MAh4n6+wAqNX+O8BcHcoehbX574F2_Vcm4qvGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_074428_391110_B9BC575A 
X-CRM114-Status: GOOD (  16.20  )
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

> On Fri, May 8, 2026 at 5:26=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> w=
> rote:
> 
> > 1. Per IS31FL319x datasheet [1], the hardware shutdown pin (SDB) is
> > active-low.
> 
> So that means that driving the line low will shut down the hardware.

Yes, that is right.

> 
> > -       is31->shutdown_gpio =3D devm_gpiod_get_optional(dev, "shutdown", =
> GPIOD_OUT_HIGH);
> > +       is31->shutdown_gpio =3D devm_gpiod_get_optional(dev, "shutdown", =
> GPIOD_OUT_LOW);
> 
> Add a comment here that this will in fact drive the line high,
> because the GPIO line will be flagged as GPIO_ACTIVE_LOW
> in the provider (such as the device tree).
> 
> At least write this in the commit message, it's a missing piece
> that helps readers understand what is going on.

Okay, I will add the necessary comment in the V2 version.

> 
> Have you checked any existing device trees so you don't
> break something here?

I have modified the problematic device trees and CC'd 
the relevant platform mailing lists as well as the device‑tree mailing list [1].

[1] https://lore.kernel.org/linux-devicetree/20260508152435.21389-1-jerrysteve1101@gmail.com/

> 
> If you're breaking platforms you may need a fixup in
> drivers/gpio/gpiolib-of.c to force the consumer active
> low for legacy device trees.

Thanks for the reminder. I will add the necessary fixup in the V2 version.

> 
> Yours,
> Linus Walleij
> 
> Yours,
> Linus Walleij


