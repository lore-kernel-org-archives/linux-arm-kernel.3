Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D4CCC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 06:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qUdG1fZIVOpI3Y11JBzeXPhxm8ylKtCi9anh9rDrIA=; b=aNSNkfcSandFnZ5aZqGeRIZg7x
	wDyRtBNZlny1e1HCWlDz0KCgh5yofMEB8l2x0ncsTN+Qs9BEOdollqgEp4hm/am8Aka4pp4zZiSML
	4IP1D6EHVeqzoRNoI0u9XtvPYmCavEvG0L8DmUPfQDl4EbxFTwcfynnCwNG5/bCdrudqh43xNiV6q
	963bkmyBgO0K0Xz8qCucKsgqCZ4yhtfv/QkvVJy4QxaM2SwN1Gakcisi4oGYu5tTQIsQI6vFPFkwI
	9zMO11JpIbQgmOPW3bByeoSA2fx488Mh/V4JYAkxE/o8dW73RmQpWxXBmtljFSNLUNHbJIRgeyaNr
	dFraI6tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVhl-0000000C70D-2GYt;
	Tue, 13 Oct 2026 06:09:41 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGVhj-0000000C6zf-2Wcg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 06:09:40 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-33c2520ad38so5996100eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 23:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791871779; x=1792476579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5qUdG1fZIVOpI3Y11JBzeXPhxm8ylKtCi9anh9rDrIA=;
        b=Nz9OM1ORnyK8tnz5DnYKBILN56NmIZJqjXuYi0LfSQ2NUJ8hA48D/hONZX2/d/vesT
         pxTtKFS9pDAbi4v8eM/YK1LAUKTH9/My1qwf781LGGRzjHemgfUyHI6LcRmqgK2/Ks86
         q6rR001FQglzII7Id012ugfWsEMigYrfYz3oJurlEmOqMJJ08KJXJozul5i6bJQEGa4A
         KCDCRK+rjEnbC9/jy1vdPMFORJYhi2vlySDqQo3Bbg4KxxiddCQxA20tNrLqI1RheXQz
         +LEnr812PZiwC5djwWWfNQ86bodjyeY3649xm7pjgSNymMoERdJobQ3mlTVH6gpd8X1x
         4hQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791871779; x=1792476579;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5qUdG1fZIVOpI3Y11JBzeXPhxm8ylKtCi9anh9rDrIA=;
        b=mswfVCtlGBXOA2W55spKd5gTzg83k6yL2yQsFwm8hGx7gKfI5XRmIjPe6b1UWVxau1
         Re+ZSRLCKXGw9uWIOcb5PqJyUyfRR5Gwe4QAALS6u3fkzlWWMN5rd4NvEgOoPEQbYYQ6
         KhxWmrG7verc2uaSOw8/G3aQBl52iexqH6Gh493E49hKCqdnyektrzklticNabqaqIEy
         Ql+gVzRozbiylMUhrhz8weIVHLrIA87a7X5i2o4eL/jjGD1gA446g82o1eQAkOWHvNCk
         wOiyYd/JImfTXAvcbhCNLnjTFrVKSF8cuPU5zQQDl4BzCFWypfuANOcCh6gJdstS57YP
         TE3w==
X-Forwarded-Encrypted: i=1; AKwUvBzvNzMDGzJRcSo0xlN2fO63iJACIT7BJp5PnBYpyhoiS9nhpgMXlXXUP4rzOwWJVJRhmneBIduSReFxpapEpmm+@lists.infradead.org
X-Gm-Message-State: AFq9FYLvkaTtNH7Ye7YUppfOiGCaz0jRrFsoSCNoaHQEaADWLkUf15hw
	s+Af638g0esk8OMraKO0C1pppC5bCKcM9TgjxtPl2Jl9AIsTSgWfC8VbAdfvuw==
X-Gm-Gg: AYBFou3u8VxFBDVU1LkEGwMsCnO8XuNVqzC1Sn23gPgIBfh8r4/PvudA7VuMHG/n9k/
	aONkigzG9aicx+FpOd6y4GNyBzwNrZTOYp2D7aedCWOMsAwkRqdrEinr8kPjYj7Ma9J0pV9TqlG
	Kc3tRvElB902EA9a+krJ6V9J55f+1jN3qYrfn5CgY8u1oSlRyL/UMJSOLfncFWyinJ/K8h0II3l
	zc2M4EOd17ak+gratg61LtRbQ9j+N2JzqpO22+E9J5fJ802YX2XTnZwDNcNekQh66k4VOqf/BoP
	Z4ZsbWGBAH7+tPFF2uXbP5x5XGiA1MpPKrQshFkIzvJ3Gf5WN3CuPcrEfPELtw+CMLP2SWNWbmT
	qhXbzwsypKx3KpTLNw6A8B34naV0M8wzIWbZNF5Mmz06xtI1pEDp1umi/pa4uhDOPodBGW/ifBc
	VZ0QVjskfMe2rITJWMspAzMepeht6mui8CUO1EnU9CohF3hSU4n0mZBW7MnmFAGkZpY91ZsPWeu
	QLLZKUSPks=
X-Received: by 2002:a05:7301:53c9:b0:359:d4c9:6081 with SMTP id 5a478bee46e88-359d4c96379mr8845059eec.12.1791871778652;
        Mon, 12 Oct 2026 23:09:38 -0700 (PDT)
Received: from online.mioffice.cn ([2408:8607:1b00:8:5e2a:b6c:f432:a6f3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb6a279sm39548085eec.30.2026.10.12.23.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:09:38 -0700 (PDT)
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
	zhangpengfei16@xiaomi.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: fix RX coalesce frames counter
Date: Tue, 13 Oct 2026 14:09:24 +0800
Message-ID: <20261013060924.2777461-1-zhangfeionline@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179154446637.2527009.3819979695606095666@kernel.org>
References: <179154446637.2527009.3819979695606095666@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_230939_642329_A634BF38 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
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

It has been tested on the hardware device (not publicly available),
a DWC XGMAC with the RX watchdog enabled, using
"ethtool -C eth0 rx-frames 16" under UDP load.

