Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C4BCAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 22:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45q2RfxgPL2RPs1UTa/vp3a4iK6CtTwGXX+rlUIY7e4=; b=nCFmD0IDDDMhnM45IfI95mOC7E
	szZ+hvjvwbQUKryzIFk1BuEp9K5bD7tWNYGNMxHbGFxxB+EkHkOUKRftcgUYJao6BSQrdiyLr9Mcd
	3y2tlMvpmUHHsKnhXkX141spz1sccz11ifnWo3d47cMkA691rGcaJ3MZ/RvRFj9D/UcOqafrZfmv7
	uBLB1SwRd1ouiOkH6OltgqMJP9t1aGRwhvj84nRzU9l+5BydDX/0lQaBNOhG0XRD7kkLtRsQqngub
	EhsUTafzhYQWr/vFxn3asCtNl/EKg4yfA9Pz8ZV+BZUHHHi62T/0IQlK3+ReP/Pf34zYQiMbYiyFv
	rNIs1xcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1u3I-0000000DPXo-41Ud;
	Thu, 25 Sep 2025 22:03:00 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1u3G-0000000DPWG-0nGu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 22:02:59 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 8C48B1D0001C;
	Thu, 25 Sep 2025 18:02:56 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 25 Sep 2025 18:02:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1758837776; x=1758924176; bh=45q2RfxgPL
	2RPs1UTa/vp3a4iK6CtTwGXX+rlUIY7e4=; b=UWGOpYJ6CBLaUH3lP0939qUdp8
	oIkBJg4b59HUGa+sGLQi5FJeYdcB/G+n+XIEojAEhKKMUIWt0ePF7LvONkYuqZE4
	IcFMuwW28xRzu3u3d/LcBr4AsEtk8OJocP1B96QSrCY1X1EEUnDEVOdLSJl0tvMH
	/hW+h3eA19yYRZhslKNEzLZVjbxD2oAelB2mF4ZH0B7GTB54jnGIticrcRSpXXIC
	VCxMdP8Gb0jmQg5VqpXMT923cSjl/eGlI3fgD3BnQmvZ5ZfbPgelnDhPXZkutynE
	M5q5hQqWUws4z2DFueDPRkLyMHeDlv+wgocAscFGEgSDluv/hCNNBC5G2JBw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758837776; x=1758924176; bh=45q2RfxgPL2RPs1UTa/vp3a4iK6CtTwGXX+
	rlUIY7e4=; b=G2xnt1E7zv+0TEUQksFp5Bb7hUTt/noMfIK6VjGRxfYV08dHOn4
	kt0lYp9p3mV7sbBdKBr/Ela64eT+uNcK5WABxkJIoKAU0C9JtmVCtkoMtcYQKziu
	47awA01Co19sIx8Vi063ASKB97zuVe4pa6pjRU600C4aPzSZu9TTw55eM5etri8i
	skGrF9A0Na8ZQeHu4I9vDuUH/PT4T20iTJep1r/0JNQtO4zM/jFWNZ9rb2Ev+L8/
	k+GcFs1UP7DgeFDdT2MGvmCQ3aeuh69TNT5ETXV9gQVBhywWZ0yqknaqwbU94cQP
	4YNT8R51TVIpHDCmxxI9g9f5g+Vst0t/5HA==
X-ME-Sender: <xms:D7zVaHdDwSU7-i24NUP40ENlshVsImBeqs_TR6P8BTE0nuCf8oPagA>
    <xme:D7zVaJHynfWtGe2VtM2ux6S9_pVUaGOwYQ07cQ7qDifsTzMwr5kx-KmmAznS1DKEv
    ZOcokBWhNf05R-8Hzr_us6sGJiVG-ULaMlibZ1L6Xk2ISUTlLkCOms>
X-ME-Received: <xmr:D7zVaMB07uC71mt2yTVFGE-MSToNSClmWVhJSXWx60Y9nfm6InLvoYASM6Q-TpTF-txdE0bXAXKu1ZQHr5w6zCcu1DA7zw2B9f8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeijeeigecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeflrghnnhgvucfi
    rhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnhepgfdvff
    evleegudejfeefheehkeehleehfefgjefffeetudegtefhuedufeehfeetnecuvehluhhs
    thgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurd
    hnvghtpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepjhgtrghllhhighgvrhhoshelleesghhmrghilhdrtghomhdprhgtphhtthhopehsvh
    gvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiif
    vghighdrihhopdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtoh
    eplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrghn
    ughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomh
X-ME-Proxy: <xmx:D7zVaM4f33altnetDoyGCGAuXKPZpJUQzcMCvu3hbliXcsJ2EbMXJQ>
    <xmx:D7zVaLlX54RiZDd0NVg_pxNK6WcEk5SZ_5iBcd4nnLWqts4MHhKgNA>
    <xmx:D7zVaF4mOHwi_NKCjr6py86kDM_Oj5AknOBXQgN4scbAEzaMbHkaXw>
    <xmx:D7zVaJXr0kKu-tI4bL74Wpn-nKWh7XaaJQhRwquku5tnWMJrAS0nNQ>
    <xmx:ELzVaD-j4wqPauB1cCsZcJESH2PPmoAtWPNuPvIgMz8-jEHql9-jyh3j>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Sep 2025 18:02:55 -0400 (EDT)
Date: Fri, 26 Sep 2025 00:02:54 +0200
From: Janne Grunau <j@jannau.net>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v2 10/11] arm64: dts: apple: Add common hwmon sensors and
 fans
Message-ID: <20250925220254.GE637503@robin.jannau.net>
References: <20250827-macsmc-subdevs-v2-0-ce5e99d54c28@gmail.com>
 <20250827-macsmc-subdevs-v2-10-ce5e99d54c28@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250827-macsmc-subdevs-v2-10-ce5e99d54c28@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_150258_279947_409366EF 
X-CRM114-Status: GOOD (  16.80  )
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

On Wed, Aug 27, 2025 at 09:22:44PM +1000, James Calligeros wrote:
> Each Apple Silicon device exposes a unique set of sensors and fans,
> however some have been found to be reliably common across devices.
> 
> Add these as .dtsi files so that they can be combined with any
> device-specific sensors without excessive repetition.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../boot/dts/apple/hwmon-common.dtsi     | 37 +++++++++++++++++++++++++
>  .../boot/dts/apple/hwmon-fan-dual.dtsi   | 24 ++++++++++++++++
>  arch/arm64/boot/dts/apple/hwmon-fan.dtsi | 19 +++++++++++++
>  .../boot/dts/apple/hwmon-laptop.dtsi     | 35 +++++++++++++++++++++++
>  .../boot/dts/apple/hwmon-mac-mini.dtsi   | 17 ++++++++++++
>  5 files changed, 132 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/apple/hwmon-common.dtsi b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..bac4e44d3f9892fe8ad04125e47dcccb2bcf57a0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/hwmon-common.dtsi
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> + * Hardawre monitoring sensors expected to be found on all Apple Silicon devices

typo: "Hardawre"

> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +&smc {
> +	hwmon {
> +		compatible = "apple,smc-hwmon";

I think it woiuld make more sense to add the hwmon child node with the
compatible in the SoC *.dtsi and then only add the sensor nodes to
"&smc_hwmon" in these hwmon-*.dtsi files

Janne

