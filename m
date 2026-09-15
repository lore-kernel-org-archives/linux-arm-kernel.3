Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6152C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 00:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s+EblGuXoLMPMwPVZNVP4xKBiatGvf+hJvrolFER4e0=; b=vzQceAc95BiJN5TldVwc3i5dvV
	E8/PJVuSY7JeNYGdDfvW5d9UBfU14DZ96I5yETk2RiM6Bs2FxPpVxzB2BnJD+6G/McQMz+KLMs/dt
	L8zY1tMqrTKmUrWQF2pbjZ9IgpAkcHilnFprFBnetzrS6C7vvisIAeQvxxtrHY896joGHA68ADnV3
	4aGSxu0QH7Q+ErphcSEtE27ogCJd9ipNQJ7LRKga8mAI6AwaMvG0eaAA8w0NiPX2BL3Cn+tC7WBfx
	T2Btd82wNZp61jMXUuo9AIIMOb/6greFHgwGsAUMPy2Gm8Dt2sbYjUzrmGAq8NseGslsfM+hkuOQ/
	9YWsW7SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6HNw-00000004vFc-1CYc;
	Tue, 15 Sep 2026 00:50:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6HNt-00000004vEw-0FkH;
	Tue, 15 Sep 2026 00:50:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789433447;
	bh=RyxyZU6tvGVK3Cpsto128QhecmW8cGT4ht7LtYUq96k=;
	h=From:Date:Subject:To:Cc:From;
	b=OubUc28KqQgzJdCmtM+mgjdyWdAfjd09wXdR5s/dEr2kE466GPU6evpleWbaXF9zS
	 VrKHFk9oOKn7tBSsYYkQ85TD2Ie95HAZuvcJ0r+xrd6DS+iVwfdmbJQpVECmnzTEtp
	 FREi8Wa8H2PxPxG4hYVMm8H7gFcSvKjhsuy1D0xv+qvJbrT/xuaRg/sUZY5VKJu/Yz
	 eAJXB3GVf0m4cRGVu5QdOb9QbzPIWYJWm5YruRBlZigiHqqsD/UzcyzyUUVPKGcYMN
	 Qsod3qDrcDzJlxcocdeNJF3aS4lARFjPl42o2cHvEaOpmXtEnYMd6+Mar1k9jkOwzO
	 Dla32fMuFSiGw==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D11D517E020C;
	Tue, 15 Sep 2026 02:50:47 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 8733A48002B; Tue, 15 Sep 2026 02:50:47 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 15 Sep 2026 02:50:39 +0200
Subject: [PATCH wireless-next v2] wifi: brcmfmac: Improve D3 substate
 entering timeout handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-brcmfmac-bcm43752-suspend-fix-v2-1-1bd84914998b@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OzQ6CMBCEX8Xs2TXQyp8n38NwKO0iNdCSLiCG8
 O4CvoDHmck3MwswBUsMt9MCgSbL1rtNiPMJdKPck9CaTYOIRBoVUY5V0F3dKY2V7q4ySwTyyD0
 5g7WdsU4TWZBRMUUGto4+0GYf/Q9420AtMaOjeYDyF/NYvUgP+8YONJYHHz7Hnyk+sD+npxhjl
 CLJk1QWJkvlXfu2VZUP6qJ9B+W6rl/2g1IJ7wAAAA==
