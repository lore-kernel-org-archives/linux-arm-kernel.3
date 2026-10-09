Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E487CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 06:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qkbJzcmqDeieYoXJhEk/nB3qFlnGDMJI9zS6yIH7Up8=; b=yNLh/kkRqqf+zcMi9RbXDoqadY
	Aq1lexNULVGt8L/vHyylU52aQPZ0PLzHOQokNOhcIZuuHaHfb3o1cp0mO058uKfQqIjPJxUNe+mmU
	VLQzlmETu316CO0s9RKfiyFQswn8QK0OJd3He9N2KC0SvMiSZD+3j/5E4g29jjN4IW0u4kiOSAQLN
	LqneKSlDAJCZapZScnYroo+kuNz8nHSN5LgDNP0j2Ppp+hXDRg+LldR10LY3g4dQ9Nvpet+7cGueE
	ubFso/UPqiaSnHq0ADahtc9O/AET+sJfjpt7sX+zrk661BaKSNVdy3/CqijR+aSmmZf7sZSMKlL9V
	vw8GBkKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4N6-00000005eUt-3YyS;
	Fri, 09 Oct 2026 06:46:24 +0000
Received: from out-130.mta1.migadu.com ([2001:41d0:203:375::82] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4N3-00000005eUK-3EJ8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 06:46:23 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=qkbJzcmqDeieYoXJhEk/nB3qFlnGDMJI9zS6yIH7Up8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791528379; v=1; x=1792133179;
 b=V8IEyIS3s+YgzOthG5qGJA6R57YE8pq9XYBJuOeb+2UPEL8Tefsb8Q0Lqr/WEdpFbmbEam7y
 vNXDKoc6R1Fpt3UtIy0wG5rTrR1zQuKuHJBKwO+AVEH7AiyZK1/ObTDjTvXeDm/i9yLnVGQU/Av
 V21qhwwi/qFlWgBGWF4iGPKo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 6fbe6f8163d577e3;
	Fri, 09 Oct 2026 06:46:19 +0000
X-Mizu-Trace-ID: 6fbe6f8163d577e3
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bcc04c71f5so5101e87.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 23:46:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwt83ucnEHRF5GAPPij4UfTPa+4TGbAwb71LrftBsFmiBb/Hl12jG4N0Dl0gHn+U6k5Wos/7j+3pmM6efZg6the@lists.infradead.org
X-Gm-Message-State: AFq9FYJMyLwyR8QRLO41BTDfhkt4CTVLesWfqm0kkaEbOdUuEiqQyH/0
	Er+QCjM7LWsacc1c/ji/lNYK7k2shWEFBpyDBqACBXuVRjT93f/SkJEcUYmmUjmbmIRriBZw2tG
	oKPM2lCPZsPNNgrByCJXbD7u3+q204xUgXrVq2M7H
X-Received: by 2002:a05:6512:6d3:b0:5bc:44d4:ab49 with SMTP id
 2adb3069b0e04-5bcdf93c5d4mr38548e87.13.1791528378033; Thu, 08 Oct 2026
 23:46:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260929093548.3598547-1-maz@kernel.org> <CA+EHjTybnn2jgVKxCO0WXdGXWJ-=2p4k98CHfh3CrhJopvPDFQ@mail.gmail.com>
 <asf87i2RDh-WksL-@kernel.org>
In-Reply-To: <asf87i2RDh-WksL-@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 9 Oct 2026 07:45:41 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwbhhFipHyi5kL3j6oPxqEO4mVP3BCrtg18iWaFFGiNfw@mail.gmail.com>
X-Gm-Features: AclHuK_nku16xs9azzExlIZ7VItoqo2nur27jo7qgAEiOQl6n1JVILRZZg7lbSQ
Message-ID: <CA+EHjTwbhhFipHyi5kL3j6oPxqEO4mVP3BCrtg18iWaFFGiNfw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] KVM: arm64: vgic-v3: Make LPI disabling robust
 (and more)
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Steffen Eiden <seiden@linux.ibm.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Yuchao Zhang <ndaugoing@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_234621_951437_9B88A96F 
X-CRM114-Status: UNSURE (   8.06  )
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

Hi Oliver,

[...]
> We could have vgic_target_oracle() return NULL if LPIs are disabled at the redistributor, then the rest of the AP list machinery will "just work" for injections that slip between the cracks.

That would also cover a related one Sashiko raised:
vgic_its_resolve_lpi() can cache a translation after
vgic_its_invalidate_all_caches() has run, since the disable path
doesn't take its_lock, but any MSI that hits that entry would then be
dropped by the oracle. I'll write it up and send a patch on top of
Marc's series.

Cheers,
/fuad

