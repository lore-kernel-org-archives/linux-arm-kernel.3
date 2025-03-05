Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E65C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 18:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xJE/R5/BnCgol81UrY/cLHMX89sZpiDt1jINbKrX0o=; b=IZV5AE3bqA2vvaIhEk3CmaeeDu
	izUi7jsbGJq0W4rEf7HVUONIrS5V8nabutE5sIlC6FNnHR574a0yr3XvHxr2JaF5axGKmY6oyny/y
	vD6yVZTv83L7+zJ90EcSu1Wbnhq2Qi75nIO6KBcPiyLNRsDxj4NIRa+PLHblRxihiF7nqgipVzwoP
	5uZWuPn2ntLETGYXcjjrydhHuswoP62Akm36nnUaBTxgpFZPuAtDFEF4o+zk4W9W4p/5pEnLgF8dZ
	znDsIeIQg5GQgfRLW6wr62Zp7DkZxOnC+ZqQxy/y4Rt6Nlk0Io15jtsujVt0m6aYRFl/CsFcYZdxF
	A0jJFXBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tptrG-00000008yWZ-1Dpf;
	Wed, 05 Mar 2025 18:52:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptnm-00000008y1o-3u3m
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 18:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=0xJE/R5/BnCgol81UrY/cLHMX89sZpiDt1jINbKrX0o=; b=ugsmB1N2dQiw0TIg7DioaDFfA7
	xPOWdEOyEfneBwMB+SQlqLjyhWv4SjGSOPKLYaPWNy+dm6tHmyOxwHvncFS60N89KncIs/95xPAie
	aVpVNYO0RzgXPjfbycJXZi2csiCdUDiZybd2gikT1loO8+njKM3rx2+FWsT0b/N4EWr0dILScKkT+
	ElQKARhK9glH1shGAtc+nfd8NnV53NC77ONu4aCCddwVBvYbfB+mvv3+TtxCGQd5rETRAasJdLB2j
	vqk+uJUOfcfYJtiQATI83SOlFbFiOek7yBkLzO5Wk2pjWkOLTQ70zcHvSFVQEe+gT2YdfUybupj3o
	YR0TaBJQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tptnk-0000000625R-044W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 18:49:05 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-438a39e659cso49146635e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 10:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741200541; x=1741805341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xJE/R5/BnCgol81UrY/cLHMX89sZpiDt1jINbKrX0o=;
        b=dd4g/0xE4jqfzHexWBdFT8IZVabi2Z1rlzSEjvY7jXFdzXgUA7IrsJg5ekcXGBfpQL
         arW9ZDVXTkhs1EpQkXtJhIqY++04mRl83LtoloYNrxZcqTG5++6J+H2j1oRk9PnU6jwT
         n7TSkj/8m6x/mhsBUqIQvB3dR2DG1tYKJYGqki9TMfHqAnLFadmdMVPk2DqYnKEvn/Ru
         FYCGzXdHeu4vuIR1teg53ymNC2HffmQpQwT+PAvtUrwNMG0sKt88Xsdx3imnCvsjwWqO
         KKqVKTCn64LjEWKi29yWugbwkZ8J1B10WqBEpnaHQZUUEq21zY3XCE2T4aGQP1DvnXFe
         FiMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741200541; x=1741805341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xJE/R5/BnCgol81UrY/cLHMX89sZpiDt1jINbKrX0o=;
        b=riE1z7/KqYmUhof9+CehkQro6eg5NnRlw12+c1W51rU2cGvhGbKj9q+HsbRTsFeOB7
         H1eWVbxSks6NSSkw6rbpWCWtI2oyvJVaMlgzbRoIvU67QPAach3MoiyQIC2ySv1XlOho
         e1ELCH/rnUg1h1vUibE9VyjjUfTHO7F8Bj2JZ3JnNCexrkzFdwr9mI2Zx8tlunOMCWp1
         4/cgEaPddSNkSBfJl3YK04CcMqAvi+GNFHdD4xQfc/GqV6hjGsgx67/uZW3R7tQBLWhN
         yR7JvuqMm5gbZcvmrzqApc0+tYqYLCDwE6q8LESvBm46k4484hBZQbKQiLmxflfHJ/Gn
         qeKw==
