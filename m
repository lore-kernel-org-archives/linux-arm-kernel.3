Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B116DC624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 14:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+A9vTFErWfQT0RtCnGKfq03NBjCr7KCzxcGcktHMDQI=; b=zcPopXPz5DCxOZIy7aqIKCmNiv
	18xyAu1Nw/usf2UVzw6FHjwRpjKWhaE/2hOad8EzKICzbiPOwr501lDCDP5K5dfZqTv//uG7ektxV
	vVA+qPMINum6/atI9NH+CMlvHVDTtmEx9PYHvBAdu1e6WOfomWWxJbIZl4OX/QMIr94byoUe0Q+RS
	f3eOadRPZcSmYgRXjgiQ5PTRetxie6MxTV1ZIAONjNQkLM2piTNk4xPJGkTV8FF4CbbTjMDDSnFZ9
	lBK7Q8JqdrS4rHJtnpHYKlUKoLZA19R+NdSK/3z7g6jDQelW2sgU4W+kamwZWd/oQObwAyItPu94v
	ebfgWU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VFQ-00000002RGU-0k2P;
	Fri, 04 Sep 2026 14:50:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2VFO-00000002RFw-2PY9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 14:50:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AA536600C8;
	Fri,  4 Sep 2026 14:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AAE01F00A3D;
	Fri,  4 Sep 2026 14:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788533429;
	bh=+A9vTFErWfQT0RtCnGKfq03NBjCr7KCzxcGcktHMDQI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ERFnMCX2zNVEuOaXAwLazkhogMvrT14LMjH/m83rRv88+dPJLGzjJRh9zjPS1zWXb
	 OdU+AMylNgfqQbitJvYOm6n9G90SQ6+qXAEH2VhEKfBUP4vKCHLviHFhc+RDBTO+0p
	 8px9SXQFFy3lvHTUTemU13jnF55xDgxYUju7NigbZPmjxWUlWlnhmJG0kvFmFqzJud
	 OXKgTeRsIkbxRxQ9az6v163g2nk+JxX21tUsBCIoOJ1Z5jSqaGbSP20kVLo+Wu3Kfi
	 8gnZUp3C1LG4op9el7Sjq4yvt/i2d6LyO7sa+xxzJ3rN0xI1cW5M8GwMZykaGkVo9q
	 eEtA7hWBeLEYA==
Date: Fri, 4 Sep 2026 09:50:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Radu Rendec <radu@rendec.net>, Brian Masney <bmasney@redhat.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Georgi Djakov <djakov@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 12/15] dt-bindings: interrupt-controller: qcom,pdc:
 Add Kuno compatible string
Message-ID: <178853342626.688235.4218772368232817802.robh@kernel.org>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-12-6d47636a8f09@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-kuno-soc-support-v5-12-6d47636a8f09@oss.qualcomm.com>
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


On Thu, 27 Aug 2026 23:21:15 +0530, Hardeep Sharma wrote:
> Document the Power Domain Controller found on the Qualcomm Kuno SoC.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


