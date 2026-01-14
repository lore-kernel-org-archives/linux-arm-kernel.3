Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A6DD31A2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 09:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C9UsPNhaUIqZZ/dw+E7rDcDC0ysdFlGwYebz760E12M=; b=kQ6W5kn0wK6iuJiZdyhq+U8p5p
	3akVHKbljPuIhpgL2vBiCgp7JILie+OWwMRiMZojqXlY+jXWMGdD7mp1ZEo3PWcbYOjVQyiAWMEgZ
	biN9VpVu6C6qvQIXDJiVWO1zG4/H/7DVHA1WWxVT53E623C/iFlcF0UORAblr/Rukv4sUIy1vs5+Y
	lKTdhwFAflUnVetoQm58QYpqvMA/tth8S1pzfLp9B/bKCKUIrNX7DmREAeuofdLvAdX9RRhTWRyoA
	axOTCyxZ8HzAzYdkEaAxU6mlmhUjF/1X/LaS57A2bhGtCPWr+jaJyl+T2bqS9DDypPHZs68dX5qoU
	nKVibLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx2f-00000008V16-1a7A;
	Wed, 14 Jan 2026 09:19:53 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx2X-00000008Uwp-0Xck
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 09:19:50 +0000
Received: from mail.maildlp.com (unknown [172.19.163.177])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4drgXG0ln9zKHLy2
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 17:18:38 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id EBC474058F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 17:19:29 +0800 (CST)
Received: from k01.k01 (unknown [10.67.174.197])
	by APP2 (Coremail) with SMTP id Syh0CgCXsYCfX2dpDhLdDg--.16789S2;
	Wed, 14 Jan 2026 17:19:28 +0800 (CST)
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
Subject: [PATCH bpf-next v4 0/4] emit ENDBR/BTI instructions for indirect jump targets
Date: Wed, 14 Jan 2026 17:39:10 +0800
Message-ID: <20260114093914.2403982-1-xukuohai@huaweicloud.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Syh0CgCXsYCfX2dpDhLdDg--.16789S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy3uw18Jr45Cw1ruryDZFb_yoW8AFWrpF
	W8Gw1Ygr4v9rWfXrZxur47C343tws5J345urs7Aw4fCFyY9ryvgF43Kw43WFZ8JrySkayU
	XF4a9F1ruryUZw7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Sb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0E
	n4kS14v26r1q6r43MxkF7I0Ew4C26cxK6c8Ij28IcwCF04k20xvY0x0EwIxGrwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UYxBIdaVFxhVjvjDU0xZFpf9x07jeLvtUUUUU=
X-CM-SenderInfo: 50xn30hkdlqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_011945_579282_7E057DBA 
X-CRM114-Status: UNSURE (   7.35  )
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

From: Xu Kuohai <xukuohai@huawei.com>

On x86 CPUs with CET/IBT and arm64 CPUs with BTI, missing landing pad instructions
at indirect jump targets triggers kernel panic. So emit ENDBR instructions for
indirect jump targets on x86 and BTI on arm64. Indirect jump targets are identified
based on the insn_aux_data created by the verifier.

Patch 1 fixes an off-by-one error that causes the last ENDBR/BTI instruction to be
omitted.

Patch 2 introduces a helper to determine whether an instruction is indirect jump target.

Patches 3 and 4 emit ENDBR and BTI instructions for indirect jump targets on x86 and
arm64, respectively.

v4:
- Switch to the approach proposed by Eduard, using insn_aux_data to indentify indirect
  jump targets, and emit ENDBR on x86

v3: https://lore.kernel.org/bpf/20251227081033.240336-1-xukuohai@huaweicloud.com/
- Get rid of unnecessary enum definition (Yonghong Song, Anton Protopopov)

v2: https://lore.kernel.org/bpf/20251223085447.139301-1-xukuohai@huaweicloud.com/
- Exclude instruction arrays not used for indirect jumps (Anton Protopopov)

v1: https://lore.kernel.org/bpf/20251127140318.3944249-1-xukuohai@huaweicloud.com/

Xu Kuohai (4):
  bpf: Fix an off-by-one error in check_indirect_jump
  bpf: Add helper to detect indirect jump targets
  bpf, x86: Emit ENDBR for indirect jump targets
  bpf, arm64: Emit BTI for indirect jump target

 arch/arm64/net/bpf_jit_comp.c |  3 ++
 arch/x86/net/bpf_jit_comp.c   | 15 ++++++----
 include/linux/bpf.h           |  2 ++
 include/linux/bpf_verifier.h  | 10 ++++---
 kernel/bpf/core.c             | 51 ++++++++++++++++++++++++++++++---
 kernel/bpf/verifier.c         | 53 +++++++++++++++++++++++++++++++++--
 6 files changed, 119 insertions(+), 15 deletions(-)

-- 
2.47.3