X-Forwarded-Encrypted: i=1; AJvYcCWmEOfzmcuQXiljfgO85mQ14GGwvpFqmOWjZaQL8iO7YCYxpEzz2+VWe45KOUD29A2u190Ew9jMCe+jOoqBSHAC@lists.infradead.org
X-Gm-Message-State: AOJu0YzRjI40Qy1YNykDkUlCoBX7HgiX8uNB/ibdiyqfHJhdym2Z1uEs
	7H7nZZP8NHmS3kzQXmCtbfis9adyeF8Jcnuyhd8vgkxiPEFpgkbm
X-Gm-Gg: ASbGncsdlNp4vhBMFvEheMotLPXOC27BRxjRRSR5nS3bRqAlW7GGEDiJwK9bBf1NvdK
	AeLyNWFlshKCsz2Wi4ki50T5mQ93j5L8qsHUVsLHZ/pMPp2tVbgLdFfTiEp9nB1FK+PnacfhCNL
	SDbLqxyh8Lfb+s+lvFtbAB9O81uv+2su3ae8THrXdD7Yc1wP/Co/J3O3RZp1GdNnqP9iaaR9u5P
	LSfVe12oQQ6FRQyd8zBvy/pVxAm2Mvh/sdBrL5HTNuwBbKsyRS80TCgYsbGhCNuAinV8Bk24StN
	ZNMDwhAuVx/c4L7Diyj3wdS1RGVbAsOenKmtfziTXFjmdpGQq2Fj6s5Apl+frIACKSTpGgIOqBY
	Z6N7I1gN5/iCfBRTIadrU
X-Google-Smtp-Source: AGHT+IHQsfFe9LIIU1ujnavCZmAwL0R31Bsaw0Zh+cWaDPDDqIrdoQswxVtXfq3deH8/EgbbGU59Qg==
X-Received: by 2002:a05:600c:6b10:b0:43b:d531:ca94 with SMTP id 5b1f17b1804b1-43bd531cc69mr25654365e9.3.1741200540856;
        Wed, 05 Mar 2025 10:49:00 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-391253b3e23sm1928230f8f.76.2025.03.05.10.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 10:49:00 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/15] arm64: dts: allwinner: a523: add Avaota-A1 router
 support
Date: Wed, 05 Mar 2025 19:48:59 +0100
Message-ID: <2224762.Mh6RI2rZIc@jernej-laptop>
In-Reply-To: <20250304222309.29385-12-andre.przywara@arm.com>
References: <20250304222309.29385-1-andre.przywara@arm.com>
 <20250304222309.29385-12-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_184904_055096_04C99D9C 
X-CRM114-Status: UNSURE (   8.88  )
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

Dne torek, 4. marec 2025 ob 23:23:05 Srednjeevropski standardni =C4=8Das je=
 Andre Przywara napisal(a):
> The Avaota A1 router board is an Open Source hardware board, designed
> by YuzukiHD. Pine64 produces some boards and sells them. It uses the
> Allwinner A527 or T527 SoC, and comes with the following features:
>   - Eight ARM Cortex-A55 cores, Mali-G57 MC1 GPU
>   - 1GiB/2GiB/4GiB LPDDR4 DRAM
>   - AXP717 + AXP323 PMIC
>   - Raspberry-Pi-2 compatible GPIO header
>   - 1 USB 2.0 type A host port, 1 USB 3.0 type A host post
>   - 1 USB 2.0 type C port (OTG + serial debug)
>   - MicroSD slot
>   - eMMC between 16 and 128 GiB
>   - on-board 16MiB bootable SPI NOR flash
>   - two 1Gbps Ethernet ports (via RTL8211F PHYs)
>   - HDMI port
>   - DP port
>   - camera and LCD connectors
>   - 3.5mm headphone jack
>   - (yet) unsupported WiFi/BT chip
>   - 1.3" LC display, connected via SPI
>   - 12 V barrel plug for power supply
>=20
> Add the devicetree file describing the currently supported features.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



