Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976B5C88E7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 20:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwzBQPMstw+H/RPbR8efACs0f1SjwEvwfQ7q2dwrtDg=; b=hPY0BhSHFCSm2rEtmlt+S1aXLD
	iTXcQIlR8kVErNDmosRXiwbhyY9PZgt2/VG74mjJV2u4dGCUf8fE9WpqrgDNDv8+8NhNh67BP/0+g
	G6Rc5GfDw641q/Y+xaglPKJMFHHPl8rFPNWq9WDPIG6sSCI1P2xNo+6ikk6AS8+sCiJNTRCS5sO4J
	Le6WEF63ypuDo66Ys2TyJREIuvBzWiV9kohd3nxvWfPrYRKwKgLr694eRux73l36s/sUCkBjAZs4d
	B+5b1fQMBKEFqQf6nXP2ZYfH+wiGl/PZ6vacfK9uUMGhta0ElUku83GQW8y9nsEAejKhsRtA08A7q
	R3uUGCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DEA-00000004aDk-3YCz;
	Mon, 14 Sep 2026 20:24:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DE9-00000004aCr-1FBY
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 20:24:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UwzBQPMstw+H/RPbR8efACs0f1SjwEvwfQ7q2dwrtDg=; b=WY8elRTsEMzlBYphIFGuxkKfwj
	f098TKsleXvOizB0ihXIDdNsLhTC0vJZu3Bf+S/KO5O63OM/Ks0J94UT8H6sRhjYBjgr3gETrqSTs
	bSfnPIp8Bo02XzFt5i8Ffvj07EqS9HkSBLNIcbUyl1X/MqfbNURK1kAsramOkwh84RUBEdoAicK1q
	vGKTWxyrDIrH8ohhpRJIYPagj7RVFDiJNyDud1SycFZhaXLjBniP/8p40jCjhzFtDb33dLY/A3e4P
	PU0dQcTfOvsRo8GTAGy2Xu03+lST9O342vd+sfMFBX9o7fvLlp9qtTLCaYLlfFj9jz3gAiSDynHkV
	HJKnOAXQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6DE6-00000005zwF-2QbP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 20:24:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-486fa798933so1762640f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 13:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1789417468; x=1790022268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UwzBQPMstw+H/RPbR8efACs0f1SjwEvwfQ7q2dwrtDg=;
        b=a70eft1l+wQbBbUGTcpj3IAfgARorgvqGRlO1Bw17uV8qYkCLxWezahMQDvJeXbtKc
         Qow5T2+6rITod6tTM4yjlNRkB4qNXsXVO9W6WILXJE7wDPH6uSkMKGhokfvq9x+Mk0sS
         zQM+qGOi51gtcR5w7EwD5UcYtJK938SR4a5pmu6whBn/eE/UKRzK07672jDtHQeYngt4
         EXOZdNwkns87rhRC79Yc7KqRQRuPeIXnvfAbgE+ktFkTBQVLfDjClKqL3up1ywRAgyYG
         ltcoi8eHAErgj/u7cnZ/xN0BkxV7CO4Gbv7JNP6nrFucsprQtXTZa6+sLVnp0nWpYnfJ
         fwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417468; x=1790022268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UwzBQPMstw+H/RPbR8efACs0f1SjwEvwfQ7q2dwrtDg=;
        b=BpXPoypcsIAgXmn6ozsIGkvkcYgbWo9bOO22yXNBlztdSzuLr474cGoObbX3uPOsnR
         OIUbRF4nlN4MjIETkfnlvpLl3a3f07BesKub29JgHlvMAEvv5NVv8UJiwJVHa9ZMWWkY
         nzp7MchqpYaCiB7t2L3L31mJBagqB/X0e0IH9QAOd7j2p6ZhBnwpQKkN7wgVvHfjO++4
         T7psz3eHj2h5987uW7mLkjfzEEaEaEZteHG8+6jvebuNwKHAODEbzajLoRm1cbOcYdSv
         WzpYW7/ZMmYwf3nQ41/NrKOlJcDUxjwA9KualR02EkEqfi+Iyehq7kS5V57edi5SBCGw
         xaVw==
