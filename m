Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A518D58D40
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 13:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=29eqaOcblHE7fnrH+/9B8++CMwboxE8T+PhkUkEFlJM=; b=JFMijflIFEBLdpiFGgARUEibR5
	sC0wgRq5A5uN4Y8k/sbuy5vA7mAUUUSscVjJXMfeu6dwQ7BxowDJs8LttyMzfFCjIqdAj3tgKtSzS
	FwjxNjNRaEArayWiuZXWPSW1Nquw4XuCzZ/bc8f2m/5MK2NfTfBBPZod/rRHj2p9KRSYqifwjI2d4
	ssGDT6+RkihxcDQASQA6M8GzUnvv15Hxvqvx9jBxtPN8axA++mo4k6H7s7KxwBW6av2GzCdTgEce9
	JSgoIlHoXzyR0J1RRzuMpv5eft4R6eTJ5oFJo7V2H5CmGXEpvPwQD+3QEpo2UPnEXtQfTQv5B2qN/
	0zgfbJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFYwZ-0000000869W-48Aa;
	Mon, 25 Nov 2024 13:15:59 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFYvc-0000000861T-0gtL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 13:15:01 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e333af0f528so3903934276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Nov 2024 05:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732540499; x=1733145299; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=29eqaOcblHE7fnrH+/9B8++CMwboxE8T+PhkUkEFlJM=;
        b=AdeNbP+I9RBsaqDXtBE2zceko6jHyawErufZqwp8FCAgDwezPoc763OS8f3eiA23GM
         OZDA4f7vdOfJhqD2ShWb5OTrB7iTZcd8mjY4PEP+7r676KOMYscH6n4qj8o8kn5hNHhY
         4i34U6BC0kv70ToeRscC95q5smRQtzgi0N0N2SqQbLYzxHGhOZ/DAO8KI5J/KpN0gqNd
         hacuyMcc+fPWGCoz4GSqaJcDDPCvHdewkdkTB4aqlpbqi0ofN9pO1WTs3uExnAcbJHkU
         YqRQpNp0H9ipuO4Z4z6v7XRaaPc5mfY3SkxuoxcUB3vF2QOTCfUBJflo+skIXa8Q5pK5
         ZsPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732540499; x=1733145299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29eqaOcblHE7fnrH+/9B8++CMwboxE8T+PhkUkEFlJM=;
        b=n/FmKoB8Pd0ATzsIUTyPg/g6yf/nM/eyPNSSoRnm8bVfPYUBIYjWUWwFfXXAp/Jw+9
         RhpNU8FcGjuc5fHhUoh/zRDwvOymA53WFBLqHYfB+0T2oI+Bwg2mpGYuPCohYHB1FhDY
         uAco5eN+UmC0YWVfHmLnqNetlYkQyiw6vA0JfBXOxulVbLiCqD7h4E/1T3QVGsyx0j9e
         BDMaf+AmWvqy1b5p2uuYuWYBVgFz/6t8eVJZEZL1IcF24wUF1AW9klWnvu3THD8i2Sw3
         Rxt9vpBLLIA2b06rF1SRBmBdxq+3tbXZzyNCvCmHFYErFmabehnuqpicU4HCMEcp3HTl
         hBHg==
X-Forwarded-Encrypted: i=1; AJvYcCXxBq0nKRf9EAidN5B9gC9/Qr9yJaRyWlHNEqKPCf0NOaPDqxio7H1emY0ZgD32VvbqXfjkVKnb3TSRvnCkRrx9@lists.infradead.org
X-Gm-Message-State: AOJu0YyeLql9Mit/JjZDZIxUfgO1BvVoqWRNLQda+3ZfLbY+Q7KMsjXM
	Iu1dUy5ndYhcIXom/1kItekvUysph0Dm1QyojmXpIoHFyjUwlfeeR9VNt9czKN1Tn3Xewg4rszM
	HOtJ7N/1mnzQI4zaHr0k+9tR9mx0tmA==
X-Gm-Gg: ASbGncuoQy/ptaOxJIZfPnZtDmhgfzCHLoVY7rhBjPpHA0aYuoIUxZ1pMmmnsGYGtcP
	cNSfMIOSo66H8uX7mY/9MLGLXKJDNuIiq
X-Google-Smtp-Source: AGHT+IGfaRNCO8ZfhjsTKNxOcvugz+C7g7ey2hBA5+ko6id9//Gtggy/7MbHGZufCHhEZf6fX8TjG/HrfvyCxyamoGU=
X-Received: by 2002:a05:6902:e0f:b0:e2b:d131:f293 with SMTP id
 3f1490d57ef6-e38f8c09892mr11476595276.51.1732540498735; Mon, 25 Nov 2024
 05:14:58 -0800 (PST)
MIME-Version: 1.0
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com> <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com>
 <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org> <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com>
 <c6b0273f-16f3-4469-a4b8-9564f7355400@linaro.org>
In-Reply-To: <c6b0273f-16f3-4469-a4b8-9564f7355400@linaro.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Mon, 25 Nov 2024 14:14:47 +0100
Message-ID: <CAMT+MTS3Nmy=RzsE4wUf=jHBsu8ghyyqpXWPyB8qoR+W3EUscw@mail.gmail.com>
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
To: neil.armstrong@linaro.org
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_051500_199821_CF007D26 
X-CRM114-Status: GOOD (  13.12  )
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

On Mon, 25 Nov 2024 at 13:57, <neil.armstrong@linaro.org> wrote:
>
> On 25/11/2024 12:24, Sasha Finkelstein wrote:
> > On Mon, 25 Nov 2024 at 09:50, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >>
> >> So this controller only supports a single mode ???????
> >>
> > Most likely. On all devices it is connected to a single built-in display.
> >
> > Ack on all other changes, will be fixed for v2.
>
> OK, so instead make the panel driver return this single mode
> and from the display driver just filter out anything that's
> not ADP_SCREEN_VSIZE & ADP_SCREEN_HSIZE.

Not sure i follow, you want the mode hardcoded in the panel driver
and the controller driver to fetch and return that?

