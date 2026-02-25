Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C14FD375D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 13:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JkFKmLFoS5VyjvW2tMtlrEbUDAOIi7gXZRzyh13CmhQ=; b=Gzt/94nKmb3h564weDW2oSefh/
	fGnCy5SzHPxvtPgidvKLhvH+GNsHyFUYlOS20MtlaNQm7CXytN1aAcV4NAJpIQx4w9rPnmYCXYuhp
	1WCT4LUxOix3atvAFc5z9BRd86UtO1O9Xs2DRPP3aowe2VkCqiaLbzPw25iqZV+bZQqouggJpOb11
	vfttKXmi/ksp7nBhfxTaUKnTy82i8cgDITijm8QMrvWr/JErLzE20XAFPRVCq2Q7QV9HCY8OXk7zJ
	yIgedJILku+SeKLCKJbQB3suvQEP7yiBU8B3YNFBv8QkWznIzm7DzcvKJh84tH0YIEO2YtASm1cTY
	BZ40agMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEhU-000000043Ek-29Rw;
	Wed, 25 Feb 2026 13:13:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvEhP-00000004380-1049;
	Wed, 25 Feb 2026 13:13:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772025185;
	bh=FgRCrpuX9seBlaU1PRhdPC/qxo2FBhcMug3D6AadulA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JRn23u/l2T3tKj9C2Fr4FErYoYMWhOpx5JPV7WuEopb1h+sB5pJCemXN3/XD5cmfF
	 e6I+g1IVb+ZoVrdMp2HcquuFcrsWeIhMC+tBUhoMhc0xBL43lXnXPSQJ8OHl3KF0Oy
	 pk5va31bzFHI8tmNpVFz7Cu5CPBIEtWIiOFoSgZefBFXMVXJu5uLXlkeSFibc1tYtf
	 h/0GsCR+KWQu9MJrP1okzqyRAq7iPJlJyiz09yjC2FoACoDyFzAFe4VjZBLtl2PG7m
	 fDzhWzlo4MvCGedcrzWJGitzVMkLwypJhl4yLEuzcIYtV10/dtcekwPIPoDfRgfOhX
	 esfbnvhHQH9mA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E327C17E0D98;
	Wed, 25 Feb 2026 14:13:04 +0100 (CET)
Message-ID: <e0204fbb-4d82-44ec-a381-c030098ef86a@collabora.com>
Date: Wed, 25 Feb 2026 14:13:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] PCI: mediatek-gen3: Add error path for probe and
 resume driver callbacks
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
 <20260225072225.3345307-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260225072225.3345307-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_051307_424046_91B6D423 
X-CRM114-Status: UNSURE (   8.60  )
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

Il 25/02/26 08:22, Chen-Yu Tsai ha scritto:
> The probe and resume callbacks currently do teardown in the conditional
> block directly. This is going to get ugly when the pwrctrl calls are
> added.
> 
> Move the teardown to proper error cleanup paths.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Though I don't exactly like it that much, you have a "more than just good" reason,
and that's enough for me to say

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


