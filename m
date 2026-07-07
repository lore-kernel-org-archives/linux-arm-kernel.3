Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A9CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XpJw9io3fjRgOtK6zLaiSswWKuLmK0PDRcOfWIbbXcQ=; b=4IoSog5xKkh03IRmUT+jTjx4Oz
	UMvVK05Z9G+sgWfQOBK+YVIaaqTMD1T9w8PJ+f2/TVwnqGgYU9MT+nIqEaD81TAbL3h3a9ayMPj1g
	tjt0BytGd8RZgUcxRj2w0Z2upTvL7astYndZznDyjmIQn/tWk31MiqxT8dkpFqOYHjCJSJ5w0eGMU
	8rmBKj+fLu/8B+eZ6aZId8Vbec+vf5qc5LkJS/F/ht5qbkIu9lVBJrBz8Lp+wTxl1KS8gE+PVU6EJ
	zp6dJ4fvuA2xx+96svsx51Ok1Q2PJ04zxFeFTHjntD/SiXkiqF3WBWfWNk5bPAoz5h4zMqXyXkO7U
	C6kC0zaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh89a-0000000FPGG-21iJ;
	Tue, 07 Jul 2026 15:56:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh89U-0000000FPCy-45mZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 15:56:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D7A5601EB
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 15:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33561F00ADF
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jul 2026 15:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783439763;
	bh=XpJw9io3fjRgOtK6zLaiSswWKuLmK0PDRcOfWIbbXcQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oo/rJf0uf6OMgy41BoztRw2fjxk2SuE82lnxffdIEestTRKZDqKTqwPvvxqDcu6nn
	 BNWNwcUK0TJGGMPej+yLme/eKMYAhFJbH293jMupnNdwJhQ65PKQLLiebaRQcozJ/D
	 wwWH+FZzSf4VUBxeIhXEfPPQskDp3NmgkcXAGfFxzeHWBbZ+x4JzUCyR2L9HyjI3HT
	 zyidrUTrKjwXGVRGt+VOtC2XE8XPsKDAS/OA/B5yqrVwYK/peikLEMRtNwfn0chAoa
	 aNYdljRvMJM5RFYO3cj+b19Rk7YVMOpWd8Qg3TYGDmMI3SlVmkGGTvLT0Zjlrg/A1g
	 eNFGZ09T8am8A==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c12758e75afso548374966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 08:56:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqziq9/O63ccfrtijXJBIjqhhWwLTUFyDGeX+dHyQ5Barqwr9uz+zrVQ2VevWZYU4fuwoc/gX3SRmevCVPRZXhb@lists.infradead.org
X-Gm-Message-State: AOJu0YzJkAm6fpYAozyZKKzd0IkYLyyWLnLEYsj0uNNIkMvdw3QXJ35k
	qo85liJwhfGo6Sz2dq49vSL0PuFnIBfzU/72VAhlC5YIFzH5iykJBDrX0+gI9QieeAtnw3mgh/Q
	pxJfCPv9CvQ7YCNVeAYH9RhvxJctvoQ==
X-Received: by 2002:a17:907:3e28:b0:c12:e178:9e96 with SMTP id
 a640c23a62f3a-c15a6797765mr356272766b.14.1783439762253; Tue, 07 Jul 2026
 08:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1780499520.git.michal.simek@amd.com> <23d848e29176706548612c4a0751481d46176f11.1780499520.git.michal.simek@amd.com>
In-Reply-To: <23d848e29176706548612c4a0751481d46176f11.1780499520.git.michal.simek@amd.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 7 Jul 2026 10:55:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLWwcRjzQs4DHV265w-ROzeW_OPVS0uP0Ew8p+-dYu+EA@mail.gmail.com>
X-Gm-Features: AVVi8CeWMVmr9b-fYHQTlYbUaXSASdllAjeebeVjmBQkRgnkHGGocV2Uv5Xxhd0
Message-ID: <CAL_JsqLWwcRjzQs4DHV265w-ROzeW_OPVS0uP0Ew8p+-dYu+EA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] dt-bindings: clock: Move xlnx,zynqmp-clk to its
 own schema
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, kishore Manne <nava.kishore.manne@amd.com>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jun 3, 2026 at 10:12=E2=80=AFAM Michal Simek <michal.simek@amd.com>=
 wrote:
>
> The ZynqMP clock controller binding shares only #clock-cells with the
> Versal bindings. Move it to a dedicated xlnx,zynqmp-clk.yaml schema.
> Also remove "(Optional clock)" from clock description because it is visib=
le
> from schema itself.
>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
>
> Changes in v3:
> - Cover change in zynqmp-firmware.yaml
> - Move clock-cells to be the last in the example
> - Remove comment around (Optional clock) which is obvious from schema
>   itself
>
> Changes in v2:
> - New patch in series
> - Split zynqmp-clk from versal-clk
>
>  .../bindings/clock/xlnx,versal-clk.yaml       | 50 +-------------
>  .../bindings/clock/xlnx,zynqmp-clk.yaml       | 68 +++++++++++++++++++
>  .../firmware/xilinx/xlnx,zynqmp-firmware.yaml |  7 +-
>  3 files changed, 76 insertions(+), 49 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-c=
lk.yaml

This is now causing warnings in linux-next:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,ve=
rsal-clk.example.dtb:
zynqmp-firmware (xlnx,zynqmp-firmware):
clock-controller:clock-names:0: 'pss_ref_clk' was expected
        from schema $id:
http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,ve=
rsal-clk.example.dtb:
zynqmp-firmware (xlnx,zynqmp-firmware):
clock-controller:clock-names:1: 'video_clk' was expected
        from schema $id:
http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,ve=
rsal-clk.example.dtb:
zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:clock-names:
['ref', 'pl_alt_ref'] is too short
        from schema $id:
http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,ve=
rsal-clk.example.dtb:
zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:clocks:
[[4294967295], [4294967295]] is too short
        from schema $id:
http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/clock/xlnx,ve=
rsal-clk.example.dtb:
zynqmp-firmware (xlnx,zynqmp-firmware): clock-controller:compatible:0:
'xlnx,zynqmp-clk' was expected
        from schema $id:
http://devicetree.org/schemas/firmware/xilinx/xlnx,zynqmp-firmware.yaml

