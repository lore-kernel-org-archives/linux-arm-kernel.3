Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C924D3B7F6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 09:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=anCiD784WEDOQs+kkrG4XA2PkSZGNOS557NHjPGFdd8=; b=ZqOtuxn0T7/Dl6cVCYEFipuBjh
	SUL8WYrh7tjtfqrRxt2fUYcyxU3sipWmRV67F8r+sAZeArCppvWwu7620bw7jOJtvZ99vs7fZeJMZ
	uWYi5iTaoVGBhEK1zmu+xn7jGoPu11w+hzKlxJ0yqHzdXxXX7EPGkas2a/rCmIU7XP+H/IxftvzZo
	liEMYaQ9RHTSBskQqEt+04L96O+uwLKq3QVayLgEzY46n4drPUXA8yO1HYxegSwazRFe0s/wjsZYW
	DVatftZb08jHqmQNNzSAP9L3I5J/FCzT1cbPMUPmWrPDk6El3O89s6sq3+vD7KbdE3YHYkfdHrIQE
	bTGk3TfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFV9z-00000007Vxx-1MoO;
	Mon, 25 Nov 2024 09:13:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFV92-00000007VrM-37oX;
	Mon, 25 Nov 2024 09:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732525955;
	bh=FxMn6TL+VYIg036551yfzlt+21LR1IpuCjYwCyQ2h9c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VS3Yg2FyjgBl7sASXqV9u0a+4D4FICUlGvzEpmRjmjbwo05VWxWYv+t9ccs2ICdR/
	 l0ZVW1vwHn+knU1q3ebm0PO2LclYUeJIcK4dgYt4JnEQ09Fvq5tDP5xfVkmy3BmZmB
	 EKo4a1d5yVGuGfv46sr6jcBj6+qtJsgDyaw+WeSvH+s2Z37zjHODfb9R2E9a3HBUFg
	 QmuWz07c7o7KRDO84D1aa1/kNuw1In5aaCfFdD5glmbrcc5w0+UgbbmWf5pglrctMO
	 XcogWUjiGrRSxBgwgFtLLrut0PLr8h0VORSZi3bRIJXje5Z4YtDHqUhGicRAa0SsCK
	 100VXAqn890Wg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B68B917E1330;
	Mon, 25 Nov 2024 10:12:34 +0100 (CET)
Message-ID: <8b6657df-7813-4964-92c1-1a85b8390eed@collabora.com>
Date: Mon, 25 Nov 2024 10:12:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: mtk-sd: Add support for ignoring cmd response CRC
To: Andy-ld Lu <andy-ld.lu@mediatek.com>, ulf.hansson@linaro.org,
 matthias.bgg@gmail.com, wenbin.mei@mediatek.com
Cc: linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241123071006.14294-1-andy-ld.lu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241123071006.14294-1-andy-ld.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_011236_930712_51A4ABF0 
X-CRM114-Status: GOOD (  11.52  )
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

Il 23/11/24 08:09, Andy-ld Lu ha scritto:
> The current process flow does not handle MMC requests that are indicated
> to ignore the command response CRC. For instance, cmd12 and cmd48 from
> mmc_cqe_recovery() are marked to ignore CRC, but they are not matched to
> the appropriate response type in msdc_cmd_find_resp(). As a result, they
> are defaulted to 'MMC_RSP_NONE', which means no response is expected.
> 
> This commit adds a new flag 'MMC_RSP_R1B_NO_CRC' to work alongside the
> existing 'MMC_RSP_R1_NO_CRC' for the following process flow. It fixes the
> response type setting in msdc_cmd_find_resp() and adds the logic to ignore
> CRC in msdc_cmd_done().
> 
> Signed-off-by: Andy-ld Lu <andy-ld.lu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



