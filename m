Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8877C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 17:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NYm5ir7LkLJDnjv+SaAFsFrJ7Hx7YQhrcQHfD+xKsD0=; b=mtagQuYCNqcjtXVuAWpu5eo9XY
	/PlAuJ0uIwRt9z3nJk43C9wwjk65MwJWtfVO5Cz/9NGoU4PpRXrvRjINHaCyJybbtEdJ9UOb6ogPG
	jMJb2KoLkOFM64mwbRouFR2cg1volTNrxcCIkE+1IK15E+oVQELeujRzooSegcUcqjX+ziFCuAPbq
	uQxq0VI/cozB5pYPf+jfvd2ADqmxOGse1onEqO5dIRiq5OEyfE9KowLBhhCZw6v0qJjZfO5FDJzQ0
	aMaUvXxPu1viaxwLKBBnCIYJO2CkiCaFAytYjWYf1q9YvRZ0jfalr8b/Cv2EeC/QeQdHdNc2jVPDo
	BCvwZHHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFGBN-0000000Ftid-1ecC;
	Wed, 14 May 2025 17:46:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDip-0000000FWfS-0YD2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 15:08:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D60B04A2FD;
	Wed, 14 May 2025 15:08:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BEBEC4CEE3;
	Wed, 14 May 2025 15:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235318;
	bh=dkUlkhBMN1t5KmsuDVUB+kb6HjGenkUO4srDC9L1fQ0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=TzaJryF4QEbqCY9JT5vXe7oyF7HcBzwcsyH8Dy8zfU1XzVYj0rUfz7AAI4slg/IKW
	 k19zDKyuLgxgcmcG9Hc2NoKOliC1Xhhok1Dfd3/x9niP13rJYiiRf8qCNdLsYjmRx5
	 rx1NmjYLze6uOKuSr5K/ptr5f0epDCoNDpvjiUB43rdUaUecMqy6YKdHj/XSGHSSnr
	 x02MaB7brWzbHBl5ye48rg98iPOxwlJdgtrx3qKqArufS7ATM9VCcwxd+AEjvuXKSx
	 S/6L+hpht9awAX4As2CKVy2Yv5lXW8AwgGx8PJs0UuBebJFab5v82GFpoP6cFGtzwl
	 74tFcd5pmyqPA==
Message-ID: <a509a73e96ff6875c9c5d09b6f12d35e@kernel.org>
Date: Wed, 14 May 2025 15:08:35 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Ryan Walklin" <ryan@testtoast.com>
Subject: Re: [PATCH v10 01/11] drm: sun4i: de2/de3: add mixer version enum
In-Reply-To: <20250511104042.24249-2-ryan@testtoast.com>
References: <20250511104042.24249-2-ryan@testtoast.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andre
 Przywara" <andre.przywara@arm.com>, "Chen-Yu Tsai" <wens@csie.org>, "Chris
 Morgan" <macroalpha82@gmail.com>, "Conor Dooley" <conor+dt@kernel.org>, "Daniel
 Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, "Hironori KIKUCHI" <kikuchan98@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Philippe Simons" <simons.philippe@gmail.com>, "Rob
 Herring" <robh@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Stephen
 Boyd" <sboyd@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_080839_189909_4EACD1FA 
X-CRM114-Status: UNSURE (   6.03  )
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

On Sun, 11 May 2025 22:31:10 +1200, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> The Allwinner DE2 and DE3 display engine mixers are currently identified
> by a simple boolean flag. This will not scale to support additional DE
> variants.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

