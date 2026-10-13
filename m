Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD8CCC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 06:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UsELNCTtBVT15YmxhvPJaLTSocnKF/U4Li7maIpCt4=; b=hT5En9xKqatkC30ED+9kQwYr6X
	n8Uryme+JwSo+yjVK9uyi6fGdhBWdlBp+6KjTq45aGSBfJ2yoq8lN4zRZct7G45vA304oHaAhKu1E
	b3imJt24W9yFyUAeTkdGB0shapzwyCK/jB2M4NBxxCGpp7z3EdAMxygKGIR7a5Ksw+wn97bu/peai
	trqQly2blgsmcEdoi8fMQGQZDQJF74xKpxvHJ6bHYD2+8BvspGh8JXLA5ZsrEzdyLO7wAfLSa9Y6D
	y/LHAXi3udpokOFCuLQGQWuXvxOZtG0jY4DwKHvnWS5Pa9g2VJod+vzAcHnjTDE0Kj+3qSAeJV0VC
	9QZH9lCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVrL-0000000C7tW-3ZEZ;
	Tue, 13 Oct 2026 06:19:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVrK-0000000C7tA-3laR
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 06:19:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6UsELNCTtBVT15YmxhvPJaLTSocnKF/U4Li7maIpCt4=; b=erGugzxFMKTd2YpSG79nRlkJO1
	dPpGee6vp/8tjvDMK6nD8KRK7JrXJ9L4zzGmZGaOSjQGDR8l0LvBpDeyi86Tkq/+Bw8lsK227NAJL
	wPE9AMhwhs/4M46Gc0R7rIjnziJYRrQSR/sIp49sSiNbrRgbZVkVbo10BAo4l13QkxHaNe1c4BrAY
	1edbv1LxwL5MXj6wCauF7D4xTObVB+u7NSFIOSQq+iBASDgvMVUJLWyv+dOyc5w/PFtpxXzeKpe2b
	yDrG2OybLppQ6SjDsRiZMFStWMQkkV4wtIdjyBviRlDXrQqV9dRR/kUlZpUob2nUJN+5hYsLlI49K
	RvM4BQkg==;
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGVrH-0000000F9Z3-0ReD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 06:19:33 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-3a1981228f8so17094161fa.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 23:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791872368; x=1792477168; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UsELNCTtBVT15YmxhvPJaLTSocnKF/U4Li7maIpCt4=;
        b=QDiRskT0viO6+eTDNrzFA1Vq0RFHH+pNdlwzcla4n9Mg1hMta6S2UjkArsvA/E7k6Q
         NpvSw5DLdy1VwzW+vaZF5q7F7YjLxnMXMmltEh+oZc1tBxyf2yOoLzl2J0H5ZRmYzJWr
         OzCZLeUviD6iPJiK5NomjniQmjiI5yotp8YxsH6LhPj0+2GghUJIGO6TTDVWubIdPrFq
         RRHnQBdpoyrXwqbmPyh6EQto4117AJRkapYiyJ1ZbokgnfvlrNrq9Bcg98tUQewqgtBy
         jkWoviphNu6mdS40BGe+QtRgV6wtSCBTIQ0eBsl2FVw/aWuHRwJkmxdTXp189R5ZPqqE
         UY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791872368; x=1792477168;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UsELNCTtBVT15YmxhvPJaLTSocnKF/U4Li7maIpCt4=;
        b=DklznvWb+Bzxh3XU6xJWiJCymqInSIeZSmaQjyvCZve5NnRDpwzuHaHg685+N8Cpew
         sBR7jvCwrIMFZdnvQDQcC8UO7IynHc9q7AlFhIrLbpXSg9aCzenZE1UedPKpJWE7BoFI
         ncmIyOPCAlIPSH7HKptDgn9bqbeF/qTkhzP4F45bK7Y1nJArTtAmzlrx2aklpXe1uCuT
         tL/ZK161aNs3+Rx5wKnotpdjjM1Yl7SExraeU8PrCmONJ/QN5bapbda32YDUQnUzTBWm
         96LEgX84wP7ZH0mvkJXIAXdyFgeCd1v9VGUuRzAEht6dhhEyzBBDuN93i0YRCnzGyHJ/
         5Dbw==
