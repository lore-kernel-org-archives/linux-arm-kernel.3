Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D5FEC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 17:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h4aDEG8cihN82KCE5Be4Jvx17bHqTacMNeZX7oNEGiU=; b=ZIfWAYqbXCAAjdimH3aZ4bG7qK
	j8wvXAKc2iUJ9F9o3TBnkH8i2AroEcCQuSnDhVAjfBXwNCSsJ5KoQhmgt7xbzB6RLEODApm30Y7bN
	Utu3p9I6oNtdTtwZQI6xR94MUk2Mi5hw9KCbHNKMQPSLeT8kystJ0E1TENA9HAEaLPBIH/yYbaRi9
	jJL7S5jkGvZ2IDnpPzTxDspQ8EvgyGlLsggJUeLqtsSS2Nl8EH03gSFrkuvdMmfNNed87hU3zVUfe
	leTZyimovbjNEVOyEPG5CB2W5haZxIvyLgvMVo4GnUzfCocFmU4h235x6CILXXJDGdsx676e/jc0g
	/iCItS8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhAa5-0000000Fhj7-0uiA;
	Sat, 17 Jan 2026 17:59:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhAa1-0000000Fhio-3m36
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 17:59:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A106840B39;
	Sat, 17 Jan 2026 17:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34DAEC4CEF7;
	Sat, 17 Jan 2026 17:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768672760;
	bh=zDvjb3watAeZWV4UQaO3jImyGn5TEPR5wDXBBz0n3DU=;
	h=From:Date:Subject:To:Cc:From;
	b=ISZgiuDTNdBHn/MOYucEePOV7cdSIvSsQQzDlrcX+tO1WKLxp91ivJFR0QlHc4D98
	 J9fgPgiHSAUoajajVj0YE73EBT2GZvAVGSVA+7+uArD4YCLD21xP7SG6UMoXt1PydG
	 LzQaOIq6lJSITqaivVfDaV4iJqKhBzgK/RrOQ/Xe1/1yb+Php9gTqEf1/xYmNb9lKR
	 S1lT9VJ9iyd/AUS66qiumweOsC5EL5EaQc7py9mo3PKRE9/a2eiQkYCoO5qulNp4eb
	 iTiS7bj97QMCXQgLGLnFWdYO8uFRhTjTdr8j3hSZUv4kJM/YC+icVGmRhyWMYpdQJc
	 231nAunV36SKg==
From: Sven Peter <sven@kernel.org>
Date: Sat, 17 Jan 2026 18:59:10 +0100
Subject: [PATCH v2] soc: apple: rtkit: Add function to poweroff
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-apple-rtkit-poweroff-v2-1-b882a180e44d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAO3Na2kC/4WNTQ6CMBBGr0Jm7RimAv6svIdhQXEKEwhtpgQ1h
 LtbuYDL95LvfStEVuEIt2wF5UWi+CmBOWTQ9s3UMcozMZjcVDnRGZsQRkadB5kx+Berdw5te7K
 WXNFQXkKaBmUn7z37qBP3Emevn/1loZ/9E1wICStn+UJFydeqvA+sE49Hrx3U27Z9Aarw1Hu5A
 AAA
X-Change-ID: 20260117-apple-rtkit-poweroff-bc3bb1f4a105
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2357; i=sven@kernel.org;
 h=from:subject:message-id; bh=zDvjb3watAeZWV4UQaO3jImyGn5TEPR5wDXBBz0n3DU=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ2b22U8ChfkLm5wbwjffUZbxaan24evdyNn2OfZzReLKf
 duuOEp2lLIwiHExyIopsmzfb2/65OEbwaWbLr2HmcPKBDKEgYtTACZi0MfI8FNTz/et8r4bLBes
 M1bluxVPPGCela/waKny6W+LFN0fP2T4X/xKqa/KrqImKdSSo+2Bt8OjXYte/J5T7mm8hS3D+4I
 FKwA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_095921_990816_2B0481AA 
X-CRM114-Status: UNSURE (   9.79  )
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

Add a function to put a co-processor into the lowest possible power
state from which recovery usually isn't possible without a full SoC
reset. This is required for the USB4/Thunderbolt co-processors which
can be restarted since the entire USB4 root complex can be completely
reset independently of the rest of the SoC.

Reviewed-by: Janne Grunau <j@jannau.net>
Signed-off-by: Sven Peter <sven@kernel.org>
---
Changes in v2:
- Collected Janne's r-b tag, thanks!
- Fixed line wrapping (Janne)
- Link to v1: https://patch.msgid.link/20260117-apple-rtkit-poweroff-v1-1-6fbe8145e965@kernel.org
---
 drivers/soc/apple/rtkit.c       | 16 ++++++++++++++++
 include/linux/soc/apple/rtkit.h |  7 +++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index b8d4da147d23f7e99e76eea314e4d976cddbd1c6..4ad4f964fde7f821a40b8cde452fb201ec337ffc 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -851,6 +851,22 @@ int apple_rtkit_shutdown(struct apple_rtkit *rtk)
 }
 EXPORT_SYMBOL_GPL(apple_rtkit_shutdown);
 
+int apple_rtkit_poweroff(struct apple_rtkit *rtk)
+{
+	int ret;
+
+	ret = apple_rtkit_set_ap_power_state(rtk, APPLE_RTKIT_PWR_STATE_OFF);
+	if (ret)
+		return ret;
+
+	ret = apple_rtkit_set_iop_power_state(rtk, APPLE_RTKIT_PWR_STATE_OFF);
+	if (ret)
+		return ret;
+
+	return apple_rtkit_reinit(rtk);
+}
+EXPORT_SYMBOL_GPL(apple_rtkit_poweroff);
+
 int apple_rtkit_idle(struct apple_rtkit *rtk)
 {
 	int ret;
diff --git a/include/linux/soc/apple/rtkit.h b/include/linux/soc/apple/rtkit.h
index 736f530180179bd144cf85eb0f0bd93844d7188a..bda3c528b51553c13f7fe5685ab60f7fc675361b 100644
--- a/include/linux/soc/apple/rtkit.h
+++ b/include/linux/soc/apple/rtkit.h
@@ -125,6 +125,13 @@ int apple_rtkit_wake(struct apple_rtkit *rtk);
  */
 int apple_rtkit_shutdown(struct apple_rtkit *rtk);
 
+/*
+ * Put the co-processor into the lowest power state. Note that it usually
+ * is not possible to recover from this state without a full SoC reset.
+ */
+
+int apple_rtkit_poweroff(struct apple_rtkit *rtk);
+
 /*
  * Put the co-processor into idle mode
  */

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260117-apple-rtkit-poweroff-bc3bb1f4a105

Best regards,
-- 
Sven Peter <sven@kernel.org>


