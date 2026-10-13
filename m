Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB983CC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 06:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/TE8jVp1mgIX3w95Qd56lz15ABuBS61Pi2gCb8R3Ds=; b=VaYqvuAgH+WLIq6GIIo38lXkvJ
	n2Mo8RJMY3pF3jfd59UJwYyUEzNpqSa3pCPNjI9U9c9NWf7nKtVhA3i3hoYwKLCuiMhQYiu6ZHXsp
	5iMScXNwiBlW5WhVKQLgHM9V5hQCUr82rxVzvM7VguGFFrT4W1WUt+bdKfOQ9fOHZLERRI2xxAOWa
	ta2TzrZtPlk4xDnRTFpv+MSC1bPn8ZMVMt56ux+Xhr3miBcIVM337Dj8Ao8IUWqvbNx8aLvWo7egC
	Qnhu8LGaWyUxFTROspbWFASlWiUAbLeCSHwlqKGVQ8gLH4DL/XGMRrbkevWubj176qBMVAYnJBUGb
	4jwBsUOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGW8Z-0000000C9oF-0uVY;
	Tue, 13 Oct 2026 06:37:23 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGW8V-0000000C9nl-33yB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 06:37:21 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so30867375e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 23:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791873438; x=1792478238; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/TE8jVp1mgIX3w95Qd56lz15ABuBS61Pi2gCb8R3Ds=;
        b=sw8imxsgguDQfvo8yV3KDZm+JJnHBTDOyobDPGYepLNwyrb3a6TJNMTEMFSMV5JWn6
         KeVQNMKmDTZHaIovhtwrPtonkIMZGwYp6MJE4svEnA5JJpQtX54eM3nAor6PsUY7QqW8
         AX82cBStUw7N3wFjQPi4Ovo36ZhBeGD85CX5IBYIzq3naW+MkzassurCQ9MZ4meXlpzC
         /a8mI+OtLdnblFajtFhZzXiAClIkIhd9aApxy9yQhq3xrzHSwxeARfbeCKtKs6ZecoXx
         6vEYDaDojIhLuIOIGTlI1SNxhXCpWMWWUfNnQgRNh89YmlU3T5PBkV55fa9AJhMW7Wup
         t+gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791873438; x=1792478238;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/TE8jVp1mgIX3w95Qd56lz15ABuBS61Pi2gCb8R3Ds=;
        b=2vGnrLLBLv1BKvqJ5jenAUWBWSV6iqbjbbLT7LJRKKj09XTEGGD2xnzq4GncJxxGNW
         Gb7Nkk7Xt/nJKxMNXI/HTMNTRdoh8xPpgNQEMkO9pp1HVpnDBq/WdC0sxZTZerXiJzEM
         gVINVnL/HEpTN4nzAq9swx014GmfabqWf9I/V56ZcOer2HOBeMP+iC0IH08FAXi+p9UQ
         YUnTr7bLIdvoDKPIuc1bsaVxC9Ovigue8Z/bCov7RlNmItmH6pwY5YoPIsDk+yzEtM8o
         +4gFeFft3jO0Ch9amdMshBbAZcWMD2Y1+zxpyDJgWzRq3llf+9j/KcVLeo4iPYNO/0Wa
         UCmA==
X-Forwarded-Encrypted: i=1; AKwUvBzLIOxGGxX2U7jP3aXfx4QyAOab6suv3YsaK+nDZHEYDzadJT5SdzY5ghZYrgwzD7sdVz2vHBatT1vBanFhQ2w4@lists.infradead.org
X-Gm-Message-State: AFq9FYL4s76mYcW4+rXmr8MYncrBkx7yz8OqXmYrQlwZf9KnwDJV1mL5
	VJHNLuoXCGLnmmfWZgMOIkbMnzleI26UKxxY0yW1/HKtcVehNHj0lPje2nGiGzyPO8hmUg==
X-Gm-Gg: AYBFou2kxpz6KYsXC1fPpCvWoXFZv0as6j5oaLjxozR3WCl9BFWkYvqVrzcdHwRyOmI
	q2Ay2Hf6KpTD19XUAtah6mzOyDzB8+aFp7VwU4uptdAGwmYyE7W03vCeqwUmXD+Kt1oqlBET7nF
	EMFCkwLW1Whw/QRvEJFLcW6sYS3CRGCJhZVTm78WSxUOFRv0jbEU20maOddMq6/pX7W1YuI1qj+
	AnfXtak6I4BsFSR/V/lGL1gPwNo6RcLF85y5jSbBWtxonPGRP87SqdAfLNJkf34sIJhYjJOO04Y
	1DuxN3iuW+jLYb0erT+csbA4wUMldbqT6eyMsnwqfeYu/m5S9KYjdt8TNXhW1lCmyyxOEirO9mU
	6mQTq+GT0tb3RLiIqfFO6bSX3HNkcQl+llS3BE99idu1CloO0LlnHQ3GFF4OjtJqs55Cb7SVqcD
	Blu2bMvbjBdtKP1wN1qBySCD1U8K6Bljo/v38vm7krb5RQTrx3rkab+6HGQhn/icXlh0GHtKQpu
	BQMdVqLZackhCA9bF0IHyZ+rxUrXCMuct7bsEYyNFWOMF6kwMzgGuAIww==
X-Received: by 2002:a05:600c:348f:b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-4a18e4c05e5mr229014865e9.19.1791873437754;
        Mon, 12 Oct 2026 23:37:17 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19471edd5sm434795675e9.11.2026.10.12.23.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:37:17 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 Jason Li <jason.li@cortina-access.com>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 00/10] ARM: Add support for Cortina Systems CS75xx and
 Securifi Almond+
In-Reply-To: <971b67a9-7e3a-4fde-a8a1-e5a78f8d6436@kernel.org>
References: <20261013-b4-cs75xx-v6-0-37e8f3969b7c@gmail.com>
 <971b67a9-7e3a-4fde-a8a1-e5a78f8d6436@kernel.org>
Date: Tue, 13 Oct 2026 09:37:14 +0300
Message-ID: <179187343453.3124451.12229499654368455627@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_233719_777819_28073FAF 
X-CRM114-Status: UNSURE (   7.77  )
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

On 13/10/2026 08:18, Krzysztof Kozlowski wrote:
> Way too many versions of huge patchsets. I already counted 4 today.

Sorry about that, my mistake. I will leave this series alone for at
least 48 hours now and collect all comments before the next version.

Thanks,
Fil


