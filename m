Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E62E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Dec 2024 18:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O403emxKNDKzcMRgQfG1GrGFTfNb9Kbfd9tbtbIZjU8=; b=l199hVJUoS+r+z01di1tIK+hGt
	eQSTYMbzqhud1V2JJbvj9Q37CiAOpaP2cz+67on2Nib+9P/eiWwBl5pRPjHtsfPL/nordeIJ0Lxrx
	4Sd0w1XS325TGCOtesMWWU9rPegqe4I4kwe47y98ZnEUxyHIFUqapHWxRes7a8rIfX4dTIhcwDu6A
	Pdfh9ZbsiXQGeWoEcv3prb/tJ2ID6nIzr4aw6rRZBp5ZBsEIh8wCRpnWP3VMXLRYYnQqbjFNaRJpm
	5ua8XIRkZvYSsBwBu3fxFXaJjiH+sJwDsiPwb3UAJL0HMQoRcPuFzgI1nPV9kjHdi6MGVx5LDl2kZ
	+zwQQFEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSglQ-00000007aMe-0j1w;
	Tue, 31 Dec 2024 18:14:44 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSgkE-00000007aDG-1fu0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Dec 2024 18:13:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BD3F10486D96;
	Tue, 31 Dec 2024 19:13:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735668807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O403emxKNDKzcMRgQfG1GrGFTfNb9Kbfd9tbtbIZjU8=;
	b=IDDXN8+kYgCfloujJuN7vZyk2rAMWhueTEB92Izu88k+3JXQO61JBP7RJsUqVlEcIGSxAQ
	Nal2X6Tg5E6j4xwdygMX8nJFRIMsKh8peHnn7KWLmrloPLBVQ0X+iNV+9XXOn5XFvznoKX
	6dYp07rSeLGwlXgCc7i+MNpBxUTsukDTPudPMcOk1SW2beLfy/hQ/ADsSPgkW/2At1NkY9
	NLu/YTJjBOTA350sPAjw65Kpge4m1jAP9C4Yr2Ft7FNkOxeE4xwZiU/DS3MNZ6Y5ZFlsy1
	vL1lUOsPPk42nnPNwHvxbhkh4jhLEHA8LXvHA8ohwGSqgQhmArKA159PeJyU9Q==
Message-ID: <7e4f4613-441a-4489-837d-2b69f0364af0@denx.de>
Date: Tue, 31 Dec 2024 19:11:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] pinctrl: stm32: Add check for clk_enable()
To: Mingwei Zheng <zmw12306@gmail.com>
Cc: antonio.borneo@foss.st.com, linus.walleij@linaro.org,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, make24@iscas.ac.cn,
 peng.fan@nxp.com, fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiashengjiangcool@gmail.com>
References: <20241231042756.3166495-1-zmw12306@gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241231042756.3166495-1-zmw12306@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241231_101330_760113_BCD35EEB 
X-CRM114-Status: UNSURE (   6.67  )
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

On 12/31/24 5:27 AM, Mingwei Zheng wrote:
> Convert the driver to clk_bulk*() API.
> Add check for the return value of clk_bulk_enable() to catch
> the potential error.
> 
> Fixes: 05d8af449d93 ("pinctrl: stm32: Keep pinctrl block clock enabled when LEVEL IRQ requested")
> Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
> Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
Reviewed-by: Marek Vasut <marex@denx.de>

Thanks !

