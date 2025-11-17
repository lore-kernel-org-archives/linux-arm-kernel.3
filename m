Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2952ECEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 16:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YNVxHgEignw0rdNNAyxd1EhtIF5KPoYz+FgIgcJ0ztA=; b=4pwTLb1GcetCo2zbm4lhGq8XQG
	+dY88EoqSWoX+74hfJzk6E7Zm7UHP72m6sfD2bETXjB2FI9mmVl6qdqQQu7BB4DuA/N1VU+RNPFLy
	yfrZwImajLVeQP7OxXAYHO4jHUz+0aEO9dVK0XXmc0SavAkxKTxZI9MMf1cfws/Xv8DCme45i9k5M
	Q+ME+v4goK0RFvhjxRXDLnFqrpbgS/amRqCEEGwl6DWtpbpqaVvfHiUT8jI0IU/+/WkOdO7tFIbw2
	UorYU4+MLhyNW7q8nIx9Q7DpZAXovV3qwCHGIbIqqimXXWRwdD9LV9cjyXhDKyv+6B3DWbAZZHvcB
	IusRjZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2Cc-0000000GPMe-3s6H;
	Mon, 17 Nov 2025 16:35:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2Cc-0000000GPM5-0sDz
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 17 Nov 2025 16:35:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YNVxHgEignw0rdNNAyxd1EhtIF5KPoYz+FgIgcJ0ztA=; b=MuI+8vDjHO3QSfOXCvnKA2GWmX
	5vQCh3baNd6Uq5gADosA+4ACH5ztJXng81wXIKjjdF/ZA3/my3ew4T4Luc2OZ9yZjsZq5hk4uM4eP
	Rg5ZeypaeZGcfPsDkvbF0en05bgDLrfRpRbBFwoxnv8V1/WNYasxTcZaVIsEeRD9cbLPBOJLqgKm4
	pPHigZp3BI/LPc3dt82yvNLFxDd26LMb1UrVmXBE7CWMxvicL6WE7LWkQZv7jhNNkKsWDahcYVZVp
	6OHWScc7ZkEA/ubShdNN+PX6EPCIaXNbUKlWnUodDitCm0P7HF9aclIHOxhW5EzITdnpV6SNsNw5r
	sRJVje0Q==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL1Kv-00000007fPl-1Euq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 15:40:15 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42bb288c219so1716104f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 08:35:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763397337; x=1764002137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNVxHgEignw0rdNNAyxd1EhtIF5KPoYz+FgIgcJ0ztA=;
        b=JjDrEw8VeM0lf19FBpLrvvxSGp3CQY4t6RxBT0styelIIu5S4FgAWgeo+AuYbLa0x4
         3fQiMp/mqrz03JcwW0NBnyMK0jYsLtQVdmIqWvv7uwvE0QxbOQHNNPfzgNCybwTf+X2u
         sutJQ4WKZIMnHi5zPLx3SCX4TrUiqgei48l1+q/oCb2qJsk7wtVnsYA83h4uNBmdO7eJ
         Ifth5mtO9YoZto7pxjuBSnkwq2FEZzkgRo+oRorNWo3/A4MdnPYF8ztdcfYM5KkLwywG
         6KKyFo0Q06pA+wjrkewg5h98E8lR0hLWIjaChb0jhXES+knS5MbKwou7guowkRPo5kmB
         LfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763397337; x=1764002137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YNVxHgEignw0rdNNAyxd1EhtIF5KPoYz+FgIgcJ0ztA=;
        b=cQf9B5Mz++tWpuPjQvznLg5FBactfAwEr5Hb71IRUbyI+rYxd7hm/f63gVHiLPQGbi
         Sbu0W6kcOjqOlloGaw8OfrswijmLYRvuXkXyFAM6CPK73CcSSip7Uzmf8iLzYEBhW636
         ILGcYHPdIEotM6bwmrWcSCU/OIW2I3RVpsrxrXm6gCl15pCGMhybWuqhSCEOPQYw+VrJ
         fh+0aohPY01esPZbl/DfWfpXmaEt3n3NN10IPKg3Jic8vsMsHC9ptSLPpgTaiwxk2y57
         rkXiQGg/4JiT5UpjTktzTZowPgchV50IOLR5VHkkSRWx2zP3XHzh3SvvEVzsU0Dct/DH
         /dkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUko60zLKcpjSzq9fFA325K0w5oqGEISCuS+YAWDbutLzW4FdhHsAferjrPC8ci+CRZu10sepPxVbUY3pA5yULh@lists.infradead.org
