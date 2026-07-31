Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC95C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 07:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Rvnc4OeOnPEfVntwCGgYK4aj0ASFa6o50BvZ74uNJc=; b=vDX8QlSciZwElb132FH44NPnZl
	HRESfe6CJSm+6w9JKUaj8qSb9DwxY/wa72gfKaMTCbDBFZnp8n3yvMHFNvyd7mBd31sKiCh0d0j9i
	yCcHDEyVx5t7ZeolenzPs1fNafXBRX3HnqWT9c8XqsklymV03MCZLeDYRq3wfiVESyqGAGbLJXfoM
	xxo7VmZ6YfHeGmR+pg4jk5n1YnIsazTMrSokB0WV9P5br08AJbYo3J5YPyk7t+EGmwZdN67wFk8mM
	wyOvW04SgJO9p3qo1BpycJcSrd8Z4A+sngzovlTFWWyY2M4mBZpME7Zs5S+ZSK67TBBeZS+Gapsv3
	WedwEq0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphmt-0000000ByKg-27j0;
	Fri, 31 Jul 2026 07:36:11 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wphmq-0000000ByKE-2DAQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 07:36:09 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47f703a9d05so383195f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 00:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785483366; x=1786088166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Rvnc4OeOnPEfVntwCGgYK4aj0ASFa6o50BvZ74uNJc=;
        b=WnzxvKLat4g9AqhuTV7N+xNzpyNfnbkXC1imILILNl8Ibn785C2ZS82za4Z6qD21jk
         vHA9JCVx8kEMHZIq2vOvxkpTLFcIxfDR513FV2a+yyBxfxrybFbOzPtf2A6HDG1gMb/5
         qnXNBz7chcP2WerY5SDv+ybXj4CWiQRZAF1UxBcsOKYa9NkAUx9w1UfZxrwuMc340O8O
         /Z2dYL4uzQ62mV6Ui7Xb4E/heprOtpuyoTm+LwOE3/r2cOaepw1ForszcvwNQvyVsaK4
         oU/OxT9ETFLEsmDGdzpwyZZh21d6+fbCgcNLsdonjjGWyaboic8Kn+vK5Yr0CGPh4mut
         JsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785483366; x=1786088166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3Rvnc4OeOnPEfVntwCGgYK4aj0ASFa6o50BvZ74uNJc=;
        b=ONAi8DQvYLTZ3W2RMt6HHxzJezRjo9+6FaWinsB7eIUfckLEGKtQuuzvfOhipMtNlF
         gXt4+AAZhEmyNd8/6jzifXhI7C7aAV7C0x0BbHwxcWBua5KlpxkM4gD6l5UUSi71vYTz
         bhBIXuNOBEt9K1OBXFl2IaoYrCsJtaNNesThwvSO9bHCtvb5M4K0dDpGqH5c+Bq/gY0Y
         SwV1s+l4KNCQLTVIxvfv9UoeRw4ba32p5BtbFDpmJfxf/xaD4zWIcGOvWE0nCYs2lMVt
         h/f+fjdN0y+lcsiQoTeo94sxKltRJBcBIyYKYN4CDSiuAc/lQ/pRMXa3XuHnBlCHkm3Z
         //ZA==
X-Forwarded-Encrypted: i=1; AHgh+RrJkj2EMIObOFw9VnZeEXwDPPBmdwaPA3fU4rUhEZVWrrkANBo7q2GOfoej50xEYNpROdCF76GBFZQftzZE8zkb@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6LB+25UYm4b5wPg+4o3Vm27vL/Cn/A8Oky4bEm8S/+WzMuxjt
	1i2YefHymRjASWEYT3/ZXkXsPSDNAtyTSAMx5K5It431ucNYgMZJh2WF
