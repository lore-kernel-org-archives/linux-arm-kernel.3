Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C00C55171
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 11:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yLzybn7t7+FRgJsgrmHMI87S0++JQ4rixHsgPbOEmI=; b=IK+A5iQjZxbW01lcGV7x9p6WwJ
	xBX0A4DWCwzP5vRpeVgzw8E+6un2ocNr/w/+IM4V23wAbDvghxPBs1FssuBsP61boQvYWIvRDP+P2
	N0rKV0FGqWQdtUHqjkLvBWDT1KNb1j83oKT3geFSnHlTD21XqnQsZ4jCsMA3pD4+gqoFbWT4ZT/fC
	S+/7Cr8GVvxA5kuf64RrEx09Sh5YhVY02SRHHydZ/bN5waA6FsWE+YRYy4ZzJWlzcQBNVHwExqkpg
	L3BQgKuNLJExQJvPZM1HGllZPOS72zlIUsVc9AvjgV9Fd307FgSU9It6FbkpD//HbyserhriyJGqs
	zyuUn0NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqULS-0000000FZQT-3E1l;
	Sun, 02 Aug 2026 11:27:06 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqULP-0000000FZQ6-2cXd
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 11:27:04 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 99008140016B;
	Sun,  2 Aug 2026 07:27:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sun, 02 Aug 2026 07:27:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1785670022; x=1785756422; bh=4yLzybn7t7
	+FRgJsgrmHMI87S0++JQ4rixHsgPbOEmI=; b=SW6+p4T6ONwKm8HvQhdbsuN8fU
	Kv5BGogJambL1kfPbIWiAZAqxVbVYJdRU2wDxrtRdhGTUlYOX3toBYl6n1SKOl03
	blqg+lJSKcQX1G7bKFZjfTz5MSrYbNE790wHEZlnKMLj+ekJaeURwQlOAOiT3pMf
	VtyEe1Rpt+JTsu957WEOOo9QoSoG8LWccLSVskBKTBG9mbw11PlhjMBIH7u565q3
	a8q8aBqcxKaWslONU+ZzksQlrLfLqavw6XoXrKiO9wPVHxvFROyZswHfRedaKIXM
	imY6qBZ/vFfed61QFT7RTZX8lnhcmOpPOnIArSLG+IAaSGti+nPYtZJvWKUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1785670022; x=1785756422; bh=4yLzybn7t7+FRgJsgrmHMI87S0++JQ4rixH
	sgPbOEmI=; b=KlbhzkbC3KGSMU127UR+zReS8FTnRC84alt4wwAFb0ssv/r/La5
	8H/4HWycQeR+5FWRsLwD4rO0/x/Ib5Un+pndvGM4NTEug7oBZatmw0jp+3+FwELn
	bqIr8ul+c49+A3YGqYlPcfFQXczQb1Uemaw61liEuLs0T2IyH9RAhf1dDgxh9n1E
	0khmkv2iYmvTNzEYEBTfzdYeb9zwTfBeTQBpIusgl9I9GYLbLMT1qypNob33aXyi
	dWiVkf+asWhNuQIUfNyPu73k7NC3QCqUEPpfhjbwUybjjDl5Ondl1TVzcGLxhU7O
	wcRdbIboiHG51FqCaAxyYiHMiSkL4WvOd0g==
X-ME-Sender: <xms:hilvakhBKKL7dIpQyTA-DV0Zivf-6hekMrEr0MPfRH_jwl1aLuvr1A>
    <xme:hilvajb6lCZ_x_6aHss0EMSqm2QlFE-rjmIm-hTzk8_Knv9EjMajQyjtWDGVTjTeT
    0JMLjDAbxbdn54jyE7omhZbXdFEDEYSGjXEoNqQ4sgv2cRXkhEbFlI>
