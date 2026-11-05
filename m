Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F75606A33E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 13:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ae4IIBdZ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LAr2QT90
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PmLgfONm0B9kDi1GLc/kUSc/oZ1yeBtj5KqaQkDNgWE=; b=ae4IIBdZ6ZSxsVni/SXDMNQxYm
	tJ0gX7N3qXtz87qEo0AfZXbnJrqycFjLSUDVAMM5iDpsoTpQNpQs2w+vx1dEdl+LYhs8uWeze1L/b
	Y730Hj59T9449nO1wEWC0tqHonf7kTLJnjOexUJbdRGAAFlMB4SrdWmNkpQMQxSW/7gVHhUFh+6xA
	05K2UJeSk0Xx2iiAso5tx9HBJdFfH4c9u1oSuc+udh7qsLuhxBAk1QjS7hMNE2f2WH/LAjlv/5WHc
	d496mbVeQOwbW2zCKezzGos1FIikzOX0US0x72UmTg6rQM9b7rS2pbnadndrK6PU77cF2ukzXpWHM
	UcyOf6tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxQW-000000096bT-1wye;
	Thu, 05 Nov 2026 13:22:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOxQV-000000096bG-1i3M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 13:22:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DAEF743773;
	Thu,  5 Nov 2026 13:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3E91F000C1;
	Thu,  5 Nov 2026 13:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793884966;
	bh=PmLgfONm0B9kDi1GLc/kUSc/oZ1yeBtj5KqaQkDNgWE=;
	h=From:Subject:Date:To:Cc;
	b=LAr2QT901Y+36f6XoQd0SRA85p3FJ5jGKt2xU4Ssz3ZjhjVbPECQwBJy8IHcQYN3s
	 YGSqQNxmcgmcCzYi1UPxVmWcqqTKo5BmOwJ7iJifK57Z42cElH0mHHJ/ZUl+usKsck
	 SuNMxgPsBGmrDorl0FNK8opSAjhQPTQMKwcRTfGNBj05rUrDRjNf1tq+lk/RYhEBFh
	 wBWHhfVL9kGWmJ8gi2w/YzbsGa38ZOUwP4fDTpge/m5G+9XUg02Y4WCkw5V6PRS7Hd
	 dRtFxPXBY28tM0nTLicnqyF5+v7xFcehUNytj5HBuCEi5FYczmbIv2+8KJRe21Qczk
	 nNkJXWO9KYhMw==
From: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 0/3] arm64/gcs: Store the GCSCRE0_EL1 register value not
 userspace mode
Date: Thu, 05 Nov 2026 13:00:11 +0000
Message-Id: <20261105-arm64-gcs-store-gcscre0-v2-0-954d5bffd69f@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN197GoC/3WOyw6CMBBFf4XM2iG0EAiu/A/DotQBqkJ1Co2G8
 O+Wx9bdvcm5jxkcsSEH52gGJm+csUMw8hSB7tTQEppb8CATmSelEKi4zzNstUM3WqZVaaYEJaU
 ks5zyplAQ0i+mxny25mu1ezfVd9LjWncQTO8pTI47BrVyhNr2vRnPkS/iDFkLWNOdWde+200vN
 vh4VPx95AUmmOqyUaUUaa305UE80DO23EK1LMsPUVRK+P0AAAA=
X-Change-ID: 20260911-arm64-gcs-store-gcscre0-2e3e246e6f7a
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1938; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Fp7oPz3FzNcGX9WflaVw2B2izesgMMHdYL9LcvF2wwU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLeNCv/bTxpOfdDDcOVe0Xlz5fcm2NWoMy0sylv05QvZ
 /Q8Sm+VdJSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiVe8Y/tmkSLywWrjq3fv/
 +ho5qV8UmLkedipZrXe016g+6LrNv4aR4YullsdzjuzknQIfonU/uMn5S3Aw3Yw8JHzm5do1M4u
 XMwMA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

At present we store the userspace GCS mode for a task using the prctl()
value set by userspace rather than the mode configuration written to
GCSCRE0_EL1 which means the register value needs to be generated on each
task switch when the new task uses GCS.  Since the mapping between the
two is easily reversable switch things around and store the value that
we need in the context switch path.

While reviewing this Catalin noticed a bug with handling of mode during
signal restore so fix that, then do a small refactoring to move code out
of the header, and finally make the switch.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
Changes in v2:
- Add a fix for failing to update the GCS mode.
- Always write GCSCRE0_EL1 when setting it for the current task.
- Use u64 rather than unsigned int to store the register value.
- WRITE_ONCE() when updating the stored register value.
- Link to v1: https://patch.msgid.link/20260917-arm64-gcs-store-gcscre0-v1-0-3c9fa9213bac@kernel.org

---
Mark Brown (3):
      arm64/gcs: Ignore attempts to change GCS mode during signal return
      arm64/gcs: Move gcs_check_locked() out of the header
      arm64/gcs: Store GCSCRE0_EL1 values instead of userspace mode

 Documentation/arch/arm64/gcs.rst   | 13 +++------
 arch/arm64/include/asm/gcs.h       | 25 +++++-------------
 arch/arm64/include/asm/processor.h |  2 +-
 arch/arm64/kernel/process.c        | 11 ++++----
 arch/arm64/kernel/ptrace.c         |  4 +--
 arch/arm64/kernel/signal.c         | 28 +++-----------------
 arch/arm64/mm/gcs.c                | 54 +++++++++++++++++++++++++++++---------
 7 files changed, 63 insertions(+), 74 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm master
change-id: 20260911-arm64-gcs-store-gcscre0-2e3e246e6f7a

Best regards,
--  
Mark Brown <broonie@kernel.org>


