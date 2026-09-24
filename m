Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB5EC98310
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkwdcL9EoHavUX5QcWK4vzTTBKgWFQ8kJmmNwelVh0A=; b=LxvhOPA+UreVI0XoMi9luKIQge
	ojL6jrB77iRkvbqU34vhrL5sjY6r61FlxuPWIBwggPmoh9KN4+7OtgXjI4g87UEVIQdJleqPX7XmJ
	K08SmGNJNWlgikfFU4txPNA1n8SHF/H/HHvQHOJotH7mAGxEerFhA9oeBL8A/9XmXc5Aqba7+ZLlc
	EcQz3oXrt+SYL5AxFBKSQCJVj4Dyxnsu97D+XM7ibiqu/HeIbmO5I8Cn4WGLrlarLzXp621G2KOvj
	LkphsCS1i+2IaK+nZfWEK3/mSH3XCSU1YAoFcVPfdNx65DUM4GPnOi1qQ9/ecJCCzLVyHn9Cw+t1G
	OSMLnrxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eqq-0000000AREg-1Am9;
	Thu, 24 Sep 2026 08:30:44 +0000
Received: from mail-pz2-x0f.google.com ([2607:f8b0:4864:3b::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eqn-0000000ARDF-3XiS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 08:30:43 +0000
Received: by mail-pz2-x0f.google.com with SMTP id d2e1a72fcca58-85469e211a3so946116b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 01:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790238640; x=1790843440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YkwdcL9EoHavUX5QcWK4vzTTBKgWFQ8kJmmNwelVh0A=;
        b=HaaYqmp+LP1ywofZPvlNrF7H7ExNTERlOTDQl3tWytgKQmqPvHoi5iZpot0c665ry4
         G3zpwI8ysZhIYSeiRWO5DGzvqkVoOeh3N0AAH2bgnoSkpumClPfKk8Ng0JO8WkGEe2dx
         JcXdBhIxRgyrxfPVf0AE//3XKMZ1fZMwY5rUtJzpIpZtqZMYXQ47P16O9UiQoEL+gqAQ
         gab1CYerqD87iwKjiK9D4IlQPoF83yGTNG47OL5OMt9CZFHsxQGcy0yNCr7cOp1gSO2v
         F+0lxhZPSKoZf2tgHKLFciQDrph3NRCW4eJpzRC3AH8rYbMhSMGUj5MRpjZEkrZJ+zo/
         GXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790238640; x=1790843440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YkwdcL9EoHavUX5QcWK4vzTTBKgWFQ8kJmmNwelVh0A=;
        b=ohTuY9aaRxSPNmWMx5UAwwSUyhDA+pIqtklS5S+xvI5Wyge0B7MsWFQahILwr3+Uf2
         8vK+eysc97O4WG4zEDkgESKhXamwqtkJ6kbJASUSnnmwbOzyvBMX4/6F9SpTgcKm+jEf
         T++oIcpTvci9BoYJil/slpk+/Z5Jo0axOP0coR/0mjX9u2ngVq5XfNs+btWS75qfJYuv
         +RH9MayFThFhtmxjIiZb8HvtF2rF1D7+dQ4Yfvo9A1ynXlhqTceJNgdAwCWnoxYtf/dr
         Wk+TL+3HHebc6y191DnHtzVcC94shJhkRannu7jyQCyiS1s+dWG7oWJAxuzjxTdtPi+b
         BmOg==
X-Forwarded-Encrypted: i=1; AKwUvByr8D8ySAHIGMpDcWfGZUyJpPa4XCvImeRcRbBo30tRNtBhhXeVrqBxKqoUYS94HM024XPsm7HJPFCvaFmv9O70@lists.infradead.org
X-Gm-Message-State: AFuF++lC1MFhuEh8IgIDcQI7mWGoQnp8kOaDZ9M+tPNWUnNtkKCuASNQ
	H4t82Vc0VsArwZHbu0ynDvG6eK1tY6QK2ttEZXd/eN3nTuwqDd5WdnoX
X-Gm-Gg: AYBFou1xI55ohIMCuO/jEGY0bAxF+obbRE888NzbhmqF2CyYIuO93hYBk3vRl43d6fD
	XKMmKPL8DRYc5XikVoIiHqtSiN5xIHYclt/cullvVnWnRDSsv3Sv3Cl7cqel6otBmn//zT+EKxL
	sdxrMKxlkV9zo6Czyj61LfcLdr9//oHbqEJwG2uPsdskOQWs46Boz/DqcDkDMmSbkybKp75x1hX
	03tpU7CNE4mftuD3AkIPO9rBrF7S2r+dLboaGVajBp94ku45FqVQchewaBD74+F2jbtPJj1aIX7
	AIcYKSLH8ii4gLpnXYdpoTmiGtS2hAWy0tGjJHFzrNowrqUeHoyQ2fsDde+wBbR//Ic53FWnEIh
	rUBoi2uBitI+/gHf8tWFAz4XjQ4rMbBkGISa5clkS/1mUJwRQ27e6r0dFafRvmdYThDPhrteica
	J4RHFxvAzOI4sNWTu60yipoTv6NzxhJyXls0wXCAvSB6wsy1vjaCZBmyeh9Krfju7/QEBThg9mZ
	nwlxZjivu2wETEWlxwzatzJploX/gGuBRnbvZeUKI79iG66gdaX7O11DB67OiHqe9d7/wUdUdIw
	zJSVBE1n06e+IKLFyGTZ8qa1nw7Kg2WPJSAOZ1/uX2ySHLbENXgL/TWb9GE=
X-Received: by 2002:a05:6a21:3408:b0:3dd:7a92:77ab with SMTP id adf61e73a8af0-3de0e6f1097mr1787107637.12.1790238640149;
        Thu, 24 Sep 2026 01:30:40 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f40839csm2232878a12.30.2026.09.24.01.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:30:39 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH] MAINTAINERS: name the kvmarm/kvmarm next branch
Date: Thu, 24 Sep 2026 16:30:36 +0800
Message-ID: <20260924083036.1744194-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <877bkb3zjq.wl-maz@kernel.org>
References: <20260924033536.3624334-1-matthias.goergens@gmail.com> <877bkb3zjq.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_013041_933602_CA2A09FD 
X-CRM114-Status: GOOD (  13.97  )
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

On Thu, 24 Sep 2026 07:59:21 +0100, Marc Zyngier wrote:
> But that's not reflecting the way we deal with this tree. No actual
> development happens on that branch, as it is solely for integration.
> [...]
> Again, this is not how we work. We explicitly discourage patches
> against -next. The only sane reference to base kvmarm patches on is a
> published upstream tag from Linus' tree.

Thanks for taking the time to explain; I'll drop this one and try to
leave out other integration-only trees.  The rest will say only which
branch linux-next merges, not that patches should be based on it.

It does leave a question I'd like your view on.  submitting-patches.rst
tells contributors to find the tree to base their work on through the
T: entry, and for KVM/arm64 that leads to a HEAD from 2020, while the
rule you describe isn't written down anywhere MAINTAINERS points to
(the entry has no P: profile).  Would it help if the MAINTAINERS header
said that T: names where a subsystem's tree lives, and that the base
for patches can differ and belongs in the P: profile?  I'm preparing
patches documenting T: anyway, so I could fold that in.

Thanks,
Matthias

