Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6672FD375E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 13:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2iXmGHfS/NXEAjPWYjEaZZnH6x43O895hkr7rfUvYE=; b=h6BwG3IPEN3uwXR1FUaD866I5i
	6BZJ2Xp6onR9fWdx8ceOJeGBxf09MR1C8R+OinRM9EV2duprEyXFZRlYAcfSj+PQyR5vw2uSDhKIU
	GQ9rxca8iMNzggIGpGYSB/kTjtIqWldlipd2mEHwXtWiMfDngeiTV2hU/sSJhcoyKsW2SJ3aN42TZ
	AWcggpTgLuUBj7jkHfusSxv7HNHF7V4vCA7RhJhSMZSHJGYYhEEfaTaDFRhNAEQ98QMKAxfqyH6Q+
	CQ0CI3hiW0kamujpqNeDxHU6PABpizVPnCXij+Nf6EtX3uoqlyvtHiiW4SOqHNUxJAPxtpxpprrbP
	rf5IjG1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEhT-000000043Dc-3oWR;
	Wed, 25 Feb 2026 13:13:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEhO-0000000437U-1KwB;
	Wed, 25 Feb 2026 13:13:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772025184;
	bh=9nwd6J7vPnLix9sIrT5JA6n5SKgLQzROMtQ/2zyqkUs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=im/XYZ3U7IBhKG3hMNpSZWXbSP/UCDRog0YG9LEu7mEp1bG+o+4sWRgyAuLVyCqcI
	 CT+ZeiXosUlmLTmSYDOF8SgWapuK75nNR30kxOX5vO12K7jwqKhguRAY43oV7rcGeK
	 cq7mc4QU50wRSpWWx49+OeavS5BvZnpT2C67V48sD1ngD6dUdEJteEpdx35KNxhx7V
	 vOweyG4ifkrlwyCGW57RvyZ0RP4O5C7wJ34ShQ5Ff4O69TZMczxVZEFy5lyLjkj967
	 +okSWbtLufruEAsiytKqUcsK61lQv51b918iVvytlxippO+oNLxc+ys3/UbDx7L1+u
	 7XLGx1wl0eWAQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6A3E117E0D91;
	Wed, 25 Feb 2026 14:13:03 +0100 (CET)
Message-ID: <d028150f-0202-4816-a8d1-dfd35eb75fa2@collabora.com>
Date: Wed, 25 Feb 2026 14:13:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] PCI: mediatek-gen3: Split out device power helpers
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260225072225.3345307-1-wenst@chromium.org>
 <20260225072225.3345307-4-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260225072225.3345307-4-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_051306_517539_6DF0A383 
X-CRM114-Status: GOOD (  11.17  )
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

Il 25/02/26 08:22, Chen-Yu Tsai ha scritto:
> Split out existing code that deals with device power sequencing into
> into helpers to allow cleaning up the error paths and integrating the
> new PCI pwrctrl API,
> 
> This change is purely code movement.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

I was really about to (and really wrote 80% of it) write a comment saying
that this is not really doing power up, but then I looked at the other
patches before continuing.

Eh, I agree about doing what you're doing in this number of steps, but please
write that spoiler in the commit description here :-)

Something along the lines of...

In preparation for adding full power on/off control with the pwrctrl API, split
out the existing code that only partially deals with device power sequencing into
separate helper functions.

This is purely moving code around, and brings no functional changes.

After which:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



