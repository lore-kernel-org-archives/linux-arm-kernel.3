Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D79CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 09:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lebBIPbB/BBbKsr8+CagAXggQBPA0B122eAEgpfMh5o=; b=N4sWUW1j4aVOoNMEd9q+GeljJ+
	oNOs0elHwKiBNLcQRztrZgUAqbfTx1ViPCu2HaYrXrtZ9QQg2FGK9X7/lKrswq5RMV81haycEt3/E
	EFpBDdQe38im/bmshi4cgwcTj8gctaYtDXtJ4v2wbf5vuokAUj6awKIWHiQJpKJ3hseLq2TZu4luA
	mo/bEVyiAr8AY4fcvC57VuzwEnCPNY/s3vzx0GNUMGmncliOghD7xbxXahuZ6E1CHcZQbUMoxeJOU
	Bt2ZKB2e+Vbbv1e5g7ARtGuxYUXOJZhnlXnLSITepNpUp3X81xZaeQ4j17jGaGWqBIlIQnKQ+ap6l
	qmbdN7XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCvs-00000008KxO-0WEn;
	Thu, 01 Oct 2026 09:18:28 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCvo-00000008KwI-3Xay
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 09:18:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DF5CD4E410EA;
	Thu,  1 Oct 2026 09:18:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A1C8B60341;
	Thu,  1 Oct 2026 09:18:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12CCF1032989B;
	Thu,  1 Oct 2026 11:18:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790846299; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=lebBIPbB/BBbKsr8+CagAXggQBPA0B122eAEgpfMh5o=;
	b=mklAmku1L9j4jxEGEYeaz5xKAc7GnKmjXPB4EhFw8ZQXCmES2qu4X1GTw7Sugi3/+CXE4D
	EF0HpF24Cg8mSm7VyLbCo+4qqW6kMYxeMlZMDxhkDvphEpgs9xAWCgTTeY2VgLCJL3wbeh
	ZQFGF4Gn8HkTqX2UIdPYWYJ/e3TSUzi9+4wAjC7Gz/m6TBwGEcBcnpGkyiKDND4j+bkaHi
	ksN2jBTmKlw859wU2lOYkpUhPnEaso7lsLhNefWdc7DvgGHF70fUTe8+T21PBjNRCU9wu4
	CKTdhWuz+SatO++nEjviuTpy9kPxmX6y1QMY/LHMr6s8RRs8/jq5ZqtY5QYHkg==
Message-ID: <993cebd8-2a98-411e-b8d6-d2088966d9a3@bootlin.com>
Date: Thu, 1 Oct 2026 11:18:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: stmmac: propagate PTP addend and system time
 programming errors
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_021825_027434_75415E94 
X-CRM114-Status: GOOD (  11.25  )
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

Hi Lorenzo,

On 9/29/26 15:10, Lorenzo Bianconi wrote:
> stmmac_update_subsecond_increment() ignores the error returned by
> stmmac_config_addend(), and stmmac_init_tstamp_counter() discards the
> addend and system time programming errors, always returning success. A
> failure to program the addend (PTP_TCR_TSADDREG) or to initialize the
> system time counter (PTP_TCR_TSINIT) is therefore silently swallowed,
> leaving the hardware timestamp counter in a non-running or partially
> configured state while the driver keeps operating as if timestamping
> were up. This matters for TAPRIO/EST offloading, which derives the gate
> base time from the hardware timestamp counter.
> 
> The same hooks are also called from the PHC callbacks: settime64 and
> adjfine drop the error and report success to clock_settime() and
> clock_adjtime(), so a dead PTP reference clock goes unnoticed by
> ptp4l/phc2sys.
> 
> Return error codes from stmmac_update_subsecond_increment(),
> stmmac_init_tstamp_counter(), stmmac_dl_ts_coarse_set() and the
> settime64/adjfine callbacks instead of silently returning success. On
> failure, roll back the partially applied configuration so the hardware
> and the driver bookkeeping stay consistent, and report the reason
> through the devlink extack. Also guard against a zero sub-second
> increment, which would otherwise divide by zero when computing the
> addend.
> 
> Reset the persistent timestamping state (hwts_tx_en, hwts_rx_en,
> tstamp_config, systime_flags and tsfupdt_coarse) when (re)initializing
> timestamping, so a failed init does not leave TX/RX timestamping
> enabled on a counter that never started.
> 
> Fixes: cc4c9001ce31 ("net: stmmac: Switch stmmac_hwtimestamp to generic HW Interface Helpers")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Thanks, this is nice.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


