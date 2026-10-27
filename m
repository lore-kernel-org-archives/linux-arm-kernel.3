Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFB6606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 16:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IQuHa9Bq;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LJCqHpSs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/KGaSHBvvoWL+O7MCZ6oZvrEvuXG4eqoQUwd3V+4yyM=; b=IQuHa9BqncZlyuJaUIdprJly/d
	eElTe8s/0MLSd4fJY5spY7MUCwIzSERPx3gOoICs9k88UmUhUAqu2bQLDAXVetiaj71h+S0BOSSNV
	h3Hn3/zs+aXHrgV2vogU7tVSzKZFk+RhBf/v43fx5ffm0j5c4sHKV6EG+M+3Yw2/XTNBDHrLsnYt4
	vXD6rQFGImgnSpqLYVHibUa1z2IRaVVfNeHmgvJHm53qwefT2MqfBriibc32iTwY381z15PDbW06b
	76p/Dz6EK3pVNnuw028veB2BwfiGWVYFOu79vEsu077v3Jchus63H9s70xZcB2N7d+lFpHQ9GoX8j
	Q5rpikJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjEX-00000005BkW-0gRU;
	Tue, 27 Oct 2026 15:37:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjEV-00000005BjW-2NGh;
	Tue, 27 Oct 2026 15:37:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 391DC41867;
	Tue, 27 Oct 2026 15:37:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793115423;
	b=gH8mfoPn3xH9A8r7KsysK4G/1vkGBTB8XVJy+N3Xv3asFinAhXgijs6VNMojjJzEjd9L
	 0cHNcfmXDqiIwSYXhnZhEjtVBOcfrQR5rYFNvDuSEJ8+tcdiTUWgGcx033x60F17kKmSg
	 Gb5/LKqE7A0eSVmTPfl0T0m9Ra8XEZ6wUJfqQSBFx6HW7/7rtkunEvvqqzeBvPD3YDBhd
	 gu44xPVpifv5fRRACMa3Q+leoCKVJuPlwlbJBmdNWbTIX1ABu0UOgxHRnII6weq3IPOCR
	 dlZYCujFgjG8EnmjV12ocFCwhzrr9MPD13P2hwDa79mP/ugYcub696+0gbDvcPyifYw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793115423;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=/KGaSHBvvoWL+O7MCZ6oZvrEvuXG4eqoQUwd3V+4yyM=;
	b=M7TZbhgXivtmPzB83HT9gI0BxfsV0XeCMRIq9ptYZjcBGMdZ5g1TN497YtR/GwV+KC7x
	 WzEnCfGCAP/VHIHwDAHkq/oSdkHeUXXVuypMdGewTIDCJoUPQTXHloz1WkJZGfgKkAYDG
	 FxGVpgJFbu+QdY1gk/4qaaoBHi3+vjwN8ryrMGx50AC9RCp+iRSWME5GmUiSbClGJ8sbh
	 15BDUIPo6Fp53VP7MBU8KOoH+QqMnKAVg1VHEfHBhwgsZsH8rwGI7lLsXtG8evDYA3tox
	 loFlzjXdLDqUcemjRAG9h1IVP3uJHu4+0Sp9Suau558yBKEfUfYVuKRJVAc4WZa4zQg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4B791F031E5;
	Tue, 27 Oct 2026 15:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793115423;
	bh=/KGaSHBvvoWL+O7MCZ6oZvrEvuXG4eqoQUwd3V+4yyM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=LJCqHpSsnpOhGArAJQTiuSh2EZrC68VWzQM9h4CnC0wnl3dHwZ5NA2enhN6Z9Njqf
	 hHK3kPZaIn3nc9YhrmXpNtMJ1d43AFBJllgYPrwKcf1/BviaLO7UNNvYlWc+dRLclu
	 IKkEBXmeqtEgxLdxI/ZGTWlcCt4WYm7+lUjjEAPgmSY79siFjPhZN2Qc9xracONMqx
	 cwT6/pqAzZRMfxHpdtL7LVLB6BVu73D0zvkR+7iavkhMgcqX9nRHPNzeLT3ZCS8fzl
	 35paNMmzT3zM28pj49izIHAZpeDO4t8OTBNJriTxOHIIBxyY4uGRtxGgEyOX92ycY6
	 f6WeP0j2AhSrw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 25AD04512E;
	Tue, 27 Oct 2026 15:37:01 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Tue, 27 Oct 2026 23:36:52 +0800
Subject: [PATCH RFC 01/18] firmware: arm_scmi: Allow SCMI transports on
 RISC-V
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261027-a210-scmi-v1-1-74d58ce85bd8@iscas.ac.cn>
References: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
In-Reply-To: <20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Drew Fustini <fustini@kernel.org>, 
 Icenowy Zheng <uwu@icenowy.me>, Inochi Amaoto <inochiama@gmail.com>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, linux-clk@vger.kernel.org, 
 linux-serial@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793115418; l=1013;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=TVSlaTkcQWucNuQbo9clD2EYvUNJXp80mxvivBUzLmI=;
 b=XVlpQR8bfbMMFzGIxQobo08oDZ+aFzeIFawIuzSgfBEgu6kQPqeL3bnZJwtQ/pcZFfd7koJGL
 2y8kDDbLI/rAA1wM1EraHXBsLVhI55nKGexS5Wvdgb5NUB3SVppZ1Oj
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

Mailbox and shared-memory SCMI transports do not require ARM execution.
Allow RISC-V platforms to use the existing SCMI core and protocol drivers;
architecture-specific transports retain their own dependencies.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 drivers/firmware/arm_scmi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index 783c24a20e29..1cfe2b572d18 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm_scmi/Kconfig
@@ -3,7 +3,7 @@ menu "ARM System Control and Management Interface Protocol"
 
 config ARM_SCMI_PROTOCOL
 	tristate "ARM System Control and Management Interface (SCMI) Message Protocol"
-	depends on ARM || ARM64 || COMPILE_TEST
+	depends on ARM || ARM64 || RISCV || COMPILE_TEST
 	help
 	  ARM System Control and Management Interface (SCMI) protocol is a
 	  set of operating system-independent software interfaces that are

-- 
2.55.0



