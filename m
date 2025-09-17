Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B787CAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NS+2TMW4a/gl2sgYIe2u6WUeHZdcfg3javQWIkrkKM=; b=vee5JXJ3TRO9KytQF/UAxaYYNZ
	wpx78R59844YNXN1B/iFviTZuxs4aPlCrPQ53F3RpCTLbbbuUiaTFi8u0gZV3hH8IoSEg6UdVRC82
	CHJdyLR6IkHLzTMShBxfM8nSOIPMacODckWt5dVvd6u6Scwdw81A5HmxB84h1AyLcVuRGojZSfa1Z
	Naky4AgcJnI2p5+tMTLoFj3I8xMLi/A8bOJv/9qszuKYBNptAn3OHJd7n0SNlm7Tmh55vMBna/T2z
	LVmyF7ZjSXi4VTPtWqlYwBh8FEbsC4pkg+19NwZEWvrifColnlorKOXSCpVf8DUjm8cp8WROdQyEb
	IvNUznFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuLR-0000000Cqok-2E6v;
	Wed, 17 Sep 2025 15:45:21 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuLP-0000000Cqms-1iiJ;
	Wed, 17 Sep 2025 15:45:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758123894; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WUDPUqRYYRpGM37VGj/cDz9tsmHSCH7z2usKWo4WfYTFqwOWSYE7WlmN9fw201sgDuk1auBBLGi62GkV8TtF9s7/PnDX8S6ddHutLFO7p7H5y7cjaE1HhneNt7w16P+Sd4TcRx3JasYFYSVV6hwqJplrgWuOn80/JuWTSDwnqzI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758123894; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9NS+2TMW4a/gl2sgYIe2u6WUeHZdcfg3javQWIkrkKM=; 
	b=Q6XxApfyDbvekZy13u7UvGapk6xX8cS6oImN9Th02x4R+gX1Q1wZHNYtfkECfuGe0NmayPJmOIc0rdqbj8Dh7BvWq4d6ogfOATfBaK78d8xQS+7fhNtWuh36VO1JhybMhio0M+BYxPH5T9RhmR8JEYQxv1hiowCmmlpYeq6dS+s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758123893;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=9NS+2TMW4a/gl2sgYIe2u6WUeHZdcfg3javQWIkrkKM=;
	b=NejvthPT83l3L66HVbJc2UCAMq88GBLUvu9INaOe4bXmqYIkpMKH9YFvQVqBiCWe
	JRSk21bXGQPYakduq5EBPTIVWkcYq1OEXEw4VS5S4stMkKfmsTehLdMEzDQvhkCUhWv
	yYkmDj2SkWchceg9TOiUEGXU4Y46MszU/vabMa/M=
Received: by mx.zohomail.com with SMTPS id 1758123892638662.0849377963553;
	Wed, 17 Sep 2025 08:44:52 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 00/10] MT8196 GPU Frequency/Power Control Support
Date: Wed, 17 Sep 2025 17:44:43 +0200
Message-ID: <2162077.CQOukoFCf9@workhorse>
In-Reply-To: <CAPDyKFoi9KcsP5k84cSxuXNuMHmcf3a8emfOc6hMjGm_0FMk8w@mail.gmail.com>
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
 <CAPDyKFoi9KcsP5k84cSxuXNuMHmcf3a8emfOc6hMjGm_0FMk8w@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_084519_500871_213B8DFF 
X-CRM114-Status: GOOD (  35.96  )
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

On Wednesday, 17 September 2025 15:28:59 Central European Summer Time Ulf Hansson wrote:
> On Wed, 17 Sept 2025 at 14:23, Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
> >
> > This series introduces two new drivers to accomplish controlling the
> > frequency and power of the Mali GPU on MediaTek MT8196 SoCs.
> >
> > The reason why it's not as straightforward as with other SoCs is that
> > the MT8196 has quite complex glue logic in order to squeeze the maximum
> > amount of performance possible out of the silicon. There's an additional
> > MCU running a specialised firmware, which communicates with the
> > application processor through a mailbox and some SRAM, and is in charge
> > of controlling the regulators, the PLL clocks, and the power gating of
> > the GPU, all while also being in charge of any DVFS control.
> >
> > This set of drivers is enough to communicate desired OPP index limits to
> > the aforementioned MCU, referred to as "GPUEB" from here on out. The
> > GPUEB is still free to lower the effective frequency if the GPU has no
> > jobs going on at all, even when a higher OPP is set. There's also
> > several more powerful OPPs it seemingly refuses to apply. The downstream
> > chromeos kernel also doesn't reach the frequencies of those OPPs, so we
> > assume this is expected.
> >
> > The frequency control driver lives in panthor's subdirectory, as it
> > needs to pass panthor some data. I've kept the tie-in parts generic
> > enough however to not make this a complete hack; mediatek_mfg (the
> > frequency control driver) registers itself as a "devfreq provider" with
> > panthor, and panthor picks it up during its probe function (or defers if
> > mediatek_mfg is not ready yet, after adding a device link first).
> >
> > It's now generic enough to where I'll ponder about moving the devfreq
> > provider stuff into a header in include/, and moving mediatek_mfg into
> > the drivers/soc/ subdirectory, but there were enough changes so far to
> > warrant a v3 without a move or further struct renames added, so that I
> > can get feedback on this approach.
> >
> > The mailbox driver is a fairly bog-standard common mailbox framework
> > driver, just specific to the firmware that runs on the GPUEB.
> 
> I had a brief look at the series and it seems to me that the devfreq
> thing here, may not be the perfect fit.
> 
> Rather than using a new binding  (#performance-domain-cells) to model
> a performance domain provider using devfreq, I think it could be more
> straightforward to model this using the common #power-domain-cells
> binding instead. As a power-domain provider then, which would be
> capable of scaling performance too. Both genpd and the OPP core
> already support this, though via performance-states (as indexes).
> 
> In fact, this looks very similar to what we have implemented for the
> Arm SCMI performance domain.
> 
> If you have a look at the below, I think it should give you an idea of
> the pieces.
> drivers/pmdomain/arm/scmi_perf_domain.c
> drivers/firmware/arm_scmi/perf.c
> Documentation/devicetree/bindings/firmware/arm,scmi.yaml (protocol@13
> is the performance protocol).
> 
> That said, I don't have a strong opinion, but just wanted to share my
> thoughts on your approach.

Yeah, I found out about the pmdomain set_performance_state callback
a few days ago. I've not looked into it much so far because not
unlike a veterinarian on a cattle ranch, I was elbow-deep in v3's
guts already and didn't want to pivot to something different before
pushing it out, but I'll look into it more seriously now.

Even if it means I have to get rid of my fun array binary search
and rely on the opp core to do its linear time linked list
traversal. :'( (But moving OPP core to use XArrays instead is a
concern for the future.)

I've also been avoiding it because I didn't know how much
additional functionality we'll add later, but I've talked with
Angelo about it an hour ago and he agrees that I should go down
the pmdomain route for the current functionality.

Thank you for the hints!

Kind regards,
Nicolas Frattaroli

> 
> [...]
> 
> Kind regards
> Uffe
> 





