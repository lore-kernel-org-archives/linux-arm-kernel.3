Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F41E77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMG9VWcGW6XK+xMZkzrylicgj/+zPFuMCrXN5cYEltk=; b=aiq6p0Tu9hym9DSoBKsWV6q7sx
	OCA9xqkZpwS8pAsXHRnt6Nas6r31pSBzsH6D8XeIqFsEFQfS2vTm9t4rvzuurNLqDZeDgNNn319ev
	+qs9VELnSEttdLH+YAXPsd67zSqflflPrSvKrBV1mphj/DtdD8E9id9/j7Y8YQjyhw7xK7UFjOErr
	RDlIRzXa+iDBHokE6F3qIUK8atliBJ7tSFW8SD7FfaAjpbv6oddnoY4KNGIlbsuz8nbKYs+VNOVdo
	7xw/MFSGEX2rTw7GJ8kwnLkcELcQUodc9XvT3BzaVsnIJbs6Nc39aa5ooeMtv9GG0F3RHYQHe2qz+
	jw6VdnuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrvy-0000000D7Q0-0vbl;
	Wed, 04 Dec 2024 16:09:02 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrlv-0000000D4fq-0QXA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:58:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-434a90fed23so58944935e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 07:58:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327917; x=1733932717; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mMG9VWcGW6XK+xMZkzrylicgj/+zPFuMCrXN5cYEltk=;
        b=FpdXFJUKIerlTd9g033T0Y990v8iZqwLI608ahxZb9YiWP+IcQd9MMo4ecOkGWFnVi
         qVvmImImq0EyYfPXaYvqqT11WPvO8Fe+sD4prWdu5PR7cpAmpkzjlyMvkE1L44Ry6qJb
         ZAduNSIFwbizxTXoYNUd9ou7y82NnyZTYpFyXcfsiWxUPFK6QwyZS8wHid7epy3fFTRY
         WwHS3mUfTgNnyx77uMVmyJwYlKgn8d7vnuM1pqw4iX2JnvEgY/2Bu5z7nRpQIe71GB72
         fVOBVZ48r5LfOEO7gRRy8lSBhGH8Fy5b3tv3cRDGftvKd98MCBMj/am1EwWQgh/3u8Qi
         umAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327917; x=1733932717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMG9VWcGW6XK+xMZkzrylicgj/+zPFuMCrXN5cYEltk=;
        b=GRIwvOVD3dSRVUH38rJwfzWsVpL2Q1TSYk0P2huwiCOeDnTZaWjiecNkt5SeSCqcBm
         h8zl0+AJZ8BTQ+g4OwwT9Kd4O20jqb5PD0LklwJc4rKEd6bj9DF8thHgSmeaGaUsJGDp
         ThmZ883D2JX8V/4J0iBlmSeUCKjkKcdY6Vc8CXrTXJJPpzYxygzBea2mdgysoB7BwSgC
         BJPKKyL0jFJ405OvW7lfAPkmnfVxx/o75gnwvT1JH0LLgHSZTmBpC+BVUCQlCR3L9cvI
         4l9XP+tofiJVAMoqpuVkV0fXAHufxYlRD/ki+H/ki+sGGjSuJ6vB7/BJ56Gi36VIg2IS
         DPWA==
X-Forwarded-Encrypted: i=1; AJvYcCVcBs3K4sn8H+Swnzsu24OHTRZb/gZIv7s1G9t+zXXgdEbgOk5NspbyHIwIaTvwRWaJZ61Jvzgm9ddlWWOtAh60@lists.infradead.org
X-Gm-Message-State: AOJu0YxndOrJL152v/wm5wvxxaBTNLo2+ZjFYx0DD9HvCs2hzCbLvHgf
	QwHKLu1cxAMo1UNHPRKhJvFEjiASIp2l010P20FyQro+bH/isr2r
X-Gm-Gg: ASbGncueak1tTfB7sc/3Bdy/4tzJyuDPDXSbqZkgH3pHyRm0ocEoFL68SDudLFbt95Y
	+WpcnQCw9dyRc8Lm5YyEJJHIp29U15kp/Qim7F+QNaPdcpuv/9Hk9YCIGT4ccIkd7WTOqy8jAPL
	bLKpcpmanfqEpTKYsa7YlX6WQwhLFBezKG5ENGXtwLbq6P337lX275YqqWpUxGIbvaBvLNpUpy9
	f3fFsINtkd1Vej9R0xMWgH98dpxBLkUWcD1hK/dSnER4/MuYwRakLeTly8FK00yjyCnr6nJ6zKb
	IZrPI4m+dfVNOADY8e6XbeMrhCYsdbj8wisA
