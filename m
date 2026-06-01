Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28D3CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 11:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JZCVUnOW0FG35a31NWJAibqlYW+cGVtHE3c8HKiNRu4=; b=PVlrSxD3kxRSMjJZgQPBjlbP6R
	08oJ7iOiGBfZVwIGi/AiV6Oom7wv88VCJn5W/hjS4QBH/xnQw4T/Y9fykiasO8p5zcBoPZ5ZL5ema
	0jg35/3v6AglG3gwb7jgw240zuJKU2NfIOyuVYF0aGr4mQ1XJI2hMS9qW/ckJj3oDmhlHtVH0bGT/
	omhwK/i7wtmPRtLmmIoXmIIPZze0Rp/bHYHzqJCqPyVwvioohJHKxUssQNqYE1GiKu0qDXEfc3aeY
	u4lGrwHbOhEqiWjZRfSPuW5E3a9AgJ/NsFj9mglviow8T0gf46y9dOXUXTK94rI0q7Tg0bWyzP7Kl
	BxIspRPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0hB-0000000AivH-1imG;
	Mon, 01 Jun 2026 11:20:37 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0h7-0000000Aisa-3OLQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 11:20:36 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4gTWj31T4gzYQvNG
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Jun 2026 19:20:23 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 4B98740561
	for <linux-arm-kernel@lists.infradead.org>; Mon,  1 Jun 2026 19:20:26 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.87.109])
	by APP1 (Coremail) with SMTP id cCh0CgB3ej_iah1qEvbwAA--.46998S4;
	Mon, 01 Jun 2026 19:20:24 +0800 (CST)
From: Zeng Heng <zengheng@huaweicloud.com>
To: vladimir.murzin@arm.com,
	xuwei5@huawei.com,
	wangyushan12@huawei.com,
	yangyicong@hisilicon.com,
	maz@kernel.org,
	yeoreum.yun@arm.com,
	miko.lenczewski@arm.com,
	james.clark@linaro.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	kuninori.morimoto.gx@renesas.com,
	lucaswei@google.com,
	catalin.marinas@arm.com,
	broonie@kernel.org,
	lpieralisi@kernel.org,
	thuth@redhat.com,
	kevin.brodsky@arm.com,
	tongtiangen@huawei.com,
	oupton@kernel.org,
	ryan.roberts@arm.com,
	mark.rutland@arm.com,
	will@kernel.org,
	Sascha.Bischoff@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	wangkefeng.wang@huawei.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] arm64: cpufeature: Add WORKAROUND_DISABLE_CNP capability
Date: Mon,  1 Jun 2026 19:19:58 +0800
Message-ID: <20260601112000.1145391-1-zengheng@huaweicloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgB3ej_iah1qEvbwAA--.46998S4
X-Coremail-Antispam: 1UD129KBjvdXoWrtFyDJFyxCr47Aw18ur15Arb_yoWfZFX_tr
	1xKa4rWryfAFy0qayFya4fAryjkFW8tr98GF1IqrZ8GF9Ivr1xCrWrKFyrCws8Z3WSgrWU
	Ja4DZr1kArZFqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_JFC_Wr1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxV
	AFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2
	j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kK
	e7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_
	WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	jxCztUUUUU=
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_042034_029149_A7921815 
X-CRM114-Status: UNSURE (   6.79  )
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

From: Zeng Heng <zengheng4@huawei.com>

v2: https://lore.kernel.org/all/20260529063132.766491-1-zengheng@huaweicloud.com/
v1: https://lore.kernel.org/all/20260526015720.206854-1-zengheng@huaweicloud.com/

Changes in v3:
  - Keep CONFIG_ARM64_WORKAROUND_DISABLE_CNP config and generalise
    ARM64_WORKAROUND_DISABLE_CNP capability.

Changes in v2:
  - Unify CNP disable workaround into ARM64_WORKAROUND_DISABLE_CNP

Zeng Heng (2):
  arm64: cpufeature: Add WORKAROUND_DISABLE_CNP capability
  arm64: kernel: Disable CNP on HiSilicon HIP09

 Documentation/arch/arm64/silicon-errata.rst |  2 ++
 arch/arm64/Kconfig                          | 20 ++++++++++++++++++++
 arch/arm64/include/asm/cpucaps.h            |  4 ++--
 arch/arm64/kernel/cpu_errata.c              | 17 ++++++++++++-----
 arch/arm64/kernel/cpufeature.c              |  2 +-
 arch/arm64/tools/cpucaps                    |  2 +-
 6 files changed, 38 insertions(+), 9 deletions(-)

--
2.43.0


