Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85AFCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 01:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YwRlPo2Yp28Pir1nx3fvLF0P5UPex6e71/gwVgjVb+0=; b=RQRWQsLpIjTS2HG7F5gr0/UP2g
	PUmdpjn/Ld84xjimtY08mqdFJ5IDK1g2FDoRd5j0+bt6ywpyYKrae2tS3cvJNmC3IyvUwyLQ5GoVJ
	I1h//kWZt4YY0E02AOy3MLiaLbUA0ZawPfd2H65JZDCnJvEDkPh3rEqQ5H5bahTAx8Ewv++fBS2cD
	THjYrsQbKn2mWXX9p+PLYiPw+Rehj0LFrF/eiRiLgnZ+V0XvHF3ogxSq3at+L2SntfElm7Q1QyLjr
	vZZ1nZD15zF6PhR85ZuEW9QSdjC7Emjda/3daAiaYoskiUmtSJtxEkdSgxB7PI/ffPuSXCHJ1xKM3
	396zVatg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umjB7-00000001266-1CAU;
	Fri, 15 Aug 2025 01:24:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umj5r-000000011jw-0ump
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 Aug 2025 01:18:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=YwRlPo2Yp28Pir1nx3fvLF0P5UPex6e71/gwVgjVb+0=; b=kojTKiREaoLppQxf5YJAvaEHJJ
	dqVMAXoO54/a3XGbb60iFmH9B7IF/v04+Scoo8QJJXVD3JdCm6583+Qfl1U9QAsyrJL70FrTHlROS
	HXhBUnHX2QEgAh10xFS8DkPqwx4pjkFi7TUdZFJVS0liCd6qTA2mg2UW01erwLBmV5jc0gsQWBcx9
	4Qi1gE+WV5niEhrrBvu4x6TUy+M3SAEJ6FM3l4Fn7aV8TfQzKVXeA1WQ7vF/IPKqhb889jm0diCLx
	ihlKV3uqGA3zGf4q3WrpHw7bBRKoXdzrtNvKCLEGGyQ3C7OV15jxeYhAyjehJLjw5OOrjhfCVQdiN
	QdH0VDiQ==;
Received: from m16.mail.163.com ([117.135.210.4])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umj5m-0000000Ga3h-1G6d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 01:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Yw
	RlPo2Yp28Pir1nx3fvLF0P5UPex6e71/gwVgjVb+0=; b=LVB9T9BtCAa0UtWpHx
	54X2KdHNy9MxvPTHGA/JJJbWbSz+61jMZxCVikH4y6TR7zBWV3H82iuoUCgOPMEX
	DfNhuB+HRCAfqamxoRpL0aAyS4MFDHFNVc87+KVum6buiax9g9UdRQPF2cupHRgv
	PKdCtZN2h0K/vCtFlXBotTobs=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wC3E7vSip5oCUjvBw--.16775S2;
	Fri, 15 Aug 2025 09:18:11 +0800 (CST)
From: 15074444048@163.com
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: oliver.upton@linux.dev,
	maz@kernel.org,
	joey.gouly@arm.com,
	broonie@kernel.org,
	james.morse@arm.com,
	miko.lenczewski@arm.com,
	yangyicong@hisilicon.com,
	robin.murphy@arm.com,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	lihaojie <lihaojie@kylinos.cn>
Subject: [PATCH] arm64: cpufeature: Replace inline with __always_inline for GCS checks
Date: Fri, 15 Aug 2025 09:19:05 +0800
Message-Id: <20250815011905.1368058-1-15074444048@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wC3E7vSip5oCUjvBw--.16775S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF4xXFWrWr45WrWkJw15XFb_yoW8WrW3p3
	WDCw1vkFW5WF4rKayqqwnIgrW5X393Kr15GrWDKryDtF15Ja42gFn3KFya93Z5uFyvv3yF
	9Fyjvry3Ca1UCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UPxhJUUUUU=
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: rprvilauuukiiuy6il2tof0z/xtbBDgOqUGieiN07bQAAsC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_021851_324600_1A8DB631 
X-CRM114-Status: GOOD (  10.42  )
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

From: lihaojie <lihaojie@kylinos.cn>

Fix error:
aarch64-linux-gnu-ld: arch/arm64/kernel/signal.o: in function `setup_sigframe':
signal.c:(.text+0x16ec): undefined reference to `preserve_gcs_context'
aarch64-linux-gnu-ld: arch/arm64/kernel/signal.o: in function `restore_sigframe':
signal.c:(.text+0x210c): undefined reference to `restore_gcs_context'

When CONFIG_ARM64_GCS is disabled, the compiler reports undefined symbol
errors, that's because of inline hint. __always_inline can resolve this
issue.

When use __always_inline The compiler will almost certainly inline
system_supports_gcs, which allows the compiler to optimize and check
earlier during the compilation phase. If system_supports_gcs() returns
false, then the line of code restore_gcs_context (&user) will not
actually be generated, so the compiler will not report an error.

Signed-off-by: lihaojie <lihaojie@kylinos.cn>
---
 arch/arm64/include/asm/cpufeature.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index bf13d676aae2..4eddf6e78d77 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -846,7 +846,7 @@ static inline bool system_supports_poe(void)
 	return alternative_has_cap_unlikely(ARM64_HAS_S1POE);
 }
 
-static inline bool system_supports_gcs(void)
+static __always_inline bool system_supports_gcs(void)
 {
 	return alternative_has_cap_unlikely(ARM64_HAS_GCS);
 }
-- 
2.25.1


