Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6E2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 06:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+AybXHCcO4BnLqFoauWvt1KwEn7CeMrNml46vf7sfE=; b=xOIBraFKzGWc5WKnOYufMMtVd9
	SiqmgWNgdHhmyga05uW1ThHLuXU03vf5qK3u4CO4HsUXP6oOu00zTtje9gMtvEqAjrU4SCLCfbfgN
	PE9MQ4GJsPLEtmrfs3jTFG59c17wwXuCrW25K8iTpirdnXwKhllFEpu7uKjBc7BuIIOtjxpypRJZv
	/rBuWfyQzzlJt3MRElG1dgtVIh9O6B/A+sNRSYzEQJV29wnDfSS+YZRyLBlBprplLG+u+kANCf43c
	rEfaWyQL+FnrV20LMrPJ9SDTLbUgKyHexO6K+3AM0Nw7MM89dThGvZ3hNL0EJ2YQCLKHXFD7ViqGi
	ZjBtxuwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfAoD-00000003diE-0MFn;
	Thu, 02 Jul 2026 06:22:01 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfAoA-00000003dhW-40jC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 06:22:00 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c9b42be8feso14899085ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 23:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782973318; x=1783578118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p+AybXHCcO4BnLqFoauWvt1KwEn7CeMrNml46vf7sfE=;
        b=apj9L6d5S2YRb+IAxYFaXvqBlcRbg4vv91sB/11yPEfheBDe+ZwCnBfphh4UoFU6dR
         rVJ7oztbPNuJLskIp6g1Bjhcq1r1vRkZ3+3BHlkfGv08hlOEHYkQCNy/t1rHr+NJFMYe
         TqD0E9Q5vbj5ax6FjrPdUyhNu+hXh38XjVcw5KQ4Sq7jXnSGzx64QEXtba/tlVg3DuGN
         Hm7+Obpj5Dd2/ChTALi1qidLbDM5E28+6RMCcvtPbiPIUGIClqTXVlQhNuolArOtGdnd
         tPO3910CZ1FmetzteB3rxG4HwWsFhNYW3I6UGf1trriDaW7IfXYPksON4GbFuAe7sZAH
         9x9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782973318; x=1783578118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p+AybXHCcO4BnLqFoauWvt1KwEn7CeMrNml46vf7sfE=;
        b=FZmFpy/iWfCsh/0+ju7D/Gv3bLV/4lOG+09JS3xD5QCsQmcnSmwTc4bf8vYISOuZLQ
         1Qbfk0R0QuFGUR0RLUkm3tgtCyDTMRoGVPTftNoHX7TG1h0/qpHCXWLQxO1eRo9MCB2/
         GaqbWXq6EUDmMQno4iphKIpT4NjFYR85l7ghVkDCDif7ltiR30F5bjpf6b67c4uQB3w2
         goS8D+k3giYHQyAIUTzX7XArN8wydDUyB5w2a4yI1VItDkkWiJrt5vaiOKEkp+RXgDbX
         LUsHdJiOt/rSZ88irl7fskbGnTx3cAHiigvrtX7FsMZtMNRrqcG6rWxzlQbUNY15Le3t
         Iuhw==
X-Forwarded-Encrypted: i=1; AHgh+RrmfUhL5+Vpzxd3eBCH4j+tXWLCiVgV7QbazbaMmtEpRDNDwHbK8Ja+rtfssT1Q8mTCPs1wd7s4VAOqqdQteJ1+@lists.infradead.org
X-Gm-Message-State: AOJu0YxzjRZOA93CCSBP8/8Ey/3FLm/DhKZ4DFAUUruzWH/aG+HWkDbi
	eeXzpQ6hqzSBAEQb4qztQ0UNvOiI6ho0RpgdB6xGJNmu6iBRhgj4q8bL
