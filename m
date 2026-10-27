Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7404606AA0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 15:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wbQd+51v;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q4hKSU5p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ka16RtxltIRx5Rtry+ZSPQw2tbg0Um/nvv7x+nHVP3o=; b=wbQd+51vi29Hz4Nlzmf6gox1Gh
	6Lr6UfgLMJPCeaIVEakiRaVvgeRtnZDzJ9mpBHJq1Jo2p83lOWSLb39WmPYFOT19mcTpkLaieHpxP
	HeF0Owxb+ejCwvPx1DBofShggcRexbPPPXsOoawc4j2zX/LoxVEiXAeAlFd6jQGXuUZy47dQPWE+Z
	frLpx+j+8K8O9vEqbiTkyxL35ZSk7bapVoPhZRjWCAM6usnM+/YYi9kTnOwMjvT66wi+DEuioMuPj
	Mj6iygL3CPA98N1nCmgsZEmqm9ebCyDB8VsmaWKhd6XSssq1Ocad8gIcL4Xm2Wetdzfapex55mWAE
	rc9WBhPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjFu-00000005DjQ-1LLK;
	Tue, 27 Oct 2026 15:38:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjEd-00000005Bs5-2gLT;
	Tue, 27 Oct 2026 15:37:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 63A5A4401C;
	Tue, 27 Oct 2026 15:37:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793115431;
	b=IivH1YwwnWKnpSu+QOkHTIF0gEoniE2CEsW+XzRdDOXQtfOPVPrgxTOL8TbgLkSEfTSC
	 3nDX0Sk9aSyVtkIp8Y17DLERB/pkxF7mKfeVVljerBNfS69vFzvIIJZwrsJYAmRbAQUu6
	 Gy64yjGzzpcOVFlCUpzXJB3WDzBHus5q0dxVrIqvmAlQyxyOiiMdT9U6vKFwscEnXZDxF
	 gH9T3gn05NEk/c6Lkt/I7JR+YEaVLpgxzGW21D67RcANuc1GSgMaLN6B66YYvbG/cEKZ2
	 VvrcSNgpE186Lyavs20hW65xtNuR/HiWfnTua883JksASNFXVN3xA334zFUyeXJoLAg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793115431;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ka16RtxltIRx5Rtry+ZSPQw2tbg0Um/nvv7x+nHVP3o=;
	b=a+ZOHdpwEE9wr6kxP1A+Qiuf/qnMZsZaS4mltsJDXmnRjV8UMo3/0l/F0FK9yMcfb9nR
	 u78HqOK7abl7Ctb9U8nxh4Or2FJZsGpWsqYVbZY6oZIFmkB5rXRiBF/Vpq87G6hH43hHc
	 k1tP4nbwD5KXTi44hI6A1QaHuPy+hPIaD7CnMrCobLu0UdmDxw4uRz440P0VzKQGg+NiI
	 rqqgMhtmmNlX0/UdZJUBa4hwxhx+sfDeKd0MHKbbsKAGg+qFl9fXpK/a1QAT9wu6Xj8Ok
	 2TKJmVcGzm0rYQQR1Qj06JK8FYl11jNxx9nClvkciquQmod+Nlq9TxyFBDhCtRPaJAw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D929E1F01403;
	Tue, 27 Oct 2026 15:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793115431;
	bh=ka16RtxltIRx5Rtry+ZSPQw2tbg0Um/nvv7x+nHVP3o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Q4hKSU5psxvu4j8Ft5i6LxP2TwHJxAhscCmL09slZuxuNve5zpGrusAt3cflSWLir
	 pW7RExAI+N15JgLKbWM6090qaBul2WjlSzBnnf6yZ8u8/KSbdCb3m26lW8l4t1XitS
	 WrJ+3A25VjUnF9/7pCs98A41yRj+S6TcjR7PTtg4dONgPKCHIrcPmrr8ISg7lll+yd
	 BuSOjYNbGXr+jhvX3CEVMCNSsHWZcBCGzrq0dUYqvYuGSilIWBUgMzevGMNWH2IkeR
	 Pj5xTA6FMLBbL+9GUQX3guaD8mOBNAKoVX24y7S2z7c4gYrtZQidsLzdzlnralJyq1
	 DeFI5SJwBqxjw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E4DC44517F;
	Tue, 27 Oct 2026 15:37:01 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Tue, 27 Oct 2026 23:37:09 +0800
Subject: [PATCH RFC 18/18] MAINTAINERS: add Zhihe A210
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261027-a210-scmi-v1-18-74d58ce85bd8@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793115418; l=1092;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=9GPu+epF9k6rbtMyhWOkYOw3QLfgzPBWR9Pa4XSugC0=;
 b=twemv20JvRO3q7e0BGCA9T65+jEJVu6g0Ry4ZA2BPrly/26TlC1+5GJSO/aU+teCnFSSRuYNe
 KVuP8gy4gpHDuomclAAmrVgddoUnIbZ7elGvQwZxfnMUtuYvBhL3sS3
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

Add Zhiguo Zhu and Han Gao as A210 maintainers.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 782389bd5cd3..c6cdd9bb0864 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30115,6 +30115,20 @@ L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	arch/x86/kernel/cpu/zhaoxin.c
 
+ZHIHE A210 SOC SUPPORT
+M:	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
+M:	Han Gao <gaohan@iscas.ac.cn>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mailbox/zhihe,a210-ap-mailbox.yaml
+F:	Documentation/devicetree/bindings/pinctrl/zhihe,a210-pinctrl.yaml
+F:	Documentation/devicetree/bindings/riscv/zhihe.yaml
+F:	arch/riscv/boot/dts/zhihe/
+F:	drivers/mailbox/mailbox-a210.c
+F:	drivers/pinctrl/pinctrl-a210.c
+F:	include/dt-bindings/clock/zhihe,a210-scmi.h
+F:	include/dt-bindings/reset/zhihe,a210-scmi.h
+
 ZONED BLOCK DEVICE (BLOCK LAYER)
 M:	Damien Le Moal <dlemoal@kernel.org>
 L:	linux-block@vger.kernel.org

-- 
2.55.0



