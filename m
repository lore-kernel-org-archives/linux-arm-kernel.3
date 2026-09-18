Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EB5C982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 01:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R1Dphf3wJq4BrmquaAl7H8zsB9cDxJ+RW6Mq3uDSYmM=; b=Jg66f5DeEdtiK8nQ2LYo/7/QEK
	HIJN5LnOzRorS+CylHnJg9RJTeWcaAAX9K/tSrUVB91SDkzm8xBkb0dclia8Ijxo1k5OLTeJlle+n
	mCKY9cBZ6HBIuF6ivFoqMFZWT7kMvEp7UQMV876aBixyZJyavY1/bd9UzP9iCOjPj2rl8he+ezhWe
	bpaeGwWp/NfgxeUOZU19Ov9PvKuaDjTxGAuzoKQ+Tf4+Ix8IVOp6WLIWFnG3xYOt8XHKeY2zXvulH
	RBtkz1rxotvr60I9P6l8jQEid5OzvMa/o3IuAjeNJwIpvf/zgFY9y38qhAgJZIHQP2TjpzNe+Ksne
	Sclgbf/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NkO-0000000DDCs-2OrV;
	Fri, 18 Sep 2026 01:50:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NkH-0000000DD7e-36UC
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 18 Sep 2026 01:50:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=R1Dphf3wJq4BrmquaAl7H8zsB9cDxJ+RW6Mq3uDSYmM=; b=bDLAxDKUhmCks1lfInpJiJwgyy
	7s1nnXykfKLTp7169QHmz8piDcPuxLxhHFjRUh+l2O4VpFHK8gv6xXogn+0j0PjFJZmBnC32wt51b
	HRu9Y8lbPpAvHF3vMoKL7UPCgu6qOWv4P8Z+5YX5x5zB2SN+FCv9MsRocAz7jRUQK4yz5Nt3oJog0
	KmzsuUzMh4ybGqhKMhhcLlu1ObQvo3rLzQtaLnoGxD1jTKlXkj02UOTSaB4U8at4+Db+xoTKotLaM
	o5DneOPNHIEifY7UZRerG8gutqnxJJMV9sII1A/JLJXI+B6nfZs0ThVqolLsfcM6cHcy4RnxghWAq
	EWcr9TTg==;
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7NkD-00000009UqE-08sL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 01:50:32 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4834977ae75so69864f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 18:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789696227; x=1790301027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R1Dphf3wJq4BrmquaAl7H8zsB9cDxJ+RW6Mq3uDSYmM=;
        b=C/BUudhXbMElJtq8LJ1Hybqk8k+au9M0LRUIwsqftDKwk9a2nntmdPBW2ThMS/D1Vl
         DFQRAaVPKh3bXOesWN2O2I6GjCjR7+0Rgl9DlDoL6dMRpG2C+2/h/8nD5VskQuRsEDTY
         clfwy7XxhSMVdyz412LMy6f99ps04GWWQnRL4BJN/wG0Y2FZSCmUEUX/c0tkoqtldTiz
         1idVDRfte58GrA2hHm8d0rvLUalznncim3I5b+5uH6Gy4k0XTj6BIKOKylTqgzLTagQI
         5MzV2V39YWKuuzow791l0YKSN7ZuElWPAl2WxMwKPYmjB06U98JJIM89//R92V8yWjow
         RXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789696227; x=1790301027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R1Dphf3wJq4BrmquaAl7H8zsB9cDxJ+RW6Mq3uDSYmM=;
        b=vpS7uZf0rrPqRbe/4aBcsVr2W4qZeIOg8sMhFD0tLetVS77YOycKd2qBZsfbTUgv05
         QxaACLWTJzMFHvAVwwVvMmcaJUIXV0DBQixroebuUMjZJEMo+UpGyvytkDAD6TqKSjld
         q1SvQ+zbLTrfcKecyFPyNCMIElSin7oEV7u1QbvnG20srEHsEIh+tG05dAMY8W+eo2rp
         t8/j0tdxsCtK7tGN9XMM6OIyDhc+nCn9l3BgofNQgu2CU8psPlkJrE/aQnfcOF5SPQ/D
         kxhpXYx7XpOnRPZRwQbZ9+2cMn8XqprzAjNSI91k3DVKoV547T1Dcj82HscyZ7rVBobb
         8EKw==
