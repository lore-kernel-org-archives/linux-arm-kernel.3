Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA61BCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 May 2026 12:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oh94TYv72CXSr9No105dstZCYAn/5QXv08ERJpg+LBE=; b=HuDwqAVI2u3tpnjAfUC7RC4aDH
	AAG7jPC0ugv7evy9GCgUhFuP6fs8X9OUxoFBwj9Mb72DDcYNgosrxL4SBVHP3U5wrMNs68pBtI0UO
	6GINQk1KO5hr6gaJQLRIW9CFsAoduLxSbp4aou7QPydpk1/elCoYY6kGK4gEJzwZpocxULRbdDo4/
	uPiAd03pyDiOhA5LW+p+qGo4CJdF390DsdMGgpYi1PdnFSlJ/K+nNDJo+hDxaLJhz5/DQYspcriYc
	4YqotyfE9+DRDNDYUtkm0d/sQBqZV+kJoLMCmpWJLkl3tJindnKO8KyGgIexM9PUxHv3HoDg/gnNl
	/p/XnhzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTIie-00000008it9-29NF;
	Sat, 30 May 2026 12:23:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTIib-00000008isc-0VK1;
	Sat, 30 May 2026 12:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780143784;
	bh=RK9u4oBS3qnLrYtJPHH4F8C9MaGWD0ONvqdCmamdnlg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZfjMDRt8LCBfKQtx1vJR8HWPJ+gBEKcqvuDDuLfM23EmWtGj+KVGhyeoMrk2D7h7U
	 dCpeYmCzPrOvKIW2ilABOn83xP9ee2MKEiLndYRPpo4pplIduVKpRxgyILqDab0vcG
	 3bV6aAYtQ0HLRIWbguH+NPjBU8V6vFqeo8aTzuCvqXr4VT5vvVZ04N3ddf664cVbjQ
	 iKXe8Vl4+lwr5mrdAPBirxKt+iStpy5i1pJP3iZkWpZQqp8gH4HJN3U3rZF5dSs3Pc
	 qqywhtDR0fNmgmBrwXGvuZ3gzcVqWlmvUPuWKm7praAj3gvsHurAiuN+wVDal+rTBo
	 klnoTGMyn3n3w==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6850C17E0246;
	Sat, 30 May 2026 14:23:03 +0200 (CEST)
Message-ID: <22488042-bfa7-4591-b071-8329a8ed0226@collabora.com>
Date: Sat, 30 May 2026 15:23:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Rockchip DRM use-after-free & null-ptr-deref fixes
To: Diederik de Haas <diederik@cknow-tech.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260327-drm-rk-fixes-v3-0-fd2e6900c08c@collabora.com>
 <DIVZ5UVI8BNH.2KC7WUNECAMZS@cknow-tech.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <DIVZ5UVI8BNH.2KC7WUNECAMZS@cknow-tech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260530_052309_318262_BEE2C83A 
X-CRM114-Status: GOOD (  10.19  )
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

On 5/30/26 2:29 PM, Diederik de Haas wrote:
> On Sat May 30, 2026 at 1:26 PM CEST, Cristian Ciocaltea wrote:
>> The first three patches in the series are fixes for use-after-free &
>> null-ptr-deref related issues found in dw_dp and inno-hdmi Rockchip DRM
>> drivers.
>>
>> The following three patches provide a few minor improvements to dw_dp
>> and dw_hdmi_qp, while the remaining two address use-after-free and
>> memory allocation in DW DP core library.
> 
> What's the status of this patch set?

Just waiting to be reviewed/applied..

Regards,
Cristian

