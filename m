Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26694CA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 18:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3K3ao78imzaTxL1NmkWMqiHtKHUZXLazwgVZl9X2sac=; b=I7J5x1SWAk8YE7IqU2ZGkF2DUV
	MBRCOXnsgfId1PHRQlrjhr9CxeBVURjHUo7H4XwEyAHHQFnDO/oXaTs9/TEGdgGb8NimZF4CX5A8D
	DbPwWBzCSYxyE9dWYavN+2EzLUQG72giVbcOMn5pKrOqSsopvH70BY5CkHS3EbpfFrxnTOo1MlI6y
	i49Mo193slY558B0H7YyDsYimnLhuW4fBm8CZIpjCgGHafMzMX/uH681FEXX2SW4nWZBoiou4ULUc
	59qlEkcQZ32cba4uUGxVSgefa4aMybj4amAUnLzMPYF5beGji6yISd/AXeK9IjvNH3OgrXVwtLUTj
	MhWQlIxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFLr-00000006yVX-0QH4;
	Fri, 09 Oct 2026 18:29:51 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFLk-00000006yMr-49r6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 18:29:50 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48afbd2c386so51533f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 11:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791570583; x=1792175383; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3K3ao78imzaTxL1NmkWMqiHtKHUZXLazwgVZl9X2sac=;
        b=HoN1QM04D0ubDwwrlDN9rKNiGh+1CKu96iY04ELZXncVhDZJK7fcMgIo4TXXvqUfcd
         OCatYX43TtFL2o8MyPdKXZQcf6i6g1KWIXqbxZBZOX8Vretgt7fpw27VQMNV8J8mmxqt
         aF2HpK6MhIgljYWGPejVAIda9ujuTToOkAb0GfVGEDQj3DAH01pAkqj7XKwSzQl8d3a2
         xbLRHhmyUZaT1RT7YfQY5IIK8u4L0uWOAM6kMGK50HM0JOlXhbhafdNHcsCtcj2ajUQc
         Vg7sOC3b6kM7LQiwu/veNlXde2R9FpZ19WTxn4Ty39wkAR4SHUIN7VOADPC7Y7KbLsZb
         7p1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570583; x=1792175383;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3K3ao78imzaTxL1NmkWMqiHtKHUZXLazwgVZl9X2sac=;
        b=tU9ssPT92CZq9ou2JFjXw6x3J82P63ppyi59VHIXLlHoBMRmNTnrTmv9CA+COk5HqH
         XZASnjWcj/ah8ydMLRzOFwmFp68PSs5woG5JTgRQGctPGpkxWsYubOSBk1QvsGcERRcv
         HU/P9vl3jzoCCzBRcENah2GW1XsHsnCHWtMT0c+uFRUUemcnVucghHIX6blOUQ/j9YG4
         W0kJ5t1uz76Pb48hldrFdpw6WLxxua4SWkNiHJkv1CTg6sbmfL3/bzwrE4Npt3TP1B9j
         FjkPOKPnNX+S/JqPWATJwPA2o6clikCscNutl8E6hsK1jQGnuxKfiseN1YbyZ/97MpaL
         INgA==
X-Forwarded-Encrypted: i=1; AKwUvBx7114soq6+dOxQRVXOPBWNjcmx4mStPfTjhscl1U5vVyfQ5HnYatmXbBg3uJ+Azdo2M9JNkOehaokX6Wn2pwg0@lists.infradead.org
X-Gm-Message-State: AFq9FYK/74xY8JmvTicR5KQf9k9RDp6vcGVLVw+bR9j6wBDnOpavkqPA
	qck3sZVlMGMJIYByHqgcZ7qYFBOQbOj9rwgd07R+lI58eyI7Z8t6Mq5IhUTfsiweUI8=
X-Gm-Gg: AYBFou3TWIiS2hK5rZ0To41Y4qR0rlql1zxQxc6Af93f9ksph+dSKJ5Sy9t1D8q0SMQ
	MtBCjTEqXMWKCGmVsUVO9+RcVDz2PA0jUJx/xyhBqifENc21uvAmOYhzGcYGuob5dZ2y8JBWMnJ
	ZEj59H/ZgPfySVAjbhcGKIyXP0juqyE6zQBMC2Bu1fMQL83NMO2Yo4gTuLIBWXiPD72+o0yuQAG
	zPDsJRUgzftOyHsAGaXyEMT+heXC/XEFHrkBdaK/lQR8KNPYWW8/vWQl3JD/T6BkwvJYfrwCA92
	Es5ulzGddKK4yT+zlVB5/exE1Ext9youfS2FQcs5S0S52AXq0qqO7uiImcym4VAPUfFelUOmSxe
	TLXbMgLRUnOc4Wpan9R/+qCLD25+4A1EWhdjV1QEOrpVuVD1zsqtuaWy8IH9Iryhzjf9yLI9fOy
	zA2C2q0mlJOs2OTxBO1Zf+/L6hEDxdaIGe0w3Vrxm5zt/NjUKOGvq3UWOqZ1ML3EGUyf9Bw08wk
	6RtXvHYS+7T2Rl3KQ==
X-Received: by 2002:a05:6000:184e:b0:488:8904:cf19 with SMTP id ffacd0b85a97d-48dbaceb60cmr6202771f8f.10.1791570583358;
        Fri, 09 Oct 2026 11:29:43 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac025esm5100156f8f.38.2026.10.09.11.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:42 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v15 00/11] clk / reset: realtek: Add RTD1625 clock and
 reset support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: jbrunet+clk@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 bmasney+clk@redhat.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
 james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com
In-Reply-To: <20261002074331.3066919-1-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
Date: Fri, 09 Oct 2026 20:29:35 +0200
Message-Id: <179157057523.266328.2566485767894163325.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=735; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=8HTt3f1kHzEcHqPdoIhUIJF/xyu/LEyQE65kAFS6OjM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknjaa+4K9V8u6b/PntowMt814KcwjOWLFsVd7WeS7Vd
 5JfHvsW1VHKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJeMxk+Kdit0ivKsB0Hq//
 hGXK773kWRh5mwJXzK5OOMuVcjRSbgXDfycJszeN584z66no9p2bq3tOv0CZ+e22l0/O9k//vGt
 3ITMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_112945_096310_C19E2DFA 
X-CRM114-Status: GOOD (  11.40  )
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

> Hello,
> 
> This patch series adds the clock and reset controller support for Realtek's
> RTD1625 SoC platform.
> 
> Because the reset controllers share the same register space with the
> clock controllers on this platform, we utilize the Auxiliary Bus framework
> to decouple them. The clock controllers act as the primary devices,
> registering the reset controllers as auxiliary devices.

Considering those are properly decoupled, there is no reason to send them
together anymore. You could send the reset part to reset, and just clock
part to clock.

Sending a series that address a single tree helps because then we can merge it
using your cover-letter as merge commit, instead of cherry-picking.

-- 
Jerome


