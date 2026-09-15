Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640BFC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 09:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qexTWbdmW8eEb6vSlsUiXVjBfkjIzpmrkaoJ6YlOyks=; b=jBzZkIBRDPtJwXwFkdFbYXmXYa
	/+HcHaQbmzr+EAleQEAb5CxFcIOyaO2g6izhkNACTFnGp3XIxhVXSXoU3y8jyr/tsatHjMCMPoVGW
	FlPvGn0+lxQoS9Kn84bx4AhA+kc8dAq6CDT7cTvHjYWCzvlRA0kPwdrdSb/0PjO+Q3m0IpEbIQRfJ
	oSqN6EqRFTr1ZQ3aCnwMLhjg9/+Aw6QYmxr3qyCjRyR0NZwF0EPyU1/5DyK30waq1C/wdmO3mYtJG
	etj/5AcY9h3kS2EDLiDDK08IoPDXrLtmEfjYOI+GXhI30mOF6lX+sw2F3tEnUsN8Ryrkvl9/WQKKl
	+FVZ+Vcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P4D-00000005iop-3JYs;
	Tue, 15 Sep 2026 09:03:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P4A-00000005il7-2KJz
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 09:03:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qexTWbdmW8eEb6vSlsUiXVjBfkjIzpmrkaoJ6YlOyks=; b=kJbAIT66Z26cKVcgQjiGbV/WMD
	u5GklKFEtO77DP8RpLsl/gpckGvIu6Sab6dQC0ZFrB4c0aMf1Zw2eTtvkY+aePe9ZLiyBIyvpJIN/
	VG42Qag/nD4s0zdFZxdB4SG6+FTWrKWNi+kEYsDqWXBqQW/j9cedlQ0yCJPbmm9DW/Crt6lJwyumh
	aklBEgFLkQ3+EcKxnRjcSTFitF6xjbqtKLcGIx7IEzB4Re8OOL/E68/8rXaFAGAGIqDpbc3cy+tUc
	fC9o8UtiwSKuLGqm6hbwe78Q/0JtdS8h2N+XyvDJ/LoQYX//02P5iFZ7kw8HKcdJZoB7aOZ9/PsDG
	Q5LNnMjQ==;
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6P46-00000006TEe-3kgP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 09:03:01 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a9c0cd47bbso4625534a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 02:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462978; x=1790067778; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qexTWbdmW8eEb6vSlsUiXVjBfkjIzpmrkaoJ6YlOyks=;
        b=JLDljCSX8KaPGmhZynIxavubkD45c/ZjaTHYQHqBm8mEFl49VgFErfhcXN5ZHZlGqf
         Kqm0FURw87RzxmeaDXV29rr+K3GiUt7UEPIOlNKGVcXf1yhv9Wbi041DhFLlleVzblfw
         XyMdviDik3hyZ6o2N5p6tUdFsDBG+/JvLOBXvrWfdBbgdK0SSfZu8JvIFIV2+I2Kzw/a
         HX7gmwpu/WFTt5Xm993IdSTixxODTMKjM6KKhpkmSMtzCkSSrCrxMbkbGFR45E+Zq3DT
         B2l7Bx6UgEFEtmgZllrprZ82VtlZG81d/eqSQN6p3dJ4erICMMPKe/9iZ1LE4ONQ6cQb
         5gHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462978; x=1790067778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qexTWbdmW8eEb6vSlsUiXVjBfkjIzpmrkaoJ6YlOyks=;
        b=zebrlkmLjNIMPtVWh2kyxGd8ee/Usne5S1wl08kVSS8DLmGvMkptTytIQrSxMvXilQ
         4/JN2FWJ+t2zCB8rWWPWCU+6M4HWTDB/kbxsQyDeOEmJsa1u3SUbuHd/lkHYZ0Fp136I
         meIBORvGUpWT2zHB+E7mWIWenkturbY6TDAXjvGK7CNgGbcckkCXKXBvv2pKIvSMlJGN
         6r0h9orKdhWNH/jCcBbt+sR5Aeh7A+h2bkLfefM7JAG2ckIsrZROl9VLJtGef8NDOdWB
         uZA2/Jo0BE84rflh2ItRpFnfBkK7QkVnrL6aw1IzKBqqCTVWVhlXXZgmMfG4kePJwdt1
         JCAw==
