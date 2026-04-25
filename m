Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7189FF885C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 09:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JqlN/KHnBU5XfpmlFL26PWA6fYpb/busAqJHHi846A0=; b=PhpZ/Ax62bpTHsqUzap50jQPrm
	KDQsEJJFV42RUqHOjytcDqWk7RJ8EW+2y88UQniv5vLVB209vXUbcBX1iQ5LDd9wkVve8RFnzvp2/
	f/HKiDetL6y4Hy56KSlc7GjZFx6rlmE68v0sUWFZjMaB3lmPbX05Qceb1tEdEpGphtZa69J/GeT8p
	svsXl/2DGQXoIMFopuJdIpvhtvVAgBW6gkWYMIjx1G7IoViI2ir/h0jKQ96igZg96oiZrxbJQr/4u
	E0qiBwLnviknxqjd2h2j8OSWito2ujvjIWn+2rh5GuFsYKk6rttXHW1S635fqYrQ5uKfGm+k5d0lT
	1yGPj0KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZkA-0000000EJw4-2MDW;
	Sat, 25 Apr 2026 09:56:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZk7-0000000EJvb-21Ca
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 09:56:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A3315442A9;
	Sat, 25 Apr 2026 09:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1EA9C2BCB0;
	Sat, 25 Apr 2026 09:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777110966;
	bh=WJcc1NZETmbddcBcUKF7rrXIoSuykV0QJB1jUEB7vEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YQaav5VzbXA3ZKzDIAcL2FZVk7pFwk4MWSaisn9CqO/T5tbx63RhH0O0/4h/UuDz2
	 J1HRbdWoue6NAxI5kU4UT9sL9c/e48aJlD5tb/ZEGds0rkTjaZJ+mU8cNgvx+IxSz3
	 Q10QxMOHtnmdz2CaVydUMd7IknbArXP8sqkcfI9yGr8wRyHuif6QPeJqlk4ofFIAgH
	 cpVJlKKDpZ6Z34sjVh4PBguEwDuwJ4R5vcXkMUNUnzSbNc3xOvsLmbn6lBciwJtdxj
	 4OGgw7wdjWGnINf5OSVMmxNO/zJD/pPfWMZ1gTcQCOZ8q8aeMYKqIMYGiiPjp/safH
	 XMPzpaERlmqyg==
Date: Sat, 25 Apr 2026 11:56:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Timmermann <linux@timmermann.space>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Douglas Anderson <dianders@chromium.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/5] dt-bindings: clock: samsung: Add fimd1 and vpll muxes
Message-ID: <20260425-uncovered-otter-of-sunshine-d00ed0@quoll>
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
 <20260423-manta-display-v1-3-196f80c5673a@timmermann.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260423-manta-display-v1-3-196f80c5673a@timmermann.space>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_025607_539887_04E6B2EA 
X-CRM114-Status: GOOD (  11.25  )
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

On Thu, Apr 23, 2026 at 11:14:39PM +0200, Lukas Timmermann wrote:
> Add two clocks necessary for the google-manta board
> display.
> 
> Signed-off-by: Lukas Timmermann <linux@timmermann.space>
> ---
>  include/dt-bindings/clock/exynos5250.h | 2 ++
>  1 file changed, 2 insertions(+)
>

If there is going to be any new version, better to split this and send
all SoC patches (clk + DTS) separately from DRM.

No need to resend just for that, I will pick up Samsung SoC things after
the merge window.

Best regards,
Krzysztof


