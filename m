Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187E010F994B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 15:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SivuXMZukQhLcIXhHDoIeKLBX7Bze4wxvXciTgMUKAY=; b=eJJBOI22MVGyEy
	jcyNPSAinrE8IvHtTZCcIkEGE8Yx5nj9hJvATNhhGZO7FfVp7fqEBrXXRhYDFSCUz4yHLuB0b+Fte
	SCSdco+Jwb6DmAVyJpLW6PcqYwX8oyUNB83UjufbvKqU9G6DRHyjK3paRZUtITrkAQsG6g2BDZk+n
	RfQWtYxuDJNpK8OvTYGTG5W8ML98q5Pac1l+YqXqdsMOWvqFXEkNCQsu8Vj7eibwzHMCqwJ1vZQkC
	Xy07ENGGSyhbDWyULfGdp88D/Uj7Q2ylc6fylt+VN4O7ZI3ELhSzCHGz4iJDMJgV/0qGGNN/Dhuhk
	7QGPv5DdV8SJg0xtQ4Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAURU-000000091lb-0Jfu;
	Wed, 08 Apr 2026 15:03:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAURR-000000091lG-3xjK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 15:03:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2CF6A433DB
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Apr 2026 15:03:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA81C19424
	for <linux-arm-kernel@lists.infradead.org>; Wed,  8 Apr 2026 15:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775660621;
	bh=Betpu6YlX50HXxx8cB8c4TNDrqRx4yczkSoAvANIAAE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BwWpSuEGh33P1HdOPUETTUh2GGicfP/E1wJq2vWfnrd590+xMej5M0vHycujXFfQp
	 rWbgI2U92dN7FtM1PzQlioqocdbGOStnfIKTvA7D2+9GJRM4ApH/w1NF7D527il5fS
	 eK/Hq04JUjC2iaoyTGCoCRKPaNshlgIvprkWX39rJkKbfQSQcaTRkpdbxYIGs37WJ6
	 E8S6dZLH5TbFDRE3oa4mjKzABmoD2ZP3tvhxJMPw5hBHHMvcQqgGcKta4zd/F+ChX2
	 suRPLFMDhoLEi4pn4Gl2iohsYwXyPWa4rQfg0i3dwmg/XGaDu0pSOlAwu0yvCujwhX
	 1gPzE2CTN/DHA==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66c05fb27e4so10370725a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 08:03:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXV7X8EOmU6s1Aw6k0quQpb80obZAx+RtJY37BuwAezyhYFAxr05SNeGydi750AYuAZ+6MU8CURkes/jdl69vAR@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8WWgBudD9xWbPd9hzmn/elgzqLT4aO4XRwHTfd3dnc8Q5ThNI
	enyOOIaLon9GPUByGPcRedPbC5j9UfAbJO4CEb8MbjeDYQLZeaiqSvZKV7ppQpCEC6bXgZ/UREr
	ehgM7H8UEzEflA2sCjageYtDEE7fdAQ==
X-Received: by 2002:a05:6402:34c5:b0:66e:43ef:2951 with SMTP id
 4fb4d7f45d1cf-66e43ef2a4bmr10220819a12.4.1775660619555; Wed, 08 Apr 2026
 08:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
