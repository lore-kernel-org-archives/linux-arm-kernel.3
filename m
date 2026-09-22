Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE5AC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JDp7kCvGQJv7Gj/mubADb200WD9R0dbypDFk/xuiIQw=; b=ngdViGEntje9UUEZZs+uMRhu7g
	qotfmXkiiF6g8eLCaKzTB4oGwGJmuv1xGt/L806nlaZhurUWpH2+hrenGwJ+nKfMUPwUC6i1mslUA
	G6zW3XasfYsEX19DYw++3I3kclzYBfu0gx6/nLh3LL+Vk/TSxKvuNzQ9qltgpzME93XLASnLlZxv8
	fS07MpB9YdS5XTMWXIRD0Tm1LbluhbhNwhm7rZXjrHCS8WRNFKXSNcRB6gqblOkfl6L9mL+Zg2LaZ
	yj6yt/1At5nts1j3d91Rvx1TjnmHwX4NL/VgOZw9Pwkh/mzz1QgaZHnUtFAt88r34/S+ChUFuowfj
	rZLGX55Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8r74-000000044KF-49mQ;
	Tue, 22 Sep 2026 03:24:10 +0000
Received: from mail-qk2-x0f.google.com ([2607:f8b0:4864:34::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8r71-000000044J9-3DzG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:24:08 +0000
Received: by mail-qk2-x0f.google.com with SMTP id d75a77b69052e-52fb76ef1d0so31268121cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 20:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790047446; x=1790652246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDp7kCvGQJv7Gj/mubADb200WD9R0dbypDFk/xuiIQw=;
        b=iMxXAMvnMkxU4W4LgFGzHozWRxUy/xaKoiWArhSykevp2oMT0QHUQ8zEbnQrlGcjfW
         ewKqcsQLI1Q7Kt1xzkhgxkBwToR8tBrcUou7CjdnIrZy68lx4KL/CdLmUPc0npDqpIC9
         9TexGMWXk8pPROmlgAFYzSfEiD/XHrVi6m+UbS305YA81g1Ui64UBEzNeNJi1iwxNhkl
         mFDsuzU7myYBQkiXUTkOgXbZR7WZS75wjSKqkZtj0qTxlArVPaVMz7xo2GoNZARMKU8p
         g1Zog1Y7nI/C/y1zt2AR0LqIcnxb5LlxXh0QG4qPjbudVpBOti9x4MGk33xRWxy1/2T7
         HCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047446; x=1790652246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDp7kCvGQJv7Gj/mubADb200WD9R0dbypDFk/xuiIQw=;
        b=Wqd9l2k3XJ7i8xBcevpO+hQrWSTmC1M/y6U3fm52B8Ifv+EgnF3ggTPWcoaeLCBBk0
         XTx1eaTBO3VKB5ruAnGh2fhwfu2e1VCiA3kweNOMOhHO8unKbrUgHVB0M9F8nax/9NxD
         1KxeAYwiljFwe+JZBwPp1dKm4kxRzMgg/Mf2yv0fava5OsCs9xu64SuLYGmY4SYypqQQ
         wXEQwqZtFo1x2oDIPUdJBsv7wEDn+ovu6hzvQ/juA//TH+UKUYzzMFRWeJZYEKG14m7t
         jGDfryDEgtM1FpYuWSnxBHZ9KPcOZrSgggcBo/2W5hXFPDtgSWXqEJkU1q1NLgdESVYB
         CIug==
X-Forwarded-Encrypted: i=1; AKwUvBzF1zXJSzXCmE1conT0XEaqGCnv8ROBZ/IwneznlAE/feSA0Pc3LcSPUV0I16AdB5ZM8Tkjozxc/cChVQdEKeXS@lists.infradead.org
X-Gm-Message-State: AFuF++lN6MKKGTuABtlYgphFkARV78Iz68w4f1ZyDvSKjhx0abD5jM4X
	9aaPyQg+3eSR2YXAG6raeqhrllhS+8Fj6DIUstQ5Sv8AIwEoBqQXSl0=
X-Gm-Gg: AYBFou3zjnvSrIke1zZAPQ0wN+4z6lb2bGVq0Ce6qTzagqL7WDLDTUybqQ+bHNwreI8
	y1pGBPTkHbU6GPEfJXmoXIDHilRZF1ae2Mr+/RC/zcZ++JnzPec0Av/rt4pz2HruqF7r1W1LvKl
	xSP0Yu7gNENp9rABRdTYrfJqsKhaYW+ymhVePtOTdCuIhea50065K0fNVdgVc/YDoZKPFtOR+EW
	8QghUe6awGUXqH6bNxK6o1x/jsdQgk1X/9T/3PVj7Nktr+4auhnOZNjgbTx8aiZM+BthYpbnGiE
	06vwCvpm5nuXudG9Atkz34ER45xEwt386xE/OB7b/4nMaaiRSh76wMSRv9G4KsQMl2CVI89aVLq
	4eJdlAChYdvqlaIhCiqjkGjzFV+dxPpEjlFpMTePq7tdwb0V2FBFpq4UariqD8mQYYoUW5qGau1
	gRxvHul7XkaINNsKLVFbSvnykTH5X6Zfcub6SXslNc3Y2/kk0g8gnvrQ0a49u3e+zxnlZvnGMyu
	lcf4NOxoG573VIGXNH/LRlFg7e2YmdJfRUCCoCx6Sa6D8LXiatPPmy5XesUqLaUEBpfyARqNiBo
	7uSvTv6x2oB30BPbY7x4BE65On9XcblehBLjqmQ=
X-Received: by 2002:ac8:5a86:0:b0:531:d21:5021 with SMTP id d75a77b69052e-532d8d35f7dmr36423011cf.13.1790047446387;
        Mon, 21 Sep 2026 20:24:06 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e196ef4csm2429671cf.28.2026.09.21.20.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 20:24:04 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] usb: mtu3: Prevent dr_work rearm during teardown
Date: Mon, 21 Sep 2026 23:23:59 -0400
Message-ID: <20260922032359.687286-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_202407_833911_A8F669DD 
X-CRM114-Status: GOOD (  12.25  )
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

ssusb_otg_switch_exit() drains otg_sx->dr_work with
cancel_work_sync().  A later queue_work() from ssusb_set_mode()
arms it again.  Callers that outlive the cancel are the role-switch
store, ssusb_id_notifier(), and the manual-DRD debugfs mode file.
The role switch is unregistered on the next line.  The extcon
notifier is devm-managed, and extcon_sync() invokes it after
dropping edev->lock, so unregister is not a barrier.  The mode file
is removed only after ssusb_gadget_exit(), ssusb_host_exit() and
ssusb_rscs_exit().

The late work calls mtu3_stop() or mtu3_start(), writes IPPC
registers and calls pm_runtime_get_sync().  dr_work is embedded in
the devm_kzalloc()ed struct ssusb_mtk.

disable_work_sync() rejects a later queue_work() and drains an item
already pending or running.  Exit does not enable the work again.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 18cfd7b85ced ("usb: mtu3: rebuild role switch flow of extcon")
Cc: stable@vger.kernel.org # 6.10+
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/mtu3/mtu3_dr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_dr.c b/drivers/usb/mtu3/mtu3_dr.c
index ffa5b9401dad..262922057b13 100644
--- a/drivers/usb/mtu3/mtu3_dr.c
+++ b/drivers/usb/mtu3/mtu3_dr.c
@@ -326,6 +326,6 @@ void ssusb_otg_switch_exit(struct ssusb_mtk *ssusb)
 {
 	struct otg_switch_mtk *otg_sx = &ssusb->otg_switch;
 
-	cancel_work_sync(&otg_sx->dr_work);
+	disable_work_sync(&otg_sx->dr_work);
 	usb_role_switch_unregister(otg_sx->role_sw);
 }

base-commit: 238650ef6c7c7cca08e032527329424c9fbd70e5
-- 
2.53.0