X-Gm-Message-State: AOJu0YxK1C4VPnk7sWjOCe1QSmPLXroOeqTwAt6Mo9BD8vpM4gt8WaO9
	PbxXEDd1z/mX73MRGJzyd0HMzzYbS2aeO5LovhnanlfJuDtaFLDs7iAJ69F3Qps+rR5aNIDVoDy
	8NtfqU2o=
X-Gm-Gg: ASbGncvvJyQ+aIRGvJqkZlanoDGJnBXVN4aJJXNjSBADJEMSIam7plCe4pLPmauT4iH
	E70qnrkGW78LpHCx+PHrNTfwmqxZkxsAt2Yt2NXsSqOOijmTGxdZTey4aXdacACrZMaMahCUeRR
	e6yEkTSfXnxAbNuHTPTX6G1HcKTe8+gwQIgHsbOohBch5McJTzgtTbHIKdJSfK5T34Ow0CuGOSU
	TrY5kweLnuc3EERWdwaSeUjx8SXdouvfmEYgO6Pjd4ffDZlZRLrKFlkxsLIwSksdquiGEa66Uvq
	LKIVjQK9HPmDFYYtAPrB+r31Ps0ODLuJE9FhX0WNZDFixslP7mJ2PVRRZf89zPp17/djNJ1KDMp
	3ojj3Xz1aVPPP7rKr/GWDbbiAbkDf8puL5A5+Xlflk4fVw4LkuD+QB+g7g8C7Ev5BawAjtU1BNs
	Au1e6wZIcPMT1s6kW5Jrk=
X-Google-Smtp-Source: AGHT+IF3/goP6VZz6KB9mB4A+moE0SqG2R//vWIM4SpwtPFRE2NyqXDCVpSYWlzEa695N/dGCGaNYQ==
X-Received: by 2002:a05:6000:616:b0:42b:483f:da8b with SMTP id ffacd0b85a97d-42b5934b2c8mr13569533f8f.25.1763397336928;
        Mon, 17 Nov 2025 08:35:36 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f1fd50sm26904384f8f.38.2025.11.17.08.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 08:35:36 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 device tree updates for v6.19
Date: Mon, 17 Nov 2025 18:35:33 +0200
Message-ID: <20251117163533.209608-2-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117163533.209608-1-claudiu.beznea@tuxon.dev>
References: <20251117163533.209608-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_154013_494484_D6CBD8C1 
X-CRM114-Status: UNSURE (   8.45  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-dt-6.19

for you to fetch changes up to 7d5864dc5d5ea6a35983dd05295fb17f2f2f44ce:

  ARM: dts: microchip: sama5d2: fix spi flexcom fifo size to 32 (2025-11-15 15:53:56 +0200)

----------------------------------------------------------------
Microchip AT91 device tree updates for v6.19

This update includes:
- FIFO size fixes for some Flexcom UARTs and SPIs

----------------------------------------------------------------
Nicolas Ferre (3):
      ARM: dts: microchip: sama7d65: fix uart fifo size to 32
      ARM: dts: microchip: sama7g5: fix uart fifo size to 32
      ARM: dts: microchip: sama5d2: fix spi flexcom fifo size to 32

 arch/arm/boot/dts/microchip/sama5d2.dtsi  | 10 +++++-----
 arch/arm/boot/dts/microchip/sama7d65.dtsi |  6 +++---
 arch/arm/boot/dts/microchip/sama7g5.dtsi  |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

