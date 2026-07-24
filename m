Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21E1C53209
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 02:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L/SZp0vPqZ6bgIHdMlwc9563CUsJkyQzIo7rI6wG1fs=; b=C5fwWmm2jrPETKiAGAP2hi+vr6
	89fXNRCx61tZG5I4ZavXqlpO40DLpc+kJYD3DsSwDEIuPzPpjT3ESvD4pe3zMxF72hm+wBeO1vDt7
	xHajWGUEW6hFnAyNickojaa8zhDNAA3i1d2CoksxuCnspSwgmE386SeEGUz0XQ/ixJ4iHfgASFRM5
	qgJ21PrJTq819l7QmfYZGvdT8wGgJ1i8HIp30Txl8J0NAw1tRYLI8BAZpV+6ZPkT5Kuw4Usx6SoUl
	UerF8vzfXAtVU5qH7V4t3S2j10k7BZFMNnhzT5Eu00A9WXEOGeheCMEbwAoNhKK4YEru9TWR7v66T
	ZLo3ZsoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn5Qw-0000000FN65-2GGH;
	Fri, 24 Jul 2026 02:14:42 +0000
Received: from m16.mail.126.com ([220.197.31.6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn5Qk-0000000FMxv-34Jm;
	Fri, 24 Jul 2026 02:14:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=L/
	SZp0vPqZ6bgIHdMlwc9563CUsJkyQzIo7rI6wG1fs=; b=ipar9103VugBwa7uzk
	RoqjOghrHfRoqDl2bzaHe0YPIkBrqYCLgiYNa1/ES/GRQ8WHq2GbajVuBN2uMDbr
	+3gkFYU0bsk813V33HstJUih1FcKIA7lBelM4qVniwAowoHQCdo0vuE4VHpsY6gY
	n6ZDAiMe/dnXvn4gK6jlV0i+Y=
Received: from song-MS-7D48.. (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSkvCgDnr+wRymJqH7z4DA--.34972S3;
	Fri, 24 Jul 2026 10:12:39 +0800 (CST)
From: Song Chen <chensong_2000@126.com>
To: arnd@arndb.de,
	kees@kernel.org,
	clm@fb.com,
	dsterba@suse.com,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	guoren@kernel.org,
	kernel@xen0n.name,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	gor@linux.ibm.com,
	borntraeger@linux.ibm.com,
	agordeev@linux.ibm.com,
	svens@linux.ibm.com,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	jpoimboe@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Song Chen <chensong_2000@126.com>
Subject: [RFC PATCH v2 1/3] error-injection: Introduce EI_ETYPE_FALSE for fail_function
Date: Fri, 24 Jul 2026 10:12:27 +0800
Message-ID: <20260724021229.47302-2-chensong_2000@126.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724021229.47302-1-chensong_2000@126.com>
References: <20260724021229.47302-1-chensong_2000@126.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PSkvCgDnr+wRymJqH7z4DA--.34972S3
X-Coremail-Antispam: 1Uf129KBjvJXoWrtr4DJw4kKF1xCrWkZFW8JFb_yoW8JF1DpF
	1q9r9rury8K348Cry8AFZ2yr1F9rsrGrZxKasxWws7Zw17tF4kt39FgrWUXrykGrW8uayj
	va9rWFZ0yr45AFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRwvttUUUUU=
X-Originating-IP: [221.238.56.48]
X-CM-SenderInfo: xfkh02prqjsjqqqqqiyswou0bp/xtbBsxfqampiyhdNyQAA31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_191431_195162_4F2F33EF 
X-CRM114-Status: UNSURE (   8.70  )
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

Introduce EI_ETYPE_FALSE for functions which need false as return
value in their error-injections, like btrfs_data_csum_ok.

EI_ETYPE_NULL can return 0 too but its readability is not good
enough.

Signed-off-by: Song Chen <chensong_2000@126.com>
---
 include/asm-generic/error-injection.h | 1 +
 kernel/fail_function.c                | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/asm-generic/error-injection.h b/include/asm-generic/error-injection.h
index b05253f68eaa..6c399121ab7a 100644
--- a/include/asm-generic/error-injection.h
+++ b/include/asm-generic/error-injection.h
@@ -8,6 +8,7 @@ enum {
 	EI_ETYPE_ERRNO,		/* Return -ERRNO if failure */
 	EI_ETYPE_ERRNO_NULL,	/* Return -ERRNO or NULL if failure */
 	EI_ETYPE_TRUE,		/* Return true if failure */
+	EI_ETYPE_FALSE,		/* Return false if failure */
 };
 
 struct error_injection_entry {
diff --git a/kernel/fail_function.c b/kernel/fail_function.c
index 2eaf55005f49..90cdad0412cd 100644
--- a/kernel/fail_function.c
+++ b/kernel/fail_function.c
@@ -48,6 +48,8 @@ static unsigned long adjust_error_retval(unsigned long addr, unsigned long retv)
 		break;
 	case EI_ETYPE_TRUE:
 		return 1;
+	case EI_ETYPE_FALSE:
+		return 0;
 	}
 
 	return retv;
-- 
2.43.0


