Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A64F513EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 00:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xnN0vutjsPKGswOUFl0+fS+UaXwilttvAUBkhW/dWfo=; b=f6Qummq/CgN2/bZjiDu0QEyq+U
	+qSy19t9Bq8vp2AI3RTJaw86HvVqjE1qTuBzl8WHBskreWUNFUKtG/yt06+5+JsFthiAhdQKuUN0U
	n0VUxtark5gqzKycWg2Txg/ZkJzKsSrNm9VNqp/urw7qGIXI7MAHSPjH9buAbSuanw/iU5ijwZ8VN
	5GzuMpppqROeb0zdJtG0fu+5/5afoq672HTbHfkGoNEpLYujJWmoJLZtgvRpFbavrjAbAvQwWJVil
	lOGzDAjZOi9f5Xd1afI8yGgK2LnPUFeCIawnELULHOSTDzQBwOHE77vlkqbY8veAg5Em+gKqqnv5u
	8p+zNGhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJ6O-00000002mwz-2wud;
	Fri, 06 Mar 2026 00:31:36 +0000
Received: from mail-pf1-f169.google.com ([209.85.210.169])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJ6L-00000002mwU-23ZL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 00:31:35 +0000
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8273e0fb87aso4877775b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 16:31:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772757091; x=1773361891;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xnN0vutjsPKGswOUFl0+fS+UaXwilttvAUBkhW/dWfo=;
        b=KEQbgkitNW1sxsirfwTonPxZ9uKQyjlxitYKKwd5CAnfW6BhomyBY/h2O+Qs1gDg3b
         RKKXO7OrBqP82SzIc2YtX0VA23kN1Z4er4fHt65n7o3J22SFFNpPt/MFvOSGpRBmYQ3E
         V4BCfU/Bcn7C9Z+NYEblXHmzRL3PPewm3aaRUrxUI1fmKVZZPCVhM3exsJGMdU+cZ+6d
         QW/SXe9TxGtlfMK+qjF2L14A82qJUAHuvvRCbDUAAsD0HeF7kgs4D8ACpt5rrJG4X6lg
         lwIfYFdZsulBd+8IqCTXj8KynzxktW8XPJpJFNnVxP/S7oNHzhHoQmc3q8UR65fjiCKE
         BJ9g==
X-Forwarded-Encrypted: i=1; AJvYcCUJO/F8CLs1xJIjb3IbjT1tG8P/fDB5adYX3/69Jaa/2iPzexnv78Xd031lVtwFcjIFBl3j6+mxu9JAFVzQYkiG@lists.infradead.org
X-Gm-Message-State: AOJu0YzUv2yrdw6xZj4/WsLNTc6Yv6ObcQxg4XouVVJsIHsTEcO2L8nc
	vyqy6JqtVy+nDB4tpL7umbb77HadWyCItBNogpg8kUT2hN1OovD6UPx3Rq0f+oGlUAE=
X-Gm-Gg: ATEYQzzA9w7vcF5mKwpqQkHpw7mxbKFCRyFPaF9g98yX/2tI4wqtDFE9AcA24BeRAP4
	vibLoSiEeP9mSa34faITpgdf7xDN5MUK5Cl4w34ePgoa+7/zkjducUSySxs+I9V/afLB+ako439
	WhTL8Vtx4varhkKtMcXTl8rYn38XnCeZNPBFFWNXdEOEb5v4SVJ9epTfVCfoi+didXOZdoB7v5t
	OMlwT/PDpwEEMQfYEIlHCWK/HhdaSuFsYNLGDlLv4fO9cIav84O0X1KO5amcyREjh43bSD46G7X
	xl+1fiGb8/aDMvD/RUV2EyLXicOkIjUjjs3q0IqSUcxq3ttutAiXQajZXzWmvxNXq9vO3RTnUrD
	53gXElhM05wHMRcnDJwLez4U/hIyetqsc0+eqQ114ruzYuAQSXqjIT+KBCnO62TWh+eW3J3b5j4
	XzO0MwntsZt2ZsxfIc7g1F
X-Received: by 2002:a05:6a21:648a:b0:394:a026:4c45 with SMTP id adf61e73a8af0-398590af801mr378595637.48.1772757091559;
        Thu, 05 Mar 2026 16:31:31 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c738e39bb12sm3130654a12.32.2026.03.05.16.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 16:31:31 -0800 (PST)
From: Kevin Hilman <khilman@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>,
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Hans de Goede
 <hansg@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFT PATCH v3] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
In-Reply-To: <CAMRc=McYj-D8XL_wnmTEucMrwCy1-xr7h0XYrL68soMVHL1SRA@mail.gmail.com>
References: <20260212112508.73500-1-bartosz.golaszewski@oss.qualcomm.com>
 <2fb42d16-887a-4564-8e50-c9d6db564c4e@app.fastmail.com>
 <CAMRc=McYj-D8XL_wnmTEucMrwCy1-xr7h0XYrL68soMVHL1SRA@mail.gmail.com>
Date: Thu, 05 Mar 2026 16:31:30 -0800
Message-ID: <7h1phxpzml.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_163133_527163_33454229 
X-CRM114-Status: GOOD (  13.61  )
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

Bartosz Golaszewski <brgl@kernel.org> writes:

> On Thu, Feb 12, 2026 at 12:46=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> =
wrote:
>>
>> On Thu, Feb 12, 2026, at 12:25, Bartosz Golaszewski wrote:
>> > Currently the board file for Nokia 770 creates dummy software nodes not
>> > attached in any way to the actual GPIO controller devices and uses the
>> > fact that GPIOLIB matching swnode's name to the GPIO chip's label duri=
ng
>> > software node lookup. This behavior is wrong and we want to remove it.
>> > To that end, we need to first convert all existing users to creating
>> > actual fwnode links.
>> >
>> > Create real software nodes for GPIO controllers on OMAP16xx and
>> > reference them from the software nodes in the nokia board file.
>> >
>> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.c=
om>
>>
>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>
> Aaro, Janusz: Can you please pick it up for v7.1?

I can take this via the OMAP tree once I have confirmation from
Aaro/Janusz that they've tested.

Kevin

