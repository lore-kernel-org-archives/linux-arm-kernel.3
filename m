Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3910CCD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 15:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5s6vN8OxTfaGTRXDJdSUgsnXca1rcHZgjWlrHAtspVw=; b=rV6ZUKVWVrGmXf+lSuA7Z3KRIe
	1U7JsQF8ueQBBXOnIfT2mRRoAdwkTLWHtBa9OrQSWaxPSRdV5GSnI234tPJXFhCMroNojWLfl4mVA
	Zs7D18CpwUbK9eGpng1enbFMm6mGOGy3e59zuwPwGch8ZRPw1SLQ+2FOXPRw2c2D2/5+fKf/1gOvi
	d7cVZiCGioKsUQ8KO500G1AbTM+i6D37m8kJicild5Tz8KZWGXb1QE7egIPnxJgSm+P+i9t1MO3Cv
	/vx0m8ag7ZTzC/0YeD0RLzfdCH1BZSJ0GMjIOiRphl3hX2p/wi2QqUiLElSp1Rep2BBtdUvcTNOGk
	2pQtQDSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF0w-00000001W6E-0h0h;
	Thu, 18 Jun 2026 15:50:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF0p-00000001W2I-2srb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 15:50:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 046F8491B;
	Thu, 18 Jun 2026 08:50:34 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 438273F632;
	Thu, 18 Jun 2026 08:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781797838; bh=9hNsmJq6SLjzU6jtsTuH9b/BZQBolGiCo+qZXnf3dHU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tvc9do6pypNzDaQ/d3CWrhaHBerWBrVheTMP9Oh9NNBY9ry8wx80xKIskcH6NS/6v
	 XHHls9scM0j73vDxv5ntApe5R3R7aks1Y+0fP90wtIUdkhfJqrFprMs19fUOm3187/
	 AaZvDFyWNpIfVeZKvh9v3OKo3mOe4ir/uLiMwxts=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: will@kernel.org,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org,
	oupton@kernel.org,
	jean-philippe.brucker@arm.com,
	andre.przywara@arm.com,
	suzuki.poulose@arm.com,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH kvmtool v2 2/7] virtio: Do not modify const strings in virtio_9p_rootdir_parser()
Date: Thu, 18 Jun 2026 16:49:56 +0100
Message-ID: <20260618155001.226266-3-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618155001.226266-1-alexandru.elisei@arm.com>
References: <20260618155001.226266-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_085039_779938_34B4F655 
X-CRM114-Status: GOOD (  12.99  )
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

Even though @arg is of type const char *, virtio_9p_rootdir_parser()
modifies it it if a tag name is specified, leading to the following
compilation error on an x86_64 machine with gcc 15.2.1:

virtio/9p.c:1503:18: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
 1503 |         tag_name = strstr(arg, ",");

Fix it by copying @arg to a local string, which can then be modified
in-place.

Also use die_perror() if realpath() fails, to provide more information to
the user.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 virtio/9p.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/virtio/9p.c b/virtio/9p.c
index e6f669c49895..cf3e547d3173 100644
--- a/virtio/9p.c
+++ b/virtio/9p.c
@@ -1491,25 +1491,32 @@ struct virtio_ops p9_dev_virtio_ops = {
 
 int virtio_9p_rootdir_parser(const struct option *opt, const char *arg, int unset)
 {
-	char *tag_name;
-	char tmp[PATH_MAX];
 	struct kvm *kvm = opt->ptr;
+	char *tag_name, *copy;
+	char path[PATH_MAX];
 
+	copy = strdup(arg);
+	if (!copy)
+		die_perror("strdup");
 	/*
 	 * 9p dir can be of the form dirname,tag_name or
 	 * just dirname. In the later case we use the
 	 * default tag name
 	 */
-	tag_name = strstr(arg, ",");
+	tag_name = strstr(copy, ",");
 	if (tag_name) {
 		*tag_name = '\0';
 		tag_name++;
 	}
-	if (realpath(arg, tmp)) {
-		if (virtio_9p__register(kvm, tmp, tag_name) < 0)
+	if (realpath(copy, path)) {
+		if (virtio_9p__register(kvm, path, tag_name) < 0)
 			die("Unable to initialize virtio 9p");
-	} else
-		die("Failed resolving 9p path");
+	} else {
+		die_perror("Failed resolving 9p path");
+	}
+
+	free(copy);
+
 	return 0;
 }
 
-- 
2.54.0


