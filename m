Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE26CCA1009
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 15:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=auNWYKuwMRaiIsuE6I2MaR2Q9fd6AG9LtumLpCZlPMg=; b=SkjEgB4cbjWefPGAs1Fi1Ivygf
	g4CvpN2x9L7xDSAznNF4Id+9Grqe+1GwkwcogyfRjpPpi+n3bXruhLqvjiyK1S45+icMmnsgaGUaT
	kRFGxdxlylUx3Uwuw9YAe4N8HsQkYedeUK4PI6ybtetiOAm6SuKh3MmjXxwLWw+0p9G9tX6KgJARs
	uDDnrTaRc1LuhNIUa+bKXJJm5MV1RIjvfiVGqHIuiq7GB0ZzHNrtBrVIX53E3Pz8mSDdPFGVvc0vo
	ai/Vcju77tywp6fy98JUrNxG7Q4PU1tjm86ULHTRHIQJvkGE7o7St3jv+SjH4o1fx9JsAX14stBx+
	1fpAOqUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utph6-00000006xgb-3nIw;
	Wed, 03 Sep 2025 15:46:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnBM-00000006VzW-0evz;
	Wed, 03 Sep 2025 13:05:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756904745;
	bh=65Cy4eE/Dbap4x4XSMPP5MYg4UIWlMJAYB2KAsuUEOM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qu4mmDCDhFLO5+ELxckT0gE8rs6NIalQ//oyW76Y1Q12bEdUkmyxERmGtl3gd/5Cb
	 ACWOJ8mwcL5RwYv04uIf4VWQx4M8gzjuUMg2xAu7cwent5z5hZHNyCcZJZjdXGZ6B5
	 Glf7D3k2pwuXHnEPWq/avscUiPDC0ExrnhAsli3I/xv52eXqiBTCOJDcDdcT8JUmNX
	 rWu6x3+kIPa0tfE1yG+4hAlLFHNeUQ5c/e8Eabcqnob+JSr+6zO9yVsUOEYVBX5vNy
	 kAb06ow8nOgQFQ+kk2uAPy7wTkRZ7w+YmGZkVGNYPVt+JQRnZ+J5yXIcFCtB3jsrsc
	 0Xv/mjVBORwdw==
Received: from [192.168.1.90] (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9FE5517E0FFA;
	Wed,  3 Sep 2025 15:05:44 +0200 (CEST)
Message-ID: <218de818-2063-432d-b61b-4537ea702cd6@collabora.com>
Date: Wed, 3 Sep 2025 16:05:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] drm/rockchip: inno-hdmi: Convert to drm bridge
To: Heiko Stuebner <heiko@sntech.de>, dmitry.baryshkov@oss.qualcomm.com,
 Andy Yan <andyshrk@163.com>
Cc: mripard@kernel.org, neil.armstrong@linaro.org, andrzej.hajda@intel.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 rfoss@kernel.org, simona@ffwll.ch, tzimmermann@suse.de, knaerzche@gmail.com,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
References: <20250903110825.776807-1-andyshrk@163.com>
 <20250903110825.776807-2-andyshrk@163.com> <5255838.1BCLMh4Saa@phil>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <5255838.1BCLMh4Saa@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_060548_373448_D81C344C 
X-CRM114-Status: GOOD (  13.35  )
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

Hello Heiko,

On 9/3/25 2:59 PM, Heiko Stuebner wrote:
> Hi Andy,
> 
> Am Mittwoch, 3. September 2025, 13:07:38 Mitteleuropäische Sommerzeit schrieb Andy Yan:
>> From: Andy Yan <andy.yan@rock-chips.com>
>>
>> Convert it to drm bridge driver, it will be convenient for us to
>> migrate the connector part to the display driver later.
>>
>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> more like a general remark, this essentially conflicts with the
> big hiword-cleanup [0] that was merged today, as the inno-hdmi driver
> "lost" its separate HIWORD_UPDATE macro in favor a nicer generic one.
> 
> I'm not sure what the best way to proceed is, apart from waiting for
> 6.18-rc1.

This is actually what I also intended to ask you, as I'm in the process of
rebasing the HDMI CEC series on top of next-20250903.

Would it be possible to have an immutable branch of bitmap-for-next and get
it merged to drm-misc-next?

Regards,
Cristian

