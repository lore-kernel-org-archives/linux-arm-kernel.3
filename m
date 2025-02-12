Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985CCC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 14:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nT92zn6BedOGtQZeUS/4wxG1L3PZtN6lyNr+8MNq5Lw=; b=UaxjBZCFkGUr+YM9KfTwdssrjP
	d+K2cgaJv6rVM/DqdkKrqOtDl8a6yxHv6fw1DccWaSxIprk2H9vHnLqLWmIow+QtId2WAsERv210K
	HdExmEXj00NMjWVnp2McjeVJPm6P65qQ5iSWiSDsLmC0/XzzPbRJPtVHKWJisdZTBBMrKteQrZtGE
	BnYJV4CcHk9WERZdeWpad4W9uF6RauHlhFnPbSrmCPiYZvLLdSWBLNOt+h5MZVMyX3t/h+Gl2W6Gm
	mFfmNqDWgKeVstHpRHNP65+oVOzM0tN6zTPagdaygF4hQXj6+snd5khzK7Wmo3/GOu51mPrJDc/Q5
	ZVbEyZrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiDbH-00000007eDS-0e4a;
	Wed, 12 Feb 2025 14:20:27 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiDZq-00000007e2d-0Q2z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 14:19:00 +0000
Received: from localhost.localdomain (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAD3YMrEraxnexx3DA--.41351S2;
	Wed, 12 Feb 2025 22:18:46 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com
Cc: UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH v2] net: microchip: sparx5: Fix potential NULL pointer dereference
Date: Wed, 12 Feb 2025 22:18:28 +0800
Message-ID: <20250212141829.1214-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.42.0.windows.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD3YMrEraxnexx3DA--.41351S2
X-Coremail-Antispam: 1UD129KBjvJXoWrZw4rAF47Zw4xWw13KrWDtwb_yoW8Jr13pa
	1DuFy5Ww4kArsxG347Cw48Xry8Xan0gF93WrWrCwn5ZFnYqrZ3Xr1rCrWF9ryFqrZxGrnx
	tF4Yva9IyF1qyrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUb8hL5UUUUU==
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwoLA2espowP7AABsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_061858_509721_88782E7A 
X-CRM114-Status: UNSURE (   7.78  )
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

Check the return value of vcap_keyfields() in
vcap_debugfs_show_rule_keyset(). If vcap_keyfields()
returns NULL, skip the keyfield to prevent a NULL pointer
dereference when calling vcap_debugfs_show_rule_keyfield().

Fixes: 610c32b2ce66 ("net: microchip: vcap: Add vcap_get_rule")
Cc: stable@vger.kernel.org # 6.2+
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c b/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c
index 59bfbda29bb3..e9e2f7af9be3 100644
--- a/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c
+++ b/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c
@@ -202,6 +202,8 @@ static int vcap_debugfs_show_rule_keyset(struct vcap_rule_internal *ri,
 
 	list_for_each_entry(ckf, &ri->data.keyfields, ctrl.list) {
 		keyfield = vcap_keyfields(vctrl, admin->vtype, ri->data.keyset);
+		if (!keyfield)
+			continue;
 		vcap_debugfs_show_rule_keyfield(vctrl, out, ckf->ctrl.key,
 						keyfield, &ckf->data);
 	}
-- 
2.42.0.windows.2


