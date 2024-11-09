Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0CDD64099
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 02:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:From:To:Subject:
	Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Message-ID:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N/cvy6I3YK70G/fx2NVdJ1Rhx2D7UpfBHuwG7EIRDPQ=; b=gmfAeHvwJwjOJdmh/kqDhFL+Z9
	VWO9xY43AZjmrUxte4ulOpr/ToKkafgQgdU7UvzBTh8s3p2wHOa69JytcHMwnmrck1d9+GefPoz64
	XkUXAlx+Oq270idUXqpEo1E5RZ/DuaxwJXCD4U+z3vvHELWmweeZHuoIkEBxT5u5VfZCah14FLdD1
	6Z+1FyoF9JraOHBfEPVAZbBlbVx5Gyu5X2C9Kl/FQZ9VYHXNPCl4q7CY894hPHsaT2wgUg34Obkqn
	46lFNIlEXeYD3NTti0C0YNiGD5rMnk/b2ixWQ1OnJNKb2RcjTuF/hbBID2d49yromw/iBteH1RIPW
	NmkKFGYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9bKY-0000000CWd8-0spT;
	Sat, 09 Nov 2024 02:36:06 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9bIm-0000000CWSv-2030
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 Nov 2024 02:34:18 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20cdda5cfb6so29546155ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Nov 2024 18:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1731119655; x=1731724455; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=N/cvy6I3YK70G/fx2NVdJ1Rhx2D7UpfBHuwG7EIRDPQ=;
        b=L6J0CYidhzm/vwmmX9FUcgtfSJP6b7d+kdMpFCPcn47O3uWjJdnmAM2KxCitLbsGtR
         Qi+su7Ogs5kgBr+rGiW4LVtlyeJ4UdbzlGn9F+e6ROCRnKPdVo4wID3jDhkvyunCKCzW
         G2FEv0MN7uJvgYheaeR9zc3laBWmRGQRJL2bd/CA/y4D9CompVJ+L3szUesk1l1eZPMP
         eJF+RZ/zEGjYLQFKiTCirHvn8UUuk1ogg7R4Q3nbl4mhu39d653waCQlkLzV/b8Ggfo1
         8Ppgm4toNkn4M/0qRQplZTgy7UN1pLqGUgQ8RWCwRUWwmVubrEAT8Ozo/tOq96GPPInR
         1IhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731119655; x=1731724455;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/cvy6I3YK70G/fx2NVdJ1Rhx2D7UpfBHuwG7EIRDPQ=;
        b=gumbqp0J7mq9/I3Cdqs+Jb8FU04nC5Kb3+kxHQgngMYArrAl0G827F5bAMp34I2YAA
         fETkgeTkeQ6eI1HdbTTFrD+LHwezVIoKeuh1PcAmeN99DigrYXPGBUc6R48p9aPLgB9Y
         Ka4H/sgkkA0v59UEErSQYZ7rH3Eh/JDjgjRqgXMFUWmRHA21qAWCnjVGh1v34n0S90mf
         h+mP5FBmwdbl+/IphNnopciHZBJCm4rIAHNRnHOUhhFFpvdfGfZLkS39/m7uYtoWMwfd
         2KhWoSNr2t6d/b2KTli7txVYGR7S/+OIifIdNEn2BySJit8SjnCn7FfwU9P8I/elW5sE
         oiyg==
X-Forwarded-Encrypted: i=1; AJvYcCWQkN4x/5Fv7wivIHwUOd+fLLS5My/YSBv4FZq7fK101wXXgRwlBrSPqBbhK7dF+XD58tk9APCe6SZKO9YHCt7m@lists.infradead.org
X-Gm-Message-State: AOJu0YxQVuW1LWbtewBfSr5qidqkWHc6c5CVpWMbfCg9GWlYOUShe8fP
	te7bRo1wdIgV7AgcRuoyTlE0E9zPvnxWi75NyB7MYkJIRg/N/bWSCtovaVLmuQs=
X-Google-Smtp-Source: AGHT+IEPEXwU58iUK1rtEKGhg/e0IxPXVpWW60kO7fWM6uoiJBP9Uhz4DF+a2mRMrE0ZGveebjdPbQ==
X-Received: by 2002:a17:903:945:b0:20c:7ee8:fc3c with SMTP id d9443c01a7336-211835260e5mr66092265ad.22.1731119655174;
        Fri, 08 Nov 2024 18:34:15 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177dde2e1sm37501545ad.76.2024.11.08.18.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 18:34:14 -0800 (PST)
Message-ID: <672eca26.170a0220.cc544.527a@mx.google.com>
Date: Fri, 08 Nov 2024 18:34:14 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.12-rc6-200-g563047e691f2
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: arm64
Subject: arm64/for-kernelci build: 1 build: 0 failed,
 1 passed (v6.12-rc6-200-g563047e691f2)
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_183416_806893_1932B19B 
X-CRM114-Status: UNSURE (   2.91  )
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

arm64/for-kernelci build: 1 build: 0 failed, 1 passed (v6.12-rc6-200-g56304=
7e691f2)

Full Build Summary: https://kernelci.org/build/arm64/branch/for-kernelci/ke=
rnel/v6.12-rc6-200-g563047e691f2/

Tree: arm64
Branch: for-kernelci
Git Describe: v6.12-rc6-200-g563047e691f2
Git Commit: 563047e691f2bdabb809481e1c0f26d171632115
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

