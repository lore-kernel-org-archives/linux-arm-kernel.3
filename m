Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4706AD5D688
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 21:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:From:To:Subject:
	Content-Transfer-Encoding:MIME-Version:Content-Type:Date:Message-ID:Reply-To:
	Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nTO4EjkwFAgYaEHynQq99LWUAaYcLMNoIrZ4RtMDNiw=; b=HMz4mavsVLWqseIzufM7urmyQy
	rtp05h/Dm1QDdmAy0G9oKT8QtxcdAVgi5xR1Oyfd4UcdrgDA7bSHI50Bk24zbQGY8ma3NDPjehyLC
	QQttE0DdU7JcRhUFIgR10KciOXsXWUw77OkDC2Ge8fnrAzc2SddYqBLCQJ4rk0kc5UHi7v0wuf6Cg
	RCV+NH9HvbKHG6kqsDmuiJFfbeI4QIxIuhf0O4Cq8YrZvXQCZas2vWHyv+F2+KQ17hxjF1uIpS6kM
	BSvxeUEgwAa7TAJpbOUF47cV/uN4CMxccF74iK8Uotz0HmTQYbrqemGiNj9DSKP1nrGZH2vMgo7xF
	yj7ZiyNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t99n6-00000008Mr4-1uEY;
	Thu, 07 Nov 2024 21:11:44 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t99lK-00000008MQT-1SVv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 21:09:56 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7ee51d9ae30so1134930a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 13:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1731013792; x=1731618592; darn=lists.infradead.org;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nTO4EjkwFAgYaEHynQq99LWUAaYcLMNoIrZ4RtMDNiw=;
        b=h5NDrERonAxljpAyk/kxlZDXgTkbrItR8yl1czOvsDXscxyaYK02zPomO2AthCYTxQ
         KNDB/R/xBnAWRsGNOu/R3JMDU8GH1ujKbhvHvXnpse5mfZzJj2vQPawYvtisFlIkPGuD
         jrdCpkCxhQ/8gKbSDxRxd44fzwhJhArzrKjOBUa4bJQHXySpC5zN14e77aeT+FcoUH20
         zSEXL04IwS1FMuq/wv95Ql6/Sl92NEAHxQ587xqKaxZhn2bojNcW/mxSGtdjsM/wGXNd
         7tE2g4T5mSs8Dsk8jIgi/PQeAWfG01M2ZfZFtqTARBAxzGZoyE2qlEBIikpeuNm8Ibip
         M6GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731013792; x=1731618592;
        h=from:to:subject:content-transfer-encoding:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nTO4EjkwFAgYaEHynQq99LWUAaYcLMNoIrZ4RtMDNiw=;
        b=YKWH2cMt9e/Zwhqa3VDC7Mu42ckqHXnjSHlVQFHkuMI6QLRLFa/r3y5FOYTZmk615J
         WDVVRWReKFfaabrVODC3HHHa7PmP96GpSrXrT9WM+fm6kiIxFSn/QNJh0/9RlI8XkIr9
         It5R80IO2PGrwhh6bNXEvS2SGxPMtmYwHZRr+eCS/OoJ9vklGvb2o5XqFBzhKJ/yUzCV
         PgIKwdJiWeWBVwXtu4o+is8Pk4u8IJYp2jOCXq92+B/SxaqWIq6OJy4iCHWslPCUJjVD
         SuxGG0Kb6AIxzoQUgKx+vTBzmkJfI9aJrqTf/BlgoeLeiDpp23WoXqmICmgR8nb9K3To
         zkMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1noChFWDg28vT4uxnF6FeaLLDDDaYC1L3dKVAGOuzznA3D2AXVfnxTzkykEAwBUynQtAkTWcNPpijwBx5W6up@lists.infradead.org
X-Gm-Message-State: AOJu0Yxre2i9HfgbHhx/Xk0R8MHjAzL4yStA4dHL2J2FD5gx4s3SieDt
	Kp6uBp7T+NKHnQUZDKNUTX1x/yPbFzSBNDyPpCLcfMUMIZ6oulyrS3EuAfA1Ov4=
X-Google-Smtp-Source: AGHT+IFk6qXB0bVZKyp0tke33OTnolngc3ijaSpPvGk5swNG+Q39aLuFGnQ6FeHS+CQLJ1vBlZUqUg==
X-Received: by 2002:a05:6a20:7fa4:b0:1db:e04b:16c9 with SMTP id adf61e73a8af0-1dc22838fd2mr623024637.1.1731013792602;
        Thu, 07 Nov 2024 13:09:52 -0800 (PST)
Received: from kernelci-production.internal.cloudapp.net ([20.171.243.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724078a7e7asm2134929b3a.70.2024.11.07.13.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 13:09:52 -0800 (PST)
Message-ID: <672d2ca0.050a0220.33ae7f.a548@mx.google.com>
Date: Thu, 07 Nov 2024 13:09:52 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Kernelci-Report-Type: build
X-Kernelci-Kernel: v6.12-rc6-194-geb17c12d043da
X-Kernelci-Branch: for-kernelci
X-Kernelci-Tree: arm64
Subject: arm64/for-kernelci build: 1 build: 0 failed,
 1 passed (v6.12-rc6-194-geb17c12d043da)
To: will@kernel.org, catalin.marinas@arm.com,
 linux-arm-kernel@lists.infradead.org, kernel-build-reports@lists.linaro.org,
 kernelci-results@groups.io
From: "kernelci.org bot" <bot@kernelci.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_130954_565190_FA81274C 
X-CRM114-Status: UNSURE (   2.89  )
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

arm64/for-kernelci build: 1 build: 0 failed, 1 passed (v6.12-rc6-194-geb17c=
12d043da)

Full Build Summary: https://kernelci.org/build/arm64/branch/for-kernelci/ke=
rnel/v6.12-rc6-194-geb17c12d043da/

Tree: arm64
Branch: for-kernelci
Git Describe: v6.12-rc6-194-geb17c12d043da
Git Commit: eb17c12d043dad3f1ef9376a2d80d7e0a665e887
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

