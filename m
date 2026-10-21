Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722DB606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 10:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GPoaVkUn;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=GaysVL2o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBJUmtbuATtCQI4WXAqiNK4mEbViXdkWjhd79WEwXiM=; b=GPoaVkUn8jOjd4JFETevGiAdKZ
	HCv1tYdLCrdbuVTU3LtlKMzJpf9zM2A44EZ3V5YxhrHsEMU1s5dNlOfQIwijHyU1k1deZgYXPUyHc
	IM0KpzhDF5NMAXKcA3M6KHTDccdxOMss0fZzlGNICcN1ibK5Mhxgfar/dylm6mVAdb3DqOmMPbXjz
	vRa5Ge9x1bpB/aTFm5EHprKH+IAfU3GGHZCxrPEe56bSpPOsB3ZB/LmvOozjC+pQZtM6A7rHVMTwl
	1aK2h1bWSKJ92nUJIPVceF3oV2krdLaDkgS75pD6AkfWTYXq06UTBEVM7CcDcoPPB1h30O+6UegnI
	6dVc9lcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTqu-0000000BdrT-1ia3;
	Wed, 21 Oct 2026 10:47:24 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJTqm-0000000Bdnr-0uxj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 10:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=bB
	JUmtbuATtCQI4WXAqiNK4mEbViXdkWjhd79WEwXiM=; b=GaysVL2oznaB6ZBhTY
	uJrmrvdFgr5hKCApxCt8UPZeQlp2BWqh4znUXe8gD+kzm/TQFkmhgdl/4Uwu+CGJ
	aE+p+QS8VXo7QNikOfEfH7IniSMtQtpAmUfEK/IsYHRBJ0On1ww1qpbSEs/J+zTF
	WzVck64z31PHFS5Fwu2N2dBRM=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDXXzcZmNhqXKxSBw--.62283S4;
	Wed, 21 Oct 2026 18:46:52 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-edac@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 2/2] EDAC/zynqmp: reserve space for injection input terminator
Date: Wed, 21 Oct 2026 18:46:48 +0800
Message-Id: <20261021104648.4105938-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021104648.4105938-1-yaojiale02@163.com>
References: <20261021104648.4105938-1-yaojiale02@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXXzcZmNhqXKxSBw--.62283S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw1kAr4xCw4xJFy8ury8Zrb_yoWDGrg_u3
	4kAFykJFWDAFyDt3Z3Aw4YvFW0k3W5XF1kW3Wa9Fyavr1UXrn3ZFn3uFnxXr4UuFWfWr9r
	KwnYgFZ7Gw47GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnFksDUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzhz9OGrYmByFkAAA30
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_034717_444118_6CA8E39E 
X-CRM114-Status: GOOD (  11.64  )
X-Spam-Score: -1.8 (-)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

inject_ue_write() caps the copy length at the full buffer size and then
writes a terminating NUL at buf[len]. An input of six bytes or more
therefore writes one byte beyond the stack buffer.

Limit the copied input to one byte less than the buffer size.

Fixes: 3bd2706c910f ("EDAC/zynqmp: Add EDAC support for Xilinx ZynqMP OCM")
Cc: stable@vger.kernel.org
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/edac/zynqmp_edac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/zynqmp_edac.c b/drivers/edac/zynqmp_edac.c
index cdffc9e4194d..048a7b9becd6 100644
--- a/drivers/edac/zynqmp_edac.c
+++ b/drivers/edac/zynqmp_edac.c
@@ -304,7 +304,7 @@ static ssize_t inject_ue_write(struct file *file, const char __user *data,
 	if (!data)
 		return -EFAULT;
 
-	len = min_t(size_t, count, sizeof(buf));
+	len = min_t(size_t, count, sizeof(buf) - 1);
 	if (copy_from_user(buf, data, len))
 		return -EFAULT;
 
-- 
2.34.1


