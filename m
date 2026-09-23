Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCACC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 13:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DvrVvCJTQQOy2Ljw0fC6mFfv7ZDXIe713sZSc7YfmU0=; b=aaEmmjbFLFR+KvTN5JUhFgP9zJ
	c4Zcoo9rbaGaqlNTyjHUB0TTt9ZX4lLR0CLw6RQlCFR6su9A6pG22VWULudkpdUJbgBhGQhh5Ahf3
	niPMAeHgTbBk4vbh/0xlP2Sq6TNIyswpPkEBfoHre32U/zU73PjK2Sd2fahneav0YB4ALvfwYZvY7
	jOA3qmS1WjUPLFSvifrfos2LAlQ/OqS1N/gQZ54UioDhk91uji0gppYfNityVhkBKUZhexeUPHnA2
	SvPEI0ZayhpfSH5ag6V99RlVAqmAfC07ND/ih6+MBS2xNPRE9IihQSwM4dRuNBZOB+0GsJHSAf2qO
	fscf2b7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MrJ-00000008Myr-0Bmo;
	Wed, 23 Sep 2026 13:18:01 +0000
Received: from mail-ej2-f10.google.com ([74.125.228.138])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9MrG-00000008MyQ-3H53
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 13:17:59 +0000
Received: by mail-ej2-f10.google.com with SMTP id a640c23a62f3a-c2551bfabefso70022466b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 06:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790169476; cv=none;
        d=google.com; s=arc-20260327;
        b=TrySQAKpJIrhK06dkDiTK3dPlaQ9R0MJO0QRe4WbrIOOwXEl0QV/koAOtatymp81di
         lPH9sxu0A1aso/4M9JSiYnIb/AG8kaxRoNH8ox42HEx34xB67ecXy+G48V7gc7LQtdoq
         3oVSStflnKdRL/XROQyu757XOvozIEps9hDoHc8lT2E+zLLFQnt8d/CR1ET7FlxAgpyR
         E9eNiGD3Damv3UdT9jASCqQh8wGAm3QFRyHKdzAuW9I7G+t2osk+65mxsPDZbFtm7f4P
         I0uAXpGC0yZ64Y9cwIv4OipCVQW2h+z+yTKPIwSD9TQla4WQUzKPDQa4zlLm/ABODc2e
         vejA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DvrVvCJTQQOy2Ljw0fC6mFfv7ZDXIe713sZSc7YfmU0=;
        fh=/8ChEV1INQu2KRnjiDyO5ilgurmyJbSl7Hv5arMQV80=;
        b=q0xeUEsMtTV5VS4NIoZcY/4x0mSMw/2XoPSCMK+yDK7PYtPwG3sgdyEGKgKSOKZL6V
         vTnJcSgvPY9dZl4olnDrxUbmLcFRz4emTdWDPeO7boN+KNYuDbf4CZXnkKP16WbaNQZS
         AfcRU/rOdA7oVLsQnDt6NCNSfMC+dVTNqlf61ZRUzVN7iIt4KBRbbXVK3ERy/1nke2L+
         orDPR0SVnilUGi5p3Z8xJrtxTPY7BfBvIoALi7kpsxCCsKeAVcVpz+fmO02lrlrxobMc
         Ej1Ja4T2kfLQeQpsabAbLDeckIXAT945ldQTEC14wcBf6tLpvn4pjRyw7LePtj+O7Jlg
         aC/Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790169476; x=1790774276; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvrVvCJTQQOy2Ljw0fC6mFfv7ZDXIe713sZSc7YfmU0=;
        b=Zf9MEqNZW2/ygtH1mssC6DbfSTIHQslv5Z3t2A8ZkPWbK4jL+Xb9EJmL/65QvrQqdK
         4grIvdEyOcbnERBwICgMSxcgHchP9uLX5xzS8nESg8j8+aww7U1jYzfKqZuRiepqTqZ3
         1VzdkAxpVabodHrGLwInrS2spGLKDgTufydS2Ky+4mb0eUkw6VwgzKRJlVX+BxPwOuQu
         ejoiugcQvXHWqOMSkdilj2p2V1qMuSt4EfeZA/LnkSJ8UpUukObretrJ0TwTKVUbaUUS
         1Bu3yjB1odDkktg/t8+3VrN2CI7pJtITpjIPgl60ciwmcLY9UUjavPl3BoSLm2/BPBN8
         3Kzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169476; x=1790774276;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DvrVvCJTQQOy2Ljw0fC6mFfv7ZDXIe713sZSc7YfmU0=;
        b=KE06LYjPPuP4rbgez63WTj7B1XrNpsSz9cSKCwDGazOJ2kWe/UeFzqs502E37EW+uY
         bzPUZnc9rlG+e6OP5a68rZZqGx4dysVoOPxhPcr9xVtYN3sCmnXKpNRqcoMrmWO/DxLO
         GolrBsXdhPfiiBF19czIi5mRwq7UvnPYcMAu5a0zscWP38Ro+rPQKqY0QD3P31AWNtiY
         1pEbKNCLRENCrGa/l/4GmTnExfEmeAIRTdui30TpJ1tnKzT4KMqZ5+FVW43XIv12jtW4
         dtptYUitnSmK5586fmInHV081X3Fq6dIXYjKfE6793tUQ9Wu3VZhoNuNEKvWpaU4Ri4k
         /7fw==