X-Forwarded-Encrypted: i=1; AKwUvBwhU65BOR/d7WGo/oG8+lKMjOZD9sfnVwBHFWWCWb9+xnyC20IcjSDU7KqNOjTguGs2m4wx9u+naNBxFbdg1YuK@lists.infradead.org
X-Gm-Message-State: AFuF++ksKMp8Qv/RnraE3ELKyn2E8dl4URK1m/Hxhk8Ukmguyl1ayrXu
	Zv7FrDM3RgiLLdxBl3q00A45g4ksrFhUDEenPkJRtMnocXjCxyVB8T54usgZsHuLw2w=
X-Gm-Gg: AYBFou2yu8vaTEel+FJW19f8UGsWV1u0eC5qvja6GcabZo22oA7IiEB7Ws6+wyL/GRJ
	hcoOtLRmGbiZxWZWs9Vskdll95uwkJEQMUXWoCHyiUh/GDq5WV/eJKoPQvBI3V7O/loKAbvNt/W
	vCtEk7EubIr3GYG+s9y6YpatnE+kYlMtSI2yAK2DDEn7ZPNonj0/QX0bBS3TFbSEHo1dDNXnUoz
	jQ/ZMPJeIzdpQByWorBRynhfTLn9K6ovBfkjQIH1cFYHQMMz5zSn3qnodIi3nHBKvGkIN9HsUTT
	dV7gsPm7ZSYC4nN91/U0XILSQ3JeuoYx2lFRBATjtWkHPErK5QdbdC2mlmuRIIVDej56LNfQpMz
	ZX01X8VV2dXioJhDKm0E3I3ONAjxyZQroqxxfWCMgLI19PWccFU3KaMGiaaLV9XC10qHDiNXef2
	ltraZSnCHktDs6yRDVCLPyLigpIlE5Dgm0LTPgE07UDXEyw08haFypCvzwU219
X-Received: by 2002:a05:6000:4903:b0:486:f301:11df with SMTP id ffacd0b85a97d-4871e20cffbmr1925132f8f.6.1789696226372;
        Thu, 17 Sep 2026 18:50:26 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff57926sm70569f8f.14.2026.09.17.18.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:50:25 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	gerg@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net v2 0/2] net: dsa: mt7530: fix two crashes on driver unbind
Date: Fri, 18 Sep 2026 04:50:18 +0300
Message-ID: <20260918015020.2518315-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_025029_392516_0B09AB6D 
X-CRM114-Status: GOOD (  24.13  )
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

Unbinding the MT7530 driver from an MT7531 dereferences NULL in
regulator_disable(). On a Netcraze NC-1012 (MT7981B + MT7531, 6.18.44):

  # echo mdio-bus:1f > /sys/bus/mdio_bus/drivers/mt7530-mdio/unbind

oopses there, and the build it was found on sets CONFIG_PANIC_ON_OOPS, so
the board goes down with it. Fix that and the same command gets as far as
mt7530_remove_common(), which disposes interrupt mappings the switch's own
regmap-irq chip still owns; the regmap-irq thread then faults in
handle_nested_irq() later in the same teardown. rmmod reaches both, since
mdio_module_driver() calls .remove on module exit.

Patch 1 is the regulator one. mt7530_probe() requests the core and io
supplies only for ID_MT7530 and mt7530_setup() enables them under the same
test, but mt7530_remove() disables them unconditionally, so on an MT7621 or
an MT7531 both pointers are still NULL from devm_kzalloc(). It reaches the
MDIO front end only.

