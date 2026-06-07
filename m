Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA47CD8C90
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 21:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tdMeoOld4FcgA8FppLQz+Ntxpynqqdfhs7oz1KaTiq4=; b=HhytIsafu2M5vOgQITirH9PqqO
	IqzFWjS09wzf8QZLTNt7QM26lw97yWkS+i6/gNqigKQFBA0Eji8lJIFdrsD+AMN/HD8mWtbhDqzRa
	+joDEkEaGSyJZwLr959siOGSncauBEpxJ2eElTdg99NQLPQMuocI3dr9sJw5sdgfFWZDlr+nRklEw
	S4YljAujaWH+PJ1JR6ofKVVVgZV1b2RrTvuG8Ao9LVNzIPmvNsaLGnhgBYjZ80KZNpTZ1+Zp7pdXl
	sOVqFk6KE89LjAL2TyjKwtXdGCGEkQo2Zcqj+4aVBmmcMqTLqLlHJaXqzSOH/h6YnBYaECwHs9ojm
	fYFj0GaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWLV9-00000002Xs4-0Evz;
	Sun, 07 Jun 2026 21:57:51 +0000
Received: from out13-173.antispamcloud.com ([185.201.17.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWLV7-00000002Xre-0SRr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 21:57:50 +0000
Received: from s1041.use1.mysecurecloudhost.com ([192.250.231.249])
	by mx207.antispamcloud.com with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <dan@reactivated.net>)
	id 1wWLUo-007FOl-QO; Sun, 07 Jun 2026 23:57:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reactivated.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tdMeoOld4FcgA8FppLQz+Ntxpynqqdfhs7oz1KaTiq4=; b=0qp+GHP0eA9XT3azcraOimorzL
	WIBUZUwgyiosJW/rCM74G0Arze8Kw3E+L300TcPwsOPjZ2UwfS8dNAMczdb96wzTbGmLWh9UUJFj/
	s5YbS/Lkj1DnhJjcOc1wZwbZjBQI1XeoaE/CpRHGgOGaSTXgHlabeD1rUGRRqR5A5vfROydFiIKGz
	rumvDg/bjMWZO3zy5pgOGi8rwCm8oqamC5njPiOuikplMxjv8srdCbEQ0+c0+grlkgnU8O96RBR7m
	obQQjJzZDZ+7D+cEV4MiCshzQBMRK32zwk7NfqZSZQP1oA1oExQumEyIx8eLICfJJgndFfnWwZw6w
	EyQu0q4Q==;
Received: from [188.251.249.2] (port=34882 helo=numbers)
	by s1041.use1.mysecurecloudhost.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <dan@reactivated.net>)
	id 1wWLUj-00000001qw4-173O;
	Sun, 07 Jun 2026 21:57:25 +0000
From: Daniel Drake <dan@reactivated.net>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Daniel Drake <dan@reactivated.net>
Subject: [PATCH] gpiolib: handle gpio-hogs only once
Date: Sun,  7 Jun 2026 22:56:47 +0100
Message-ID: <20260607215647.112488-1-dan@reactivated.net>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Get-Message-Sender-Via: s1041.use1.mysecurecloudhost.com: authenticated_id: dan@reactivated.net
X-Authenticated-Sender: s1041.use1.mysecurecloudhost.com: dan@reactivated.net
X-Originating-IP: 192.250.231.249
X-Spampanel-Domain: s1041.use1.mysecurecloudhost.com
X-Spampanel-Username: 192.250.231.249
Authentication-Results: antispamcloud.com; auth=pass smtp.auth=192.250.231.249@s1041.use1.mysecurecloudhost.com
X-Spampanel-Outgoing-Class: ham
X-Spampanel-Outgoing-Evidence: Combined (0.06)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuXsLW0z+VlcfY/wMv3CJzW0CkmwZvl1sHm1
 KmFO1CRnJCu2SmbhJN1U9FKs8X3+Nt06bFpPrNOlRAlE9AVLwR4uGVjKNnzF3nQoDoQtBifM84JL
 M0i5ZAms0EHrvcCaVIPSJ5FdNqHijoQ+Lk8NzN8YGnT3EFAinyrilm9zau/FuzkQt9Nb4Ml7QXdk
 EetczWAg1NJkF77+oGQ+lxJlCrsUeB7itP8hgjDRserKv4bhb5a9CD46iTOjXEpJEwP3fd9WBb39
 uS1TjWG2Inx+Ts2QrtVmombMJ4e2pn5C0yBMHZ0fE47nEjvubMSTLAkKCKclZzoe+TZdeH39wA4E
 grA4pE2PuLHIFQdBY9qb1rRWgyz0f29FZkQs6Ir87R/YNAvW7iH+6DoE8NeDBUxImZIxHxsBXq5d
 3sVlH8/8/BVjaCxdqoPv0tTPBZ82RqaKH6ZJMkXL9fD6+WIpcQ2t8oQM/WEMAHr5BYwqeYfWeqTu
 1YC/tOVjI4dWyTvfTQXGjT+aEfC5mTBtCltny75g3MKubALAOajlmHbHzeutXs2uHosTaX/E9TB8
 42c3huE/T1c93SsS4aMXJmiJ2G0eb5ahq2kqyMRk6DLUUjpi54Q90umYmC9jerRVX9sTO+FXU2n4
 L0nk+TooPV1h2BXu3/c8Dfd/7JO6UaIAUVkvSizih0TzynhIhk347ucixeDFxznIHYi/jghIJpVk
 vIZQze0Bc4OP9WjPZ/cr5H8qZypgvgrWxILsnce/vzk7Sg5HsMU105o7Arb8LdgQkbIszV2rqXUJ
 pkwwvtJ3eaqr64J65gYh+EkDZ7F844A3amCNzUUxeOUmb7f2sSZgwwfArL3kN4znUXS+aQ2Zqid5
 ZhuDgwCeIZyBg7HvH2nIa17LbgjKuFO+2mEj3Ei2hTvWconvzZPs/pnfZDHCBKz5ZsfM43T5M7YL
 w6LVwB8ESiQZrfYccBIk1Sag4dKiqCrF8eZZNLgqwwzqzRhdGeE82QeHCPMhVWUJ6Lbki9dM28Lo
 JGcCCe5x6ntEzvieEb+fqTMfTu3UcMCRWk93tDX2xq0IRHaigWR4GmnmvyoQF7RljOE5Dy0kIn1S
 +xE6dEa4ITSORxoHJPO7jtECLiprxnxXDQkNiSsY2JE82yoZXENc5iBe5UBNo8b5j5EtxVNpEcGW
 Tu3UcMCRWk93tDX2xq0IRHaigWR4GmnmvyoQF7RljOF2PyW5cLuSbbpC1c/2zTYs