X-Google-Smtp-Source: AGHT+IHO71cSsB7ROtvHoZs2gzZ0MtQJUhn4XUUKyoKwjM4QzdG/kDeL3+etQeFOAswozQMP3lNc1g==
X-Received: by 2002:a05:600c:3554:b0:431:6083:cd38 with SMTP id 5b1f17b1804b1-434d09b0020mr60787685e9.6.1733327917130;
        Wed, 04 Dec 2024 07:58:37 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52a46e6sm29690685e9.30.2024.12.04.07.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:58:36 -0800 (PST)
Date: Wed, 4 Dec 2024 16:58:34 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Furong Xu <0x1207@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jon Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com, 
	Suraj Jaiswal <quic_jsuraj@quicinc.com>, Thierry Reding <treding@nvidia.com>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH net v1] net: stmmac: TSO: Fix unbalanced DMA map/unmap
 for non-paged SKB data
Message-ID: <2g2lp3bkadc4wpeslmdoexpidoiqzt7vejar5xhjx5ayt3uox3@dqdyfzn6khn6>
References: <20241021061023.2162701-1-0x1207@gmail.com>
 <d8112193-0386-4e14-b516-37c2d838171a@nvidia.com>
 <20241128144501.0000619b@gmail.com>
 <20241202163309.05603e96@kernel.org>
 <20241203100331.00007580@gmail.com>
 <20241202183425.4021d14c@kernel.org>
 <20241203111637.000023fe@gmail.com>
 <klkzp5yn5kq5efgtrow6wbvnc46bcqfxs65nz3qy77ujr5turc@bwwhelz2l4dw>
 <df3a6a9d-4b53-4338-9bc5-c4eea48b8a40@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lrjlcvs3uibftgsq"
Content-Disposition: inline
In-Reply-To: <df3a6a9d-4b53-4338-9bc5-c4eea48b8a40@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_075839_146243_1B669EB0 
X-CRM114-Status: GOOD (  37.86  )
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


--lrjlcvs3uibftgsq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net v1] net: stmmac: TSO: Fix unbalanced DMA map/unmap
 for non-paged SKB data
MIME-Version: 1.0

On Wed, Dec 04, 2024 at 02:06:00PM +0000, Robin Murphy wrote:
> On 2024-12-04 1:57 pm, Thierry Reding wrote:
> > On Tue, Dec 03, 2024 at 11:16:37AM +0800, Furong Xu wrote:
> > > On Mon, 2 Dec 2024 18:34:25 -0800, Jakub Kicinski <kuba@kernel.org> w=
rote:
> > >=20
> > > > On Tue, 3 Dec 2024 10:03:31 +0800 Furong Xu wrote:
> > > > > I requested Jon to provide more info about "Tx DMA map failed" in=
 previous
> > > > > reply, and he does not respond yet.
> > > >=20
> > > > What does it mean to provide "more info" about a print statement fr=
om
> > > > the driver? Is there a Kconfig which he needs to set to get more in=
fo?
> > > > Perhaps you should provide a debug patch he can apply on his tree, =
that
> > > > will print info about (1) which buffer mapping failed (head or frag=
s);
> > > > (2) what the physical address was of the buffer that couldn't be ma=
pped.
> > >=20
> > > A debug patch to print info about buffer makes no sense here.
> > > Both Tegra186 Jetson TX2(tegra186-p2771-0000) and Tegra194 Jetson AGX=
 Xavier
> > > (tegra194-p2972-0000) enable IOMMU/SMMU for stmmac in its device-tree=
 node,
