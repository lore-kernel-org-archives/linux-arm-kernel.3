Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCA3C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 12:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6HzdZZy1ndKDpsBEhu29taA0HH7AF0JZfj/XCsQR0Y=; b=gxABqmoS6jk/TvEhxWgMKkMiPz
	K0cPPWA9WZm/hOjk7tp1kYHoDuBtQlA0d8iA/yi79MZ2ZIAhrjqct5/BG5GVnCgqFqvHnnEuXgJ4v
	UU+zFHPIkgqn/3pHJya51yVCLfbhA7LBh8rgoqao90C0ZhEUvQnFNzLIx+MMFYPnOQm+PEh/bdgDT
	maC/ZPweUeiy4AZ3Xf4H31X+YkhZoAG4FUKpnC3LdiOOoImsFKQfRxbFUlQSDk7vbGBC+9oKB8MWu
	C0q6Q4ASOmOe4ab77ZedkwC6nVk4URWLsL7S7BpaixT0lyUjrg8BtkOmhmRSWK02X+M5eifsPSF4P
	Ra2IZBcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tevlo-0000000FOth-1nu6;
	Mon, 03 Feb 2025 12:41:44 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tevkT-0000000FOl0-1atD;
	Mon, 03 Feb 2025 12:40:23 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E576025CAA;
	Mon,  3 Feb 2025 13:40:17 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kOJee6X8J05I; Mon,  3 Feb 2025 13:40:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738586417; bh=AkDFsgM8ht/4xOTKn+YGxCP4v6cjlpjp8uRWn5voH7o=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NiCsXrG7LpnG5w/NFwLl1Xf4k91ChodYcxZdyx5YPPOd49ovtD7MWdYY8MSqveHJL
	 AjJK0tAADkF89VLXYecmauRE5Gbv5iijR/wWAk4bwUHJvvvhXCYprAkat0d0TGYHIf
	 ykOg1aVULxEsuMRLAo+lnp61mnypYcYTcGh8agQvcbDbQ93GggzGqmU2WdUo/fnERe
	 cf0a6u52bgH+nL3XJ9zgtBTU2ZwrsvKehCSZyQANT07sLZRkG2mrLpJPC599dAG4RR
	 gPgmAg3QdVtp9K9GV7ZrzkCmvJgfX0tErHPHs9P/aQnPsTEdcVAPpr+zHZOgyA1afb
	 2mgxyQClmL60Q==
MIME-Version: 1.0
Date: Mon, 03 Feb 2025 12:40:16 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, Alim
 Akhtar <alim.akhtar@samsung.com>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Tomasz
 Figa <tomasz.figa@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Lee Jones <lee@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Marek
 Szyprowski <m.szyprowski@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Andi Shyti <andi.shyti@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jaehoon Chung
 <jh80.chung@samsung.com>, Vivek Gautam <gautam.vivek@samsung.com>, Thinh
 Nguyen <Thinh.Nguyen@synopsys.com>, Kees Cook <kees@kernel.org>, Tony Luck
 <tony.luck@intel.com>, "Guilherme G . Piccoli" <gpiccoli@igalia.com>, Sergey
 Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org, Kaustabh
 Chakraborty <kauschluss@disroot.org>
Subject: Re: [PATCH 02/33] dt-bindings: clock: add clock definitions for
 exynos7870 CMU
In-Reply-To: <20250203-enigmatic-remarkable-beagle-709955@krzk-bin>
References: <20250203-exynos7870-v1-0-2b6df476a3f0@disroot.org>
 <20250202190758.14986-1-kauschluss@disroot.org>
 <20250203-enigmatic-remarkable-beagle-709955@krzk-bin>
Message-ID: <c1249f2f6ac8a2f5a1dcb3bbbba647f9@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_044021_851206_BEBBCED5 
X-CRM114-Status: GOOD (  13.13  )
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

On 2025-02-03 07:54, Krzysztof Kozlowski wrote:
> On Mon, Feb 03, 2025 at 12:37:58AM +0530, Kaustabh Chakraborty wrote:
>> From: Sergey Lisov <sleirsgoevy@gmail.com>
>> 
>> Add unique identifiers for exynos7870 clocks for every bank. It adds all
>> clocks of CMU_MIF, CMU_DISPAUD, CMU_G3D, CMU_ISP, CMU_MFCMSCL, and
>> CMU_PERI.
>> 
>> Signed-off-by: Sergey Lisov <sleirsgoevy@gmail.com>
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
>>  include/dt-bindings/clock/exynos7870.h | 324 +++++++++++++++++++++++++
>>  1 file changed, 324 insertions(+)
> 
> Look at git log - that's never a separate commit.

Hmm, I see past examples which are mixed.

2ae5c2c3f8d586b709cf67efe94488be397d7544
Exynos850 CMU (c. 2021). CMU definitions are in a separate commit.

591020a516720e9eba1c4b1748cb73b6748e445f
Exynos7885 CMU (c. 2021). CMU definitions are in a separate commit.

while

96bd6224f07b8bf73e0359f15a3d7678118494e6
Exynos5433 CMU (c. 2015). CMU definitions and driver are in a single commit.

Let me know if I should still continue with the approach you mentioned.

> 
> Best regards,
> Krzysztof

