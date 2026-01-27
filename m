Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098ECD2F007
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 12:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IyrI10IEWhvtGxXTF3ireavv4UZgEVlTddeIP8bpMSQ=; b=0gmLBuVnATyu9tuMzKq3JblyXB
	wBb9RVvPl9yMTEpq1BlrCg2+YD2aWSLfEp8cxpjraitnwAPPBqchKtDHjyjru20CZj7s+I0Y6lPvT
	40KdRfYA8aUuaMOFCv9YxAX/XyiWPwcy7MOxPWTUP9i4if6Zz2On65klq2aEXU8pI62wlkP49fPzX
	m0ra8eKpAQSpyl0DKb9RH6KxKcBqaJoXTrniBUxeTIBIvMCc/Q+vQuAC1Q11Rv8/vnG4RG9qbbCmS
	0lE1OjI1uNoWi+PCbJx3B5J9ZAA3T+ZMa9NJrv0/MgyYgOsh8++Y/Sw7hDYRMorar5L8it0NIwSpR
	sN9kfueg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkiIE-0000000EFoz-34wA;
	Tue, 27 Jan 2026 12:35:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkiI7-0000000EFoY-1lyI;
	Tue, 27 Jan 2026 12:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769517328;
	bh=CuvpcluLyNLc6SVhyS/gTS6TYlFSi/9ZuOs6HBvdp0Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Iz7BLs76YwfKgDYYLs8xYBwZik6ELyr7gTIB3oUT/ZrsVwPHehi/0QUlYWgHW6SO0
	 MBe5tKWu29E+lE2mjjqG27EL2n2c+M7wurOz3Zjb+/O8kmaD3Ql1nezp0Rw1wObF/h
	 6h+deiJvICMByHJtGEJVYwDRrv/IviolpyE2KW5HNQw3jaG4+4PCiui472qUR5hJRz
	 wv2Qz3eM2epsmrWHX+RZXsDJJZ1pcsstWsfE3zfZDsg/lvGy+gKew/+O+rjP1uFwOc
	 JQGrhLCqIiFj7XuJNEcoARP9+cJ4b6DYbToj/UXoN1N3O3ZzqrD7M4lsWU+pq1XfqN
	 KcS9i0uVfBg6Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DD18E17E0182;
	Tue, 27 Jan 2026 13:35:27 +0100 (CET)
Message-ID: <9abe64bb-a398-4e8e-ac7e-397fee0eded5@collabora.com>
Date: Tue, 27 Jan 2026 13:35:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] uapi: Provide DIV_ROUND_CLOSEST()
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Diederik de Haas <diederik@cknow-tech.com>
References: <20260127-rk3588-bgcolor-v5-0-b25aa8613211@collabora.com>
 <20260127-rk3588-bgcolor-v5-1-b25aa8613211@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260127-rk3588-bgcolor-v5-1-b25aa8613211@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_043533_631459_BFF9E6FD 
X-CRM114-Status: UNSURE (   7.37  )
X-CRM114-Notice: Please train this message.
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

Il 27/01/26 09:45, Cristian Ciocaltea ha scritto:
> Currently DIV_ROUND_CLOSEST() is only available for the kernel via
> include/linux/math.h.
> 
> Expose it to userland as well by adding __KERNEL_DIV_ROUND_CLOSEST() as
> a common definition in uapi.
> 
> Additionally, ensure it allows building ISO C applications by switching
> from the 'typeof' GNU extension to the ISO-friendly __typeof__.
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



