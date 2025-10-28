Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9160CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 11:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cBdm8bq8+KIJZIalBmrpEzODz2xrWcHo5w6EVxM8tvY=; b=oPm4EOq3ZoDlTmX9WB5UgtHL3I
	zGvAxrIZQB2BSy4RczNfwuFD5XxVW5yneSLugvDMtsrOgABgp71RRXtfbT3BgdCzchyqxGwZY8TUp
	ynT6D2tVs4F+dvxAUDhODJvaOls0yJw8pWhrUXBafqw/vA2goyXsZbCv+tBYMR/e4QYWewjCe+Bgd
	l7UNmIjcC6ivJXqbdAjNjpGVJxC199rGBLbEmpYTMdv6vvl1wCMtyDqrFTLW15+tHdmz3kNpto4dW
	JZilQ8wnWVJ0m6DV8N5AJAt1Yt6hdx5tqF5iWIVNwASEvY6wsPYgCNmDKusoXG08bS1q6vlGrCTNM
	9t8W2WLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDiAS-0000000FriE-1aqS;
	Tue, 28 Oct 2025 11:47:12 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDiAP-0000000FrhD-2t9B;
	Tue, 28 Oct 2025 11:47:11 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:314e:ee86:ae6e:30:9d13])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E03EF11D5;
	Tue, 28 Oct 2025 12:45:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761651917;
	bh=dhVlfFBuIJdMHGGksIj7RamXnkNaK+qKXIFsvtZ4AgI=;
	h=From:Date:Subject:To:Cc:From;
	b=CKNhenZuEDjQ4yRNCvaMBiAYGCYEwQB7dUHnLJ3EXj1blYl3u5grUKo6VF5Jr5VY0
	 pSDRbAe1iHlfefiG4oNb6eJgab/D4r2fp8tLTsZI6a5pKc8esVHuUewoFZuQF5f8aT
	 7FKMmXsgRdDA2hckki2lp02iI1jeIoHao5LfZjqA=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 28 Oct 2025 17:16:47 +0530
Subject: [PATCH] clk: bcm: rpi: Mark ISP clock as critical
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-rpi-isp-clk-v1-1-2a54fecb495c@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIACatAGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyML3aKCTN3M4gLd5Jxs3dQk02QTC2MTs1RTQyWgjoKi1LTMCrBp0bG
 1tQDTw4FaXQAAAA==
X-Change-ID: 20251028-rpi-isp-clk-eb5c48346e51
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1172;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=dhVlfFBuIJdMHGGksIj7RamXnkNaK+qKXIFsvtZ4AgI=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBpAK0zbSf9BdGRuZCYvi6Lckjwz2ResH+/mIgE/
 d5g1BPrRfmJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaQCtMwAKCRBD3pH5JJpx
 RbGKD/9SUdtmw4sJCgNYzoCpg/x3H9l8i92BGJffd5WLRFBDnuEqUidpH+jBcoH8M3Zdq9/W0j0
 oV+MUIB0lqk0Cn7gyCEMOr4UWj0gCCv5dxwNSmbzegTfx9ZhDy8ECJf45nlstK1f+BqLGVHeyzu
 NonV+QV1iFgr48k0NMmDBS28Kox5nhUpYhSkHpJ0MMqifRcEObQ7uVbsNEe9wrTerhFQSGxmsdO
 1BDkJBeRPRwUDV0BhY3ujT85s58imP72fPKZuM9fgWUK2dX1uuYrMbOK42A58OeQNh8tV1KksyG
 2N38UnFj8wwpZwZh66N+2EZCa+B6rc1X81639KO34h//8XuAUbsKw0zoWkWN1iFsGfvj04jnZfz
 be/7sDbL1vmosrRbrYmm0UWvCT+iYQCjTYoHoPSI6C9H2SqrPibDlNPOebWT/Sx1U2+GZdBgXoe
 3gomg+VvbkTn8GYMjEICrMN6ENuLfMWBoUythy7ZssffidblaofbJ/EnrfjfSgucnf5Wa28RdaV
 LT0td2cdJhYLWfOFET2pMtHnquSjPYZz+c8Yq7MBHWo6YOduGqElJpGS/SbcYTenLtGsZkplcUc
 JTFRBoS2i6KneOxpyBTmty2+2ksAapJ9RRO39b8hR5RQz8tYD9BmhX6i+dG43wIuZSiQ3MBQo0F
 wBIpvjcaN04mcOw==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_044709_890928_A2309C47 
X-CRM114-Status: UNSURE (   7.40  )
X-CRM114-Notice: Please train this message.
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

The ISP clock should also be marked critical to prevent the clock
framework from disabling it on boot, which can lead to bus lockups when
the kernel tries to submit buffers to the VC4 ISP firmware.

Link: https://github.com/raspberrypi/linux/issues/7100
Fixes: 919d6924ae9b ("clk: bcm: rpi: Turn firmware clock on/off when preparing/unpreparing")
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 1a9162f0ae31e330c46f6eafdd00350599b0eede..dcc3ae5fb91650b042d52f02499922786b43afde 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -151,6 +151,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	[RPI_FIRMWARE_ISP_CLK_ID] = {
 		.export = true,
 		.minimize = true,
+		.flags = CLK_IS_CRITICAL,
 	},
 	[RPI_FIRMWARE_PIXEL_BVB_CLK_ID] = {
 		.export = true,

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251028-rpi-isp-clk-eb5c48346e51

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


