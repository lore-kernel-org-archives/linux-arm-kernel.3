Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810BDCAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JN7K9r+dzHKTA9sjq9YxaEHN1qEsQC8Mj11MCX5hNsY=; b=DFip95XGphmbdpKwOweLFG9oEv
	TKJP9g9Q8EW7SVccgoLCgzBvZ1IWJEuX9SoTHMLV/XA6nfXe4Cv/heUkse5D+6m4kiThxPmyXcYrm
	I6AngQWT8BE8vPdt98ZNAgjCwXkJmoenh43Ae1Af1dq8HW+3BOpCHtQsPpLeoMJOzRxrLlubuwXRc
	wPo1pUpVamVdmpy12j0SZk8NQ8KYZOOQFWLu/JrOND8qqd2NfxS788orE9d18dwFECcf50u+5up5I
	B+9W735Pyr2XR1aN7drL07RAFzZ+LIZ5lclKJR0ZV72Fg3E3lcPTYc9NGewzEJf/dk/HXw22QXj58
	0ei4oYnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Ys-00000003ht2-1ebZ;
	Mon, 15 Sep 2025 10:35:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Yp-00000003hov-2ke6;
	Mon, 15 Sep 2025 10:35:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757932549;
	bh=Aa9ZL/X4bPp5w+MdeWDS3WTgkxlZOjtygj8nuNk04VI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SrkMRLFTOcFjgV9yFNegoLT/ZRb1CVY72iNiyvsXeuXc4Axco+sF4rY/tFgkN695c
	 BnLsEU2JJgLEdSMy+vI9TM1tXpQw+wBDkT1oNuGWzudFXMCNpCHlR57hCo95NCO0T+
	 uf9mN7B2uGSO4goFhVSymjNxGjwSmvUx3XKe+mqYk8FOg0nDEzhDR6y2rLBm0vVG7j
	 n4cH/RMvB+UrwtnTfizGo6ej0wSBCuSwy/LMDSltg/Owb1f7W8u8FCzLYW938vRO/k
	 /1RbFElNXZt6wHIMJUIGqxe3mrIss94YK8GWgOQpNsVBEIrbmNEdMtPVgpQrBvlHcL
	 dKv11E22Gx+9w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6155817E0147;
	Mon, 15 Sep 2025 12:35:48 +0200 (CEST)
Message-ID: <982e21c1-b929-4921-aadb-2ce8ab573cfd@collabora.com>
Date: Mon, 15 Sep 2025 12:35:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/10] drm/panthor: call into devfreq for current
 frequency
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com>
 <20250912-mt8196-gpufreq-v2-6-779a8a3729d9@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250912-mt8196-gpufreq-v2-6-779a8a3729d9@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_033551_885315_A191E73C 
X-CRM114-Status: UNSURE (   9.92  )
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

Il 12/09/25 20:37, Nicolas Frattaroli ha scritto:
> As it stands, panthor keeps a cached current frequency value for when it
> wants to retrieve it. This doesn't work well for when things might
> switch frequency without panthor's knowledge.
> 
> Instead, implement the get_cur_freq operation, and expose it through a
> helper function to the rest of panthor.
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



