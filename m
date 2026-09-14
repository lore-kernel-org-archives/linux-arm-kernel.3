Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAE6C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 15:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDrKifl/5L8Q/194BlKz7aVrN3q2ZV4kD4gHTnyMxFY=; b=s0KRAs8EZJfDyaUqSuS1Y/RjEa
	6m1U4J8C0PgtB8R9z+Mqu4z0GkTRnfO7lqs6q7NSoO4e+SZpcilOdihsSsLd33SIqKiUTbcVHZjis
	dLbvFFCCD/W/+HJaf7hUFvwlSJ6FxJQ2gv1EFcfpvzbqMHbRIAI92Ra3UmQKtDTMuYiFjSUrscnQE
	hMYZ9bZcjzS1ec8BjDb1cGw/axOgHjvhMWjUt20ymbKTuZbec29A9kl0sv8VEOnIQfqb5RJ0PwSBl
	VLrWwcycNlqJd6whA6FjSApqq2hxe4Jrc0819tKhZNwqrphX4E77BSnseIV8ZeUwVDs32+DWVTjBr
	IRv53XIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x695T-00000004Exq-0pnm;
	Mon, 14 Sep 2026 15:59:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x695Q-00000004Ewq-2xSN
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 15:59:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TDrKifl/5L8Q/194BlKz7aVrN3q2ZV4kD4gHTnyMxFY=; b=Zu5AF8NQJdpMCEcN2ZwJJvEtHn
	++EC7Nyz4f3rM5gXvjkoR3b+xwvx04DiTnrvG4LCuemUrFKwsiKViJBBjNZkDL+guqSpqQqdaNY0s
	/xaDzOJDK4XUxifqW7JwTgEvas31aVqkdGflQRIq+dDoh+ezKyjNGNQDiXIjU3qifBcZroU+qh5Fm
	9YWQv9/VP9H7TR7LkkW5aSERKEWo58S53IOHDp/eL1Nk4wib/BNnoF8JWz8oDtCWuvM7UiD2Rp+WG
	wLJ+M722HRQ9K+Ka0GkFgEtqmHxfR29Yja1z3OMSL3fpkTWjrWEO8J5NmY7c8CLEdVaZq8lwVDN5g
	uUU9jIww==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x695N-00000005oMp-2Y0x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 15:59:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2EF841CC4;
	Mon, 14 Sep 2026 08:59:08 -0700 (PDT)
Received: from e135073.arm.com (unknown [10.57.7.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 422CE3F882;
	Mon, 14 Sep 2026 08:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789401551; bh=+IY27kKgwLo/EDgbyV/Lm6hsc0BtWZRKYkJ83KZEEF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tJB0bVrqZl0hJ+tXz/a38j5HcIOHarym8a7BzDepN+RSGifxuzS04Z9BF9bTId5Q7
	 KTkQyp54mWolEmAgpAuVh18aOEnT5O8NejTB/JNPqYFQGB48jfmw9TK1z8GUnfXShH
	 ryyFOkog2km79job2ICnk8KqZwg1HELmVV/9nXd0=
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Pierre Gondois <pierre.gondois@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: fvp: Add cpu-map property
Date: Mon, 14 Sep 2026 17:58:51 +0200
Message-ID: <20260914155854.123341-2-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914155854.123341-1-pierre.gondois@arm.com>
References: <20260914155854.123341-1-pierre.gondois@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_165914_048526_C3CDC77F 
X-CRM114-Status: UNSURE (   9.05  )
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

Add a cpu-map property to fvp revc to describe the topology
of the platform.

Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
---
 arch/arm64/boot/dts/arm/fvp-base-revc.dts | 32 +++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/arm/fvp-base-revc.dts b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
index 68a69f17e93d..5c4dd1cf0daf 100644
--- a/arch/arm64/boot/dts/arm/fvp-base-revc.dts
+++ b/arch/arm64/boot/dts/arm/fvp-base-revc.dts
@@ -44,6 +44,38 @@ cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
 
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+				core2 {
+					cpu = <&cpu2>;
+				};
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+
+			cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+				core1 {
+					cpu = <&cpu5>;
+				};
+				core2 {
+					cpu = <&cpu6>;
+				};
+				core3 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
 		idle-states {
 			entry-method = "psci";
 
-- 
2.43.0