> > > buffer info should be investigated with detailed IOMMU/SMMU debug inf=
o from
> > > drivers/iommu/arm/arm-smmu/arm-smmu-nvidia.c together.
> > >=20
> > > I am not an expert in IOMMU, so I cannot help more.
> > >=20
> > > Without the help from Jon, our only choice is revert as you said.
> >=20
> > I was able to reproduce this locally and I get this splat:
> >=20
> > --- >8 ---
> > [  228.179234] WARNING: CPU: 0 PID: 0 at drivers/iommu/io-pgtable-arm.c=
:346 __arm_lpae_map+0x388/0x4e4
> > [  228.188300] Modules linked in: snd_soc_tegra210_mixer snd_soc_tegra2=
10_admaif snd_soc_tegra_pcm snd_soc_tegra186_asrc snd_soc_tegra210_ope snd_=
soc_tegra210_adx snd_soc_tegra210_mvc snd_soc_tegra210_dmic snd_soc_tegra18=
6_dspk snd_soc_tegra210_sfc snd_soc_tegra210_amx snd_soc_tegra210_i2s tegra=
_drm drm_dp_aux_bus cec drm_display_helper drm_client_lib tegra210_adma snd=
_soc_tegra210_ahub drm_kms_helper snd_hda_codec_hdmi snd_hda_tegra snd_soc_=
tegra_audio_graph_card at24 snd_hda_codec ina3221 snd_soc_audio_graph_card =
snd_soc_simple_card_utils tegra_bpmp_thermal tegra_xudc snd_hda_core tegra_=
aconnect host1x fuse drm backlight ipv6
> > [  228.243750] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G S       =
          6.13.0-rc1-next-20241203 #30
> > [  228.253412] Tainted: [S]=3DCPU_OUT_OF_SPEC
> > [  228.257336] Hardware name: nvidia NVIDIA P2771-0000-500/NVIDIA P2771=
-0000-500, BIOS 2025.01-rc3-00040-g36352ae2e68e-dirty 01/01/2025
> > [  228.269239] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BT=
YPE=3D--)
> > [  228.276205] pc : __arm_lpae_map+0x388/0x4e4
> > [  228.280398] lr : __arm_lpae_map+0x120/0x4e4
> > [  228.284587] sp : ffff8000800037f0
> > [  228.287901] x29: ffff800080003800 x28: 0000000000000002 x27: 0000000=
000000001
> > [  228.295050] x26: 0000000000000001 x25: 0000000111580000 x24: 0000000=
000001000
> > [  228.302197] x23: 000000ffffc72000 x22: 0000000000000ec0 x21: 0000000=
000000003
> > [  228.309342] x20: 0000000000000001 x19: ffff00008574b000 x18: 0000000=
000000001
> > [  228.316486] x17: 0000000000000000 x16: 0000000000000001 x15: ffff800=
080003ad0
> > [  228.323631] x14: ffff00008574d000 x13: 0000000000000000 x12: 0000000=
000000001
> > [  228.330775] x11: 0000000000000001 x10: 0000000000000001 x9 : 0000000=
000001000
> > [  228.337921] x8 : ffff00008674c390 x7 : ffff00008674c000 x6 : 0000000=
000000003
> > [  228.345066] x5 : 0000000000000003 x4 : 0000000000000001 x3 : 0000000=
000000002
> > [  228.352209] x2 : 0000000000000001 x1 : 0000000000000000 x0 : ffff000=
08574b000
> > [  228.359356] Call trace:
> > [  228.361807]  __arm_lpae_map+0x388/0x4e4 (P)
> > [  228.366002]  __arm_lpae_map+0x120/0x4e4 (L)
> > [  228.370198]  __arm_lpae_map+0x120/0x4e4
> > [  228.374042]  __arm_lpae_map+0x120/0x4e4
> > [  228.377886]  __arm_lpae_map+0x120/0x4e4
> > [  228.381730]  arm_lpae_map_pages+0x108/0x250
> > [  228.385922]  arm_smmu_map_pages+0x40/0x120
> > [  228.390029]  __iommu_map+0xfc/0x1bc
> > [  228.393525]  iommu_map+0x38/0xc0
> > [  228.396759]  __iommu_dma_map+0xb4/0x1a4
> > [  228.400604]  iommu_dma_map_page+0x14c/0x27c
> > [  228.404795]  dma_map_page_attrs+0x1fc/0x280
> > [  228.408987]  stmmac_tso_xmit+0x2d0/0xbac
> > [  228.412920]  stmmac_xmit+0x230/0xd14
> > [  228.416505]  dev_hard_start_xmit+0x94/0x11c
> > [  228.420697]  sch_direct_xmit+0x8c/0x380
> > [  228.424540]  __qdisc_run+0x11c/0x66c
> > [  228.428121]  net_tx_action+0x168/0x228
> > [  228.431875]  handle_softirqs+0x100/0x244
> > [  228.435809]  __do_softirq+0x14/0x20
> > [  228.439303]  ____do_softirq+0x10/0x20
> > [  228.442972]  call_on_irq_stack+0x24/0x64
> > [  228.446903]  do_softirq_own_stack+0x1c/0x40
> > [  228.451091]  __irq_exit_rcu+0xd4/0x10c
> > [  228.454847]  irq_exit_rcu+0x10/0x1c
> > [  228.458343]  el1_interrupt+0x38/0x68
> > [  228.461927]  el1h_64_irq_handler+0x18/0x24
> > [  228.466032]  el1h_64_irq+0x6c/0x70
> > [  228.469438]  default_idle_call+0x28/0x58 (P)
> > [  228.473718]  default_idle_call+0x24/0x58 (L)
> > [  228.477998]  do_idle+0x1fc/0x260
> > [  228.481234]  cpu_startup_entry+0x34/0x3c
> > [  228.485163]  rest_init+0xdc/0xe0
> > [  228.488401]  console_on_rootfs+0x0/0x6c
> > [  228.492250]  __primary_switched+0x88/0x90
> > [  228.496270] ---[ end trace 0000000000000000 ]---
> > [  228.500950] dwc-eth-dwmac 2490000.ethernet: Tx dma map failed
> > --- >8 ---
> >=20
> > This looks to be slightly different from what Jon was seeing. Looking at
> > the WARN_ON() that triggers this, it seems like for some reason the page
> > is getting mapped twice.
> >=20
> > Not exactly sure why that would be happening, so adding Robin and Will,
> > maybe they can shed some light on this from the ARM SMMU side.
> >=20
> > Robin, Will, any idea who could be the culprit here? Is this a map/unmap
> > imbalance or something else entirely?
>=20
> If valid PTEs are getting left behind in the pagetable, that would indica=
te
> that a previous dma_unmap_page() was called with a size smaller than its
> original dma_map_page(). Throwing CONFIG_DMA_API_DEBUG at it should
> hopefully shed more light.

