Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189DAC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 10:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qp8DvYGUWgTHXAPWqbMBZV8Rl/qxPnTYUxFzmDOOo1U=; b=JGmZ51jSXomTb5grw9jhmbB2Wh
	C86aBsFWBHj1F6QLS80BjwPwSc5WcK/lLUSubxDlBgPo3WDg80FgPaj8F1Z50PEkbe34mwR3WHbk2
	JUK2o1G/oPdQXCdOOFC3oUk3+5bTxfST+1VOulyGKJ+B6ewmFVM77AmHzwHNSkEoNHJcb+LepIO1i
	01iVX/FP/hqq0gOqj4FBwCjZCpYUk4dDo/3UO6olWiDrKOW70QvXwCovB35ZKJvbhK8IfTlctAzJN
	GCt3tZpQFO3UpTJSMnk9/VrHNgHZn8m4NHUZ5EsWWccLHR+mdhXB464aCgBS+94R+ojXhxvC+zVv1
	+Pai4YpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPqj-000000053U9-1hmh;
	Fri, 21 Feb 2025 10:01:37 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPYq-00000004zDN-3RjX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:43:09 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2fbffe0254fso3847573a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Feb 2025 01:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740130987; x=1740735787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qp8DvYGUWgTHXAPWqbMBZV8Rl/qxPnTYUxFzmDOOo1U=;
        b=ni5/5RkGXgR1VqpZ6UarA9otj5P05IYtuJ2lQY4bZDEhG+Vv4vp+z+ZgY6zZLeUMhO
         xF+gU97RHXtqJe+R9lw770H6OIsAXSufJSxroYOYHSqceJGMyK4osOnFePYJEL1kLw2M
         qpXU45uUMbFTNDd6AZ70YSV5JK/QPqX9DiWTRx4SIA2Q5Oy0c7jvM1VtpoFRo7bGk4Vd
         3Qbbht7g2mUnjqV6a2NBUaDCdOgVhrp6yM2eXGDtYJv8hxazgJh9HZIENVMYGew0c0AW
         uV78cDPZVMWuHeUzUfdZ93CWa6e1Ls6Ge1a4Gu8kpmwOpSAcs3zeZtLDMMCKarkTgXvt
         J9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740130987; x=1740735787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qp8DvYGUWgTHXAPWqbMBZV8Rl/qxPnTYUxFzmDOOo1U=;
        b=Vi0op6AMVXytkjZZV0VliAJbq6Fqd49+wtvOOfiyXzB5ggT076W7ORxgxZs8yatzP5
         4re5jlGKpzgYeYSbqPW6ElTquKIVvXm6Lmc3mr8xa/hNNtPdWTBdSPlw8Gpn2KEX1w1H
         gqZBWZr1F7AQa/4Et5fPEMHTg59PI7p7u7Vwjh0QZDX7AgGopmOxzXAZszh6TGqb1gP3
         1di94Re2LH49RwZBKXYIPml4zOuyxPvVOfFtQDGhkgkjCFmViJ96zpQW7zPKDHYwEbI1
         1U/cBnVJIzSMbwsGA8H3sI7Hx/BRnhLATZ7bNeFaaoFaO6PDH7kO5Gk4fGOZQ/tgPfZ5
         j37A==
X-Forwarded-Encrypted: i=1; AJvYcCXz8+DxpJauSTHv9jUxnZLe+5moYiZ8AKetKZTQ2jiwq0cS/hHpTp8htPRIpcC/mwaKUeaeF/DNbl4MwPD1kIii@lists.infradead.org
X-Gm-Message-State: AOJu0YwW15luixFpBisu7bpn0akuerzqk9RfCHqdNT4XceRoACHJ1MHN
	0LaeFEHiqyOCsNpK82FDRi5rAGCYLtpuFWyqyGlCcTDUKJjcQBNk
