Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF45CF01821
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 11:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkZRQN19x7mFcsCOofw3+jxcPy1oc8gx31GqMlFvfgk=; b=C0AehDe3hwFOhgY18935KCKG7H
	/bY6aLreI+fB5kixfYTod9GdbEh7ucN+fx12SIZNpR1YcekgD1iKmzV1A6VUMpaPIW2XJ7ke7zBHs
	vygvNtMuqW69PjSG7JVqgTQyDOWGiHmUe7C6dfmQxi+ZgCITuKIvv9G0J7haY2CPUaz9tswPhmiyy
	pCt78AXtFDaHVbDj8WHi33stJRVWBa6urBOfeFUYNmeOsi+l+QOZ6vE4X0Jvk+L/6b5aSpIgAsQ6O
	mZuI740iLUIg3mMRzJ9EpQuzl/Z+btfhLh4KLTYnbqy7+cf0HH9QP9HvxfWXie2VLCTB58v/Vz8f1
	YLB8eq8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyT1f-00000003XWM-1Fgl;
	Fri, 06 Mar 2026 11:07:23 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyT1c-00000003XVo-1Jfe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 11:07:21 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-829a9c03780so227253b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 03:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772795239; x=1773400039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkZRQN19x7mFcsCOofw3+jxcPy1oc8gx31GqMlFvfgk=;
        b=O8du5WwB4RLrWdGi0G97R5tocrJXo7MEuFEbqeRlatbVtXS7CbmZWqL9MSeQcOvmns
         i8lQpz2x9Fq1vxIEQpCa1MkhNhAreZhID4m3UH3mUSIvufxlq/gKA8gTMvRyq4lc4CUD
         extNRnbVCzlD2R36RjjTZc4rjWgHYzIdPqXYLA6XiI6YHw4HGeW4zrikmmzDjS3mp5jv
         vjDT7VE3ZIoYZDcIKDnNwvopG1xqAO1rCDjNsyxmGSuRuHajg8kP+ZDHxNv/GxWwTPkr
         s+km/PQKitw1H2gVQYk2f1kkYL+Qeqmkjl2iV5PIFPMzNdzLxy09LtLFMxIo5phKAQEl
         a+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772795239; x=1773400039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LkZRQN19x7mFcsCOofw3+jxcPy1oc8gx31GqMlFvfgk=;
        b=lhWRYEL6MwJzBG6q1/bGoff5I5xS/pWAH4ktqljWrtdmplnJ04DKxlErrUKiSmYW89
         9YUeS05iN9o9eSwbxnz2BvnWd4Tl8TaGJR4qPuVGaISROVbzn78dGQKNpnR/L+ds9ppn
         4Fb2TDTJiPAlXcTAkvJ5Rf0M3rlhlAFtjQpxXXFUj1fGgfEvKnwADySp1lgMpaIp+/Ir
         OJCmu7GrgSYaSi9toDIyCosCbJnMIZm5qtqChhkrIXTh6viLoKiwNTOTy4NCmKKv9So5
         v+Ag5X4n++DuSY1K+TXfog+wcc/PBlkYquKP9euMvApBHqscrNh+BElElsgk8Ua2bdqd
         7n4g==
X-Forwarded-Encrypted: i=1; AJvYcCXoWVJVRx8YGHhTcbPONF3aES62cyWKGwYyzt09mTj1wCwVo+L3OGj0niOIRbxME3Ipt1rf8OBKmfixZOwgOrwy@lists.infradead.org
X-Gm-Message-State: AOJu0YyjaXtfIHPYR2bLQdBqRdg6vM+sIkfBPEvQ827vQVRkwySavWWz
	g8rNbQ05JgZgajJYc3i1dS9uOI0vkd88LKPMGQgfvSz3uqRQz217Bn41
X-Gm-Gg: ATEYQzwVh49FCPDhHAxBVDsxD1jv57mQNNT0okfPDvVlkvTWdJeTHl2mt/IyQud/wU3
	ko1YLkVKsiZcbTrcsrB+HrLZ95eoC9CWCEk4Nm0Ok+mpiSACn0nycUYZpCqizuq+IovLeJ1DRyk
	FGVKYZtHoGoUtdo4MmXRgQdbolqBjz+lOhpXI+c2HJaFGzV+q7RU9q5KHyY3gRckxPdzl3VE0ln
	oqUFsXB7hO8T/I5vM061iQUVb558Aj4vWhX+FlOLa7BkTgaQZpg3EDg860+H6QQRpOwAG8G0qpX
	H4x+vXjNvbdDhVWl7X58lnGL8ZMfYZLmtooEGKF+NVkK4z5xE1Pjvrrb1qhxIwr9SDkgJfRKFnb
	QUp1rNFBeCDGrzW2mvozQCCr05X5shucFwtBAVHngMEaswy5pMJ6PwuVAp+RxWe3dO91FTuPnLy
	Vg8naGzyWnMNyRDRan4JECCTYCV0U3JrE=
X-Received: by 2002:a05:6a00:1a0e:b0:829:8e91:eff with SMTP id d2e1a72fcca58-829a2f1429fmr1340770b3a.30.1772795239104;
        Fri, 06 Mar 2026 03:07:19 -0800 (PST)
Received: from localhost.localdomain ([58.29.79.238])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48d6985sm1428631b3a.63.2026.03.06.03.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 03:07:18 -0800 (PST)
From: Lee Yongjun <jun85566@gmail.com>
To: krzk+dt@kernel.org
Cc: robh@kernel.org,
	rjui@broadcom.com,
	florian.fainelli@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	nsaenz@kernel.org,
	ulf.hansson@linaro.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mmc: brcm,iproc-sdhci: allow dma-coherent property
Date: Fri,  6 Mar 2026 20:06:53 +0900
Message-Id: <20260306110653.3519-1-jun85566@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260305234703.38490-1-jun85566@gmail.com>
References: <20260305234703.38490-1-jun85566@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_030720_358609_FB8FA6D0 
X-CRM114-Status: UNSURE (   7.77  )
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

Dear Krzysztof, Rob, and Ray,

Thank you for the feedback. I've checked the linux-next tree and confirmed 
that Rob Herring's patch (commit acb52756e90c) already addresses this issue.

I apologize for the redundant submission. Please disregard this patch.

Best regards,
Lee Yongjun

