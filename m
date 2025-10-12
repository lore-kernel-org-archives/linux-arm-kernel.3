Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C6DCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 13:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WLOCDyMr2hFKeVuMRVe8+2z9soTconDeuvbennxCXRY=; b=c4hXuUPP9KoD+9C1P1HNCGnd0t
	AR9l9ZYsk5qe2fxdveyqL49FDAAPbHbPxXEXXcDn41intU0ByKWu8Lh8ABayBQLeuIzC9+WeRnWCc
	zh1D4NB8xoyzfPteDdKuRj0uY6m8vumnnFLhNScSb+EUP7E6ed81NBLZMjKahvONfM2ErO7EuVdxs
	PRs5stjQ5DG7mYUpS/Fyw5HOcmqoHz0ZfUTbTruSIWbLX3Q1MIMJI5kfd3bMECHjVRiWBTUwLzujE
	bI9qKVRTj6klyW3Ck9KFAw2ARKtiX3+nKrvK4iZir3337pCExi3MOJJPVkui7FmvbZDwiJzWhjhag
	2+/2PbFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7wCq-0000000BNPg-44Jk;
	Sun, 12 Oct 2025 13:33:48 +0000
Received: from fhigh-b3-smtp.messagingengine.com ([202.12.124.154])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7wCn-0000000BNPK-1y1f
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 13:33:47 +0000
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B1C4D7A00D4;
	Sun, 12 Oct 2025 09:33:41 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Sun, 12 Oct 2025 09:33:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1760276021; x=1760362421; bh=WLOCDyMr2h
	FKeVuMRVe8+2z9soTconDeuvbennxCXRY=; b=GYdvTvuIgaxhdKELz3DLpQST4q
	dl7J2zysVb8n9tJ/BdViBKLPSG7wwEs/+0ijfEG8gtgZ4bGg5jsOMX/csm9IraC/
	4/ze8SBN+4tWT0UVuEA2qoVvYPMAjWfCZ7uLGefuMw3QMb7Q3nWJOPGp+QxNkrxE
	6Fb6iq3PdafzYOaJ9xkFYFEaCeGPHkwoVAwCJOW6a3rZD6g9iLaKMsbU1ZVLgyMe
	CpTG6wDzPEOereV+NmqO8g6syfR036Ph5FqbO0xndAMznUWJPjMQame1gPTuwUp8
	zQUk7lrYOTIBGMAqp4gNJYanipw3Xs+g2mfF+VwjJbIHMiY4KLVSWr4HLzmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1760276021; x=1760362421; bh=WLOCDyMr2hFKeVuMRVe8+2z9soTconDeuvb
	ennxCXRY=; b=JZk6iemaf2Igw4rURPW39zUigWKIQw/wKkrXNTRmMW/0qeVEPC9
	xjzSLKFVNEvspRoHJw7VXW4XFZtiH2KWrZLYbZkFqLqJt29t5hMMDSKrJgR9e9I2
	AsgddeaUUjhjtF8iMXUN1fsddYkLygYc7i2cxfznOEpVhwKbuN/QzdT/RuTz/njS
	orCmyK8qSAszXvjuDAo9zuE4T6SsWCyp5325KarRVZ3rUicCNHErKDNJrS9AM89f
	8rS1HyiBTmZrsNpCI06hXQKxFydTLzhv+GJ6v2s3N7uacMPTieWM5QorWFt1AAqD
	3TcxbPTYI8spoU3OKE2F5yR0BLXc81j32FA==
X-ME-Sender: <xms:M67raO_H7_9CxSIkVVjYIxr5kajMi6G-8lH1-noCcymbZ8EKKy6gRQ>
    <xme:M67raNMYk9gK6iDYrGCamdv-_s9UTnfQBnP-8N-KFWm6nX1PlsJd2XHUAxZe5nV5q
    KPIzTK_SzTKsgvTQHV0N8Ftn4zb_ystIt1SagiJzyo0RiVNq6vRRzc>
X-ME-Received: <xmr:M67raK0_b7Haee385PeeWdbZlETWnAGqUlkl8JY55C-fJtnVmqTPx5TYyZYdgW1ln2Ldct-peo_VwfiRSlrQv9FlfwDmzmSLULw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduudegledtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgud
    euffelfeekgeeukedtheekjeettdfftddujefhvdehtefgiefgledtueefjeenucffohhm
    rghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepjhesjhgrnhhnrghurdhnvghtpdhnsggprhgtphhtthhopedu
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdp
    rhgtphhtthhopehlvggvsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhhnugesrg
    hrnhgusgdruggvpdhrtghpthhtohepphgrnhhkrghjrdguuhgsvgihsehsrghmshhunhhg
    rdgtohhmpdhrtghpthhtohephhgvihhkohesshhnthgvtghhrdguvgdprhgtphhtthhope
    hlihhvihhurdguuhgurghusegrrhhmrdgtohhmpdhrtghpthhtohepshhuuggvvghprdhh
    ohhllhgrsegrrhhmrdgtohhmpdhrtghpthhtoheplhhpihgvrhgrlhhishhisehkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:M67raGfWdQpDopDNEBK-DmDT32-jqH8nVHiR2BC8iobSZ8G_GtmA_w>
    <xmx:M67raLYRwBswDOBl2WOvODzP5eD4CuKRh9iXRhUwRcxibtqBxnHffQ>
    <xmx:M67raLWMscTU9YJoqhxDorc6TvXXphYdVeE1pf3-njdcbfLbP50ZEg>
    <xmx:M67raOSMjM-qP-9YPYqVjks970XbOLLDbrIl-Kir-OnNxMJPQJqMUQ>
    <xmx:Na7raHdNm4Mu4-irwylHsP2TIRk89KD3IJnT_RasnQdAzYfvks86i-im>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 12 Oct 2025 09:33:38 -0400 (EDT)