X-Forwarded-Encrypted: i=1; AKwUvBzqNBBah+6UHrq32LitIdZhitacPvgJzng7lihh/LVOpH3gXo0esVfhc8m67838hDzqK4Hp2+EDOjvAARqxKhn1@lists.infradead.org
X-Gm-Message-State: AFuF++n5WF/pzfzYSGBLHdP+LS9wB2T7nI1GFHqMCjFNKTi6o5lveE0p
	jeCYAirCZ7zkSIgLXfYqlXG1djujl0DhFsES+Za7cwtIaw1znhKRj8/NYWMwSFXzwWk=
X-Gm-Gg: AYBFou0lOwDD+Ey/UI51MxADoAP9jnm6y6iSX06xDJIbwoZgQhWA0i6yxy2XlVzVWR9
	nQq0HA2KHzR5J32CSZDiFZ5sRE0XowtN50JZVXNlsJyDt4nzGhG/vabXMaQSy4Jxdwz/3R3qYo0
	8nz2LI47PmgiaJk02IBorx3x/rMlnS9vJGVXp2J4b3AQqlfWv/Js1mKJS5nr8odHsyo82ljHkx8
	Eyoqz8q35cGw1V26bARlfk9SqeHHlO/v4X/RMCqcgkMSMstNUN+yakAXxcMsCEhobOIIUOYY1GA
	Veqtknk1y4PpMbJ2yjr9Vb3GRUnrvs5Xy5o2VBWB/hoVtUw0Am5+A8VLVKZ7dFbz8nRy+LL2ItS
	3cdvFgaZQ9UjmS4epjbkQtyBee5EZyxSYsVwzHoPYSlGQ4R/vBNNPthLLhoMaTvfvTEVkTeiW8G
	kYjhGQfW+CNaOHcx97Vc6KMJvEZ+4j5GOw0vkVbCUHwnvxM6GONw==
X-Received: by 2002:a05:6000:471a:b0:486:f506:2fa8 with SMTP id ffacd0b85a97d-48702ac2429mr5519268f8f.18.1789417468530;
        Mon, 14 Sep 2026 13:24:28 -0700 (PDT)