X-Report-Abuse-To: spam@quarantine16.antispamcloud.com
X-Complaints-To: abuse@master.antispamcloud.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_145749_159990_9A9E7DDF 
X-CRM114-Status: GOOD (  16.41  )
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

Commit d1d564ec49929 ("gpio: move hogs into GPIO core") introduced a
behaviour change that breaks boot on Raspberry Pi 5 when using the
firmware-supplied device tree:

  gpiochip_add_data_with_key: GPIOs 544..575
    (/soc@107c000000/gpio@7d517c00) failed to register, -22
  brcmstb-gpio 107d517c00.gpio: Could not add gpiochip for bank 1
  brcmstb-gpio 107d517c00.gpio: probe with driver brcmstb-gpio failed
    with error -22

gpio-brcmstb registers two gpio_chips against the device tree
node gpio@7d517c00, one for each bank. The firmware-supplied DT includes
a gpio-hog on RP1 RUN, and this gpio-hog is attempted to be applied to
*both* gpio_chips. This succeeds against bank 0 (which hosts the GPIO)
and fails for bank 1 (which does not).

In the previous implementation, failures to apply gpio-hogs were
quietly ignored. In the new code, the error code propagates and causes
probe to fail.

Closely approximate the previous behaviour by ensuring that each
gpio-hog is processed only once. The handling of gpio-hogs on a DT node
with multiple gpio_chips remains a bit incomplete/unclear, but this at
least retains the ability to apply hogs to the first gpio_chip per node.

Signed-off-by: Daniel Drake <dan@reactivated.net>
---
 drivers/gpio/gpiolib.c | 5 +++++
 1 file changed, 5 insertions(+)

This bug is only exposed by the firmware-provided DT that has the
gpio-hog. The DT shipped in the mainline kernel does not have the hog
here. I'm not sure to what extent Linux cares about supporting the
RPi-downstream firmware DT.

I'm also happy to consider other approaches. This multi-gpiochip setup is
a bit weird and gpio-brcmstb could perhaps be converted to register only a
single gpio_chip covering all banks. I verified that the other drivers
that obviously follow this same multiple-gpiochip pattern
(pinctrl-amlogic-a4, pinctrl-st and pinctrl-stm32) do not seem to be used by
any board DTs that include gpio-hogs.

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1e6dce430dca..fc4dacee0a84 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1031,6 +1031,11 @@ static int gpiochip_hog_lines(struct gpio_chip *gc)
 		if (!fwnode_property_present(fwnode, "gpio-hog"))
 			continue;
 
+		/* The hog may have been handled by another gpio_chip on the same fwnode */
+		if (is_of_node(fwnode) &&
+		    of_node_check_flag(to_of_node(fwnode), OF_POPULATED))
+			continue;
+
 		ret = gpiochip_add_hog(gc, fwnode);
 		if (ret)
 			return ret;
-- 
2.54.0


