Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAB7C98315
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 17:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cxISlIhm7gSBpMUbI/5WtnEB8etoBlNTQSgHaKMUruw=; b=XV1b+LJp1jYwIpkHgFMF4vFWVL
	vH8OR7L+BfcOZkcln8s4LrWH+PZ7WOlDo3xa646NLJVUkk3aKPMH2rjiSGKHNC/O+RAWLq/Bn57f/
	yYDXOmjMlk0doT2gazw11Rqz5SLFTTFKDpDdwkwXkoKK6FmB+5bbMrLTZXodIEYy+q/NY62Sp4/EZ
	cDPJ3B0nHLY4L2k9hYJzhoSIVrv60XwCD1WQ8qQQCM0ug2uEJB//qhuyBvb//aRVYbKrt04BdnTiS
	GViRFemJ+wKpgQF5W1flZicLEyIynBukwb9VGpWxInO90Ta4hgrqvU/vKDRSCpnLBNRGhapU/bbOZ
	1USq4lpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhA3J-0000000Fgg5-3BZP;
	Sat, 17 Jan 2026 17:25:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhA3I-0000000Fgfu-2uks
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 17:25:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 738C760127;
	Sat, 17 Jan 2026 17:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A7E1C4CEF7;
	Sat, 17 Jan 2026 17:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768670730;
	bh=4V35tKqw5KQHMXyZcaINOZDMyewJrJBwf6xXsdEQV0I=;
	h=From:Date:Subject:To:Cc:From;
	b=rYz3D+erMRpxk2pzST5vBLjNjFsQ9n9O/kXyFNR0KhOOY+mSG6am/Bu7MJcEPJZYZ
	 VfUT2bB6u975c0AWASxTa7LwldPKj/2xE3cLyMzDUlVSPH52wRsCopTM/8o4E+Cd7p
	 O9cD5ppR5uLf/pchTFgnXJBGgv60qOl9UWgFK5B/XqNVucfDociJWjH8tHVagitYF9
	 U8iW8F22l717GV3JBi7IZGYblnr1GLjrQtH153+BqlRbhpWG9Hi0yqtOTfePfhJe7s
	 ySqK7jh9wA5P7BYerhLGNYl1Y0dt+VP6VFEp0DqU5EWNUct+elIiOW2sPMF72aHIbS
	 LVCBmfVsdKFSA==
From: Sven Peter <sven@kernel.org>
Date: Sat, 17 Jan 2026 18:24:44 +0100
Subject: [PATCH] soc: apple: rtkit: Add function to poweroff
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260117-apple-rtkit-poweroff-v1-1-6fbe8145e965@kernel.org>
X-B4-Tracking: v=1; b=H4sIANvFa2kC/x3MTQqEMAxA4atI1gYaf2GuMrhoNZ0Jii2pqCDe3
 eLyW7x3QWIVTvApLlDeJUlYM6gsYPzb9ccoUzZUpuoMUY82xoVRt1k2jOFgDd6jG2vnyDeWTAs
 5jcpeznf7He77ASauEJlmAAAA
X-Change-ID: 20260117-apple-rtkit-poweroff-bc3bb1f4a105
To: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2139; i=sven@kernel.org;
 h=from:subject:message-id; bh=4V35tKqw5KQHMXyZcaINOZDMyewJrJBwf6xXsdEQV0I=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ2b20QfzzgRv9XyvfZBHuLLr8W49fSX1nNralIkzZdapP
 /x95nxvRykLgxgXg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAi0f8Z/sr1/tt3XveogtnL
 WZ/K352YGJHudSp2l/hPzgDDbq/iD+wM/13cZAsua2o5bDA8YvBA6bm8GZPeBM/2UJdPwbmxiSl
 LuAA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
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

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/soc/apple/rtkit.c       | 17 +++++++++++++++++
 include/linux/soc/apple/rtkit.h |  7 +++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index b8d4da147d23f7e99e76eea314e4d976cddbd1c6..381faaf74d5982163d2c44d1e2c6e0ddad07bd73 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -851,6 +851,23 @@ int apple_rtkit_shutdown(struct apple_rtkit *rtk)
 }
 EXPORT_SYMBOL_GPL(apple_rtkit_shutdown);
 
+int apple_rtkit_poweroff(struct apple_rtkit *rtk)
+{
+	int ret;
+
+	ret = apple_rtkit_set_ap_power_state(rtk,
+					     APPLE_RTKIT_PWR_STATE_OFF);
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


