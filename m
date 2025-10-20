Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A34DCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 15:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WDTK735AtuvvXpuAH2jZcOxzUM5aYc0QEvIl8NwZbRs=; b=WgKlHh/BeIvaX//4ARdU4ClrsN
	6lF4Rd4L6z6YbzQn3tygt4y3P+5KPWNaqHl5m96RNtXwOfWFO/0n7UGvMcQBPns2JklAxSFyS2HIY
	olwUB6o8WJ8kSCncG0+SybqIFb6KqXDLk9fSMEVAs7iKHCcVnfSPYfFfvzzvAV7pLmQAamwdKj7nj
	fcZrCCM0B0gUCK9973GGskMAvndDJV/yKe49DOP6Rb5msEbFr5O2VINptorSG/po56n7pxJQg0eDm
	dYz9lwVqZzonUxyoSs3vT+YS9bF77fCUjg0l0leYNs/SE79TcXd91oKd41/MNY4OefA47mbhu4Dqv
	alfMdDUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArdA-0000000E5dz-0AO4;
	Mon, 20 Oct 2025 15:17:04 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vArd7-0000000E5d8-0isj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 15:17:02 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso4692477f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 08:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760973419; x=1761578219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDTK735AtuvvXpuAH2jZcOxzUM5aYc0QEvIl8NwZbRs=;
        b=i61BQ+xB2u/PxiwBIQkU92KKdngdL/lVGesc2L4WPgXLX+j17L1qbzuyRqvc5eMSSg
         8TCzOhIgyIJ6dCPNd2PAyhB0g+2AXTvDjJ0iLac4esoHXvoTFsHTALT1gI429FdzqLJ4
         xnj7buiRg9VWJQbqJiJQuXaDFcyZZTrs3pRl591jkGxK+cnqn262uncxZ8g2wCnxQFPw
         aNcax+djBpbfdzc13Zb4iPYUnlbrKQ+x7/G2owGqJa99ADOQYG3FEUl7mKoGCh053IeI
         6v7whWxC0LtdiCkc+jJ24nyRvlIdwRSnDHf9J9WbXDq7vfAy12FytIGQpfO00rUQVJ3q
         2WXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760973419; x=1761578219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WDTK735AtuvvXpuAH2jZcOxzUM5aYc0QEvIl8NwZbRs=;
        b=cWdwBITBZIMAUYoxWd7hjvpflEuJscMfwlwnpI44XxWms0xBIrfRdXB5/9SUxb7/Um
         c4dLRp8payr6FZq8xXkZgCOZrDUOKyBhoWOQoEQzqEFNSgUUq/IGPQ7S0OVqmTRV0Gen
         Snjwi45cEfv8meg8Z+1mweX3za6lMLVP2jKxmq9ReoUxQ2UAnsbKyXEhmM8xdm3NtECo
         +Ismx/JozOmRhRQpcKIjnwUur+Y3PVt68oWr4+pQ3G0U7N4PYmGF7+JRmJ68bhELTBGA
         uqZRpJYTvymvYaaE72jzOXoWV8xBDCCpqEUVwwQMqkxgCwtsFsdvWkGtECOBEBe6bBd9
         I/1Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0EZ6Gwdb4mPUKldrGpmFlLMMhFMcOQ5CK7Tj32eq1rP0yy9ack2duqkHaoUNj5Ma+fp/qRMOJXuKgGyLwRYnA@lists.infradead.org
X-Gm-Message-State: AOJu0YyCgHsDMIUTC5RhG/5NSZpK7jm+LrXdx/fIWKi9CY4g0YdEohke
	CqwMJuzt+Am/nfVWO5sWtYWr89HMCRRTDDLjf+R8ZOl2Cxbh7PD+QsTF
X-Gm-Gg: ASbGncuFPGfc/E5JQz+y5wm8bdXCcdiI4s/H49jiyvKcKQj4syBtfzrQq2XflCrjw5u
	OCqXHMZuZOif7B5IDJqpjLCqg+oP/f635gg3fppiwy3XPo6VIBAY6Mur9otbUi53gRlkp4+y6oy
	o8HCS5P+8NChdY97Lfkl92Ad5LjLDC20AAbKm4MFNGFWuqzfU3Cd7Ul0gXx6nvD0UiNU1iBNIoA
	+MU7UcULDMI2xBFALxi7taMQWlbaVd5etNpsn3EeeOmUR2VWlmfX5TfRs90nztzURSxMJ6PdQJf
	Vm3Ehw6PxauUUy0e7v9DmuraM2xAC/UmpceaWexiPhsNOvldiNu2uCh26Frldfvn6aQYKIFPyDN
	9F+E4gZZVRcmQUVrHvGkxF7Bh6G2QxjUzmv9sUDiuCvMBGGUtkCj9ECCNGnvl6+Zqy5/92Z2ouB
	MsG+AUWUvPuQd4UW34O/QETMmOZn2olicGVQIDZFrK/jHgS7R2ZiBIEIssTlrroMlPBRwCGtmkX
	kqMEw==
X-Google-Smtp-Source: AGHT+IHuatsA0TU0EmQKM+VXdnR7vrkcGarcXxG+sRi8D6g2SyDjbiauw6mlCHoTUL7foxjJl83n3g==
X-Received: by 2002:a05:6000:400a:b0:405:ed47:b22b with SMTP id ffacd0b85a97d-42704d8352cmr9048390f8f.10.1760973419140;
        Mon, 20 Oct 2025 08:16:59 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce56csm15655444f8f.50.2025.10.20.08.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 08:16:58 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH resend] MAINTAINERS: Update Chen-Yu's email address
Date: Mon, 20 Oct 2025 17:16:57 +0200
Message-ID: <2801089.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20251020045603.2573544-1-wens@kernel.org>
References: <20251020045603.2573544-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_081701_213538_40AE46EE 
X-CRM114-Status: UNSURE (   6.99  )
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

Dne ponedeljek, 20. oktober 2025 ob 06:56:02 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The email forwarder I'm using has run into severe problems with Gmail
> lately. Switch over to my kernel.org address for kernel development.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



