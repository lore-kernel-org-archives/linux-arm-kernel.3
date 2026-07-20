Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC4BC44512
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 01:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yys6sowO+tcH4AVDZLsOFkrCtg1Kt/CYxSR87VjOuDA=; b=WeIq3/yD2lgJ5Tx8yUw8LWDcls
	vJ7M5vxvr2CPxcZxHuoC3aShViW0qRSULV1/lhEekPhnx2JEJ01xIz3YGTDtlCDStO8YJMiDRCQPv
	/kjlLb06WxnK3SB02WZTVO8hN4o4CFj6Xfa6YBFBp1f2K5kZOLl2mypa8MBDgd2W5FgAX6ku95+zM
	GBNK8LeWF/+CddzsZd/2//kFm6nW75ZJB0obPAvzPgiLvy2+0eqZts9/SrexALBN0uI7lJVHIw7YT
	kzJi9sJVNICMdNtonLF5ZI/GvWCaomVpz7caBMNmjvr+2vo+nSG9UjLqjdaIuVofg1ocVOjU654+u
	V2dJ/2Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wld2D-00000005d0a-3Nac;
	Mon, 20 Jul 2026 01:43:09 +0000
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wld2C-00000005d04-0J8j;
	Mon, 20 Jul 2026 01:43:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784511773; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ntzxg1tMkTsBJu+8nZOI4xF6q5qVUGi7eyIAkCk7XviyPR+hTwHgmmYGID8Zz1HZC83fXVIb5uzNQ2Oowe1oQ1qMjeXky4VIjDLtoo6v4Qs2RasvEF6iWKQ8kPfDSdV45X+hnbguCw41aCZS95i2tgSr7siPbaZKaRibZKs2frw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784511773; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yys6sowO+tcH4AVDZLsOFkrCtg1Kt/CYxSR87VjOuDA=; 
	b=b6/Lv+eYFzmy2ilh/JPYv8YuLovokiGjYORVUHBRafhhXswOZXkEUuqtQLpk+0WUCjhm4ARd42xt/HzTTkA85lu+XH05m6F8aBWVNrD736DcoXQYZ6PxR2gemq4PBxJ+fSMMDdQ49VA0yhvhM/2cRltoLmPABj+kCfu6GIejTPE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784511773;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=yys6sowO+tcH4AVDZLsOFkrCtg1Kt/CYxSR87VjOuDA=;
	b=GSCFCTXlVDiZZEgxryIfeTQ787CgNRdOpzy5DB7ZQXWXb6/iWSoyjW9vCKIaUlwD
	Hs+FKSyp2Ek5rgaxp9BPl3GC/nq0/tc497ROz9C2DBy/485CMenNrn29Nqx78nZq5KF
	2FAY8CZAY7juLOdyFkgiyKePBrmPp1HNhpzp6axQ=
Received: by mx.zohomail.com with SMTPS id 1784511771230880.9938946254076;
	Sun, 19 Jul 2026 18:42:51 -0700 (PDT)
Message-ID: <25922edc-4ff1-4d28-9a64-2c28b2b690cb@collabora.com>
Date: Mon, 20 Jul 2026 04:42:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: synopsys: hdmirx: add HDMI audio capture
 support
To: Igor Paunovic <royalnet026@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260718085728.6797-1-royalnet026@gmail.com>
 <20260718085728.6797-3-royalnet026@gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20260718085728.6797-3-royalnet026@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_184308_174756_C94D0C1C 
X-CRM114-Status: GOOD (  17.58  )
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

On 7/18/26 11:57, Igor Paunovic wrote:
> The Synopsys DesignWare HDMI RX controller extracts the audio stream
> embedded in the incoming HDMI signal and feeds it to an on-SoC I2S
> controller. Expose it as an ALSA capture device by registering the
> generic hdmi-codec as a child of the controller, so that a
> simple-audio-card in the device tree can bind the HDMI RX audio DAI.
> 
> The sample rate is recovered from the ACR N/CTS values together with the
> measured TMDS character rate. A periodic worker keeps the local audio
> reference clock locked to the source by nudging it in small ppm steps to
> hold the audio FIFO fill level near its target, which avoids FIFO
> under/overflow and the resulting dropped samples.
> 
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> ---
> Changes in v3:
> - restore the v1 audio teardown in remove(): audio_shutdown() already
>   stops the worker when the stream closes, so the extra flag clear
>   and trailing cancel added in v2 were redundant (Dmitry Osipenko)
> - rename the ACR read locals and add a comment documenting the
>   register byte packing
> - drop the get_dai_id stub so OF-graph cards resolve the DAI index
>   from the reg property
> 
> Changes in v2:
> - register the S/PDIF DAI so the indexes match the binding and reject
>   it with -EOPNOTSUPP until wired up (Sebastian Reichel)
> - use platform_device_register_data() and drop the fixed 32-bit DMA
>   mask (Dmitry Osipenko)
> - don't leave an ERR_PTR in audio_pdev on registration failure
> - fix teardown ordering in remove()
> - stop the worker before reprogramming shared state in hw_params()
> - look up the "audio" clock by name instead of indexing clks[1]
> - keep the worker on system_unbound_wq when re-arming
> 
>  .../platform/synopsys/hdmirx/snps_hdmirx.c    | 271 ++++++++++++++++++
>  .../platform/synopsys/hdmirx/snps_hdmirx.h    |   8 +
>  2 files changed, 279 insertions(+)

Works well on 5b, thanks. Only one additional review comment:

Please update hdmirx_suspend() to return -EBUSY if audio_streaming=true.

```
static __maybe_unused int hdmirx_suspend(struct device *dev)
{
	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);

	if (READ_ONCE((hdmirx_dev->audio_streaming)))
		return -EBUSY;
```

-- 
Best regards,
Dmitry

