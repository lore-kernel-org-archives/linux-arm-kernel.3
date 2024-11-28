Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E4CD65553
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 06:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAjb6ZpXEC+1NOjeuLOAmg/8jYxuF/vimdMJw+lRbKY=; b=D1eOoHAmnDqZhT5hEXwuFNfxQZ
	5WpbO000AOwwXbE6p9Ku3nl9yNroWKonjOTZFXBw5DG66/RCHck3gzPfQG8M3oI6OoshcVVZ/ryf2
	3mANVceKCqXbsva+HVNkMNfscnE6YBNZakfkUZpU9HvcUAB18ejPcH+HrCHm+KSCuxxCCD1choAhG
	F2U4gqY30iRiPj3ArzySsgE78A3e5xGoaabnT3v89BYI4I2WcAv09xYMJiczvqgEhXgygjpU4EUji
	Ah7Q8Zp3+931DmfpUaCzFsJXH8oqopsD/8ZK8AasMa0xyZv1SUEJLMb02xbttPL5+X0jjd2Ze8MjR
	95jdpSjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGYJq-0000000EpMc-1poc;
	Thu, 28 Nov 2024 06:48:06 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGYIF-0000000Ep87-1oom
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 06:46:28 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7fbce800ee5so436798a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 22:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732776386; x=1733381186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAjb6ZpXEC+1NOjeuLOAmg/8jYxuF/vimdMJw+lRbKY=;
        b=Cqo22iGDaD58c/4278PgE3AgQlF4uCCVIUiEMzBw42fxLRg5/wH1m7oDx/jGkxHKHL
         W4UfVqAO2BNW98dnXxF8iC+EGL6WFORfxBsM4/W/MUQXSHpnlFKEUSqag9lcpLoupNGy
         e/M7ie+5DTFMm78e8HvA5fwR+YmDkYPeajZzlKmJnpVNqjxhAwMDJ7VV8LYbDXtgg/1r
         UCfvcfme83BWSj1U+A4qm/WEv3nqv8nSY+K7VmEyU1r9AreLbOBjK++T0r1y9a7WB0It
         fCQUyQhUakw0nghT6zapvDoK6lE0Va5IQ0afxolpQmS6IRStTVuQaDYZIkWqHha+vkKm
         rUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732776386; x=1733381186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JAjb6ZpXEC+1NOjeuLOAmg/8jYxuF/vimdMJw+lRbKY=;
        b=L61ZXdwlWpPt2USvpEabZTEW2k6xrRKtelqvMSt21DjSqn+lVThhHzY+F2cgFuloXB
         hqaDRY8TtBm0Dlc6pfNSM3fk/nHDxhkRL2qirm+NLjlapFpY3RvD0MnDmi5cTo4YSwiQ
         Za9XGHRE3owkKDvXmCKtBysDoDJ2AQ2Iq1omSfrzZXfm4C2z4efBDPIyIkE+OhJWp9jQ
         6cZQsZ1UJRVnA8A4+tJWjOL4BlN8yE+v5d6faOGu/6CKejiLZslxifxkkfDpqvwO8NTI
         RbFRE0aKAwf8TVcEn1Tl81NS4CtZaUSRcQYj2i0nYCVs2zXlRAvh26Us+u9Rbbqg95Zi
         hLTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSeSB24XpAJwWgvsO1HM2Hw0axLBWMk2e/lTfVT8VkXefPLGgKLXg/CPEPq/8MwuxK2yJHdjLaafBVt/4SM5AF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc18pkACtGuFZePg8YH0f0wIPBkW3Io1AfYvNRksv6l8IKH7/P
	qzLpF8tq4MRKXcwgvThPvIwlr9XRZs/HJQs3IgQaxjP2uF9mEu8k
X-Gm-Gg: ASbGnct68Zt0v/Q6qGftq6dGBubLSMcq2JTw/iVprE1973cZGoed1YfFeS5U5KDQPVe
	Ml10xPXhH8V3x0iHwmfPhJG49R3ClmNL8WIBYqilGRbuOItJFaunwIRNjDe1dqsbAa/nHvPYKQQ
	e8Pzpekih3YWQXNFld5eVNHwvzSbEzCxe7di46LfYmn1hu8bM44HUeee+vNtE6iXRiEevdx3aSP
	X6OfMHukxoB3JnrVYzzZ0xLBctOHVfyJQ5VGbrdrZzLsRE=
X-Google-Smtp-Source: AGHT+IFpO1VQXaKHxnjRjpCl3gIEGLuAkIv7foeRJn6U3EckFUAJnHf5fhZ35vp4j35VEpP/1x6iZA==
X-Received: by 2002:a05:6a21:3291:b0:1e0:c5d2:f215 with SMTP id adf61e73a8af0-1e0e0adcdc3mr8858908637.12.1732776385861;
        Wed, 27 Nov 2024 22:46:25 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72541848924sm735843b3a.180.2024.11.27.22.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 22:46:25 -0800 (PST)
