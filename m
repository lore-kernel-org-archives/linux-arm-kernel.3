Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388926082BC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 23:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZzHyBaQ+;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ckya8XXj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=m1dkmcldC8pS++pzGm6xswfQROiXoCXlLYpleWR5Pvw=; b=ZzHyBaQ+/1gG7m7aySled+17pT
	yMH/oKb4OHI76kcRcN3eb9V13SscZHvELFgGi6+nD2bOhwpa5OM6FaFzEJ2htp7posxKqt9U9wbtb
	3NIhs93wQp8kUraizqZr9LL/26vv5CWXk/z1ZhYzXlsgngleQCAk1L39y1AfKp/q2n9XtBBHcYlcl
	+rMfydIqEpgLm8Nmgh5LuyD6aFle5h+LYLlsdA4wCGpPJv2KVayPlsLKXXIeGeeUjCMNXN5lRtu9Q
	wXVDeHitYxVAH+yuMyF88p9jLQfUS/2Sul/fb1d6ZFD36wGFwITogv9nhmtXeRZgA6Mx5eXRa7M35
	Bas9ZaZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOkj7-00000007HAt-04Bo;
	Wed, 04 Nov 2026 23:49:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOkiz-00000007H65-2THv;
	Wed, 04 Nov 2026 23:49:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793836139;
	bh=dtL04qPAz8o5teY7MsjxAf6ee93yJpOTM5INfoCSzPk=;
	h=From:Subject:Date:To:Cc:From;
	b=ckya8XXj2JrGbl23HonSZvDvkACSS4Efp1i1gf1zbr6cUFhzzaoE5GgD07cVe2ral
	 mI59Dr91UBRpgncbFYY7X+aPvxfl1AxEbMXEBpAavkasYgj5pvai2H1KmXIKUu53MW
	 n/K9pYIMc5gsusXMdLH7eXVOIdTcABC0lX2YCE/BYrJK/U5Mu4huLwJhSCuOXUfKuD
	 hsw4ouLSIvveaUVwC+q+olk73tueLfx2bkfJLRKVpqHiH/ya7CoVZJ4Vi0qnUVLyqd
	 FzaL82yK/Hr6o6Etc45SoOe/HBNEEOXKej7SycnhbJX18VqP0KUxkcuRkQqre0QLKE
	 +hC/ZhevKkUUg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 27CA917E078F;
	Thu, 05 Nov 2026 00:48:59 +0100 (CET)
Received: by jupiter.universe (Postfix, from userid 1000)
	id DCF4E48002B; Thu, 05 Nov 2026 00:48:58 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v8 0/9] PCI: dw-rockchip: add system suspend support
Date: Thu, 05 Nov 2026 00:47:01 +0100
Message-Id: <20261105-rockchip-pcie-system-suspend-v8-0-0434b4f373bc@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XPTW7CMBCG4asgr2tkO/EfK+6BurDHk8YqxJFNr
 SKUu9cgQRdFzfKdxTP6rqRgjljIbnMlGWssMU0tzNuGwOimD6QxtCaCCcmZMDQn+IQxznSGiLR
 cyhlPtHyVGadAjYKBGae9EJY0Ys44xO87f3hvPcZyTvly/1b72/UB2//h2lNGAQVyz5QVQewhH
 Y/Op+y2kE7khlf5ABXruFoBZQOl99KFTgfVd69A9QtatjK9qgYO3nkAZ63g/hWonyDnrF8BdQO
 VQ2W0tJ11fyYvy/ID7opajL8BAAA=
