Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB051091904
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 19:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3Ty2rMUXWrI+Dw+O8BMuW+g1hkiDWZuTXFRx7/LGyc=; b=DZFeCQxdOShXWJUyzzFZsyyiKn
	vCeBj9dDDtCsm51pvD3hwDQjKNLrl6ILQHVj5iMFVZif18nk4t23AdFfskGCJxiGFuN0Boy7yRFN+
	64Rp5VEYidBa4RznJl5ukLFXmOp1eH3zlJ7NFFC3R6rXavCSMIiyMHsrsPrh8cr/qH4ViHG1nBRwB
	RonC8N/45i66mgObpkocrNs6fb0BGyfBDjONZARoqSYID8306eUi2r4jEYvbuB+2RzZwNr49/aMiT
	E+d7Vxj8hREbcsr7GBq8vn1Xkk5ErZuqlEei1BhiVvHNFbrq6BV2V1cFXJmpICWu4JE6Ycom7iCC2
	I1KSGZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3J4d-0000000BS9n-3pO8;
	Thu, 19 Mar 2026 19:30:27 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3J4b-0000000BS8H-20Hw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 19:30:26 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 05769240103
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 20:30:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1773948617; bh=q3Ty2rMUXWrI+Dw+O8BMuW+g1hkiDWZuTXFRx7/LGyc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 From;
	b=XnntJXqcpKq1vvulz5ESTTOSuIeKIX58sdM4Neo34xfN9p7sst/fhPm2wOc1Vxlda
	 mjp4/d1P3RYokEQ7FNKg4VYP4UowCN79ZaDBf3FWlQKSVM1mruJzoWL6674ITV5Bhm
	 4KuUWlLrJx+hdUm56zwyk4JUIXcrUBtoDvSUmW1UVTh7t2p5Ott9xhbyJrgyJbWN5s
	 i5lJ/LSCZkvm0Z4T9LtvzLC7PnKMskLMMTvGEKiMzgjuDzwZg9ali7gXV9ngizQ2WE
	 THcCN2TNkBFWrI99XE9Ln/1z12K1UE9wCDIkSYPZjd4hu9ZjeYBVkeJNLjWOB3wdlB
	 rWjt5EMoaxgwA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4fcG4K6pw3z6twZ;
	Thu, 19 Mar 2026 20:30:09 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Michael Riesch via B4 Relay
 <devnull+michael.riesch.collabora.com@kernel.org>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Heiko Stuebner
 <heiko@sntech.de>,  Kever Yang <kever.yang@rock-chips.com>,  Jagan Teki
 <jagan@amarulasolutions.com>,  =?utf-8?B?0JrRg9C30L3QtdGG0L7QsiDQnNC40YU=?=
 =?utf-8?B?0LDQuNC7?=
 <mai.kuznetsov.misha@gmail.com>,  Sebastian Reichel
 <sebastian.reichel@collabora.com>,  Nicolas Dufresne
 <nicolas.dufresne@collabora.com>,  Collabora Kernel Team
 <kernel@collabora.com>,  Sakari Ailus <sakari.ailus@linux.intel.com>,
  michael.riesch@collabora.com,  linux-media@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-rockchip@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] Documentation: admin-guide: media: add rk3588 vicap
In-Reply-To: <20250430-rk3588-vicap-v2-1-77de5ee9048e@collabora.com>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
	<20250430-rk3588-vicap-v2-1-77de5ee9048e@collabora.com>
Date: Thu, 19 Mar 2026 19:30:14 +0000
Message-ID: <m2h5qbd3cv.fsf@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_123025_800340_6CE46448 
X-CRM114-Status: GOOD (  17.76  )
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

Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org> writes:

