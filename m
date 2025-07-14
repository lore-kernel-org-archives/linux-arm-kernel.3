Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DCBC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 01:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f28NzlPclTUQrm9z8qWDo9K5sejEm68bwyiiU26NRcs=; b=2hxF2ZH+yz2qVnhoy2eeL//SWg
	qArYaOx9Gi70euqZoPbsrzJ/wlL+YabOb8pKjvlSpRw8tfULfZzTFppVPGhLiYXZLWseGAVguXNo1
	8JJ03GuWrY9j9aTKyiT0NKqWi9HXf8NpVCLqCsdXe/gpFFcJPATUbmjCpb0nKWJi6FKgfHIiGwmMG
	uf35k87PBmUXn+Lclp1ml2iMHQMY0hOGa17W2/ACQN4qtKTjO36ryod9vzfwU9dBC3E2OUeNN372m
	BVrRXuPDnwbd8qzfekgE6cs7TE3QXLS040QIcALMlhOF8C+oPqzxSUOI2voY7wkSeZIVvZwXglUi4
	OA2fHrEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub8MM-00000000vFR-165e;
	Mon, 14 Jul 2025 01:52:02 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub8Jv-00000000v75-1YYj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 01:49:32 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-31332cff2d5so3627272a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 18:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752457771; x=1753062571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f28NzlPclTUQrm9z8qWDo9K5sejEm68bwyiiU26NRcs=;
        b=ALf05W4rWl+pe35fjc6QnzXqwJZv7tsLPIpy/p/px7hvFwdsa2ezmupN7MPqShUJw0
         TidQYDa/Fmcty5vwpRP76cGYXp/sTmr0ej9MqKuPkYq8d4e6wpodG4M0VTKvyL5O3EBf
         uUVVVXqEJ1HOn4QIPClf3mis6E7dSQsJY3L+jDux15PGVhwsl0Uftgkkw/xd3OWpDqyC
         R2J3s8Q4zV231g9n60kSu5HPXLKUGRCyUoA34upJ5gjdSE7zOiaXPYZFw91V337nx82c
         AghJODGYUrck7niuYPLyKRKRERQrUBGhbdXMVhiFbdsipV6SiHpJVXgvwdWIaZ18beC8
         iUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752457771; x=1753062571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f28NzlPclTUQrm9z8qWDo9K5sejEm68bwyiiU26NRcs=;
        b=Q2HimM0MHXgpZSHENXVsUKNqpmjjb4dKQsTdFdtMFoI5zSrIj9s22TYA2Lri+A0/Ns
         AC/RGVjLJCDtim0zh9+odRzNz2KrJXJ/+kebydJC+MInpJOxWrWEVxe86gMC2A0hmiDY
         XVcz4x8vq441u06+JixoaWSjbD5MWEmLz/2WbHMpRRPQ71PYv01+Ut4CRvQYKw9GYlXa
         tbiATA0knqObJ/qJQ0iLSCD/HMcyp4DPkgol8OVfjTA5xTNYcDlwg/HgqA+YVXlDGitg
         RKPRW9VKWAEz53e9XeWB/iAjoIg3jX1sFflCCW+VccMWM/dwjvF0KWKQJKjJQwxMjPDB
         7hBw==
X-Forwarded-Encrypted: i=1; AJvYcCXCtCK2BN1BB6bKwF4a/z6Uwl2L8pegVGnItbo+w/yqASWUDAeVhBZSvbATTA4LBCNoaJ5fULpKnMYd9+wUUn0c@lists.infradead.org
X-Gm-Message-State: AOJu0YwTrjc0BQ+P0puEQqc23KZFSUE2p8FttvTNW7HbrMV85uA/YDtO
	iO72L1tj/2HhKPiYGm6jArGCcxBiKeDV0p3SSd1QnCGWoJ+yzihH0PqN
X-Gm-Gg: ASbGncvvw8qRihwUpMiRCZCIO0izCIzCFLfxGM1e8+43TFIfOpGc1jKpENyx+K08Pnn
	LQripa1Gg7q7zw/W2+N2oz4+8i33tWmvrDnkKCxqGeihBwt/4pndG86QkGh/dz+lGlQIUZ42+6N
	cKLzp2erpabaoHur947LimJcXeUGYzzBzfSWm2drpXt9M1rL4kcaLmFQT3Rk2gnC8VABJDJ2ibe
	DmHABJol6vQPxv2Scy7nMkUgY7LOyoYhrzesgrsqJcM1/Gfzo3oSUDFgb/06JbMayy8MKacFm/9
	2rVaMVIAb68lwkaogJhMBWZ2deKxX7+miYyDtTk7nmbEEHncNZI08e2WVq8wz8VZBa/omjNHyMV
	VD2Zv9JFfJpDtYNnKmyp8273ebSf/RSXH+w/A
X-Google-Smtp-Source: AGHT+IHAMVWJ1KHm6k5TxxbRXzqXkJA2F6PqS1WMTG6K5vCCF+qJ3iHYsumiXDEgPzlsNAggJSgYLA==
X-Received: by 2002:a17:90b:5868:b0:312:29e:9ed5 with SMTP id 98e67ed59e1d1-31c4cd9c12cmr16262763a91.23.1752457770526;
        Sun, 13 Jul 2025 18:49:30 -0700 (PDT)
Received: from daerolee-Swift-SF316-51.. ([49.142.96.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3eb7e362sm9289765a91.44.2025.07.13.18.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 18:49:29 -0700 (PDT)
From: DaeRo Lee <skseofh@gmail.com>
X-Google-Original-From: DaeRo Lee <skseofh@naver.com>
To: will@kernel.org
Cc: alexandru.elisei@arm.com,
	=james.morse@arm.com,
	kernel-team@android.com,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	qperret@google.com,
	sebastianene@google.com,
	skseofh@gmail.com,
	sudeep.holla@arm.com,
	suzuki.poulose@arm.com,
	tabba@google.com
Subject: Re: [PATCH v3 08/10] KVM: arm64: Handle FFA_MEM_LEND calls from the host
Date: Mon, 14 Jul 2025 10:49:22 +0900
Message-Id: <20250714014922.631551-1-skseofh@naver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aHQQiJr2xLe9KotP@while-the-truck>
References: <aHQQiJr2xLe9KotP@while-the-truck>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_184931_428267_708F1232 
X-CRM114-Status: UNSURE (   7.00  )
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

Is it pKVM's policy to not manage Non-secure memory using FF-A, while the FF-A
specification supports memory management between Host/Guest within Non-secure
hypervisors?

Then, how does someone lend memory to a Guest from the Host/Guest via FF-A? Can
pKVM prevent this? Or should Host/Guest developers use it with caution?

