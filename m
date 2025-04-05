Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBB0C36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Apr 2025 00:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2DNvYO0bTfj7X+8PQ13cmGZGTNT4dkdJknnzMC9cIXk=; b=QxsXPNkaZ4C/R8q3+qPehal6QN
	SUFUiFlaD+UJKySfE4btKjaHyFrQV+D16vM4W/d02HRiFV9yKOnSf6jTEqIQ0fLb23imItpZWmDIM
	7aAV/bHMOkTNhFXiJsCdLGPz2g2E1R3+TDSA+wQnhRSIi+S1vP8Agrdl0jy3jRi4uC9TeH0f7jbW5
	wk+qkZnw3CtMb+z+ZsQlvdXUtjXbDqZW2qSah51GF0KS8mOBocPHknME/jqf0fhCUuq1hFAtzRHfL
	CR/uDBMwAJucY1V960wkWYkdN9AF/4MSUU1EC0vOMZi+h9T91v5Z5CCsoENY0ht6XJtFUXZJT1Bsm
	chGD8QxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0r9G-0000000D9o5-0wMa;
	Sat, 05 Apr 2025 00:12:34 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0r7V-0000000D9Tl-2AX0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Apr 2025 00:10:46 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-85dac327403so474133639f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 17:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743811844; x=1744416644; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2DNvYO0bTfj7X+8PQ13cmGZGTNT4dkdJknnzMC9cIXk=;
        b=RqnsJYbKnJerZQeaRMnfTuSaEsshouzwGWXB7O/GqqByYYKw9BZ3hSGsxXQV2lfMrw
         UsC9/I3dLIQqb84L7SjqlACeJUydr7XVLCZiB2ru83BQu3cvapFfSs86KgOwe7SEyg1K
         ns8hU7idw/YZrhWvp2b9SxnSF9nebRbQWS7LPDXGuPKH28hF0tQFE0cDEMmmQQ0vcQEJ
         9rKmNojkz+jpUmblAQIMAXBljQJ/d6Bs5QaBgvRW2/rtUG5nIcsP/YlNfdEZzRlvhvfK
         P/geQgHd/FXyf+rDdbBikaiV7fWcmDcxnaFrXt1R1L0yOeH5RYAY+H0lp3J4gHOP3ic5
         kcLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743811844; x=1744416644;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2DNvYO0bTfj7X+8PQ13cmGZGTNT4dkdJknnzMC9cIXk=;
        b=AIDcPdJ0Z7gbwrNFOm/IAM2f7mSk4KIrsTGT3FbMaHpP029T8BG3ZP5h0YJzyZLsgS
         tqL7pqD5g25rONSIyhPH775Z3E0XJbcw2XA5URxseizSgMgiMwnRMiFx15AE8xJVEmQ6
         aUntRcVkjofQO3ax3Dy3dNMqlsGCnoeIMhXgesCyqnX0GxL7DxFOXaY3tTlkxe7+AM7c
         f4xCGgIyjdVVeOGprwIHQZbOwM+vz6baSnizT9Z4Z/W4tUFWXrTQCBQac9G+7poC7FW7
         eJ1HKj9cVWtPROlWlSJGQpF2m+5hDXmHj0Moo5MNIJHl1S32txcYQfAarrBPJyRz41Ha
         dt+g==
X-Forwarded-Encrypted: i=1; AJvYcCVyHNgMRhVoV0izqD2PG1jelbHSpPWyko2PIXZgCVFrnitHkb27+wBF9mi1Caz/lklZMwbiOFSu6P/Aldtk9Hk/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8PHj95zE4YMRPr5orDIjz4+aZnIhKrLAYhgy87itKAAqWUxll
	FVZBZwE42kxZlkgsBFcZBnspd4vcaiQ1uX3TZZEJMWPLyswh4nawFlCgYeIvkAOwbSYNf2s/mS5
	/5nKVAA==
X-Google-Smtp-Source: AGHT+IESzYBYMsy8TcNeSXmOCuIMcY0rfkLLxruZnkYbIer8gFLQRo6rMLnXbA8I1jN134maNpjGU7IZC4nb
X-Received: from iobbk9.prod.google.com ([2002:a05:6602:4009:b0:85b:3e10:d317])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:3a12:b0:85d:a211:9883
 with SMTP id ca18e2360f4ac-8611c3bae5bmr467620239f.10.1743811844346; Fri, 04
 Apr 2025 17:10:44 -0700 (PDT)
Date: Sat,  5 Apr 2025 00:10:40 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250405001042.1470552-1-rananta@google.com>
Subject: [PATCH v2 0/2] KVM : selftests: arm64: Explicitly set the page attrs
 to Inner-Shareable
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_171045_557898_37347D8E 
X-CRM114-Status: UNSURE (   8.88  )
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

The series fixes a conflict in memory attributes in some
implementations,
such as Neoverse-N3, that causes a data abort in guest EL1 with FSC
0x35 (IMPLEMENTATION DEFINED fault (Unsupported Exclusive or Atomic
access)).

Patch-1 is a cleanup patch that replaces numbers (and comments) to
using proper macros for hardware configuration, such as registers and
page-table entries.

Patch-2 fixes the actual bug and sets the page attrs to Inner-Shareable
by default for the VMs created in the selftests. More details are
presented in the commit text.

v1: https://lore.kernel.org/all/20250404220659.1312465-1-rananta@google.com/

v1 -> v2: Addressed Oliver's comments (thank you)
 - Moved the TCR_* macros from tools' sysreg.h to selftests' local processor.h
   in patch-1.
 - Adjsted the citations to describe the issue more appropriately in
   patch-2.

Raghavendra Rao Ananta (2):
  KVM: selftests: arm64: Introduce and use hardware-definition macros
  KVM: selftests: arm64: Explicitly set the page attrs to
    Inner-Shareable

 .../selftests/kvm/arm64/page_fault_test.c     |  2 +-
 .../selftests/kvm/include/arm64/processor.h   | 67 +++++++++++++++++--
 .../selftests/kvm/lib/arm64/processor.c       | 60 ++++++++++-------
 3 files changed, 96 insertions(+), 33 deletions(-)


base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
-- 
2.49.0.504.g3bcea36a83-goog


