Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CD0D49C81
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 09:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlaaAEdyH/nGPP2TYnuTAVW6ys1F2ggjuG22tntgfjs=; b=fHazakBwmP5fhsJuPKzijNb39T
	tL2DMW5JfiN8ghaijsWalDWdigCpk8DJZ6RBRPmmDLdF5p7yzxZPBFjE8brfJtvR2nCGdX9GpWhb4
	YrNJ1d1W2EV/YE+GDHNK2jwk5HozcMjCQqFKQeu89CjkQkg0R8HnJfaMYLbh6sUZegjzUAF4tr3bv
	qXkOpi6CJejLiCTX8gLANJZkGI0TI7AmPkZFlQ5XRIzMb2q66mF/d1TdBrppYuuVlLCopR0Z1CbBc
	oHBGT/TujyHnOr71QCXHoqf54exBgFT/XdDpDL5Oza7YT3kGnn9TK3oRvpmxEkOby3pNW+F+ffL9L
	2V9f8OqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlkXF-00000001FYu-1Sp9;
	Fri, 30 Jan 2026 09:11:25 +0000
Received: from mx-relay36-hz2.antispameurope.com ([94.100.136.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlkX9-00000001FY8-49V1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 09:11:23 +0000
ARC-Authentication-Results: i=1; mx-gate36-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=OlaaAEdyH/nGPP2TYnuTAVW6ys1F2ggjuG22tntgfjs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1769764248;
 b=bv83rVlT5TBAcSo821JBGIjI1jTgPLovTzuArV6P4RBVhclzrdLSHHsnXm8RuPNNi11E03f3
 04cq0PD4+XsjbhuREgfG+sbwDtXBVj4OHm7jhiH7I6Oy+HvlYQbV+YDDKc6DQFBENbwWzcAFsxw
 S4Sb6tipGpmdrMHG0YXVquD2MbIcu3aQ92VaeRLc6IIM7imV508WEKHivdhe2JiBdqMGly/GKzf
 t0asLGULVpKIsyEdFFsO0oKucTXqDrKuvAtXO22IHTOuTzU/X6c5b4G5jXBrvwS9i1lmUdGf0m6
 PcEfl1JyvmPwWDu63/CcC7Fe8HkWW1r9OUVgxW8N+Ra1A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1769764248;
 b=V5Koy07gsGxyTQn5HAhiTRRaXPwPcID6ieOMnQoncOO5loPozB8ChSp4x0XhUhQ1N+8iSiaX
 P35giSe4OJCudCmGIF8BqE+ya0IOqbwtXLdnJ72rvZJNHAUYiUahU3ZZvpeTsuFhQIqo69mkXYv
 Kcb/yzevkBh3FId5r2N/tV8eF0NYMTrIzhtsECQ8hZj92d9q4cHa4ndlhCHxagAGIE2Q2Z73tKG
 VupTq1IEdMddFvu45qKcSkREdon915kIpsEXX1ezY638Qf2LY5C9j4pG0o7KjOcWIWmR3XP83oq
 xDTR5L/Se3BOQIdgkwkdwrWSKNGnJmVLAKhxAsuv77Kow==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay36-hz2.antispameurope.com;
 Fri, 30 Jan 2026 10:10:48 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id DEE09A40EF0;
	Fri, 30 Jan 2026 10:10:22 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
 benjamin.gaignard@collabora.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, p.zabel@pengutronix.de, sebastian.fricke@collabora.com,
 shawnguo@kernel.org, ulf.hansson@linaro.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 l.stach@pengutronix.de, Frank.li@nxp.com, peng.fan@nxp.com,
 eagle.zhou@nxp.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ming.qian@oss.nxp.com
Subject: Re: [PATCH] arm64: dts: imx8mq: Restore VPU G2 clock to 600MHz for 4K60fps
 decoding
Date: Fri, 30 Jan 2026 10:09:46 +0100
Message-ID: <5476502.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260130084133.2159-1-ming.qian@oss.nxp.com>
References: <20260130084133.2159-1-ming.qian@oss.nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay36-hz2.antispameurope.com with 4f2VbN1GXyz1S63D
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: f72694e440bb7dafe036a5498634db5d
X-cloud-security: scantime:2.180
DKIM-Signature: a=rsa-sha256;
 bh=OlaaAEdyH/nGPP2TYnuTAVW6ys1F2ggjuG22tntgfjs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1769764247; v=1;
 b=XrDFOijAxOTf9UxpW+fXXw8V9sMXK1wHqxXSit9Kif33/O42j0cssrT9Sr/WpPTdyCHricGc
 9vfIcMQG+iaAgXgjuGOGFQLymbGsF+dWqDVjeX/Nn3Y9pD6rHtoXXtycGWAZHPDFYN5uGFGSMaW
 TGj7Rddz6BLSosbhQZ9y2e+RRmxONZPxUWv1es7I9qCi3VpUCdr5YpaJimO8Dq7sJHV+V4gn1Sd
 4iVz6UygUqXiRCyl6UL9ja+PIq6rhnNzo199i0ePOSoKJVdYGSP0TCKYKoaIk+cdsYs5legxId1
 no4o+0kZfQ5r5wcEEONZJGoUHDL48j8WanIvbkuR/Pz5Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_011120_323371_F543E32F 
X-CRM114-Status: GOOD (  21.33  )
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

Am Freitag, 30. Januar 2026, 09:41:31 CET schrieb ming.qian@oss.nxp.com:
> From: Ming Qian <ming.qian@oss.nxp.com>
> 
> The VPU G2 clock was reduced from 600MHz to 300MHz in commit
> b27bfc5103c7 ("arm64: dts: freescale: Fix VPU G2 clock") to address
> pixel errors with high-resolution HEVC postprocessor output.
> 
> However, testing shows the 300MHz clock rate is insufficient for
> 4K60fps decoding and the original pixel errors no longer occur at
> 600MHz with current drivers.
> 
> Test results with 3840x2160@60fps HEVC stream decoded to NV12
> (the same scenario that exhibited pixel errors previously):
> 
> 300MHz performance:
> - Severe frame dropping throughout playback
> - Only 336 frames rendered in 11:53 (0.471 fps)
> - Continuous "A lot of buffers are being dropped" warnings
> - Completely unusable for 4K video
> 
> 600MHz performance:
> - Smooth playback with only 1 frame dropped at startup
> - 37981 frames rendered in 10:34 (59.857 fps)
> - Achieves target 60fps performance
> - No pixel errors or artifacts observed
> 
> Restore the clock to 600MHz to enable proper 4K60fps decoding
> capability while maintaining stability.
> 
> Test pipeline:
>   gst-launch-1.0 filesrc location=<4K60_HEVC.mkv> ! \
>     video/x-matroska ! aiurdemux ! h265parse ! \
>     v4l2slh265dec ! video/x-raw,format=NV12 ! \
>     queue ! waylandsink
> 
> Fixes: b27bfc5103c7 ("arm64: dts: freescale: Fix VPU G2 clock")
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> index 607962f807be..731142176625 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -960,7 +960,7 @@ pgc_vpu: power-domain@6 {
>  									 <&clk IMX8MQ_SYS1_PLL_800M>,
>  									 <&clk IMX8MQ_VPU_PLL>;
>  						assigned-clock-rates = <600000000>,
> -								       <300000000>,
> +								       <600000000>,

If I read the Datasheet correctly 600 MHz is only supported by overdrive
mode (also depending on the VDD_VPU).
Is this frequency really correct?

Best regards,
Alexander

>  								       <800000000>,
>  								       <0>;
>  					};
> 
> base-commit: c824345288d11e269ce41b36c105715bc2286050
> prerequisite-patch-id: 0000000000000000000000000000000000000000
> 





