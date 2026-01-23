Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC38D77882
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 16:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hnPA4sl0+Jt4lsr3fr8YXWP8i0XWUGqVAP6CbFIbtTM=; b=PerP8ghPNkZJoTq3p36wHGpQx9
	Ejp6JKxuZtSsTeV2rwzzHARwkiDIA4Xaw2I1E4YdraldnZRySASwJPKAxVJhkEcInnRNWwK+0XN3j
	7MFEY3TMDxjz+CMn35C+LC+7TKJkaGZdo9jsT+7sqJknZr5BdfVhPa+XtTyL/EmpvVRfUYFEnsAAu
	bcVwKV4hnsfPUGImzpJSFelikrx2kNq+a55jUrzj1YCJ2gz/v/4KcLZA0gIkRzo+dV1JASsZZ3YBP
	jMvEci01WVzIVWMSRVyeSUovYVh5pITZzfLqMS0ECNYl5i+Y+mH93ml3H3H1BaWHFMBAaoe2EhGCE
	lZihL6Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKNo-00000009EOd-1FpA;
	Fri, 23 Jan 2026 16:51:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjKNX-00000009EAw-2v8a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 16:51:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 45C79168F;
	Fri, 23 Jan 2026 08:51:16 -0800 (PST)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F33C3F694;
	Fri, 23 Jan 2026 08:51:21 -0800 (PST)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: alexandru.elisei@arm.com,
	andrew.jones@linux.dev,
	eric.auger@redhat.com,
	joey.gouly@arm.com,
	maz@kernel.org,
	kvmarm@lists.linux.dev,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [kvm-unit-tests PATCH v6 12/14] arm64: add EL2 environment variable
Date: Fri, 23 Jan 2026 16:50:51 +0000
Message-Id: <20260123165053.2250754-13-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260123165053.2250754-1-joey.gouly@arm.com>
References: <20260123165053.2250754-1-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_085123_780610_AB6F350C 
X-CRM114-Status: UNSURE (   8.53  )
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

This variable when set to y/Y/1 will cause QEMU/kvmtool to start at EL2.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Acked-by: Marc Zyngier <maz@kernel.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 arm/run               | 9 +++++++++
 scripts/arch-run.bash | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/arm/run b/arm/run
index 858333fc..2d5ee672 100755
--- a/arm/run
+++ b/arm/run
@@ -59,6 +59,10 @@ function arch_run_qemu()
 		M+=",highmem=off"
 	fi
 
+	if is_enabled "$EL2"; then
+		M+=",virtualization=on"
+	fi
+
 	if ! $qemu $M -device '?' | grep -q virtconsole; then
 		echo "$qemu doesn't support virtio-console for chr-testdev. Exiting."
 		exit 2
@@ -116,6 +120,11 @@ function arch_run_kvmtool()
 	fi
 
 	command="$(timeout_cmd) $kvmtool run"
+
+	if is_enabled "$EL2"; then
+		command+=" --nested"
+	fi
+
 	if [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ]; then
 		run_test_status $command --kernel "$@" --aarch32
 	else
diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 16417a1e..01cc1ff2 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -596,3 +596,8 @@ set_qemu_accelerator ()
 
 	return 0
 }
+
+is_enabled ()
+{
+	[[ "$1" == 1 ]] || [[ "$1" == Y ]] || [[ "$1" == y ]]
+}
-- 
2.25.1


