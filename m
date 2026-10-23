Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E53B606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 00:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=31HDF9Cy;
	dkim=pass (2048-bit key, unprotected) header.d=rojer.me header.i=@rojer.me header.a=rsa-sha256 header.s=main header.b=Ygem0n2Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=39uwv70l9BfZuduXmg0NFg2rcRknzlpybRRvMivwSBM=; b=31HDF9Cyrnr2BlojWN3VR2koGY
	HJdHHCoKvIGtSNvrKYgel1Z80wvNd4u4pjhmfDGKLCQH/rfBVXcnc0qdOV/6RR7JVo0QYpWhJiOaq
	fULzQG/juOMZX8BG2qXuRpRo0M8ik6qbNXUbgSwNeNLgdeVrmIxeHWC++EeZ4dT0T0MaYyzuS1jM+
	iHHOizyHInKTydcSknTdwLFhPE3MDfT3tUMiMqwOCYudP17KdaZXRqzs6/J+bW+MIci7iNdfT8XgE
	c9R707iCQmqEBNg/ibKE7YGgQX7Z06ZTMt3eiD+VYmyU5JIFl4CzQOO34Snvi8fuZwgXY6ZutgYFT
	2MhVbQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPBB-0000000HDe4-3zoE;
	Sat, 24 Oct 2026 00:00:09 +0000
Received: from mail1.rojer.cloud ([2a01:4f8:192:336a::3])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKPB8-0000000HDcS-3JqS;
	Sat, 24 Oct 2026 00:00:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rojer.me; s=main;
	t=1792800001; bh=24i8uxMQ2lh0kY2DiQrLdhGZMhzYI8Atrmzz+mGcMaE=;
	h=From:To:Cc:Subject:Date:From;
	b=Ygem0n2ZzMUqld40o2ZRlrLB7/ZKZNS8DBgC4pbajoUFPxZY08qxQPZTbwFj7LNGg
	 1dIk7PBfJ6S6gu0CuB/1aPgE1akWCUkd+igdQm09JEtDVbrYRI5SlV6aLUjplkDV0t
	 wxFwAvDhQJHZ4Qjh6HIGMLl8lgL3XlLdUvDIZVhr7wbHuiCNDBMsPSgNBMxIK6bkWt
	 B6EkFkxeVofYrrcVR6ECasu/c9SWzRcsXoLAsPqgo/GRh3FD7EOa7TsJb+iVjNb84P
	 7U6J3ZWdBW7fOQ+OIBltSFfBME1cAEDWI972nLzHB2quwV2BCgk5Zb8FpCObDEGFD5
	 HGvsttA1Fgfiw==
Received: from nbf.lan (212-5-142-134.ip.btc-net.bg [212.5.142.134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail1.rojer.cloud (Postfix) with ESMTPSA id D2623126B27;
	Sat, 24 Oct 2026 00:00:00 +0000 (UTC)
From: Deomid rojer Ryabkov <rojer@rojer.me>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sergey Bostandzhyan <jin@mediatomb.cc>,
	Jensen Huang <jensenhuang@friendlyarm.com>,
	Deomid rojer Ryabkov <rojer@rojer.me>
Subject: [PATCH 0/2] arm64: dts: rockchip: NanoPi R2S Plus: fix io-domains, enable SDIO Wi-Fi
Date: Sat, 24 Oct 2026 02:59:57 +0300
Message-ID: <20261023235959.2988087-1-rojer@rojer.me>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_170007_106406_C335EAB4 
X-CRM114-Status: UNSURE (   7.57  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Patch 1 fixes the VCCIO4/VCCIO6 supplies of the NanoPi R2S Plus, which
were inherited from the NanoPi R2S but are wired differently (see the
schematics referenced in the patch).

Patch 2 enables the M.2 E-key SDIO slot, which FriendlyElec populates
with an optional RTL8822CS (Fn-Link 6222B-SRC) Wi-Fi module.

With these the module works at 50 MHz high-speed. Reaching SDR104 needs
an mmc core fix for the module's CMD11 handling, posted to linux-mmc:
https://lore.kernel.org/linux-mmc/20261023232813.2983368-1-rojer@rojer.me/

Tested on a NanoPi R2S Plus; dtbs_check reports no new warnings.

Deomid rojer Ryabkov (2):
  arm64: dts: rockchip: Fix VCCIO4/VCCIO6 supplies on NanoPi R2S Plus
  arm64: dts: rockchip: Enable SDIO Wi-Fi on NanoPi R2S Plus

 .../dts/rockchip/rk3328-nanopi-r2s-plus.dts   | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

-- 
2.53.0


