Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0122F532E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 06:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=; b=k4gMdXnrpnSHiKHNYJu2mLEEAl
	CcacqD79UnX1hgY6Rxv9L7Nz2Qd5Xskt3JPghwCUoTOZ8yEpt9UpMYKzfoY+HzvCSwmyiiHIbRVd4
	gekVt5/FNq8mXEN9NL5Ch5pAC0oTalss8krBTIAmiyDzVMywCeQfXzk3u5Db1XKmc7FXfus9N/p2F
	IwAG74kYdzZd3rjdjvTOHV6zaVVY/+yDJCq4L7y5jW7T1vW7D+q144Zp/023EpyUAdiCnvDZSAci5
	VPVCXaee8iABLuTpwd2K9ZU1gEyA9zbc/hSzee23YgCn5DA6JrjrkvqChNzU295DbwuQJl061HpD0
	g/XfAsTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vMd-00000000lLT-1wpz;
	Tue, 24 Mar 2026 06:35:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vMb-00000000lKd-2bn5
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Mar 2026 06:35:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=; b=UpGMUF8RU21KmqtmvC6Ad8ogN6
	NtYwsBtWviL7sFip2qZpbA7qOr8oSzfBlnF1qIC0Ix7FGOHlh78JNAff2N8cBgGsL+gQ9vVDdDtHb
	Vtf1yoBFcgCTwGo6VCM1gxApJYHwBRWddkEH4qJSWTEKmNe57inDL4ld4WTl795fQaXWgrNv8YVS1
	1x2/tecVjJxOknfCqoob5slpmVashV2CoSZr6EOb1eE1cnnEMJWj/mX+n7eVYGJaR5jMeE0CdRHox
	DTOhzIvZHaWW4KhYs1nsms9fun6Z7+TezHE16RLWmL8qFMsuKv8prwb76z+jXxJe5LB68CBbaVX4O
	a7fiZHRA==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vMQ-00000003J7u-0LMl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 06:35:36 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-43b4fd681c2so712463f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 23:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774334125; x=1774938925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=;
        b=Y/R/ZjAKuKpdTkpMeyc3ckcWpyhAZfPzYlJT2snOsFv4UUiS8/kFepNB9xwZF+Hyrh
         L9tnslBTS437ip+IxhXv3pP4/JCsQ8IMyrRnWZcxEjVRYuKho5mZyQUqpJdEMSH9Yoe5
         olnYvKPX+rYPbGzGqCd8mcIHDBYzgR9eV6McgTVx7xW0C4VrAhJuMvaOKDjx2w6nh/YG
         yx96Foi6N/d2fup8sfqC2xy3XJ7W10aIydSuXw7e5lALtTeb5DxAcVO1eSYfGe4BZLT8
         8HvtvrMISbK+QX/Ggy0o1EuYu7RvL+5sn8C63alyGbDS3y41FOQEVO4opxiK8XdTCkZi
         66wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774334125; x=1774938925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mifv6lV/1vhl2tnAgC+pUhj48DLTv7wevR0+F6OEtI0=;
        b=Ilii1fLCyAxVqoT6jb35TKInhEkw90cmeFCxSZayvcYqEZEXkAMONXf3Auz96L1zx/
         MIlXzJ+DVCvpSUY7vCjO/3zdLIjuixkEJ7Kx+9JRivpcHCz3Xjwi+eY7xdNq5Vgx35Kw
         nf7U+3ia9nyQYW8ZFQnbAy/W34wKKbLrtDFbf3PB/Gfmui1efIpOxWrTBfT6NnZtiMfl
         5grAJPiLzM3IMh5WiqhW5dVRgbKS8fUb/KVj48ii0r3puIh4WuRwxsfl62t/BxcxrLxP
         SJ69EqJ1OcWtdVq+xSdrk9lR0pFHRfFKHMYsOqAIxQG91px8JMBNx7UsSj4/NLTAgFNI
         Pf3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9edTkpCdScVp/Uwo3d5JhuRM6AlhEs8CiZeihcuzsAN47AWL8DHh3FwjmcN/GUMF4qoZDUnmAoAqtCV2YS3Co@lists.infradead.org
X-Gm-Message-State: AOJu0YwXpJzN1wZmJ8TtF9WOmelZveGhfqCFeLGsogSXMpWakjJkbig9
	Rts6aTb04AKPX6vf7MJm/t72tiTgLHwQhkMwvZAYF1OSaLMJLmA19q5h
X-Gm-Gg: ATEYQzyL4ymrk8aFdmvCoq5F2tT0zxGlgXIdWgrsUQmaMGbZtQ97KlI5FiEjcGvQ3fH
	DxJYPXjJTu+ldNtVOiwoKrIbIda0BoHfIy2D7vCcOoqWnpVpdyFtXykHIluiRMnn3JLaawNep01
	j/zriAFPU3ioNRKPXROajMf/fRWWp6kBpvw3s1whzLoG/sUZt51BWzxxosbHpDJQfP6DylGNBV0
	KcT7cQaehx7T1sB0/8IsoBDlTkjRyDDm650X1otUJ9ZvrPz05i4Zgv1kNcFqBCk+5Outq4EQCQY
	YWWp/wOn/+ZWxRRdNgcKsTjkXY9A22TNk8nzqGTZS1/oDE2pdbCqjju995ENBe/uvbLQnkPkcD5
	uz+z9lMKsKZaCbXa2TSQ9h1pGweyrdv3LqVARbcj/yvSKwccZ31ebx0zSSaXZCK/GqLIcR2E0J2
	XpHBVvZDtWNxsk4e1D940=
X-Received: by 2002:a05:6000:1aca:b0:439:be78:e1e9 with SMTP id ffacd0b85a97d-43b6423fabamr24225594f8f.14.1774334124571;
        Mon, 23 Mar 2026 23:35:24 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43b6470380asm34457509f8f.24.2026.03.23.23.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 23:35:23 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: ruanjinjie@huawei.com
Cc: devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	x86@kernel.org
Subject: Re: [PATCH v9 0/5] arm64/riscv: Add support for crashkernel CMA reservation
Date: Tue, 24 Mar 2026 09:35:18 +0300
Message-ID: <20260324063519.3258161-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323072745.2481719-1-ruanjinjie@huawei.com>
References: <20260323072745.2481719-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_063533_191001_559D2CB6 
X-CRM114-Status: UNSURE (   6.20  )
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

Please, remove me from CC list in future versions of this patchset

-- 
Askar Safin