X-Change-ID: 20260908-brcmfmac-bcm43752-suspend-fix-f6539eda1e0d
To: Arend van Spriel <arend.vanspriel@broadcom.com>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
 brcm80211-dev-list.pdl@broadcom.com, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2977;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=RyxyZU6tvGVK3Cpsto128QhecmW8cGT4ht7LtYUq96k=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGqolme4nuHWmpgOjksw+iy1a4fJGq0ufmzc0
 PdYynyZ531Lk4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqqJZnAAoJENju1/PI
 O/qaO9QP+gJfY+1klvAccg/4UQb9UdDoh7tto9tPNQafA1WQkAP19eYYRIqItzjK/CfE59NB6NZ
 c7rLGMMrbBx3+/I6jC51uCJM/GTaaDAwH9Njk6mPYpLxtANleGpT82PJeTwjCB/y1dnNdD+DDFY
 hMTyCkrSwYzAsY+sZ/WFvsYGY76UxBePB2GQUDOR/Cr80LQNFe3SIh0FWSONwVX+xtKlEr5i9y4
 5ZBpJ5SSO6C+yNYQzcft6gJhMngKwAuAujK9FH7NynacgGRMBi67goZ0uVHJhCeQhCw22mFm4bf
 43mJLVzhA0R/vcpQByazUWJen24LWPjJJshyea3O/noUTz0Lhh+heYHSopB+V0ZzTOQQ4sO/LTT
 E2zDdRCNtgdmhSp1saVvKtr3DvaGd31ccieX+nCJrCZQAbYRmbaSRm8lOiHRerL84ZwUJGP/pBS
 psiTZfb7fxhTkYxxhyguYdfxv0wYPuxev5ylFudR0TP6QFIb6muw1PRW7FlJ7yjjxF6Zop/W39y
 6X3HVKMl1KdLqpJwJ++PnV4iWYOLPlBFFt7fQq6xLteXZYEXTH4vWmt4aj6e8eXdSixmCg7/+hS
 0gLFrUsqHVcoCOfFgM+97eSrwy+0cCo2cqu6pEHo/624pM7A6eYuuvjELa+BAaUiqLxTl1rE8jo
 NjkBBSOMrxGVj+36jEZswzA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_175053_264412_9615CE06 
X-CRM114-Status: GOOD (  17.69  )
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

Some firmwares (e.g. BCM43752) do not service the D3_INFORM mailbox
handshake when idle, so the D3 ACK never arrives. If WoWL is not armed
the device is going to be powered off during system suspend and
re-probed on resume anyway (brcmf_pcie_pm_leave_D3() handles that), so
the missing ACK is harmless and must not abort the whole system suspend.
When WoWL is active the device has to stay powered with its state
preserved, so keep treating the timeout as fatal.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
This was tested with Rockchip RK3588 EVB1, which has a BCM43752 based
WLAN card (AP6275P). This card is also used by a few other Rockchip
boards (at least Khadas Edge2, RK3576 EVB1). Unfortunately
linux-firmware does not contain any firmware files for this chip,
so I used the files available from Armbian [0]:

3779bd4f629961cf060a83cc5047a3b9b2d23c9d  brcmfmac43752-pcie.bin
a471651d580b51da2a681e53c0cc3258eaa70e10  brcmfmac43752-pcie.clm_blob
87294b22f4bf7b7f718cf24076f102df07e3c414  brcmfmac43752-pcie.txt

[0] https://github.com/armbian/firmware/tree/master/brcm

At least with that firmware the suspend command times out blocking
system suspend. Testing on the Rockchip platform requires PCIe
suspend support for it, which has been send separately.

The patch is based on v7.3-rc1 and can go via -next as system suspend
with mainline kernel needs quite some work on Rockchip anyways.

Changes in v2:
- Link to v1: https://patch.msgid.link/20260908-brcmfmac-bcm43752-suspend-fix-v1-1-32585639d763@collabora.com
- Set prefix to wireless-next instead of net-next
- Do not print error if the timeout is ignored
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index 55f4d7b970f2..17bae04c14b0 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -2652,9 +2652,13 @@ static int brcmf_pcie_pm_enter_D3(struct device *dev)
 	wait_event_timeout(devinfo->mbdata_resp_wait, devinfo->mbdata_completed,
 			   BRCMF_PCIE_MBDATA_TIMEOUT);
 	if (!devinfo->mbdata_completed) {
-		brcmf_err(bus, "Timeout on response for entering D3 substate\n");
-		brcmf_bus_change_state(bus, BRCMF_BUS_UP);
-		return -EIO;
+		if (devinfo->wowl_enabled) {
+			brcmf_err(bus, "Timeout on response for entering D3 substate\n");
+			brcmf_bus_change_state(bus, BRCMF_BUS_UP);
+			return -EIO;
+		}
+
+		brcmf_dbg(PCIE, "No D3 ACK, continuing to power the device off\n");
 	}
 
 	devinfo->state = BRCMFMAC_PCIE_STATE_DOWN;

---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260908-brcmfmac-bcm43752-suspend-fix-f6539eda1e0d

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


