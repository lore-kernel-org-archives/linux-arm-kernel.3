Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDB9CF885A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 13:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ji9rJDb1MvYDh0vNEXCjFc4fTr5v97Yi6vD9q4tUfM=; b=PYZyGnKk0FKkZ2YchhaQ6brdme
	8XVhcWGwwPMPdu9SsSjs1+rFAXWhluKz+SDHeRZrJ4nvllteqaurLVjKI0be+tIXD78xoZILXA0AD
	ghL6+XIDw1Q0s1TTYZ70tQBC+1voSKG8PNEgzjyfolqdCS2PkDz866nW5VVxBc4BX2nOo13aaU1q9
	JU0zXU9u4nxecOraNLBd3iHiueUXj9sW3wdzbrFScD8j7A8TT7TUrg37cfKT8v8TEe37Ya36BRMpb
	TavDZnysP/7rEZW3bXAr7nftE81Be/YairC9PcGRa7yAqj3n4fvrsDd+gxZX+3D1npBZryqSqDJgB
	KuoOhg3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM56E-00000006m4V-0kPQ;
	Thu, 20 Nov 2025 13:53:26 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM56A-00000006m31-2mfs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 13:53:24 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso1124319b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 05:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763646801; x=1764251601; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ji9rJDb1MvYDh0vNEXCjFc4fTr5v97Yi6vD9q4tUfM=;
        b=NimONUnja+QBSFh8ZnuCH2NlnuZrTbP4PqaxxpEWh/8M1kqRcAJGs35u1FRZ/w7Cde
         hKX6SWFX0nkfERV+Y26W6XcMPvmX2SR5f1ImYmu707MiN93+0eMyArCdL5lzkCuhVkIv
         z3y+aAdMkbjUZZpzNdv9wjoVGe+PZsIcdB7sUa5oWqgwjEyT4O+3L0Pyl1G9+Yo2uM1v
         KBPPpDgLF6x832U3mMo7ByFJVkgcwbOn/+ubWZShz+ahHd1st/0w6QndgO1EOo2zciIz
         1sz50wTwQ9YHAuQpsHS+iLmbJPvUOQppbiO7mt/+hvV68GpYrXeAvhsRpYtVbwJqbMiw
         gVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763646801; x=1764251601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+ji9rJDb1MvYDh0vNEXCjFc4fTr5v97Yi6vD9q4tUfM=;
        b=pedRCrfxrkKuVd5aKTqqIaBQymoGQScLumtwsvHWewbbCgEethdy3t3be62wSkcO7c
         iK+DQlNNu+vUCpV60b1+emJPf181QK7rQH4wdK+wEqUA39oW2JVFp1Aj3cqYd2NCCgLe
         DeM2Rnb0XAGrmCCCGgmqgUd4sAg0HcRX7SKeY1Wxf+/PLFReTjdXHQOhe7GWeeGHmUEj
         k6t2uEesbWolSLlYLvaif2Bph4EmozWrPPjhyWpyDHu1N6/4lk6IV+BAyiK3DKxJ6h+O
         RnydVgnNNpOcpBlqwnyOfIyypz7WuhEPbhSuYCinj80gp/6Sp+/O0mDI4HjtIfYBC3n9
         /oQw==
X-Forwarded-Encrypted: i=1; AJvYcCX9PXe5sy764EYyF68boXtIeQn5MzvUMP4/iZ6zAfvLBlN7cJCApM/o4toEyVMU3XtnZ8g5MKgZHa6PmfNH4+p/@lists.infradead.org
X-Gm-Message-State: AOJu0YwI33gs8CTau+AiLrQGiYPpihSAzcQjPWij+TjL0IUE6nMqjBH9
	So57vsdg3P2TJfMnziVZR9ROrycz+NFlAi8Ai+oAOQxeRvh6Rua5qHjnYEsbY4JMpoV1jpqpeFL
	uHSU+dcvI3a0MkN4QzKKNvcsKNUWst6M=
X-Gm-Gg: ASbGncs54MQh7HdQO5v2vdtw2EZfHKYyrLd5fBvOh5zG9YWK7OUpiYkyyXCCXP8Lq0Q
	bU5MMZFbzW+wnTLita6Gbc7M7PYB1DpkPHPGRG/gHUZyjaDWFaYy/nwNgQ/YoNDGu22dqvSMg1U
	0aGmnfc3r+id/u3gIeBUW658Y9qPycpgNfXB9Cw2GMMk3CWOYvGFIPb8awFraHLkG9+Xsq9kPrv
	X1hUaksWq+pyzwziwyQrqju9G7AgcWb53s8tVEVqQBPRInjc3BKrsHjwecmpq0J5WbKpIKAZgAr
	VbY1unfuXb2Wru4Mm5RMGFOXqhTK+CSgNgkfhgMBCYDvdpWdlGfmZEUIkM5j8Mksx18gBRq73k+
	nYBq5lEwmWg==
X-Google-Smtp-Source: AGHT+IHHiFdkRR2hcs7aI5ty0G7MPp6ZYGVQIosVcIdjzscilsxzXmB//cKbxOhtRhNsGf+CdA6qCE9WHN4qhmI+au8=
X-Received: by 2002:a05:7022:6714:b0:11a:61ef:8491 with SMTP id
 a92af1059eb24-11c9476aec2mr708193c88.3.1763646801541; Thu, 20 Nov 2025
 05:53:21 -0800 (PST)
MIME-Version: 1.0
References: <20251120103039.1824209-1-carlos.song@nxp.com>
In-Reply-To: <20251120103039.1824209-1-carlos.song@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 20 Nov 2025 15:55:49 +0200
X-Gm-Features: AWmQ_bnQa7oBzAN6Aw7zvXpCjSq9C--w2oU7R6YmaimQUP4lya11WGpioKQNFS4
Message-ID: <CAEnQRZDcaWAQTLVHL1q+n2nhk3Cop2-fbOL+BqibrJHze2F9xw@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: imx-lpi2c: change to PIO mode in system-wide
 suspend/resume progress
To: Carlos Song <carlos.song@nxp.com>
Cc: aisheng.dong@nxp.com, andi.shyti@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, frank.li@nxp.com, 
	linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_055322_702442_21356715 
X-CRM114-Status: GOOD (  11.15  )
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

On Thu, Nov 20, 2025 at 12:31=E2=80=AFPM Carlos Song <carlos.song@nxp.com> =
wrote:
>
> EDMA resume is in early stage and suspend is in late stage, but LPI2C
> resume and suspend are in NOIRQ stage. So LPI2C resource become ready
> earlier than EDMA. When IRQ enabled, immediately slave will trigger LPI2C
> to read data and the length meets the requirements for DMA usage, the DMA
> will be needed at this time. Within a very small time window, EDMA is
> still not resumed.
>
> If a system-wide suspend or resume transition is in progress. LPI2C shoul=
d
> use PIO to transfer data not DMA to avoid issue caused by not ready DMA H=
W
> resource.
>
> Fixes: a09c8b3f9047 ("i2c: imx-lpi2c: add eDMA mode support for LPI2C")
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---

For future patches please add here a small description of what changed sinc=
e v1:
e.g

Changes since v1:
* updated commit message as per discussion with Frank.

