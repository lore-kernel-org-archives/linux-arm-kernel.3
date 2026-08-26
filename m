Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B66C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 17:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yYb0HNz5KGftss5YJcVkpZccia/QhI7Av14y4QDURk=; b=YzDf3stb78SihWICIT/pyNpEzn
	AoSOoCTpeZ6XB/zawjxOUplF3fY9e9yKrN9bUlmMCL9TGXlWkdfhdUxJyzn0C4D35vng1Ip/36ADC
	K+sESEgudiaStmOKuUx60uNyQXL48dtYyqiz6Ab7IiMJvEA1CHbHi34jI+AnE9a1axnDWNGE9WB8k
	iqTBNQ91B4eJFgz6dw4OUGRv3pZib3n7mqCgaEOwNLJpdUjdH3BaFF00DpPLUpTMjahP+Y3apD1Pg
	60CIogzNrFO4M2fL/W4hfdyLHo86WSwHy6DYgSl131rgTOU6WxVdyH2RQGGjQGdfvOOidmHY64oiE
	X9oYhdWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzHFt-00000002nqc-3d6e;
	Wed, 26 Aug 2026 17:17:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzHFr-00000002npe-08Mw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 17:17:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787764656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6yYb0HNz5KGftss5YJcVkpZccia/QhI7Av14y4QDURk=;
	b=JLB9w1BDhlGPX7eht8/VcLC/cXCpzHjwFHl26E1zArVKVD6h20HGyCIsQs7e6t1SMffd7l
	0QgEOdjQGRA3LaHFdRdR4Preoq1B9dNn08uapYT55M+/JEuee9Upvkkq+pJzFw6Uv8c0CN
	C8SocA7LMQ3CwBtZkMhe+QSVf2R+og0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-CKfkHf8NMdWT7wkFHFFdCw-1; Wed, 26 Aug 2026 13:17:34 -0400
X-MC-Unique: CKfkHf8NMdWT7wkFHFFdCw-1
X-Mimecast-MFC-AGG-ID: CKfkHf8NMdWT7wkFHFFdCw_1787764654
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936d067836eso116485785a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 10:17:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764654; x=1788369454;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6yYb0HNz5KGftss5YJcVkpZccia/QhI7Av14y4QDURk=;
        b=X9ts18EGmNZ7rKiXyh3jQYdJljJkrHMVkIA1wBxyZmTOoFIGlkTCWvANfTshv7XsoZ
         2SzEvQyrmE8fGZUnp/7uC5C+qMIc+KX+UIZd+DMErj/5miJ7OlyDHpYK5D951uPtNyOJ
         D0Bc+RhEFjdjnpS6uo5I2cBnN4pBMU0Asn3dtQuPvRr/lXz1JODzPolUtvqcIpSdejjH
         zEiBri5LLs0FvkvQHKYzTsPbGuB98rH4raP0CCYrrF7jbgbJHri2MGNUzG9dzAuhGpVZ
         vSxM6HN0R3T/f9yC7cpsdvloDJ0BmXNs3PlmiBlJvHNWKUycWpns+GEb9sCFtlBZY1Xc
         Lt6g==
X-Forwarded-Encrypted: i=1; AHgh+RoqPgQQD2yKJCgHTknWFNA14o3z7czMTsMcHq0zd//cC65WIBsuz+b7f5aO0ZRRjeBlXc0irVqwQZ977YmopDp9@lists.infradead.org
X-Gm-Message-State: AFuF++kwCiEnLbZJG/opqZCw5CGZJQOtTbhjLJC5M8GQJvJ030/ujtwi
	oBm7kY/r24uZb9xtmC4J+/+1PS1aqH1Ba9BnJWRB7ATDmkRfrU7a3wD2qfkpMasTuP/cC0+VBws
	GtSD8NnTHi8enc+wW1h4HDanD3VKwArucVYoyX5z7tx05UB8+y1fJDjIFZ7HMqkuxRby4Nj8iPZ
	0T
X-Gm-Gg: AR+sD11c1L5fBP70awGKg242MzWad0gGLAkrQpPxLbSYHqQG3L1RwDWsVkKTpipjjCm
	JgK2k9ivuV4uBCN9cU82Hg+NQb5nQVm+1BFsQ4k+fZMlEUIIZI0zR+qLctJd4mbpJAOUTgdT0yo
	Q4qggYgPBaZJAy6WAXuVfGNj87y9QHpvBrrBB4CFzMETmN+ODpWTYovQeWsdeIAESqZMvMLtgLs
	82YLIQG7TiI4ToM7+76ANEB/BTYlwp5S9Zvb2CCCpVXd+0e8D2teMW+b1RvZVLuTGS3eW97NuZe
	jEHyEE5LQhLeXjot+F1yik9mnbNKdzFggKSCZAi8EWwJ0Yt22YekEPQlNne8gRF+6A2Wew==
