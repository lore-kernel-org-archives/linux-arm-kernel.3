Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C32E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 00:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vsUgCHVJ;
	dkim=pass (1024-bit key, unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=Y65z0RwT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UZaxZ3Xj6BQMasztnzAo4Ozc8Pd1UX24Y0xc+tKwRzc=; b=vsUgCHVJD2vskH
	5tMe/kPaTdLqcMmNIdYHQrhxPhoabquqeOzLTzfijn775zcb2KY9Dws61fS9Y32Vehfc/C/qT0X+i
	ouaeh2VVDQ7GJcrh44a2UCtFKbQCZFb+TdLe4HP705MINmszTUkg4fy3rgBfgJKWOJ6UJ5c+qIbNe
	rZSiw5QMubMfHuOq/0ja4T+nQjKIRE7SAXyeMv4Szba3xrlV6zP9H+QakrUu3oef1uECcDIbWrFPH
	DtboBNA41M2rfcU7KecWZxTL+WdVBhv1mLAws53zrdq7lt6uIoHJ9Ccd5N5SPMr3CjSZ+SciX8CQO
	NtMmCf7pRRGxvn/K2rhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMwkb-0000000Clqm-054r;
	Sat, 31 Oct 2026 00:15:13 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMwk5-0000000Cldx-3Uyy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 00:14:42 +0000
Received: from linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net (linux.microsoft.com [13.77.154.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6E5F720B7166;
	Fri, 30 Oct 2026 17:14:28 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6E5F720B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1793405668;
	bh=UZaxZ3Xj6BQMasztnzAo4Ozc8Pd1UX24Y0xc+tKwRzc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y65z0RwTxcPxIGklvi2ejn+smW3Rp1xeaXpQyWkxTFkLcb85HhS+tBgPn5stYbQ/J
	 1ug8CxZ0WZJKd3v+W3BbqdnQpTLCtLbVvo9sdZ9Tgik64XiAaGbHfLyDMxm125r9Zj
	 aimCJDo+Lov4J+yZ8WboIWok1h3IWqG4/xzk0zlY=
From: Kameron Carr <kameroncarr@linux.microsoft.com>
To: decui@microsoft.com,
	haiyangz@microsoft.com,
	mhklinux@outlook.com,
	wei.liu@kernel.org
Cc: arnd@arndb.de,
	catalin.marinas@arm.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lpieralisi@kernel.org,
	mark.rutland@arm.com,
	sudeep.holla@kernel.org,
	thuth@redhat.com,
	will@kernel.org
Subject: [PATCH v6 6/6] arm64: hyperv: Implement hv_is_isolation_supported() for CCA Realms
Date: Fri, 30 Oct 2026 17:14:12 -0700
Message-ID: <20261031001412.4150488-7-kameroncarr@linux.microsoft.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20261031001412.4150488-1-kameroncarr@linux.microsoft.com>
References: <20261031001412.4150488-1-kameroncarr@linux.microsoft.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_171441_919550_6B2067B6 
X-CRM114-Status: UNSURE (   6.81  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>

Provide an arm64 implementation of hv_is_isolation_supported() that
overrides the __weak default in drivers/hv/hv_common.c.

The implementation deliberately does not depend on
hv_is_hyperv_initialized() because hv_common_init() consults
hv_is_isolation_supported() before hyperv_initialized is set.

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Signed-off-by: Kameron Carr <kameroncarr@linux.microsoft.com>
---
 arch/arm64/hyperv/mshyperv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/hyperv/mshyperv.c b/arch/arm64/hyperv/mshyperv.c
index da6c3aa0..8a2c446 100644
--- a/arch/arm64/hyperv/mshyperv.c
+++ b/arch/arm64/hyperv/mshyperv.c
@@ -187,3 +187,8 @@ bool hv_isolation_type_cca(void)
 {
 	return is_realm_world();
 }
+
+bool hv_is_isolation_supported(void)
+{
+	return is_realm_world();
+}
-- 
2.45.4