In-Reply-To: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 8 Apr 2026 10:03:27 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJq=3z7SQX_26MGGRcmysnGHVke8aTwyDCesvOuQjEN+g@mail.gmail.com>
X-Gm-Features: AQROBzClMUtPoA2R9xbP9UQlxvhX-iW9IARKlNopJ52gDn5_0cggpUPCuN1htyU
Message-ID: <CAL_JsqJq=3z7SQX_26MGGRcmysnGHVke8aTwyDCesvOuQjEN+g@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_080342_037608_3B867914 
X-CRM114-Status: GOOD (  23.36  )
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
Cc: Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Dhruva Gole <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Kendall Willis <k-willis@ti.com>, Vishal Mahaveer <vishalm@ti.com>, Sebin Francis <sebin.francis@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, Mar 18, 2026 at 10:14=E2=80=AFAM Markus Schneider-Pargmann (TI)
<msp@baylibre.com> wrote:
>
> Hi,
>
> Split the firmware memory region in more specific parts so it is better
> described where which information is stored. Specifically the LPM metadat=
a
> region is important as bootloader software like U-Boot has to know where
> that data is to be able to read that data and resume from RAM.
>
> IO+DDR is a deep sleep state in which a few pins are set to be sensitive
> for wakeup while the DDR is kept in self refresh. Everything else is
> powered off.
>
> The changes in this series were suggested as part of the IO+DDR u-boot se=
ries:
>   https://lore.kernel.org/r/814c211f-a9eb-4311-bb84-165b1a69755f@ti.com
>
> There are currently no real users of the memory-region that is split in
> this series. The size of the memory-region in total stays the same.
> The new layout is derived from the software running on the r5f
> processor:
>   https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/exampl=
es/drivers/ipc/ipc_rpmsg_echo_linux/am62ax-sk/r5fss0-0_freertos/ti-arm-clan=
g/linker.cmd#L172
>   https://github.com/TexasInstruments/mcupsdk-core-k3/blob/k3_main/source=
/drivers/device_manager/sciclient.h#L459
>
> Additionally the two important devicetree nodes for resuming from IO+DDR
> have the bootph-pre-ram flag added as this data needs to be read before
> the RAM is in use.
>
> Best
> Markus
>
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
> Changes in v3:
> - Squash the enforcement of the memory-region-names requirement in the
>   patch adding the memory-region-names, as suggested.
> - Link to v2: https://lore.kernel.org/r/20260312-topic-am62a-ioddr-dt-v6-=
19-v2-0-37cb7ceec658@baylibre.com
>
> Changes in v2:
> - Make memory-region-names required if memory-region is present
> - Fixup memory-region and memory-region-names conditions. Require either
>   2 or 6 regions for memory-region and memory-region-names
> - Reword and restructure the binding documentation for memory-region and
>   memory-region-names
> - Add memory-region-names to all uses of memory-region
> - Link to v1: https://lore.kernel.org/r/20260303-topic-am62a-ioddr-dt-v6-=
19-v1-0-12fe72bb40d2@baylibre.com
>
> ---
> Markus Schneider-Pargmann (TI) (7):
>       dt-bindings: remoteproc: k3-r5f: Split up memory regions
>       dt-bindings: remoteproc: k3-r5f: Add memory-region-names
>       arm64: dts: ti: k3: Use memory-region-names for r5f
>       arm64: dts: ti: k3-am62a7-sk: Split r5f memory region
>       arm64: dts: ti: k3-am62p5-sk: Split r5f memory region
>       arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to pre-ram bootphase
>       arm64: dts: ti: k3-am62p5-sk: Add r5f nodes to pre-ram bootphase

TI folks, Please make sure these dts patches are picked up for 7.1.
There's now a crap load of warnings in next with the binding change:

     58 (ti,am62-r5fss): r5f@78000000: 'memory-region-names' is a
required property
     30 (ti,am62-r5fss): r5f@79000000: 'memory-region-names' is a
required property
     22 (ti,j721s2-r5fss): r5f@5f00000: 'memory-region-names' is a
required property
     22 (ti,j721s2-r5fss): r5f@5e00000: 'memory-region-names' is a
required property
     22 (ti,j721s2-r5fss): r5f@5d00000: 'memory-region-names' is a
required property
     22 (ti,j721s2-r5fss): r5f@5c00000: 'memory-region-names' is a
required property
     22 (ti,j721s2-r5fss): r5f@41400000: 'memory-region-names' is a
required property
     22 (ti,j721s2-r5fss): r5f@41000000: 'memory-region-names' is a
required property
     21 (ti,am64-r5fss): r5f@78600000: 'memory-region-names' is a
required property
     21 (ti,am64-r5fss): r5f@78400000: 'memory-region-names' is a
required property
     21 (ti,am64-r5fss): r5f@78200000: 'memory-region-names' is a
required property
     21 (ti,am64-r5fss): r5f@78000000: 'memory-region-names' is a
required property
     12 (ti,j721s2-r5fss): r5f@5a00000: 'memory-region-names' is a
required property
     12 (ti,j721s2-r5fss): r5f@5900000: 'memory-region-names' is a
required property
     12 (ti,am654-r5fss): r5f@41400000: 'memory-region-names' is a
required property
     12 (ti,am654-r5fss): r5f@41000000: 'memory-region-names' is a
required property
      9 (ti,j721e-r5fss): r5f@5f00000: 'memory-region-names' is a
required property
      9 (ti,j721e-r5fss): r5f@5e00000: 'memory-region-names' is a
required property
      9 (ti,j721e-r5fss): r5f@5d00000: 'memory-region-names' is a
required property
      9 (ti,j721e-r5fss): r5f@5c00000: 'memory-region-names' is a
required property
      9 (ti,j721e-r5fss): r5f@41400000: 'memory-region-names' is a
required property
      9 (ti,j721e-r5fss): r5f@41000000: 'memory-region-names' is a
required property
      4 (ti,am62-r5fss): r5f@78400000: 'memory-region-names' is a
required property
      3 (ti,j7200-r5fss): r5f@5d00000: 'memory-region-names' is a
required property
      3 (ti,j7200-r5fss): r5f@5c00000: 'memory-region-names' is a
required property
      3 (ti,j7200-r5fss): r5f@41400000: 'memory-region-names' is a
required property
      3 (ti,j7200-r5fss): r5f@41000000: 'memory-region-names' is a
required property

If they aren't applied, making  'memory-region-names' required needs
to be dropped from the binding.

Rob