Date: Sun, 12 Oct 2025 15:33:37 +0200
From: Janne Grunau <j@jannau.net>
To: "Rob Herring (Arm)" <robh@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Pankaj Dubey <pankaj.dubey@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH v2 2/3] mfd: syscon: Remove the platform driver support
Message-ID: <20251012133337.GA897177@robin.jannau.net>
References: <20241217-syscon-fixes-v2-0-4f56d750541d@kernel.org>
 <20241217-syscon-fixes-v2-2-4f56d750541d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217-syscon-fixes-v2-2-4f56d750541d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_063346_050034_2633CAD2 
X-CRM114-Status: GOOD (  20.43  )
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

On Tue, Dec 17, 2024 at 12:11:41PM -0600, Rob Herring (Arm) wrote:
> The platform driver is dead code. It is not used by DT platforms since
> commit bdb0066df96e ("mfd: syscon: Decouple syscon interface from
> platform devices") which said:
> 
>     For non-DT based platforms, this patch keeps syscon platform driver
>     structure so that syscon can be probed and such non-DT based drivers
>     can use syscon_regmap_lookup_by_pdev API and access regmap handles.
>     Once all users of "syscon_regmap_lookup_by_pdev" migrated to DT based,
>     we can completely remove platform driver of syscon, and keep only helper
>     functions to get regmap handles.
> 
> The last user of syscon_regmap_lookup_by_pdevname() was removed in 2018.
> syscon_regmap_lookup_by_pdevname() was then removed in 2019, but that
> commit failed to remove the rest of the platform driver.

This removed the only driver claiming pmgr nodes on Apple silicon
platforms. The nodes use compatible strings of the form

compatible = "apple,t8103-pmgr", "apple,pmgr", "syscon", "simple-mfd";

The description still holds as the removal of the driver did not result
in functional changes and went unnoticed. The missing driver became 
apparent with pmdomain's sync_state() support in 6.17 which prints
following messages on a M1 mac mini

| [   11.789419] apple-pmgr-pwrstate 23b700000.power-management:power-controller@420: sync_state() pending due to 23d280000.power-management
| [   11.792414] apple-pmgr-pwrstate 23b700000.power-management:power-controller@448: sync_state() pending due to 23d280000.power-management

None of the other compatible are claimed by any driver. There is no
driver for "apple,t8103-pmgr" or "apple,pmgr" and simple-pm-bus.c binds
"simple-mfd" only if it is the first compatible string.

The easiest solution would be to probe via simple-pm-bus.c if the device
is compatible with "apple,pmgr". The generic compatible is justified by
not having any device specific code. The other option would by to add
the growing list of SoC specific "apple,*-pmgr" compatibles to the match
table.
The alternative of writing an Apple pmgr driver which does nothing
except successfully probing devices does not look appealing.

There is second problem though. The device link between
23b700000.power-management:power-controller@420 and
23d280000.power-management should not exist in the first place. See
following excerpt from arch/arm64/boot/dts/apple/{t8103,t8103-pmgr}.dtsi
omitting only unrelated child nodes.

/ {
	pmgr: power-management@23b700000 {
		compatible = "apple,t8103-pmgr", "apple,pmgr", "syscon", "simple-mfd";
		#address-cells = <1>;
		#size-cells = <1>;
		reg = <0x2 0x3b700000 0 0x14000>;

		ps_atc0_common: power-controller@420 {
			compatible = "apple,t8103-pmgr-pwrstate", "apple,pmgr-pwrstate";
			reg = <0x420 4>;
			#power-domain-cells = <0>;
			#reset-cells = <0>;
			label = "atc0_common";
		};
	};

	pmgr_mini: power-management@23d280000 {
		compatible = "apple,t8103-pmgr", "apple,pmgr", "syscon", "simple-mfd";
		#address-cells = <1>;
		#size-cells = <1>;
		reg = <0x2 0x3d280000 0 0x4000>;

		ps_atc0_usb: power-controller@98 {
			compatible = "apple,t8103-pmgr-pwrstate", "apple,pmgr-pwrstate";
			reg = <0x98 4>;
			#power-domain-cells = <0>;
			#reset-cells = <0>;
			label = "atc0_usb";
			power-domains = <&ps_atc0_usb_aon>, <&ps_atc0_common>;
		};
	};
}

To my understanding the fw_devlinks should only exists between
&ps_atc0_common and &ps_atc0_usb. Herve Codina reports and posts a patch
for what sounds to be the same issue in [1] for simple-pm-bus. I can't
reproduce the report though. As soon as simple-pm-bus successfully
probes the pmgr devices the spurious devlinks are gone.

So I think this needs to be fixed in either of/platform.c for all
devices handled in of_platform_default_populate() or in
driver-core/devlink considering the issue appears without driver for the
bus device.

Janne

[1]: https://lore.kernel.org/lkml/20250613134817.681832-6-herve.codina@bootlin.com/

