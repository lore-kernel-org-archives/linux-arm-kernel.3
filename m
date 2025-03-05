Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48E8C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 18:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G97yehnfCUaEkX4rJ+36HP/dRpAjXYP1giHtMFjur7M=; b=LdUInXG+lRoeczUa8dWLU2seIu
	PUw+aUUG8qg7HTdOE6H+yLW5vYwC8dTpgBmL22VrXmSNsoeKDlMlVkwC9ckl2obx3D7h51qHTkUY1
	e2ykw51+Uir3scPSg3NqqGKPyPc3LRqJBSDZ5vGpswJXej3LVUyB1KgvCxhat/7VvO+q+mjFOQH5z
	/2BGfA5vYG12llanlecz2o6NzQnt7SXIlQ7eH8SEW94rclHHe9Ay+BToaMCaq/a5reCe1IJ5xwoEW
	iJ2rMJMeRsMZC0XR5yqPdMs6M3JUfGNbfM3KBBcFeRiSXyUy6P7wDBpRaUkpnMaBSR7TY1qrRn5Fe
	WUcTcIMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tptD2-00000008t94-3IO0;
	Wed, 05 Mar 2025 18:11:08 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptA5-00000008sg8-454F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 18:08:07 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43690d4605dso46591895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 10:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741198084; x=1741802884; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G97yehnfCUaEkX4rJ+36HP/dRpAjXYP1giHtMFjur7M=;
        b=jvMTcqNqc4zgqz/HCsiTo4ZfoslMwu86xQVJFf5A8yx/Mfu7lvrP4B/rXstB0B9+RD
         HHGSsmLa4vtwEKz8Zua37AIkKyYvAn4Ve4NImuCADc4tXXLPVckG4gM5TkZxrU9sq3pb
         4gkRI9Bn1cwwjghEverFMLLHEU7yQ4SA7HlJkdjlAW4BcyMC5WEqbaAroLyE+fO3GIsA
         majiZzcckydHmJehJMug0yn4i7B2uPFuyCnVkeUcOdrcYxC4JKOT5f1zw2MFbrdtXokO
         j0Azt0jTJloN6555W6ZfgoDEdMOg3f9o0K+GVZNOlCYEN0vpvnbbfRidvxANwTfl356/
         KtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741198084; x=1741802884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G97yehnfCUaEkX4rJ+36HP/dRpAjXYP1giHtMFjur7M=;
        b=a1piS1hXMRld68kMLv305HDPVksG+qZvVPwdVQiNs2oWandcT9G8yb+zy0mVQ64aA1
         mabkCIjGsyHnec9hQJ2tUCQ+czRl5Rftt4Lu+hfo7Mtaut1A5YVS1iKW6HbzXNbkbl2o
         qQmHVfAaWJf6BrW9MfyLrW+Ul8AIbwmobeqzM8ALw6MXD1sxuj1PuDAekFIOgl5oBNXi
         /8OhMXvLF+Adc716cK0o7intR1a6iJ6QlypDKOMBraFCL0N/8XXGTlquqqpawOHVuj1M
         bQ98dEhTkzyGCKv6lW0VmsDKOInrjFkiLKeE2CsV43QjE4H/S+adZo8e7TzqOxQ1crvo
         +8ng==
X-Forwarded-Encrypted: i=1; AJvYcCXfYro/h7WTVlUB3JAyn/zxGx4JcDmYeE81Dr9ZrS4Z+wloou+QSwTwbt4SVdkpzHq1D8uJfffOuF1Fyzl0usHA@lists.infradead.org
X-Gm-Message-State: AOJu0YypRT3ztYQGMP4aZGLHklUzFIuxt0iZb2uTJgO0pIrK/Q93losz
	wYnBOx4hSIp4xQ6w84N5upIqqD2CNOU0g3yb83ppCyH+c8ur7RWI
X-Gm-Gg: ASbGncspiDqLJOwC3wmWLV7NBRHCay8C8zTEFZvAoxpuSyibqqiNisUCT4N+zAFSfcR
	wWKDUPYwxLiFaP2XJIfI55Gw9ruEYdXhjcxEYcozbWUfzabNrbolBOtkdIdpCbUsZux+HRpdrpm
	I1trtPzXPrUUCieMpKCTHYWYHe2sVA43h42RAzJyVcOQgxrD1lMgW+MgfVaZTe61Xl5uu7v0FiL
	/OTnfbqtJEM7RdnEwpogkf1sdK9WuZsnsr0t0+Nq8UEci4YmH++ByEPQEidEU9qkKqw1w1pVtz4
	eccIVricmzv6Dvc/TGIzITevRh/Wd565MpLYmiYa5Es2Xu+RHtOywf0KReysbQvhPb/6b3Ud58B
	p+zEY9FBjg5Mgr2UdHD/V
X-Google-Smtp-Source: AGHT+IFm8od6qyXXyVja7heRv60Cgy26NzGQfpPsD4T/2EJzs0OY9LJVVvkUZl+F0di/z2dnO6/Ysw==
X-Received: by 2002:a5d:5982:0:b0:38d:e401:fd61 with SMTP id ffacd0b85a97d-3911f7cb463mr3396313f8f.49.1741198084189;
        Wed, 05 Mar 2025 10:08:04 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-391254508b3sm1765425f8f.79.2025.03.05.10.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:08:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 8/8] pinctrl: sunxi: Add support for the secondary A523 GPIO
 ports
Date: Wed, 05 Mar 2025 19:08:02 +0100
Message-ID: <3535684.QJadu78ljV@jernej-laptop>
In-Reply-To: <20250227231447.20161-9-andre.przywara@arm.com>
References: <20250227231447.20161-1-andre.przywara@arm.com>
 <20250227231447.20161-9-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_100806_011037_B4289658 
X-CRM114-Status: GOOD (  10.15  )
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

Dne petek, 28. februar 2025 ob 00:14:47 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> As most other Allwinner SoCs before, the A523 chip contains a second
> GPIO controller, managing banks PL and PM.
> Use the newly introduced DT based pinctrl driver to describe just the
> generic pinctrl properties, so advertise the number of pins per bank
> and the interrupt capabilities. The actual function/mux assignment is
> taken from the devicetree.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



