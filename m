Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8090E6F086
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 20:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:From:To:Subject:
	Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Message-ID:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K3KCd3+5wgAHxAzrMedEo1cgEoAjkESH4JOUsDOfeQU=; b=DRnBWUnEhN+m+TJaCqteyN39FH
	ts8OU7bxpu0w0C8uJgewWdDFpt87nOhrsWVwsIK4rAdmSazQ0repTp7ZIhstYIsbICbOiP4hF58yG
	ezlNcXilZ4Mqiaoqof+/MMuH/lusLwMNLZMaJJ6HPEpg5oO+dpnC+BbLqXqGN/2AEKTQSaC2Tl36B
	tztvLkAI6044HYNUe/qMPZa/Cf2ZWOclHcUXPDxWfCj8wP1n1E8vK/AsfFkbP2W3FLEhxLHV1vGC7
	3EWBXDb8wbIiETUkl5awv4t+s2tnO+hiNP6xcdlau+DEPhNGHcQ84yeqPxNaM7dEB9sm3xvpBozLD
	/wkTTrsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6yES-00000008FXI-1MTm;
	Fri, 01 Nov 2024 20:26:56 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6yCl-00000008FQC-248X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 20:25:13 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-72041ff06a0so2048076b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 13:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1730492710; x=1731097510; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=K3KCd3+5wgAHxAzrMedEo1cgEoAjkESH4JOUsDOfeQU=;
        b=CwbQqfoE3ld/8CjB6BJ9bqlf5zGhhOVNscaB1Z4wBr89m/8tFz8IOVPtlrqqhjNUXv
         db66m0Dann7PxH8Rhq4Eovxl6E0tfL6havHwC7cCXuyz4beEdoO/ZEL1f7sEhkNWdjbs
         Rl5wJYPWhdejTa2c/UcAqa4wg898nMjTUP+eEH5F5kpN1ZaPX1jdbYA+nbnKPHpOdWWk
         p+2P4XbvA64h/KcfondRq2MoGKFtoU7rszgLXROO9ZyBA6rYajvzENv2NRbQ7r10lvEh
         FYmW4Kiqu8aVPp/yBalhvBrjW04U805l3mrN8BWWvVGkmMEGaNqy5EA2ymNOJoI8Yf5K
         5CyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730492710; x=1731097510;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K3KCd3+5wgAHxAzrMedEo1cgEoAjkESH4JOUsDOfeQU=;
        b=B2zCmQBEOM9YmiFPrmE9C/HQbcOlMW+DJGz+q4qLUhuOkFe4rcNlb2SIA6xrWds2RG
         qQfjKfWfyM5iV/XFio/RlscsmyKt399MheMi4bAZzoS5e8XCmYaa8FiUOnScnPXse3Av
         t/IMRlVMntg7ybArDlaSjrE8vJjE2gI+z1KVNnCKc+/qPaxcdONZOc5Th7G13LF5Tutp
         0N66VjEzW7oCB1AbR4n6nvCvghqoo1JjCT8Qppj0ZbkexXux8fiZmt/iU7aEkGKt0dWj
         l8wOMmEAqaldX/n/99odPMusVxMyQ+Tb0EAwIw7FHSBRrDWT3aQsfh0KFmdQNYWERxXE
         ANYA==
X-Forwarded-Encrypted: i=1; AJvYcCUtnLLlaXIVOmg2ttKXRdr/ykm/TV2FaXT+jKCxKKET+cxdu8LV8uTo9mm+Fn1b8QEyIiT6LVfECyRFH68PRbzI@lists.infradead.org
X-Gm-Message-State: AOJu0YyLGJwK2C4LJUkI9xsBCa1W0jEVWwhyNvCERypvC+62k+bskBbu
	hOQgnbW6Z/FdMDEhWCc0iGb1SszZeIdyKVQqFEY3BBUKLkwieIhVIyhsxkwWYj8=
X-Google-Smtp-Source: AGHT+IHydBqY0DDwYoizHpWs49GGcYnOh48s5Z/WPwnPEJbEDO6RTZXDpcSDIZ7CpJVXnydwRcxzLA==
X-Received: by 2002:a05:6a21:6711:b0:1d5:2767:9d08 with SMTP id adf61e73a8af0-1dba54a03d6mr5738726637.39.1730492710168;
        Fri, 01 Nov 2024 13:25:10 -0700 (PDT)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee45296fc5sm2807836a12.11.2024.11.01.13.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 13:25:09 -0700 (PDT)
Message-ID: <67253925.630a0220.1ef334.f7f6@mx.google.com>
Date: Fri, 01 Nov 2024 13:25:09 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.12-rc5-158-g5283dc78f4da
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: arm64
Subject: arm64/for-kernelci build: 1 build: 0 failed,
 1 passed (v6.12-rc5-158-g5283dc78f4da)
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_132511_715690_E9308B48 
X-CRM114-Status: UNSURE (   4.63  )
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

arm64/for-kernelci build: 1 build: 0 failed, 1 passed (v6.12-rc5-158-g5283d=
c78f4da)

Full Build Summary: https://kernelci.org/build/arm64/branch/for-kernelci/ke=
rnel/v6.12-rc5-158-g5283dc78f4da/

Tree: arm64
Branch: for-kernelci
Git Describe: v6.12-rc5-158-g5283dc78f4da
Git Commit: 5283dc78f4da5400f2ec24794239a785b6d6241c
Git URL: https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
Built: 1 unique architecture

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D

Detailed per-defconfig build reports:

---------------------------------------------------------------------------=
-----
defconfig (arm64, gcc-12) =E2=80=94 PASS, 0 errors, 0 warnings, 0 section m=
ismatches

---
For more info write to <info@kernelci.org>