X-Forwarded-Encrypted: i=1; AKwUvBznKf0G+1NcqkMwEMEiisVtOJY/7Q04Z45tXY2e0TTzDMa7LRtg2YZDJwH1mVXEJF2IM0eKLD+OAZDAhhE3FgFw@lists.infradead.org
X-Gm-Message-State: AFq9FYKWLeZz27xa0MZzhq/YZKfqRML5LELiy1CsTf2I3XPvtRivqSnk
	Hf+NsgETirjqNTzs5eA2mlFd912VYIeLfrSkbKFwho73ZJwwLUOLng+b
X-Gm-Gg: AYBFou1o7Ym+udJ+pgJRt2sqk5zM7sXpQivkl+NhF0dbXneHgkAif4g5BrAe01+9tHz
	2w0BiBp7dI83VLuwmxCX5Y+KxHO99w9EThdVBYqG2RFMmR5NNMm/iah2Oo4JBVF+J4PJKVTjsw+
	WOE9EhEUfy7gZR1aAsMDM2uGEhtwgC5S8d0i2xASYZBykmg5ZqZYy9MZ1B4SjHYgg6Vj4uOQcPV
	38o7hnOr3sTxgLojTxnfykfowpaznNWbNbRh9nlYKDFMCS2Kp3hDDdplAR1eGD6v9CMU8l3ohf6
	O4y7ZmCVudbVAkC0I1sK8GbyrmPnn9/xc9iFwWSkEUF15XuWuO7UVqlJ1kYHeb8JLC5T0Xw+Y2M
	5FB/xR7CIvJ8y57oaZSxKMZ1aKjDX+NJIxQ5qQsKxawIw2BewspwVVjnJ9Iq9h0utFOcuc/fufV
	VsGKTzcxbzhb1pBhzUf5wnT9MAZfuKNdVdDy9lMsti27fxGDNpT5mpaKLd7MuOMBNQ6k49nDWnq
	MciqjpM3EaKfEhEUr6DuWqbnTGxl0095JNvUMvAr7snjk7EdPHXa0dhFg==
X-Received: by 2002:a05:651c:211b:b0:3a9:7425:7c33 with SMTP id 38308e7fff4ca-3a9c570c4a9mr29246931fa.28.1791872368005;
        Mon, 12 Oct 2026 23:19:28 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3c9bff8sm33912331fa.7.2026.10.12.23.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:19:27 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 10/11] ARM: multi_v7_defconfig: Enable Cortina Systems
 CS75xx GPIO, I2C and TWD watchdog
In-Reply-To: <abe6e89f-2379-4928-a77e-0baee12b23e4@kernel.org>
References: <20261013-b4-cs75xx-s2-v2-0-94f8c0a90cda@gmail.com>
 <20261013-b4-cs75xx-s2-v2-10-94f8c0a90cda@gmail.com>
 <abe6e89f-2379-4928-a77e-0baee12b23e4@kernel.org>
Date: Tue, 13 Oct 2026 09:19:25 +0300
Message-ID: <179187236528.3113952.1605165361017352112@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_071931_602314_CEA2CC6B 
X-CRM114-Status: GOOD (  10.34  )
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

On 13/10/2026 08:13, Krzysztof Kozlowski wrote:
> On 13/10/2026 05:47, Fil Dunsky via B4 Relay wrote:
>> +CONFIG_I2C_CS75XX=y
>
> This should be module.
>
[...]
>> +CONFIG_GPIO_CS75XX=y
>
> This as well.

Will do, both become =m in the next version.

Thanks,
Fil


