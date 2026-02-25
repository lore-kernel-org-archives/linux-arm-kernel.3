Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B421FD374F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 12:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+aTfZru+ua783by6X4ar6XsTSgXozs70Dtg1s2kjjoo=; b=N8LBK33ZAfLZpPh9qP7x2efhKs
	AMTRKPMf4Mo+hYZHSAi1xW2OP5j+Hpd6rCkZEMp4EHUXfrXR9NKbniYb2vacRg47nXb8/O4kcU/Xy
	KIfqZ+vjzqtO14Y2i60QXgttQeFCFhOgN+Ww3+fJHYquTNe7gj+Ke9IjrgNctIXuNQij4i6s7ybT0
	X/vOtHi6rjrHO7cV0+b4QWkvW19mbOj5Sn40soRonBwiylpi7kS9UajCFFpNUPBIV89OLK22AwpvA
	6avJuKqkRHjnYFctL4gAlpyeBFb46cYZ6TgvKHlsTO1nSmi6rxMAbvUStBMSNApD0GtzGlj2cjW9h
	PZXoLfTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvE5R-000000040dj-3poD;
	Wed, 25 Feb 2026 12:33:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvE5P-000000040d0-0QJn;
	Wed, 25 Feb 2026 12:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772022827;
	bh=5womokAWb7eAtY3yaV7gLf//uGlpLRP7R/I+K3LaXLg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OET3r2C9WUilq/M/+ydIBKk5+9/gWXhe/A/j/DDrLFeoAwxWIaHpb9e15qFoNI0Mx
	 OT8dGrXqGztq+GENRdr8H7noLPvfY7+6Bd/WSSPkjW6v4UarULbA22lrfqDLG01vGF
	 79KkTgtOd1QNKpRY37IpBW2qUQyoKMApGTiUARQMhT5rM5ryMjLhmDlu13gNqnLnuY
	 f6WnYMuOFVYhiBZrS03+L1om2i2evbrPn57s6cHtJeLY24bk8jbAAYWLnmW/sztN6x
	 WBNoMH8+aRZnZS299AQil67vosv68a0DHBX/er1D7RkuPPNPVT/B+AvylFWZWBos1e
	 45lvmVYOJrQbw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 948E317E04DC;
	Wed, 25 Feb 2026 13:33:46 +0100 (CET)
Message-ID: <5e61f0d5-d168-4d28-8a68-eb1369e7cf8b@collabora.com>
Date: Wed, 25 Feb 2026 13:33:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 17/23] scsi: ufs: mediatek: Rework
 ufs_mtk_wait_idle_state
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 "robh@kernel.org" <robh@kernel.org>,
 =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 "kishon@kernel.org" <kishon@kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "nicolas.frattaroli@collabora.com" <nicolas.frattaroli@collabora.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "broonie@kernel.org" <broonie@kernel.org>
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 "kernel@collabora.com" <kernel@collabora.com>
References: <20260216-mt8196-ufs-v7-0-b5f2907c6da7@collabora.com>
 <20260216-mt8196-ufs-v7-17-b5f2907c6da7@collabora.com>
 <dd895595dbd4cf855ef4ea53aa1b5a0d30169f6c.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <dd895595dbd4cf855ef4ea53aa1b5a0d30169f6c.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_043351_309108_B58BBAA2 
X-CRM114-Status: GOOD (  15.77  )
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

Il 25/02/26 11:32, Peter Wang (王信友) ha scritto:
> On Mon, 2026-02-16 at 14:37 +0100, Nicolas Frattaroli wrote:
>> While ufs_mtk_wait_idle state has some code smells for me (the
>> VS_HCE_BASE early exit seems racey at best), it can still benefit
>> from
>> some general cleanup to make the code flow less convoluted.
>>
>> Use the iopoll helpers, for one, and specifically the one that sleeps
>> and does not busy delay, as it's being done for up to 5ms.
>>
>> The register read is split out to a helper function that branches
>> between new and old style flow.
>>
>> Every called uses the same 5ms timeout value, so there is no point in
>> making this a parameter. Just assume a 5ms timeout in the function.
>>
>> Reviewed-by: AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> Hi Nicolas,
> 
> The logic is quite different.
> 
> Previously, the check was:
> If (sm >= VS_HIB_ENTER) and (sm <= VS_HIB_EXIT), then wait for sm to
> reach VS_HCE_BASE.
> If not ((val < VS_HIB_ENTER) and (val > VS_HIB_EXIT)), then exit the
> loop directly.
> 
> Now, the logic is:
> If sm == VS_HCE_BASE, return 0.
> If (sm >= VS_HIB_ENTER) and (sm <= VS_HIB_EXIT), then wait for sm to
> transition to any other state and exit the poll.
> 

The logic is practically the same, except it's proper now.

There's no need to wait for `sm = VS_HCE_BASE` if `sm == VS_HCE_BASE`.

In other words, just read the comment that Nicolas has put in the code:
/* If the device is already in the base state after 10us, don't wait. */

...because there's no need to wait for the device to get to BASE state,
if the device is *already* in BASE state. It's pretty obvious stuff here.

Regards,
Angelo

> Thanks
> Peter



