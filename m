Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6A5CE8E9A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hdAvb8NLWL704iTziqYqjEOhmMGQ3+UNyvCY/oBTLo=; b=pGZJuyDSK1dLQsKTQ0xOHPg/g8
	42FOwrQqHpohipjQUj4bcZpR9B3RpNRGMzsSdW0HWi/TvuSpfGWtWxtA4ATYtz4KiD3sPDmw+2GFV
	jVE2dmM0BgxTLstAl9ThIKg5hkMci498tkmLbtTxyFiCUkhmjQ+0AhrgdvRL3nSHRst+g+/YoqdrL
	T24UqII5CwZxchPVWHidO93cuyxQyRFgU0G5s7Fzs6qpcCD8IsoblaVuc9RxabW7/nG+MfQKoUbL6
	03lJym47phalsKC1C3auzzCd7tKUtA2e41r9Anpd7d6ydumbiWwUu/PwfX2Bmo4kwwSzRWgIGPsNw
	9DdwUCpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41mi-00000001JVt-2ARu;
	Thu, 24 Oct 2024 17:38:08 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41OW-00000001EdY-2if4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 17:13:10 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539e59dadebso1511776e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 10:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729789987; x=1730394787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hdAvb8NLWL704iTziqYqjEOhmMGQ3+UNyvCY/oBTLo=;
        b=Rv8VPcur5uHqeJ6HJYLRj31VLjG1V+LeXKJS4lNUtZrt2JYFTNSlO5Pr7dy2pNTugF
         WPafiZXiEiHmbA2PoVRGf/3ri+UqMfPXTDSYD1F3TJYzEyR8NdPACQBgbpm6F9ls0Z48
         th3N1osFx7DgcWMnYw1DCoJ6ejYZH3q7CPSJ4R/43KIIIxR2tsQnTp+oPAWfrqfDK0lT
         QCvy0ey+HRzADFQKCgMRgPzsLlHPen+m5J4LIz3bvXefgB2sh6jXQbIx7WpByc0j4VuR
         FxJsaMUev3r3aHiEfajjBjQFEfVK+G+YwOFkHacHAqlS95MUTCdGlXGX2e2MheUXuNAF
         79Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729789987; x=1730394787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hdAvb8NLWL704iTziqYqjEOhmMGQ3+UNyvCY/oBTLo=;
        b=R9XR4XAq6cOnRmht7PFaaODJSIlOZyO/yJtJqfdJ+gVS2C037bXs3hZ75ECjJLI9Kz
         F8whYYG0nV5IAp91abS+Dh1zqAifofTbnUOSSlVZNGebm4bSZQzHNJwvT3aqhlok5Cuv
         /0PqMrMODEkiPFftNhmtsGCRwV2tVHvwqCWu1sgwXt1ugjnAWrfn26AidOYYuJ7iPRf+
         UfQe4HFpqGVGLwfZ8McUs//p7k00/pwZ6UtT5ETdwW2n/G5EaPEiw5CooAu5egX0Pmmb
         VE6yWbfFXESZDDvsD/Wh4eW5COtf9cnDbv4ltWZqGiSe0Mn9Mf20cGyd94JCFdeOlO8r
         UXuw==
X-Forwarded-Encrypted: i=1; AJvYcCWhl/SQJjb2BBQH/KbP9d5+ViXhNyD1klcKSk36e9FkkKNOFk0rQm90SfZWecekfEnIkBf3CjAgdh8jWAyW4TRQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yws9j3HXOFI3IcyuK36+rUxf1mQe54W2KdZj+nQKzZC/kjl0iHH
	xEkd8iPKrc06F48TqSMwa9D5hyNkXbp1IAAL2TAd0hj0ppKBmTGG
X-Google-Smtp-Source: AGHT+IEJrnhn/5/VxTjI1TEQfMbkTLNVVw+upqvyz70ssz9oIGnbiAEnPfVYa3vxl29Vh+zfeQfo5A==
X-Received: by 2002:ac2:4c42:0:b0:539:8ad5:5093 with SMTP id 2adb3069b0e04-53b23e33be4mr1818516e87.35.1729789986594;
        Thu, 24 Oct 2024 10:13:06 -0700 (PDT)
Received: from seven-swords.. ([2a03:d000:2:9006:4eed:fbff:fe72:e806])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a224202a6sm1431843e87.125.2024.10.24.10.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:13:05 -0700 (PDT)
From: Ivan Epifanov <isage.dna@gmail.com>
To: linux@roeck-us.net
Cc: andriy.shevchenko@intel.com,
	aospan@netup.ru,
	conor.dooley@microchip.com,
	ddrokosov@sberdevices.ru,
	dmaengine@vger.kernel.org,
	dushistov@mail.ru,
	fancer.lancer@gmail.com,
	geert@linux-m68k.org,
	gregkh@linuxfoundation.org,
	hoan@os.amperecomputing.com,
	ink@jurassic.park.msu.ru,
	isage.dna@gmail.com,
	jeffbai@aosc.io,
	kexybiscuit@aosc.io,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	manivannan.sadhasivam@linaro.org,
	mattst88@gmail.com,
	netdev@vger.kernel.org,
	nikita@trvn.ru,
	ntb@lists.linux.dev,
	patches@lists.linux.dev,
	richard.henderson@linaro.org,
	s.shtylyov@omp.ru,
	serjk@netup.ru,
	shc_work@mail.ru,
	torvalds@linux-foundation.org,
	torvic9@mailbox.org,
	tsbogend@alpha.franken.de,
	v.georgiev@metrotek.ru,
	wangyuli@uniontech.com,
	wsa+renesas@sang-engineering.com,
	xeb@mail.ru
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various compliance requirements."
Date: Thu, 24 Oct 2024 20:13:01 +0300
Message-ID: <20241024171301.241949-1-isage.dna@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <61a622bd-7597-45e2-96d9-9cba02fba407@roeck-us.net>
References: <61a622bd-7597-45e2-96d9-9cba02fba407@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_101308_706724_DE75B0E1 
X-CRM114-Status: UNSURE (   6.66  )
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

> I really don't want to get involved, but this misinformation really goes too far.

Then don't.

> https://en.wikipedia.org/wiki/Finland_in_World_War_II

> provides context. And it does sound familiar. Turns out the Finnish defended
> themselves against invasion from the Soviet Union. Sounds familiar ? Guess it's
> the same as those alleged Nazis in Ukraine nowadays.

Especially if you can't read beyond few pararaphs.

