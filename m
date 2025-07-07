Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D315C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 09:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Tdry+EldTnTDkuZnE/ltGwuDbYHEICB2VxFPOO4K8A=; b=ONvkVzx+xmJdt/Cfjbv0msgSa9
	j+6blhON6OfpC1K8DgNNvcTOxthzEnGcagkhlw7w0YGGzRF/vvK3bOs6amyIvHszuQqMA5yvGt1gM
	wU1uacheNrF0MvL0vn5HSberYRSBlTbt4G/yE8ryHyNQidbvQp8mGjYuCwxNGMoDT0+fBvgfNv+b2
	19joZOmYw9zt+WG7uJkk/dlLfws/bC5nlAtSCFb6azt0mXFqL8tAH5OVd5IxBKbt6oEj8M6UHHEy+
	ROHfHtb1fWGoqNNLv/oz3pEpchVZulfKkpM1O2iRgBvypnc63TUz1GanbpneDSq6WEU+pBP6V1pl3
	lY+Fs0pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYicJ-000000024TE-0JZF;
	Mon, 07 Jul 2025 09:58:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiFs-0000000200H-0bUX;
	Mon, 07 Jul 2025 09:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751880918;
	bh=3La3UPJ4ZAMHJ3BAEXORg3GiHQryGDV9WCTeMDTd35c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c3BDEB8slb5r/poY7adzPw/Hl3p3xBCDxOvIY11eDdWzp/JxGpabSNqzSN11D0K0B
	 SZnx1m2y/a73e+9g1zZ4NK8uaqC2ToQyKbIO+UvckbyqaAT1szEFDwMXonBwRsbzbL
	 4LPkIToeE9Jp8dZDB6W1zfG2Sv5sZQevtVUedPBmdjrDv09z5u4yPUkHMilaNNBOah
	 VfY8oqhRF23SXg4IEaiyPXGdxorCHIs24QH5oV3ij1trlsT362waxDEhmX6LcVp/Zv
	 WkKs3SDrIO9k21cTOh2Y9pdzoYTZydLtH0Ur9YOgitTvJZpX7mQUuhr/8LBHsjaJK3
	 8DumFN0ZvMVvA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1F46317E05F0;
	Mon,  7 Jul 2025 11:35:17 +0200 (CEST)
Message-ID: <d24bfc7f-c970-4082-83c3-896fb353b0ff@collabora.com>
Date: Mon, 7 Jul 2025 11:35:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 67/80] usb: Remove redundant pm_runtime_mark_last_busy()
 calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Michal Simek <michal.simek@amd.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Bastien Nocera <hadess@hadess.net>,
 Bin Liu <b-liu@ti.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075453.3222311-1-sakari.ailus@linux.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250704075453.3222311-1-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_023520_343986_C505E0E7 
X-CRM114-Status: UNSURE (   6.39  )
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

Il 04/07/25 09:54, Sakari Ailus ha scritto:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>


For MediaTek MTU3:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


