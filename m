Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F3ED1BDD9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 18:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:From:To:Subject:
	Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Message-ID:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=laPuZq78S9MZZAPJV85SWKqbq5q6m37ivttbiKDGbJ0=; b=Z4+/24EotE9+ED+pVJlNGYdt4z
	NCywvL3MS2nkV/IrtzZKEEsGBrCeOSE15217RlFW+e6qPrXy6lZ1qmD8Arf2LA+yj8pX3t5X/AsFw
	b6hKau0hlxlIkpy16tgMfSXx5DTcLM5cTw2hGy6Ggsat+OPd5knRTWxAPV1t/6I2mVgApiyuxNwor
	pvJs3Pb+eMioX2GueJRLHfDckbM5/E9aCr//Ft9jiDkAwGObZw7HiF8Bq1gQ4KDtSqJvStSfVELZd
	Q9YX5Jsu2yB//4eUnb/ztmTIXZwcNrDwZ4eQiwzbSJO5s+bWtqb9Nwagsoz4DM2J5YLJW9iKkG8aO
	ERk0NwXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t81cx-0000000EiHn-0hjj;
	Mon, 04 Nov 2024 18:16:35 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t81OY-0000000EdgK-05yJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 18:01:43 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-71e61b47c6cso4069038b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 10:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1730743301; x=1731348101; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=laPuZq78S9MZZAPJV85SWKqbq5q6m37ivttbiKDGbJ0=;
        b=YKVzn2WWL5JVjMrZC4clISPWF7/wKgQ1rkQ3jNNAfMhs7EpkH0Y2D+BUc26C0OGk2r
         oWE7KKbVvor7VdlVHKMjCXv3L6XvwR6bQcsxiu/IOsAuwVwS0C0L2TIxqQ/P40Yi8Ut4
         3yXXWwyTub7+w3NJRJM9brOu31/u9+9YEbwZAv5sqpggur4Gw/NufNH9E8oInmjd81Ng
         2qMoFel31lxuzdFFuy7jaig6ewelJi8Yx4EgdION6nm2TtpUrrZVctzF/FxvwLCJbMz2
         OtN9UMhcPJexwAHp7CkYnavuc7wbXuxemlbmoylAWYYijE7NkPCvMYLTGTvQWrGEUBQ3
         sesQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730743301; x=1731348101;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=laPuZq78S9MZZAPJV85SWKqbq5q6m37ivttbiKDGbJ0=;
        b=oFIPiY5eLNrG6yytF7Phb8cpK9oV/m2XtIEyIvyz19wchYZYzDJuYSZkdlDyhmV71o
         g66PkS+fu16m0bym7KkPsM7/ONoyGJjPdbiO9RxZJDj3qN71cTtiuFlEu/pd1jPV4Sio
         BsxmxiGtLQKvlfZdeQlgWqRZkIPxqEzQtXbnLZXzroflSBSbeUslPyO0KEhdgYBPFP/m
         2dptVxYRJ4zYZ8jy8OVlDMc4kojvlb3Jz7coexJHTGMJJDSNUutZSCLQRREhRTT7V/DA
         4ScC5xsjSpJrD255KUzwGh34uvzXcfiIVGLSdZEuQ9HRZ/itkDL8EWj8ud9PsKo8enUe
         jcJg==
X-Forwarded-Encrypted: i=1; AJvYcCW+JQNkU+MzSMIKc4/yXTIVQNx7VwzGsLia3BR5P2+WtXf7sqpzJ4PTr0eaSWVPWt0r9Q0QACkhDYD+7dwEnXhL@lists.infradead.org
X-Gm-Message-State: AOJu0YzUR9N4OTaFRcUlJmZxp/yFsDCm1sBuAIyc7hEd2ED/LclYZPXK
	3eP8prQvWf5SNWiksK8wvAGxIKWSeG8SbSVMAWE5wLbKsmjvjq8rVHxMw/Oxv5k=
X-Google-Smtp-Source: AGHT+IFFSFIP1TtkKpDJA24bIeWLGFadxRYQkcEBUgPi0ry7tozGLF7eHnKqsEzmosQgdIr2N01Lug==
X-Received: by 2002:a05:6a00:2ea5:b0:71e:5a1d:ecdc with SMTP id d2e1a72fcca58-7206306e031mr45506332b3a.17.1730743300454;
        Mon, 04 Nov 2024 10:01:40 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b90dasm7807765b3a.30.2024.11.04.10.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 10:01:39 -0800 (PST)
Message-ID: <67290c03.050a0220.e6cd0.2415@mx.google.com>
Date: Mon, 04 Nov 2024 10:01:39 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.12-rc6-162-g46f782153ea2
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: arm64
Subject: arm64/for-kernelci build: 1 build: 0 failed,
 1 passed (v6.12-rc6-162-g46f782153ea2)
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_100142_346733_FB3D86A7 
X-CRM114-Status: UNSURE (   3.27  )
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

arm64/for-kernelci build: 1 build: 0 failed, 1 passed (v6.12-rc6-162-g46f78=
2153ea2)

Full Build Summary: https://kernelci.org/build/arm64/branch/for-kernelci/ke=
rnel/v6.12-rc6-162-g46f782153ea2/

Tree: arm64
Branch: for-kernelci
Git Describe: v6.12-rc6-162-g46f782153ea2
Git Commit: 46f782153ea2c67ebd059b467cc09cf6161ad90c
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