Date: Thu, 28 Nov 2024 14:45:01 +0800
From: Furong Xu <0x1207@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 xfr@outlook.com, Suraj Jaiswal <quic_jsuraj@quicinc.com>, Thierry Reding
 <treding@nvidia.com>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH net v1] net: stmmac: TSO: Fix unbalanced DMA map/unmap
 for non-paged SKB data
Message-ID: <20241128144501.0000619b@gmail.com>
In-Reply-To: <d8112193-0386-4e14-b516-37c2d838171a@nvidia.com>
References: <20241021061023.2162701-1-0x1207@gmail.com>
	<d8112193-0386-4e14-b516-37c2d838171a@nvidia.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_224627_476493_ED103EE2 
X-CRM114-Status: GOOD (  22.02  )
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

Hi Jon,

On Wed, 27 Nov 2024 18:39:53 +0000, Jon Hunter <jonathanh@nvidia.com> wrote:
> 
> I have noticed a lot of intermittent failures on a couple of our boards
> starting with Linux v6.12. I have finally bisected the issue to this
> change and reverting this change fixes the problem.
> 
> The boards where I am seeing this issue on are our Tegra186 Jetson TX2
> (tegra186-p2771-0000) and Tegra194 Jetson AGX Xavier
> (tegra194-p2972-0000).
> 
> Tegra184 has:
>   dwc-eth-dwmac 2490000.ethernet: User ID: 0x10, Synopsys ID: 0x41
> 
> Tegra194 has:
>   dwc-eth-dwmac 2490000.ethernet: User ID: 0x10, Synopsys ID: 0x50
> 
> Otherwise all the other propreties printed on boot are the same for both ...
> 
>   dwc-eth-dwmac 2490000.ethernet: 	DWMAC4/5
>   dwc-eth-dwmac 2490000.ethernet: DMA HW capability register supported
>   dwc-eth-dwmac 2490000.ethernet: RX Checksum Offload Engine supported
>   dwc-eth-dwmac 2490000.ethernet: TX Checksum insertion supported
>   dwc-eth-dwmac 2490000.ethernet: Wake-Up On Lan supported
>   dwc-eth-dwmac 2490000.ethernet: TSO supported
>   dwc-eth-dwmac 2490000.ethernet: Enable RX Mitigation via HW Watchdog Timer
>   dwc-eth-dwmac 2490000.ethernet: Enabled L3L4 Flow TC (entries=8)
>   dwc-eth-dwmac 2490000.ethernet: Enabled RFS Flow TC (entries=10)
>   dwc-eth-dwmac 2490000.ethernet: TSO feature enabled
>   dwc-eth-dwmac 2490000.ethernet: Using 40/40 bits DMA host/device width
> 
> 
> Looking at the console logs, when the problem occurs I see the
> following prints ...
> 
> [  245.571688] dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed
> [  245.575349] dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed
> 
> I also caught this crash ...
> 
> [  245.576690] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
> [  245.576715] Mem abort info:
> [  245.577009]   ESR = 0x0000000096000004
> [  245.577040]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  245.577142]   SET = 0, FnV = 0
> [  245.577355]   EA = 0, S1PTW = 0
> [  245.577439]   FSC = 0x04: level 0 translation fault
> [  245.577557] Data abort info:
> [  245.577628]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [  245.577753]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [  245.577878]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [  245.578018] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000106300000
> [  245.578168] [0000000000000008] pgd=0000000000000000, p4d=0000000000000000
> [  245.578390] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> [  245.578528] Modules linked in: snd_soc_tegra210_admaif snd_soc_tegra_pcm tegra_drm snd_soc_tegra186_asrc snd_soc_tegra210_mixer snd_soc_tegra210_mvc snd_soc_tegra210_ope snd_soc_tegra210_dmic drm_dp_aux_bus snd_soc_tegra210_adx snd_soc_tegra210_amx cec snd_soc_tegra210_sfc drm_display_helper snd_soc_tegra210_i2s drm_kms_helper snd_soc_tegra_audio_graph_card ucsi_ccg typec_ucsi snd_soc_rt5659 snd_soc_audio_graph_card drm backlight tegra210_adma snd_soc_tegra210_ahub crct10dif_ce snd_soc_simple_card_utils pwm_fan snd_soc_rl6231 typec ina3221 snd_hda_codec_hdmi tegra_aconnect pwm_tegra snd_hda_tegra snd_hda_codec snd_hda_core phy_tegra194_p2u tegra_xudc at24 lm90 pcie_tegra194 host1x tegra_bpmp_thermal ip_tables x_tables ipv6
> [  245.626942] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Tainted: G        W          6.12.0 #5
> [  245.635072] Tainted: [W]=WARN
> [  245.638220] Hardware name: NVIDIA Jetson AGX Xavier Developer Kit (DT)
> [  245.645039] pstate: 40400009 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  245.651870] pc : skb_release_data+0x100/0x1e4
> [  245.656334] lr : sk_skb_reason_drop+0x44/0xb0
> [  245.660797] sp : ffff800080003c80
> [  245.664206] x29: ffff800080003c80 x28: ffff000083d58980 x27: 0000000000000900
> [  245.671813] x26: ffff000083d5c980 x25: ffff0000937c03c0 x24: 0000000000000002
> [  245.678906] x23: 00000000ffffffff x22: 0000000000000001 x21: ffff000096ae8200
> [  245.686258] x20: 0000000000000000 x19: 0000000000000000 x18: 0000000000004860
> [  245.693605] x17: ffff80037be97000 x16: ffff800080000000 x15: ffff8000827d4968
> [  245.700870] x14: fffffffffffe485f x13: 2e656572662d7265 x12: 7466612d65737520
> [  245.707957] x11: ffff8000827d49e8 x10: ffff8000827d49e8 x9 : 00000000ffffefff
> [  245.715306] x8 : ffff80008282c9e8 x7 : 0000000000017fe8 x6 : 00000000fffff000
> [  245.722825] x5 : ffff0003fde07348 x4 : ffff0000937c03c0 x3 : ffff0000937c0280
> [  245.729762] x2 : 0000000000000140 x1 : ffff0000937c03c0 x0 : 0000000000000000
> [  245.737009] Call trace:
> [  245.739459]  skb_release_data+0x100/0x1e4
> [  245.743657]  sk_skb_reason_drop+0x44/0xb0
> [  245.747684]  dev_kfree_skb_any_reason+0x44/0x50
> [  245.752490]  stmmac_tx_clean+0x1ec/0x798
> [  245.756177]  stmmac_napi_poll_tx+0x6c/0x144
> [  245.760199]  __napi_poll+0x38/0x190
> [  245.763868]  net_rx_action+0x140/0x294
> [  245.767888]  handle_softirqs+0x120/0x24c
> [  245.771574]  __do_softirq+0x14/0x20
> [  245.775326]  ____do_softirq+0x10/0x1c
> [  245.778748]  call_on_irq_stack+0x24/0x4c
> [  245.782510]  do_softirq_own_stack+0x1c/0x2c
> [  245.786964]  irq_exit_rcu+0x8c/0xc4
> [  245.790463]  el1_interrupt+0x38/0x68
> [  245.794139]  el1h_64_irq_handler+0x18/0x24
> [  245.798166]  el1h_64_irq+0x64/0x68
> [  245.801318]  default_idle_call+0x28/0x3c
> [  245.805166]  do_idle+0x208/0x264
> [  245.808576]  cpu_startup_entry+0x34/0x3c
> [  245.812088]  kernel_init+0x0/0x1d8
> [  245.815594]  start_kernel+0x5c0/0x708
> [  245.819076]  __primary_switched+0x80/0x88
> [  245.823295] Code: 97fff632 72001c1f 54000161 370005b3 (f9400661)
> [  245.829151] ---[ end trace 0000000000000000 ]---
> 
> 
> And here is another crash ...
> 
> [  149.986210] dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed
> [  149.992845] kernel BUG at lib/dynamic_queue_limits.c:99!
> [  149.998152] Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP
> [  150.004928] Modules linked in: snd_soc_tegra210_admaif snd_soc_tegra186_asrc snd_soc_tegra_pcm snd_soc_tegra210_mixer snd_soc_tegra210_mvc snd_soc_tegra210_ope snd_soc_tegra210_dmic snd_soc_tegra186_dspk snd_soc_tegra210_adx snd_soc_tegra210_amx snd_soc_tegra210_sfc snd_soc_tegra210_i2s tegra_drm drm_dp_aux_bus cec drm_display_helper drm_kms_helper tegra210_adma snd_soc_tegra210_ahub drm backlight snd_soc_tegra_audio_graph_card snd_soc_audio_graph_card snd_soc_simple_card_utils crct10dif_ce tegra_bpmp_thermal at24 tegra_aconnect snd_hda_codec_hdmi tegra_xudc snd_hda_tegra snd_hda_codec snd_hda_core ina3221 host1x ip_tables x_tables ipv6
> [  150.061268] CPU: 5 UID: 102 PID: 240 Comm: systemd-resolve Tainted: G S      W          6.12.0-dirty #7
> [  150.070654] Tainted: [S]=CPU_OUT_OF_SPEC, [W]=WARN
> [  150.075438] Hardware name: NVIDIA Jetson TX2 Developer Kit (DT)
> [  150.081348] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [  150.088303] pc : dql_completed+0x1fc/0x20c
> [  150.092401] lr : stmmac_tx_clean+0x3b4/0x798
> [  150.096669] sp : ffff800082d73d00
> [  150.099979] x29: ffff800082d73d00 x28: ffff000080898980 x27: 0000000000002ce0
> [  150.107115] x26: ffff00008089c980 x25: 0000000000000000 x24: ffff000083c88000
> [  150.114248] x23: 0000000000000000 x22: 0000000000000001 x21: ffff000080898980
> [  150.121380] x20: 0000000000000000 x19: 0000000000000168 x18: 0000000000006540
> [  150.128513] x17: ffff800172d32000 x16: ffff800082d70000 x15: ffff8000827d4968
> [  150.135646] x14: fffffffffffe653f x13: 2e656572662d7265 x12: 7466612d65737520
> [  150.142781] x11: ffff8000827d49e8 x10: ffff8000827d49e8 x9 : 0000000000000000
> [  150.149913] x8 : 000000000003ca11 x7 : 0000000000017fe8 x6 : 000000000003ca11
> [  150.157046] x5 : ffff000080d09140 x4 : ffff0001f4cb0840 x3 : 000000000010fe05
> [  150.164181] x2 : 0000000000000000 x1 : 000000000000004a x0 : ffff000083c88080
> [  150.171314] Call trace:
> [  150.173757]  dql_completed+0x1fc/0x20c
> [  150.177507]  stmmac_napi_poll_tx+0x6c/0x144
> [  150.181688]  __napi_poll+0x38/0x190
> [  150.185174]  net_rx_action+0x140/0x294
> [  150.188921]  handle_softirqs+0x120/0x24c
> [  150.192843]  __do_softirq+0x14/0x20
> [  150.196328]  ____do_softirq+0x10/0x1c
> [  150.199987]  call_on_irq_stack+0x24/0x4c
> [  150.203908]  do_softirq_own_stack+0x1c/0x2c
> [  150.208088]  do_softirq+0x54/0x6c
> [  150.211401]  __local_bh_enable_ip+0x8c/0x98
> [  150.215583]  __dev_queue_xmit+0x4e4/0xd6c
> [  150.219588]  ip_finish_output2+0x4cc/0x5e8
> [  150.223682]  __ip_finish_output+0xac/0x17c
> [  150.227776]  ip_finish_output+0x34/0x10c
> [  150.231696]  ip_output+0x68/0xfc
> [  150.234921]  __ip_queue_xmit+0x16c/0x464
> [  150.238840]  ip_queue_xmit+0x14/0x20
> [  150.242413]  __tcp_transmit_skb+0x490/0xc4c
> [  150.246593]  tcp_connect+0xa08/0xdbc
> [  150.250167]  tcp_v4_connect+0x35c/0x494
> [  150.253999]  __inet_stream_connect+0xf8/0x3c8
> [  150.258354]  inet_stream_connect+0x48/0x70
> [  150.262447]  __sys_connect+0xe0/0xfc
> [  150.266021]  __arm64_sys_connect+0x20/0x30
> [  150.270113]  invoke_syscall+0x48/0x110
> [  150.273860]  el0_svc_common.constprop.0+0xc8/0xe8
> [  150.278561]  do_el0_svc+0x20/0x2c
> [  150.281875]  el0_svc+0x30/0xd0
> [  150.284929]  el0t_64_sync_handler+0x13c/0x158
> [  150.289282]  el0t_64_sync+0x190/0x194
> [  150.292945] Code: 7a401860 5400008b 2a0403e3 17ffff9c (d4210000)
> [  150.299033] ---[ end trace 0000000000000000 ]---
> [  150.303647] Kernel panic - not syncing: Oops - BUG: Fatal exception in interrupt
> 
> Let me know if you need any more information.
> 

[  149.986210] dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed
and
[  245.571688] dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed
[  245.575349] dwc-eth-dwmac 2490000.ethernet eth0: Tx DMA map failed
are reported by stmmac_xmit() obviously, but not stmmac_tso_xmit().

And these crashes are caused by "Tx DMA map failed", as you can see that
current driver code does not handle this kind of failure so well. It is clear
that we need to figure out why Tx DMA map failed.

This patch corrects the sequence and timing of DMA unmap by waiting all
DMA transmit descriptors to be closed by DMA engine for one DMA map in
stmmac_tso_xmit(), it never leaks DMA addresses and never introduces
other side effect.

"Tx DMA map failed" is a weird failure, and I cannot reproduce this failure
on my device with DWMAC CORE 5.10a(Synopsys ID: 0x51) and DWXGMAC CORE 3.20a.

