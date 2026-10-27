Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8FC606D926
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 15:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1FXi13Kw;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MAb5k3Ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1GwL5y6pZZCkHBo5MnJZ2tlozrS8EqxeZLmokyx75kw=; b=1FXi13Kw90gDUbA9RRlEU5bYUF
	TK3f49Ro+CqTOIWRWrDkbgIFgSy5DLQAzwR5teUKHLNXFxdBE2FbY4/6qL9mDiFJEEEx3jGviSmw2
	KWtuMa/nr98W4vl1RCi8SzOmU3pU6gNzfDmYTMAYwcS8fzEzQPMasGJhGOaKA2vGV9GtUg7q2w+p2
	uhR/co1h654eC+/x0aSaPBFtwa8D68Of7C/QK4IioPLyQn8IDw51DHNI41P4uqn1sr0S26LO+lBqS
	Q22uIfhQoOQ+JXIV5174T4XszhuOouoXsXBIfONuOe3pZeqU8IdWi2nO/rXxY5wi7xeHMGBq0odcs
	LDfx2e7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjFI-00000005Cp1-1ToC;
	Tue, 27 Oct 2026 15:37:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLjEZ-00000005Bne-0LhR;
	Tue, 27 Oct 2026 15:37:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB36E43DB7;
	Tue, 27 Oct 2026 15:37:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793115426;
	b=BBS2tIqSjmyIwBRuWHQE1cYWGqLEl0Osu8WVFoSWs2dqeGt2g+ZUJplZ8Woof/61wfio
	 oAcg1fNt9XRL3zMopt8/Qel72VIXlIeuubW8Lp3Qt1i9Gqbk+xe5clpAFkIcrEoWNPxj2
	 dxKvPYr0Aukm0UO4TPIwbcsxppls06mcEIbPbDrlUT0VysA0yyyMjAmB7LBbyHNQIXzD+
	 jwWY+xN+XZGjfznbQ+t8jklZ7DBh0jZ3MOnddhUmRxJtahyCb9jys5QoDN6j91c77KS8V
	 HHB7ouSZge513NBBqVgyJkzj19vKRFI5TboK62Yt4RXof3ei1vsagwRnchmQdUV3asg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793115426;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1GwL5y6pZZCkHBo5MnJZ2tlozrS8EqxeZLmokyx75kw=;
	b=v47VXK/JoV39HLkcBfYcbD1yo/yZu3dsjxNgirQfOYr7DFp7CM4J0e86WA5nHb+y50C7
	 WVnOmevhtqPb1yLICC6I+B/pUAl4fQrXjVSFozgGILWnLRpywlt+/n6jjn5+zMIMp2fMK
	 Oe8FzTOn3V5ei/HHyeIWr1KqZLhx+imNTVhiC3jgwGcNmUJTiyf7xOUhA0cgCChbzjwhQ
	 O/MJ+j0tEGFSfLKvPtvgT6Yho1pOGAMyiDTut6CD4WdEfmZMtZs9Px7E9HnJDSsVnCbcs
	 MfE0NIBq3iEOFmv6jtXHQ6/3TLmDL6JRAbS5Oiu6tIkxwseAq1K91gTU/gpg63vkX6g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 956DB1F031ED;
	Tue, 27 Oct 2026 15:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793115426;
	bh=1GwL5y6pZZCkHBo5MnJZ2tlozrS8EqxeZLmokyx75kw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MAb5k3Ch0mWJuqij+yi+hLQ2rH5Ot/ZU/Dc4wQ7onulmYa3Q/4L+5XXSfIRwbW5s7
	 eyW2+AD7hGgi/GiKLgK5va0umqPA+oCxUCcZaGfscqe7RKAHeT/wLTQYSccZq8cWQ0
	 l05XEzHV8Lhqfx6b31ApRD/EoLbEAIe+eMPf57jJTMDGaPB/T6qTwa/pPsnpwZNLXQ
	 HoNp9e44xdiDpQHmMGJREhdNb7uNmMYVBpA1+Th6QYEsUxliOsrFYjlEYcFWjcIWCX
	 BbtNDyIoDC3kEJ6Ptv55KPgheY5P8tpMgUv6xTlbBiR95ZIfBcKz0fw+GtGurmJ+aL
	 4npNhP9ubVrhg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A2A5545167;
	Tue, 27 Oct 2026 15:37:01 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Tue, 27 Oct 2026 23:37:03 +0800
Subject: [PATCH RFC 12/18] dt-bindings: serial: snps-dw-apb-uart: add Zhihe
 A210 UART
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261027-a210-scmi-v1-12-74d58ce85bd8@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793115418; l=1210;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=SLTCxGfOMWDsBEnctOnjAIrPrBSK3SM6xa1q6aUn5UQ=;
 b=pHSCXWZq/KwHKORkAXodw+iJClxqRIbBMs4NSU6eLbiOA6IWjOz2JXifAacM+YD2NVyP+LfG6
 r0YjR2TJ5tzCjUlkx5FeJU+LBxZKuR+RBQ8Oy1baIjFKDdqcetSGHa2
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

The Zhihe A210 UARTs have separate APB and serial clock domain resets.
Add an SoC-specific compatible that, like the StarFive JH7110 one,
allows both resets.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 664305de4986..907f8dab2c4f 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -29,7 +29,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: starfive,jh7110-uart
+            enum:
+              - starfive,jh7110-uart
+              - zhihe,a210-uart
     then:
       properties:
         resets:
@@ -81,6 +83,7 @@ properties:
               - starfive,jh7100-uart
               - starfive,jh7110-uart
               - ultrarisc,dp1000-uart
+              - zhihe,a210-uart
           - const: snps,dw-apb-uart
       - const: snps,dw-apb-uart
 

-- 
2.55.0



