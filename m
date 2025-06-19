Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686B4C71159
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 06:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQuZyiWeCRjabdZVDuZoBt10hOs5O7/FEjTfFH0/Tqw=; b=GxflKWoIsQ0omYtXYO7v4TF3t2
	AKhMbpYzo0gGIfj+bMU+xVAOVO6K56cGKUHZl18A0LqSYLIHW8/PD4hUYJNUcjJ08fKTDtAcLvcVx
	e7BSHNGIpRk7hVDi3USDxQuY7R3r5c33EGYYT3BhiRXaEbIc8IvsA+PgrYKrWQXrdZeQf+GSw1Csb
	mg8Y8LdtsRUiowbcQDbxK1cX1aL4jsXGnF7inmm7KsHZLt0kLQ0Y5O8TZlTanoXHOiDlOKd5O1wDF
	S4AgsCzj4Nnt/QT4ZR4laf++Dto/oIUCQfqvzVBFlnTyjS/w9mt/gEeXYak/WEVT9Ml2cd82pGE+z
	YHtX4fcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS9FR-0000000CEm6-1sEJ;
	Thu, 19 Jun 2025 06:59:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8wE-0000000CB17-0CGF;
	Thu, 19 Jun 2025 06:39:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qQuZyiWeCRjabdZVDuZoBt10hOs5O7/FEjTfFH0/Tqw=; b=j12YB8LsuDewuu808BjdVySaqR
	RF9b/7vfFQ/RH/kM96n+Gvm0R8nFVuQI7KjgLWlrahBadTO05jLjGu7i3/v7uQ7DgHxKRCm7Eb69v
	JpoHGujw5HPsJJH54SQzj9nqLgDoRVaVdHSIumG45K7nrPh45QLdV6lJVcd3UvsmjKjBx314Kl8dq
	x3I0MNnUMyMALbxw+4XhP6OeriMml4+RydQArdQBIWMDdrCaSc62Ijyqp4Ggg0KUq/xFV0HdbY4ks
	MyV+o7gZbIYDsQV8aBTiONkx034eXBRX7u0gLMTQNpAytqS9M72nJRCMeGrE9VIF8Tj6hzqQf4gbI
	oHaBcu/g==;
Received: from m16.mail.163.com ([117.135.210.2])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS8w8-00000004Meq-48Mo;
	Thu, 19 Jun 2025 06:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=qQ
	uZyiWeCRjabdZVDuZoBt10hOs5O7/FEjTfFH0/Tqw=; b=HXI3dMh0FpbqJwvqhR
	PeFdZbM2IsA5Np0pzXCjHfFFmq+UyI153b1fsZryddFqV/luSUkZnWZKSKUx+/T3
	xvrH3inYjeP87gdWUmV8nlDARfCIBJoWdwrGevn8JUv2v4NGh9ode21LCwIupfka
	9/+4XrfHnrzP/l8EzYLHXjRKQ=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD312OGsFNoUtqyAQ--.3973S7;
	Thu, 19 Jun 2025 14:39:14 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: hjc@rock-chips.com,
	mripard@kernel.org,
	naoki@radxa.com,
	stephen@radxa.com,
	cristian.ciocaltea@collabora.com,
	neil.armstrong@linaro.org,
	Laurent.pinchart@ideasonboard.com,
	yubing.zhang@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v4 5/9] drm/birdge: simple-bridge: Add support for radxa ra620
Date: Thu, 19 Jun 2025 14:38:51 +0800
Message-ID: <20250619063900.700491-6-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619063900.700491-1-andyshrk@163.com>
References: <20250619063900.700491-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD312OGsFNoUtqyAQ--.3973S7
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gw47tr48Jr4ftr4xKrWUtwb_yoWkZrg_uF
	nakryUJr4rAr95KF43uw43A34Iv3W8urZ7Wr1vgrZxAws3Zw17u3srZr95Z34fAF10kF9F
	y3W3JFWayr17ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnbAw7UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqBZxXmhTrfVbHAAAs1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_073949_654384_D51ED921 
X-CRM114-Status: GOOD (  10.81  )
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

From: Andy Yan <andy.yan@rock-chips.com>

The RA620 is an active DP to HDMI converter chip, basically
no software is involved to drive it.

Add it to simple bridge to make it can be find by the drm bridge chain.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

---

(no changes since v3)

Changes in v3:
- First introduced in this version.

 drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 70db5b99e5bb8..df2d8106ee755 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -261,6 +261,11 @@ static const struct of_device_id simple_bridge_match[] = {
 			.timings = &default_bridge_timings,
 			.connector_type = DRM_MODE_CONNECTOR_VGA,
 		},
+	}, {
+		.compatible = "radxa,ra620",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+		},
 	}, {
 		.compatible = "ti,opa362",
 		.data = &(const struct simple_bridge_info) {
-- 
2.43.0


