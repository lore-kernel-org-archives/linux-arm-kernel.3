Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DAB1061B22
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 21:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFHVzUWvS3ADraojc1oAhG0Cf/0/o+VUJl7DBlABpGk=; b=3ewO0LGjvDTPmJbsMVSP5hjhjX
	l/eyuug2DBLAbVTPoOpQ9OuRLusBqjH+SyTjCOdWLgXyKbnq9GrB7ugktinM8o68mUqFfEbQYGV50
	DLZVObqtuuuC8grqVuDzbtfSXxjest8yYPF9TwnRfa8X9T2aWmjgqFhU9owlF57b/ZT7EJ7djdsU5
	CCen3+fwf2XJSWZFUjkSqH34daklfE+SmVYxfguRzIctMspBzISbqdC5VV9YetLq0y08Hzvqxp0rz
	0aQI+jEYAobjeCObjhXWr0SBDF2MM61d70HQqvhkKDN8NraH4EuNhCKpHFsp/59IJbWmL5WY3OTzX
	DK04hnUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7K2Y-0000000BuOQ-3VNh;
	Mon, 30 Mar 2026 21:20:54 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7K2V-0000000BuNm-2qim
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 21:20:53 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8297e0b27e5so2486519b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 14:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1774905650; x=1775510450; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=KFHVzUWvS3ADraojc1oAhG0Cf/0/o+VUJl7DBlABpGk=;
        b=0Zmjuek44l8fVI2HVOqJG3uzO2DUTNccGuy2W2wuZ9D5w/RKFvjIlR7n3E/xGCwZrp
         aFrIQiT/IIZsL9HI/l+8GparXNi6fJr49wA9dc0WdEICulcd8rzQcwkmp7rDsbvTMboB
         /Qf4qcjIskh1MReq4cCgKP5G2bvSF2248BKp4wSQpQ2TixD/jpnNWRklth56vMUql09R
         XHYC73DCrxNOOS881h5awOtM4ejyejoE6QC3znbY1bIb+JCBgEJ9ptY0Lyt0q+kDn2+x
         ejDeMhww0ink7ffuZAvGJuTKdMPWnftgaPJOV6c01PuEyiHn/AaBp3vfCGaFwLGm8Vd0
         Ulmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774905650; x=1775510450;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KFHVzUWvS3ADraojc1oAhG0Cf/0/o+VUJl7DBlABpGk=;
        b=VO6LqF4/AWxjGqegHfBJk4SDkz6mhuRmU9DENkm1NNTjg+KBYPnHjqGgaXf0bh+bvT
         kELbDjt/2C/MrW9IpWMQctWpgqK0K/VldO+Nenppx/rHl2CYf8b4M65soIkoB1ZPbiq9
         cdvhzNf9+ygqnxXlUAukA5j+cOJKf1rB9EPHwRjazrJZ3u6vNH8MAq2tqjiviKASyBVa
         CPIHfBmlSVtvr+0tIZskLw0moZhcFn3gRhetnqJ0VvTX1rhWx2ZEta9KgVydqhgsv8P3
         9BLj9DAVWGVSDZksL4aKBJmI9KZpduyQEAPHmxoWcyt8nUFIXgvjXA4lqRUyDpDrljAy
         ZNCw==
X-Forwarded-Encrypted: i=1; AJvYcCWME+qCMI7J0tLjVOnc6GQ9/WSrKMM0MYYHmCUAOHQfotIGTMbqJx5L2iLuu3LSt/3YKqLZjMuJWrp0wyervuK5@lists.infradead.org
X-Gm-Message-State: AOJu0YybPWIposmwgKxJE8WvDEQL1viMOqhGdudDhvcr6rp3QD6/H4y6
	RSroqzmsGDt2oMPDpPm1uT4B0CbothKJdaP+pImUx7n7rHSz0Un1e4C0pIYzSkB915w=
X-Gm-Gg: ATEYQzwGOClgI0oxpXkIihyveoSTf7ek8gyNAr6ZeGeZ6bNUqX72qWQ2eakP9rh8HHf
	26qvO0r3jRQjTcDRodZWLiQdubbDGlMH5ijr6uzmW3HLfs7bjvxuAzHd+8BqUSR46Yg5vruzm0g
	Y9WhgLxl3Em4FrYHv2R8axxO/aMgRcrhd/jvpeO32jCF+TUs/gfk01/XxGdTdyY4L+RYF3ELU0B
	Xcd+mPe3yCYrRLQxMooiv01o5x4w/LkBL+4FPW6MO3WX7u3X9NMOPgfm2M26GNQiyEP23Ml1uqj
	vKhNRdgW2tdgFv4KKcl+t7KsJABEDzXGloni8lyyM+ga1Nb3BwyavWSajC8WwiBN8zbFQYwWnvV
	rjGxmW/Cs9BljmtNhS0dm2P+70eK45KNd/ABSYC4umXEuc6KvF/3N8NxqKhFr9wEgw/psF9E16P
	U9nGHVkPx87vpdjLo2Ycc=
X-Received: by 2002:a05:6a00:23d2:b0:827:3093:901b with SMTP id d2e1a72fcca58-82c960961d8mr12314711b3a.43.1774905650561;
        Mon, 30 Mar 2026 14:20:50 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85d030asm9550520b3a.38.2026.03.30.14.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:20:50 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rosen Penev <rosenp@gmail.com>, linux-omap@vger.kernel.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "moderated list:ARM SUB-ARCHITECTURES"
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:KERNEL HARDENING (not covered
 by other areas):Keyword:b__counted_by(_le|_be)?b"
 <linux-hardening@vger.kernel.org>
Subject: Re: [PATCHv2] ARM: omap2: simplify allocation for omap_device
In-Reply-To: <20260327191104.206512-1-rosenp@gmail.com>
References: <20260327191104.206512-1-rosenp@gmail.com>
Date: Mon, 30 Mar 2026 14:20:49 -0700
Message-ID: <7hwlytui8e.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_142051_718995_F8D7C225 
X-CRM114-Status: UNSURE (   9.83  )
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

Rosen Penev <rosenp@gmail.com> writes:

> Use a flexible array member to combine allocations.
>
> Add __counted_by for extra runtime analysis.
>
> Remove goto paths as they are not really needed anymore.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Could you please add a bit more explanation about the *why* behind this
patch.  Your description tells us *what* you are doing, but is a bit
light on the *why*.

Thanks,

Kevin

