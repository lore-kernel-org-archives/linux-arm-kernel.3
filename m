Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D97A606D83C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 07:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sLZ+N7ll
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ztevti+WsATUuW7wQq520FDwCCOhR3BLi5Ik6z3HcRU=; b=sLZ+N7ll09rRHI
	NFvHSHnj+aLSujBV45WQozhEXHQAp/nVucp5C+YOC9pFeiyjluDa2O3GohMjFZeTNlS2l7ZG6JzaT
	XZUBRLfVCTwiOwl6w/kgr+k86MRCAHRiPrGy2fAzu3KXovyxn7Nd2l9nYZH4rGVS57P0knywKzW8f
	6cEWXsjzzwJHxau/jXrIrmEX0tQ1A647yK9VBCRmBoqp/zJeqL6tsbMfhiTAjxntYjh98p0yCDq2A
	2UCnk5VdhC3Zpe1yM1tKIaXNUzi24IeLvawkcJFpOgPQuU1ibEIsvKrf5ihyv/EeU5yd9CR6e96VR
	O16b1e7Sivq61chzknsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPE29-0000000BOOs-2qpF;
	Fri, 06 Nov 2026 07:06:47 +0000
Received: from out28-127.mail.aliyun.com ([115.124.28.127])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPE22-0000000BOLe-3XZ6;
	Fri, 06 Nov 2026 07:06:41 +0000
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07380707|-1;BR=01201311R901S77rulernew998_84748_2000303;CH=blue;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00400029-0.000233897-0.995766;FP=107825249825553556|1|1|2|0|-1|-1|-1;HT=maildocker-contentspam033025068124;MF=wangxiaolei01@kaihong.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jy2.92k_1793948790;
Received: from nj-vm-261.pxvirt.local(mailfrom:wangxiaolei01@kaihong.com fp:SMTPD_---.jy2.92k_1793948790 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 15:06:32 +0800
From: Wang Xiaolei <wangxiaolei01@kaihong.com>
To: linusw@kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	daniel@dragonzap.com,
	wangxiaolei01@kaihong.com,
	iivanov@suse.de,
	andrea.porta@suse.com,
	phil@raspberrypi.com
Cc: linux-gpio@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonathan Bell <jonathan@raspberrypi.com>
Subject: [PATCH 1/3] pinctrl: bcm: Fix off-by-one and out-of-bounds access in fsel_get()
Date: Fri,  6 Nov 2026 07:06:26 +0000
Message-Id: <20261106070628.1428691-2-wangxiaolei01@kaihong.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
References: <20261106070628.1428691-1-wangxiaolei01@kaihong.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_230639_027368_54F0F49B 
X-CRM114-Status: GOOD (  16.76  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

brcmstb_pinctrl_fsel_get() takes the value read from the pin's FSEL
register and uses it directly as an index into
pc->pin_funcs[pin].funcs[]:

        fsel = (val >> BIT_TO_SHIFT(bit)) & pc->pin_funcs[pin].func_mask;
        func = pc->pin_funcs[pin].funcs[fsel];

That is not how the register field is encoded. The setter,
brcmstb_pinctrl_fsel_set(), treats 0 as GPIO, 1..n_funcs as
funcs[0..n_funcs - 1], rejects n_funcs + 1 and above, and n_funcs is
always BRCMSTB_FSEL_COUNT (8). The field is therefore a 1-based function
number, while funcs[] is a 0-based array of eight entries.

Every readback is consequently shifted by one slot, and a field value of
8 -- which the setter accepts, being the eighth and last alternate
function -- indexes funcs[8], one element past the end of the array.

This is reachable from userspace without supplying any invalid input:

        # echo "gpio45 alt8" > .../pinmux-select
        # cat .../pins

The write is an ordinary mux request that fsel_set() accepts; the read
that follows goes through pinctrl_pins_show() ->
brcmstb_pctl_pin_dbg_show() -> fsel_get() and triggers KASAN on
Raspberry Pi 5:

        BUG: KASAN: global-out-of-bounds in brcmstb_pctl_pin_dbg_show
        Read of size 1 at addr ffffa07c577ab2e8 by task cat/839
        The buggy address belongs to the variable:
         __compound_literal.62+0x8/0x40

A field value of 0 has the same root cause in a milder form: it is
reported as funcs[0] instead of GPIO. The mux itself is programmed
correctly in both cases, so this affects the debugfs readback and KASAN
rather than the hardware configuration.

Handle 0 and out-of-range values explicitly, and index funcs[] with
fsel - 1, so that the getter uses the same numbering as the setter and
the index can no longer go past funcs[n_funcs - 1]. The existing
fallback for func__ placeholder entries is kept:

        if (!fsel)
                return pc->func_gpio;

        if (fsel > pc->pin_funcs[pin].n_funcs) {
                dev_warn(pc->dev,
			 "invalid fsel %d for pin %u\n", fsel, pin);
                return pc->func_gpio;
        }

        func = pc->pin_funcs[pin].funcs[fsel - 1];

Tested on Raspberry Pi 5 with KASAN enabled. Before the fix, writing
"gpio45 alt8" to .../pinmux-select and then reading .../pins triggers
the splat above. After the fix the same sequence reports
"function spi_m" with no warning and no splat, and a register field
value of 0 reports "gpio". The register is restored to 0 afterwards.

Fixes: 657cbf9b24ba ("pinctrl: bcm: Add STB family pin controller driver")
Cc: Jonathan Bell <jonathan@raspberrypi.com>
Cc: Phil Elwell <phil@raspberrypi.com>
Signed-off-by: Wang Xiaolei <wangxiaolei01@kaihong.com>
---
 drivers/pinctrl/bcm/pinctrl-brcmstb.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-brcmstb.c b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
index f46b27155c3c..2b942ca7196b 100644
--- a/drivers/pinctrl/bcm/pinctrl-brcmstb.c
+++ b/drivers/pinctrl/bcm/pinctrl-brcmstb.c
@@ -66,7 +66,16 @@ static unsigned int brcmstb_pinctrl_fsel_get(struct brcmstb_pinctrl *pc,
 
 	val = readl(pc->base + BIT_TO_REG(bit));
 	fsel = (val >> BIT_TO_SHIFT(bit)) & pc->pin_funcs[pin].func_mask;
-	func = pc->pin_funcs[pin].funcs[fsel];
+
+	if (!fsel)
+		return pc->func_gpio;
+
+	if (fsel > pc->pin_funcs[pin].n_funcs) {
+		dev_warn(pc->dev, "invalid fsel %d for pin %u\n", fsel, pin);
+		return pc->func_gpio;
+	}
+
+	func = pc->pin_funcs[pin].funcs[fsel - 1];
 
 	if (func >= pc->func_count)
 		func = fsel;
-- 
2.34.1


