Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0EAD1036C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 20:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F36id+AIqsONpqm3yv5PxFdWKkbeY3XJ5apfPsizs54=; b=McTTkuDJTBvGXxx57vFePnQCVY
	Cqk8fhhGnjG2zcXonMMCnVou392MwAdQ6DiER5eIb69Ee6S4v+MXATzAbyJraSTwifxtQAw0t1xns
	M2dPgpQa+gwFOICIWgVdAz0NHU+hsNuACs8uP2RC3nTaAbpe4ZG01QeIO6YK/0JYd+cJDuDBgOGrC
	kEiVzhwqqKPuX55mCfY5PgXJ4mPTFvY6X6BN8tJwhGrSaNbgoVs4od9ZpXS+oPCgUjDSRKr45V1X6
	i7IXmsmCZw/RMUnGSVGqFpp6zMEhj+AxF7lmENZ31v7IJFsca5JJKPA565BJ/AqLBGK628HnPVx39
	gLqA4iMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t44pd-00000001nO1-3DpE;
	Thu, 24 Oct 2024 20:53:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44eG-00000001l9P-0Wtw;
	Thu, 24 Oct 2024 20:41:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DE7625C57C2;
	Thu, 24 Oct 2024 20:41:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08A8C4CEC7;
	Thu, 24 Oct 2024 20:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729802495;
	bh=2DFjeejvSg1/g8YEFkWGIl9SUrFAuPI0K/9R2+B0tbk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G8vXDmcopDAg+E6IfwWfxt1SIi2OTrV+p57757L56J6DkFbVeASNzKsKhgbKtVMR+
	 m4FKkc6IoNmfyY4eoY830QK2WvC/1QV4hHcVfH++XYiy3yIsslT3e3VpANdo8YoyEr
	 gd5OnOjtpOGjEQy1akqGvger/7vuEbbFGryxT/8uikHxKosd9V1f28Yc/EF3wf4r4K
	 pTWRIjm8aynFXwoszlvKl81h+ii9bGjFQc509GWr5VCMYT8uMc9P0TfIyeorO0WKkK
	 LE5FxJ4J+9E3cnmu5qK8vOfsaVYyDtqyUYcgdpGGvzcmWglnHHI0R6i8/PNqGWvFLX
	 aRdDlFd3jc+jw==
Date: Thu, 24 Oct 2024 15:41:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, Scott Branden <sbranden@broadcom.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
	Ray Jui <rjui@broadcom.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, Will Deacon <will@kernel.org>,
	linux-rpi-kernel@lists.infradead.org,
	Javier Martinez Canillas <javierm@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
	devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 08/37] dt-bindings: display: Add BCM2712 MOPLET bindings
Message-ID: <172980249374.1014064.8269086234792348096.robh@kernel.org>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
 <20241023-drm-vc4-2712-support-v1-8-1cc2d5594907@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-drm-vc4-2712-support-v1-8-1cc2d5594907@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_134136_226532_CA73CFBE 
X-CRM114-Status: GOOD (  11.20  )
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


On Wed, 23 Oct 2024 17:50:05 +0100, Dave Stevenson wrote:
> From: Maxime Ripard <mripard@kernel.org>
> 
> The BCM2712 has a MOPLET controller which is basically a TXP without the
> transpose feature.
> 
> Express that by adding a new compatible for it.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