X-ME-Received: <xmr:hilvaoUu80BUbJ_lstanleeY-92TyfIeY2qALlpRz4zCbgG7GrptY9Z72jwxAdHjgZYdYisVDewB6NPDXrA6bkd7Tft7SpYEUsA>
X-ME-Proxy-Cause: dmFkZTGed4IXq+K1kdNwVa0GaIjJG9YwDKJjZDxnKZy+Y6VfOoaPNAumtkD6KJcx+Qi9gI
    FfJyWP+/29MVu7p+oMMyYZybul/511jcnXBEDMJgKV+rSi/MpdK6R0yiEil3+a3caYOmI6
    cruUj61vriDoj0yTLhXRyuEMypfPHXvfCpot+7TdGncn/VXsIw1gATxNV+KQyMKIiNR6C5
    XavMpwqsAZgFMPUr5IK+CiiR1FDos+48qqIzoeXpWQLqrAq35Z8IB51T2BKwh/TFFaA2CQ
    uLbIPok7RSc9mMJvmEVpyPd4gfcaWGEMHz6Ncgf8qZyTZqPdHIpTKGDlA/Mge452Dcp1FT
    3b14X+TY50VKB8TN3dLCun1t/CbXZSdY3I/UCAx2ODiUH6xtVHHVDyO2BYOCKbeWv2lclz
    cZRH0xwmuWI7vACVV86BujACNdlzfmc+A5z4wBzBEYVVvbgqYf/OqxsIHj9Ol9eOVlroIO
    nQrww7uxvzEyGcFAl5pa7Vdl+sbvEVcULFgyfeeiVkhHIh8is97HvcvYe8qUZQ23RivYlZ
    2bctdKZvKC8FO7oElJCoM7LHz8S0jDDeG7OzV15eJ9sZHT0FCh1fyOpxYCc7kogwvmRVRI
    t1knZgB2Elzdpzd5ix7ti1nPA0JsUyUcKCiGy6pbmkg9Ayci34ZMZ2C2fRyw
X-ME-Proxy: <xmx:hilvajHsX8Hly0Nbs6Lg63UTljAtm2My6Abh4uGv9-fPypmxHJK81A>
    <xmx:hilvaqahIVife5-eXJyKITMhdpgooSUVHwOUMXDGcavNUV4lbS4B6A>
    <xmx:hilvaqFDP8ToQzHXLESxuFfdOGdDfiQQKjGcfH_6OIRzKCJWR9bSgA>
    <xmx:hilvao1UDNYHkebED-0bhlbmDSEgViyQsQbJia6AMDdhS6b2nrcDjg>
    <xmx:hilvamEoAR-STilZAHNq50MrD4gT0iIcILWSt4lU9oBLwLedkBcVPfBA>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Aug 2026 07:27:01 -0400 (EDT)
Date: Sun, 2 Aug 2026 13:27:00 +0200
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Alba Mendez <me@alba.sh>
Subject: Re: [PATCH v2 5/7] spmi: apple: lock around FIFOs
Message-ID: <20260802112700.GG806854@robin.jannau.net>
References: <20260728-t603x-spmi-v2-0-f43e5f10e583@chaosmail.tech>
 <20260728-t603x-spmi-v2-5-f43e5f10e583@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728-t603x-spmi-v2-5-f43e5f10e583@chaosmail.tech>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_042703_755277_3497FEC1 
X-CRM114-Status: GOOD (  16.57  )
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

On Tue, Jul 28, 2026 at 11:28:11AM +0200, Sasha Finkelstein wrote:
> From: Alba Mendez <me@alba.sh>
> 
> The driver was missing locking around register interactions
> 
> Signed-off-by: Alba Mendez <me@alba.sh>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/spmi/spmi-apple-controller.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
> index aed18b7df15c..2cd4ed1803d4 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c
> @@ -14,6 +14,7 @@
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/platform_device.h>
>  #include <linux/spmi.h>
>  
> @@ -35,6 +36,7 @@
>  
>  struct apple_spmi {
>  	void __iomem *regs;
> +	struct mutex fifo_lock;
>  };
>  
>  #define poll_reg(spmi, reg, val, cond) \
> @@ -73,6 +75,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  	size_t i = 0, j;
>  	int ret;
>  
> +	mutex_lock(&spmi->fifo_lock);

please use

	scoped_guard(mutex, &spmi->fifo_lock) {
> +
>  	writel(spmi_cmd, spmi->regs + SPMI_CMD_REG);
>  
>  	while (i < len) {
> @@ -86,7 +90,7 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  
>  	ret = apple_spmi_wait_rx_not_empty(ctrl);
>  	if (ret)
> -		return ret;
> +		goto out;
>  
>  	reply = readl(spmi->regs + SPMI_RSP_REG);
>  
> @@ -94,7 +98,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  	while (len_read < ilen) {
>  		if (readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY) {
>  			dev_err(&ctrl->dev, "FIFO lacks reply data, controller stuck?\n");
> -			return -EIO;
> +			ret = -EIO;
> +			goto out;
>  		}
>  		rsp = readl(spmi->regs + SPMI_RSP_REG);
>  		i = 0;
> @@ -107,6 +112,8 @@ static int spmi_raw_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
>  	if (!(readl(spmi->regs + SPMI_STATUS_REG) & SPMI_RX_FIFO_EMPTY))
>  		dev_warn(&ctrl->dev, "FIFO has extra data\n");
>  
> +	mutex_unlock(&spmi->fifo_lock);

	}

and avoid the 'goto's

Janne

