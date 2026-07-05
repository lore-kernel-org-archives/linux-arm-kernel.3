Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C0CDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 18:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9Eduw3F2r8prTlRcBvKLTOC0P9f8Jgk7j2YnKSkr7s=; b=nWD16QI25qvfeGCX+BX67USKf/
	lV1DIUFphKvczWAi38w0bihMWlwa/KhWotxnD1hX+DWuI6ewiVACn+Ewh62AM5r99pGLyc0e3SNpv
	TiJe25lk15V93FMDWAODqnblRK7caMzO+xViIk9fBg55ogGDEw9E1/IkBl9AZCH19mMI/I6Md/9eT
	XBcrw/dwDvXVp96oRLXfdaIBazFU1DETKg8L1mopf34rsNyqew4fxxR7QqdGehSc28QX54eWc0kWo
	xo7do2TgPinZDK+wy/7fo1NBHOOA/oguia3x7SeDP+Kp18cL261gSxm8jFJrDpi2aELJ0t1fRnPFv
	BcVPWVwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQtg-00000009X7V-0hCp;
	Sun, 05 Jul 2026 17:44:52 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgQtd-00000009X77-0nyT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 17:44:50 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-6a15ca0d761so1512866eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 10:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783273488; x=1783878288; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9Eduw3F2r8prTlRcBvKLTOC0P9f8Jgk7j2YnKSkr7s=;
        b=CYF5TiEM/s5eNbhfExjsvixxoqQKfizZz8KmeIsg/4ps5IUo2QEIfDpb2bAN1oP3XR
         kT5IM4QeWjoCrSInoTcHxWPhl9aw/1Om2Dd8hEwwlHmnZ5oAiev5rSnYI76mua6VZHzp
         XQ4Jbla4iEqBhQN7G66gyyk0BQLCtIjw/8Zc9S+GgCGJ98zU7oCeKAvWn+vLeLFAzgRN
         0VgKn4Sxu1a+AvloKcZeLaBsvRCWFcCnKm2YXm88xjmWN2R5nOe3PCS7HEDUvMcXWaIW
         OQdHC8F2gy8eyKe0XQAximyY+n1kh0+g0r7y68hUE7ywUtBvj4QBE7mi/guMTAJcRk0P
         OyNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783273488; x=1783878288;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y9Eduw3F2r8prTlRcBvKLTOC0P9f8Jgk7j2YnKSkr7s=;
        b=kt+piiZbMIuWqpnIGBZsUz9CqbWGoZADOAmrweSbtM/xSpmks9FGBoPdnIhl+qSquJ
         y4bPO/1AlRP8/8URXLp0lb3s61GNbsNtd4j3U5WSgB/gelVN6aKrww2ZIMsapvI/6a8n
         ZyongCQDKfL3rr4AVgAa9IkVHpY6MubODTOH7Be7INe2Ueu+qGdAPIauTopm8s+oWJ7i
         Ou+pqHDhoEqofvTpE9B2uSVYkwM6ljRbJvyGGJoAs/bSfwSRuQx4eJT3vWTLMyAzxVCw
         dPiIjXcTSqeOfzqnr1wCMfeocP5EI2DKw5p1JfMXTXXqgTppP0jtH1nLwrfrzUxBoyTp
         wKlA==
X-Forwarded-Encrypted: i=1; AFNElJ+fM34/OEKc3BALK6PQytsEHMlRxYCQ7FYy/m0c0Bfs1RKkXMzuvxS6LedxVBXPZSoF/7zlcs9AJu+wRz56BKY4@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe1XGGOcP3c9NJfPz8Tj59xALZv0VkbcSRFqpx2nFEPcVu2Nc1
	XfrV/L/wrK7dnPVTymxVB7YWVlGwSfvWiKYsYvYg7e2V2i5EMIrMHCBU
X-Gm-Gg: AfdE7clPAF7BU9jwAMe5VH4zFeaaDAs6xHpJBfXL6waZmdR05aoka3nKxW8QCsRSFt8
	JAuifMRywRrnCkjnNI0nC/nNYa3z611pvftNbe2N+Tedd4uHNm4V03IbJsKDbCe8s0y+eFxUAFd
	xXOleb+TPHmNdttUml7sLvkIjLANuS9kwBj71IRO6quhClrzQEvECn6SAMqZMNnTUKJYLjcxhaw
	w8noI8eAfduWFycOMkuvBQK+ZgD9/pNOUWSR6Blw2E/oArLg6Ai0DAwQS+cQvpIfoc3/FOCpYSL
	DlkRUsmTUERowKez41FwJTHmrPvLOWWNB5HfR6zmsOuGWDUThfYXUAv+zPNS+EkBBiZ1a0QXF5i
	b1HZL75wosA52btzp25i738OhaHI8I+gejs6bJhSqmD/D1i+TZ6hZR/cgwsn/DXR/TYco1eY3UG
	mFYaNLNiIjuHBUxv7dZgNNEaXHuOmwDqNpkVDmo/k=
X-Received: by 2002:a05:6820:16a7:b0:6a1:99fd:5a00 with SMTP id 006d021491bc7-6a32f4dd926mr4682006eaf.27.1783273488142;
        Sun, 05 Jul 2026 10:44:48 -0700 (PDT)
Received: from localhost (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb1bb17fsm7877267fac.5.2026.07.05.10.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 10:44:47 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 05 Jul 2026 12:44:46 -0500
Message-Id: <DJQTOY88KR1E.1U2393N7KUH12@gmail.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Michal Simek"
 <michal.simek@amd.com>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: iio: adc: convert Xilinx XADC bindings to
 YAML
From: "Maxwell Doose" <m32285159@gmail.com>
To: "Mikhail Lukianchikov" <avermoal@gmail.com>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <d7607a98-f5e1-417f-ad64-d0029c9de662@kernel.org>
 <20260705165620.9818-1-avermoal@gmail.com>
In-Reply-To: <20260705165620.9818-1-avermoal@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_104449_241840_6A1AA372 
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

On Sun Jul 5, 2026 at 11:56 AM CDT
Mikhail Lukianchikov <avermoal@gmail.com> wrote:

>>> Convert the Xilinx XADC binding documentation from .txt to YAML format.
>>> This conversion is part of the ongoing effort to migrate all DT binding=
s
>>> to a machine-verifiable schema.
>>
>>Sorry, but what effort exactly? Where is this effort documented? Do you
>>have a mentor if this is some sort of mentorship effort?
>>
>>And if this is ongoing effort then don't duplicate:
>>https://lore.kernel.org/all/?q=3Ddfn%3Axilinx-xadc.txt
>
> Hello Krzyszof,
>
> Thank you for feedback.
>
> I'm the newbie at Linux kernel developers community,
> and sorry for my mistakes in sending commits.
>

No worries, we've all done it at some point. If you're looking for stuff
to do then the todo in drivers/iio/ was just recently updated. There are
still a handful of drivers also in iio that still need conversions to
guard()().

>
> I'll answer your questions.
> I am not part of any official mentorship program,
> I just decided to try to contribute to the development of the Linux kerne=
l.
> Yes, it's a ongoing effort, and to be honest, this effort is the general
> community initiative to convert all DT bindings from .txt to .yaml. I did=
n't know that work
> on this file was already underway.
>
> Tell me, should I continue working in this case?
>

After looking at the link Krzysztof sent you it looks like it's already
being done, so I'd recommend dropping this one.

--=20
best regards,
max