X-Change-ID: 20251028-rockchip-pcie-system-suspend-86cf08a7b229
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 "Yury Norov (NVIDIA)" <yury.norov@gmail.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alexey Charkov <alchark@flipper.net>, linux-pci@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7061;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=dtL04qPAz8o5teY7MsjxAf6ee93yJpOTM5INfoCSzPk=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGrrxGbMGJunvqzDik/j8xW+rBF9q/ngW63/m
 gPOkwOnrJRr1YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJq68RmAAoJENju1/PI
 O/qaUYAQAJ2PSLway03WOMeW7fU2YT6tf4dGnvu5HZxW4XSR8Ob3vkxg8Xz027xl4B53BSbLbo/
 S9Z8lUuzQ+/Unz2KMOut/4jZb3KQvsroZbWBy9cSIxsWuw71LXlPEe4hhxvjkWkpz2NCWM/a9O3
 F8CGN9AwyCYAof9ej8MJ7ii7K9x3nJdNFoPUHhgQ5fO7CszCRfCUrXJ2+TVQnasyJA4fMZaAfe3
 AEfV1JJEyXshaeXF1oNckSvPQ2w+7M9xSUAVcqdScMyh52ZhWTZiLwchkprJ5rlit6O+MRhLy/F
 6cvxkeTY/C7wkgVLwshOppPfhTxJAtlka3czHlYGMNgPSdnKZE4cemADWQoDB9B6BN2tEjNMMKD
 p1SMWBA97JVlqRHaJevHumwy1/6AJaXjHnwSPhv3vQ+qFfvW9n//0TotbGyC+Z2ZodScB4ZXLt8
 rfUF/0rCnMorTFPWhw8LAMOovY6uQDiF75JQPF9jOgdiokL6aAhx+F0QnCK2FFCp5t3qVbD7JXz
 K9xLhTm4Pv1cRJajMAU6yJG/QpdTqrYjCWXyBNa4zTSmIBl3UqxBTi+qCHAYvTz28LFlsFKHjJz
 9bEualWFBP3hK8ujO4I0UibHVfxZD3zg4PVFmwjZTytTw0YTaHd2nAKf3aWeqDQ+/r6dJKOne8J
 u6ehtuGIZexAow7aI1Mw2SA==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_154901_813288_60879F53 
