Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F41C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 14:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j4rpM8QfwP09RDNNI+Nm63Kiyl3kw02nPRKaKocuWUU=; b=4J/6xuzUbxIZH5
	y84PF4RL3xB/qfFIP2qiTqxZSZZXyG/m3HMQoWybwhSmJyctYoRSlIXxU7oYQzRLDOnfewnbZ1zS+
	sZivQyYKDEKJxc5TcTProaduV4UAr7zXBwdmIHtIsq0j7HlXp2VEXW+gQJrV6+bvAu0/M15EVgS6h
	MpG7gqqI6VQ158Dpkur2gIKH+jTyOa3kXddd6ghT/KPtho6ZlULKFZl1j0o5jtRAN+3gR4b51PVNa
	XxmTRV+ZuTJsOwfJk/6kGdoe4marDhLVq4VCWrUl0hto0Zc0rT77g8v42u/pXEDqt0BrFe5KxfclT
	9uJuW5XQNRd3gLyHVf3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0Lm-00000007Bba-2k4Y;
	Tue, 10 Jun 2025 14:53:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyJG-00000006oJx-266N
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=j4rpM8QfwP09RDNNI+Nm63Kiyl3kw02nPRKaKocuWUU=; b=ftXQqfw62bMliC6qhvcNOWKWlp
	vVby6QvjJuTsqr21PMcMDXeNgpV9z3O+2AJBTUrvsLK+kYAIuzynMOFCTLlKtzIDYBxayNxsKc7Ur
	Iynkc/wWlhkcqw1necN2FK+EjjJRJEgfWIp7r5wKmxsRsBJybS/+1f/di6IRj/sIYrHLuvmmbyRo0
	Y23GhsMUSTEJbf451hjMiDmpyfr/ArHs509irCZmR2fH2Y9V5ZSlOvFzPlvaOUk/xTDEReycIMpZI
	4pWg/KBcGwyar1UfF4gXtFblorBqh0FBtDAmSPkuHUBZptpdOBVSltiq+1F3GLhfIBDTkXhUjFzrl
	rk57yglA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyJD-00000001pO5-28oN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 12:42:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DC1B44263;
	Tue, 10 Jun 2025 12:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DF41C4CEED;
	Tue, 10 Jun 2025 12:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749559349;
	bh=/1iUBspDEJPAm1syGxDL8nO0vqi84Psh/DKw5YFPtZY=;
	h=From:Subject:Date:To:Cc:From;
	b=S6W8ANddI6Mxzhu+bXnGcpy8S6b5KZK+nZEs+R3mO2Auw38nnZC1tRvDbYZdoa1+0
	 Hpw84ytsKQ6UMY3RRV/KpuP9rMKbz5z/VDVqfpA/FGAgQKBEjEt8xVp4m0HPidvSGV
	 rlWFHjMs6YaD7pNrWyWC+0HX4Q5gFH7lzSCIOtHu8Dwg2EMFR8sWn72aaDRdAikOJw
	 EI6QgZONtHdHf1uf+Vq4aah3loDxstGSWePBaHay6Kj9nIO9hBjGyL84cFpp9ODwu3
	 WK47sJd+a+goDLNyagg+vBxTgzplTDmDiXhFFQJxdXvwVJj2kJGEArcbvXvm3SmqnK
	 WXav1c4Uxba4Q==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/4] kselftest/arm64: Add coverage for the interaction
 of vfork() and GCS
Date: Tue, 10 Jun 2025 13:29:43 +0100
Message-Id: <20250610-arm64-gcs-vfork-exit-v2-0-929443dfcf82@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADglSGgC/22NQQ6CMBBFr2Jm7ZjSUIquvIdhUWEKE5SaKWkwh
 LtbcevyveS/v0IkYYpwOawglDhymDLo4wHawU09IXeZQSttlNE1OnlWJfZtxOSDjEgLz1g62zl
 vK6OJIE9fQp6XPXtrMg8c5yDv/SUVX/sLVur8P5gKVHh3rlNe1caW9jqSTPQ4Bemh2bbtA6YdR
 OS5AAAA
X-Change-ID: 20250528-arm64-gcs-vfork-exit-4a7daf7652ee
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Christian Brauner <brauner@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=broonie@kernel.org;
 h=from:subject:message-id; bh=/1iUBspDEJPAm1syGxDL8nO0vqi84Psh/DKw5YFPtZY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoSCgu82PSVmQPG9g1oJQrsyvsTSf2h9mS1ONCsW21
 mqjhbFOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaEgoLgAKCRAk1otyXVSH0BMCB/
 98zbKt51BDbhAYnQSZMke8OJDPGCHrlTF1lGFJxPCARcuIDzBp0prKAYytmm00o9LOAKqSVTyCpegx
 36l/v8Ig3awVYYtpl5D3hnvGppd5weMjb59iEegi0cJaNRIHjnSYKjI8XjnlrRrRV+hkr1QsjDOdYE
 OF4si6AwG9Nskqf/O295slJO/OyJZiy/Jn7aKHbpXQE8Ldw9KckocVneCaqLoBhxDs0MeigiSicVpN
 97h4+IpmCEA45bBJhCoZNTGDP000E5Fq3/bOuLfWZLbY8fbCEaHD7MeDP+QqAHAzowbXjJcirYclA1
 FJ9v/u3BYt8jGyR6+o/ue1MRNC4WRw
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_134232_559258_CA43C4BB 
X-CRM114-Status: UNSURE (   9.32  )
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

I had cause to look at the vfork() support for GCS and realised that we
don't have any direct test coverage, this series does so by adding
vfork() to nolibc and then using that in basic-gcs to provide some
simple vfork() coverage.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Add replacement of ifdef with if defined() in nolibc since the code
  doesn't reflect the coding style.
- Remove check for arch specific vfork().
- Link to v1: https://lore.kernel.org/r/20250609-arm64-gcs-vfork-exit-v1-0-baad0f085747@kernel.org

---
Mark Brown (4):
      tools/nolibc: Replace ifdef with if defined() in sys.h
      tools/nolibc: Provide vfork()
      kselftest/arm64: Add a test for vfork() with GCS
      selftests/nolibc: Add coverage of vfork()

 tools/include/nolibc/sys.h                    | 57 +++++++++++++++++-------
 tools/testing/selftests/arm64/gcs/basic-gcs.c | 63 +++++++++++++++++++++++++++
 tools/testing/selftests/nolibc/nolibc-test.c  | 23 ++++++++--
 3 files changed, 124 insertions(+), 19 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250528-arm64-gcs-vfork-exit-4a7daf7652ee

Best regards,
-- 
Mark Brown <broonie@kernel.org>


