Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25E5C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 09:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eb3xZy75NQGOxtpcjzjk4/qG4sLL2mvyNHZ62g17sL0=; b=0TK2RsmiDgudrnZ0adT6lzpeNR
	ALrvYLT981n20O7wl7C3QfO/PDP4UVEEMEynw90qKXY2GunvHZfesGTissV9APXWDa69OwTHlosEg
	YGf4LH+MNPEY05gLCkl65ZLINogOb9FYeNsWfRcW4twNePnFZOY+WDg4Lx5f1Ph46ota9F+wiQgFH
	YUHUHzFJwtd2Uje7iOUBGaufeYUerrmisr8xohHheZT24bBD090/IBlcQeQcScf0nZclGq/t0Hhvn
	Ds+KzTOURPJnVVe2JAehVu1mxquovlVuEaxd3DgLP+zScUoHF8gJhrSAXUmlY0XiP8H4Za7N6QGgR
	iM1ttqaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P4E-00000005iqO-10tn;
	Tue, 15 Sep 2026 09:03:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P4C-00000005imV-16eD
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 09:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eb3xZy75NQGOxtpcjzjk4/qG4sLL2mvyNHZ62g17sL0=; b=YBZ0whBgq3iGvUpjlQPL8SqbQ7
	FF+e8smNWdCzFeHPpViRhEpvSmKcnzD3qk+xWMGWmMSZ5T3bXHfaZ65H7B0UY6E4EsXUCn31/yl9J
	1Ibk1Gva8XrLPRA6tpe3I/9pucYKTHQ0HUSQrX5WWrPrdGm2sO3wnXXhUjL/P7GNR0a3msTmfuyHS
	swby5gBlu7sw6sWnYuyhGMv4tuBHyn5jJ1Su4tvEs74vTlTfFK+WKYrmlQM5jU4GiMnZTzwhUrbD/
	ShWMojnUsA22Wq1hS7Y8dGLe7JSfx34R06ioiLVKKjIaci+lg6RX42U5QGEk4ux08+JtA4hu99QoB
	owFw8CsA==;
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6P48-00000006TFv-1S6E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 09:03:02 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c29d50b7cf9so10091066b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 02:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789462979; x=1790067779; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eb3xZy75NQGOxtpcjzjk4/qG4sLL2mvyNHZ62g17sL0=;
        b=owjzPWMiRz7QE0RyK5Xi940Bz8Uvu3czTJb8KLevFskcD7Lk/IRFEoCdY+JIql885t
         YRatLzAMJMQJIpEOTsHc1kAhTyUia687H4k+ZYiPF4YiMFDmSgnnn790SaOAQF3eXHb4
         Mkif3VAhpY7XWBcx8VWdN8zITtWC7PTkKGdTiykGIuZkKV4CfOwfP5bF/+uGLEujghCU
         TUTYYG/ZHkEPRz9wi9URYasVyoWiVHTiAWwpHhDWjk5v6EPyXqxTpRC8mAu4i8T8Ttbl
         rXE3R2j9dMM3K2dTv0i1aoXcpldoJSc+z7wuhsGf3mdCNe4mzx/9c/mXpngNlf1xSuiM
         q7uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789462979; x=1790067779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eb3xZy75NQGOxtpcjzjk4/qG4sLL2mvyNHZ62g17sL0=;
        b=sTPUsVsDF/lRLfO1odNQgrqVg1KBaP2Ib/mF+K7WB4S17Y4PNI7VxLFX8VbLjzHy18
         P2zXX2I4Xid694ZOT8G+M22MMM4KK9KzTo+qFEUHQrwzJ2Rs9wZFS+E0AbsBK6tXOjkE
         04pdIAoozF+E8Q2P0cOLD8mw3zGlQL42H/ck+qSTM/HNbzdNGpuzw457Ozi+gc34Pl0G
         D3MCXo+JmRMA0OATegqnT7tyljH0N3EgAPCE9kqG9QZY1pZXvXmam1tEROb/S1Ntv2zK
         27DAAwAFsMA9p7QRPsdy+pEfnwNslmkf3NxNQuemBpvaexmQTQlIrvqQZWQHYIB84kxw
         mjMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpNcFWR+uoX3olv4m100wA8GclhN/R5pHoAvonxNHsZieaEyMS90lBL+XcrG64f3+JfCMoKZwCvKPX2h8/UIl2@lists.infradead.org