X-Received: by 2002:a05:620a:a4a:b0:936:ce17:dac3 with SMTP id af79cd13be357-93780433529mr609194985a.40.1787764653943;
        Wed, 26 Aug 2026 10:17:33 -0700 (PDT)
X-Received: by 2002:a05:620a:a4a:b0:936:ce17:dac3 with SMTP id af79cd13be357-93780433529mr609188785a.40.1787764653394;
        Wed, 26 Aug 2026 10:17:33 -0700 (PDT)
Received: from redhat.com ([23.25.77.22])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9377e36954asm255124385a.18.2026.08.26.10.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 10:17:32 -0700 (PDT)
Date: Wed, 26 Aug 2026 13:17:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: Lucas Tanure <tanure@linux.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, Jian Hu <jian.hu@amlogic.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] clk: meson: t7: Intermittent boot instability and memory
 corruption on VIM4
Message-ID: <ao8fqstEs01hd3--@redhat.com>
References: <3930906f-783b-4d72-9260-ba25cc8081cb@linux.com>
 <aoxjX3HabY0brgXk@redhat.com>
 <57d796bd-7a3c-46b9-bd65-d6860adbd355@linux.com>
 <72db2062-e0ac-4c33-b1d1-d1fa5ae4bec8@linux.com>
MIME-Version: 1.0
In-Reply-To: <72db2062-e0ac-4c33-b1d1-d1fa5ae4bec8@linux.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xaX2V5JzG28nTr9_FQRjbMf3fivpvedcv0rHTjp73jw_1787764654
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_101739_137631_3E6A6AB6 
X-CRM114-Status: GOOD (  17.01  )
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

Hi Lucas,

