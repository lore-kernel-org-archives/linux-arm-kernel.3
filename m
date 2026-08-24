Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697E9C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 09:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0oE7bRBEKrds8LRc7kKAKPBdAOrOs9h0iRGg0/2yeYk=; b=LK/1Hd4mdI0tNnPgr/vuxdyfpo
	T4vB4DRVh7hrVS189Tu2m5oLrtjuY+vPQ7xvFE7G5sTr/sGGAbKaT/ugY56rQC6JSMDS9cSE0Et1D
	Zd4Mt1213q34lNziE01N86c9J33V2zEhHG8cUwEzIcDEhy+VXY2cqbzr57+pUajcE0UHanmKLBaoh
	xykydWnGOeW6CTh8TVf87UjTzYH1jQx9KWWiwUIC7gfxvJtxaRDkGRsTQkFkVlGjIhCIE/ITrEkB2
	tEYoQE6FW3XnaBmmNdxpBdCMzKDP2O6ZEhetEhlhx+AQEiZZFv5uqp9Zf+dEvIaAoDxVPeROmb6OY
	aR+K0JUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQcW-0000000GGnn-0CRB;
	Mon, 24 Aug 2026 09:05:32 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQcK-0000000GGaj-1M0h
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 09:05:22 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6a1f8757b4eso12371a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 02:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787562317; x=1788167117; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0oE7bRBEKrds8LRc7kKAKPBdAOrOs9h0iRGg0/2yeYk=;
        b=SCe3Yqds9Y5RrAteEktiXdf1U927dQXs2BS04qV2jUFj6TuwbDA77UQ++WbqD2wA9I
         H1O+mcKEfDaN6dlFWD8NdKKQjcY4EXVr/qoFNEkuLLO38PVbIQB1YmEsCIxYQKqdXNLd
         0el5uWAzTgBfJIAI49vb6JcaSLaB2kjWMLfqZnyEq9PGwo/mi+ymJ3vN2NGBuW3cDrhj
         QF1i5NSvFU9tRJe09Y+oAkRm9Q/tdCzFxgCHhyeMycIg4dAaTDYbXvDpGrqlGJ5qzfdb
         8DnPWGYzrkVyHOlXrzVI6+AS/bp6FJAGd/vQzZseY3XcYOcpAHccw6poDTq1q60Wr4E/
         q6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562317; x=1788167117;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oE7bRBEKrds8LRc7kKAKPBdAOrOs9h0iRGg0/2yeYk=;
        b=AkTwOr+5U4xVbpd0OCuUjL8bBvuK6c+t8wJ1zPf94ZlbXZQehoyoCs+DIAjwhyKmSb
         ywkmLq2bx6wu76Zev3CQRMlnSR9bhOpEmuhihhoBI8eviJHoH+0U3/npEqpW3sZWmofk
         pYQEm2V1Iv0vRBPfM03V2wi4cEW92A40XCTdzYp+r/E/oSo2/GtQM5mvf7xMSz3f30OV
         U6pGD9ppuM/TCvu9rtaE0V2gOIhPfamPD9b2fjrRjKmz0hk5SGK1yRHkkCBuT+7/GLdP
         Zu4hkaaCG5IY77DyWOTCgVNFVNDAcHEaE261SpAhW8M8CXDmi3G5hPKTPF0kWi9lFyVM
         hBhg==
X-Forwarded-Encrypted: i=1; AHgh+RoY1VtorxTWdp8hqTmnwfC7J/IbX5M0OTd6zeFibvABmEDLpr/ac40asLr4NbeF7QNcTLyX9UGGmbzQrA61Pvou@lists.infradead.org
X-Gm-Message-State: AFuF++nGrm3dWIAx0NoED6MvJot//MlG800jc+C6XetmcO6BI4pjVoJ7
	9kIeyzBMSWtsp5bodfMfG4nP4XxyMk5DDcI+crar91xUYvS504jHu+povWvgGmQVUDnCaxgA9sK
	mYbAzhw==
X-Gm-Gg: AR+sD12wr1TerxpRQFPar5uCKW4saj0K/y6EFflIATU83l6glzOOhsPevqccRPFrZAM
	C2tqXZ/gJUJpgXarfPAJ1uA8/5xBEQiPJ81t2bDvHA9KK9M5MyjgvIskAazqjmnBcuYlDNiz6J9
	jr2Ac11cpWR1SToiA4zGRbCtccTVMSAQl5ITvBcYtTx9WWcD4BOzFZjtwZQctxCJtu0WWlI5C0n
	P73AW+f78FRzP6z7pLL1erEDioW2OJQZXc3sNo8NWrY/gwQIS7hLjrfcJLIeDxpN7NPfoeiii8r
	RVRwZHrnSMO+AL7QGDs4G09GFoZkqBKHbz/+ON6PbXcKwZotwEjkNaU7UMhQZynXzNbkOIr1aW4
	hEpAJNGAb5NGH8E/Oqg6j9uO9EDyQxZhJKzfLS6FSSMOcYlHf2yxab6LIPenixCCHe+K1kKJwDo
	vTNs6PMp0IxBI4ZrMcYnYn74HudikUgWdQin55gCjPUaOaYJ3cNe5GkN0oRn/buUCEJ6M5CmUUs
	5HF8kC5aLZAI/G7o2gWt2vPAbUCvDsH
