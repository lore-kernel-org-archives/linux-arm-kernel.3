Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5541ACCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 20:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0cBBzExnjk2NDYJtxl4UIBoOwn7f/ao+YK29yiad3aY=; b=umZZdbpHul/HX/jPJcGU++xa6R
	PEsY8XLNj+C7BpK11zxHRVAqHdi6/T2I70Vpf3bWexj+h2m51rnFQQioqVyiT+X46IC/98witeAk0
	KWN7zHmtKrfvN885BHBDHFFaX40zWDtOBu3H3Cx3GLQ8nFZaSOEmZ9BSYsVxzNCIcZ+vhAJG6nBFp
	9APE/dLy/PaQxLiRYz6OsA0K4eAcGgpvAj/OYk+vayF2gx2Qps09JygcqQ9CrjZC2ulPYKMk6hkxK
	fazdxxRmQMh9TbXBVEBZ6udaXfPEF5wXPjyFxFoALo+zdkTKAykcKbzvaZVH5HTwRxTCyCo93Oxf1
	0ztkvEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZR1-00000004qxC-19Os;
	Thu, 30 Oct 2025 20:39:51 +0000
Received: from mail-pf1-f173.google.com ([209.85.210.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZQy-00000004qwp-2iuS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 20:39:50 +0000
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7a59ec9bef4so2030239b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 13:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761856787; x=1762461587;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0cBBzExnjk2NDYJtxl4UIBoOwn7f/ao+YK29yiad3aY=;
        b=DumSU3Fhkll+s13RW5M1BldEfOcQsCl+XRxUgE378cD7mloNjSN47OLpORKVxAb3mt
         SBhp5FakOydsSaiQts/oBJeddjY4Hj54uRJ5RE9L9hnRD8XjZz4oA6DHgeYG4psEIgyY
         JdjWfn31j01ly5RNDX1dZlobpZDvA7TwpKozrYpIbMfOBAKTwbr0CNhbQHWjJ3r0tyO9
         0/THkEsCtKhKVeOuhcY1huAJyABmd6JOaivoP9rHKvToETd9tqdRaRk5cdoroFB+BYib
         GjkQWBpH9N6H6WBhX7JW6BChlOIWs/oH5DzCj1bUKg/RLVScI7KwTNbpQ8+0NhI6h2kq
         n8Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXoyZBiOv1lZJsBc3HfAfZUkVXGUzmzDbEQKsNox0IvUYN6w0TfLRHJCDnMpuRv56DxWIIDMw4mWrWlYwGQSk0v@lists.infradead.org
X-Gm-Message-State: AOJu0Ywqg61samYogMB5sTVrQyIlMzJh3cakZYlyogkFdrieH1TYJ/T1
	1C91VJQt2N+ymBTS9ydv6UWaR7D9VHb7wZJHezSViNRlfjZvS+sLiiQ9VYqyXYLqeuQ=
X-Gm-Gg: ASbGncstDnrWOdMl6uLuozG6HT9a+C9JhG7/Jj2Oc0Tp7reSRHywLsolxtDlzyPiy+D
	kkGQD5jnSV8gw4heQid5q/XgQQ5E2lrXzMf03HJISqJesiTqlq47wfifkadUibiXzUj/qIj/K6L
	rHbXYhapdwjQS9o+cDpBObYuDi+QatYuOao0Ph1dVOCVOhwYM5YIPBGTF/mPkb0L5L2tI3iwEQN
	Ijt/OD+PNwQpbo8nU3zYym3UJV2A3tkHHIbvbeH04MmVB18KxI4cT0XBruzR8VIRWGMS+MDNXuw
	Tn6iOCOLkQKlv9t+uZhS6ElCAwGQR3ysKxnpum4+/ZDfMrPpmmCodhGY8xIpRIqTladkIPrI7nl
	MGRH4YBQCrKpCYRBCXb/SBLG6DVNOdZ6iDjr6XmaYeApA8/0ZyvpNnRwjaMEWsygOS+kLb/ekpA
	==
X-Google-Smtp-Source: AGHT+IHNUhWGQ9QtbTuE49gdeDk8GHmdw85Ojnz2Oym2D5PVu1wHgl1Z6t3McBnk2N0znORSiSVtlA==
X-Received: by 2002:a05:6a20:1583:b0:2df:8271:f08d with SMTP id adf61e73a8af0-348ca24f710mr1429132637.2.1761856787576;
        Thu, 30 Oct 2025 13:39:47 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414012d02sm20249056b3a.4.2025.10.30.13.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 13:39:47 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>, Nishanth Menon
 <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar
 <ssantosh@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, Richard Genoud
 <richard.genoud@bootlin.com>, Udit Kumar <u-kumar1@ti.com>, Prasanth
 Mantena <p-mantena@ti.com>, Abhash Kumar <a-kumar2@ti.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Thomas Richard (TI.com)" <thomas.richard@bootlin.com>
Subject: Re: [PATCH] firmware: ti_sci: set IO Isolation only if the firmware
 is capable
In-Reply-To: <20251014-ti-sci-io-isolation-v1-1-67c7ce5d1b63@bootlin.com>
References: <20251014-ti-sci-io-isolation-v1-1-67c7ce5d1b63@bootlin.com>
Date: Thu, 30 Oct 2025 13:39:46 -0700
Message-ID: <7hsef0jf8t.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_133948_687888_1F642766 
X-CRM114-Status: UNSURE (   6.97  )
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

"Thomas Richard (TI.com)" <thomas.richard@bootlin.com> writes:

> Add the IO_ISOLATION firmware capability, and set IO Isolation during
> suspend only if the firmware is capable.
>
> Fixes: ec24643bdd62 ("firmware: ti_sci: Add system suspend and resume call")
> Signed-off-by: Thomas Richard (TI.com) <thomas.richard@bootlin.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>