Received: from remote-01 ([84.17.55.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34fdd2sm29328458f8f.28.2026.09.14.13.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:24:28 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
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
Subject: [PATCH net 1/2] net: dsa: mt7530: fix NULL dereference on unbind of MT7531 and MT7621
Date: Mon, 14 Sep 2026 23:24:20 +0300
Message-ID: <20260914202421.2737079-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914202421.2737079-1-f@lex.la>
References: <20260914202421.2737079-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_212430_761857_B43ACA85 
X-CRM114-Status: GOOD (  24.38  )
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

The core and io supplies are only requested for ID_MT7530: both the
devm_regulator_get() in probe and the regulator_enable() in
mt7530_setup() are guarded by the switch id, but mt7530_remove()
disables them unconditionally. On an MT7621 or an MT7531 both pointers
are NULL, so rmmod or a sysfs unbind calls regulator_disable() on NULL.

Fixes: ddda1ac116c8 ("net: dsa: mt7530: support the 7530 switch on the Mediatek MT7621 SoC")
Signed-off-by: Aleksei Sviridkin <f@lex.la>
Assisted-by: LLM
---
Found by accident on a Netcraze NC-1012 (MT7981B + MT7531, 6.18.44) while
looking for a way to tear a DSA port down at runtime:

  # echo mdio-bus:1f > /sys/bus/mdio_bus/drivers/mt7530-mdio/unbind
  Unable to handle kernel access to user memory outside uaccess routines
    at virtual address 0000000000000078
  pc : regulator_disable+0x14/0x48
  lr : mt7530_remove+0x1c/0x80
  x0 : 0000000000000000
  Call trace:
   regulator_disable+0x14/0x48 (P)
   mt7530_remove+0x1c/0x80
   mdio_remove+0x20/0x40
   device_release_driver_internal+0x1cc/0x220
   unbind_store+0xac/0xb0
  Kernel panic - not syncing: Oops: Fatal exception

The oops itself is a process-context oops that kills the writing task. It
became a panic and a reboot because OpenWrt's generic kernel config sets
CONFIG_PANIC_ON_OOPS=y and this target does not override it, not because of
anything local to this bench. With CONFIG_REGULATOR=n the stub
regulator_disable() returns 0 and nothing is dereferenced at all -
NET_DSA_MT7530 neither selects nor depends on REGULATOR - so the severity is
config-dependent, and the commit message states the mechanism rather than an
outcome.

x0 is the regulator pointer and regulator_disable() reads regulator->rdev
straight away, so the NULL comes from the field never being assigned rather
than from an error pointer: with CONFIG_REGULATOR=y devm_regulator_get()
hands back a valid pointer or an ERR_PTR, and on anything but ID_MT7530 it
is never called at all.

The same shape applies to MT7621, which mt7530_of_match also binds. The MMIO
driver is unaffected: it makes no regulator calls at all, though it does still
carry the include.

The id test is used rather than a NULL check because the driver already
says "these supplies belong to ID_MT7530" that way in the other two
places it matters: the devm_regulator_get() pair in mt7530_probe() and the
regulator_set_voltage()/regulator_enable() pair in mt7530_setup(). A NULL
check would be a third spelling of the same condition.

Tested on the board above. Without the patch the unbind panics as shown; both
pointers come out of kzalloc and are never assigned on an MT7531, so the fault
is structural rather than timing-dependent. With this patch plus the unrelated
teardown fix described below, the same unbind runs to completion: mdio-bus:1f
leaves /sys/bus/mdio_bus/drivers/mt7530-mdio/, lan1-lan4 disappear, the kernel
prints "DSA: tree 0 torn down", and uptime does not reset. The kernel under
test was identified by the sha256 of its ELF notes section, read from
/sys/kernel/notes on the running board and computed in advance from the image
that was flashed.

dmesg is not silent across that unbind. It gains one WARN - a single cut
here/WARNING/end trace block - from sysfs_remove_link() under
dsa_user_destroy() reaching an already-removed netdev directory: "kernfs: can
not remove 'phydev', no directory". That is a DSA teardown-ordering defect
rather than a regulator one, and in this run it fired on the first unbind
after boot. dmesg is where it shows: pstore gained no new record across the
run, but pstore records only oopses and panics and could not have caught a
WARN.

That run needed one unrelated fix on top, deliberately kept out of this patch:
mt7530_remove_common() frees the MDIO IRQs before dsa_unregister_switch()
hands them back, and the board dies in handle_nested_irq() a few hundred
milliseconds later. With this patch alone, the panic moves from
regulator_disable+0x14 to that second defect, and mt7530_remove is reached at
+0x24/0x90 rather than +0x1c/0x80 - which is the point: the NULL dereference
is gone and execution now gets past it. That second defect is being handled
separately.

Not tested: the ID_MT7530 branch, which must still disable both rails. There
is no MT7530 or MT7621 hardware here, so the disassembly stands in for it -
before the change mt7530_remove() falls from the priv NULL check straight into
ldr x0, [x19, #40] / bl regulator_disable; after it, ldr w0, [x19, #72]
(priv->id) / cbz w0 gates both calls, and ID_MT7530 is 0. Built with W=1, no
warnings; checkpatch --strict clean.

 drivers/net/dsa/mt7530-mdio.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/net/dsa/mt7530-mdio.c b/drivers/net/dsa/mt7530-mdio.c
index 784dd58a7158..de42f70afcfa 100644
--- a/drivers/net/dsa/mt7530-mdio.c
+++ b/drivers/net/dsa/mt7530-mdio.c
@@ -227,15 +227,17 @@ mt7530_remove(struct mdio_device *mdiodev)
 	if (!priv)
 		return;
 
-	ret = regulator_disable(priv->core_pwr);
-	if (ret < 0)
-		dev_err(priv->dev,
-			"Failed to disable core power: %d\n", ret);
+	if (priv->id == ID_MT7530) {
+		ret = regulator_disable(priv->core_pwr);
+		if (ret < 0)
+			dev_err(priv->dev,
+				"Failed to disable core power: %d\n", ret);
 
-	ret = regulator_disable(priv->io_pwr);
-	if (ret < 0)
-		dev_err(priv->dev, "Failed to disable io pwr: %d\n",
-			ret);
+		ret = regulator_disable(priv->io_pwr);
+		if (ret < 0)
+			dev_err(priv->dev, "Failed to disable io pwr: %d\n",
+				ret);
+	}
 
 	mt7530_remove_common(priv);
 
-- 
2.53.0