X-Forwarded-Encrypted: i=1; AKwUvBwzIX5+82b3jJdmAAcJ9LwrTS3SAxTS/QD8G5sF7L/5r145BxqzINn6Sb51Z+mnpZAT1VpgqSh5uRufgOu+2wDt@lists.infradead.org
X-Gm-Message-State: AFuF++nQZSE6LdKE9oSpALcpivLoWsiu65+J07HKPgSplZih31grVRvP
	fGFA2k1l6gfZF9zYEbXhNboozxwBvyxAEzTW8KCmFMAAZ5rwQ5pZ2aiuN4JwU1MjHLcKTh4vVg/
	iSJ7uGPIsf22uSlwkydIXndfUNORZb38=
X-Gm-Gg: AYBFou2xRqqRRHisBw8l6k3e8yhJcFur8v/jnkHqpUsVSPvRjBXrorG83pNfzDeTpoI
	chBpO6y8OC/qiqVdxyirw1w/oBp8fFLRWJHHXzjJg8UrIwesAmQmsN5JdqIQcKkqQNN7WRDUYad
	vbnFB62D/sdEkajKUlRR62XSSs5acAF0OahecCH/0sD8dTlzGPvK1bYISYVlxvAhwhGbCkuv2A7
	yy0QmRCcPGsgggZeKpo0qTPP5QNf/R5X9GmZR0CPaMuNUlnWZKX71YAqQl8KVAebd7AId11Qy/T
	Vn1yGG3odGmqb/ORMfjJcNL2LnoAFmGOtt8zIXKJSDdisIMWr556feR0tJrbk92YIm+S
X-Received: by 2002:a17:907:9409:b0:c25:8e4f:6d84 with SMTP id
 a640c23a62f3a-c2aadc98eb9mr212676466b.2.1790169476343; Wed, 23 Sep 2026
 06:17:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <5135e15d-b6ac-476c-9a7d-b7d64e4eed5c@bootlin.com> <arOtU15iv5CWPUEu@oss.qualcomm.com>
In-Reply-To: <arOtU15iv5CWPUEu@oss.qualcomm.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 23 Sep 2026 21:17:44 +0800
X-Gm-Features: AclHuK-Nd-SsXdAr_w0eePSBz9cFeJT2YpbrMeoFm4kjMm3oXLxfgGRct4bNM9Y
Message-ID: <CALj3r0gAaQ_CoS5_9Mmf5HY+Fu5_e74fbb+r0LstafMhagHx6A@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support and
 add Nord Ethernet plumbing
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Richard Cochran <richardcochran@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
	"Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, 
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_061758_834963_F2E575F9 
X-CRM114-Status: GOOD (  12.21  )
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

Hello,

Thanks for the RFC. A few comments.

XPCS_ID
-------
Is 0x00000030 documented for Qualcomm, or is it derived from
NXP_SJA1110_XPCS_ID + 0x10? If it's the latter, it's a magic value and
I'd rather see it confirmed against the Qualcomm documentation or a
register dump from real hardware before it's used for platform
identification.

Non-existent MMDs
-----------------
Returning 0xffff on reads and silently discarding writes is what a
floating bus / unimplemented feature looks like, so I agree with that
direction. My pcs-xpcs-rk does the same.

Structure
---------
pcs-xpcs-plat is itself a platform glue driver, for SoCs that don't
need any platform-specific handling. Adding another abstraction layer
on top of it to cover Qualcomm would be glue on glue. Generic, Qualcomm
and Rockchip differ in power management, address window size (2M vs 8M,
...) and MMD redirection, so they don't share a probe path.

Pushing that into pcs-xpcs-plat would also drag every existing user of
the generic glue along: they would suddenly depend on GENERIC_PHY,
PM_GENERIC_DOMAINS and whatever else the Qualcomm path needs, or they
would have to carry per-platform branches in a driver that is supposed
to be platform-agnostic. A per-SoC-family glue driver, the same way
dwmac-intel, dwmac-rk, dwmac-renesas-gbeth and dwmac-rzn1 are
separate, keeps each integration self-contained and leaves the generic
glue alone.

Would it make sense to take that route here? My pcs-xpcs-rk does the
MMD redirection through a custom MDIO bus; maybe the Qualcomm glue can
reuse that idea directly instead of extending pcs-xpcs-plat. Happy to
help with the generic parts if that's useful.

Best,
Coia