> From: Michael Riesch <michael.riesch@collabora.com>
>
> Add a section that describes the Rockchip RK3588 VICAP.
>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  .../admin-guide/media/rkcif-rk3588-vicap.dot       | 29 ++++++++++++++++++++
>  Documentation/admin-guide/media/rkcif.rst          | 32 ++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
>
> diff --git a/Documentation/admin-guide/media/rkcif-rk3588-vicap.dot b/Documentation/admin-guide/media/rkcif-rk3588-vicap.dot
> new file mode 100644
> index 000000000000..f6d3404920b5
> --- /dev/null
> +++ b/Documentation/admin-guide/media/rkcif-rk3588-vicap.dot
> @@ -0,0 +1,29 @@
> +digraph board {
> +        rankdir=TB
> +        n00000007 [label="{{<port0> 0} | rkcif-mipi2\n/dev/v4l-subdev0 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +        n00000007:port1 -> n0000000a
> +        n00000007:port1 -> n00000010 [style=dashed]
> +        n00000007:port1 -> n00000016 [style=dashed]
> +        n00000007:port1 -> n0000001c [style=dashed]
> +        n0000000a [label="rkcif-mipi2-id0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
> +        n00000010 [label="rkcif-mipi2-id1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
> +        n00000016 [label="rkcif-mipi2-id2\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
> +        n0000001c [label="rkcif-mipi2-id3\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
> +        n00000025 [label="{{<port0> 0} | rkcif-mipi4\n/dev/v4l-subdev1 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +        n00000025:port1 -> n00000028
> +        n00000025:port1 -> n0000002e [style=dashed]
> +        n00000025:port1 -> n00000034 [style=dashed]
> +        n00000025:port1 -> n0000003a [style=dashed]
> +        n00000028 [label="rkcif-mipi4-id0\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
> +        n0000002e [label="rkcif-mipi4-id1\n/dev/video5", shape=box, style=filled, fillcolor=yellow]
> +        n00000034 [label="rkcif-mipi4-id2\n/dev/video6", shape=box, style=filled, fillcolor=yellow]
> +        n0000003a [label="rkcif-mipi4-id3\n/dev/video7", shape=box, style=filled, fillcolor=yellow]
> +        n00000043 [label="{{<port0> 0} | dw-mipi-csi2rx fdd30000.csi\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +        n00000043:port1 -> n00000007:port0
> +        n00000048 [label="{{<port0> 0} | dw-mipi-csi2rx fdd50000.csi\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
> +        n00000048:port1 -> n00000025:port0
> +        n0000004d [label="{{} | imx415 3-001a\n/dev/v4l-subdev4 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> +        n0000004d:port0 -> n00000043:port0
> +        n00000051 [label="{{} | imx415 4-001a\n/dev/v4l-subdev5 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> +        n00000051:port0 -> n00000048:port0
> +}
> diff --git a/Documentation/admin-guide/media/rkcif.rst b/Documentation/admin-guide/media/rkcif.rst
> index 2558c121abc4..fcd7f8cfc5d3 100644
> --- a/Documentation/admin-guide/media/rkcif.rst
> +++ b/Documentation/admin-guide/media/rkcif.rst
> @@ -77,3 +77,35 @@ and the following video devices:
>  .. kernel-figure:: rkcif-rk3568-vicap.dot
>      :alt:   Topology of the RK3568 Video Capture (VICAP) unit
>      :align: center
> +
> +Rockchip RK3588 Video Capture (VICAP)
> +-------------------------------------
> +
> +The RK3588 Video Capture (VICAP) unit features a digital video port and six
> +MIPI CSI-2 capture interfaces that can receive video data independently.
> +The DVP accepts parallel video data, BT.656 and BT.1120.
> +Since the BT.1120 protocol may feature more than one stream, the RK3568 VICAP

Nit, should this be RK3588 instead of RK3568?

> +DVP features four DMA engines that can capture different streams.
> +Similarly, the RK3588 VICAP MIPI CSI-2 receivers feature four DMA engines each
> +to handle different Virtual Channels (VCs).
> +
> +The rkcif driver represents this hardware variant by exposing the following
> +V4L2 subdevices:
> +
> +* dw-mipi-csi2rx fdd30000.csi: MIPI CSI-2 receiver connected to MIPI DPHY0
> +* dw-mipi-csi2rx fdd50000.csi: MIPI CSI-2 receiver connected to MIPI DPHY1
> +* rkcif-mipi2: INTERFACE/CROP block for the MIPI CSI-2 receiver connected to
> +  MIPI DPHY0
> +* rkcif-mipi4: INTERFACE/CROP block for the MIPI CSI-2 receiver connected to
> +  MIPI DPHY1
> +
> +and the following video devices:
> +
> +* rkcif-mipi2-id{0,1,2,3}: The DMA engines connected to the rkcif-mipi2
> +  INTERFACE/CROP block.
> +* rkcif-mipi4-id{0,1,2,3}: The DMA engines connected to the rkcif-mipi4
> +  INTERFACE/CROP block.
> +
> +.. kernel-figure:: rkcif-rk3588-vicap.dot
> +    :alt:   Topology of the RK3588 Video Capture (VICAP) unit
> +    :align: center

