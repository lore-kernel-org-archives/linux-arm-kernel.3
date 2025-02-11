Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406B4C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 08:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkOLO3+N7FDczkhby7I7NSNhK0zE55+iVoHuoQGhHfU=; b=S6ivwf1J3P7LtUH8r+zEd+sg59
	QwTLOnXiEMcHVd8wRRl8f3WEdXZnSquqrpS1qXVPyAhTdgPjHuZjGK4/QQor+QJM1n/Cy74GveRqD
	LiYWzOTU4fo/zz5vnpSp9u64+g02iBzyqVfdQkc326trHt8sS+duTWAdF88OgggjcEIieT98VMBRC
	k01pqL7dvPpu8wq/gdI489I+7h0G7CWZHobBMk9tju4WrFthd1IZWvpIq6G/15kLGczZS2yV/lBoN
	25vgkDWzdzjOCDicd3dlZX+k0SA3XUm0DtJZp/LcNHULaAfsnzxPSlMSXhDqzYAAT2wVUf8ZTiZt3
	VNCkkjxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlg6-0000000309O-2CRd;
	Tue, 11 Feb 2025 08:31:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlei-00000002zyq-0iyW;
	Tue, 11 Feb 2025 08:30:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KkOLO3+N7FDczkhby7I7NSNhK0zE55+iVoHuoQGhHfU=; b=LJtzUx+ulhZt4G+JPmklhp3CQy
	VpW+z8s/lxKZ4MNnArQTuL0wywYBXT6EGP572JGISeMb63hMwOP3biQtyOOHA9ZobmIXCi0Fa4qDO
	ZRqZXR0nPoO6V1CVzGYR/St6q6qBXhhO1TtPbdcW4hu+L5W60uQharMvvH4i2RUrrUhWbGnLHjFP0
	wQclO2rsYi95uCGdpqy02Vu/fE4m7wnUSNDomXT9PQmYM4OiBUYbXk3S+hrnqBzvuzJzNivm8pZsG
	pNyMVjITPiLaZJcsPkIAaem9qAxD1YjKV5H9MXYXPOuAwj2tCGg7t53ylopRnjt9+Mrs9sPpfawNu
	P6dW+RWA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlee-00000000Wmj-3SLG;
	Tue, 11 Feb 2025 08:30:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB97B5C0352;
	Tue, 11 Feb 2025 08:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18BD5C4CEDD;
	Tue, 11 Feb 2025 08:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739262603;
	bh=KkOLO3+N7FDczkhby7I7NSNhK0zE55+iVoHuoQGhHfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GPsM920zDczb0Yxbv7ZH2WHn+G3xOMFEpF64NBqd6gsSIm5tbxc1IKsEdAfvHv2Fw
	 0W++zDfDwxRFm66KqDgAtlEydhrenhMuobv6sz8L+ACiLe13VptrzGPOWk5z7XADrX
	 +3cgoSS6WfiH7G5PmPuX+HpYdMlTM+VbPGejhQZOcJ4OdMv8h0VICBos6cZvJDU6Y5
	 IVe/TmIqD4eHPMzO4XKk0YkpPkCe2gs3S8H76b4tmE42OXc0huuELbovx04aoD0Zol
	 DoTkj8SHhx8n8GuOJgYIGT+upF+Q78k/WbBj/LcnUgUzVZ7MEQdhHIa9WF66oXtfq4
	 Fw2UlaZeNpYhw==
Date: Tue, 11 Feb 2025 09:29:59 +0100
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
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Add compatible
 for MT8370 SoC
Message-ID: <20250211-judicious-tentacled-chihuahua-9bb5b6@krzk-bin>
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
 <20250207-mt8370-enable-gpu-v3-1-75e9b902f9c1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250207-mt8370-enable-gpu-v3-1-75e9b902f9c1@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_083005_377573_642335B9 
X-CRM114-Status: GOOD (  10.97  )
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

On Fri, Feb 07, 2025 at 04:18:30PM +0100, Louis-Alexis Eyraud wrote:
> Add a compatible for the MediaTek MT8370 SoC, with an
> integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core).
> This new compatible is needed for this SoC support, as the other

You *always* need new compatible.

> existing compatibles for the same GPU architecture (MT8188, MT8192) do
> not match the required power domain number.
> The other compatibles (especially MT8186) cannot be reused because of
> GPU architecture difference.

Just FYI: you must not *ever* reuse compatibles. What you wanted is to
mark devices compatible and not. You claim devices are not compatible
because of this and that.

Please fix the commit msg because I am afraid later people will use it:
"I can reuse the compatible because that commit msg was acked".


Best regards,
Krzysztof


