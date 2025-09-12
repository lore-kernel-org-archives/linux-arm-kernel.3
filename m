Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2487FCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 22:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7vCHc3e+Jy8US7hTTy4b9nsVzGf6UZv+0sVA7/a1y0=; b=v22YWU6kSXEszyaRAV9pisZDK6
	nC9h46hH6IM/mJHCKwySarbiftl8DtPbWG8MuvaLm8fIGPkpz5EQF/Pl+QTjqQIdgNP5AIIVn0Jdd
	19CbOGR4+iYb7FpF+nNUP5lKrBHU+eSDD7VeH+f66dE5AfrKOHCE0IXE4MHzvmSTqRoXw7F3UheaP
	qjaDUgWzYWCrKAdF3SEHnus8OHHcyIgs46OV4g4Dk8SQ69Qi3AA3Ze6ezT3GKNtXY0BNleG2U4q9u
	vTAw09Hi1OXbiBgRsmO4P4F7YFJMnKkyRlwk6KzCha+V4IygzFTQb0ekYv6OuLEppp+L/+jBBfuEL
	fMkeLctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxCSo-0000000Bu9N-1m4M;
	Fri, 12 Sep 2025 22:41:54 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxCSl-0000000Bu8H-09Sk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 22:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=B7vC
	Hc3e+Jy8US7hTTy4b9nsVzGf6UZv+0sVA7/a1y0=; b=Um4WpDQHJJyoDGQGUJlI
	toL1eJ4r/frk7kDy23UEC+FfwIbkQz4MH6fuLgWvXFnQduOCP5AoGVhUs39qkWr3
	9ylizJqtxlvx0xAlC/TQCGxQ8hsYkxw+hVAf6f6dLucBZTPJdQ6qEJ1wAYsPd89B
	t1ZkgBrTCdMg5XVpi/QmQz7vjWDanBQ6xeBdnj8Z40H9V03PzIYAOiK1Q1NKWXvi
	m8+1B6eiVmNMaemuGDOlZEU7TrGi2cyxePRXVPDRhFT0grEQhbQ2gH3hO1q5lmY/
	uY7NwOdVj651c0bX4GJzSW042wt+udthFxosn9FeRvj/aYA4cD0WuEXRh8H9KbNM
	CA==
Received: (qmail 1506839 invoked from network); 13 Sep 2025 00:41:46 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2025 00:41:46 +0200
X-UD-Smtp-Session: l3s3148p1@rqzUW6I+mq0gAQnoAHJ8AC93OVDMgFWg
Date: Sat, 13 Sep 2025 00:41:46 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dongchun Zhu <dongchun.zhu@mediatek.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Todor Tomov <todor.too@gmail.com>, linux-arm-msm@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2.1 01/72] dt-bindings: media: Deprecate clock-frequency
 property for camera sensors
Message-ID: <aMShqlBgHXHIExDC@shikoro>
References: <20250812214620.30425-2-laurent.pinchart@ideasonboard.com>
 <20250813094923.23695-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813094923.23695-1-laurent.pinchart@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_154151_499095_B1D46EDD 
X-CRM114-Status: GOOD (  11.89  )
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

Hi Laurent,

On Wed, Aug 13, 2025 at 12:49:23PM +0300, Laurent Pinchart wrote:
> Usage of the clock-frequency property for camera sensors is discouraged
> in favour of using assigned-clock-rates (and assigned-clock-parents
> where needed). Mark the property as deprecated.
> 
> Update the examples accordingly. In DT examples where the sensor input
> clock appears to come from a programmable clock generator, replace
> clock-frequency by the assigned-clocks and assigned-clock-rates
> properties. Otherwise, just drop clock-frequency.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> Changes since v2:
> 
> - Don't remove clocks property in samsung,exynos4212-fimc-is.yaml
> 
> Changes since v1:
> 
> - Adapt examples in bindings that reference sensors
> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml    | 6 ++++--

Can I have this i2c change seperately to avoid dependencies?

Happy hacking,

   Wolfram


