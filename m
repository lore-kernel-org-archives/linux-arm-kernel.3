Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82418CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 18:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vv7cu92kT3EkQWt1MwDwvI+WPcoEimPtartjkzaIjvw=; b=FySoSQujOSx04Fy8MY0tzQB1G5
	D2I8rGzBgrTadX+3sAlDRvzSGbsgzx752NOJJHb2qVR/VRDeQgyYOnRgBQDRl7f7FjbsNBKhTae5b
	zYvKLiVSJpFiht9tRYPTwo6Psum+oFamqewKQIYyEPpMoRwe3ZTWVqB8DErUN/wiG9ySEKjqAgue2
	JBcMtSrmbJbocdTYPkJUcdmHzwRg6AFUNFCbLzVp60qzwzP86WQ+B3tALMYow7ZVI1q+dxuZxxywZ
	mrn1EQeLFzSCSko1daDXBXV0vAyFjBHhVWa1i0iXDuwM0jy+GsAI+QVZVnVPoh2EtuR61lnsFu8ui
	Qs/GSvIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWehT-00000004Gz8-1mBX;
	Mon, 08 Jun 2026 18:27:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWehR-00000004Gz1-3As8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 18:27:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 49083407A8;
	Mon,  8 Jun 2026 18:27:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86D931F00893;
	Mon,  8 Jun 2026 18:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780943269;
	bh=vv7cu92kT3EkQWt1MwDwvI+WPcoEimPtartjkzaIjvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GH0B0Usv2O9RNKcibpuQKE0FRIIdkXX5LrtIy9hWwY4fUZzmJTuHa4TTW+IEN5dbo
	 cOd3kwRdzCruY+Iw8tKdVApAXwftecEf5p61znQUqNKkIr7MfxvP6z9yqlwHdhEqPR
	 tNjdbgSPN1L2Z91VnEL/6ULEa3CrDQYc9NHbyTkxmvEF2GYlQxm6fsple817pNUdEU
	 dRbuzJwerNQUEsRstquEiQWpqT71r1W/FUK+OHMSzX+DNfKXH2z1GktyRovuKYLUwt
	 8t9Y8FsnqhljjeJogaWtnoiLHHXOIH2phr/Sij4coTbBZrD45hVoPNu6OFWKP1QDBt
	 sSsSBHpTpQHxQ==
Date: Mon, 8 Jun 2026 20:27:46 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Guillermo =?utf-8?Q?Rodr=C3=ADguez?= <guille.rodriguez@gmail.com>
Cc: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: stm32f7: fix timing computation ignoring
 i2c-analog-filter
Message-ID: <aicJig0ySoUV5pw1@zenone.zhora.eu>
References: <20260526091210.20383-1-guille.rodriguez@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260526091210.20383-1-guille.rodriguez@gmail.com>
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

Hi Guillermo,

On Tue, May 26, 2026 at 11:12:09AM +0200, Guillermo Rodríguez wrote:
> stm32f7_i2c_compute_timing() uses i2c_dev->analog_filter to pick
> the analog filter delay, but i2c_dev->analog_filter is parsed from
> the "i2c-analog-filter" DT property only after the compute_timing
> loop in stm32f7_i2c_setup_timing(), so in practice the timing
> calculations always ignore the analog filter. On an STM32MP1 board
> with clock-frequency = <400000> and i2c-analog-filter set, measured
> SCL frequency was ~382 kHz.
> 
> This also affects (widens) the computed SDADEL range. At high bus
> clock speeds, this can select an SDADEL value that violates tVD;DAT
> (data valid time).
> 
> Fix by parsing "i2c-analog-filter" before the compute_timing loop.
> 
> Fixes: 83c3408f7b9c ("i2c: stm32f7: support DT binding i2c-analog-filter")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guillermo Rodríguez <guille.rodriguez@gmail.com>

merged to i2c/i2c-host-fixes.

Thanks,
Andi