Bull's-eye! DMA_API_DEBUG does flag this:

--- >8 ---
[   60.469121] DMA-API: dwc-eth-dwmac 2490000.ethernet: device driver tries=
 to free DMA memory it has not allocated [device add ress=3D0x000000ffffcf6=
5c0] [size=3D66 bytes]
1
[   60.486534] WARNING: CPU: 0 PID: 0 at kernel/dma/debug.c:972 check_unmap=
+0x564/0x8f0
[   60.494493] Modules linked in: snd_soc_tegra210_admaif snd_soc_tegra_pcm=
 snd_soc_tegra210_ope snd_soc_tegra186_asrc snd_soc_tegra210_amx snd_soc_te=
gra210_mv
c snd_soc_tegra210_mixer snd_soc_tegra210_dmic snd_soc_tegra210_sfc snd_soc=
_tegra186_dspk snd_soc_tegra210_i2s snd_soc_tegra210_adx tegra_drm drm_dp_a=
ux_bus ce
c drm_display_helper drm_client_lib drm_kms_helper tegra210_adma snd_soc_te=
gra210_ahub snd_hda_codec_hdmi snd_soc_tegra_audio_graph_card snd_hda_tegra=
 snd_soc_
audio_graph_card snd_hda_codec snd_soc_simple_card_utils at24 snd_hda_core =
ina3221 tegra_aconnect tegra_xudc tegra_bpmp_thermal host1x fuse drm backli=
ght ipv6
[   60.549857] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G S           =
      6.13.0-rc1-next-20241203 #31
