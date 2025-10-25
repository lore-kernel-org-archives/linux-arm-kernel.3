Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54E0CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Oct 2025 16:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Em8YRc/nUkJJ0OUcFIYleDiD9hzst6H9TcNhjOWF5YU=; b=iG1YBaV8g+84e8Fega4B/rYEXT
	/XbvNKWefK1LOk0zMl6uxljO0f1Cma5FTgH63o4LYQBPYcg2IdPQahAVZtT/G5ExniGfohGKsuDJs
	yD5+yBqRoAfltVojND5VSTtB7dgxoxrBwVeECqNcb/2kp97EtgMdJDemrImESH1ENnZ35QQnmu1N2
	wxl8s3pRNACYuf5BmwfmH4i3MggmiX4GikxAX24X1P8LEevHVmzbboDgu4rJYD/6HtoM53JmFww8h
	XajVMtSHEZjQSWcMsqSww4OtwWclTrUiiAxEBbJ3jvAdYtehc/AAGZZDJVleD8ulmMA306gc0H31n
	66apz6pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh24-0000000BTwM-05Bk;
	Sat, 25 Oct 2025 16:22:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCh22-0000000BTvX-0f8L;
	Sat, 25 Oct 2025 16:22:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C31261124;
	Sat, 25 Oct 2025 16:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116F1C4CEFB;
	Sat, 25 Oct 2025 16:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409337;
	bh=WNajpbc6UeE5CA1T7IoxhrEbXQRquMQp1b6mZ0IcdWI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T3wZv4iyUF9OGipuUBM9+K5MAdV+8+vYG1Ah5ppVbF9dtwDKGVGuOrVqyrwGpwUom
	 ajI8RT52mKOm4TwmPYpClEJnCRVjA5PM4Z1l1mBgiNgORiutUAPIV/3r/TfzhLZ9A+
	 HKLP84NNnmiiykVD+Q+OQvPZYoYvaRGpJyt8FvmwEFnZif8pm6ZxLIJEG2YeLrZZfc
	 J0GLFZFXhUmpGKm2MRdTX43XJIGkQcEYHYUg7gXxqwOpVDZzCyC0sQLaypn5Yjn+JW
	 BHg2nlx0anxiIjACuDHfIytKhjAUcmabK1SpvEOu4DhAdUSUZBO5ZF1KTG0T4tLRsX
	 kHEAnM9JMjEPw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bart Van Assche <bvanassche@acm.org>,
	Avri Altman <avri.altman@sandisk.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	beanhuo@micron.com,
	alexandre.f.demers@gmail.com,
	adrian.hunter@intel.com,
	quic_mapa@quicinc.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-6.6] scsi: ufs: core: Disable timestamp functionality if not supported
Date: Sat, 25 Oct 2025 11:58:34 -0400
Message-ID: <20251025160905.3857885-283-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Transfer-Encoding: 8bit
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

From: Bart Van Assche <bvanassche@acm.org>

[ Upstream commit fb1f4568346153d2f80fdb4ffcfa0cf4fb257d3c ]

Some Kioxia UFS 4 devices do not support the qTimestamp attribute.  Set
the UFS_DEVICE_QUIRK_NO_TIMESTAMP_SUPPORT for these devices such that no
error messages appear in the kernel log about failures to set the
qTimestamp attribute.

Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Avri Altman <avri.altman@sandisk.com>
Tested-by: Nitin Rawat <quic_nitirawa@quicinc.com> # on SM8650-QRD
Reviewed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Message-ID: <20250909190614.3531435-1-bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES. The change adds a targeted quirk for the Kioxia `THGJFJT1E45BATP`
device (`drivers/ufs/core/ufshcd.c:316`) that prevents the core driver
from issuing the qTimestamp write when the device advertises that the
attribute is unsupported (`drivers/ufs/core/ufshcd.c:8799`). Without it,
every link bring-up or reset hits `ufshcd_set_timestamp_attr()` and
emits a `dev_err` because the write reliably fails, so users see
recurring kernel log noise on affected hardware. Introducing
`UFS_DEVICE_QUIRK_NO_TIMESTAMP_SUPPORT` (`include/ufs/ufs_quirks.h:117`)
is mechanically simple, does not alter behaviour for other devices, and
cleanly gates the existing code path via the existing quirk plumbing,
making the risk of regression very low. Because it fixes a user-visible
malfunction (persistent error messages) on shipping UFS 4 hardware and
is tightly scoped with no architectural fallout, it fits stable backport
criteria well. A natural follow-up is to validate on the affected
hardware that the spurious log entries disappear after backporting.

 drivers/ufs/core/ufshcd.c | 6 +++++-
 include/ufs/ufs_quirks.h  | 3 +++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 78d3f0ee16d84..1907c0f6eda0e 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -316,6 +316,9 @@ static const struct ufs_dev_quirk ufs_fixups[] = {
 	{ .wmanufacturerid = UFS_VENDOR_TOSHIBA,
 	  .model = "THGLF2G9D8KBADG",
 	  .quirk = UFS_DEVICE_QUIRK_PA_TACTIVATE },
+	{ .wmanufacturerid = UFS_VENDOR_TOSHIBA,
+	  .model = "THGJFJT1E45BATP",
+	  .quirk = UFS_DEVICE_QUIRK_NO_TIMESTAMP_SUPPORT },
 	{}
 };
 
@@ -8794,7 +8797,8 @@ static void ufshcd_set_timestamp_attr(struct ufs_hba *hba)
 	struct ufs_dev_info *dev_info = &hba->dev_info;
 	struct utp_upiu_query_v4_0 *upiu_data;
 
-	if (dev_info->wspecversion < 0x400)
+	if (dev_info->wspecversion < 0x400 ||
+	    hba->dev_quirks & UFS_DEVICE_QUIRK_NO_TIMESTAMP_SUPPORT)
 		return;
 
 	ufshcd_dev_man_lock(hba);
diff --git a/include/ufs/ufs_quirks.h b/include/ufs/ufs_quirks.h
index f52de5ed1b3b6..83563247c36cb 100644
--- a/include/ufs/ufs_quirks.h
+++ b/include/ufs/ufs_quirks.h
@@ -113,4 +113,7 @@ struct ufs_dev_quirk {
  */
 #define UFS_DEVICE_QUIRK_PA_HIBER8TIME          (1 << 12)
 
+/* Some UFS 4 devices do not support the qTimestamp attribute */
+#define UFS_DEVICE_QUIRK_NO_TIMESTAMP_SUPPORT	(1 << 13)
+
 #endif /* UFS_QUIRKS_H_ */
-- 
2.51.0


