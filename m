Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80C5D59D99
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 17:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8bTXwwa4yWYmr7RPK5yqMVybpKLz/hsRLqe6vIgI6FU=; b=M2ygLpPcLRGNnqXU1PmvGajghS
	Zyhrg4ZEH4lkjTs2ag4nD/wj1yMLNkMWB1npwKRcXDqaVpqlNk5pfLIoaOG1z9iOgl3BucWfHoYN4
	rrYu8cpNbDb3hxLeNzr2urd/EDJvMgkfeEIIEp4+i6MPrRv8gdX8zBagyX0PzOos1z86pClYoqTSA
	0fzZCWAhEt7hYHfscupl6f8Rylkb5GHkpqlpm39Tuq4N+9+KIZleZZ+ucdMKxV/ONFpjlV2zZkx+Z
	27S95c0mudONTcelCxbn3w0EkSlw09FA+BvniZISurhjqyvv8RDhjAzz1LBNB6l2ljBzA87ms/13H
	6qY3j2QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUqDq-00000002dIR-0vBj;
	Sun, 14 Dec 2025 17:49:30 +0000
Received: from smtp-17.smtpout.orange.fr ([80.12.242.17] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUqDi-00000002dI2-3vxi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Dec 2025 17:49:25 +0000
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id UqDZve9EWBoKRUqDZvZY3L; Sun, 14 Dec 2025 18:49:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1765734556;
	bh=8bTXwwa4yWYmr7RPK5yqMVybpKLz/hsRLqe6vIgI6FU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Q0aUFhZlMIAYVtUpnB+Yt+5owMGpqikBvZS7AsEeLg0ZwIqPl5FDLwFkoGjxkdNmX
	 l094Y+/3wL5Ea+GwsjU803rk7oHa/EYRxtETrOrrR45WwlvdDZ/xBHNzBJ0l5hUqJo
	 JWY7cSecI32YgqE56n7HGKUlLnTvgnBgzSlyYquaQE93RD8ZiPFRRpsU5ZcrVglciA
	 HHnJtn0WGrbLxYxyZrbLK+X27jcyc3miJdZbZUklHf4vJNTU9IV4qcnn49VIq+cNYn
	 PgvZxFGi4zPiKWOA5/i/sP5ozpNyQPPF3MUnJ+jpLevSqOR0nvi1l6X72PhVno7dGd
	 2MNYZRVzufp2A==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 14 Dec 2025 18:49:16 +0100
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] stm class: Constify struct configfs_item_operations and configfs_group_operations
Date: Sun, 14 Dec 2025 18:49:09 +0100
Message-ID: <b5811c1c5efdc6e9c8eb4886b8046b50b09c37f0.1765734533.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_094923_208776_43EADE1A 
X-CRM114-Status: GOOD (  10.66  )
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

'struct configfs_item_operations' and 'configfs_group_operations' are not
modified in this driver.

Constifying these structures moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  11786	   4216	     64	  16066	   3ec2	drivers/hwtracing/stm/policy.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  12202	   3800	     64	  16066	   3ec2	drivers/hwtracing/stm/policy.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.

This change is possible since commits f2f36500a63b and f7f78098690d.
---
 drivers/hwtracing/stm/policy.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/stm/policy.c b/drivers/hwtracing/stm/policy.c
index 42103c3a177f..a1af8d585fc9 100644
--- a/drivers/hwtracing/stm/policy.c
+++ b/drivers/hwtracing/stm/policy.c
@@ -181,7 +181,7 @@ static void stp_policy_node_release(struct config_item *item)
 	kfree(node);
 }
 
-static struct configfs_item_operations stp_policy_node_item_ops = {
+static const struct configfs_item_operations stp_policy_node_item_ops = {
 	.release		= stp_policy_node_release,
 };
 
@@ -270,7 +270,7 @@ stp_policy_node_drop(struct config_group *group, struct config_item *item)
 	config_item_put(item);
 }
 
-static struct configfs_group_operations stp_policy_node_group_ops = {
+static const struct configfs_group_operations stp_policy_node_group_ops = {
 	.make_group	= stp_policy_node_make,
 	.drop_item	= stp_policy_node_drop,
 };
@@ -364,11 +364,11 @@ static void stp_policy_release(struct config_item *item)
 	kfree(policy);
 }
 
-static struct configfs_item_operations stp_policy_item_ops = {
+static const struct configfs_item_operations stp_policy_item_ops = {
 	.release		= stp_policy_release,
 };
 
-static struct configfs_group_operations stp_policy_group_ops = {
+static const struct configfs_group_operations stp_policy_group_ops = {
 	.make_group	= stp_policy_node_make,
 };
 
@@ -466,7 +466,7 @@ stp_policy_make(struct config_group *group, const char *name)
 	return ret;
 }
 
-static struct configfs_group_operations stp_policy_root_group_ops = {
+static const struct configfs_group_operations stp_policy_root_group_ops = {
 	.make_group	= stp_policy_make,
 };
 
-- 
2.52.0