[   60.559504] Tainted: [S]=3DCPU_OUT_OF_SPEC
[   60.563423] Hardware name: nvidia NVIDIA P2771-0000-500/NVIDIA P2771-000=
0-500, BIOS 2025.01-rc3-00040-g36352ae2e68e-dirty 01/01/2025
[   60.575317] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   60.582273] pc : check_unmap+0x564/0x8f0
[   60.586197] lr : check_unmap+0x564/0x8f0
[   60.590117] sp : ffff800080003b50
[   60.593428] x29: ffff800080003b50 x28: ffff0000825309c0 x27: ffff0000825=
313c0
[   60.600562] x26: 00000000000001b9 x25: 0000000000000001 x24: ffff0000801=
1b410
[   60.607696] x23: ffff800082059ec0 x22: 0000000000000000 x21: ffff8000825=
b25c8
[   60.614829] x20: ffff800080003bc0 x19: 000000ffffcf65c0 x18: 00000000000=
00006
[   60.621962] x17: 645b206465746163 x16: 0000000000000000 x15: 07200720072=
00720
[   60.629095] x14: ffff800082074960 x13: 0720072007200720 x12: 07200720072=
00720
[   60.636229] x11: ffff800082074960 x10: 0000000000000299 x9 : ffff8000820=
cc960
[   60.643362] x8 : 0000000000017fe8 x7 : 00000000fffff000 x6 : ffff8000820=
cc960
[   60.650496] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 00000000000=
00000
[   60.657629] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff8000820=
64900
[   60.664763] Call trace:
[   60.667206]  check_unmap+0x564/0x8f0 (P)
[   60.671131]  check_unmap+0x564/0x8f0 (L)
[   60.675055]  debug_dma_unmap_page+0xac/0xc0
[   60.679239]  dma_unmap_page_attrs+0xf4/0x200
[   60.683508]  stmmac_tx_clean.constprop.0+0x1ac/0x7bc
[   60.688474]  stmmac_napi_poll_tx+0xdc/0x168
[   60.692657]  __napi_poll+0x38/0x180
[   60.696148]  net_rx_action+0x158/0x2c0
[   60.699897]  handle_softirqs+0x100/0x244
[   60.703821]  __do_softirq+0x14/0x20
[   60.707309]  ____do_softirq+0x10/0x20
[   60.710970]  call_on_irq_stack+0x24/0x64
[   60.714891]  do_softirq_own_stack+0x1c/0x40
[   60.719072]  __irq_exit_rcu+0xd4/0x10c
[   60.722821]  irq_exit_rcu+0x10/0x1c
[   60.726308]  el1_interrupt+0x38/0x68
[   60.729886]  el1h_64_irq_handler+0x18/0x24
[   60.733980]  el1h_64_irq+0x6c/0x70
[   60.737381]  default_idle_call+0x28/0x58 (P)
[   60.741652]  default_idle_call+0x24/0x58 (L)
[   60.745920]  do_idle+0x1fc/0x260
[   60.749149]  cpu_startup_entry+0x34/0x3c
[   60.753068]  rest_init+0xdc/0xe0
[   60.756296]  console_on_rootfs+0x0/0x6c
[   60.760135]  __primary_switched+0x88/0x90
[   60.764146] ---[ end trace 0000000000000000 ]---
--- >8 ---

This doesn't match the location from earlier, but at least there's
something afoot here that needs fixing. I suppose this could simply be
hiding any subsequent errors, so once this is fixed we might see other
similar issues.

Furong, I can look into this some more, but I'm not at all familiar with
this part of the driver, so I don't really know where this could be
originating from. Any pointers would be appreciated. Also, if you think
there's anything I should try, I do have this setup that I can test on
locally.

Thierry

--lrjlcvs3uibftgsq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmdQfCYACgkQ3SOs138+
s6FjWhAAni5ilnFd5G+xoW+k7BqHpNA7A+YjYGceNk3Ae7gX/rgCXRHqjnoCFS/o
qqLEJr/IQ7HvXYyBbfXEaGtXTX3v6QM/RXPqZOAFt4K/e7+4X0zJC51UAmdtcGpp
jV0FflBnCVvMd+LdLqAN7OEIQnFyXp8wb1+k3V9BOqj/CG/V2QbIyJU3Ff4v0GlX
ljiHkd3gQcd5te7e0u5H4O9tf794jEc2iQBf+wKeEZLN5Dqkf8XRDpP8GSWiwVhx
EgqjxxaVLcRZb0wiPmulyoWx7iKi0a1He1SefSbAqTkxuLP7iaXmMtffrZfYEkyT
W+MLvtEmpp1+7MSL7I3JD/UYXh5gXqIE3I/flECwPcpH+tTmmW+NvA5kmvS/Z7y4
aYnAez5jv65vGpwFMkFZTbw7oaPV00BKpXliyCe25ghDwKA2NOHlR1qt1bz+d/jE
gUYO2wWBWnX2zpuUfYEVzPjKWsFSsand4WUwRQOcsGNk1UKXMI4aoTagOU1vG2aZ
DIHJFVQx/bHAZh025m30UdcKr8mwpQHQHkOGEmmxJhxW5YzHHOLNTU7ANPXawPUR
Uvqqql88Luxfw9EU+DYABmP6kFll+Gh2kOs81IjZkc4uyrNNzGL6/ydluzntwoEq
TiP+c/2g0jY+/mJquWKvs2S7qjv9h5L/XG4NKeOX+xxN+mYxNAI=
=HkJp
-----END PGP SIGNATURE-----

--lrjlcvs3uibftgsq--

