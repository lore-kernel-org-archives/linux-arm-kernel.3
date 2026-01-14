Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63789D31A2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 09:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajKHfaO4v+1muKcNvPZwHjUhxqRRpkJ79ZJEwkyEG/g=; b=lOwShOmm/eht8dS+oGhBL3kns8
	FOV3T78+zZeii4vGlxRfvU9QUjcTxTEykGg3XPAuc6Gpn8Lv6M+yJfOyjdEBdpILHz6KdXz1Z5HLE
	yp+GQBoDHFO5LQw60Ae1K5KqF/kNsPpMwouTwJ1U+CrDww2oRjbrWuYpXMHktUzWPDrIrlGSDwCkz
	ulPtz8GtfYEQ3A4Wa9+H0QuVJn1JzyanDZThTppTs5Q9Xns088PNv+Yf6hKxpBwPJgOvMo5gSSJdP
	66A5PI6czu/+aBlzPPW4T86qmsE4BjrAtJY2eXIBMPfanBkfkYysLRtStUDtK5KV0YKQ39RS1DUpS
	CrPI2zYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx2r-00000008V5r-1Jwi;
	Wed, 14 Jan 2026 09:20:05 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx2a-00000008Uvy-1aY5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 09:19:52 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4drgY040wrzYQtxF
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 17:19:16 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 0A7F440576
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 17:19:30 +0800 (CST)
Received: from k01.k01 (unknown [10.67.174.197])
	by APP2 (Coremail) with SMTP id Syh0CgCXsYCfX2dpDhLdDg--.16789S3;
	Wed, 14 Jan 2026 17:19:29 +0800 (CST)
From: Xu Kuohai <xukuohai@huaweicloud.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Yonghong Song <yonghong.song@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH bpf-next v4 1/4] bpf: Fix an off-by-one error in check_indirect_jump
Date: Wed, 14 Jan 2026 17:39:11 +0800
Message-ID: <20260114093914.2403982-2-xukuohai@huaweicloud.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260114093914.2403982-1-xukuohai@huaweicloud.com>
References: <20260114093914.2403982-1-xukuohai@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Syh0CgCXsYCfX2dpDhLdDg--.16789S3
X-Coremail-Antispam: 1UD129KBjvdXoWruFy3tw4UXry8tFyxAFy3twb_yoWfXrc_G3
	yrXw4DWws3CF4fZF13Aa47Wa4j9rnYgFy0kr12gryDJryqq34v9r95GF95ZryDJFZrAFZx
	CrZxWrZ0qr1fZjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbvkYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r18M2
	8IrcIa0xkI8VCY1x0267AKxVW8JVW5JwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK
	021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r
	4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
	0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxV
	WUtVW8ZwCY1x0264kExVAvwVAq07x20xyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
	AF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
	IxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
	CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
	WIevJa73UjIFyTuYvjxUI2-eUUUUU
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_011948_597866_685AB97F 
X-CRM114-Status: GOOD (  11.61  )
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

From: Xu Kuohai <xukuohai@huawei.com>

Fix an off-by-one error in check_indirect_jump() that skips the last
element returned by copy_insn_array_uniq().

Fixes: 493d9e0d6083 ("bpf, x86: add support for indirect jumps")
Signed-off-by: Xu Kuohai <xukuohai@huawei.com>
---
 kernel/bpf/verifier.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index faa1ecc1fe9d..22605d9e0ffa 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -20336,7 +20336,7 @@ static int check_indirect_jump(struct bpf_verifier_env *env, struct bpf_insn *in
 		return -EINVAL;
 	}
 
-	for (i = 0; i < n - 1; i++) {
+	for (i = 0; i < n; i++) {
 		other_branch = push_stack(env, env->gotox_tmp_buf->items[i],
 					  env->insn_idx, env->cur_state->speculative);
 		if (IS_ERR(other_branch))
-- 
2.47.3


