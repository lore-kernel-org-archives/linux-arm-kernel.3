Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FF3CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 18:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72zMzp9EQsVogTu/OAl9/EdJSst3NLpKe0M5q7uE32E=; b=Ivj1FIGVE+f4xDVtqR3IxeUORm
	jowBFAV6qmNL50A03j2V+wXpTVxBnXnkpOPtAUIyhLd0ylLjO73A+du0gwdwamMcMoOuFyfr+tq76
	/DHWVudSpiWuzUME+FOJPzG6seBYt5nZ2I82XRJXN8w9eQrIpRVGWmV0YzGyYQQeUcC58wtigBQKs
	gMgkPTMqaX4ROhSIONdQZVtV7wCMEeu+5b7SWtf9u7QVFeTGWFkYJbOucp2wg7SIl8AjwAEFK0X+Y
	pjo/wP1YmKu6gJNLuRDmZNfmMUR/L5rQRuZMs550/zSzWEXumBMgBzGCgYfTE4nI1nYHrA6p6zKYz
	IDrIXP7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvKXN-0000000COel-26uJ;
	Sun, 07 Sep 2025 18:54:53 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvKUW-0000000CO63-1Xgg;
	Sun, 07 Sep 2025 18:51:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757271105; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LVWD3SHQtC7SoFVKBuDY1aLxv8HKkg0+CDoXD4XUC871+2/7VKD2LmFHPpaqSCIf/WyCxy1NGFdIvcoWP2+SD78RgWIp0kJ2Nd+EKYDx7bRBPBkQ7Ut9vTmURoZDfRgWDaT39IvQ5iyvJqxPqp8elP1U1J963ErE8MgFSxlG6Dw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757271105; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=72zMzp9EQsVogTu/OAl9/EdJSst3NLpKe0M5q7uE32E=; 
	b=PuMd8rXbS8zSUtqHwxMTyAsTwByeOGoqvHa5YcSoh8/GQUqYR0wrzkYWNwF6pyfZH7gv0HKE5f9l0HhR6IjO5cKO1FwmJerR/MUxVXv9B0pdBZsrSykDKd/G6Ueodjs9e9AVJ0++ClYYwonNJ/+3T0IETObJNj7ijvQr5ZhIYJ8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757271105;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=72zMzp9EQsVogTu/OAl9/EdJSst3NLpKe0M5q7uE32E=;
	b=MixN8WjiNrR9K4gGzWj3HwYdmrd1jvqQnRBQVeQbgDtl40BqhCv4myWoJb2rCLnQ
	48ZoKFPQWXO49DDELuCEtRMnc4+1WMWLWPL/623dv5bP93mwyqid+sYTqJQH+fiYNx/
	S8ta4TgRapiWvdwhI7vucEgyQJMIhRLpFZns1NNU=
Received: by mx.zohomail.com with SMTPS id 1757271103703981.538669071521;
	Sun, 7 Sep 2025 11:51:43 -0700 (PDT)
Message-ID: <c9136f3e-464a-48c8-92d5-c014dd4e9958@collabora.com>
Date: Sun, 7 Sep 2025 21:51:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] Enable HDMI Receiver on NanoPC-T6
To: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <cover.1757068166.git.marcin@juszkiewicz.com.pl>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <cover.1757068166.git.marcin@juszkiewicz.com.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_115156_487719_9834924C 
X-CRM114-Status: GOOD (  12.67  )
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

On 9/5/25 14:02, Marcin Juszkiewicz wrote:
> For quite a while I had this patch in my local tree but never made it
> work. Kernel generates the following messages all the time:
> 
> fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: signal not lock, tmds_clk_ratio:0
> fdee0000.hdmi_receiver: hdmirx_wait_signal_lock: mu_st:0x2, scdc_st:0x0, dma_st10:0x10
> 
> "v4l2-ctrl --all" reports that HDMI In is detected, /dev/video[0-4]
> exist.
> 
> I tried two signal sources:
> - AMD Radeon WX2100 (via passive DisplayPort -> HDMI adapter)
> - AMD Radeon RX6700XT (HDMI port)
> 
> Same situation with both - kernel messages as above on RK3588 system, no
> connected monitor on host side.
> 
> Usually I used MPlayer or MPV to check v4l2 devices but here it fails
> too:
> 
> $ mpv av://v4l2:/dev/video3
> [ffmpeg/demuxer] video4linux2,v4l2: Not a video capture device.
> [lavf] avformat_open_input() failed
> Failed to recognize file format.
> Exiting... (Errors when loading file)
> 
> 
> Checked SBC schematics again and HDMIIRX_DET_L line is GPIO1_D5 like it
> my patch.
> 
> What I go wrong?

Hi, your trouble with HDMI capture sounds very similar to [1]. Make sure
you're using opensource ATF and check whether capture works using
v4l2-ctl tool, see replies to [1]. Post a full kernel driver log if
problem will persist.

[1]
https://lore.kernel.org/linux-media/c71a3f79-71f3-4fd2-a509-c42b24636a2f@timsurber.de/

-- 
Best regards,
Dmitry


