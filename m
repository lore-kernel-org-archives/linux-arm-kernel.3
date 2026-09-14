Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906B0C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Uv9d1Zj6vtBThyBE8YU6Rfshg8S2/lOIiKzoGkCTkwM=; b=PoBXcIdANGF9Z5gMjJIxrSdfjJ
	lAVMPXIA618O+rdMBwJKmkSJ19SXERTLsoHjBlZVNswWXRgwf7cx7ztRRe0V17YfhcWdGF7rgkMs9
	skP2w6Ptc87v5GVflkXsPjlRW7/kyp57VOve2GkHzhgoxcO/ixrveowNlLrQ935AeG7EtO+hiIECx
	ACBKf9DS18S586KnxXIRH8Xo7vwB7eYRr5aeWprZTZZf0252PvmgOr6gbNFXIfdSW7cqygotD4syP
	eh9wcxt4evIrpo54DmahvBrCgi9UsaRVLQMKnmlex7+n1cNI68CA+Zji5pwJ8pq4ff28ZSgysJU9o
	hMIA0Iow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61Qm-00000002cLp-1KOI;
	Mon, 14 Sep 2026 07:48:48 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61Qd-00000002cJQ-46b8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:48:45 +0000
X-QQ-mid: esmtpsz11t1789372072td29db936
X-QQ-Originating-IP: a25r7OdHgSwUV56NjAw63Rnel8ssIsZih28fCd7k0+g=
Received: from localhost.localdomain ( [175.0.204.93])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 14 Sep 2026 15:47:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12824370477255619033
EX-QQ-RecipientCnt: 10
From: Yingchao Deng <dengyingchao@kylinsec.com.cn>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dengyingchao@kylinsec.com.cn,
	qinyungao@kylinsec.com.cn
Subject: [PATCH v2 0/1] coresight: syscfg: fix deadlock on device registration failure
Date: Mon, 14 Sep 2026 15:45:24 +0800
Message-ID: <B16F90D29FAA2B3E+20260914074524.1694-1-dengyingchao@kylinsec.com.cn>
X-Mailer: git-send-email 2.45.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz5b-1
X-QQ-XMAILINFO: MOL6Ei/hP4VXag/PsoZ/x9ylEMqNy2KV/bQRQPx1eRU4QGhXZFYqsifn
	HN+ICQeqUZunzZzBdi+yM08xvIb5997GOUb1EZCri8vU8hcMvJae9OB55w12FZKzypnTH4o
	KQrGFTudbdPJYqTlW4uIeUMbs3z+MuLoZlKZj/Mo/paJX/889uXWuw+y9f8+zbbuqKDhATB
	9KesZ9FBhlSGYsH3lL6vBVCZtdxiEPM+/S1kKI6zA0Gba9X3CZO1OJV50FiRzvwdhkYzEE2
	FrGf7I7c+eSZQfq7WZNYPldgUkG0oHg+GHIixIhfTxJzckf7PqJJtn0KU1/9tV7mSqc3S/J
	ck+BUJh9M+PU6JuTE2JLc0y0iHD211uXMqPGIOE0mNi50rk2nkgs/dizx0vo58Ezxdhp44s
	vdqlpTOwEzP6G1LYBvaKtdxURWL4e7no5axlhWvq5X7H61Kcm6R/bfye/Q/kTtBs+gOXXhM
	Rc+bHH4Qb37j52/cl+25mglJpos4dduqhb7cE+9XCUM0uxGtJs10gdxcjG0N1cFE8gw6nDn
	g5JO/NMn4MeLcooVs7UClwvNKucalB76+/KEfl+QsLb/eNHwbBZt8wYl0PbmW5EAoCr6z4d
	MYKYJ9gcpkEbI4YW3uvwi0gSVPMg56zWNuOm4lqOoL9COCcGgh+Kghrnc8D42a+C3EWj3iR
	pettlIH1u5KADA9tcUesXu49jvJr/3Bap9meWhMXpCcPyGUVMJQaRal5MLoJEe3GzwiJoeP
	wyi0YY2OJUm0Rr3qxD4Kmia2BvGB7PV6/ebRvsoSvuFpnPegH4qi9FI6YF9rRQHk7WfOX6M
	x9klzb+xU7pakxB2zAmDd47EW1IZZnORHdKo+hN7U1sPX4V83czjHXyYPzzeFgdxH2zR8OQ
	RQcTn8wFaYrEP7k1sw4wHgOJlqdTlDFmG1Ez51dpszYyQdXg/SP9IfxFuYRfEIFKZHOMrtC
	opDbpYZSX/2VX0cEwqdDtFvXTmP4bWs91i4QqiQF1jAsIUJucOUo7C0bgbOGA+XPBkvmLyI
	QYvsdESRggpw8TCxDbvJCv6Bjfyb/cg+aNYqxOnXa+LjluY1XXe1ykwubK3Zw4UEPZM+IaZ
	3HdBU/vPSPYgV5sXRAaAOWQ3Utzmj6llKZ7Seb1mzo0nRFrpQXoMmHQ40xHeY+XdJAfAmU0
	BeQcut3PbZk7ajduwznVoKa4wEXvijK55Dgsm4O5HW6P1fVGqUvv1umsSDApn5S86kdT
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_004840_477007_636236A4 
X-CRM114-Status: UNSURE (   6.46  )
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

cscfg_create_device() calls put_device() on the error path while holding
cscfg_mutex.  If device_register() fails, put_device() drops the last
reference and invokes cscfg_dev_release(), which takes cscfg_mutex again,
deadlocking.  This removes the unnecessary mutex from cscfg_dev_release().

Changes in v2:
- Per Leo Yan's suggestion, instead of unlocking before put_device(),
  remove the unnecessary mutex from cscfg_dev_release() and take it
  only around cscfg_mgr field initialization.
- Links to v1: https://lore.kernel.org/all/604ED754D4669F40+20260825014717.2346-1-dengyingchao@kylinsec.com.cn/

Yingchao Deng (1):
  coresight: syscfg: fix deadlock on device registration failure

 drivers/hwtracing/coresight/coresight-syscfg.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)
--
2.33.0

