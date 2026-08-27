Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91302C5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 06:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fUy6kCIkwnCoeeUKI72N3P2aExSG/i/QbyxvbE4Vip4=; b=uljrW7zpx4RDHr4s3EcTQH90AN
	usJi95qeqnux7nvv7jIOIRuOurZxniiEL/8T1tMWhRlJizDLh8lbITftIh5e8Po9XmCwDwKMGagxO
	7azvibZdHLdpPDtlxBdbT5AMlpA681sirKJUCVfeZy3QhthdH9uGu8RACq4B+/DSgnCNmClJ0F0vZ
	HSLWtP+tBYNnYqYkjWPs2y5lR2VtBdoWWVH/BSgTUyukhRHtNp9jyFympHDSS/Apoz87ryu6G1pkF
	SVuQsNWDJqDc8fETSdi5l7eutpkyB/iESzn/PrMMJ+4GfMnArto7GllfhVjdQJAMmNFeGhkOrC1qx
	/0nFb/OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzTe3-00000003UA7-2FW4;
	Thu, 27 Aug 2026 06:31:27 +0000
Received: from smtpbgsg1.qq.com ([54.254.200.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzTe0-00000003U9C-0IOm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 06:31:26 +0000
X-QQ-mid: esmtpsz20t1787812230t591c1c45
X-QQ-Originating-IP: Zqc5Xjwkq0I5LO6JE8j/1Sdq6iru3r0BaEOLrkUubYs=
Received: from localhost.localdomain ( [111.8.45.130])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Aug 2026 14:30:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13255790985149150608
EX-QQ-RecipientCnt: 10
From: Liu Dalin <liudalin@kylinsec.com.cn>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linusw@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Dalin <liudalin@kylinsec.com.cn>,
	Deng Yingchao <dengyingchao@kylinsec.com.cn>,
	Qin Yungao <qinyungao@kylinsec.com.cn>,
	Luo Qiu <luoqiu@kylinsec.com.cn>
Subject: [PATCH v1 0/3] rtc: ftrtc010: fix resource management and integer overflow
Date: Thu, 27 Aug 2026 14:30:16 +0800
Message-ID: <8C319CEAD84EF35B+20260827063019.3342085-1-liudalin@kylinsec.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827021054.0963C1F000E9@smtp.kernel.org>
References: <20260827021054.0963C1F000E9@smtp.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NyMcZNLslEFVN2hywhQ5lbXEjSbYI7YF3lRiDgS5tk/vdFSgrAUzoxti
	/JJb2iKwJESCksZwGcP60Y5cLda+soEjIbCr7N53WAdLYKYyB/8NDUzfQaaW4m8td9gZmVe
	tJUNuDCEIo8/f1ck+rI7yX3YHrLrslsmwQTjYofeZx7mDDZum96hIwqUkXBKdUprcGsQhBh
	aopaclyu28W/FIo/7723WXCPuWm0egTCFEvqqtnnTfD7TtX5vSC7nEQAhGYGb7K9U8KXuZJ
	HWLODf6+VebPlA28EdkgEEMSR26ULxMxooHjlEeQtuqt3Fv5N1hjfuJWxvGlWjBw7r/xNfM
	glpTDWt4lmcUL40UElgva9Orp5ByKuL4OH0Vb16nPMM0ChTQpEKOQbRS/S5tnhEZ0oq2CYc
	v2FRRTeC2MbZfueNflIprENpIzqXH0juvGmhx4yYqQFA6b5SFOmbEgvMbHw3VBTARkWCNq3
	TucOwKxEEgLv1SV4mzunb/fe6qmeE3tnHotMxwULcA20rqFAab2b2UVwEMMcSz78HbNPKYx
	YyW+TxFSqz7apKh943Ga/PFWsWjfKrL86cgufvjc8AdrqXik0kuHe0yZT53b+Sb51RwooNw
	oF18CuzxEpuDx5ezazkjjRlXMshuruJ6R9EsBWEbEFa1n1yPTOmINftaPQgsgRwVlq/nI92
	bTqJkI0y8YDkwaF22Y5csc6+h+OFs8DWsAWkOHnIAEYNYcF2nmqcNT5iyVrpOV7I1TXhhL4
	iVIfk5LdPA+Thm3NFSF3xdz0UYEa/+h5Vw3d6l2fYyAHats3maOZUBpWlUoIEZNIMeUI8ri
	79yVJH3RGm8nzyw2s+FywzbVCHhQuQ0zSzPRRNIt9eSBhvKDQQ8gfsK2KQB1FudvdIh0BMp
	0GF8YBS7yAbCAd4OsfmeV/14YexydTaDvzfdvVNGsEB4vyiJbGAw3DH9sw77QrQg9PQ7vek
	tkaQXNjkC2g1Snxqx2AP1S6jKkN7XfTjPcyp9/i1TwT7fhHlwXe2/ehDTQt+Pt8K8IYGIwS
	DiOtdIH1RseG9Ckz/QYdX7BcoXvsP6iykm4d1LUEaWK7w3ZBeZxOlqBSIjv5ZGkGXcT9+Lr
	vyJOQ9+eE5HEkFkN+lqpuI=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_233124_496294_0EEC33C8 
X-CRM114-Status: UNSURE (   8.40  )
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

This series fixes three issues in the Faraday FTRTC010 RTC driver
found by Sashiko AI static analysis:

Patch 1: Fixes a clock resource leak when devm_rtc_register_device()
fails in ftrtc010_rtc_probe().

Patch 2: Replaces manual clock management with devm APIs to fix a
use-after-disable vulnerability in ftrtc010_rtc_remove(). The RTC
device is registered via devm_rtc_register_device() but clocks are
manually disabled in .remove() before devres cleanup, creating a
window where MMIO reads on clock-gated hardware can cause a
synchronous external abort.

Patch 3: Fixes integer overflow in ftrtc010_rtc_read_time() and
ftrtc010_rtc_set_time() where u32 arithmetic wraps for dates
beyond year 2106.

All three patches are based on v7.2-rc2 and have been verified
with checkpatch.pl --strict.

Liu Dalin (3):
  rtc: ftrtc010: fix clock resource leak on probe failure
  rtc: ftrtc010: use devm clock APIs to fix use-after-disable in remove
  rtc: ftrtc010: fix integer overflow in time calculation

 drivers/rtc/rtc-ftrtc010.c | 72 ++++++++++++++------------------------
 1 file changed, 25 insertions(+), 47 deletions(-)

--
2.43.0

