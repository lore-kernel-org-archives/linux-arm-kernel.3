Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE29CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 08:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p7pKyNA9FpM16bPv2DdpzmWw+QEihEoj3yCYqDynJko=; b=aDtlkRPzRJoD5JA6PAlQSpLHh4
	rkDh1RtONA2fu5nhSYDp5vWJJ1xjyISaqHsXTs9t979VVWFAGNrwN7ihTqqByla9THeNOWVgfmsTy
	o/0PH/pzICJW29gPt6XXmw0Qhf2W3V/di1sbEnxoyM8OuVzwfp91Bytb/Hu2gzZd+LpYm6fcgdWYz
	7kAxA1lrITHbVCuSBf5A26lMAoL/5lme0KmiQeg9n7UgH1O4VB9NZnBX9906a2AVp0ijaktQDL2mm
	lFxgnxxDcKLZR7s3t9S6hlNoy9mkcxxAJ8cddjo9wGbFrqxxHQs5kj96GSHmwfKW0WxAvAPNoq26U
	0nSA9VQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xLQ-000000011di-3yNI;
	Wed, 15 Oct 2025 08:58:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8xLO-000000011cm-108b;
	Wed, 15 Oct 2025 08:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760518727;
	bh=QAdqNSEgBGHVX/qNLhebNe+uGdl6xTXjyZ1RRQvJ4Vw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RN3nQiyFJ6buk9Z+jA8ayDgIoLJGBNukuUNUoK0a7r3RUyYMMrgAt6Cg52FzXVqgp
	 oQfYv2GD7RAdAPwG4zUslrpf1UWlGX4JiJo52kfEbSwd9dEgaohMwQwXn8Y3TzgM5r
	 xzn0asGUn53DL0yH8oHjE+df1ugQc+r1yJQPmLFA9+Z4Yl2uvpasGH7iNjf+RqFavh
	 VEERtTiV5pJSuvqenQTHnzD8gIouNIipLbxtR8CT11S6tTn+d8hzwOUJPGbUgYsT7g
	 U1gjlbxtwF8BTbw0WnLH++6j9gSDVde0PBZM4L0QcH4k0NLvaX9WAfIxduQnJF25h1
	 cmK2NAS6WaAFA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D285C17E12EB;
	Wed, 15 Oct 2025 10:58:46 +0200 (CEST)
Message-ID: <21691007-7622-4c45-9c02-011d44c97f15@collabora.com>
Date: Wed, 15 Oct 2025 10:58:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] drm/panthor: Use existing OPP table if present
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251015-mt8196-gpufreq-v7-0-0a6435da2080@collabora.com>
 <20251015-mt8196-gpufreq-v7-4-0a6435da2080@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251015-mt8196-gpufreq-v7-4-0a6435da2080@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_015850_462786_8F6BEFD1 
X-CRM114-Status: UNSURE (   7.78  )
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

Il 15/10/25 10:50, Nicolas Frattaroli ha scritto:
> On SoCs where the GPU's power-domain is in charge of setting performance
> levels, the OPP table of the GPU node will have already been populated
> during said power-domain's attach_dev operation.
> 
> To avoid initialising an OPP table twice, only set the OPP regulator and
> the OPPs from DT if there's no OPP table present.
> 
> Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



