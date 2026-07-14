Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 773EBC44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 16:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5blKI9T2RVcmKZdgBfUGMw3JZBxqWeVrnUE0eWQYNU=; b=y3KWngaQgPrinONnRAnCSyf9M6
	GQboyqVcF+CKntrdzbkYYwdpPkKftWVhoUCj8Vhk4my8BONRy+YlhER4wDf1wnvOb3Lm7UBWVdjyn
	gFUtTsVANmHck5S+HfHvio3RxZQVwhg2Jb70sylg2A/Gjkm0duLRHgpSZUZO8XR94ot2JZQdZ4X1D
	HOTooRFb+h3gNeLsHx5maqnbfjBR8wMCxW5ICxNMXfZ+xvIeo35t5fVLQ4lkWOcITT6hYU5sK9n/l
	NJYZbsTFke+u1c+sojfSCFl3DDpjvRmkd3i2IbmsmnQqiDggeNcuuVG7MFkLM5d3RChHfQEDo1c7M
	57XTzptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgMa-0000000Cgps-2AcQ;
	Tue, 14 Jul 2026 16:52:08 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgMT-0000000CgiS-03lN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 16:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1784047914;
	bh=g89D7a4XpoHeRm3Z+DDM6ulsaVeCNUY/pAXw/B1rrIk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RyYhrUuY0VRYIxcc9jWksSkw7dIf0uM/QpFUvw4D6iOEoFlbFIW2ghfJRleLK/WNQ
	 rey2x6MFE92RNNXOIwhwvX6xLLST98AEg4K+nKvLxlguxYiWa22Mt2e548F4Dtwvr/
	 0PbWPM6Nq0WBZlQHJvhrSADefcIap0eArXNpynw4=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 14 Jul 2026 18:51:48 +0200
Subject: [PATCH 1/3] x86/mce: Use __DEVICE_ATTR() macro to initialize
 dev_ext_attribute
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260714-sysfs-const-attr-dev_ext_attr-v1-1-6b2c0435d621@weissschuh.net>
References: <20260714-sysfs-const-attr-dev_ext_attr-v1-0-6b2c0435d621@weissschuh.net>
In-Reply-To: <20260714-sysfs-const-attr-dev_ext_attr-v1-0-6b2c0435d621@weissschuh.net>
To: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
 Yushan Wang <wangyushan12@huawei.com>, Jijie Shao <shaojijie@huawei.com>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, driver-core@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784047913; l=1433;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=g89D7a4XpoHeRm3Z+DDM6ulsaVeCNUY/pAXw/B1rrIk=;
 b=al6DQcUFY/kmhepddTJ9a3tiSk4uB2AABkAFZK53JWe7hXFh8iP5oigjsKCNTsx5CGLx1aAPi
 S+roPX/wX0VCQ+JQgOIpHnCiy71QTSy4QX9NJBT275qiNhAXHQF7RQx
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_095201_198323_23841EF4 
X-CRM114-Status: GOOD (  10.82  )
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

The upcoming constification of the device_show_int() and
device_show_bool() signatures requires the users to handle the
transition automatically.

Switch to the __DEVICE_ATTR() macro which can do this.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 arch/x86/kernel/cpu/mce/core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 9bba1e2f03af..7fc9aa9e2ec9 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -2621,17 +2621,17 @@ static DEVICE_BOOL_ATTR(dont_log_ce, 0644, mca_cfg.dont_log_ce);
 static DEVICE_BOOL_ATTR(print_all, 0644, mca_cfg.print_all);
 
 static struct dev_ext_attribute dev_attr_check_interval = {
-	__ATTR(check_interval, 0644, device_show_int, store_int_with_restart),
+	__DEVICE_ATTR(check_interval, 0644, device_show_int, store_int_with_restart),
 	&check_interval
 };
 
 static struct dev_ext_attribute dev_attr_ignore_ce = {
-	__ATTR(ignore_ce, 0644, device_show_bool, set_ignore_ce),
+	__DEVICE_ATTR(ignore_ce, 0644, device_show_bool, set_ignore_ce),
 	&mca_cfg.ignore_ce
 };
 
 static struct dev_ext_attribute dev_attr_cmci_disabled = {
-	__ATTR(cmci_disabled, 0644, device_show_bool, set_cmci_disabled),
+	__DEVICE_ATTR(cmci_disabled, 0644, device_show_bool, set_cmci_disabled),
 	&mca_cfg.cmci_disabled
 };
 

-- 
2.55.0


