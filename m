Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D03E77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 14:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MCDsTtrRcGELOG9sKHeryzP5B0DQFbLGyo/mki1UYKs=; b=CW9auyxRaJdHmfohY6hmjr68oc
	qIMPmeA1bjYAcTp5/upd7XviwMRmlvK/3q3uR14QZezkdoGdlHa1Gh7oF4KuGaBteGYJN4vvhukWI
	Kj5ExXdUYR07dnYeWngTv2gU32YeCHFBgW5A1qmWMpvY1CeoFtcxaVijA7A74QbSl9zeaG71r4DLd
	w+gfGCGo7iDW3L7OcgYnbRcC5bbomrLHGSQ0HhULadvOkXE8vS8IBHPfnr1Y/opeF+8NmN6AjgWy5
	ftPZb6uzFmA3ApCaph8Efk/BVwkZ3ny4mZQdSPRPCRBII4ghGJpiqpM5lPF/Ruo1R+GGLdmIh9L0A
	nQtBdyfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYio-0000000Dn1W-05NW;
	Tue, 17 Dec 2024 14:38:50 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNYbs-0000000DlJQ-0yUW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 14:31:41 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso8973880a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 06:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734445898; x=1735050698; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MCDsTtrRcGELOG9sKHeryzP5B0DQFbLGyo/mki1UYKs=;
        b=hH2DqYKizeHDKPGUr41U44kiVEUYwmmd7V440ps3h16FWSOka1Hx20iHBLwGKsi0X1
         pqcicBf8RI3RUsKifSU/3Z/3AE3pvnfdD+NZ1qnGFj5YBx1sW2ExZyyXSJoOCxeNTLYc
         DEJgYvsDu4i6MfkGeEpsxx8dq5zgnbwDwqdx84mGrG7Kv6JmerpM2ncUoTUm4iyeCr0H
         WduFxiK/hFu7CBspfFIQt5OHGco5d+Kgdk7adTDN5V0RGEfASkFL2/1626v7SI5oqKjR
         WNBjnpCTdJ7k/msQvz8gGgXVS5yBfQ77+901JbQVUfRUIy11Y+Wy0HLkfi+zwbPepmJj
         jSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734445898; x=1735050698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCDsTtrRcGELOG9sKHeryzP5B0DQFbLGyo/mki1UYKs=;
        b=V1Zj/Njc+QIjenVQNxpLIsmGOAqGkoZfUVo3lfHtFXKkG1arpGwBnyFD/mA1tAZ5A1
         538xhhZSutdhO3mEUgzqgasr1F2h2Xwa2/RnLCXskRbCK7l25q4gjpfuoUX65NTGp65u
         5/7xST+U5o+dEy9dtZ8WV3UgJYcIMekriaW6C7+vQd1w7ofoIT3YwICwCrGyVhkh9AvW
         iFyebHkx5rUnA+wIt8Nj4ftU3eJWX9orVpqVQ8J3IOE+oOeuoGdRElM/Xca/F15665Zq
         aoZjagzhXZkV2mYwf/sARwyZLlMWPZvqhhNMAW/WAeZFti9TlHUoV+kAW/tJUSTmzPaL
         oeaA==
X-Forwarded-Encrypted: i=1; AJvYcCW+tXLNYPkpKsXejgdojIZXpvtbT/o1gXYiI0qqJau3Ru5lmPBF0k57uf/C9wwO53mRToBRL1qCMTFSqKt3H0PI@lists.infradead.org
X-Gm-Message-State: AOJu0YyRTmdXXtPK3KBXUeHDps8Qx2e2r4kUlEE0DB1N1uFecXD1HJp+
	518cOIguI7Jnu0AXVXKq/rICj2eSA/qK62iNoRvvehovm3ed/0WJKvTT0vqwpA==
X-Gm-Gg: ASbGncsUAUktfFQS8VooW4pVNcdLBbFMced8KwGiyglSkC5oI+6AnkTapXM2pE7Rf+7
	RIUsu8VCER+X/bkx3xrBLTGOCk1pObCRpBv1VMzbEu+cK08Zpf/viQ6OpFC4pyLRqILwd1YEFax
	S4SiC0YXtutKpFMZ18lDie9EPbxRCnP1/L+B61XgVwofVWaHIY9Q9DO26X0uM+Se9z8Vd3twg6f
	zRxJ5JfTYr1c+CG0WcOE95b/UKgV7ApRtcheD3xFna6KaoDwY2Yzo99EH26BoS8zlCbKZ8gYdnu
	n1zb6Q9v8UY9TdA=
X-Google-Smtp-Source: AGHT+IHVex9Gn4i1ejnUteG2TKmCzHX4xTSH5m8KzVP1ilACtngEv4xPjgW00hut0PjQct6YRA2HvA==
X-Received: by 2002:a05:6402:2708:b0:5d0:b51c:8489 with SMTP id 4fb4d7f45d1cf-5d63c3067d6mr13054348a12.12.1734445898291;
        Tue, 17 Dec 2024 06:31:38 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ad187dsm4505071a12.28.2024.12.17.06.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 06:31:37 -0800 (PST)
Date: Tue, 17 Dec 2024 14:31:35 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 18/18] KVM: arm64: Plumb the pKVM MMU in KVM
Message-ID: <Z2GLR8KZzJn1YpUu@google.com>
References: <20241216175803.2716565-1-qperret@google.com>
 <20241216175803.2716565-19-qperret@google.com>
 <86ttb2qudi.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ttb2qudi.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_063140_266913_00D554C3 
X-CRM114-Status: GOOD (  11.03  )
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

On Tuesday 17 Dec 2024 at 14:03:37 (+0000), Marc Zyngier wrote:
> My gripe with this is that it makes it much harder to follow what is
> happening by using tags (ctags, etags, whatever). I ended up with the
> hack below, which is super ugly, but preserves the tagging
> functionality for non-pKVM.

Ack.

> I'll scratch my head to find something more elegant...

I find your proposal pretty reasonable -- I had a few different ideas
but they were all really over-engineered, so I figured relying on a
naming convention was the simplest. And any divergence will be flagged
at compile time, so that shouldn't be too hard to maintain looking
forward.

The __S2 name isn't massively descriptive though. Maybe KVM_PGT_CALL()
or something? Thinking about it, this abstraction doesn't need to be
restricted to stage-2 stuff. We could most likely hide the
__pkvm_host_{un}share_hyp() logic behind a pkvm_pgtable_hyp_{un}map()
implementation in pkvm.c as well...

