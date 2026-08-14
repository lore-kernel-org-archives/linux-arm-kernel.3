Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAD6C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 02:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05fYjb00YYXJ31+phLSkqPQi+wABn/rqNlkF5fHNFZ8=; b=CrAYbnk8mSiBQNR96sCfflx/VI
	RB6lgJBMt/gNLKNiM6c3C4/r5X7bptazsodq7rdQdGhTbcawAx2thH56On9S6faMnruUPIC2hTPEZ
	kN1Sw3aPsUVf9NjLWD+DDYF9Grn18QoSjODY7s5siP4/p8H1TejTxQjZthXxo9ypA11b1DuC3ZOPq
	Xx/Ghhsx39RliurIKGAxCu3NN+rpa5NCTU204Nb0MEFK3EN9E03Lkfx60BW2sNnP4Fudlkm28/nkt
	WGqOxWyn773d9AFAj0AIEZ+WN5OUl9WYW2vL5x/HS4PZIhbCSCcrAz8fMjLARQaN2sohYr0+BLf3+
	W+NljkBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuhcR-00000001qxO-3fdD;
	Fri, 14 Aug 2026 02:26:03 +0000
Received: from smtpbgeu2.qq.com ([18.194.254.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuhcD-00000001qsU-2INk;
	Fri, 14 Aug 2026 02:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1786674320;
	bh=05fYjb00YYXJ31+phLSkqPQi+wABn/rqNlkF5fHNFZ8=;
	h=From:To:Subject:Date:Message-Id;
	b=Ayg2j/u8FPvn549nWWSRSiWFs5ivamzvBnJ51ppvO/9rD3xjw44bMeNCzT+/pBkKK
	 E3iMPZPwzP6j9edqXS19Cjbla/rjZc6JaRkqIrmcnLehIWar4VWSmHDd6WW1J/2B2d
	 9fu08lRr+7bvbmfFXgFt4ScIJYvIeIoj5y5qr8w8=
X-QQ-mid: esmtpgz13t1786674312tab322716
X-QQ-Originating-IP: 4bqnD55VqWoLJQzWwMaI0Eywi9ybW5lEk3/kjTWN/vM=
Received: from DESKTOP-8BT1A2O.localdomain ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 14 Aug 2026 10:25:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4802896716217213205
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
Subject: [PATCH 1/4] accel/rocket: Fix the IOMMU domain leak in rocket_ioctl_create_bo
Date: Fri, 14 Aug 2026 10:24:50 +0800
Message-Id: <20260814022453.437-2-kernel@airkyi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260814022453.437-1-kernel@airkyi.com>
References: <20260814022453.437-1-kernel@airkyi.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MbYyxy1Fep3Pj+UY4JV1dG8p4VtqC9gMYBVZz+li+uKhqy5kVO9qNBMi
	oGgcABFbN1HEf7XpHrBghxEeNVak2WZYJSXUHyXGZhgW+HyXTGlobnvR/2GEBgZqKYrDmzG
	Qd5o1ZFguNdgBDvYNpMldeG+sch2yjN67T0VfGS6HvL48wraXGJrC0IzIRvPgCgTDKNATI9
	kFU2/4sIzSSfhT/C7wzxhfRMTsbYPat8heBrhbWoSl7MBhZCE/YB5vWJhQy108XzNtGxECV
	C5CDskUWb0lmAA1G/ypy2y1vR/3Dk4DuxjyUYQKpYLPe3vWEA9Om1kzpY7Ms0WMCzUPb5qh
	CDg47DEAVnVjLaI0VTVH3wzvitkMy9pyDutTO5TEqxLi2kMPEdPE7SxoXIyyLPZC1VYQY6V
	xeLZu3B57otVVMcFCNxfJmHr7kR7oxckeicSC303fVD1CCoiTiwfgwMNPbPDFEv4O9f+k7R
	HtajO7DS192xmtE6e1kmQcQpnJKlXnhDSoxh4JgwP1TebOvbuEgu5kcgRoMOMuvsM0kEkiM
	P/JekH8KbckiK9N6BC9dY1vEgQqv4ZL6YQxZ25mstECHVm0+kTFPsAo4nccE9iBwUCPsrtf
	dJqOn+ffJaVAjNvN2KKbNJvaZb2/WGcHRkeuVxMI+EguZQceWq89v4yul+r+G54KM6+PzpZ
	Mvi0AAyFszDgRJZ2kODDtgDFf24KD2TyXQENxrUuWq7bHyK96iYF+2UTyVkWAOoYAB2gFGG
	ZN50cEbIkOl99UFd++ZFS3BorQowk1gQ7Vlt5pa3LsQXgAQGBiPwvvhiGA9KZLXhuFOLx+9
	NSlZXnhZmUCG5hRjecfQe6VmDVy4/F6YEZoqEaMhkhdJ5WgtEBZKeZrE0nc+Ja/Qz8AWbq5
	DzinlHJZVOvyDrDDoEJt3wnMoSALGGSku6y2uQGYvxeDhwCgEiHYBSYpr5m/tQDVtZF9J9b
	2IDeDJjt9SkvlO40DrbIq95+i2Ged6SBdgyerVTohUYJTeauYYeFAKyLBr/TLFeh4lOPDTx
	kaOpQfClD0pYBnkjc7
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_192551_934125_C8DD8BB8 
X-CRM114-Status: UNSURE (   8.07  )
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

When rocket_ioctl_create_bo fails, rocket_iommu_domain_put should be
called to avoid an IOMMU domain leak.

Fixes: 658ebeac3351 ("accel/rocket: Add IOCTL for BO creation")
Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
---
 drivers/accel/rocket/rocket_gem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/accel/rocket/rocket_gem.c b/drivers/accel/rocket/rocket_gem.c
index a5fffa51ff35..438694ba567b 100644
--- a/drivers/accel/rocket/rocket_gem.c
+++ b/drivers/accel/rocket/rocket_gem.c
@@ -127,6 +127,8 @@ int rocket_ioctl_create_bo(struct drm_device *dev, void *data, struct drm_file *
 	mutex_unlock(&rocket_priv->mm_lock);
 
 err:
+	rocket_iommu_domain_put(rkt_obj->domain);
+	rkt_obj->domain = NULL;
 	drm_gem_shmem_object_free(gem_obj);
 
 	return ret;
-- 
2.53.0


