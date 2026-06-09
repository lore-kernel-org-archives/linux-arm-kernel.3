Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5665CD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 22:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nDo3xoZZjuOK7GBHTzPJXELFIQpIIEL0agVkYHucgPY=; b=X0sV8f8Gcv6KQY2s+l4gXvewbh
	BMH8NlHkh0DWy21jYVNHw3nVrWVjeLPCqMJhYvDmbsPrF34G4xtpwSvbTBlKuSTEg6Y0hOKjjpPwr
	e4ak0+6oWh9RITsf4lQ46nOMn7xHsy7Ll3TPq/mRz5RS2wP18R4kyN8Ojf9WC0/390cbuy7+0OW2E
	Ji1KTNDGPhpMz+tFZl3Oxmpkb19grYpumJmVsV4teNDVn0Wi0hDDqLf3pc4IrJKxwGTa2L017JRvC
	/WUASxEwx3kQtIJ70GhJjIGsga4v3teIUBCDmNH3qTln0mapOgRuqm+j8UhimdR5eKkK5Ds3XqKgr
	/wu0CLOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4tb-00000006S4S-2U3x;
	Tue, 09 Jun 2026 22:26:07 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX4tT-00000006S1E-27Ei
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 22:26:01 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84231305a80so3301016b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781043958; x=1781648758; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDo3xoZZjuOK7GBHTzPJXELFIQpIIEL0agVkYHucgPY=;
        b=DvSbJZzUFpPMAmAE3x+9hw5e81Cl7rNG1OpmQFU+wE2L5+KR5X4QkQgTWSZ+haN163
         KHijCneuGNLdUFJIwcoXFavtV+GJmKbE1jNp0wZaolXOvRkIhqCjxZYQag/6Zk9R7KOV
         w2Y6SMFva8m4MHKz4IfyadOLHKm/hZNHt5585cY6PI3DOQBK1dqBLuFlxbKJTKVTclxq
         tCYEzZ9vpCJdIZ+/fvduDl4NQjNxyfH0BHkOJwf+2doXb9E0rtQI03n49WM7pd65KFG7
         H50rUp6B+bXrn+XH79dWIm4cKdWsFWIv4MD5J06n6BksyF29BvbHDKfDD7RxpkWE3J5y
         BAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781043958; x=1781648758;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nDo3xoZZjuOK7GBHTzPJXELFIQpIIEL0agVkYHucgPY=;
        b=T4g0S/SnCRWNB9P+Dh0mWiRY43a34tPeCCT9MgPlHvLc2Mt+CLr0SBFDiE0T7OGufk
         gfSK84mxdGF2XXOcVJMNBe99FXvHWPRnihCjYbEtK1DhaM0ItzuuGJOOI0FCYGKcgNU7
         Xh4W1762u59DB+IBqGiifXtZLREGTSYiXwVAw6WOBFYKwqXpSeI0DkDK2LaUx471AOln
         I5GU4NWujuFnjT9boaEUmICODOx60Z5I4u/Z4r22sF3RSUImFXVswN1VEGqpQpp4SMTp
         xfYxkn2wtE27zElVR5MDvWkeKEXASSSQt+yyIdkxh0k0pQE8mMCE+rGP3WEENWo4LNYs
         XzGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4famMVh6T+WHQtIG2ufp+rFhoCshwWJ/6/nyGMzNZMrmlmf2o/D12vpXCxGHdomQpV8niCkP+i6A9/oYhOdAM@lists.infradead.org
X-Gm-Message-State: AOJu0YwGSnnIvhRc/Jiu+YN6+ZUiNHNGXshN6ObcWuY5hlbX6kTD4zzo
	nJepPSlj8/iCOYMYStN806s0hD/G2qV76UqvFvxvXvhX6Ci93itwaMMoURWcIK5nWQ4=
X-Gm-Gg: Acq92OHXgJRJDclRDiT7BACJVSV3onpgsnSO79QIihK94PvUi2P1B4knpLsDHL7t6Px
	GxvrbvD1Gn5n5xbpyOMcfCycJhtCYx6Qc9QGWUli76GDnI5mXiNoX0lDakPNJ04X4iUSg6ef3Jw
	z/VdIwt5ym6JKN+a5yQkTvkTpc7Cev18SDvDY+eESettwvIYR0ufqkS4TZFYrAdgKaeE7tWVf7w
	A1nbZfiGZCzXrlnaVJ+UjQdf4ncatmYIypcS4wripO8RRSRSpSJJnvcvWSutvs+0yJN/J6WlHv6
	7c3g0CJo/Z+zpilcNDY2rlRHcqDXrYEc+vsgjas0Ry4/Zldurt4Y37LkHRZO+ZwdLDgPrVL+vZ8
	UzpkFyinsaupGculxhg/onNQEDJpVLzLu+FfmxLBYRjfwvEwtkvrMHFU4srudBceCqxgxqGAaIi
	Edt9YSXl2WYKEw7ivgNMJ1B6768fqrzcc=
X-Received: by 2002:a05:6a00:a201:b0:842:6482:aeb with SMTP id d2e1a72fcca58-842b0e4c633mr23052675b3a.12.1781043958612;
        Tue, 09 Jun 2026 15:25:58 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-84282882156sm21772573b3a.33.2026.06.09.15.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 15:25:58 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
 Yuho Choi <dbgh9129@gmail.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260504164711.2854116-1-dbgh9129@gmail.com>
References: <20260504164711.2854116-1-dbgh9129@gmail.com>
Subject: Re: [PATCH v1] ARM: OMAP2+: Fix OF node reference leaks in
 omap_hwmod
Message-Id: <178104395773.234140.5232479365136373455.b4-ty@b4>
Date: Tue, 09 Jun 2026 15:25:57 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_152559_547525_C439ABAE 
X-CRM114-Status: UNSURE (   9.08  )
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


On Mon, 04 May 2026 12:47:11 -0400, Yuho Choi wrote:
> The OF helpers that return device nodes acquire references that must be
> released by the caller.
> 
> _init() leaks the "ocp" bus node returned by of_find_node_by_name() on
> all paths after lookup, and also leaks the child returned by
> of_get_next_child() when parsing module flags. Route the post-lookup
> returns through a common cleanup path and release the child after use.
> 
> [...]

Applied, thanks!

[1/1] ARM: OMAP2+: Fix OF node reference leaks in omap_hwmod
      commit: f7ab9e7070b8dd77d6f8f7bd1162b7190af8694d

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


