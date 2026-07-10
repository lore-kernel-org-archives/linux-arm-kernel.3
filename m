Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38855C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 11:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMApwtVfAiHTe4uNdsg1pmRa4ajqzJGEhdVZ2CWz9x4=; b=Tuwj6ONf7ZGdNNnMg9AnTfGRvr
	Br1fOiyidEql7OPDzntuQDHJ7GxwffP54WpB/5tuR72e6zH2mZvKgEdnRbia+49desDTXM8cICkG2
	MkFCxrY8GDMwxGN+kDiARoNEPBcn8jNFsCDSXueztwDGs7Os9ljkRGRUD/qj/9DeqBOCZRzmZwzT3
	tnzrONp4AKgSpFq2PGxGFkrn/pCxKzEX6KE7HoqBig6HaSWMnXLVwIcze4Y6oHmxlLhMKKj3vuyhu
	lEfhTjOBAcSOTEcYDa+ij/uYkaGJ3xlwRDPu8ZDLuM5itauEzqpJD2BTcr7kKJ466ywX8aByG6CY6
	Mn4YtpVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9CT-00000004nKd-1f1D;
	Fri, 10 Jul 2026 11:15:21 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi9CQ-00000004nJt-1OMF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 11:15:19 +0000
Received: by mail-pj2-x04.google.com with SMTP id 98e67ed59e1d1-381191ea2adso510422a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 04:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783682118; x=1784286918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMApwtVfAiHTe4uNdsg1pmRa4ajqzJGEhdVZ2CWz9x4=;
        b=OYjT4OqjVBKpIhppeaWhhtzUr+gs6OVdgb7EhOjaqKkGEAiVViSVvmNl5guc10WDE2
         8Wxk6kVv47e15VRztp+219CSJHuWz3Q/8ejTEEkwkEw5X8nBDkcNptka9Tr9Wv6CTcin
         deCnLVi4N3ioy+MtZZyqYp/QVxKksI/bP3oD8aPSmAM1mqxzg0TaW1PFPJI0pK5qi37/
         pgJWhjLZN554DDbKQjsL18z1cpaMaCDezPKw0zD3N9zdRFab+pf2V6rmypcUzMo63yR3
         NP42EEiQBL8RGN1yiisHOYo7LcuhwefnYngTcqn47cAn07o+id/dA9HKD6lzCFBFhnwr
         6thg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783682118; x=1784286918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMApwtVfAiHTe4uNdsg1pmRa4ajqzJGEhdVZ2CWz9x4=;
        b=D3L+92nxY91goASddwDzOTrgnTARbyTVFX+QBj75ngxHwi+ScwM03JHvF7VP9n/XtU
         VacO7HKpbCqE7o6qhFPUB/tRTkSCnzazwO4FOXTY7ycVJuL9UPIDL2NyixYYc4BBryR+
         QR3SkzHbOYk8t3WOtadYOd/t1lzACOHu42411GOdtrGeuMRbW1YEegotUWBawmBiyx8C
         O/9ip/nWrv2lN681Qerw+v6JRCfSI0IBy35RhkyfWyLP3/Km412MAVAle7C+FVuVuFk7
         NaP82jMNTKIutANx9DHNg9V+o9tnNBPkpyRkDZUnirkpAhqkUTVqsEi1iJnkfHKmzeuK
         Ephw==
X-Forwarded-Encrypted: i=1; AHgh+RrB/sXJB1rs8CCmTJHZJnuE2ISaqsyJSUuECwoTXqDEmTWZ2ktojYbBhOoCsLC7bqokoJH6Jedb4u3/zpHdsntk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2MDa/pkyU2QqSQdTslL3Vt99i4lU0uI+6iU9ZDHGw1PgPcNU+
	2D1FOi7IVa2fLqto1sIsgbcAYu/xVLX5QB4/CZ+n0uNE4GwdmhXzhF8j
X-Gm-Gg: AfdE7cnbFo4Nf5FWLhMGqyWpiAneMy6u/5LRPB4YHaiWLjke0gbHzgu2MhsQpVSeCR9
	wpsROT72YfZ0hlyD230/C+jsit1WAU9Fv4UYfxVQHNxWKf0EnpIcNhQwd8ykFUiXiv3SmLO1VeX
	VDumpalhcbZ44k+dFPAvyh2UOWP1qT154K3ZGey8bkqnFazs1xkQtR50P1nrWFyNwOUj15AZecz
	BWfdj7r3r/6fiPQUj3kIqJIATuhAHUJ5+DSYG9d/FEPP4R5k5f6dX/0jeBhDXW/nOFbg2mkJtuq
	jVElw0qSAChqzLiKntxDcTlmODt9UizW2ZngEmW1pUOUwuOP2zVhN+oP3Hvq2ih/EJfBj50fzn5
	TO43USJ5fqellCFpdnhDWmsvJ0RJwiPhgdLHlNDrUooYQQuSVi9UZiccKP68tyJh3EdUvfgXJbZ
	2subjLrX7I/oHTloy6fFFQZRJNtpU+xdm15MgBbTsprrnrNqFn5pDQijBPRVlhP7WA+YAdW88=
X-Received: by 2002:a17:90b:37cc:b0:387:e0cb:7f5 with SMTP id 98e67ed59e1d1-3894298482bmr11227568a91.41.1783682117496;
        Fri, 10 Jul 2026 04:15:17 -0700 (PDT)
Received: from ubuntu-gnu-linux-24-04-3.hub ([2407:7000:af23:3e00:eb86:437c:263f:195f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5622ae99sm2576177a91.14.2026.07.10.04.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 04:15:16 -0700 (PDT)
From: Jiaxing Hu <huhuvmb88@gmail.com>
To: Will Deacon <will@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Joerg Roedel <joro@8bytes.org>,
	Robin Murphy <robin.murphy@arm.com>,
	iommu@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/rockchip: implement .flush_iotlb_all
Date: Fri, 10 Jul 2026 23:15:08 +1200
Message-ID: <20260710111508.917486-1-huhuvmb88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710060513.863714-1-huhuvmb88@gmail.com>
References: <20260710060513.863714-1-huhuvmb88@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_041518_369646_2519F536 
X-CRM114-Status: GOOD (  14.14  )
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

On Fri, 10 Jul 2026, Will Deacon wrote:
> So I think this is the wrong direction. We should try harder to remove
> the function rather than add new implementations of it. I'm assuming
> you're only adding it for some out-of-tree code that calls it?

Yes, that's right. The only caller is the out-of-tree RK3576 NPU
(accel/rocket) bring-up I mentioned in the commit message. There's no
in-tree rk_iommu user, since the in-tree consumers all invalidate through
.unmap and none of them call iommu_flush_iotlb_all().

So if the plan is to remove the function rather than add new
implementations of it, then I've got this backwards. Please drop the
patch. If the NPU driver ever goes upstream I'll make it stop relying on
iommu_flush_iotlb_all() rather than bring this one back.

Thanks for taking a look, and for the pointers to those two commits.

Jiaxing

