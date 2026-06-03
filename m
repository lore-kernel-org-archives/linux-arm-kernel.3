Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC2DCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 06:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b+aWd/GLK8nfS0kgwjHVDqklBIbJ/72vtxp0L/oyuAo=; b=JI9Jz9t2WuEypvvZYAbQ4qBDpv
	Us/BZYJv4IsuOttKrZPH1vBMiATFR4tqlTyxykUXaWc6fcTzdM4FURM8+xRf0NCaO8lgYOxlIod0k
	Z4OpWdKJmBVCy5hcibb0Bc3KSv2d7uHtR4NeFswUh52eYABzChlWftCG3bELXIjD3RC79HzjABQxZ
	nhf0AkFjnzC9oL40Cji5JZlUtLDzXm09Wpf+7XunmGy4dIUepMaf8sliNcYUtfitmXzQq5Qarbusi
	XcKdXUA8I87HF13uTkcNTebq+n0MRH+G+2xGGVTR0wGFq7FuiOse1zRfPBzvPLlKRq8fPcV3gYNSj
	EUayvkEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUeyD-0000000ENI5-1roi;
	Wed, 03 Jun 2026 06:20:53 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUey9-0000000ENGL-2y15
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 06:20:52 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gVcxm0zzwzKHMLk
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Jun 2026 14:20:12 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 932CA40573
	for <linux-arm-kernel@lists.infradead.org>; Wed,  3 Jun 2026 14:20:37 +0800 (CST)
Received: from huaweicloud.com (unknown [10.50.87.109])
	by APP1 (Coremail) with SMTP id cCh0CgBHlzytxx9qYt3IAQ--.56787S4;
	Wed, 03 Jun 2026 14:20:35 +0800 (CST)
From: Zeng Heng <zengheng@huaweicloud.com>
To: will@kernel.org,
	vladimir.murzin@arm.com,
	xuwei5@huawei.com,
	broonie@kernel.org,
	ryan.roberts@arm.com,
	corbet@lwn.net,
	catalin.marinas@arm.com,
	oupton@kernel.org,
	kevin.brodsky@arm.com,
	maz@kernel.org,
	yeoreum.yun@arm.com,
	skhan@linuxfoundation.org,
	yangyicong@hisilicon.com,
	thuth@redhat.com,
	kuninori.morimoto.gx@renesas.com,
	lucaswei@google.com,
	lpieralisi@kernel.org,
	miko.lenczewski@arm.com,
	mark.rutland@arm.com,
	james.clark@linaro.org
Cc: wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	zengheng4@huawei.com
Subject: [PATCH v4 0/2] arm64: cpufeature: Add WORKAROUND_DISABLE_CNP capability
Date: Wed,  3 Jun 2026 14:20:23 +0800
Message-ID: <20260603062025.1504083-1-zengheng@huaweicloud.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgBHlzytxx9qYt3IAQ--.56787S4
X-Coremail-Antispam: 1UD129KBjvdXoWrZFyDZrW7WFW8tF4rJw17GFg_yoWktFc_tr
	48Ka45X34fAF10gaySya4ftryqkFWUJr95JF1IqrZxGF9Ivr1xCrZ5Gry5Cwn8Za1SgrWU
	JasrZFykZrZFqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbI8YFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_JFC_Wr1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAa
	w2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a
	6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	xUIF4iUUUUU
X-CM-SenderInfo: p2hqwxhhqjqx5xdzvxpfor3voofrz/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_232049_976337_C52177B9 
X-CRM114-Status: UNSURE (   6.76  )
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

v3: https://lore.kernel.org/all/20260601112000.1145391-1-zengheng@huaweicloud.com/
v2: https://lore.kernel.org/all/20260529063132.766491-1-zengheng@huaweicloud.com/
v1: https://lore.kernel.org/all/20260526015720.206854-1-zengheng@huaweicloud.com/

Changes in v4:
  - Keep orthogonality for CONFIG_NVIDIA_CARMEL_CNP_ERRATUM and
    CONFIG_HISILICON_ERRATUM_162100125 within the cnp_erratum_cpus array.

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
 arch/arm64/kernel/cpu_errata.c              | 21 ++++++++++++++++-----
 arch/arm64/kernel/cpufeature.c              |  2 +-
 arch/arm64/tools/cpucaps                    |  2 +-
 6 files changed, 42 insertions(+), 9 deletions(-)

--
2.43.0


