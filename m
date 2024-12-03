Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F029CE64A89
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 12:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ki8dLjMkjEMHoV+nUNlClvK3cClOLAf+gsN+h03OqZc=; b=He4fthmI5mk979/GNP6SKLZCF4
	NL9emZxj+IN3w7fOVnkoI+wtZ+90bdfQapEQXq//Aa0bxf9cWa4L/n3xQU85xhYcuxiwjJvA/0MhK
	He839xQhnJINSJ4hFFsdRhXeh+GCPoziOkF3mtmKMwwikwl2jneBhSWmU51WkcVxGzatBu/+UO0iI
	gnE6QuxhUfNar9yNiblLhuBX/GUg1XhA2YepgHEvIBMVtTNu/iD4XuWCuP/g5WEQtuCfwoviiKNXL
	uZkTHDwqCqyVXTY2xF8LInSaSIP6mncYRcGiVEgg8+wqmYFv3zeVYxPmiVQl1VT/n04mlwvbLC6EP
	nh/353ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tISLP-00000009Ufe-0UgF;
	Tue, 03 Dec 2024 12:49:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tISFm-00000009T02-2A6I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 12:43:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8C7C0A40D14;
	Tue,  3 Dec 2024 12:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2744C4CED6;
	Tue,  3 Dec 2024 12:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733229825;
	bh=JZ5YG/ZPtu0+rE3J++aCFRB1wnbLT9/tbF2mceWYsQI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MqLNpnMSxfXKNkwAiyGtAHz+PjY/cEOqfzx5pk84QkspoLpvAFTQFHDuQCjBOaOcH
	 hrYzxEPOBT47SUYd8CP2haXoa3m220LYpP1V+E7FZA37UDa7RQ/AsmF/WXF1qTPjl2
	 z5hIL8DZigDgWiuy4td6/Gl4CkrjBQd9o9EQtFwqVctEiGb0pMx1nGwEM/VR33Y1ti
	 v1KgeYmOAGuR5YkSdSlHRZ3ETjREGAyjFDY6C1rxmQSZLJ9+YAebrLn6cEQjKzyYRT
	 /MQQnzT3CisaeNQ0ywvN2AAXkTXYjLai1zON7J4K1bdQlaZaj8vt9R0EjMN5nYei8f
	 jHktvBXb1YLww==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Dec 2024 12:39:20 +0000
Subject: [PATCH v3 1/9] arm64/sysreg: Update ID_AA64PFR2_EL1 to DDI0601
 2024-09
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-arm64-2024-dpisa-v3-1-a6c78b1aa297@kernel.org>
References: <20241203-arm64-2024-dpisa-v3-0-a6c78b1aa297@kernel.org>
In-Reply-To: <20241203-arm64-2024-dpisa-v3-0-a6c78b1aa297@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-9b746
X-Developer-Signature: v=1; a=openpgp-sha256; l=771; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JZ5YG/ZPtu0+rE3J++aCFRB1wnbLT9/tbF2mceWYsQI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnTvz0exMUM1k05N+NteMxb/PS3DKFXKYKVDe2VAqA
 u7dI2GOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ0789AAKCRAk1otyXVSH0OJsB/
 4qAZ0/ezAvRfl6l87cUQLXedjUo+f5aJjldDkEkycIdA3mI1yC+bS7BSrN4yPJJf7QAJ33nqOMvLw9
 xeogePvloWXukyFZktUUSu3IfhR3Pc9+rlaaaYTQRdxJAhNB6EAUI3tVzxKDP0eJIlTceaBRRuWBaN
 Sm61AwQhZ5pKS2G/5PNmj1i0d8iNy+lxBPvjuOLINs68EKSBardSmzQkzi9FWjyKqsqfERYZdlLwTM
 P8qti1abSvRRd1KXnM73EUY3nufr0ZHogeLzNClxNQAfKEO6AKAQEgC+HuGBeJ/fK2wVeOeqVg6C/q
 jNMPPMnKFaUU3ernj4bq888DY8eHlT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_044346_627569_39AB192B 
X-CRM114-Status: UNSURE (   9.14  )
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

DDI0601 2024-09 defines a new feature flags in ID_AA64PFR2_EL1
describing support for injecting UNDEF exceptions, update sysreg to
include this.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/tools/sysreg | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index b081b54d6d227ed8300a6f129896647316f0b673..911f16c82ebd3ee98ffed965b02a5c6b153bc50c 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1010,7 +1010,12 @@ UnsignedEnum	35:32	FPMR
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-Res0	31:12
+Res0	31:20
+UnsignedEnum	19:16	UINJ
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+Res0	15:12
 UnsignedEnum	11:8	MTEFAR
 	0b0000	NI
 	0b0001	IMP

-- 
2.39.5


