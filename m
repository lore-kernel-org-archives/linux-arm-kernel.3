Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91220E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 21:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUWPTQZhZL+trbY6rqDgsadKdURpHOKrbv+AkYqPxqs=; b=Bq6kWazUS7GTMQx7rM1y8peLkZ
	Fcfynqet2dxXzGk8jW4RACO4AHqfRFznVnzDxZYOuwH2mj+AZHJfH4ATvsThj+UTD8ntwFg/8ZDdY
	rTo02WGfM9Hfu2xHssPp9LnBQtdSsBZZAOP5XYxa/ad+Q8ic/UINs7goxGTsZH6V4LDCMATSN1ORp
	zqu20xSmGo6lMHBn/i/LGSW8O45TKPEELRcRF2yG18WBuE7j8xZqOG0l54afOZqizJBZGe2c8Br0O
	1RSuJbrMd+ld4gL7rMjH40ErbEAUpmjWGDUpCioSqckJrviKYoBLo13gmqJ4IEYCMphNPM48uS7EA
	GX3QVCEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLTq9-0000000G6fG-3lXa;
	Wed, 11 Dec 2024 21:01:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLTm2-0000000G5VK-2dRs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 20:57:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9BE62A40693;
	Wed, 11 Dec 2024 20:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76787C4CED2;
	Wed, 11 Dec 2024 20:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733950653;
	bh=Y/MDmPX+r3gFiGkupbpCHeLUQbC0UW+h6X8OOkloMKE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LN0YFaNW0XkbhQWrUu4KyYxoUxFeOOL/7gN/959Y/oZ4XosqkwUk6Ful1RaogQoXe
	 d0UADj0jmauunJXNMJtYTA68o52KnvAKrFoADSFc4baqVNTbsf8QO4NAxRyZVT1MBW
	 gcPjNKqg1R8UdZdA6xp84He5i51rheLtXsXe0hDoO04B9JmcTOZEIm6HwFZqV8wV5y
	 NeRys0hIIBzMlo7yDVjGVyTSP2NdJ4xiJWOwgW/ndGBeMUJzFl7L7oGy8tvlHorfK+
	 mhg1r5u5NYb/QVKhXBxLxRKYlVOLXE8D6Nzz3Ae5U7SOArctOsFvRDY8Qa/h6K87Cy
	 HJ8KM84ngZejg==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Dec 2024 14:57:14 -0600
Subject: [PATCH 3/3] mfd: syscon: Allow syscon nodes without a "syscon"
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-syscon-fixes-v1-3-b5ac8c219e96@kernel.org>
References: <20241211-syscon-fixes-v1-0-b5ac8c219e96@kernel.org>
In-Reply-To: <20241211-syscon-fixes-v1-0-b5ac8c219e96@kernel.org>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Pankaj Dubey <pankaj.dubey@samsung.com>, Heiko Stuebner <heiko@sntech.de>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_125734_798308_83DFC979 
X-CRM114-Status: GOOD (  15.32  )
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

of_syscon_register_regmap() was added for nodes which need a custom
regmap setup. It's not really correct for those nodes to claim they are
compatible with "syscon" as the default handling likely doesn't work in
those cases. If device_node_get_regmap() happens to be called first,
then of_syscon_register() will be called and an incorrect regmap will be
created (barring some other error). That may lead to unknown results in
the worst case. In the best case, of_syscon_register_regmap() will fail
with -EEXIST. This problem remains unless these cases drop "syscon" (an
ABI issue) or we exclude them using their specific compatible. ATM,
there is only one user: "google,gs101-pmu"

There are also cases of adding "syscon" compatible to existing nodes
after the fact in order to register the syscon. That presents a
potential DT ABI problem. Instead, if there's a kernel change needing a
syscon for a node, then it should be possible to allow the kernel to
register a syscon without a DT change. That's only possible by using
of_syscon_register_regmap() currently, but in the future we may want to
support a match list for cases which don't need a custom regmap.

With this change, the lookup functions will succeed for any node
registered by of_syscon_register_regmap() regardless of whether the node
compatible contains "syscon".

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/mfd/syscon.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
index bfb1f69fcff1..e6df2825c14d 100644
--- a/drivers/mfd/syscon.c
+++ b/drivers/mfd/syscon.c
@@ -171,8 +171,10 @@ static struct regmap *device_node_get_regmap(struct device_node *np,
 			break;
 		}
 
-	if (!syscon)
+	if (!syscon && of_device_is_compatible(np, "syscon"))
 		syscon = of_syscon_register(np, check_res);
+	else
+		syscon = ERR_PTR(-EINVAL);
 
 	mutex_unlock(&syscon_list_lock);
 
@@ -238,9 +240,6 @@ EXPORT_SYMBOL_GPL(device_node_to_regmap);
 
 struct regmap *syscon_node_to_regmap(struct device_node *np)
 {
-	if (!of_device_is_compatible(np, "syscon"))
-		return ERR_PTR(-EINVAL);
-
 	return device_node_get_regmap(np, true);
 }
 EXPORT_SYMBOL_GPL(syscon_node_to_regmap);

-- 
2.45.2


