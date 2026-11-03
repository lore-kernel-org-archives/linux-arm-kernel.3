Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA1E606A80A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=luugELcv;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=0zvSXBic
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PnqVtJFbpVdgN32kQBhDM0J5gyS/rozEwm1HbKCbgZ4=; b=luugELcvuksMypgELo8Hr/mnwo
	L6Wm2/+YZ5ykJGwKHp4a4gMhVa+srr3uPBt7Pt4d2JbYuGiBrjMjjCZGZnAZrBysKOyYcK7Or55fD
	Y3W3GXKZm5VaaKbtPcvIPi+8OwS5VjfPBxIshoGF/CMbrUKWNy3TOKWpvYb1AyfH7lYmNvr74z3Ko
	ee7EbiM9PVE7oeey93Be+KHbvQ/ktH8Sm+9GOco6v0tvZ7n2R5AxWfLcsQoI/RBOCXtDNMYhEzQDW
	I8JDCLmcI7xcKvUxXgqjnOxWk2UZM+oiFvPk1fGl4TAe9bT6z+wszXOdPlW8edtvYUx4W+LZwqWWt
	kGcITKRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC7W-000000025VT-1ihV;
	Tue, 03 Nov 2026 10:52:02 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOC7N-000000025SE-0f3h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:51:59 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 17A091F9E7;
	Tue,  3 Nov 2026 11:51:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1793703106;
	bh=PnqVtJFbpVdgN32kQBhDM0J5gyS/rozEwm1HbKCbgZ4=; h=From:To:Subject;
	b=0zvSXBicnV/xXIsl1GJLQh3SSvecf17cecdQ44SHpz1ff+NGnNtixCryFfCmZZnI3
	 +JCl/509PQptfrsZF57nWDc1hzx5QaaYr58nSW9SvY/o9IvCAf1nv6WVU2Gxhfqy0F
	 BcYEH0LzvBo/I9UN+tecfzAJ4Znp+bcGaTA9PHyeRDbyh83p9qaaSi3gIqfdjejqsw
	 Z61dHUtYm1hVkWFDs12qH2TnKn74O7QarqFrGmrUuClosC7zsttwq4HLShk19Mw9ne
	 8ycsXr6mJm9+tCWlq2X9+HCLA9TodPTCdp8f0EpCFyHenK8+xevf4EssEU5T8eCtoo
	 hm/l91pivF6Zg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] arm64: dts: ti: k3-am69-aquila: Keep DP_PWR always enabled
Date: Tue,  3 Nov 2026 11:51:34 +0100
Message-ID: <20261103105137.2393416-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_025154_237080_BB0C4092 
X-CRM114-Status: UNSURE (   7.08  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Francesco Dolcini <francesco.dolcini@toradex.com>

DP_PWR on the DisplayPort connector powers active DP cables and
adapters, which do not work without it. Keep it always enabled, and mark
it boot-on so that the firmware, e.g. U-Boot, enables it at boot,
whether or not a display driver is available.

Francesco Dolcini (2):
  arm64: dts: ti: k3-am69-aquila-dev: Keep DP_PWR always enabled
  arm64: dts: ti: k3-am69-aquila-clover: Keep DP_PWR always enabled

 arch/arm64/boot/dts/ti/k3-am69-aquila-clover.dts | 2 ++
 arch/arm64/boot/dts/ti/k3-am69-aquila-dev.dts    | 2 ++
 2 files changed, 4 insertions(+)

-- 
2.47.3


