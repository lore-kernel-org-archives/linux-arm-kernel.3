Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646A6CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGTbrdQdy2UGa5cyV8RuLEqwqdVbIbEfeRaImLrs4qw=; b=FPyfhDn2FF29rkIX6LaP+Gl139
	FdYHoCTnsfDvXfAtgnJ5ncQ+MPrRJwwl5+JK/8s6BeTnCfwccvKr2xILRLWHK6wHV3KI4TsYqZIos
	XHBl0xjlFhOxVd36ZrOXMXFz+YEXTJhC0FuKEjj2jKMnpq6VeC8qtfjUMkQtHX20tZgPSh0l9N0yU
	0UTmV3lfnkFp1Y10ffpJccNvJYxtuaAXa3+Xh5/wqBmAq7eo8DJhiG9cw/SY4kG9K4WWVqmwfiEnb
	X7de4U80nQ/8tOWJ112Y8GqGkSvt1HmzUz3X6c8C+Q+v8nsGcqZCsVbX3MN+V2xh2VEeY0gE6dmYk
	ijPJyohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh2Z-0000000BU8F-0Sxr;
	Sat, 25 Oct 2025 16:22:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh2W-0000000BU7W-3l0h;
	Sat, 25 Oct 2025 16:22:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 803D143640;
	Sat, 25 Oct 2025 16:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D865C4CEFB;
	Sat, 25 Oct 2025 16:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409368;
	bh=owlvbVqMoJ68QLNIEi2hG503jMvRcodLtd1ia//GRV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EyJj3rFH9SEmRCg8OH9V6RAuWLQZ/WDbx6RxgJFXCY80bOuO1/y4+SlcREHO5LUrx
	 57UWBCtEmRj02fAefKb1Ui8lIIOS+6fAPQQY9TQhQpmDUA9/RaoytacMHxf6IMWH5W
	 i2rC1bXZJfDimXqFk45BLkgSGr8KsAqsZ5CzQuKnTocICUPN6G+quOuveLA3+0Llna
	 5yW1ub5mwd3bO6RVq4HvWoQdjC83RFvxgzL0s8SoDUNA+32YvvhXcevNQ4Nwh6tufw
	 n6wN0KDCsYGxv6Fsyp5s8wi76g1ISbeHdLMW7zq7g6Aby+aMI4wEum0FksSynnbwYi
	 KjEd8tFWnvB3Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alice Chao <alice.chao@mediatek.com>,
	Peter Wang <peter.wang@mediatek.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.1] scsi: ufs: host: mediatek: Assign power mode userdata before FASTAUTO mode change
Date: Sat, 25 Oct 2025 11:58:44 -0400
Message-ID: <20251025160905.3857885-293-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_092248_976771_BC521A8E 
X-CRM114-Status: GOOD (  16.86  )
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

From: Alice Chao <alice.chao@mediatek.com>

[ Upstream commit 979feee0cf43b32d288931649d7c6d9a5524ea55 ]

Assign power mode userdata settings before transitioning to FASTAUTO
power mode. This ensures that default timeout values are set for various
parameters, enhancing the reliability and performance of the power mode
change process.

Signed-off-by: Alice Chao <alice.chao@mediatek.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Link: https://lore.kernel.org/r/20250811131423.3444014-7-peter.wang@mediatek.com
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

Rationale
- Fixes a real gap in the Mediatek FASTAUTO transition path. In the
  Mediatek vendor pre-change hook `ufs_mtk_pre_pwr_change()` the driver
  performs an intermediate power mode switch to HSG1B FASTAUTO by
  calling `ufshcd_uic_change_pwr_mode(hba, FASTAUTO_MODE << 4 |
  FASTAUTO_MODE)` without first programming the UniPro power mode
  userdata timeouts. See the existing call in `drivers/ufs/host/ufs-
  mediatek.c:1119`. The change adds programming of
  `PA_PWRMODEUSERDATA[0..5]` and `DME_Local*` timeout attributes
  immediately before that FASTAUTO change (inside the `if
  (ufs_mtk_pmc_via_fastauto(...))` block near `drivers/ufs/host/ufs-
  mediatek.c:1101`), ensuring sane timer values are in place for the
  intermediate FASTAUTO PWR mode operation.
