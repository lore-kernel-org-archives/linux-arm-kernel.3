Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E1FCC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fZ98rKV2qgLum/+P4EmQhdzj1LoFCO5Z6fdVZ38ePxI=; b=HUPULCv/0MWkFU
	XN0Y2Qog5okY5Sm+9zjFEiyXSkhWg1HoBUSniRWSrUyOIP/522WyJyt+5Wn4CrjDkYSUxSag60EW0
	NMN7WgQ8ThBMe68K0PS12lM3jPdM2APIw+tB2goPixaFLWCZGxB17gOnQgNrslkQZMG6RRg/TmL5z
	49UGaP76TXI0tq6V9DXHxszWOqdtJ8oFuP7uWgeTzf0OfE6NYbNwiJvOPaczqWeZ/Fgfex2k/PX05
	85wyvcqx9KEbiiDNCZDqwc4eUX1DJlVsDx9tPHu7LhGa905paOtjwEAEYrHpvAVYeQhaG7OavM6yT
	I0nTiw3d2vxbsawvGi2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR22-0000000CX4G-1NPq;
	Thu, 03 Jul 2025 20:59:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMls-0000000BzNd-0CEW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 16:26:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 512355C6665;
	Thu,  3 Jul 2025 16:26:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B930C4CEE3;
	Thu,  3 Jul 2025 16:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751560007;
	bh=OzkE5YzGv4a64gH/xm2Y6n/iTkv2o7eX4zO+nwD0Ap8=;
	h=From:Subject:Date:To:Cc:From;
	b=KBUEAZ87bw/Y/xEK0apWiSR911PTT0LR9C1AwPeoI8I/PEvYcPORmV+Mkx6jR+Df1
	 0V+VW7maFgzuWXElMdIjqDQTp3GksChr0n6TuZa3CDlzN6YwtufdZfHQK7GTaFsHX7
	 ekvX+aqtiNOyko08UVP/Ja+Z+dP9Qgz40rtqhpqFx6kWLONK3BDLgk9hbCtZDIhI7r
	 q5cuXSPqJIUjW2H9DnAU4F0xf4+3oc4lXQU5hEsPzZIb5fn+qkiRb2zviruLhgOnei
	 etnJzpcXYHqHdzCaPw5jYX3KXOG6wRkfFZWnrcX8KsYza7xfW78R5AjRBmy+JTOCte
	 uVUc9ZGTylEIQ==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/3] arm64: Support FEAT_LSFE (Large System Float
 Extension)
Date: Thu, 03 Jul 2025 17:23:21 +0100
Message-Id: <20250703-arm64-lsfe-v2-0-eced80999cb4@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHquZmgC/03M0QrCIBTG8VcZ5zpDTd3qqveIXZg7btLSOMYoh
 u+eDYIu/x98vxUyUsAMp2YFwiXkkGINuWvATTaOyMJQGySXmhupmaW7UWzOHhnvBHf+2NnBSai
 HB6EPrw279LWnkJ+J3pu9iO/6Y9p/ZhGMM9MdtHDq6lslzjekiPM+0Qh9KeUDMRaQiaUAAAA=
X-Change-ID: 20250625-arm64-lsfe-0810cf98adc2
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-cff91
X-Developer-Signature: v=1; a=openpgp-sha256; l=1238; i=broonie@kernel.org;
 h=from:subject:message-id; bh=OzkE5YzGv4a64gH/xm2Y6n/iTkv2o7eX4zO+nwD0Ap8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoZq9AOYzU26i6ZGFfSMwLvu537cdZGFtRz7FCh
 kPlYrEAQmiJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaGavQAAKCRAk1otyXVSH
 0BalB/4//XC+LdiJOx3alnA2tkZQLlecke6VHexYSrI5wWWv/VqWKzMe+67IwtuwVS1YxdIwqBR
 jMy2TvSlbqfHwxEajUP44zJONeBXOxbgV1j4wZpE1v/r1/QZ9PO/vwhf/jdxDrBkv0ijDGlmMAM
 y1v4N/0LHVxAh+kIRd1AyML94OJa0vieDFPzbFE09L0fUC9nd2mlCsYw+wtNnbGQWgZRnwt04LS
 CFbkevJNSqCSEk3X1wulPJdgL5UfC/5jkH/fShyn3vklO6G30NWR7be0mYhSyAvnJ2b7wNdrBSs
 EsZGUBw4nGVF5O0Zo3tWbTFYRLZFZvNvD7S9S+HiKXDA6aaJ
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_092648_133056_5FA365AB 
X-CRM114-Status: UNSURE (   9.93  )
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

FEAT_LSFE is optional from v9.5, it adds new instructions for atomic
memory operations with floating point values.  We have no immediate use
for it in kernel, provide a hwcap so userspace can discover it and allow
the ID register field to be exposed to KVM guests.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Fix result of vi dropping in hwcap test.
- Link to v1: https://lore.kernel.org/r/20250627-arm64-lsfe-v1-0-68351c4bf741@kernel.org

---
Mark Brown (3):
      arm64/hwcap: Add hwcap for FEAT_LSFE
      KVM: arm64: Expose FEAT_LSFE to guests
      kselftest/arm64: Add lsfe to the hwcaps test

 Documentation/arch/arm64/elf_hwcaps.rst   |  4 ++++
 arch/arm64/include/asm/hwcap.h            |  1 +
 arch/arm64/include/uapi/asm/hwcap.h       |  1 +
 arch/arm64/kernel/cpufeature.c            |  2 ++
 arch/arm64/kernel/cpuinfo.c               |  1 +
 arch/arm64/kvm/sys_regs.c                 |  4 +++-
 tools/testing/selftests/arm64/abi/hwcap.c | 21 +++++++++++++++++++++
 7 files changed, 33 insertions(+), 1 deletion(-)
---
base-commit: 86731a2a651e58953fc949573895f2fa6d456841
change-id: 20250625-arm64-lsfe-0810cf98adc2

Best regards,
--  
Mark Brown <broonie@kernel.org>


