Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E69E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Dec 2024 21:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8roFy6r1iFnafqqOQEAKfDjOsYW4pss6G10wN0TzYo=; b=IMqiBM/AxQBrZcNVKDt2wTV8pa
	s2NDmr2KDBSH83bJOBUQxBwPPeENeREFztwdzabFa8dvkwdqXW/DkZ+45gwNTLaHCI01loQCCJrnr
	y3vSWLlWYqXIbQCLpGM28rRpUluTjhoIuW0lK2vjRqKVaJQ/XR5b3lAWkeZGgz6rDTWNH77mmBK+m
	GwS206BQEWzkWJ9MfILXrQFvxYAleJelDzh07LiYg12ydYlwP6xq3bXHIvhdcMaaUoRI7YCWVnDNP
	YEBU3G/N7iHznPioyTxLcQD3zFYvSNA97i/Lk9s4ANTwNajYFJyagbjI10OdKDT8MJwx8P9IABFqU
	CoqJcM0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP75B-00000007RaQ-0CWX;
	Sat, 21 Dec 2024 21:32:21 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP73u-00000007RUj-2WjQ;
	Sat, 21 Dec 2024 21:31:06 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43634b570c1so22069575e9.0;
        Sat, 21 Dec 2024 13:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734816661; x=1735421461; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C8roFy6r1iFnafqqOQEAKfDjOsYW4pss6G10wN0TzYo=;
        b=h8LHgjc18e2GhU1SFeggtA3UjE+hX5kIZOe6iJPFi2Q1NQjyKZBzTCTntFdALGG+Hn
         /bHi++mKDf1v/V1FyH+gx2dYp6dAaDfnfrpF/6FWvAavjeFkEVoGK5sW6QCWDRYo9YxC
         enssBophnveZ+EdoHjqarx5ckKK/LR15fQ+DC3JEYODKdV4wiOtoaqq55ASwLsX1hz+0
         7rdhAa+PCnLNjhLiLaxQx1aoFGVCH24UzoxG+dITtNWP1KdzzXos4SYYqM6yozc8JBAw
         QuCrBlsfJDBcR7XUVRmm/j/+iRergQFzQO+CbFW/59Wrh2EbNFk+IMlFHL+Z6cWjRwf3
         DO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734816661; x=1735421461;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8roFy6r1iFnafqqOQEAKfDjOsYW4pss6G10wN0TzYo=;
        b=OtOxbhrKeFiXASreM4aqOtumgSmXWn8gFuvPOaMcZhr5+CDpr0i/qI28bGU/Y7M/tL
         Gvefvev2wbjeh5mLSZCWhnQSD28OSit6wPhnbuM28DtisoUSth9WvB0ME7eQ6Uhuewau
         0IOQqTzC6ZSfQTd8w5qSVH8pZUSX1OH3aSaDz21ZMJc/OL7N2uEIf2jeBXtEDMuec62U
         aaCqtjFvGwqw9nlnq4Q0TYMljZpxpglnSJYlNr2Ij+JH2YgYMhZfpJAJEE5T22gC4dcv
         63KLdOQLPeyIvBLn25ism00t3cNwmu37RfB0a81GPkha9MZzRTcexWnTINgCUDeXl8oA
         fKSw==
X-Forwarded-Encrypted: i=1; AJvYcCVoTWm1D0mxXOYqjA3j8S4ppVvK/AzyKS7GeKbodJorhohXWg2ip7YkBa28Ge/GOWWhl3Asgfoh46xQG6Ve+EVs@lists.infradead.org, AJvYcCWZRZPViS/mC4eUAOXeLSORQrE1C2I/Y7UPuDB1o1Zbd1guBkX1itoN+XSnK7Lqun/WTX1g3tIJ2BMGcaaeYR0=@lists.infradead.org
X-Gm-Message-State: AOJu0YztBYWU8uL7ixuH0VXFqYRI0IjdS11db6XfveNO3jnsryxkrqWX
	RUudYZVAM6QBKxKXPup9+FRFyimY3bjacNsRmbx9syvK0SdCYfLa
X-Gm-Gg: ASbGncuRvL0l9/cFUamlkqxEwdgobT8TTAreIwxOqUVTCC/MU/DLxfbiQrs+JZB0tFa
	bSC9eDGlxxGOVYawjQeoqMelfoHuG60dlOkfHkMLRPpRQSgp7WhotWlK926d+8I/0Jqz/4zapbp
	DzYvG0vxn37LcF0+6MKepE81dEA3KvLEtjS6fNVZS7+N5Naz+aXiLtLyQwTackxxYR0vCiaV46W
	43qTeG7EZNzi0ojVvArePRouaHpCYfbY+TgjsSf014YbjMkw6NHR4ixswQF5QEvOw==
X-Google-Smtp-Source: AGHT+IE2+evG7rKLvD6sugHVYsVIYoW849P1BMGBl6mETESdfIg8QPq7IydEtgZ9SQJacuklKW2p3A==
X-Received: by 2002:a5d:5e09:0:b0:385:e328:890a with SMTP id ffacd0b85a97d-38a223fd7e1mr6598729f8f.49.1734816660498;
        Sat, 21 Dec 2024 13:31:00 -0800 (PST)
Received: from [192.168.0.10] ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828cc8sm7362826f8f.17.2024.12.21.13.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 13:30:59 -0800 (PST)
Message-ID: <44580fb7-a0ab-41c9-a4e7-fe053742883a@gmail.com>
Date: Sun, 22 Dec 2024 00:30:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mt6358-regulator does not probe automatically on MT8183 and
 MT8186 Chromebooks
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <f3c6ea1d-da0f-40cc-ba70-7cabb5c3189f@gmail.com>
Content-Language: en-US, tr, en-GB
In-Reply-To: <f3c6ea1d-da0f-40cc-ba70-7cabb5c3189f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_133102_923668_CB1C0547 
X-CRM114-Status: GOOD (  15.92  )
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

Hi,

On 2024-12-21 18:38 +03:00, Alper Nebi Yasak wrote:
> Hello,
> 
> I'm left with one small problem trying to boot Debian on MT8183 and 
> MT8186 Chromebooks (Cozmo and Magneton respectively). I see a lot of 
> probe deferrals and get dropped into an initramfs shell. All of them 
> get resolved if I run `modprobe mt6358-regulator`, after which I can 
> exit the initramfs shell to continue booting.
> 
> It has been happening for a long time, still unsolved as of v6.12 and 
> next-20241220. I am using `softdep mediatek-drm pre: mt6358-regulator`
> and so on in /etc/modprobe.d/ to trigger it to probe, as a workaround. 
> 
> But I would like if it was solved upstream so distro kernels can work 
> "out of the box". Any ideas why isn't it probing automatically, and how
> to make it so it works?
> 
> More info from a serial connection below (on mt8183-kukui-jacuzzi-cozmo):
> 
> [...]

I found this patch [1] from Matthias, sent around 2021 about adding an
OF match table to the driver, which fixes this problem for my boards.

[1]
https://lore.kernel.org/linux-mediatek/20210112100659.19350-1-matthias.bgg@kernel.org/T/#u


There on 2021-01-12 13:52, Mark Brown wrote:
> As previously discussed it'd be better to fix the binding document to
> deprecate the requirement for the compatible and remove the usage from
> the MFD.

This doesn't seem to have happened in the last almost-four years, so
please reconsider resending/applying the patch.

