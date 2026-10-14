Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7646ECC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 04:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WjQH6eF1riN+Hdn/Ak1ts4FChWpGKVUmHOzzJk7eT5E=; b=47LYgMdF8JY3HECiSteY9q4jdA
	yggiRztwYwa15XeBSesabLDattVP5lTclLg5L4D7OByYfbE7aVd+YO6lZfgbdUsMfgGpAHO2sLl0k
	/YyEsLlDAYBT4+b0I0dtaKLIjDWE2sDdEbdubydPBlyYMjGX7QmDaZ5HkmC2hnvyafzGL2LxPHTaE
	3tbRJR9bR9cBcGQIzHYjFIr8zK0Fxafk4+iLjyMLoHhm6Dvu2nHQ6CGYlrOHQGMMHMYSC6c+7CJJd
	tx0uRxeIEetCv/GaBL97S83s04fy4TFbbFA8oDlWcmYgkrPuULMKxZVkYIyDpBFJYr0tbMJugGwfv
	8nipRSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGr2T-0000000EWpr-41B1;
	Wed, 14 Oct 2026 04:56:29 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGr2P-0000000EWpT-1RIx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 04:56:28 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-353804b591eso6494396eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 21:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791953784; x=1792558584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WjQH6eF1riN+Hdn/Ak1ts4FChWpGKVUmHOzzJk7eT5E=;
        b=axeu5QOZcuLfcKFf8R+gKx7/Agm7HUTBY8fxk8Qj9yNOxQyh1juknb1Zu5NBxgecuc
         JCS5Tdf5XK8cM+X/xKVTiAxNoLnB9VGSPdg9bdE/UuyDUXIoqXes2QbrNQZJS5fOb4P4
         tVZjC8AE+czRegwv0CvwRoC58VWtcwCn6a8Ilj+p36JgAWARbM3OGWu0NiRDT8ZVkCyQ
         x68ddHC1BJQfyzP2Mf8vqv45DH7adtuVBJXdaOBR+lEwFH4n8a18+5fL3fDp6W+YX1eQ
         9L79zLmtYNcxfaUnmZXtGn9vet2DsppvVSI/LVTwlszAUWh2eyFjGinkR8M1s26W7raY
         DOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791953784; x=1792558584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WjQH6eF1riN+Hdn/Ak1ts4FChWpGKVUmHOzzJk7eT5E=;
        b=y0UBu2Kt/Ytf5/MQJ84Y8uV373RG4ADu3glf5IZ7vsq8MjyY7kTT8yl3+gO6KPMfpd
         u2+vAtVRxw1/IQP7WFkRqrkkKsvgzaK/fy2CyRwD17h7IcPPp+d3kVcM8d24t6HyWQPn
         sor8DF6q+/wIEaNrxgEj6YHyhPfRvivVoMub4DWXzcsTP+TVlTPnHpmjMG7EB1Y43Ci8
         3JQE3OTxD7kUoB4fkaxwaxccdKOwUzlcyKyUJMgqYb5TDgyLo3LO5x5wgAwdfIqAyXcI
         GutaB/TqY4Wa+N9P7w8UmQKjJGP0dbuzYsdodsOYNZ+LAfE2j+uZXTlK99FW5r+xDQPw
         U18g==
X-Forwarded-Encrypted: i=1; AKwUvBwSw0Tlj5OaqlG8K+nvixwcfZyKCZXTCS4Q8fY/8zn6eflsBhrr0g6nuq1AXFOIHZbSHsbYEP+IDVJWt7qjqo7p@lists.infradead.org
X-Gm-Message-State: AFq9FYKZ5AlrQ9NEGDvMnTiJ9Y4ZY3lACfsv9kJFgX9ot7aOD3rnokCi
	KpFVCh7Plc4hQ35yQhMa6VDok8r+GJIw7Uv93YowHsaTpujj5qDzJR8+eY/r6ErF
X-Gm-Gg: AYBFou11SJ1vVHeNmFa+a1Mq08hDYJijY8vLfTKS9FhT9JJiqBm42/Zj3FVWf7TMhYK
	JsdU3+0tEmKdHvXs43hCFGaYFrtvmiCCRyCJjJj9p6ub82YBYL44eaQgdIux28UdWDae61cBgAn
	QgaakOVU38oqzM4Is0O86a87NYNwaYUeNx9OAobEkyXhTrgGpMmNeaO+H6yj89M48tOV8+MuOzc
	PPzpTPhs9ACxiVMlL/Cnb1AFT1+N5zp9LxogSpMAxDYPmbzuN+2gtn5NxHNzrKcZa/FqaxuDVpk
	D3RJtXQLvxS9S86Mrcu8W4D3K6lR4uej7FomaDSeVTrKhoMNwX+GsnIkH/26cDaxRCUZg18n24J
	akfQNHtFm/5JcPtioUcpGmWzmwSPcdy8TQ6vEMsbq+JfDtGrU4h1AoBNMSV2wrZIdglGAjt8KE4
	RzHmgtUru2iaxmnpeaiaU/kQnsIEAKCm6c6g0iLv39Nsbps6H3/0SEqy/vgj5FwC2ET5Ms4k8hx
	aNnYG3GFYxS
X-Received: by 2002:a05:7301:dd8a:b0:35d:ea6f:b85e with SMTP id 5a478bee46e88-35dea6fb98cmr1093412eec.1.1791953783690;
        Tue, 13 Oct 2026 21:56:23 -0700 (PDT)
Received: from online.mioffice.cn ([2408:8607:1b00:8:a73d:31e0:8b98:4eee])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-359789fde97sm33473630eec.20.2026.10.13.21.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 21:56:22 -0700 (PDT)
From: Pengfei Zhang <zhangfeionline@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>,
	EricChan <chenchuangyu@xiaomi.com>,
	Simon Horman <horms@kernel.org>,
	zhangpengfei16@xiaomi.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: xgmac: do not treat TBU as a TX event
Date: Wed, 14 Oct 2026 12:56:07 +0800
Message-ID: <20261014045607.3421104-1-zhangfeionline@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179194881415.434549.5017437610608933310@kernel.org>
References: <179194881415.434549.5017437610608933310@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_215625_390828_6BCEF65C 
X-CRM114-Status: GOOD (  14.62  )
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

> [Severity: Medium]
> Can the XDP_TX and ndo_xdp_xmit path stall permanently on XGMAC in
> shared-IRQ mode when the TX coalesce timer is disabled?

This is not caused by this patch. It needs a very specific setup: XDP
TX traffic, tx-usecs set to 0, and tx-frames too large to be reached
below STMMAC_TX_THRESH. With that setup the same stall can already
happen on XGMAC with per-channel MSI today, because
stmmac_xdp_xmit_xdpf() only sets IC on a tx_coal_frames boundary and
has no fallback when the TX timer is disabled.

I will look at fixing that in the XDP TX path with a separate patch,
but it is independent of this one.

> [Severity: Medium]
> This isn't a bug introduced by this patch, but does
> dwmac4_dma_interrupt() in dwmac4_lib.c have the same sticky TBU
> problem?

Yes, it looks like it does, especially since commit 6ccf12ae111e
("net: stmmac: use interrupt mode INTM=1 for multi-MSI") moved the TBU
check out of the NIS block. I only have XGMAC hardware at the moment,
so I kept this patch to XGMAC. I will send a separate patch for dwmac4
once I can test it on dwmac4 hardware.