Patch 2 is the interrupt one, and it reaches further.
mt7530_remove_common() disposes the per-PHY interrupt mappings by hand from
.remove, while the regmap-irq chip that owns the domain is devm-registered
and its parent interrupt is only freed once .remove has returned.
regmap_del_irq_chip() disposes the same mappings itself, in an order that
cannot race, so the driver's call adds nothing but a window. That helper is
called from both front ends, so the defect also covers the MMIO parts -
MT7988, EN7581, AN7583 and EN7528 - which have no regulators and never meet
the first defect at all.

The order is not arbitrary. On an MT7531 the regulator fault happens in the
first thing mt7530_remove() does with the switch, so execution never
reaches the interrupt defect. The second only became visible once the first
was fixed, which is also how both came to be found on one board.

Found and verified there. Without patch 1 the unbind panics in
regulator_disable(); with patch 1 alone the panic moves on to
handle_nested_irq(); with both, three unbind/bind cycles run, two back to
back and a third after a pause. In the two whose dmesg was captured, each
unbind removes the switch from the driver directory and takes lan1 to lan4
with it, each bind brings them back, and lan1 relinks at 1Gbps/full after
both binds, lan4 after the second. uptime rose from 58 to 202 seconds
across the three without resetting and pstore gained no new record. The
third cycle stayed unbound long enough to read the descriptors: no mt7530
line in /proc/interrupts and no irq/79, irq/80 or irq/81 directory, and the
next bind reuses those three numbers - regmap-irq freeing and disposing
what the driver no longer touches. The kernel under test was identified by
the sha256 of its ELF notes section, read from /sys/kernel/notes on the
running board and computed in advance from the flashed image.

What hardware could not answer here. There is no MT7530 or MT7621 part on
this bench, so the ID_MT7530 branch that patch 1 adds was checked by
reading the generated code rather than by running it, and no MMIO part was
available to exercise patch 2 on that front end either. One unrelated WARN
remains across the unbind, from sysfs_remove_link() under
dsa_user_destroy(); it is a separate DSA teardown-ordering defect and is
not addressed here.

v2:
- patch 2 changes shape. Moving dsa_unregister_switch() in front of the
  dispose, as v1 did, only covers the phylib side: the regmap-irq chip is
  devm-registered, so its parent interrupt outlives .remove and the thread
  can still dispatch on a mapping the driver has just disposed. Dropping
  the call is what closes that: regmap_del_irq_chip() walks every hwirq
  below chip->num_irqs and disposes each one that maps, which covers
  whatever the driver created - the driver's own set is the user ports
  below MT7530_NUM_PHYS, hwirq 0 to 2 on the board below - and it does so
  after freeing the parent interrupt and before removing the domain.
- patch 2 points Fixes: at commit 254f6b272e3b ("dsa: mt7530: Utilize
  REGMAP_IRQ for interrupt handling") instead of commit ba751e28d442 ("net:
  dsa: mt7530: add interrupt support"). Before the regmap-irq conversion
  the driver owned the domain and removed it by hand, where
  irq_domain_remove() disposes nothing, so the call was required there; it
  became redundant when regmap-irq took the domain over.
- patch 1: same diff; the trailers are reordered and the message now names
  devm_kzalloc() as where the NULL comes from.
- v1: https://lore.kernel.org/netdev/20260914202421.2737079-1-f@lex.la/

Aleksei Sviridkin (2):
  net: dsa: mt7530: fix NULL dereference on unbind of MT7531 and MT7621
  net: dsa: mt7530: leave the MDIO IRQ mappings to regmap-irq

 drivers/net/dsa/mt7530-mdio.c | 18 ++++++++++--------
 drivers/net/dsa/mt7530.c      |  3 ---
 2 files changed, 10 insertions(+), 11 deletions(-)

-- 
2.53.0


