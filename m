Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E7BC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 02:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yBT85ljG1wrfV6S+5drF9x61f+zj54LsDIH5RHI2Yg=; b=vXaXJdWraC3hPNmJGB/oJkh3wq
	PS60Bp2ii5xA3Z04EC6aZnNWrvqCHh1G5PFOb3O+a2c3wcZO9gLb4privk+s4lVE1iaNPDbcMMAdS
	Zx2VwoGqoL5MUROi8w4IOGHZfXRV5UpvukNZcgwxZJ4/qQsCQx+mvoxZLlFepghDG0R9jOe3EFp6b
	KiX2dQzqptpW/8vx1XdGEMUl30Gr2QXgFO/DJq5TnHVWYTRj0RZNjRkyrGuqoB3w21dyacoy4B8eK
	3lEdAHHKfMtMsH5vKNHReIR9hDkkpv00TFpn8TVcYjkoahEcsyjNvmMVGb+3+pORQS7IMWYJaFIr4
	NfEGHdXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taQnu-00000009Gsg-25Rm;
	Wed, 22 Jan 2025 02:49:18 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taQmc-00000009GoM-2MDA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 02:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=5yBT85ljG1wrfV6S+5drF9x61f+zj54LsDIH5RHI2Yg=;
	b=DjV9xUi3F6BvtjRuZE3J9ks4LoIiE2H4D1xFGx9byXRRYU+P5Oc5C4cFywYPp7
	3d47k7x3bwimjr3CxwNHSIWpGmdEFnTlBQGrDVMTtp76B89+kQkoe/r2ggB5gIPu
	gNNQaE8TvGHdSGdCVrGx5w0iHwifoKJHBC3s8POakh1mI=
Received: from [10.42.20.80] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wAnej0CXJBn0GgDHw--.39692S2;
	Wed, 22 Jan 2025 10:46:27 +0800 (CST)
Message-ID: <42a2e30f-ce1a-19ae-6886-f11a8a58eea3@163.com>
Date: Wed, 22 Jan 2025 10:46:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/aspeed: Use devm_platform_get_and_ioremap_resource()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Joel Stanley <joel@jms.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250121075041.201599-1-oushixiong1025@163.com>
 <b5rhfo6q6ko4vf2vubkcma4v7dnpxruh7peyqav6tszj4sg6ee@mzjc543jsujn>
From: Shixiong Ou <oushixiong1025@163.com>
In-Reply-To: <b5rhfo6q6ko4vf2vubkcma4v7dnpxruh7peyqav6tszj4sg6ee@mzjc543jsujn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAnej0CXJBn0GgDHw--.39692S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUjku4DUUUU
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: xrxvxxx0lr0wirqskqqrwthudrp/1tbiXQfbD2ePkETEKwABsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_184758_984754_A1656C59 
X-CRM114-Status: UNSURE (   8.69  )
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


在 2025/1/21 18:16, Dmitry Baryshkov 写道:
> On Tue, Jan 21, 2025 at 03:50:41PM +0800, oushixiong1025@163.com wrote:
>> From: Shixiong Ou <oushixiong@kylinos.cn>
>>
> Missing commit message
I will add commit message on v2, thanks.
>> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>
> This doesn't match your email address, so SoB is missing.

The SMAP service for my email <oushixiong@kylinos.cn>  is not working 
now, so I sent this patch from my alternate mailbox.

Shixiong Ou <oushixiong@kylinos.cn> and Shixiong Ou 
<oushixiong1025@163.com> are both my email addresses.


