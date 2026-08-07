Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FDAC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2q74kqk26zh4EaW1H6VpmpPR31S2jVXMPD6KusRsTmI=; b=fuSY+SJU4UfSqWrQcauJnxYkWG
	1fTUIJXm9Y2sgIAJGAv8gd1Ucv7KKQ/peWgHdTHZuR/eJon86CpPobTF8QNLEBk62cjG5gUDfBn/f
	PpQJQ944Weh1AtQY1ZOReZE3tcTsr8W27qto9CUs/wbHLwkdtIJsbhWB5uAZURmgrEiKTNuEtd4Z5
	8B+T6bVbbJ/spjh6z9PZiZEyccZCCa2BVMR2f0XxGmA2ZjUmM9g8kIwtjIZiRGbz66pcCFwlQUn/J
	z+up9DCqvn4/M5xXhSokudtwC3mak+VIy1N6kKZ7XCSyTXmjn1UGuBANxNgVZkRBtze1I5zQxU6F5
	FiEDXh7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGz0-00000007XB7-0ac7;
	Fri, 07 Aug 2026 09:35:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsGyw-00000007XAF-3BPm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 09:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786095312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2q74kqk26zh4EaW1H6VpmpPR31S2jVXMPD6KusRsTmI=;
	b=hYTYp4HnBFPtY/ZApZI5jezqPTiKgg9b8RirkoaKWdRhokvroQ/6+AEE4bFbECAvuOjhYS
	xKJ9c1PE1SB9XO+pZDqCGux2/WRv8SxDMmDX48TtWa0uFSVx84ClHijmBWiCuvHrGuHWuy
	68UZ2s0rpqOjG5JOCLZBujVyDrFdMiw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-7UVsfNB2NtCt8kYTBjpiiQ-1; Fri, 07 Aug 2026 05:35:01 -0400
X-MC-Unique: 7UVsfNB2NtCt8kYTBjpiiQ-1
X-Mimecast-MFC-AGG-ID: 7UVsfNB2NtCt8kYTBjpiiQ_1786095300
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-47f81362fb1so1912849f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 02:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786095300; x=1786700100;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2q74kqk26zh4EaW1H6VpmpPR31S2jVXMPD6KusRsTmI=;
        b=PQxG+iEcHR9G1Atg30L2GwlfYjznBZb+4bV734xkzF5GEHz258hTRzeTmxKQAit2NJ
         UWNSkyhayywxFC0h0kvSu7Riw/A9wcRS5VTFxpL/icZbLO09DjOByf28x24zUgFJpL7T
         boeed3C6E5HgcQYlbruG4kO0b7hdCCdByvqvkO4tfWEGoBVtgfWOrqth0BB+c7/+eOqu
         VljTP2Rp+rfh83AT3ooEI8Sl/QScPRuGk4fXx8x0DnbHs+RgxxRhMV0HWTPEnkZQnJI1
         kFZsDBFxwPlm6MRAfZfb37bq2j4Geyd6WAeVcPeFfuay3UaX9aGeSTi6csVwlxz77wNg
         06MA==
X-Forwarded-Encrypted: i=1; AHgh+RrkVU4uMTCEXKlYiTzh8YW/ApNAJ3BWnRfieQJz2+2EbyuvdI7d4JDj1SRwujvita8NRSPlOxebqJdPAvKll+Mg@lists.infradead.org
X-Gm-Message-State: AOJu0Yze3e3xQK5NUEZcBZi7ouKFZMYOEDoQCd08fzOLRWCi/4vePhsP
	m0lqYgKPvhk4nNd/NvOGxy3JvVGjY+jwD73Q3ksAVdfMAsho+/TDlEyfVxRB4MpPQsLI437lrpa
	S1asSyBMLR+OyzfOCo7Zx3qa3ZxC6ifgv6fHPadQ/OdkOwNIzqcA5Wr3JH+Iy6XHMUrRVXuSao7
	tR
X-Gm-Gg: AR+sD10xZjnMWmE5SphvevjzJzLJZemVypJzSL5w+kXobkvnaiF4paPEmdfsy55mVwb
	XSJaV+ICri2R09MiQGvYQQfDvewGcXMJjBdhji74cCBVP4Ydl7GgOJ4BKqt6mIP+8c15kDbc5e4
	psxkjZ6TpXXPEnOVgqytJz/EGoytbInMdwE/OV5meyv6RLv5+3hlYP4LDV046kQXYeo6fQLYv6R
	IeZy9Z62ir1ifd/j6N5irE14zt1EJz1+L3IFmFaFycupIhQrznDkq6yIptFmg2FpzMnNP0TbAFi
	VHeYDRl7B4Kf/1FyQgjcUnec6HHUXYDkChtxTGED9owU3oObn8BcZ1uY1gnH5V4CpTnHOvHkK/U
	=
X-Received: by 2002:a05:6000:1844:b0:47f:9c6f:8844 with SMTP id ffacd0b85a97d-47fec4f8017mr29957800f8f.9.1786095300180;
        Fri, 07 Aug 2026 02:35:00 -0700 (PDT)
X-Received: by 2002:a05:6000:1844:b0:47f:9c6f:8844 with SMTP id ffacd0b85a97d-47fec4f8017mr29957686f8f.9.1786095299619;
        Fri, 07 Aug 2026 02:34:59 -0700 (PDT)
Received: from localhost ([2a01:e11:1007:ea0:8374:5c74:dd98:a7b2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021e8c5asm4651560f8f.18.2026.08.07.02.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:34:59 -0700 (PDT)
Date: Fri, 7 Aug 2026 11:34:58 +0200
From: Davide Caratti <dcaratti@redhat.com>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Daniel Thompson <daniel@riscstar.com>,
	Alex Elder <elder@riscstar.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2 0/2] Implement mqprio and ets qdisc offload
 in stmmac driver
Message-ID: <anWmwkIqEsOLFKXf@dcaratti.users.ipa.redhat.com>
References: <20260807-stmmac-ets-offload-v2-0-9ac67af92cb8@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20260807-stmmac-ets-offload-v2-0-9ac67af92cb8@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NqRnjY2KZFkP3FaNi-we99PNSAY54lRdPY5d2M-WeE8_1786095300
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_023514_888067_04B53008 
X-CRM114-Status: GOOD (  11.66  )
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

On Fri, Aug 07, 2026 at 10:41:38AM +0200, Lorenzo Bianconi wrote:
 
> ---
> Changes in v2:
> - Implement strict priority policy in mqprio qdisc offload
> - Restore to dt configured values destroying the qdisc
> - Do not ets offload if there are any queues in avb mode.
> - Re-apply ETS configuration closing/opening the net_device.
> - Link to v1: https://lore.kernel.org/r/20260804-stmmac-ets-offload-v1-1-f3a09169d22b@oss.qualcomm.com

Since SP and DWRR are mutually exclusive on this driver, here it makes
a lot more sense to fix semi-broken mq_prio offload on stmmac, and
let ETS offload DWRR-only setups. For the series:

Reviewed-by: Davide Caratti <dcaratti@redhat.com>


