Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B06606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 22:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4WQXosOT;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=J37+YtqQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ki2tW3P/WLw9hD2gIz/rvc9LDBcAyijfa3p7DBWWlo8=; b=4WQXosOTw+xuJi
	0lbKOR5BOHWF9uUkaeL0i0q1SSNH1RPqTzRobGviTorepGKpz2AdT9rgQEZgCKQC5Q/kimFquSSe3
	HbjgeNWHiVLDoYAjr2iqSMNaowiCa7Q+upI7v/jy+2mg9+vI84D6jrfmeoBDAg+un+k4gI2h8D8V5
	OBqP2pgdq7Jf0sOQaeu2QUfvX2+zbIRGHIBl+5uz6xh+mOGK0uIrUBNnP8pWBM4luVfzDDwWQH3ns
	wyDJsThn4nmJZZOsjurkokFZtzwYjyoJ7xMI3b7jcckP7Bg9J50tf4M2QErOOdVLQh4L3rcTgAbnO
	aTzr87I6NfAbcpyj88kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdsD-0000000F5BI-1aDz;
	Sun, 01 Nov 2026 22:17:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdro-0000000F0Xu-1hm6;
	Sun, 01 Nov 2026 22:17:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ki2tW3P/WLw9hD2gIz/rvc9LDBcAyijfa3p7DBWWlo8=; b=J37+YtqQ/0d40Z4gCY5hvQOk8e
	oOMbRz5pmBf5TnhA1Bh85mB6/DJVLMfn8SuicpDqMpeDDl1ANaqTniuGKAIieI8I4LCYheCLlps1b
	qj1Qeo6mzg6K4WLOMMaf8hbQgkdLAqXzHZINj0bLIDBGhExq3+AIuKudZilMCsqVZ5shYWqm8m80r
	SkH9NeDnSRidUXcJ5QYmfK7jM8CFp1Okihhkk6eryhnrmDUF8DABgHVoWQyjaMnu/ynZvDn3F2aDp
	9XAKBpp5QvHBXX47G9hg89M9n64tHxnm8obpLjZn7IR6r3L/p8rvJ0NxXFf+VIPtg6QIjtX8jmHno
	Nrz0Qi+A==;
From: Heiko Stuebner <heiko@sntech.de>
To: Stephen Boyd <sboyd@kernel.org>,
	Yibo Tan <lhfff@tju.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] clk: rockchip: Unregister notifier on multi-PLL registration failure
Date: Sun,  1 Nov 2026 23:16:33 +0100
Message-ID: <179357139337.4108484.9561069147699443537.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919163106.1833104-1-lhfff@tju.edu.cn>
References: <20260919163106.1833104-1-lhfff@tju.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_141732_483678_A6632343 
X-CRM114-Status: GOOD (  10.07  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Sun, 20 Sep 2026 00:31:06 +0800, Yibo Tan wrote:
> rockchip_clk_register_cpuclk_multi_pll() registers an embedded notifier
> block before duplicating the rate table. If that allocation fails, the
> error path frees the notifier owner and unregisters the watched composite
> clock without removing the notifier.
> 
> The common clock framework retains both pointers in its global notifier
> state. A later rate change walks that state in __clk_notify() and reads the
> freed watched struct clk before it can compare the clock core. The notifier
> chain also retains the notifier block embedded in the freed cpuclk.
> 
> [...]

Applied, thanks!

[1/1] clk: rockchip: Unregister notifier on multi-PLL registration failure
      commit: acee45f349c701d29e2753227b813cd692fd8bda

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

