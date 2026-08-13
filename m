Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DD4C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fCbICOUqbLM24gbesZyBzGxxIYMKI9CHoYUscnHLZC8=; b=c14FJBNhZArj/tSiphfvAG67NO
	kqD2sSDN0C7EDvnGRyNsyG+kW94+AEYALqyDdXv90LJw4webRqjR9jJv3EeH9Kel37pOrgDl8aIhP
	qerjppK8aT2OZjuQEu2EFdALhC8c8LGqK20lEDMWJ4P3yfaFlYFSvlROR2MDmmJLj2i4YE3iJmXf1
	oyryrA+ZCbeDf43srHQbAKhwywkCAOJzWO/by6Zr1oCn0lulwVW+BQY6jNYMAsm/yDTctF6UN7Foa
	FxXSBYFex5bzPFH2rdXnsYhBIbnxHCH/BpovdIRll5xrMj8h3ZW6XUmphvRSyxptatEPevDgOiU7G
	pN51mY2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQUM-000000005ZP-0HBb;
	Thu, 13 Aug 2026 08:08:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQUK-000000005ZJ-32Fm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:08:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CAFB3600AD;
	Thu, 13 Aug 2026 08:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C2C6C19425;
	Thu, 13 Aug 2026 08:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786608511;
	bh=mOjN1h7Hvv5Aq1B3Rx7ce8Xot0YMxaw6JMizvfcm3mM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=s1zjcoeeJ5MQGuufduczXBSHPYJuC8BWjPZcnXT1d4I0WmwTILmZlP31fWiFfbTRb
	 JwPZ1IOG8PIkXCf59KtLgcqJJyo11SvNRyh8/7T+gcPTd2EB0E8X1Gj5yj2jx3ynNl
	 BIcbeop3iPZiAd3Ekel3CfMIpOAyo/ChGKAfd9rHP0u0Va6RAFA4fBsHNYwdoDgPPT
	 Y9cO2utzBh+XS7y++ZVSUYeB9JsIzVFpUXrrffghwKkrOEVN4zuVazCVUWgmF3aR1E
	 28ssP8l8pucnY3FrFS6a0FKM7SLyjn/cF6lwkpXgh344R8TJeDeeI8xx/0k5PTuyHG
	 p9qm+J0Lgw8uw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58316C5AC67;
	Thu, 13 Aug 2026 08:08:31 +0000 (UTC)
From: Junrui Luo via B4 Relay <devnull+moonafterrain.outlook.com@kernel.org>
Date: Thu, 13 Aug 2026 16:08:24 +0800
Subject: [PATCH v2] coresight: configfs: print the address parameter with
 %pK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-coresight-fixes-v2-1-096163d321db@outlook.com>
X-B4-Tracking: v=1; b=H4sIAHd7fWoC/3WNzQ6CMBCEX4Xs2Zr+ICIn38NwwLKFjcqatjYa0
 ne3cvf4zeSbWSGgJwzQVSt4TBSIlwJ6V4Gdh2VCQWNh0FI3slVaWPYYaJqjcPTGIE6Dk6MzRrW
 NhmI9PW5FkS594ZlCZP/ZDpL6pf+3khJKHIy7uhqPRtfqzK94Z77tLT+gzzl/ATQ7vXqwAAAA
X-Change-ID: 20260812-coresight-fixes-9af0df331862
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Linu Cherian <lcherian@marvell.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>, 
 stable@vger.kernel.org, Junrui Luo <moonafterrain@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2893;
 i=moonafterrain@outlook.com; h=from:subject:message-id;
 bh=39Yh9YwtTx5GJcnsVzhUE55SB3APLptbyhbni9ITWJ4=;
 b=owJ4nJvAy8zAJVb4wiKgu++DA+NptSSGrNrquvKfBks9Puc9LWxw27Ntz6+kixvPsWznlHhSW
 ZK9/LaN65KOUhYGMS4GWTFFluMFl75Z+G7R3eKzJRlmDisTyBAGLk4BmIjsIUaGn/vuTet8s/lc
 7uIQVaWI1P4FN1KPzDt4fNuUhOiIj1wmngz//WdvuysQ3Zdx/2dqVJ6t5lzBLTFNZ04kia/ZFH3
 /Se4NZgAwQ1AC
X-Developer-Key: i=moonafterrain@outlook.com; a=openpgp;
 fpr=C770D2F6384DB42DB44CB46371E838508B8EF040
X-Endpoint-Received: by B4 Relay for moonafterrain@outlook.com/default with
 auth_id=909
X-Original-From: Junrui Luo <moonafterrain@outlook.com>
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
Reply-To: moonafterrain@outlook.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Junrui Luo <moonafterrain@outlook.com>

The preloaded 'gen_etrig' ETMv4 feature declares its only parameter as
{ .name = "address", .value = (u64)panic }, so on a relocatable kernel
the stored value is the post-KASLR runtime address of panic().

cscfg_param_value_show() prints that value verbatim with "0x%llx", and
CONFIGFS_ATTR() gives the attribute mode 0644 while every enclosing
directory is 0755. Once configfs is mounted, any local user reading
cs-syscfg/features/gen_etrig/params/address/value can recover the kernel
text base; neither kptr_restrict nor a capability check applies on that
path, and the plain u64 print bypasses the pointer-formatting
protections. The parameter exists even without trace hardware, since
cscfg_init() calls cscfg_preload() unconditionally and
coresight-cfg-pstop.o is linked into the core coresight module.

Print a parameter named "address" with "%pK" instead, letting
kptr_restrict decide what an unprivileged reader gets. Parameters holding
plain numbers, such as the strobing 'window' and 'period' counts, keep
the "0x%llx" format.

Fixes: 4b7e62627a38 ("coresight: config: Add preloaded configuration")
Reported-by: Yuhao Jiang <danisjiang@gmail.com>
Suggested-by: Leo Yan <leo.yan@arm.com>
Assisted-by: Claude:claude-opus-5
Cc: stable@vger.kernel.org
Signed-off-by: Junrui Luo <moonafterrain@outlook.com>
---
Changes in v2:
- Print a parameter named "address" with "%pK" in cscfg_param_value_show()
  instead of giving it a 0600 'value' attribute (Leo Yan).
- Link to v1: https://lore.kernel.org/r/20260812-coresight-fixes-v1-1-53fbf4e73241@outlook.com
---
 drivers/hwtracing/coresight/coresight-syscfg-configfs.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
index 2b40e556be87..e084ed0b106b 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg-configfs.c
@@ -281,7 +281,14 @@ static ssize_t cscfg_param_value_show(struct config_item *item, char *page)
 {
 	struct cscfg_fs_param *param_item = container_of(to_config_group(item),
 							 struct cscfg_fs_param, group);
-	u64 value = param_item->feat_desc->params_desc[param_item->param_idx].value;
+	struct cscfg_parameter_desc *param_desc =
+		&param_item->feat_desc->params_desc[param_item->param_idx];
+	u64 value = param_desc->value;
+
+	/* The kernel address should print with the "%pK" specifier */
+	if (!strcmp(param_desc->name, "address"))
+		return scnprintf(page, PAGE_SIZE, "0x%pK\n",
+				 (void *)(unsigned long)value);
 
 	return scnprintf(page, PAGE_SIZE, "0x%llx\n", value);
 }

---
base-commit: f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
change-id: 20260812-coresight-fixes-9af0df331862

Best regards,
-- 
Junrui Luo <moonafterrain@outlook.com>