X-Gm-Message-State: AFuF++kJZYehJkilGJe7vHEBlaUkZ4W7ffOq490nq3vsjqtp1fJ22rAJ
	GH5YjNOt0oqyxa6Q6zECVWk1BuqOp1ukNd1M79iOGMfTIbA9JXOrdmHh
X-Gm-Gg: AYBFou2sJCb/3RBpII+9SFsl+674p96FMKDGJXroe2eBKP2kOEDKT1sNQITUogPTZJo
	UwNAoAzfFCG+XnvIAHLzCmOlAIXKHnxOL17WHKPZxg7PSs+BnE3fsEcngOMPPW/JccUGYPGpKlx
	fkccuSj1PhSD+ogulFGwS8B7ntMjL6ht/Ve3Zn+vSSwcttDMFDfchs8ucrm2mTZBH1bJGLvVasx
	K3pa2bVqR+X5VFtV/TnmUepN3Mql85IyD+cR850G9DBN1zTZkmmEmKFCM/VN5M6Wzz0xvvohipE
	CurD8eWWKbHpxiW8gDK+fZ+DJLTxXVyt0vQSy/H4CbtryyjyM8Ulqq+ucMbb5dvZpS8eNFdjG52
	sW29R1SHApR6ZXavXfNukfhx9tWsR5x5Bqgw9i664Is5T96q7TYJ2BEOnPJQxoSB/QMqTaHBjAo
	JBXtsJP1E3zEeSgeAttQCJqYlkC+1ua1wdRSxsrnGiggzPF/nqXoxeDXgW/VB1OhNU5dGFVodmX
	WynIbbMgIfE/K5+BeojBHkp9PeWyQLTE49c7MmFje5xYuUFqfEiGimlIVzUoDaGn4dmxp1kP407
	hTHzye58XHRJDopnwmFBcA+jnGJkaeEqLZZkBKorRx2zECYjGk4Mg0cesTURcWMPUGwVTZPB2A2
	Qk4npe+QR7WZRY0CvBGmAyJu2/bhs0zF+NMbD5XZQXxxWnmpBAwRpI8F5vraRgd2K2Bi0Rx3SIj
	+LONHJvqtGxdYCLN/KPMUDJOEmXo8w9tciAKt/UYnLL5TYmpzXznvEiWI9BFTVEAY0loK3Bri2i
	E3ErEaaCgg=
X-Received: by 2002:a17:907:3c86:b0:c29:60c1:7e55 with SMTP id a640c23a62f3a-c29d7794becmr17686466b.12.1789462979111;
        Tue, 15 Sep 2026 02:02:59 -0700 (PDT)
Received: from cs-280612103108-default.europe-west4-b.c.oa7bb030819b2a894-tp.internal (88.71.12.34.bc.googleusercontent.com. [34.12.71.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4cf01sm546369266b.1.2026.09.15.02.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:02:58 -0700 (PDT)
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
Subject: [PATCH 6/6] usb: cdns3: add missing pm_runtime_dont_use_autosuspend() call
Date: Tue, 15 Sep 2026 09:02:23 +0000
Message-ID: <20260915090223.1346-7-joshua.crofts1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915090223.1346-1-joshua.crofts1@gmail.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_100300_573250_19CBD36C 
X-CRM114-Status: GOOD (  10.86  )
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

cdns3_plat_remove() calls pm_runtime_disable() on device teardown, but
doesn't call pm_runtime_dont_use_autosuspend(), causing resource leaks.

Add the missing pm_runtime_dont_use_autosuspend() call.

Found using Coccinelle.

Fixes: f738957277ba ("usb: cdns3: Split core.c into cdns3-plat and core.c file")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/usb/cdns3/cdns3-plat.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/cdns3/cdns3-plat.c b/drivers/usb/cdns3/cdns3-plat.c
index e3f32c3e9535..b85d5d1c48fd 100644
--- a/drivers/usb/cdns3/cdns3-plat.c
+++ b/drivers/usb/cdns3/cdns3-plat.c
@@ -219,6 +219,7 @@ static void cdns3_plat_remove(struct platform_device *pdev)
 	if (!(cdns->pdata && (cdns->pdata->quirks & CDNS3_DEFAULT_PM_RUNTIME_ALLOW)))
 		pm_runtime_allow(dev);
 
+	pm_runtime_dont_use_autosuspend(dev);
 	pm_runtime_disable(dev);
 	pm_runtime_put_noidle(dev);
 	cdns_remove(cdns);
-- 
2.47.3


