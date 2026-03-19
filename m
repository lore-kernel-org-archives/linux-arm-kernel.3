Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFB91075270
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 17:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHJsWGTSlJTfY7QnX97XerQUNMUaLpd7tP4C0EEZkzg=; b=KIX3xPlpHghKAetcUcT+aD9JY9
	m0oFVRTttDUg1y+c1IS7ZB/yQ1TWZuM+eejMChjr6X1mRICQWOXeKGd9bdoIxy4YcYs9ADqefR7Da
	7mbQ/2erpb/gHlc6k5wDRzpu11H9zyxXsMmlsvqCy9xyewTnhFR9pajH6a4VOPdgUzIg5aLJ4PdKt
	K1/xEqJtngs7821a+LTD4RNdkPWTohjn0A3WMkF+V0iZEB/wSQq07NqIdHMMKOWjQSdc2nZyqzup/
	KZ9lmO81FwQCIDdM/rgv5zruCVO6AylZ4PdzyTFaXfTNQHZU2tqjEQy0VNXpV961/ScR53++Toktx
	3rH0hKuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Gxk-0000000BALk-2vNA;
	Thu, 19 Mar 2026 17:15:12 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Gxi-0000000BAKq-1IlT;
	Thu, 19 Mar 2026 17:15:11 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4fcC4X1zKzz1XM5kY;
	Thu, 19 Mar 2026 17:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1773940495; x=1776532496; bh=UHJsWGTSlJTfY7QnX97XerQU
	NMUaLpd7tP4C0EEZkzg=; b=dFKmxQsxM8O2hO+PntnmCfQmA2VsxQt1I9BWP45v
	e99xashdlvnQ0iqpzna366213RNXzYUgf1v3+givoQ4OAgp6jhkArR0HgCsDDvLP
	5u4QOdYjX9pUJlOX2DE3toANf60hlf5yDeqMcuMD1kjAv9XaSRRnHc2imlEmPZqQ
	YiM5s2CDkWV6Mdk4AFzavdqTRL89qGFkfAxKt3lZ3gbdurzVjr4dSZvtrHFIkz0p
	eIImjdzfLZxX4edUA95TsTfOxQ31EJmzDgr27Ispq2YeMv+HqZqSJu2XoNuEf+ZO
	v8YxxK8gPLxPwbUnDpqGfT41WYhoPLQKKf/Ytf8IZrNWLA==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id kgNEXQsIxXTY; Thu, 19 Mar 2026 17:14:55 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4fcC482cLFz1XM5kW;
	Thu, 19 Mar 2026 17:14:48 +0000 (UTC)
Message-ID: <ea7a5729-3df0-49ef-ab8d-47ade75cc393@acm.org>
Date: Thu, 19 Mar 2026 10:14:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 phy-next 09/24] ufs: exynos: stop poking into struct
 phy guts
To: Vladimir Oltean <vladimir.oltean@nxp.com>, linux-phy@lists.infradead.org
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com, Alim Akhtar <alim.akhtar@samsung.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Chanho Park <chanho61.park@samsung.com>
References: <20260309190842.927634-1-vladimir.oltean@nxp.com>
 <20260309190842.927634-10-vladimir.oltean@nxp.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260309190842.927634-10-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_101510_397085_D9FFDAB3 
X-CRM114-Status: UNSURE (   6.75  )
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

On 3/9/26 12:08 PM, Vladimir Oltean wrote:
> The Exynos host controller driver is clearly a PHY consumer (gets the
> ufs->phy using devm_phy_get()), but pokes into the guts of struct phy
> to get the generic_phy->power_count.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

