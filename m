Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F251CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 12:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JeIjInEsMAVmbX+dQlo3RCAu/5tDMN8pHnPfuMDfNMc=; b=Kn8Pnb/jtVntIERD3HXe34zb4K
	KDwkX1CztD44rOqqivPe4U2aHNx+XEDDb1uYcYN6NxeqvQSkSo6LZnoDY+GEIIHljZ++SWqvXrcLU
	SEsxdSveZFS++akSnTZeA23dj+8Ry9fcSkKhhrZ3UKO1IFEEGFomszFa3ZgHPUqifMxaBHZww3MAa
	ywgeq5wgHCQ3OrzlIC5PoIhkPqrZGhR3bY9rqe7mLPQZzICsRY19FlFLV5d9JkDV18xSFDjMNS81M
	yWicTC7OWJdHlsMYPx/f6hLLqXj8DmyNZAY3XUVp6XuglywAFqaKsKb1TiqKsRmUc4I9UpqjZV+Gn
	OgQfcn8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAdV-00000000Zn1-3PxW;
	Mon, 28 Sep 2026 12:39:13 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAdS-00000000ZlA-49X3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 12:39:13 +0000
X-QQ-mid: zesmtpsz9t1790599102t2b351b77
X-QQ-Originating-IP: UslvrLnkpLv219EBOCZQWgdLB2Yd4yGQ4ouR4nt8KoU=
Received: from localhost.localdomain ( [175.0.204.93])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 28 Sep 2026 20:38:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5072193590924452758
EX-QQ-RecipientCnt: 12
From: Yingchao Deng <dengyingchao@kylinsec.com.cn>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	qinyungao@kylinsec.com.cn,
	luoqiu@kylinsec.com.cn,
	liudalin@kylinsec.com.cn,
	Yingchao Deng <dengyingchao@kylinsec.com.cn>
Subject: [PATCH] coresight: syscfg: Fix null pointer dereference when configfs init fails
Date: Mon, 28 Sep 2026 20:35:15 +0800
Message-ID: <C73E0F9BDC0A8FE7+20260928123515.2032-1-dengyingchao@kylinsec.com.cn>
X-Mailer: git-send-email 2.45.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: OHzPAwYnxdyj/dJup1oe7uBWd83nemyghiy4LlAG+RGU5TYx6vOgiRgK
	ML1IRclAsgSik7qor3f+10R3NLs078cDD9Wb+42cMsNj34lRBkxtltfPwE65tWpAbqTOxmW
	aWwj3ko1/fIkU/VfVBoPs6FAUY/IflTtRRQLJTUBLGUpf8HU5dR/UGRHT+ffCKPDzbVjABW
	UNuZL1n5NDC7EYBzH3ljbu1HKslYl4nFdSiEr3xAP9WoCqRx2OCb6hySWM5miowpNJ6ymiX
	WuKdG/tUotA6WzpNXQDIvhYLgtvZt0CkoAQ+0FpAUWzVo+e9mQReMQTjgXknEXZ3ucR97A6
	FNpF86/7dSrsGH+iupw7XXLWfRUJdMKny2ANz89+5RafEIkaHd4t7+pXywsJXVizVtPSsp2
	t04t7/HpG8SD+viYvLAIydALGANPect9+iwWKCVZYAbRt0QdBcvH47CgInDu29404qkN5ZM
	bxz9LfXq/KMvQfRfhKoz20s9J6y8ZQStzTeSxkxI69etUcnKCzmBAl58YVjShdSepdrU0ny
	TZDAWj6g2RfR8QdvFTzwxCkM2FsF4Q1X/N8snCdBk8TqTKC8d0s/vH4/OdNKXDf/v5jqXHU
	D3g/xuz4M8P1C2cWAIHtRJA+bWkcd66EjZffLNPjRBWsUhL6wgGknqthOHaC9/SDzsQVJu8
	FRM7Q2eBbgGstsPbWfZGqBHqlOweA9fsN5Cmb5+42i9ajmcllARLXBQ+pp1nVtwkcx7mcWO
	xLdbqoG7bepm2M76KYBRkVECWWA6euVKUqoSxg+QgQ2Si3fcYvrC2YgIDT0tBI3i2NpoKLx
	QnFyWWiAauWLnSqqbBYMl3Es+gp8RX+EMQQCf7tNGE0KfVP44bJLlZJsb9uHsbWAJ2AEYjU
	T/P3a/qaRhQaJXNWl1Xbd/POK89M1gGLGIYvd1tFMG7Nd2ynTjvd0RdgWIDV9e6UH1QWmbR
	4S/jX5XjPeupi3a5/mnuAOwUEcBNnn0p2mjn7N1FCBmFScnCq+LE6V92RpIGd9fi42kJFAt
	Lu41WPllkzd/H+bJGczi8qDqmtpTNPlmeRyKThUXht/xwonpSQklvp0XVvyy5HWzXG17FEx
	X+6HtuhSURRYlz2g1vP2KV2h3ohSDCormBINRC5Mi6Ol+NJ+uhTX3iSfLedq/1BFZikXbiq
	bTLVCXR3V7Xc/7OclKfKWq6Wgw1Q14O7kZvp
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_053911_597541_81974431 
X-CRM114-Status: GOOD (  11.56  )
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

If cscfg_configfs_init() fails, cscfg_init() takes the exit_err path:

	cscfg_init() -> cscfg_clear_device() -> cscfg_configfs_release()
		     -> configfs_unregister_subsystem()

which tears down a configfs subsystem that was never registered.
configfs_unregister_subsystem() begins with:

	struct dentry *dentry = dget(group->cg_item.ci_dentry);
	struct dentry *root = dentry->d_sb->s_root;

ci_dentry is assigned in configfs_create_dir() only once the subsystem
directory has been created, which never happened here.  cscfg_mgr
comes from kzalloc_obj(), so ci_dentry is still NULL, and dget()
hands a NULL dentry back unchanged - the next line dereferences it.

Handle the failure in cscfg_init() directly: unregister the device and
return the error, releasing the devres-allocated config item type and
cscfg_mgr without touching the subsystem.

Fixes: a13d5a246aca ("coresight: syscfg: Add initial configfs support")
Suggested-by: Leo Yan <leo.yan@arm.com>
Link: https://lore.kernel.org/all/20260924162404.GN200420@e132581.arm.com/
Signed-off-by: Yingchao Deng <dengyingchao@kylinsec.com.cn>
---
 drivers/hwtracing/coresight/coresight-syscfg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 2bfdd7b45e49..00b29d1656c0 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -1299,8 +1299,10 @@ int __init cscfg_init(void)
 
 	/* initialise configfs subsystem */
 	err = cscfg_configfs_init(cscfg_mgr);
-	if (err)
-		goto exit_err;
+	if (err) {
+		device_unregister(cscfg_device());
+		return err;
+	}
 
 	/* preload built-in configurations */
 	err = cscfg_preload(THIS_MODULE);
-- 
2.33.0


