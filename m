Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8697C531CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 12:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8sdq7NI5Ix5M11vOYcOdXd7oL9gnFQaXP3ulyASp4Q=; b=LSVc8Z4OUjD3S91u2xgAJuoZr8
	m+XuO7oTgULLjkS2KhWi12AVuTYgs1Re1yut/wim6bmVbQtwzEj8HFAfyyrQTv/3JlsAtloUtsslg
	Mcc86Znekhj0qMqTSAKNtadWQjy5VSi5q51Pr7lmhHkAE4FK17zlaIfA51tFQzwizYMirmyAp5pOq
	dzRS4vJSXS6qqmUmlOF3a36lc4QudVCke9VfwGXdsLeszah26nyJKkUrop4RZTqux1+syeT6b86j8
	oXQh6ibspm7SRX1QL+FCjvVSpcE35k0nm1awiOxoEcujy7domk9akWO3yiNMgmzEdy/7N7V2Unb+T
	L1w+THtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsH5-0000000ECwu-2U0E;
	Thu, 23 Jul 2026 12:11:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmsH2-0000000ECwM-4B0P;
	Thu, 23 Jul 2026 12:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784808693;
	bh=eAQv8n4LKSI7IE8oTDl69Kvwj8o4JmZgxArnJbuS3IE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Nrer3eAHekVF0EkiS1q4CVQMuZPVDJXsFWQlFxXSQAJCcki9IcvnVUQ5GZec1L3zi
	 TKvb/wwisc6cTlVeb6t2dGC6QdBtXYRcqOk+nHnIn1rH5VbHJ49s3A/uU7Ozm5GeB3
	 e8mRHOvOaqXacoMXQUmIw2Nno9Y3Gc7T8QS1SeAhxawFIyycOX9gscN8Ckl71ugFZ6
	 iBOVFk0dxDvAlQjXmFPqQO1Dk+tvnaEisThvJBu/GO2Ht+9hOFx/aFsb+hcCMy7oAj
	 MQtGbdPBXz/qr6pg/0+/Hi94CGMYdmfOAnEa6D2hGoahDKtdREUAFenQOJeREt0X2Z
	 5Qk6PjtwScyJg==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CBFF917E0114;
	Thu, 23 Jul 2026 14:11:32 +0200 (CEST)
Message-ID: <e3b83c7a-bca8-43ab-bd52-12ab47f40cbe@collabora.com>
Date: Thu, 23 Jul 2026 15:11:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] phy: rockchip: samsung-hdptx: Drop TMDS rate setup
 workaround
To: Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Algea Cao <algea.cao@rock-chips.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Thomas_Niederpr=C3=BCm?=
 <dubito@online.de>, Simon Wright <simon@symple.nz>
References: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
 <20260612-hdptx-clk-fixes-v4-5-ce5e1d456cda@collabora.com>
 <40179247-12ac-4768-abd9-37f34e2c8b2b@rock-chips.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <40179247-12ac-4768-abd9-37f34e2c8b2b@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_051137_207276_7919DE48 
X-CRM114-Status: GOOD (  10.01  )
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

Hi Andy,

On 7/23/26 2:51 PM, Andy Yan wrote:
> Hello,
> 
> On 6/12/26 07:45, Cristian Ciocaltea wrote:
>> Since commit ba9c2fe18c17 ("drm/rockchip: dw_hdmi_qp: Switch to
>> phy_configure()") the TMDS rate setup doesn't rely anymore on the
>> unconventional usage of the bus width, instead it is managed exclusively
>> through the HDMI PHY configuration API.
>>
>> Drop the now obsolete workaround to retrieve the TMDS character rate via
>> phy_get_bus_width() during power_on().
>>
>> While at it, get rid of the extra call to rk_hdptx_phy_consumer_put() by
>> moving the statement at the end of the function.
>>
>> Tested-by: Thomas Niederprüm <dubito@online.de>
>> Tested-by: Simon Wright <simon@symple.nz>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
>    Reviewed-by: Andy Yan <andy.yan@rock-chips.com>

Dmitry suggested moving the code cleanup around rk_hdptx_phy_consumer_put() into
a separate commit, so I'll handle it in v5, which I'll send later today.  Since
this has no functional implications, I'll retain your R-b for the updated patch.

Thanks for reviewing the series!

Cristian

