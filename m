Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6D9D2C11E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 15:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:From:To:Subject:
	Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Message-ID:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pXz8rJ9Wyj8pAzg8jHMgybKdUaO5qDRCmQTfboRSW98=; b=Mqez5hfjppFLkhUQ5mwkqKG0E/
	i9XgvtZu01lUo8dZMLmG3vKdHlTkoNgGZ1o0cUuJ9UGWHf50LG0L6Gw2iGSB+Bey6WLkl06ip5YZ6
	EGU64qUfu2cq85ytNBZRfTkZ/lIHI3/TUD4Zz+jebLUmClcdwWydfHyVC/Yc7qC6hy9QrffqqxQPx
	5yJq34PN9jMqb+plDD8yBEUIqLLPiGWBqylB/OgvVeN9sa3fVrMrcVU0ucXGTkCf4yF+id4MzMyjV
	927lP8GZPF3RECTVZwwJ16H8Ppx8d1/zstRUrhrEn0c3ipl2iLLmcEgo5UpjmVfJxJLHVdFv4nios
	n0/XgVxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8L4c-0000000HMlB-2vWB;
	Tue, 05 Nov 2024 15:02:26 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8L2t-0000000HMY6-1r3X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 15:00:41 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20c714cd9c8so56973855ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 07:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1730818838; x=1731423638; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pXz8rJ9Wyj8pAzg8jHMgybKdUaO5qDRCmQTfboRSW98=;
        b=upGxT8gNf9YFs9TlZMmqF2wTYV52hdhPEDJ1Wi85o1JkQFCbYdrPqpq778uZQY6KwU
         BXpn1sw2enaT75gYxRtUwPKhFbwFRCO1syc2Rivm/x2F7/KoO+Nfhx0bf2726jDKdBs6
         7U7OIF8qmZU1H5GTt4Fdod5bLkloXMM2AtpAxYx+LrtIfmsaBi7+TM3BooxRG667VKrk
         GGtBLpoc3OlRTkvgcWSySE3f8Rr+0EnVmoGKeD4fFdWdaS3R2kH+LDTpsMpfcxXMr/LU
         7hdYZEWu0fmS/TGMlynFI3RGuEqOxEy2fjjSjZEUkoNvOPnW3fKWvf5dFvyj1i08OL1Z
         EooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730818838; x=1731423638;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXz8rJ9Wyj8pAzg8jHMgybKdUaO5qDRCmQTfboRSW98=;
        b=X9TxQTx1rLgqhps+s3N6OubfcY6WAPbYX3/E7bdjTKwa7pJ9H3Sr1WL+Y1NAu+Texp
         1mCFeFKrINos852sJ/RnBVmi3JzI+nWUPfBwVSGP4I0vNn+IKlAlQI72juQxQo0PeoJp
         TN3lxHIrilrloJj7gxqHHmqA8+Z6sDp3d9B8XsVqpQmb0+M9Hw3J7q0P8dimiVZ/1e9/
         QMk7J4oWkBKeoBrKcYWjP7LAeZqEcq837vwxgsvf3dJyX4eFGShDTc4Bt+MPYdehvObk
         h60XUY0nQL83PNewaaPqll03074bintwhg+23ghIhTCHwTacDSC1dE0LtadIY3uvI2wa
         ACTg==
X-Forwarded-Encrypted: i=1; AJvYcCX+BLbFsGcYfP53fKKPSIOcHN0NDcEbXRRXQQb4ZQKtwFEYWyxANxjG2hqjGMyuqQApkkaLLp61zVM8Dwb5yWHo@lists.infradead.org
X-Gm-Message-State: AOJu0YyLcFy+oadm/XHYGqvs7agFZpn9GvhCkskJJMz0BrD5+oM8xhUQ
	utsmkmmtdiFsftfRgbiNwRlVKnO3gpbnkpIqGS35kP1mhFbesVq2IP7z4mLOKE8=
X-Google-Smtp-Source: AGHT+IERc1zqEIqgzkHKvwRfRs0rrsRRG7JUEZNTozdsOPdE/plz3o9mf5NOnnVPo1Uebu8UqNp2KA==
X-Received: by 2002:a17:903:2343:b0:210:e75e:4649 with SMTP id d9443c01a7336-2111af3fbfbmr236595785ad.17.1730818838029;
        Tue, 05 Nov 2024 07:00:38 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056edc4dsm79083995ad.28.2024.11.05.07.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 07:00:37 -0800 (PST)
Message-ID: <672a3315.170a0220.db9e9.4013@mx.google.com>
Date: Tue, 05 Nov 2024 07:00:37 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.12-rc6-169-g8936d33c1f697
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: arm64
Subject: arm64/for-kernelci build: 1 build: 0 failed,
 1 passed (v6.12-rc6-169-g8936d33c1f697)
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_070039_769531_D8B41A48 
X-CRM114-Status: UNSURE (   3.57  )
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

arm64/for-kernelci build: 1 build: 0 failed, 1 passed (v6.12-rc6-169-g8936d=
33c1f697)

Full Build Summary: https://kernelci.org/build/arm64/branch/for-kernelci/ke=
rnel/v6.12-rc6-169-g8936d33c1f697/

Tree: arm64
Branch: for-kernelci
Git Describe: v6.12-rc6-169-g8936d33c1f697
Git Commit: 8936d33c1f697ce59b16896fcb793f23368e456c
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

