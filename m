Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16D4CE8E8B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bi6mCQhIPYOdEThiFh59znz+QIxYAc3VWDTwjZN3srI=; b=Tm38O48SfH7NHpPunOte1eJnYl
	ffCPoxY18vWsNd5hNWkoqGUNZyIEAkD1FNnRjnU8VLUqyXMlXFrdXOqETnjR2eVM0qPCKHtbSOoDc
	QpRNkpKESdbtTkjBKU7rEoZGe9wTkHxPqnmZ9DDpZbRm/1ExtnpQTmp43jxBHBjmRhZUszXySK83G
	JF/7/yRQpQ61KCeqnb4f0oesmlQnNF3gmyVNJ0CgwyHbT5FQGXSNLNA5SQTvw+MkAAD+gajctGfTh
	tqoVVs3u/eIH+fQdwPU/kOcvpw9k3qVCdjgjVZVmyDa1xtZvxFWoZkCLru1+8jezAgmHLigwZZgMN
	qoIId4hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zhE-00000000tv6-1Ba1;
	Thu, 24 Oct 2024 15:24:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zUe-00000000sHP-13aT;
	Thu, 24 Oct 2024 15:13:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E27665C4B3B;
	Thu, 24 Oct 2024 15:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2673C4CEC7;
	Thu, 24 Oct 2024 15:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729782679;
	bh=I76Gec9xgruH7NQkJwJSzMFNiwa11T/xDsEdrENqZqc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=eecpF2i6nIOyz1a7oqzObncQ22J0O0Li2FE+nn49+jrs8lQ31Zm3M6QoqBuLBpPZT
	 yJXvJVHaKsqyAIcnf9GESQF/M3UErCbD5Cw1qwi7TZM96TsRyivmRuHNq4twPmtdri
	 l9gYBKyoO9Zlv6R1wcscx91VUsQWDLFtVTLe2GVky3TZ2FWhxhG2uA8N8Sot+fdUk3
	 OnJ03gBx4abnmCD4+Fd7eENwa/aEuGVrY7tg0phennnE1coK1bIs5FD8JBhJhhASR2
	 iC/bqhMPNaTvkLDuDIeYMA0DaUlPM/IiTisRcDr4JuHFfdKFio+oDT9n2JUV3HOr8q
	 6xfQ6wjA2u3HQ==
Message-ID: <9202d665c15915cb087d8be5f02fee4c@kernel.org>
Date: Thu, 24 Oct 2024 15:11:16 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 29/37] drm/vc4: Drop planes that are completely
 off-screen or 0 crtc size
In-Reply-To: <20241023-drm-vc4-2712-support-v1-29-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-29-1cc2d5594907@raspberrypi.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Conor Dooley" <conor+dt@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Florian Fainelli" <florian.fainelli@broadcom.com>, "Javier
 Martinez Canillas" <javierm@redhat.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Michael Turquette" <mturquette@baylibre.com>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Ray Jui" <rjui@broadcom.com>, "Rob
 Herring" <robh@kernel.org>, "Scott Branden" <sbranden@broadcom.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Stephen Boyd" <sboyd@kernel.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Will Deacon" <will@kernel.org>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_081120_370714_62285E9A 
X-CRM114-Status: UNSURE (   6.15  )
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

On Wed, 23 Oct 2024 17:50:26 +0100, Dave Stevenson wrote:
> It is permitted for a plane to be configured such that none
> of it is on-screen via either negative dest rectangle X,Y
> offset, or an offset that is greater than the crtc dimensions.
> 
> These planes were resized via drm_atomic_helper_check_plane_state
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

