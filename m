Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725CFC35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 11:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3b2WbG9Dw9w7LVvz8ibLRK4Lkcz47Aas7wt/j6jq4h4=; b=LKYhasmJTOMTZe
	N30AvzO0/jyBv3r+GdgIJXnPzLDLciNO6xh2yQshj+rFN+V8E1TOa6o1R0tHfjp4TYCxwFZJ2yGZX
	A9lMOhN+bOGpbk/kFwUNNoR0OFfiIAQeUS/S1unDq3aEeoJXM/lweCdje9ecgj0VqD7iizslGQ5qJ
	8PMdDKf4wAL6RrHWVzCA3yrQfVxKoubuwUNDk/2X6X3n1n2EdVL5nKmyqAXNNBp6erGT8hEGklSY1
	xLxOH/yCL61nbqsqF/i3Uz2QOYqnmWBRIQ42uPZMNl8wvnvXRRJYTPsTU6wwWO9jhSWPZSVhhpTXR
	r9306IqHvBrADmTE/JCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1turn3-00000008rKE-1TCD;
	Wed, 19 Mar 2025 11:40:53 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1turlE-00000008r5r-3NCq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 11:39:01 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-225fbdfc17dso65107655ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 04:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742384340; x=1742989140; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3b2WbG9Dw9w7LVvz8ibLRK4Lkcz47Aas7wt/j6jq4h4=;
        b=KfeJQnzHN1PJzXcAGTPGtR9WUdXbSRkdWfEee2lAdT8N16zloinuOuNBBdojegMWs0
         Ubvc37GorGmlSZ4F7VzNG8mL+cNWmNPFswOp2BOuR50OEinESWayRKNeW9Ra1ft6GFyQ
         J784rkQ8+AVIS70pd8XKykXJKnsVS7jkbKPt4GaItJzPW3MEn8htJdtUFciT/rH6pSjn
         c7lLT3Z27PzSOHL8skl7tW0uz6BIdOMOmCoNeMEme0PsJiMjDcDYekjWOdGjs/i4kalA
         cP3KsnY6lh8k47ToEpHCpuJY1rR90jEqVLqTpKTpA6N8Kwy40lDVMWD69OWnqV99gSMR
         SA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742384340; x=1742989140;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3b2WbG9Dw9w7LVvz8ibLRK4Lkcz47Aas7wt/j6jq4h4=;
        b=GZM2kC6btR6t2JgibX1wtFA4sC7vSZq4NJBh7EUc+nz8jBrDJtwaOJeMgyo2jriilP
         Pvd5ASPT4ky7MKOG5w8ykeVfi3+bi+iBrVJ2Qne2NonF/8OcdC+vMsoYCiEc6tpqvmpe
         Jk1bODVwsipuuQh23pK7r8dFyt4ZnI3nNNyyGl6lvJEREV/gNCqzX6RwWj1/jyKHJmfK
         CJ0ETAoLmPqogF1zGSoPDG7tH/6JGVrGk4iowDBMGcGUPnfP+8uR8W3ZFfIxYYKHEcW/
         nKFeKbzAnI7ZgwpnoKlefTHJNAfL3gINWo7ABrwBh1IXf0mxKHIXvFAwYM7ZK8+c8zDf
         pZdQ==
X-Gm-Message-State: AOJu0Yyq4wXmm63TfGgtMOxLelipMCBTTYhfPr+M2qEfhWhQx3feOp4D
	Mf80Awvjoem+m1Xghmrn19eThBwxPK4ghFuNKqJJ+8reMLcXGO4pcUuk/SWqpKt+ljDuJLpAJxU
	yoow=
X-Gm-Gg: ASbGnct3T/KgH1VrUW2q/uftlugJ5TvP85U0ah6OlCrqz4FXZ8KHBToFnW6LiQagvRV
	d3/ot5vAnHsyOnZXjRKYIG2d6l/4rSTYORSNYISdfu2mgRAKQkI7kBDNJFcBgRGEHbr9DO6VXI9
	eqyZHnEYLlPQ0C9BCmFdJzHCUE/hTFuLjI33Gd/x/fT5pnGXA/fymdEEirVPALhiG/cpPSk/ZTp
	qbWSVwULYMKj2OSlrTgC9gOEJab76J5lmtszrktsTAyM8H4bylyBggM5R10vXes/LJeWc2pK2V5
	MmOcP30xyWigTSeFNpI5IjHO2zd7md1sLEsMdKQ0q/cKi59faHclWBJI8iY=
X-Google-Smtp-Source: AGHT+IHYkRexp+H54sKtCJdj4SxUrr90D/xYbMKs4ypn4d6oGXxC0eDMIKC5k+tCMEC4GAo2sNq6EA==
X-Received: by 2002:a05:6a00:234c:b0:736:6ecd:8e32 with SMTP id d2e1a72fcca58-7376d6ff2b7mr3715385b3a.21.1742384339843;
        Wed, 19 Mar 2025 04:38:59 -0700 (PDT)
Received: from localhost ([157.82.207.107])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-737115295dasm11333924b3a.30.2025.03.19.04.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 04:38:59 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 0/2] KVM: arm64: A few trace additions
Date: Wed, 19 Mar 2025 20:38:54 +0900
Message-Id: <20250319-trace-v1-0-0fff03204efa@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM6s2mcC/yXMQQ6CMBCF4as0s3ZMW5AAVzEsynTUWQA6rcSEc
 HcbWH4vL/8GiVU4QW82UF4lyTIXuIsBeoX5ySixGLz1N1u5DrMGYmwtjW2susieoXzfyg/5HZ3
 7cFr58y25fI4whsRIyzRJ7s3aXF2NSg0M+/4HaKrISYQAAAA=
X-Change-ID: 20250319-trace-80cb8d39de2e
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_043900_844289_11FB414C 
X-CRM114-Status: UNSURE (   7.62  )
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

These are tracepoints I added during recent debugging. I hope they are
useful for others too.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
Akihiko Odaki (2):
      KVM: arm64: Trace values with kvm_sys_access
      KVM: arm64: Trace SMC in a way similar to HVC

 arch/arm64/kvm/handle_exit.c       |  3 +++
 arch/arm64/kvm/sys_regs.c          | 24 ++++++++++++++----------
 arch/arm64/kvm/trace_handle_exit.h | 26 ++++++++++++++++++++++++--
 3 files changed, 41 insertions(+), 12 deletions(-)
---
base-commit: 8098cf067a7aae92a4f293df03964bf8474faca1
change-id: 20250319-trace-80cb8d39de2e

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>


