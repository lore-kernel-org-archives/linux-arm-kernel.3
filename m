Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCDCC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 20:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5jUrj7wF3tavgxp+A5jwXCoLfMB42CDUTngvpZIfCEg=; b=ifK0O0BeVSngnt3zkQMS92hpfv
	EHgTqizMxYvZ8Y+0TZ1mjcHI5ISA4IIsU/R+iVakvBRu1iDCWG++CMRO4ewkdVsK3srSPail9OREu
	35cOFVsLlqqUDMHvNy0sNree22XMBns9DSm5cQKrT7nrAtdd5f0l2Vwy2A5AGYZJwpe0XzqvdqHwj
	VFygLpwyua0aki+1KFIXBqjSCcK1/TIdpyyIJFsQ1Do+mKDfMiaSI+kTfuy/o9xqyAV2hZZzkKKP3
	IhSdGh5PUgLXIbk7OVTD2/Qhj/yUwjCDZENcwwkRiBWIUJpLdVlEW9SS8CfOrGlvUdCMvbD64Rp/t
	e54LL36A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxVL-0000000Csf4-1XJY;
	Thu, 10 Jul 2025 20:04:27 +0000
Received: from flow-a4-smtp.messagingengine.com ([103.168.172.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtFA-0000000CG02-1SYl;
	Thu, 10 Jul 2025 15:31:29 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id A0512138088B;
	Thu, 10 Jul 2025 11:31:27 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 10 Jul 2025 11:31:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1752161487;
	 x=1752168687; bh=5jUrj7wF3tavgxp+A5jwXCoLfMB42CDUTngvpZIfCEg=; b=
	A2wOi/xcujkvYBDuXdJ6U03+pk5ApP+/Hm/U/bksQZ8pDLCmaN67aFv86rPTY//U
	Z8bgIfq1M7+EheJyEg7zsw0Ex6PtqkzDizZlY8kA0adxBHkfmaU1cGR1PisEMgg3
	8R7UrRdoED/gno3b06oqvbTM387+MdLZNeRv5OQBtE4q9PXqZyKKnsWiagr2oyqE
	+aMEYnXtP25I33oS03keTsJQ5R8QP+EPkPiWYI3PSN7NXJ9S6FsNMYvMOaKt1E+v
	VH/qbkzBDwataCovfwgZJLjSwrU1GqJ1vhSdhcbHOKQOaM3feQayJ14jbZN0gnby
	rEDw2pskXjBdVEp+hQaGXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752161487; x=
	1752168687; bh=5jUrj7wF3tavgxp+A5jwXCoLfMB42CDUTngvpZIfCEg=; b=V
	xRLLAa5ftf+/djbxIIVOUy2swEyflfr3Wcm2xm/8CwXlxUoXOpc0KzUs8z4IyyRy
	pGfFcb5Wce+Kc6aU4WS9rcTeLeMXXuwzom+MJ3E9b4ewtDhA4fxfAHslq02++Irs
	0LuPx9rmezi33WrB+MEH/cD3APAk4r7g3Hc96UqkSR6KFWjz6JxHPXOOU1luGPOK
	hCnzm6i/aUsup8Nntrrr39yIPdKC5NgfrCp8CJMwWjGvZQMedzNysb5v7J8R2+pL
	U/cdO/RagGlMy/Ixs8sMvkcBD5sW2C1Z+kDz+tuDFMaaeHYKxRGpK07Oa9VteDpc
	ytWK8XAqBBnSV937C+8tg==
X-ME-Sender: <xms:ztxvaFNAGKUtZYu0N0KswtdhzYu9hwECN7nxcxY-T6VSzpvuTyEaRw>
    <xme:ztxvaH8RmKMiSTLTrDr7gJ7XaUj_THd32LQ6bIsEYqhbDGqPaskN4O5Hpnhj_cyZX
    zLCrJIjn_hQibphM1M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegtdekudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeggedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepshhouhhvihhkrdgthhgrkhhrrghvrghrthihsegrrhhmrdgtohhmpd
    hrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphht
    thhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehsuhguvg
    gvphdrhhholhhlrgesrghrmhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgs
    vghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsggtmhdqkhgvrhhnvg
    hlqdhfvggvuggsrggtkhdqlhhishhtsegsrhhorggutghomhdrtghomhdprhgtphhtthho
    pehflhhorhhirghnrdhfrghinhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpth
    htoheprhhjuhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopehssghrrghnuggv
    nhessghrohgruggtohhmrdgtohhm
X-ME-Proxy: <xmx:ztxvaGbWoEZX-jk02l6nq6Gdvxu83FSgJw40RBJ42ld8yVenI52dJQ>
    <xmx:ztxvaJlyzHXcEXeq23SY4u6B2KyNd-Tcm8UNaFkwXQ-mQggE2ph3CA>
    <xmx:ztxvaKeqrVbRXKgS8wSLnfhRu7YRyyTfY72Vcu15REjOLED9qjwESQ>
    <xmx:ztxvaHtoD0nD09FEd_Lwgvqo8rkTybTh9k9K3EdLk8OoVO0qFn69Sg>
    <xmx:z9xvaEme0p3s8p10qmBksY9jW3laeiHuQoNAU0zOy2kW07cPWmZzTgOu>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3C4A3700069; Thu, 10 Jul 2025 11:31:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T17e904bff5b9beaf
Date: Thu, 10 Jul 2025 17:30:51 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Sebastian Reichel" <sre@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Sudeep Holla" <sudeep.holla@arm.com>,
 "Souvik Chakravarty" <Souvik.Chakravarty@arm.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Andy Yan" <andy.yan@rock-chips.com>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Olof Johansson" <olof@lixom.net>, "Konrad Dybcio" <konradybcio@kernel.org>,
 cros-qcom-dts-watchers@chromium.org, "Vinod Koul" <vkoul@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Elliot Berman" <elliotb317@gmail.com>
Cc: "Stephen Boyd" <swboyd@chromium.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>,
 linux-samsung-soc@vger.kernel.org, "Wei Xu" <xuwei5@hisilicon.com>,
 linux-rockchip@lists.infradead.org,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Sen Chu" <sen.chu@mediatek.com>, "Sean Wang" <sean.wang@mediatek.com>,
 "Macpaul Lin" <macpaul.lin@mediatek.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Ray Jui" <rjui@broadcom.com>, "Scott Branden" <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Elliot Berman" <quic_eberman@quicinc.com>,
 "Srinivas Kandagatla" <srini@kernel.org>,
 "Elliot Berman" <elliot.berman@oss.qualcomm.com>
Message-Id: <2d8e17ad-6bd6-47a9-b5ab-0a91689684ee@app.fastmail.com>
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-4-b2d3b882be85@oss.qualcomm.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-4-b2d3b882be85@oss.qualcomm.com>
Subject: Re: [PATCH v10 04/10] dt-bindings: arm: Document reboot mode magic
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_083128_461994_ACDD3735 
X-CRM114-Status: UNSURE (   5.33  )
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

On Thu, Jul 10, 2025, at 11:15, Shivendra Pratap wrote:

> +  reset-types:
> +    type: object
> +    $ref: /schemas/power/reset/reboot-mode.yaml#

The other users of the reboot-mode.yaml binding all call this
node 'reboot-mode' instead of 'reset-types', can you change that
here for consistency?

     Arnd

