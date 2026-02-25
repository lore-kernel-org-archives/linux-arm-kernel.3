Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A119DEFD210
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgX2ufhVZCTAL1NTg8w1yhGJAh/USfVuKSM7DBjgMR8=; b=UlYMK7AlnkcRTR3JKPrlVexpsm
	/QtVMf8h6jIb8RgYerLOHzlndJSPC6t7gvHdk7qYr8zwTWSzBqkUEtDL8QykLxPL2Cdzsd9Oz3LKT
	vUEw+9+6ZP/BvKcRcxT2zHT1w/nsYJTqY1Ae2MCIQsxS6dqF5Hvn53UlsnbIIQ9emUuM7cHQi/Vsg
	SsKcq7ebNrh0YW0fSwRefb/BLZ6yir0MQnq2ZrxR6MGfosrQo58EjAWVlgF55oDELXQlF2EgYetwK
	/eVf2Z/m93g+aKY4joaynemsSf3GCu9wMQrYvRNpQvLqcFU/OFOuJBSVxzVi8kvtOPS2XuScgGK6+
	C1GpCqXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBE2-00000003hGR-43fj;
	Wed, 25 Feb 2026 09:30:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBE0-00000003hFo-49JH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:30:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D3AF43268
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 09:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D592C116D0
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772011832;
	bh=tgX2ufhVZCTAL1NTg8w1yhGJAh/USfVuKSM7DBjgMR8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=fowSnKKEm4fHikNKB4BabbhKAzxeXI6LGz3TkD3gtKt4g/+3t4B7kQQZy7PHFe5j3
	 tnEk54CGQINMr++1x/Am1zO4PZKaopCaB+vXli98wvnmXItckoiqtfcYB2xazSPPPJ
	 ah9HgyBkiDZHXtPferiMEb9j0yP60q6x3W/UFfC3enjUAASJfsaRZR4cNkYbY86CFt
	 MhLWragdHiz/AqrDFwfk3jeuI3TJ7cFt84QsPnRNlqyOgdKxfpFVXaZ/Lh1qq+g7zn
	 9gDGM0ykTNMeUhBpN0M5HXIbGPjfVqom6BSI9dB8eQc8jjTGMRwZ8hmTrFHbouSFdD
	 amFbz3cT5Mdlg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59e0d5c446cso7378443e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 01:30:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVRZTtWPt6MeI8Sy/rq5OtOPMFeGUvm7pYGNqSvccD273QqJ6VQeG+j5DRcTopuG36gvly9nTROi3AwkiSfmbK@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjjo0neZ7IX0QzJ8lDGRCA3K68zN25G08wYshlsN9PTWEDp+0v
	6nx17l6LvbDji3hjIbRvISqyiR1+ZW0LEKCWjhT4WuZN60DIJDdDXr/3izKJXWkw6VVmxbZvEuN
	sSsJujowfJf/PcSJkD92/n2GHXdL36uf6eTvbH84gkg==
X-Received: by 2002:a05:6512:3182:b0:59e:465c:3b1e with SMTP id
 2adb3069b0e04-5a0ed9ba9bemr4936252e87.41.1772011830831; Wed, 25 Feb 2026
 01:30:30 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Feb 2026 01:30:29 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Feb 2026 01:30:29 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260225072225.3345307-6-wenst@chromium.org>
MIME-Version: 1.0
References: <20260225072225.3345307-1-wenst@chromium.org> <20260225072225.3345307-6-wenst@chromium.org>
Date: Wed, 25 Feb 2026 01:30:29 -0800
X-Gmail-Original-Message-ID: <CAMRc=MehRxdoip8++NfwU_WEJ+yYuC1=2BRv8Ry9VytU=YvR=Q@mail.gmail.com>
X-Gm-Features: AaiRm51bPAVR6-cFrrbBYu5wRc1Q4V_S6sKtepwE42bww4kXXIDbH_qqtlNCRK8
Message-ID: <CAMRc=MehRxdoip8++NfwU_WEJ+yYuC1=2BRv8Ry9VytU=YvR=Q@mail.gmail.com>
Subject: Re: [PATCH 5/7] PCI: mediatek-gen3: Integrate new pwrctrl API
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_013033_068786_1DE2093F 
X-CRM114-Status: UNSURE (   9.09  )
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

On Wed, 25 Feb 2026 08:22:22 +0100, Chen-Yu Tsai <wenst@chromium.org> said:
> With the new PCI pwrctrl API and PCI slot binding and power drivers, we
> now have a way to describe and power up WiFi/BT adapters connected
> through a PCIe or M.2 slot, or exploded onto the mainboard itself.
>
> Integrate the PCI pwrctrl API into the PCIe driver, so that power is
> properly enabled before PCIe link training is done, allowing the
> card to successfully be detected.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

Thanks, looks small and sweet.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