On Wed, Aug 26, 2026 at 05:42:01PM +0100, Lucas Tanure wrote:
> With Brian's patches, VIM4 does not turn off 4 clocks:
> 
> t7_sys_sd_emmc_b
> t7_sys_sd_emmc_c
> sd_emmc_b
> sd_emmc_c
> 
> This is expected since I'm trying to run from an SD card. However, even with
> these four clocks kept enabled, the board still hangs.
> 
> Complete list with all clocks being disabled after Brians patches:
> [    1.002247] clk: Disabled unused clock: t7_sys_pwm_ao_gh
> [    1.002898] clk: Disabled unused clock: t7_sys_pwm_ao_ef
> [    1.003560] clk: Disabled unused clock: t7_sys_pwm_ao_cd
> [    1.004220] clk: Disabled unused clock: t7_sys_pwm_ao_ab
> [    1.004972] clk: Disabled unused clock: t7_sys_pwm_ef
> [    1.005509] clk: Disabled unused clock: t7_sys_pwm_cd
> [    1.006211] clk: Disabled unused clock: t7_sys_pwm_ab
> [    1.006766] clk: Disabled unused clock: t7_sys_ts_hevc
> [    1.007434] clk: Disabled unused clock: t7_sys_ts_vpu
> [    1.008033] clk: Disabled unused clock: t7_sys_ts_nna
> [    1.008741] clk: Disabled unused clock: t7_sys_ts_gpu
> [    1.009294] clk: Disabled unused clock: t7_sys_sar_adc
> [    1.009929] clk: Disabled unused clock: t7_sys_vpu_intr
> [    1.010609] clk: Disabled unused clock: t7_sys_dspb
> [    1.011186] clk: Disabled unused clock: t7_sys_dspa
> [    1.011792] clk: Disabled unused clock: t7_sys_a73pclk_apb
> [    1.012554] clk: Disabled unused clock: t7_sys_pclk_sys_apb
> [    1.013213] clk: Disabled unused clock: t7_sys_rsa
> [    1.013811] clk: Disabled unused clock: t7_sys_mipi_isp_pclk
> [    1.014529] clk: Disabled unused clock: t7_sys_mmc_apb
> [    1.015107] clk: Disabled unused clock: t7_sys_hdmirx_pclk
> [    1.015819] clk: Disabled unused clock: t7_sys_i2c_s_a
> [    1.016429] clk: Disabled unused clock: t7_sys_hdmitx_apb
> [    1.017109] clk: Disabled unused clock: t7_sys_i2c_m_f
> [    1.017740] clk: Disabled unused clock: t7_sys_i2c_m_e
> [    1.018379] clk: Disabled unused clock: t7_sys_i2c_m_d
> [    1.019018] clk: Disabled unused clock: t7_sys_i2c_m_c
> [    1.019657] clk: Disabled unused clock: t7_sys_i2c_m_b
> [    1.020296] clk: Disabled unused clock: t7_sys_i2c_m_a
> [    1.020940] clk: Disabled unused clock: t7_sys_i2c_ao_b
> [    1.021585] clk: Disabled unused clock: t7_sys_i2c_ao_a
> [    1.022236] clk: Disabled unused clock: t7_sys_pcie_phy
> [    1.022885] clk: Disabled unused clock: t7_sys_usb
> [    1.023482] clk: Disabled unused clock: t7_sys_pcie
> [    1.024088] clk: Disabled unused clock: t7_sys_spicc1
> [    1.024723] clk: Disabled unused clock: t7_sys_spicc0
> [    1.025345] clk: Disabled unused clock: t7_sys_g2d
> [    1.025940] clk: Disabled unused clock: t7_sys_spicc5
> [    1.026569] clk: Disabled unused clock: t7_sys_ts_a53
> [    1.027197] clk: Disabled unused clock: t7_sys_ts_a73
> [    1.027825] clk: Disabled unused clock: t7_sys_spicc4
> [    1.028454] clk: Disabled unused clock: t7_sys_spicc3
> [    1.029085] clk: Disabled unused clock: t7_sys_spicc2
> [    1.029710] clk: Disabled unused clock: t7_sys_aififo
> [    1.030339] clk: Disabled unused clock: t7_sys_uart_f
> [    1.030967] clk: Disabled unused clock: t7_sys_uart_e
> [    1.031595] clk: Disabled unused clock: t7_sys_uart_d
> [    1.032224] clk: Disabled unused clock: t7_sys_uart_c
> [    1.032857] clk: Disabled unused clock: t7_sys_uart_b
> [    1.033482] clk: Disabled unused clock: t7_sys_eth
> [    1.034077] clk: Disabled unused clock: t7_sys_audio
> [    1.034694] clk: Disabled unused clock: t7_sys_ir_ctrl
> [    1.035333] clk: Disabled unused clock: t7_sys_msr_clk
> [    1.035972] clk: Disabled unused clock: t7_sys_spifc
> [    1.036596] clk: Disabled unused clock: t7_sys_acodec
> [    1.037218] clk: Disabled unused clock: t7_sys_smartcard
> [    1.037880] clk: Disabled unused clock: t7_sys_am2axi2
> [    1.038518] clk: Disabled unused clock: t7_sys_am2axi1
> [    1.039157] clk: Disabled unused clock: t7_sys_am2axi0
> [    1.039796] clk: Disabled unused clock: t7_sys_ampipe_eth
> [    1.040468] clk: Disabled unused clock: t7_sys_ampipe_nand
> [    1.041155] clk: Disabled unused clock: t7_sys_deswarp
> [    1.041790] clk: Disabled unused clock: t7_sys_gdc
> [    1.042385] clk: Disabled unused clock: t7_sys_cec
> [    1.042981] clk: Disabled unused clock: t7_sys_aucpu
> [    1.043600] clk: Disabled unused clock: t7_sys_aocpu
> [    1.044217] clk: Disabled unused clock: t7_sys_mali
> [    1.044830] clk: Disabled unused clock: t7_sys_ethphy
> [    1.045451] clk: Disabled unused clock: t7_sys_mipi_dsi_b
> [    1.046123] clk: Disabled unused clock: t7_sys_mipi_dsi_a
> [    1.046795] clk: Disabled unused clock: t7_sys_dos
> [    1.047390] clk: Disabled unused clock: t7_sys_ddr
> [    1.047991] clk: Disabled unused clock: pwm_ao_g
> [    1.048565] clk: Disabled unused clock: pwm_ao_f
> [    1.049135] clk: Disabled unused clock: pwm_ao_e
> [    1.049709] clk: Disabled unused clock: pwm_ao_d
> [    1.050283] clk: Disabled unused clock: pwm_ao_b
> [    1.050857] clk: Disabled unused clock: pwm_ao_a
> [    1.051454] clk: Disabled unused clock: rtc_dualdiv
> [    1.052038] clk: Disabled unused clock: rtc_duandiv_in
> 
> Also with the patches the disable happens 0.5 second later, from 0.5 seconds
> after the boot to 1 second after the boot.
> 
> I am still investigating what is missing a consumer or what should be
> labeled critical.

I've seen cases where a clock is modeled in Linux, but isn't actually
used by Linux, so it gets caught in the disable unused clocks sweep.

Does the board immediately crash after the disable unused clock sweep?
If so, you could add a log statement, then 1 second sleep in
clk_disable_unused_subtree() and wait for the board to crash.

If you can't get timely help from the vendor, then you can add
CLK_IGNORE_UNUSED to all of those clocks, and slowly start taking them
off in batches and wait for the crash.

Brian


