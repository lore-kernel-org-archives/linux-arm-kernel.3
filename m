Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97979D0C5F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 09:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tuqhWRYGgjjam9B7W2GUDM6P6BKsivvZeF6kAk9BsZY=; b=3NuA2UKNua87bZ/bKP0ItG407R
	Ti2BsAVFsGD0Cpl5dVBAUXb+SQzYJkpn+CooUBqMZYg/REqzEoX+DMbCLK+2+WSHsGZabvIEZ+glD
	qDuc2Rb+kUi2XaaGndP+Xt33ouSMb03NZVmCce8BlL9V/ebKAbJXvs0jHEnzfg2D6BgDXeBQ7Ek3F
	Wx2Jl27cASV8oBRzs1APWuhFnL6VJKTWXMFpWqMBx00PF0hXx5LWkG9aRyY4Y7Vq2RYHHR2Doiyv3
	oGfEkwW3M4JRZbfAuM6TmoRNtXsjAIto2SPxbJhn0f8C4EWV4+UQ6cVDRRc50gWSxWwTYDdbUw58d
	gw6sBOxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4GiW-00000003Bgk-05pV;
	Fri, 25 Oct 2024 09:34:48 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ggu-00000003BO1-3DgB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 09:33:10 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e389169f92so36562927b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 02:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729848786; x=1730453586; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tuqhWRYGgjjam9B7W2GUDM6P6BKsivvZeF6kAk9BsZY=;
        b=KsTga0VcD7rCdGLyY2ZhMmQg8CCZ1hpsp4wbk7Cy0MZiAXdlXMpQTxCJ6iohZ8pCPz
         9Lq0RNnwFcliEfX8bcgI/24xfuKyHeokhLe1Nu+vx59OfNAeiniHYjRa/+FYGpxe6TRl
         IwrbM+4xwZGznObuOXDW+W0A/Vl619VYM+bdrtxpRCBj/lAp23HP9GnKUHSSZnDHMGVx
         OkS8MJrZbEw8xoCebHGE0dVAIjXiuHZpIJv9u94wZrG1rguincJ0YGN1kc+WK2YTRAvR
         lQ/QvCk4GMSPMEY54IpLsvkqu3q1I1ocKqrz9s3xd8MtqtwD2iY5C8Lm6WwIDU6TSwVf
         g9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729848786; x=1730453586;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tuqhWRYGgjjam9B7W2GUDM6P6BKsivvZeF6kAk9BsZY=;
        b=CNRN+8fVByl2nbS/UlbZuL+ghkStn374NlmGK1kXPrjBEj0p80b+nCXZLzq22ahoJb
         8shcPG7qxvwjwjZ6Iqy/7hYLrBaOORi7n9VUe0WaIFXam2KHaBHmtO0ug1ZFLhOHCmP+
         gjx2bfyHsUMytgkyJZZtbQ0HElzIJ12RA4fdAKT875PKOPSsWoM05ueGo2PrDA1wxGu1
         yHgJHyAZYR9vmICSU64O8vb3zFdFVIY2vxnCWbAt8JbPz1TgFtShO95YmuOptxqJ1KDW
         dYOAMqK2RKywdoFw+6lXbQebPpW00iwqrrXPcyimGEe5DrphOg6BjfTDZinG0SaKXotj
         x8FA==
X-Forwarded-Encrypted: i=1; AJvYcCXasqDf7JoJL1UWSwo8FDEgvRqhTyuVSpn2urElbDhN5B5fBSe1uA0ImzTiT6NzWXm5selhLQFtlyVEoZRlr2jd@lists.infradead.org
X-Gm-Message-State: AOJu0YwPr1LW3LfeCv0hiMwA6jFJ1UcRywDY+Dm+o1HPfEyb98JnO+mF
	YO2Aeg2USnLQlP1nkZdbj838Sqy/ci/Q/F/ltDpu6Km/mIbuX3x0cPlRJxvtXtyzNQkwsptlUTc
	qyOkAD68xxg==
X-Google-Smtp-Source: AGHT+IECH9pM1rudCKXymTwKhtnM/AU69iz4LBnNjtGpR3vZzl1lATWUss0Na2UGHQecUxyzkYn2RvfW2Hppzw==
X-Received: from mostafa.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a05:690c:296:b0:68d:52a1:be9 with SMTP id
 00721157ae682-6e858147b16mr1078977b3.1.1729848786167; Fri, 25 Oct 2024
 02:33:06 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:32:59 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241025093259.2216093-1-smostafa@google.com>
Subject: [PATCH v3] Documentation: Update the behaviour of "kvm-arm.mode"
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: corbet@lwn.net, Mostafa Saleh <smostafa@google.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_023308_847275_CA7117FA 
X-CRM114-Status: GOOD (  13.12  )
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

Commit 5053c3f0519c ("KVM: arm64: Use hVHE in pKVM by default on CPUs with
VHE support") modified the behaviour of "kvm-arm.mode=protected" without
the updating the kernel parameters doc.

Update it to match the current implementation.

Also, update required architecture version for nested virtualization as
suggested by Marc.

Cc: Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>

Signed-off-by: Mostafa Saleh <smostafa@google.com>

---
v3: Reword as Marc suggested.

v2: Update nested value also
---
 Documentation/admin-guide/kernel-parameters.txt | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1518343bbe22..ed92e207e9a0 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2740,17 +2740,21 @@
 			nvhe: Standard nVHE-based mode, without support for
 			      protected guests.
 
-			protected: nVHE-based mode with support for guests whose
-				   state is kept private from the host.
+			protected: Mode with support for guests whose state is
+				   kept private from the host, using VHE or
+				   nVHE depending on HW support.
 
 			nested: VHE-based mode with support for nested
-				virtualization. Requires at least ARMv8.3
-				hardware.
+				virtualization. Requires at least ARMv8.4
+				hardware (with FEAT_NV2).
 
 			Defaults to VHE/nVHE based on hardware support. Setting
 			mode to "protected" will disable kexec and hibernation
-			for the host. "nested" is experimental and should be
-			used with extreme caution.
+			for the host. To force nVHE on VHE hardware, add
+			"arm64_sw.hvhe=0 id_aa64mmfr1.vh=0" to the
+			command-line.
+			"nested" is experimental and should be used with
+			extreme caution.
 
 	kvm-arm.vgic_v3_group0_trap=
 			[KVM,ARM,EARLY] Trap guest accesses to GICv3 group-0
-- 
2.47.0.163.g1226f6d8fa-goog


