Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92774C5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 02:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ySHZIwVzqBdAzWNOfvXx87RGlnUJ93mk2F1kn22m1rY=; b=IGjEGMz9ZoqIdPWxsC+y/ci2RW
	CjidodIuxydbuHkUngXfFVy0Hf8iPCM+xg6Qlnmwx4kpkVOpaWrQxBLcCKg9cxuvYCO9FsSp0hazN
	a9ZQN9v0yhOAv21hh1E9nWQsFNz4Uo6CW4J3WbZpWV2l1jH739KqLtMwhEPlz4dqX/HrOcO0eA8dj
	96KbjuOVmj8/3BR760swR/FfB1+O5qtf+HoaiUV5MbHMCakmjUhjDFWaVzmQHjMWzJvbYhQgssflS
	S9NWHEVcCfn1XxEELx2BFu5cWPuhglL/nHhrGgVNvwlGZHVwoTp4TbHKbE52McBILKLmXAZoRR2Zr
	om/apahQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wygbK-000000002Zo-3Xzq;
	Tue, 25 Aug 2026 02:09:22 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wygbH-000000002Z2-0cBj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 02:09:21 +0000
X-QQ-mid: zesmtpgz5t1787623702t11b32f7d
X-QQ-Originating-IP: hByehVH7Y9tb/2JJEYRlenUTW8LI6rPRypywYXGuH90=
Received: from localhost.localdomain ( [175.0.204.93])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 25 Aug 2026 10:08:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14127132030379676705
EX-QQ-RecipientCnt: 13
From: yingchao <dengyingchao@kylinsec.com.cn>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	jinlong.mao@oss.qualcomm.com,
	qinyungao@kylinsec.com.cn,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yingchao Deng <dengyingchao@kylinsec.com.cn>
Subject: [PATCH] coresight: tpdm: initialize spinlock before exposing sysfs
Date: Tue, 25 Aug 2026 10:06:47 +0800
Message-ID: <8693039B65AA093F+20260825020647.2469-1-dengyingchao@kylinsec.com.cn>
X-Mailer: git-send-email 2.45.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: Nl2Ta5wf+OXeX7SjOJM1dSO1hh4gjRQxDIiT+4TDVX935bFDEKDo+QJr
	QSz8ICAoOaB2ZOu30q7LkuzrNVphdwelUS1m7secvGf51KLcvR8fQnkUvGMWKaKtX6xaoN3
	q0qa1EkliDAyqc4J5x+DZpKbfSdj6kaoGlBpQva9PzDZnDNN+D3PdPAH2gGC5gLtZdgMuub
	oPoLbRgK47RAFIj7zgcP3VoIaQtJRCkxO7QD7rWvC6ku+R7GMmtxiwp1XkDydX2bJRRA42F
	/J4KhssnTf6nAm0eHl/9FBS94NqufN+7/Dg9zMO9RHw3YxUMwD26Lp4VjAwGV082Voe7UbZ
	pdCjYgnW2jO4grNsBFvxxSkNhmN/kL6ZYZlORDmF0uHiMZNquZjr9cDjWCr+tbdc4s2WNfZ
	c84/Kbdp4IepMPvHN/tkb6OBXX9qEAPK2yhgEnsvWfeTmVRsTgWzOSXCfjpn7cgnASNvsfl
	QkPqviijgmXBAi3QwGcDqP3dOK3pI4WJJl3P1Jln36CGuH1/tObfWts4/Re+qme23dTjF7o
	LY/ea1fnhScPJfKmZnSFTSo4WGnaHymq16PG9iFfI2dMU0iC77PIVyoCW9dPWwvancbEEMG
	7xSCUhmQcnukzvdjrqIcsVMvMDC3xJ8sUqb6fNWu/helTAmuhrAeIuvdeIbRqINmBtox9dZ
	E7MGV648uJLMHbxxaeNh4O3Iq6gHR30nYtRG/1UvcTjvkVHyWPDgy1xUtuWb6aMvsDByv8p
	uiezoOrLIqP9zFIpPr/wBb/uQoFQETor1f7HhhSyDJtBThbpp8pXrmBBqt4vdg+B6xGF6GA
	eFQSNgIeyZlJPARTuKWPg86g5aQ3lJ0fpQGEDINLHRo54uahYKaP5AItrsTNw0pdEWNgr50
	ljb0YREAothBonjpgvAD7fqslkISJk/4pP30mcr6R4wUOMo7sLqAOiOb/3xzg+rl+sxCgzq
	L9GkMYHypIFkwq9gtQaUTeFR4iu0gt1CM+DputTXC+gLZw/6Y3XTfvxw8AXDlJM1+V9HQjw
	ZDiBgNOMJ4f8WigeY09EqoeEHSbhMUVJ+Eo2pWkofia5CzhFuHu2kkSmOFjvEjKu3VVZAaI
	fZd6q3p1IX37k+0lSE3/N9iep+Toamb//IwvoJfq+Dooi7BN1QrKMXoQQKoqjBmQVFXjZ+p
	2G4R
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_190920_083015_F7913692 
X-CRM114-Status: GOOD (  10.19  )
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

From: Yingchao Deng <dengyingchao@kylinsec.com.cn>

tpdm_probe() initializes drvdata->spinlock after coresight_register(), but
the sysfs attributes registered by coresight_register() use the spinlock.
This exposes a window where a concurrent sysfs write can lock an
uninitialized spinlock.

Initialize the spinlock before coresight_register().

Fixes: b3c71626a933 ("Coresight: Add coresight TPDM source driver")
Signed-off-by: Yingchao Deng <dengyingchao@kylinsec.com.cn>
---
 drivers/hwtracing/coresight/coresight-tpdm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 8464edbba2d4..50d1351772b9 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1457,12 +1457,12 @@ static int tpdm_probe(struct device *dev, struct resource *res)
 		desc.groups = tpdm_attr_grps;
 	else
 		desc.groups = static_tpdm_attr_grps;
+	spin_lock_init(&drvdata->spinlock);
+
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
 
-	spin_lock_init(&drvdata->spinlock);
-
 	return 0;
 }
 
-- 
2.33.0


