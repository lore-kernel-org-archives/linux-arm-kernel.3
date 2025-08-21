Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EF9CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 23:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EY0gY/mYWjkbDIJfbNJ2HQGjwHWyLFvQfujYiQs4CyM=; b=0l8TgWMBVu/PYwTfSWOslLbPBm
	DlsYY2N+MnFi+DVZE1oVEHnQjusZX1liBY5e8qITroYCEg2d+su/E5NBxbv5AzfxD/DngWDnvUq+F
	PLhuR8gFhu7j7TRXDgOws72mu5V03vXmfRjHFYMEXm6D6mbMJ3G2CWXGVAgEdVNClDqgvM+7mic8d
	2ks4R7iuCoWFhvmF2FylD+Jco5UEHhfU/ttYGSv3JHwTmTFxzl3Npbc5BA/YBzgLln8XDG0k3pU3p
	hhbCs5d+KvaRr9fsDo1GmmMqJYZ0Sn7ri62tu3D1RA9FpPcV26Qdvrryh1EIKyRlZncmpZ7F4/JG5
	igg8srhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upEw1-00000000xFm-24Ac;
	Thu, 21 Aug 2025 23:43:09 +0000
Received: from mail-pf1-f175.google.com ([209.85.210.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upA0n-00000000AaZ-397q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 18:27:47 +0000
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-76e7af160f1so1080020b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 11:27:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755800864; x=1756405664;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EY0gY/mYWjkbDIJfbNJ2HQGjwHWyLFvQfujYiQs4CyM=;
        b=UzsPNeZBSEveJEGo2sIEZsSzUfjXj4Cw7luwqlRvR6IImh+nCamAvXFpIzCpQtXr1t
         BfcxTgFpF/mlUDtsNpiGEdpRPEBWagIrgsoC64eqJjTSXucjmevipWfH+xmJe11jzfSG
         Fb1vKzb8bTPZS9Fdh7T4ne2Ffsqi/MNfuebJHiIMuvchO5QnSv4jLAd1WqjU7MNEcwK2
         eU96RGAU1W34mBDccfzLnTlrBb90PGT2H5U6VbYZdXkssgcCBH7pPbHddPQF30KAfiYw
         HThMEU7QPgtfLQJJMBZLUI9e4bR4qgek2+RHMpJp2yEXnRCu/4Qgj2wdI81C0ZxaDvRF
         yeVw==
X-Forwarded-Encrypted: i=1; AJvYcCXtU8VPbMfmMJzl7RTGcUl83N5IKbwZ8EG5SquxjiHLKbrQVBlqR0zw7p29VHbQhR+y52Y4C0ou4CF8qcpWygmy@lists.infradead.org
X-Gm-Message-State: AOJu0YyJnmvDTeoUI0lyc0UixML8iegltEnZff4X9jCc7OQD/IF6xOG4
	3QSY7BaCBULXcDFv2v7gtTE+N6BI6H2I2wzrNHlKT6qSaX94rDJNSJ3/jUSaweP13Ig=
X-Gm-Gg: ASbGnct222CQ7fLbRPER5HVUN94ozoPvmmpB39/ruSMVjfZB3r0d9uiq+g4Zj17Gfzu
	E4glm+35woICrMNX78LrEJH2pCzm69AFQcQ9ooiK1zaLzEQM0qy53qg9iVLS2dxquk6Sp4lXkIp
	Hw/1X/IC5oC8ZOhpQX7XfPkJgQ85Th1gL3f47VOxiVrusNbl5FmruW1/zYVNcR1sWvj01PCUG1g
	oVr4mOOgQw2K/tEl8B5tga1Vnc1BR/r+PtLHzTLzYDcXewaQtpP0yxko2W46TOaxD0d1EPYysF9
	SAekEr7y6LwwfIbDaNHmSPFCeBhVCRoQ2adi4xp2cubktp/hfKUDkoZdra8y1R+PpvlCCrhbiQV
	07wCGi+hNyRs1YHlZLP+nNoMMBDHLHsk=
X-Google-Smtp-Source: AGHT+IEfpImoo2zYBpYt2BN1pDYojgLhRO7Rhajj0yKSOBhITg9cGOeeQi2GsaQb0mQqp5FnSKDG/A==
X-Received: by 2002:a05:6a21:328d:b0:23d:ac50:3339 with SMTP id adf61e73a8af0-24340d2c073mr175396637.29.1755800864449;
        Thu, 21 Aug 2025 11:27:44 -0700 (PDT)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fe3287sm5319640a12.15.2025.08.21.11.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 11:27:43 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Beleswar Padhi <b-padhi@ti.com>, linux@armlinux.org.uk, arnd@arndb.de
Cc: krzk@kernel.org, afd@ti.com, u-kumar1@ti.com, praneeth@ti.com,
 b-padhi@ti.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm: multi_v7_defconfig: Enable more OMAP related
 configs
In-Reply-To: <20250819101137.2878336-1-b-padhi@ti.com>
References: <20250819101137.2878336-1-b-padhi@ti.com>
Date: Thu, 21 Aug 2025 11:27:43 -0700
Message-ID: <7hy0rc4jj4.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_112745_786181_092EC5EA 
X-CRM114-Status: UNSURE (   8.77  )
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

Beleswar Padhi <b-padhi@ti.com> writes:

> This allows us to enable various peripherals in the TI OMAP family
> platforms like AM571X-IDK, AM572X-IDK, AM574X-IDK, AM57XX-BEAGLE-X15,
> AM57XX-EVM using the multi_v7_defconfig, instead of only with the
> OMAP specific defconfigs.
>
> DRM_PANEL_OSD_OSD101T2587_53TS:
> Enables OSD LCD panel support used in AM57XX evaluation modules.
>
> SPI_TI_QSPI:
> Enables TI's QSPI master controller driver for accessing flash devices
> on OMAP5 platforms.
>
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>

Boot tested on am437x-gp-evm and am57xx-beagle-x15

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

Kevin

