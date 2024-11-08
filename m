Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EBDD5C0C8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:From:To:Subject:
	Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Message-ID:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vqxt45j89tYWgv2TNwaF1a3uoGEHE8eyqdlcF5Cfjo8=; b=MAG9w33XaiyIvVOOuF9dAefo+/
	JpcbnLcKIPB0e9XyR2U3c6qi7/vti1o5TZxhUn2QTdKRlVh1DXyECxww6cl6xEFZheOhJ0htSpej7
	f2ta/ssGJWsMiEzPK3E7p7QugwydmC+6OnoryLzUgH+mrIb0He4Iup+DOB8K4IlrCztVZ3L8W2CNU
	PB0vi2WOklVBAfkqbc5nUCxaApBoWzRYuQnSAZHKWRZbMB12U8qHPthrfkqqqWUBJcGxphvPXa8E4
	FvvxrBmKK/0DEpYyzacjgdAS013QuTnWyGnP/97AOg7fKgQa7HTI4OjcR0zmh5EnurWChLj0rtJrK
	On0FIDIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PjO-0000000AoLC-2Hr7;
	Fri, 08 Nov 2024 14:12:58 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PNK-0000000Akck-2EJn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 13:50:12 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-720cb6ac25aso1897769b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 05:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1731073809; x=1731678609; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vqxt45j89tYWgv2TNwaF1a3uoGEHE8eyqdlcF5Cfjo8=;
        b=fxM6XgLyJXtvjkHB9kRuWdU8qawqqSa8BLtZUw3QvOBgNSy6xhGANsegp/Pn6y26ny
         vncJC0+W6DrH9HkhqgvuKaIINTxqFamnoH0uNScYBF7MxQNKHsoR+OB9GZuGt2Z1mdm1
         svfnF4jhrIJu+ThZVa4jibh4cuvCXZwRgZektj81Xy6NHAtl9zuCqCcJJqSPG0AEUl7q
         u0M85htrrGQpGNO47CryH60VcQ+fzqs6DFaO44TVklQ37T3da9EAukYW3baVPAd4br1P
         6XMUIUbqjl33ID9frOm2nY0tPIpBOylDwEQXWgmGDJIJ3ZEGNXjL9hme9j/65vEVFsqn
         3aTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731073809; x=1731678609;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vqxt45j89tYWgv2TNwaF1a3uoGEHE8eyqdlcF5Cfjo8=;
        b=djWtbpIBFqE/IpxbkzYTHQXa6AqPAuLAfi5uoNFSSAsFv+yGeaUSagHWDOJRcEZPVR
         ztdaEXM7r3lOYQOa002ve4ynv8Q03IlKdBW3J/s63X/xbMAZ9M1PXBu1j3w8KC/pLgIv
         ay9FZ5ah46baea9u+060kGi9qoZLM9YNcQvJPU5iSeug2aRSgDBMJQawU4sdHGKEVcKO
         jF3wr0jiGxaDqoW6vqoHxWD4+u+PFnyc109lOu2LPl4dHi3shRfDYEDd19RMYeG7J1+N
         D8JuEvOHt2TOASX2pVkVDFVX0rXB+6cmS3JaGWT3MFKwR9rO91HQ/oO/T3Q76sUHibPv
         LsSw==
X-Forwarded-Encrypted: i=1; AJvYcCXFMDagNalIaAbP0RrJvrU7OM0z/4cRD75wYJqgCvpMUAIiR9u53mtWin+LyXw3+YVW5alIqQslA3+Kony/niaa@lists.infradead.org
X-Gm-Message-State: AOJu0YxPhp/d+UXb3nkfvQVjiJidOC8yKAPWXtSoJEgeWETx10ZpdqX0
	JXWBOkdfxQm4pmk4lNJ7keHRddz3MsnyzafWnfhCwMjEzK7cw9P9vhknSnvivNc=
X-Google-Smtp-Source: AGHT+IH5WFoIbVfbq6dxU035G7ZvyFqUuvVaBbhTLWR/nS+66OYUfjLkrXegDre6iG+yJ72WBVj9Pg==
X-Received: by 2002:a05:6a00:180f:b0:71e:7af9:2d0f with SMTP id d2e1a72fcca58-7241334a2f3mr3576438b3a.18.1731073808672;
        Fri, 08 Nov 2024 05:50:08 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7240785ffb6sm3668448b3a.40.2024.11.08.05.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 05:50:08 -0800 (PST)
Message-ID: <672e1710.a70a0220.290040.f88b@mx.google.com>
Date: Fri, 08 Nov 2024 05:50:08 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.12-rc6-196-gca3a5c08a5ef
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: arm64
Subject: arm64/for-kernelci build: 1 build: 0 failed,
 1 passed (v6.12-rc6-196-gca3a5c08a5ef)
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_055010_857786_86ECB601 
X-CRM114-Status: UNSURE (   3.05  )
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

arm64/for-kernelci build: 1 build: 0 failed, 1 passed (v6.12-rc6-196-gca3a5=
c08a5ef)

Full Build Summary: https://kernelci.org/build/arm64/branch/for-kernelci/ke=
rnel/v6.12-rc6-196-gca3a5c08a5ef/

Tree: arm64
Branch: for-kernelci
Git Describe: v6.12-rc6-196-gca3a5c08a5ef
Git Commit: ca3a5c08a5ef1ee11c65c83b95d47117edf24e77
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

