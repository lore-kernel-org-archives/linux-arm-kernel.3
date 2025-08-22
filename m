Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E4DCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 06:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9V4svUo4P4CXlXoJxsKPVlmllse5h4ylOqa1tyiqduE=; b=25Lw5rxYjLjkAhgUeOXFU0dDof
	LRbtsg6C5fnLoCyOBDtVu5JtDNJMTdmm5QsGvXd5+kxTzsvrGjK5oemhSOxTBwmEE5NdnVBjA5VhW
	ImLstfC2/ph0xGQEQhNXOMAwUvWcWPc0TPj74S0YqyP+iCqNa4OW8EeAZ1STR+s2P7ZAO0qEEiOSz
	swZfeNHNfWlXfB8fm1sTeXERyHH2gGiKoUnxyRIZXvIyEVHt1cWN6Fo6YcWJ5F/Q5gerwonGK7h1w
	e15ko8HldLVLebGfu93r1B/IZkuv5HpVaQjZW6UOmmFUkUFYOZNvoLSvnmv7OQHNIJeQCldiGeB59
	DYvl4xYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLD1-00000001gtr-0cSc;
	Fri, 22 Aug 2025 06:25:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upGzA-00000001BRU-2k4A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 01:54:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D72AEA58760;
	Fri, 22 Aug 2025 01:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3971BC116B1;
	Fri, 22 Aug 2025 01:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755827671;
	bh=G6Ht9INfK364jYp0ofZOIq49bsCw7bcFjAmT7TRHKx8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DM0M271g5lQPwotvwbxFy0I9y5Z+lweO6zmFZ2UMsOPxBOBfO/wvIcnPwF7Jvm5Om
	 cgOs1GZQuDSjmo7qT4i3KLJ4/xWJjDZCa7TsascPFOvdzndZUfBJha8ezQqaTcb8EF
	 1jDPlNoF+lbfB/qLl9aG2p0CF+hcQ25MBtAZtp1pSn3tYGyNf/BkDwHamRQwQNCjbB
	 /ZC4+uPLzDN6YqkX60p6SMzmvYX0zncJtvEwetn4Y60gdJUJJeq2T2W3DtU/soGWrM
	 EjA6ZvGxnMFE4s4huyW9gpE9j9tG4VAP4pQX5EaD4U/dftCJjMbdFNVRGdzgmEBGDW
	 f5UCNCFgiGggA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 22 Aug 2025 02:53:30 +0100
Subject: [PATCH v7 01/29] arm64/sysreg: Update SMIDR_EL1 to DDI0601 2025-06
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-kvm-arm64-sme-v7-1-7a65d82b8b10@kernel.org>
References: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
In-Reply-To: <20250822-kvm-arm64-sme-v7-0-7a65d82b8b10@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=933; i=broonie@kernel.org;
 h=from:subject:message-id; bh=G6Ht9INfK364jYp0ofZOIq49bsCw7bcFjAmT7TRHKx8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBop825gBpk0joPx8ZrHWCZPK5OkpZBjPVq+c7zj
 Kis9wVS0myJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaKfNuQAKCRAk1otyXVSH
 0KlSB/0Y9abY+riGwYWOySjPbCGGTymnhIrc7+c9wMa2G6eLR/t4z92bKXn7x4Eq5vcnkWyZPzA
 y0IG/CFXetslgbuLUYKUEcwfJxVLJOLlIuwUN5nYf5AYZKNwPGARQthDiEEqFkFctEaed0JCn6f
 yw9mpvyPjnCPFsFS4hhGSldHvGOJNTfUfa16PIo+nxDcC6FjyCKx9Hb6HkIXpcVXtTkVfI/Ddeg
 /w/uyo1fcAQAaFnMrevZh98pynztRoQ+F4bYJYZZtQHcTxdJL5GS3J++UQNPz087tDXv9oSFyby
 24efFVecbhL51mr+nsH1WR3RYHO7RWnQlVvdDRPnS+JcB4fh
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_185432_762261_DB30C4C0 
X-CRM114-Status: UNSURE (   9.35  )
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

Update the definiton of SMIDR_EL1 in the sysreg definition to reflect the
information in DD0601 2025-06. This includes somewhat more generic ways of
describing the sharing of SMCUs, more information on supported priorities
and provides additional resolution for describing affinity groups.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 696ab1f32a67..9a1adb234ff0 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3659,11 +3659,15 @@ Field	3:0	BS
 EndSysreg
 
 Sysreg	SMIDR_EL1	3	1	0	0	6
-Res0	63:32
+Res0	63:60
+Field	59:56	NSMC
+Field	55:52	HIP
+Field	51:32	AFFINITY2
 Field	31:24	IMPLEMENTER
 Field	23:16	REVISION
 Field	15	SMPS
-Res0	14:12
+Field	14:13	SH
+Res0	12
 Field	11:0	AFFINITY
 EndSysreg
 

-- 
2.39.5