X-Gm-Gg: AR+sD13ogzoewz0nqUm34IF2fJ9DTbNMj2F2/zldxPh3Rw5TX5R1p0SBRO+FIrFFYR2
	kS2qyb9T3clVdM77h4kcs4869L8UZx/VRmWCrIlIB7QG8vRtOEEnEDmnFj0Qbqcld62ba0yDy9K
	Frax913T6w9MM2qY+Eo5qgBzaqXVDmHadOVQvF1YLqPuNyYP1gtGEyv5U6hRlGgXCmbcMEvenOJ
	q/auCBVLSvHxCrEbZwRU6atqGlJWMer2WhCb11RfQma5GxsOvjpsT0j0NVeaL/KhyyZKbAR4Ve+
	+tx29/dVL41k7UlJsDG0gC6MYpy0bWmESF+T3WGeHOa3SJ1Jk/nQPgJKIygpg1qXb5HL1Bjwhoo
	g/vN1OBTqmAxeO5rzP+PogVb9W2nz25SEAkExMAnR1Ru90HWYSbCV1Um9+2vH8YewCkX4Pq478o
	pdL9Jfe8G+SShOeSragxm3YR16rOUM+++xbB64JGJo1aX1O4M4s4jzv+3z4UFmXw7jEiJg7InCp
	sfRkhbW7Q9lPgmVwmTk1CeVaLjit5PaVmTeSa0YCA==
X-Received: by 2002:a05:6000:4a0a:b0:47f:cb39:10c4 with SMTP id ffacd0b85a97d-47fd2abac8emr2630603f8f.12.1785483366028;
        Fri, 31 Jul 2026 00:36:06 -0700 (PDT)
Received: from INBSWN167928.ad.harman.com (bba-86-96-6-50.alshamil.net.ae. [86.96.6.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a5a4sm1751576f8f.20.2026.07.31.00.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 00:36:05 -0700 (PDT)
From: Abid Ali <dev.taqnialabs@gmail.com>
To: kuba@kernel.org
Cc: alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	dev.taqnialabs@gmail.com,
	edumazet@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com
Subject: Re: [PATCH v2] net: stmmac: enable MAC rx/tx after DMA start
Date: Fri, 31 Jul 2026 07:35:48 +0000
Message-ID: <20260731073548.1145-1-dev.taqnialabs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730160715.5ba5e272@kernel.org>
References: <20260730160715.5ba5e272@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_003608_578718_B0AC3E15 
X-CRM114-Status: GOOD (  15.84  )
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

On Thu, 30 Jul 2026 16:07:15 -0700 Jakub Kicinski wrote:
> Looking at the patch - isn't it a bit awkward to handle Rx and Tx
> together? We want to keep Rx blocked to prevent incoming frames,
> but Tx should be allowed so that Tx can egress?

netif_tx_start_all_queues() runs after stmmac_mac_set() in both
__stmmac_open() and stmmac_xdp_open(), so no frame can be queued
in the window between DMA start and MAC enable. So I expect this
reorder to be fine and see no issue of coupling them together.

> Grepping around I'm not seeing any flushing of Tx. Aren't there
> issues with this driver if we stop the interface while it was
> paused by link partner?

I haven't run into these issues myself, but as Qingfang noted in
this thread the proper release sequence per the programming guide
needs more steps:

  stop TX DMA -> wait TPS (TX DMA stop confirmation) ->
  wait TX drain -> disable MAC RX/TX -> drain RX FIFO ->
  stop RX DMA -> wait RPS

This is a pre-existing gap in the driver, currently it just clears
the SR/ST bits for each channel and returns. Implementing the
proper sequence would need readl_poll_timeout on TPS/RPS status
bits per channel (up to 16 TX + 16 RX in my case), plus handling
timeouts if the status never updates in teardown.

The startup reorder is tested and verified to fix the RX hang I
have seen. Would it make sense to take this on its own (only the
startup reorder, with the teardown changes removed from v2) and
address the teardown at a later point as I see multiple open points
on what would be the right implementation to have there.

Thanks,
Abid

