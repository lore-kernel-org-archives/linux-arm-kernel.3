Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF6DCD8C85
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 03:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xoeyoz5Vxaas+vev5ySBjxdxCFmfC++QibmT/yufOhk=; b=dn8+FCT0Ui8lcJAv08ruupsXwF
	bW9p+jO+Av8f5QqbPemYJpKAhf21Asv931hp7SMvjIHmCAaylm2h+Topo9IvgvgvGkJrEWbUdtvR0
	bPbj1w+Cy1RH45oApVan6pTV1psnu9S58qVv6DDRoB68lh7yFOzlho5G4UZAfo7H92NdEFhbUUCLc
	AATCONPc2yZ+oCkEmenGZFzZ3X6w8kX08TxxR1pyqcK+uhinJQmM2rKw0kTvof2HQDITm9/qF5p0/
	kcOThbt6cCUly1Avsq7hICzy8ZdSCFgkk261MyZvEo14XSs3nYO4Msq82PTttg/Rq1w/K+XeIuxvb
	krkKXZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW3tv-0000000204Y-0mOk;
	Sun, 07 Jun 2026 03:10:15 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW3tr-00000002042-158G
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 03:10:14 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAC3m+IG4SRqr1_cEw--.13317S2;
	Sun, 07 Jun 2026 11:09:58 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: wens@kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] drm/sun4i: fix refcount leak in sun4i_backend_init_sat()
Date: Sun,  7 Jun 2026 03:09:50 +0000
Message-Id: <20260607030950.83636-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAC3m+IG4SRqr1_cEw--.13317S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF1DuF15JF17Ww4xJr15twb_yoW8GF1xpF
	W8GFy5ArW8Ja4SvanrAry8XF13Za13GF98GwsYya1rZwn8JFy5urW5KFyagFWDKF4xA345
	XF47Kr4Uu3WDAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9a14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7
	v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF
	7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026x
	CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
	JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
	1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_
	Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8Jr
	UvcSsGvfC2KfnxnUUI43ZEXa7VU1eWlPUUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAYLA2okN2X5sAAAsX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260606_201011_699244_54F5AB26 
X-CRM114-Status: GOOD (  11.32  )
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

When sun4i_backend_init_sat() calls reset_control_deassert() it
increments the deassert_count of the reset controller, and must
pair that with a reset_control_assert() call to decrement it.
In the error path where clk_prepare_enable() fails, the function
returns immediately without calling reset_control_assert(), leaking
the reference count.  Other error paths, like the devm_clk_get()
failure, correctly jump to the err_assert_reset label which performs
the missing assert.

Fix the leak by using the existing err_assert_reset label in the
clk_prepare_enable error path instead of returning directly.

Cc: stable@vger.kernel.org
Fixes: 440d2c7b127a ("drm/sun4i: backend: Handle the SAT")
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/sun4i/sun4i_backend.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index bc35dad53b07..c9ec5fc26f7e 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -686,7 +686,7 @@ static int sun4i_backend_init_sat(struct device *dev) {
 	ret = clk_prepare_enable(backend->sat_clk);
 	if (ret) {
 		dev_err(dev, "Couldn't enable the SAT clock\n");
-		return ret;
+		goto err_assert_reset;
 	}
 
 	return 0;
-- 
2.34.1