X-CRM114-Status: GOOD (  27.82  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I've been working on fixing up at least basic system suspend support on
the Rockchip RK3576 platform. The last open issue is missing support in
the PCIe driver. This series is a follow-up for Shawn Lin's series with
feedback from Niklas Cassel and Manivannan Sadhasivam being handled as
well as some of my own changes fixing up things I noticed.

I've tested this on multiple RK3576 and RK3588 boards and things look
good to me on the PCIe side. Additionally Igor Velkov tested previous
versions on RK3568.

On RK3588, I also needed [0] to fix PCIe IOMMU issues after resume. I
consider this an independent issue. Additionally on RK3588 the system
will run into SError on resume due to a USB2 PHY problem. This problem
is also independent handled via [1] (needs new revision).

[0] https://lore.kernel.org/all/20260728210928.1050849-1-praan@google.com/
[1] https://lore.kernel.org/linux-phy/ar7QuTetvpLltrDT@venus/

Changes in v8:
- Link to v7: https://patch.msgid.link/20261104-rockchip-pcie-system-suspend-v7-0-6ae6875939a2@collabora.com
- Drop the final debug patch; I took that over from Rockchip's vendor
  tree as it seems useful for debug purposes. Using it involves reading
  the register via /dev/mem. It's not directly tied to actual system PM
  support itself, so it can be submitted separetely. It's not worth
  fighting Sashiko for it.
- In LTSSM control mode patch also replace one occurance that I missed
- In system PM support patch add guard not suspending an already
  suspended PCIe devices, which can happen when resume failed following
  the example of UltraRISC (Sashiko)
- In the same patch replace 0xffff mask with PCIE_INTR_MASK to avoid
  overflow issue; the new mask is not functional equivalent as we just
  work on the lower 8 bit now. The following 8 bit are reserved on
  RK3588 and RK3576 anyways, though. Thus this effectivly better
  documents the purpose of the cached value. (Sashiko)
- Drop incorrect custom PERST# handling in the resume handler (Sashiko)
- Modify interrupt masking to follow RC instead of EP logic (Sashiko)
- I've not picked up the Tested-by tag from Igor Velkov on v7
  as there are some changes (even though I'm fairly sure they
  don't matter), which add RK3568 to the tested SoC range.

Changes in v7:
* Link to v6: https://patch.msgid.link/20260908-rockchip-pcie-system-suspend-v6-0-fbabcca9921b@collabora.com
* Rebased to v7.4-rc1
* Collect Reviewed-by tags from Shawn Lin to (mostly) unchanged patches;
  I skipped some due to changes in v7
* Keep dev_err_probe() message for rockchip_pcie_phy_init in patch
  restoring vpcie3v3 regulator handling
* Avoid dynamic mask for extra flags in "enhanced LTSSM control mode helper"
  by just adding specific support for the extra flag needed. Apparently
  some compiler configurations don't like it.
* Avoid duplicated register define in In pme_turn_off patch
* Move bit defines to the correct register defines in pme_turn_off patch
* In broken L1SS resume flag patch move the explanation comment from the
  code to the commit message (FWIW this comment is not AI generated by
  me, but was copied from the Qcom implementation).
* In system PM support patch, set pp->suspend_poweroff to fix the issue
  identified by Igor
* In system PM support patch, just return 0 for DW_PCIE_EP_TYPE (Mani)
  to keep the status-quo (I've not tested this specifically).
* In system PM support patch, use the same init order as probe (Sashiko)
* In clear debug buffer patch, drop dw_pcie_dbi_ro_wr_dis(), which
  is already done by the core nowadays (Sashiko, Mani)
* In clear debug buffer patch, fix actual register write (Sashiko)
* In clear debug buffer patch, update patch description with
  better explanation about the register (Mani)

Changes in v6:
 * https://lore.kernel.org/r/20260316-rockchip-pcie-system-suspend-v5-0-5bb5ad37d643@collabora.com
 * Rebase to pci/next
 * Minor changes to make checkpatch happy
 * Update patch description of the last patch and drop RFC tag
   according to feedback from Shawn Lin
 * Prepend new patch, which fixes Nicolas Frattaroli's conversion
   to FIELD_PREP_WM16 accidently dropping a flag.
 * Add another new patch, which sets .broken_l1ss_resume to tell the
   PCI core that the controller is powered off during suspend following
   the Qcom example

Changes in v5:
 * https://lore.kernel.org/r/20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com
 * rebase to v7.0-rc1
 * Add an RFC patch at the end with some bits I found in the Rockchip vendor kernel;
 * Made some tests on Rock 5B+ (RK3588); with this patch series suspending works
   when setting pm_test to devices. A full system suspend fails in a later step,
   but that is independent of PCIe.

Changes in v4:
 * https://lore.kernel.org/linux-pci/1744940759-23823-1-git-send-email-shawn.lin@rock-chips.com/
 * rename rockchip_pcie_get_ltssm to rockchip_pcie_get_ltssm_status_reg
   in a separate patch (Niklas Cassel)
 * rename rockchip_pcie_get_pure_ltssm to rockchip_pcie_get_ltssm_state
   in a separate patch (Niklas Cassel)
 * Move devm_phy_get out of phy_init to probe in a separate patch
   (Manivannan Sadhasivam)
 * Add helper function for enhanced LTSSM control mode in a separate patch
   (Niklas Cassel)
 * Add helper function for controller mode in a separate patch
   (Niklas Cassel)
 * Add helper function for DDL indicator in a separate patch
   (Niklas Cassel)
 * Move rockchip_pcie_pme_turn_off implementation in a separate patch
 * Rebase to v6.18-rc3 using new FIELD_PREP_WM16()
 * Improve readability of PME_TURN_OFF/PME_TO_ACK defines (Manivannan Sadhasivam)
 * Fix usage of reverse Xmas (Manivannan Sadhasivam)
 * Assert PERST# before turning off other resources (Manivannan Sadhasivam)
 * Improve some error messages (Manivannan Sadhasivam)
 * Rename goto labels as per their purpose (Manivannan Sadhasivam)
 * Add extra patch for dw_pcie_resume_noirq, since I've seen errors
   during resume on boards not having anything plugged into their PCIe
   port

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (9):
      PCI: dw-rockchip: Fix LTSSM set functions
      PCI: dw-rockchip: Restore vpcie3v3 regulator handle
      PCI: dw-rockchip: Move devm_phy_get out of phy_init
      PCI: dw-rockchip: Add helper function for enhanced LTSSM control mode
      PCI: dw-rockchip: Add helper function for controller mode
      PCI: dw-rockchip: Add helper function for DDL indicator
      PCI: dw-rockchip: Add pme_turn_off support
      PCI: dw-rockchip: Set broken L1SS resume flag
      PCI: dw-rockchip: Add system PM support

 drivers/pci/controller/dwc/pcie-dw-rockchip.c | 267 +++++++++++++++++++++-----
 1 file changed, 224 insertions(+), 43 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20251028-rockchip-pcie-system-suspend-86cf08a7b229

Best regards,
--  
Sebastian Reichel <sebastian.reichel@collabora.com>


