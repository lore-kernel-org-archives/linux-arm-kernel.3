Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84253C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 20:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrjCylDVvM1JzrFd8ihuKPjDtBMnkU0vBwOAngnuvGU=; b=bEuiFRcp0lE+6mukY0wXAufiBN
	o0PSx3uO9WEc5WUVNmE/6mLBpzJ1gHgVnXrB5Cgnq/MBjVa4kfROUcSK8qL6zb7BdWWMo+8dRNFpG
	JxHX+OGi3YwCwZBsiIkb/XBT6q3KgK/+ZlCljC7w/8B5NyBcQYhnYMVq0vbKR/mpm4nFRnnXQJEBv
	/tRo2aYfspboJ/UpzmiQXBzNwd1XrdEBxYk7odDmyfEBMIxpYqwhIiivprYkAHrBXE8LIinjA/ywz
	XiUfiZKvkWCqQ7Z/9RxToRVKAZKXHvm52aMjxCEOL3ZmPOklfqWvPn9iFvA3Cg56sM/isAvDsfGL0
	sVtZBiBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkU5E-00000009jdW-1Bcd;
	Tue, 18 Feb 2025 20:20:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTXm-00000009dRd-0Iiz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 19:46:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43995b907cfso6893915e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 11:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739907968; x=1740512768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrjCylDVvM1JzrFd8ihuKPjDtBMnkU0vBwOAngnuvGU=;
        b=JBR6iNiUrsUdC4b7DHrQiaRDo9kg6ioGgQgWysBY9PbFgjwZAq9s9PrMD1vE1UEhD9
         1dTTeri/LT9bn2BYc037/MR+VklhXgNBQRnVDulJq6APKy7LarUUmb9WlCJ5gRN9EhbA
         M8WLVcStfV/aKoaEX1odjpn2fmIcG0SCWS2sHUgJb5slr0qiiH851vduXKkTG+EFfUWH
         q2FrAj75veSRn5nYNZhUhysi2IgXct0DE0WgiPM1tgnOQ6qoFwOb7ZW6TTB8SrqBsTan
         cZ6S7LhK5Yz5/3jR0/Req9kugw7gO7DafLqpjEXOKsgbW+CflgBNglMsyjBvhVT1RN6b
         WF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739907968; x=1740512768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yrjCylDVvM1JzrFd8ihuKPjDtBMnkU0vBwOAngnuvGU=;
        b=eo/56FCyMtkppTa/dICNnPMai2JeG1GzDD30b5+kjS7T9t7egj3d6TZ7wY8GMXqx2L
         V4sG5zswGkmfr6VQgQ54N73dl0/eWtSg5j2PTSjphv5m+ApIRDLWTic8CQdtkqk6wBSu
         OlAVwV/bI5gUUrnMNfJNcOAkxkUrmZiK/JlII1ekWeOKTEcsYQuxLsUMOGFKk2uczK5e
         IkH0MWM+tQPxntZfQPzwd3glDqiQ5VWTJT+WcLKqcSBqJa4ICfaqGBqPH0WfuhcMLOHi
         msH9saaNcxzJZVqEB1wBSnj0Xy3T0JXxPARF4sQMzymw3zGCIPkgJr7tfaBT7E4piXYs
         vcpg==
X-Forwarded-Encrypted: i=1; AJvYcCVZUvkUM52j0CkAurN0lUR0WOrvEt9GvhHbboDK/sjgN6WImpPPFoYbjvrJbEtmgkAOSxmePK05KjLByl4J7Oqy@lists.infradead.org
X-Gm-Message-State: AOJu0YxhunAgQgv7IMiwm16HJua6J7zZiAFRuVYZsn1qDPCjdOs2Voxu
	80bog0mnN1LAVcCBRP7uVEPcQkEjPKU74AaoC+u0sTAzq6/yFKDU
X-Gm-Gg: ASbGnctxT3EImgaLEuzHG+pbQcdmE9DyoD8tS53b9U6MUzpQ1OPqiSkCDQHmFCs7QLc
	LFfoOdFJCfvMybSpsEn9EqTDcejkb6D0Cx7WmVyRdx5ZX3WgqY3lomop4oDr8mWR6DA0vD0wlkS
	iWUJE9EoUGWSFsCeCdDH06YhAljpMpuYm5jAvKWdyY/KqZ4vw0SR/yC8L+niLwvwyJLyrGUc5sa
	e2n1aZp23U/qKqjpyM8MtXIWrN/Pnz3qIVjliprH1jyaK0gALkqU1WfL0U4svZU3JWpEWxV/F78
	QUSloK3UeOvRzINjRYaJ7zofi9b2yy2yiiU3GTQned5MrrPUkjwMKtvxzOVj2i2gP0g=
X-Google-Smtp-Source: AGHT+IFA6p9n50aVJnqGFUk/7jRV35aPeAFF0EkhsdD9wheQ/uYJENSRNYwnKizaauIZeKc29AB6rw==
X-Received: by 2002:a05:600c:1c84:b0:439:8c80:6af2 with SMTP id 5b1f17b1804b1-4398c806da5mr61455325e9.21.1739907966616;
        Tue, 18 Feb 2025 11:46:06 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43984924201sm68753485e9.6.2025.02.18.11.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 11:46:06 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/15] clk: sunxi-ng: a523: add USB mod clocks
Date: Tue, 18 Feb 2025 20:46:05 +0100
Message-ID: <2220848.Mh6RI2rZIc@jernej-laptop>
In-Reply-To: <20250214125359.5204-11-andre.przywara@arm.com>
References: <20250214125359.5204-1-andre.przywara@arm.com>
 <20250214125359.5204-11-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_114610_106780_666DE014 
X-CRM114-Status: UNSURE (   8.46  )
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

Dne petek, 14. februar 2025 ob 13:53:54 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> Add the clocks driving the USB subsystem: this just covers the two
> clocks creating the 12 MHz rate for the OHCI (USB 1.x) device. The rest
> of the USB clocks are either gate clocks (added later) or created
> internal to the USB IP.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