- Aligns Mediatek path with core behavior. The UFS core already sets
  these exact defaults when it performs a (final) power mode change in
  `ufshcd_change_power_mode()` (see `drivers/ufs/core/ufshcd.c:4674`
  through `drivers/ufs/core/ufshcd.c:4693`). Because Mediatek does an
  extra, vendor-specific FASTAUTO step earlier in the PRE_CHANGE hook,
  not setting these beforehand can leave the link using unset/legacy
  timeout values during that intermediate transition, increasing the
  chance of DL/FC/Replay/AFC timer-related failures (the driver even
  logs “HSG1B FASTAUTO failed” on error at `drivers/ufs/host/ufs-
  mediatek.c:1122`).
- Small, contained, and low-risk. The patch:
  - Only touches `drivers/ufs/host/ufs-mediatek.c` and only executes
    when `UFS_MTK_CAP_PMC_VIA_FASTAUTO` is enabled via DT
    (“mediatek,ufs-pmc-via-fastauto” in `ufs_mtk_init_host_caps()`).
  - Uses standard UniPro attributes and the same default values already
    used by the core (`include/ufs/unipro.h`), so it’s consistent with
    existing code paths.
  - Is guarded by `UFSHCD_QUIRK_SKIP_DEF_UNIPRO_TIMEOUT_SETTING`,
    mirroring core behavior, so it won’t override vendor-specific
    tunings on platforms that explicitly skip the defaults.
  - Has no API/ABI changes and doesn’t alter flow outside the Mediatek-
    specific fastauto path.
- Addresses user-visible reliability. While the commit message frames it
  as improving “reliability and performance,” the operational effect is
  to prevent misconfigured timeout values during a UIC PWR mode
  transition that the driver initiates. That is a correctness fix for
  affected platforms, not a feature.

Backport considerations
- No new symbols or dependencies; the macros `PA_PWRMODEUSERDATA*`,
  `DME_Local*`, and the quirk flag exist in current stable branches
  (e.g., `include/ufs/unipro.h`, `include/ufs/ufshcd.h:620`).
- The surrounding function and fastauto path exist in stable (see
  `drivers/ufs/host/ufs-mediatek.c:1083` onward), so the change applies
  cleanly.
- Writing these values twice (once before the intermediate FASTAUTO,
  again before the final power mode change in core) is benign and
  matches existing practice in other drivers.

Conclusion
- This is an important, narrowly scoped reliability fix for Mediatek UFS
  hosts that perform PMC via FASTAUTO. It follows stable rules (bugfix,
  minimal risk, no architectural changes, confined to a vendor driver)
  and should be backported.

 drivers/ufs/host/ufs-mediatek.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 4171fa672450d..ada21360aa270 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1349,6 +1349,28 @@ static int ufs_mtk_pre_pwr_change(struct ufs_hba *hba,
 		ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TXHSADAPTTYPE),
 			       PA_NO_ADAPT);
 
+		if (!(hba->quirks & UFSHCD_QUIRK_SKIP_DEF_UNIPRO_TIMEOUT_SETTING)) {
+			ufshcd_dme_set(hba, UIC_ARG_MIB(PA_PWRMODEUSERDATA0),
+					DL_FC0ProtectionTimeOutVal_Default);
+			ufshcd_dme_set(hba, UIC_ARG_MIB(PA_PWRMODEUSERDATA1),
+					DL_TC0ReplayTimeOutVal_Default);
+			ufshcd_dme_set(hba, UIC_ARG_MIB(PA_PWRMODEUSERDATA2),
+					DL_AFC0ReqTimeOutVal_Default);
+			ufshcd_dme_set(hba, UIC_ARG_MIB(PA_PWRMODEUSERDATA3),
+					DL_FC1ProtectionTimeOutVal_Default);
+			ufshcd_dme_set(hba, UIC_ARG_MIB(PA_PWRMODEUSERDATA4),
+					DL_TC1ReplayTimeOutVal_Default);
+			ufshcd_dme_set(hba, UIC_ARG_MIB(PA_PWRMODEUSERDATA5),
+					DL_AFC1ReqTimeOutVal_Default);
+
+			ufshcd_dme_set(hba, UIC_ARG_MIB(DME_LocalFC0ProtectionTimeOutVal),
+					DL_FC0ProtectionTimeOutVal_Default);
+			ufshcd_dme_set(hba, UIC_ARG_MIB(DME_LocalTC0ReplayTimeOutVal),
+					DL_TC0ReplayTimeOutVal_Default);
+			ufshcd_dme_set(hba, UIC_ARG_MIB(DME_LocalAFC0ReqTimeOutVal),
+					DL_AFC0ReqTimeOutVal_Default);
+		}
+
 		ret = ufshcd_uic_change_pwr_mode(hba,
 					FASTAUTO_MODE << 4 | FASTAUTO_MODE);
 
-- 
2.51.0


