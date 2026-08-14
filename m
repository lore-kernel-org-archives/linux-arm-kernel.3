Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6DAC5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 02:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SpaWK3PMgcYH23+PvWVnfKngFcknKMSYOQ44ycpckiU=; b=DaoWAosCh7B0ckNgyopyhnXYPM
	/uWqAtva/vFlVddN3ZaM0TBcEnjG5lGPxSD4WJUqRRU/o8SXrM9b6ZttoOytXvK4kZhZsz9TEms7K
	GQgGx8kSzdRKwSEXpT3bSW6d1+uYxlDzw/fKavxzV1i4D9XSpxPJIKITbt+8PW2ISqNXeR7RDYoeM
	aUWrm9v7Cu07RRKdlrf4Wuj0EDyZIRpgmrjnMy3XfkIMqFmqPkg492S4KbrHoSCI0ZE0Pa0anLE/1
	fa3TBvB0Ii0ln74Inv7sGxvNO9vcS3daa3dDiadDKp/f36+2fof/ByzQf5S5q2Oj/gszCJiXDZtUg
	b9Ftw3zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuhc9-00000001qt9-2vnF;
	Fri, 14 Aug 2026 02:25:45 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuhc7-00000001qsN-0Lrs;
	Fri, 14 Aug 2026 02:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1786674317;
	bh=SpaWK3PMgcYH23+PvWVnfKngFcknKMSYOQ44ycpckiU=;
	h=From:To:Subject:Date:Message-Id;
	b=hdckW7UAV4Iea2Y1GIXYUrE26Ga2o83CuWof38xJmmtePG3Y4RsJj4I6e4aY5Dmz+
	 AEetLUh8LbGeSXNlWrXnDbr9Vw54bOKBvsyK5r+xa1d1hQfFIuz/T/xL35GO2sCAGy
	 F7g7M3DLex4mohGdd7yFqn2Dt0NXlNMNCEdPtS9s=
X-QQ-mid: esmtpgz13t1786674307t22da9b14
X-QQ-Originating-IP: iWvQqUUAJ0olDn2cJBrjkWIkUI5jcT0zB2IYDBxM4EQ=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 14 Aug 2026 10:25:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7059625967644421893
From: Chaoyi Chen <kernel@airkyi.com>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Oded Gabbay <ogabbay@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: [PATCH 0/4] accel/rocket: resource leak and stability improvements
Date: Fri, 14 Aug 2026 10:24:49 +0800
Message-Id: <20260814022453.437-1-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NpzNf8JHXbEIlAFPEbZYU4ptVzMIIqoPmuPJZdM1OdVokxE3XKynoNBh
	K0JGxDK7C4DcEG6F5kV7uLo3Y/gKHDiCnmaCamAWk1ETvR/SqPgkK40wYeOJHl4L5tt1mne
	StFzDdUz/0GZwz10s8zGeWQI9Qpjd6qt7RIR20Xtr7vIN9nGNMwASS4nSHxKMeNk/uVtF9O
	Wegn9ZCVPmmEhjGuuYbT2IbJ9BFtJfwUBsCm21czOeFgzyYgAZrZujA5RFvr7/0dvvAB1RD
	f/5ssLliyHIsSg69t9TTL4la7riK2Tzx6GU4cGWIO29nKsGVqgw7LgPMQAtiyYwMFK2fr48
	WZ0iuW4Irztla+hJ9xUlYWP2+jVrb5xzr/dKrkcgoWFG0zHPgJezFPSycdTAK13T1CoOEyK
	GkYorjoWsJtnD8sgdT8SBu5xaAoch1gbaLDUJx17cRLuPgRKe/QTyky24HjA1ijYTSr/hZn
	oFlzpBuNJGj9ZMXDzcpOESzQv4eWqd9pcVVCjoGC8/b46mgJ2Sk2WnX/o7gS3+wO34P4aOf
	o4rHh5MMO6kt/uAFV/9jZfUxBqNdIN0X9S3HzwERfqHDci83Pen2j23Y8LsErg899N2Guit
	pET5HDVIRcl2xvoOZ2CsGJcUIFFR1yBaT8blQ9f5Aaz5MlQH/c31xPYAa3TAz7KNZo3wDIW
	LFfp/yET6c3WdfXWxYX3lM+L04QNkfO8heM8avf5owerZoT380MGRyAT9ZF1n+VOMRD/0M1
	OI8bSQyO06hXljbzovPRFIzu5ClpfIa1F6T3jJwz1klTWWWtWC5N3gBb18CwXHP/WtOn7ot
	eQvfKxGNLqB7E9htZO+7kfsSSXIel+vUU5ONNZnBL7MZlDNOQjIi1pq5adL9i5MokddQPE8
	fgQVyqBPgI/uyYeOtFBV17RMWm2DfuP/SAZV25MSaP6eB8A6cTSCyT284fDPtXAbPQk6eNK
	TRJaIUBKlPcudnbAj2r9YSTY+Bh5+yGwvTb005/JcjW/5SjjfD8xdWtuH95KedgTPZYY=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_192543_586795_DD217510 
X-CRM114-Status: UNSURE (   8.20  )
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

From: Chaoyi Chen <chaoyi.chen@rock-chips.com>

Hi,

This series fixes rocket driver handling on certain error paths to
avoid unexpected resource leaks and panics.

Chaoyi Chen (4):
  accel/rocket: Fix the IOMMU domain leak in rocket_ioctl_create_bo
  accel/rocket: Fix the panic in rocket_iommu_domain_put when the domain
    is NULL
  accel/rocket: Fix the extra iommu_group_get call in
    rocket_job_handle_irq
  MAINTAINERS: accel/rocket: Add rockchip mail list for rocket

 MAINTAINERS                       | 1 +
 drivers/accel/rocket/rocket_drv.c | 3 ++-
 drivers/accel/rocket/rocket_gem.c | 2 ++
 drivers/accel/rocket/rocket_job.c | 2 +-
 4 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.53.0