X-Forwarded-Encrypted: i=1; AKwUvBzRD3axBNwSBAn7tVkFnZ9xlDTFkU9eDUyZ7Quf3/+sXrntQLUBOxHV0HUyLqN6G4MCWXu9gXLQQtmMqJ7Ke25w@lists.infradead.org
X-Gm-Message-State: AFuF++mcRXvzqBFamnIOsUN7IDgKZcp+UeGptw/aypBM5+v10OHRXSRe
	BhsaVkF0aUqI537GFo63XKltieffSfLoROujFUNSa4OO+Q2+TJtlAPX+
X-Gm-Gg: AYBFou0FFU/ttFUlcGGoZG+s1XiBpSf5VjCeRrsiQ6g9C+Whu1gmQDw4aFA/i7KJwBR
	tjWkbEjR9SOj/G7jrVzdMOTHSp51KVKgrF6HgFGGXkOLa3/iNAZF/BNG3BvnVtQCB7zBcTghGb4
	YrCHreGO1hW9/HPF6JmZF7kD3WQMvFddlrcuiMv7AHgBUVVrCYurvg3oFnLyb4pVAaWVPHtPYRk
	8mTkU3ZLzPgNFGC5XCtQlgkv3lEcwycuSNoz8oeRDVfNWrb2hDrW7q6QhSCC4J8Cp6gJogs1CfH
	FFgcsBq5QhPo/vOC5cBeZvo0l0fui2MG42Ok426fA7JYMvHNCswjxwygl/1nUwhUt6uWfs8FM8D
	NziFqlCM2M6R9ctEkByOwC+iVBB0yrLlxX82Gff8f2OPfgbBLzcZu6IQKQDlvk0HYVCxNkSLyX8
	FV4J1gkA2DwPWXLk2GYE7fFQxFHzFTFVSl/p6Bl3bMBKUXENVS3ioiRrRopDhoz+uENvMPMMKfJ
	ruv/hHLf+PIvyJwIqIBrLW9cPNDCTebROMbI/98j4Hb2475ilctJlEnXuMRluQClVOsTmxZLgT2
	TgTdq27bDKvgQrKYERaq7vhh0SVuQFnpRXo+u9l/l84ashItC4F5vXAWMKznoX4ymW0r5vvrMg6
	4Gf/js112esbh8LducGcU2rMGwo/ETRcJl/SYrTLiULP90wh7JccqSw6Yf4plE9wQyJ0Vg+xuih
	nJv4gDy0lKqo2s5ppYW/X2eZX3WbkNIluKwUUy89UfjyEfjaqhWhCr02Uyr3Of4s3v/bS7PHXpz
	hPfic+tAog=
X-Received: by 2002:a17:906:f597:b0:c19:45e3:2f57 with SMTP id a640c23a62f3a-c29b84c7106mr395967466b.9.1789462977606;
        Tue, 15 Sep 2026 02:02:57 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:56 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 4/6] usb: typec: ucsi: ccg: add missing pm_runtime_dont_use_autosuspend() call
Date: Tue, 15 Sep 2026 09:02:21 +0000
Message-ID: <20260915090223.1346-5-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915090223.1346-1-joshua.crofts1@gmail.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_100259_667915_ED85488C 
X-CRM114-Status: GOOD (  10.46  )
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

ucsi_ccg_remove() disables PM runtime on teardown, but doesn't call
pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend() call.

Found using Coccinelle.

Fixes: a94ecde41f7e ("usb: typec: ucsi: ccg: enable runtime pm support")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 91c2958a708c..9d3ebb255de7 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1519,6 +1519,7 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 
 	cancel_work_sync(&uc->pm_work);
 	cancel_work_sync(&uc->work);
+	pm_runtime_dont_use_autosuspend(uc->dev);
 	pm_runtime_disable(uc->dev);
 	ucsi_unregister(uc->ucsi);
 	free_irq(uc->irq, uc);
-- 
2.47.3


