Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F319CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vRx3h5S4vdCU29hAY4cFbic3zrWjJd6mvnSrDBJT+9g=; b=DLOpAeH0Gnuknnkqdagq7ucFUP
	ws7I4oVXOj956fiM3NhDPLFWi0WD4f26FMjfWmRTStaSBIfsd5+QA1fdY7DskMNCZPC+FemJiTjXw
	NNFjo6ZCIbP7zoTpLTKR+XgiTAoSD0fczvjEzMqQ4t7sH3AMJU8mO2KYAj1k8pNPiujCqN2ozh7zp
	egxV0PiFj97rqglMKfer3eURJfHqC1zFSR3LJLFPsE3HBLZ1/Ss/71ma/82snpZShWcsMRO/cWy/J
	XaS08wzPFTx/zvjXi0GGTyeX1MvaPOHB8iHAlG6PjR9uRHkUrXr15RQa2auPNVjONsuYrMlQVggiq
	b2chpZhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXpw-00000000CF5-1gM6;
	Wed, 06 May 2026 08:42:32 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXpv-00000000CCp-02Hk;
	Wed, 06 May 2026 08:42:31 +0000
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-05 (Coremail) with SMTP id zQCowABn9Qjn_vppWvGIDw--.2900S2;
	Wed, 06 May 2026 16:42:16 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hverkuil+cisco@kernel.org,
	laurent.pinchart@ideasonboard.com,
	p.zabel@pengutronix.de,
	benjamin.gaignard@collabora.com,
	nicolas@ndufresne.ca
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH 0/4] media: mediatek: vcodec: VP9 slice setup cleanups and fixes
Date: Wed,  6 May 2026 16:41:59 +0800
Message-Id: <20260506084203.202882-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowABn9Qjn_vppWvGIDw--.2900S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF15Xry8ZrW5JrWrJw4UCFg_yoWfGFb_Ga
	92g3WaqryDJasF9w4jgF4YkFWxWFWrKF4UtFyktr47J3s8Jr45XFsI9F9agrW0van2vFnI
	yFn8Xr4rJr12kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [36.112.3.223]
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiDAYRE2n4q3ICVAABsX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_014231_433652_193FFAD3 
X-CRM114-Status: UNSURE (   6.73  )
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

Patches 1 and 2 change the signatures of two functions to void, removing
the now-unnecessary return value and its associated dead error checks.
Patches 3 and 4 add missing memory release operations in error paths,
fixing resource leaks.

These patches are carried out under the guidance of Nicolas Dufresne.
Thanks, Nicolas!

Haoxiang Li (4):
  media: mediatek: vcodec: remove redundant return value of
    vdec_vp9_slice_setup_lat_buffer()
  media: mediatek: vcodec: remove redundant return value of
    vdec_vp9_slice_setup_prob_buffer()
  media: mediatek: vcodec: free working buf on error path in
    vdec_vp9_slice_setup_lat()
  media: mediatek: vcodec: free working buf in
    vdec_vp9_slice_setup_single()

 .../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c | 29 +++++++------------
 1 file changed, 11 insertions(+), 18 deletions(-)

-- 
2.25.1