X-Received: by 2002:a05:6402:a50d:20b0:672:117e:55d4 with SMTP id 4fb4d7f45d1cf-6a582669e18mr65014a12.0.1787562316885;
        Mon, 24 Aug 2026 02:05:16 -0700 (PDT)
Received: from google.com (63.235.189.35.bc.googleusercontent.com. [35.189.235.63])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496738e8bsm1063366966b.44.2026.08.24.02.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 02:05:16 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:05:12 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Mankyum Kim <mankyum.kim@samsung.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Will Deacon <will@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Andrew Walbran <qwandor@google.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: Re: [PATCH] KVM: arm64: Allow smaller FF-A RX/TX buffers
Message-ID: <aowJSDF7SpEHD7FW@google.com>
References: <aocAODVhayfmy26M@google.com>
 <20260820-master-v1-1-ea602b6d3860@samsung.com>
 <CGME20260820132522epcas2p329199ce99df0337540735564d881116a@epcms2p8>
 <20260824005345epcms2p8db2a7aad5598b624129873d1a1abf8ff@epcms2p8>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824005345epcms2p8db2a7aad5598b624129873d1a1abf8ff@epcms2p8>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_020520_463068_ABB2E917 
X-CRM114-Status: GOOD (  21.26  )
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

>On Mon, Aug 24, 2026 at 09:53:45AM +0900, Mankyum Kim wrote:

Hello,

>Hi Sebastian,
>
>
>
>Thanks for the feedback. I took another look at the SPMC capability
>reporting and found an important detail that I missed in v1.
>
>
>
>With FF-A, the SPMC in this configuration advertises both the minimum
>and maximum RX/TX buffer sizes as 4K. `hyp_ffa_post_init()` currently
>only considers the minimum size and ignores the maximum.
>
(making it readable as the reply was sent in html format)

The max size discovery has been added from FF-A 1.2. Old SPMCs with <
1.2 will not have it.

>
>
>I agree that the host-facing FFA_FEATURES should report pKVM's RX/TX
>requirement, as you suggested. That would keep the host/pKVM mapping at
>the host page granularity and also avoid the partial-page sharing issue
>Marc pointed out.
>
>
>
>However, with a 16K host/pKVM, the host would then request:
>
>
>
>```
>
>FFA_RXTX_MAP(..., page-count=4)
>
>```
>
>
>
>and the current `ffa_map_hyp_buffers(npages)` would forward the same
>page count to the SPMC. This SPMC advertises a maximum RX/TX buffer size
>of 4K, so the 16K mapping is rejected.
>

Right, I see what you mean. In this case we would have to :

- keep track in a variable for the size of the hyp mailbox buffer
  (pkvm_ffa_bufsz) let's say

- make hyp_ffa_post_init aware of the max RX/TX discovered size if we
  are running with FF-A >= 1.2

  if max_rxtx_sz < PAGE_SIZE * KVM_FFA_MBOX_NR_PAGES:
  	pkvm_ffa_bufsz = max_rxtx_sz;

- if we are running with FF-A < 1.2:
	pkvm_ffa_bufsz = min_rxtx_sz

- update the code for the host-facing FFA_FEATURES to report
  pkvm_ffa_bufsz when queried from host and make sure we use that
  instead of the paths that use KVM_FFA_MBOX_NR_PAGES

>
>
>It therefore looks like supporting this configuration would require
>separating the host-facing RX/TX size from the SPMC-facing RX/TX size. I
>also noticed that several paths currently use `KVM_FFA_MBOX_NR_PAGES *
>PAGE_SIZE` as the capacity of the hyp buffers, so simply mapping the hyp
>buffers with a page count of one doesn't seem sufficient.
>
>
>
>I'll drop the approach taken in v1.
>
>
>
>Does this match your understanding? In particular, do you think your
>configurable mailbox work could be extended to support different
>host-facing and SPMC-facing RX/TX sizes, or would you handle that
>separately?
>
>
>
>Thanks,
>
>Mankyum

Thanks,
Sebastian

