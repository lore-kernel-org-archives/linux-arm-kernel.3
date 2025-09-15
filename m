Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C37CAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 07:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9r0NTBjMRLmViX1/orZM70VA6x5TI9zFVuJCO9Rssw=; b=eSUhn0zlwvirLbLKKnHweNC2hx
	bczVWnehQFf/gZAYoyl9d1ocJQaXK8ZDIA44KdWQoEY4byyRJ3c14mkrTUEZ8tFB0wI2eypnFXy39
	AqAnKU/YazDuC9Y+KWuS073w3doxba2N4y3UFDAGNR2/+54wrYAQgHwPBzCnQJi0GZZ21VQwXG0vL
	Y6ihF718ifM9+GJ52svhbSQ1mMaY0IMMXtKkC821UuKPabsoOArXXbN3FIeRIy/9J8V0eTsHjLfyH
	ZPT2VHefXBaUge0Q7S86ztP6n/FN7DFfTe3m0/NTI5QRTTh+n9WlDOUkNZcufFDsBpANb1JED1tNE
	rH5p+u5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy3cl-000000033D8-43uq;
	Mon, 15 Sep 2025 07:27:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy3ce-00000003398-2nhd;
	Mon, 15 Sep 2025 07:27:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757921254;
	bh=acYdBQRMn1GotwBcF1WuY0UzMn2r5EOA0u50gZ+ILks=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XYbdN0x5UgXIEjRUD4CIwbR4JQt62M3ErbIYsir8u0tF/yIli7gjz6ECseABqJNef
	 jlm14tKEbU1G7YGavrNzKMlu5jNMZnUacosLi8i3oLWGewTJbGkPamfN0capXrXbXR
	 5mgFrL25bDhc6OHb9vEfSzJy4FvNm6YaYcZNF894apqamfW/OwHPF3HcMxo60H2Nos
	 vVgn2n9LkgSF6OvYysoA7W9C0unYDYMTwJNHrX9wfc9xauTHDzV9238z+8MIrIji5e
	 S6V2mkoX+FH1ZTGpVCrJHdWCiXDOnSOnRNOyAcxIj+4vAJxuav3HrmuD4RoFbR6eGI
	 bnlMbVyC/ABAA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA3B217E0FC7;
	Mon, 15 Sep 2025 09:27:33 +0200 (CEST)
Message-ID: <4cfe7595-9eb1-4b9b-b4dc-0803731d03b7@collabora.com>
Date: Mon, 15 Sep 2025 09:27:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] pinctrl: mediatek: Add debounce times for MT6878
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250914-mt6878-pinctrl-support-v2-0-254731aa3fc2@mentallysanemainliners.org>
 <20250914-mt6878-pinctrl-support-v2-2-254731aa3fc2@mentallysanemainliners.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250914-mt6878-pinctrl-support-v2-2-254731aa3fc2@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_002736_887883_D24EF821 
X-CRM114-Status: UNSURE (   7.25  )
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

Il 14/09/25 16:52, Igor Belwon ha scritto:
> MT6878 uses different debounce times than other SoCs. Add them to the
> EINT driver.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