X-Gm-Gg: ASbGncvhUQZhcOa2M59HIcRwInqXZG6NYxv7IBNJaj1SDlatGS0P0z3xBOMDX9VMZk/
	qhgkxudVRZQkLH7tno2YCaajBNXIOyFvN3dvNTn9X41ojOyUNuu4uYR+2Z00+cl0XPwafCyL4ta
	p+eFTMQ2vjZ066juj0EoYYD/gC2buYnK0NS2aNq4VfRAi7LdrEzPju3oiSvnoDVTWDRbXxsPccP
	6fr3zu+VwCtDzxwUjaozE/pF0yJxM0hxYlCX+ryT2pIV1zerKWcu+jF02SfEqmfkltGhZKGS5lF
	C2WnNOef8k5cn+nwfyTeNy0=
X-Google-Smtp-Source: AGHT+IEFLkFCj2bQJ0yLXnoXnz387Bz22Ke8KnkO2x0EryQr6MWOx9pTmc0bN1V4MOkAKGnHvqQCJw==
X-Received: by 2002:a17:90b:2e0d:b0:2fa:2124:8782 with SMTP id 98e67ed59e1d1-2fce7b1f6afmr4454759a91.25.1740130987274;
        Fri, 21 Feb 2025 01:43:07 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fcb844c60asm3042021a91.0.2025.02.21.01.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 01:43:07 -0800 (PST)
Date: Fri, 21 Feb 2025 17:42:49 +0800
From: Furong Xu <0x1207@gmail.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Simon Horman <horms@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Russell King
 <rmk+kernel@armlinux.org.uk>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Serge Semin <fancer.lancer@gmail.com>, Xiaolei Wang
 <xiaolei.wang@windriver.com>, Suraj Jaiswal <quic_jsuraj@quicinc.com>, Kory
 Maincent <kory.maincent@bootlin.com>, Gal Pressman <gal@nvidia.com>, Jesper
 Nilsson <jesper.nilsson@axis.com>, Andrew Halaney <ahalaney@redhat.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Vinicius Costa Gomes
 <vinicius.gomes@intel.com>, intel-wired-lan@lists.osuosl.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH iwl-next v5 1/9] net: ethtool: mm: extract stmmac
 verification logic into common library
Message-ID: <20250221174249.000000cc@gmail.com>
In-Reply-To: <20250220025349.3007793-2-faizal.abdul.rahim@linux.intel.com>
References: <20250220025349.3007793-1-faizal.abdul.rahim@linux.intel.com>
	<20250220025349.3007793-2-faizal.abdul.rahim@linux.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_014308_871943_2FF952A6 
X-CRM114-Status: GOOD (  25.37  )
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

On Wed, 19 Feb 2025 21:53:41 -0500, Faizal Rahim <faizal.abdul.rahim@linux.intel.com> wrote:

> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> 
> It appears that stmmac is not the only hardware which requires a
> software-driven verification state machine for the MAC Merge layer.
> 
> While on the one hand it's good to encourage hardware implementations,
> on the other hand it's quite difficult to tolerate multiple drivers
> implementing independently fairly non-trivial logic.
> 
> Extract the hardware-independent logic from stmmac into library code and
> put it in ethtool. Name the state structure "mmsv" for MAC Merge
> Software Verification. Let this expose an operations structure for
> executing the hardware stuff: sync hardware with the tx_active boolean
> (result of verification process), enable/disable the pMAC, send mPackets,
> notify library of external events (reception of mPackets), as well as
> link state changes.
> 
> Note that it is assumed that the external events are received in hardirq
> context. If they are not, it is probably a good idea to disable hardirqs
> when calling ethtool_mmsv_event_handle(), because the library does not
> do so.
> 
> Also, the MM software verification process has no business with the
> tx_min_frag_size, that is all the driver's to handle.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Co-developed-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> Signed-off-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> Co-developed-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
> Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
> Tested-by: Choong Yong Liang <yong.liang.choong@linux.intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  16 +-
>  .../ethernet/stmicro/stmmac/stmmac_ethtool.c  |  41 +---
>  .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 174 +++-----------
>  .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |   5 -
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |   8 +-
>  include/linux/ethtool.h                       | 131 ++++++++++
>  net/ethtool/mm.c                              | 225 +++++++++++++++++-
>  7 files changed, 399 insertions(+), 201 deletions(-)
> 
[...]
> +void ethtool_mmsv_link_state_handle(struct ethtool_mmsv *mmsv, bool up)
> +{
> +	unsigned long flags;
> +
> +	ethtool_mmsv_stop(mmsv);
> +
> +	spin_lock_irqsave(&mmsv->lock, flags);
> +
> +	if (up && mmsv->pmac_enabled) {
> +		/* VERIFY process requires pMAC enabled when NIC comes up */
> +		ethtool_mmsv_configure_pmac(mmsv, true);
> +
> +		/* New link => maybe new partner => new verification process */
> +		ethtool_mmsv_apply(mmsv);
> +	} else {
> +		mmsv->status = ETHTOOL_MM_VERIFY_STATUS_INITIAL;

Tested this patch on my side, everything works well, but the verify-status
is a little weird:

# kernel booted, check initial states:
ethtool --include-statistics --json --show-mm eth1
[ {
        "ifname": "eth1",
        "pmac-enabled": false,
        "tx-enabled": false,
        "tx-active": false,
        "tx-min-frag-size": 60,
        "rx-min-frag-size": 60,
        "verify-enabled": false,
        "verify-time": 128,
        "max-verify-time": 128,
        "verify-status": "INITIAL",
        "statistics": {
            "MACMergeFrameAssErrorCount": 0,
            "MACMergeFrameSmdErrorCount": 0,
            "MACMergeFrameAssOkCount": 0,
            "MACMergeFragCountRx": 0,
            "MACMergeFragCountTx": 0,
            "MACMergeHoldCount": 0
        }
    } ]

# Enable pMAC by: ethtool --set-mm eth1 pmac-enabled on
ethtool --include-statistics --json --show-mm eth1
[ {
        "ifname": "eth1",
        "pmac-enabled": true,
        "tx-enabled": false,
        "tx-active": false,
        "tx-min-frag-size": 60,
        "rx-min-frag-size": 60,
        "verify-enabled": false,
        "verify-time": 128,
        "max-verify-time": 128,
        "verify-status": "DISABLED",
        "statistics": {
            "MACMergeFrameAssErrorCount": 0,
            "MACMergeFrameSmdErrorCount": 0,
            "MACMergeFrameAssOkCount": 0,
            "MACMergeFragCountRx": 0,
            "MACMergeFragCountTx": 0,
            "MACMergeHoldCount": 0
        }
    } ]

# Disable pMAC by: ethtool --set-mm eth1 pmac-enabled off
ethtool --include-statistics --json --show-mm eth1
[ {
        "ifname": "eth1",
        "pmac-enabled": true,
        "tx-enabled": false,
        "tx-active": false,
        "tx-min-frag-size": 60,
        "rx-min-frag-size": 60,
        "verify-enabled": false,
        "verify-time": 128,
        "max-verify-time": 128,
        "verify-status": "DISABLED",
        "statistics": {
            "MACMergeFrameAssErrorCount": 0,
            "MACMergeFrameSmdErrorCount": 0,
            "MACMergeFrameAssOkCount": 0,
            "MACMergeFragCountRx": 0,
            "MACMergeFragCountTx": 0,
            "MACMergeHoldCount": 0
        }
    } ]

verify-status always normal on other cases.

@Vladimir, maybe we shouldn't update mmsv->status in ethtool_mmsv_link_state_handle()?
Or, update mmsv->status like below:
mmsv->status = mmsv->pmac_enabled ?
		ETHTOOL_MM_VERIFY_STATUS_INITIAL :
		ETHTOOL_MM_VERIFY_STATUS_DISABLED;

Anyway, this is too minor, so:

Tested-by: Furong Xu <0x1207@gmail.com>


> +		mmsv->verify_retries = ETHTOOL_MM_MAX_VERIFY_RETRIES;
> +
> +		/* No link or pMAC not enabled */
> +		ethtool_mmsv_configure_pmac(mmsv, false);
> +		ethtool_mmsv_configure_tx(mmsv, false);
> +	}
> +
> +	spin_unlock_irqrestore(&mmsv->lock, flags);
> +}
> +EXPORT_SYMBOL_GPL(ethtool_mmsv_link_state_handle);



