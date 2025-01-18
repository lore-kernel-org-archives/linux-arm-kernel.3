Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D46DC02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 13:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hiOnSt4CDEnLfEOKd8TSh41PVsAYlATlP6ZPgyV9lH0=; b=0MZkcw/G7LFdMmds2H5Esp/PMK
	XwCT4ys2HzqFhhA8VVhNMINtX++ihzkRLXmOgaTfOzOGTScuWJzn/81xtIPW9AAeT4AY9S1bAx/So
	84L7THz8fioBvMEhZWS3URQb0zv/oIXfARW3bIVqg5ZD63UwejfMqjhUulj4d24z2KwVyWT7N2wc7
	MtQqcYzzAzmi43iySvvBLlwUhy9l0/QNTGSXP3uH+E2dmNCpjDtmR5gZ8c2sCM06lt6oNP9jaRT2K
	rJr7OrGhkXot/mzLY4+xetMRnIpGrOILHbTUF55fSCbe2hPw++dhiR/ACvwPcNoF4SLMl7QiNHVxZ
	UrFGeksg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8jS-00000002Sda-28dp;
	Sat, 18 Jan 2025 13:19:22 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ8hr-00000002SWj-2xfO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 13:17:44 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso2685644a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jan 2025 05:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737206262; x=1737811062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hiOnSt4CDEnLfEOKd8TSh41PVsAYlATlP6ZPgyV9lH0=;
        b=C59iHoMO+BhSRoW94D/d7DPF+aRaBq7My00ItR3AcweiABxAXg0wpLKHK0klR/qrYK
         HohlSVcImXwBk6WezQbFe5I54KhG0CAPjrwNBKOXVc+utiBbJSXtdQB9uY+MAOI9YO5t
         35dzPmt6HGBJScLltFZoorXlWRKZpphU0R1fgSV5bnkQj+Ns6h5XfEmVrI7DT+c0gvAu
         l/QDRaoAnkYQscqn/VBccw1hwE/SGyFPR9bLaKnzbLCt9WOendo3g8INEAgUVlW7ackr
         QrreVFcJSdIme4of09T7FI1bHvFy8kR5xClmtmlOK4BWErnNiPOjuYCpq2lF281UnTzE
         /l7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737206262; x=1737811062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hiOnSt4CDEnLfEOKd8TSh41PVsAYlATlP6ZPgyV9lH0=;
        b=AI1Q6HcGZDZ4E6hLYElSYrIzNv88gK/487o+fhrlOt3u+HaFo0QTySqL77Ub6ltdYK
         1IzNU7V8TH1N7PFCvE9t5EdhwMwZFZI+E4qzN86r3XAEqH7lDV44Be0ddJYWs1hzhmVq
         m0J0YxMKzI/hYIIf5D4uKOwGoQ+AkR1XC6FKCU62aa8pOfoko1k9XrVQwDLb6+BccXXd
         kgASJCpNiPRTBR7Hujz+F+ckr+Q/btzgEsdkjv50OSI/EfzypjHw/9ipPeJsasGJZVUz
         /VHFwtYHM9h1ovQcWHtqOtsA/9XBwJMNDs91qQcvALmScCAhNvOq/tv98jQs+W2KtSAG
         ibng==
X-Forwarded-Encrypted: i=1; AJvYcCXUZWIi87CJVfyxh9+Schd4WDpvYhFqWIcPmewcWjRUJYcGZdaQPC4R56FXSijOxG/Rwu6wVQ/yg1+Y554heuoo@lists.infradead.org
X-Gm-Message-State: AOJu0YxVuejIfW1ldDIKrIfY9fbiTZD2KvtKoqbzCJP1qebSq5RZcaql
	p3PEKbNl3hDioexZFdh6yI7XkIjzTwdwdHaZc1O3c7xqvm5K5kqs9TV0K/DO
X-Gm-Gg: ASbGncucRpjFp0JsPaz4yKRU64uyOP/YmTp0eg/6WcRDd+N1FkrY3YwZpoL+4PwaGfu
	j2l+Vm/AceXbHdup7eyAY26fr+CT2EIlJRAkXMX73T1WxKlFa9KnXzjeHNR33+X8rGbIxcGkYKN
	fd17yqG7EoPPb0qfaJCJRjGmY4VicfMWtP/O4QB+4OZeTpeeF1k0iLAaJIBJuh9MG0JdDc0dT5K
	tFQjS4AEZ3euWRKJfAtVSEyFd2RJPJmcIwaQYVuo+1AlSCP+zwh3oxm8PISRLrKvYOj68AglBEH
	P3Hh9oRJUj5Ni8pQ7yvhm3tUsg==
X-Google-Smtp-Source: AGHT+IFFti1/tZj8e1vP90qTGFiWr/GV7Ik5rVsNImRR/WGzUU5tZlbjRu4Ye6eJGZXqi2al2PUGGg==
X-Received: by 2002:a05:6402:27c9:b0:5d9:3118:d0b8 with SMTP id 4fb4d7f45d1cf-5db7dc6b573mr5022930a12.8.1737206261687;
        Sat, 18 Jan 2025 05:17:41 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73683d28sm3167269a12.40.2025.01.18.05.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 05:17:41 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/14] dt-bindings: irq: sun7i-nmi: document the Allwinner A523
 NMI controller
Date: Sat, 18 Jan 2025 14:17:39 +0100
Message-ID: <2763297.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20241111013033.22793-7-andre.przywara@arm.com>
References: <20241111013033.22793-1-andre.przywara@arm.com>
 <20241111013033.22793-7-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_051743_743476_B0D17F2B 
X-CRM114-Status: UNSURE (   8.05  )
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

Dne ponedeljek, 11. november 2024 ob 02:30:25 Srednjeevropski standardni =
=C4=8Das je Andre Przywara napisal(a):
> The Allwinner A523 SoC contains an NMI controller compatible to one used
> in the recent Allwinner SoCs.
>=20
> Add the A523 specific name to the list of allowed compatible strings.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej




