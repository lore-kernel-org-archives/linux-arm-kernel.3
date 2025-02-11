Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E95C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 09:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8GYtmwTF0P0rAhPJk96hhzjL8n+b1HpQVU7PopfhkU=; b=jgR050KiMrZ2WbPCZHrODXnnm/
	X2I6D6TrXOM8AL7rJgrMM25QgJPoGfC5JuAaldnJkiMa+NNV0kWPJ7efFujNIn5mmTshxxOZWNIqJ
	SsPuAk6U6E10UAvvFqpkCIwvlNhRkuNPParLKjiP14xn7sxOLhaaCKI1kxISrpUsEHLCWQMhpFgLL
	758bietHt3jVLQMZTxO0t91VL06j0gcWs/WX7gMr0gNwcYdHBLBUiqhEf+aJQA35ZtC1F2nRdOcM+
	BXnwpeCMtIR5of1em8J+9gT3Pfpq86IbIInkPPq34CP+FZ1Z5l9hR6bH8u/4X9beFhdCOXF42Vh8J
	MEYZXp/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thmlD-00000003Dvs-0qzs;
	Tue, 11 Feb 2025 09:40:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thleu-00000003010-3ZAH;
	Tue, 11 Feb 2025 08:30:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A65B5C0352;
	Tue, 11 Feb 2025 08:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148A9C4CEDD;
	Tue, 11 Feb 2025 08:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739262619;
	bh=38hk58Y0kLRwemhQaSYbq9+FRPzKOCdH6VSASaua6m8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q5mXKFsMYV50EQ5sGGZZgzh0OmE+815ZQh2PjS3t8fd41NZaOpuv0f6k5iFHKlitW
	 49yp1lfNGJ5OOSASgGRUE07QC/RMizUsUE2XUxlfp87lgzKBmTgPMQH+5HLoZwc7rJ
	 EmNRTRZ7+LCVvGA2lT43pEDxcQA6bOjjadbSYyHo+5Dj+olTuDf4Sn7OVrRcbOM1yq
	 Qc+Z0qFIrDaoRQqvQGH/HfDbdJdvzeRx76+Qzjvl9CUD8F0eSxVDGNPamAOG9Qsyb1
	 SijNNUevS87VgRK2t/3Y2ouT5EORaVjWLgER0Do8oH7U+EHg/4cIY7URzMF6X3YmGn
	 YOewXlG3oo6UQ==
Date: Tue, 11 Feb 2025 09:30:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/3] drm/panfrost: Add support for Mali on the MT8370
 SoC
Message-ID: <20250211-sociable-buzzard-of-enhancement-dfd4f0@krzk-bin>
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
 <20250207-mt8370-enable-gpu-v3-2-75e9b902f9c1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250207-mt8370-enable-gpu-v3-2-75e9b902f9c1@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_003020_942920_7232224A 
X-CRM114-Status: GOOD (  13.60  )
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

On Fri, Feb 07, 2025 at 04:18:31PM +0100, Louis-Alexis Eyraud wrote:
> Add a compatible for the MediaTek MT8370 SoC, with an
> integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core),
> with the same platform data as MT8186 (one regulator, two power
> domains).
> Despite their different GPU architecture (making them not being
> compatible), the MT8186 platform data can still be used for MT8370
> because it only describes supplies, pm_domains and enablement of power
> management features in the panfrost driver.
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