X-Gm-Gg: AfdE7ckFlp5z8vaXfemrg+M+oTvYtB9EtVMBk9j6dVXUTX7gV/VPAOv8EHDICBCdRiO
	7GQ+0Uz1DX4LagWCJkJ7pY23Goc7LQX9Vf8dDurwn39n5ZOubiesYHeiwxPSlgCUwtHyROx+H1X
	Ecvtzlezqm7dTdCRCDVLks9e7Fh0ko4lQMy8B45zddFWTHGCRU/cwLJI0Ffm1MjKIF2MffNkuKe
	oc/kGZApoRRgmu5us0EKn8500VLlLMqqDPymzygbF5xAbC339S1NwbUKch33AdopiNOtJR+U3AY
	nak9LyddcH562293nqlNAvaakGkSl16hBzyVx/OuBnbql0uCso+UuZxHqfydSRI6E12LVSzNQYg
	2lVJR1EUVZOqcOr40jpWi3m6p0DXpGRoSdJ9WFebq0xJq+m4z0O3Ce6S57yuYm7UuIRZU3LiiEe
	eRiQ/TS9G2DrdpYlLvo4dqATFg14r/UDNmOg==
X-Received: by 2002:a17:903:41c7:b0:2c9:c46b:129b with SMTP id d9443c01a7336-2ca7e67c028mr50539785ad.5.1782973317756;
        Wed, 01 Jul 2026 23:21:57 -0700 (PDT)
Received: from nbai25050028.. ([2403:8600:2090:6f:cce5:6a06:d746:c95f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa65asm5296145c88.6.2026.07.01.23.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 23:21:57 -0700 (PDT)
From: Aniket Negi <aniket.negi03@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aniket.negi@airoha.com
Subject: Re: [PATCH net v2] net: airoha: fix MIB stats collection to be lossless
Date: Thu,  2 Jul 2026 11:51:47 +0530
Message-ID: <20260702062150.8291-1-aniket.negi03@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <akWYEf5wusTq9_ol@lore-desk>
References: <akWYEf5wusTq9_ol@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_232158_990898_DB706DB2 
X-CRM114-Status: GOOD (  11.35  )
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

> > Signed-off-by: Aniket Negi <aniket.negi03@gmail.com>
> 
> Hi Aniket,
> 
> just few nits inline. Fixing them:
> 
> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
> 

Ok sure. I'll update.

> > +	dev->stats.mib_prev.tx_runt_cnt = val;
> > +
> > +	/* tx_len[0]: RUNT (32-bit, delta) + E64 (64-bit, absolute) → {0, 64} bucket.
> > +	 * Accumulate RUNT delta in tx_runt_accum64, then assign tx_len[0] as
> > +	 * accum + E64_abs so each call gives the correct combined total.
> > +	 */
> 
> no new-line here.
> 
> > +
> > +	dev->stats.tx_len[i] = dev->stats.mib_prev.tx_runt_accum64;
> 

Sure, You are reffering to both the spaces above and below comment section?. Same for rx_runt and rx_long/tx_long.

I'll update as following:
 +	dev->stats.mib_prev.tx_runt_cnt = val;
 +	/* tx_len[0]: RUNT (32-bit, delta) + E64 (64-bit, absolute) → {0, 64} bucket.
 +	 * Accumulate RUNT delta in tx_runt_accum64, then assign tx_len[0] as
 +	 * accum + E64_abs so each call gives the correct combined total.
 +	 */
 +	dev->stats.tx_len[i] = dev->stats.mib_prev.tx_runt_accum64;

> > +		u32 tx_drops;
> > +		u32 tx_broadcast;
> > +		u32 tx_multicast;
> > +		u32 tx_runt_cnt;
> 
> 		u32 tx_runt;
> 
> > +		u32 tx_long_cnt;
> 
> 		u32 tx_long;
> 
> > +		u64 tx_runt_accum64;
> 
> 		64 tx_runt64;
> 
> > +		u32 rx_drops;
> > +		u32 rx_broadcast;
> > +		u32 rx_multicast;
> > +		u32 rx_errors;
> > +		u32 rx_crc_error;
> > +		u32 rx_over_errors;
> > +		u32 rx_fragment;
> > +		u32 rx_jabber;
> > +		u32 rx_runt_cnt;
> 
> 		u32 rx_runt;
> 
> > +		u32 rx_long_cnt;
> 
> 		u32 rx_long;
> 
> > +		u64 rx_runt_accum64;
> 
> 		u64 rx_runt64;
> 
> > +	} mib_prev;
> >  };

Acked the change name from tx_runt_cnt to tx_run, tx_long_cnt to tx_long, tx_runt_accum64 to tx_runt64. Same for rx counters.

Best Regards,
Aniket Negi

