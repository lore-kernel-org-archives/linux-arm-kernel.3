Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769C5C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 02:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f28NzlPclTUQrm9z8qWDo9K5sejEm68bwyiiU26NRcs=; b=RW2E90Gjk+KR5n3YTgPh0sIgtB
	DfolhzVErLpfHMyQCnUJ+PBW61PNEUbY2AEef5p9Au0R4JQ21/SOsc6jjMLO1v6fu+/Kc3VBDm5Dx
	KM/lX3STq2yRmEovWi/n4gRMffM+Z3yiKGNYWDeAqKgtK/HKx8KgvEfZAmoDUEBAgm4qAMj95m5vl
	Q0eICx0sxQofqrObCRXuxSJ8MmRepy92IsVdr/co1jyEBRi30cFdFeBH2hn+QIs+G63byM+oasBBn
	nbpK5cn9/JP53W72clM7JV5VMWzOvrmEgvd0BPT/OPp39tB/z4j5W1pYoiXly9aGMHDTSU8ID86b6
	/gR84YoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub8kB-00000000xrk-2ktL;
	Mon, 14 Jul 2025 02:16:39 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ub8hm-00000000xdw-0PVe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 02:14:11 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2363616a1a6so31223275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 19:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752459249; x=1753064049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f28NzlPclTUQrm9z8qWDo9K5sejEm68bwyiiU26NRcs=;
        b=a9xmyTk8fsdHLs8rBq5IxIH/B6UW3Qn+mMUtSVNCnsiL5IKSikJNERAT05bF0gB9ed
         jCT9N82XZvziGrNB8pv9vWIjXbOCKmCZ8VEVpCLyVuQA5oAgKYGP0TD4ohKqqKkCe9Lx
         b5VzXteifjhkn366zxG68EpPk4HpmxwZ1G1Xmcse6oKlSfK5kVr+BCKp8nPfSB7Lp7UJ
         BFRf4vK7B/4mvdbZWmVCrwFYgRBNAa5FEuT/7BTFX4MobIvAFl1zWH83t3spUipnGiyr
         6oLPzHQwWxGlrh1g6vG8wezX4S7mJQTYsCkMJm0/ON48kgMff8NYQK6CB7JtRgFGAaM1
         TUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752459249; x=1753064049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f28NzlPclTUQrm9z8qWDo9K5sejEm68bwyiiU26NRcs=;
        b=rz+9bBYj1ckJpwAciK3G1M1nPb+0z326jGT5HqtTk1noJ+ytLBDEE1me91rMitrmzU
         jDVkl/6xJn3ea8UwYAxFYL2yLROhRFOMeDADZ45wEzCYOS9gKqQAnrNMwlVX+Hmg5vyM
         9rPc46sfTGcYL2FX/dRwIUAEKmdPlhmCGniRrwE+qCYxzDo0hyfIM1iw+bppM33MoYCV
         t97uAxc2LG0oE6wzZcw+rt8Bx+/rrCl/cyj/GIOqdZFN03q22AbmWTmTtW3TpCL+Ubma
         JFi5uzQkFVnltn897X9yda+d2bwr7A3aUPm7a1FF3IHu96b1f32/4pqBpTHCVcUVb8yh
         wuDw==
X-Forwarded-Encrypted: i=1; AJvYcCV5KXkBxV6dBZtvdgvPKPNuVxcCqw/N1X7XBskTp9eUsJF4vq9WWwZDuLM8HQm3zQDNhmY1dnhPpvMhzget2RPM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6vckA6CJt9bPK+4+wQb01B9MhwQsjxHLJWlbeNHrO5peDQUF4
	FT4Slwyd1mEPO5n9/x/+5G0LhjaF7CklDvFDSX/+XsB/o2/AdToscT47
X-Gm-Gg: ASbGnctk5Ba0kkVSphe7I/hymnAk9W1+yPbVTZe9KJfwJwVKd/uTnqfEn78M6e+M3d9
	VeMPje00lTgxoEM0Q9zdrHDKQ0B6dQ1ufLNBpeXzqF3rRF/S6OWnnPw8K5Rbc/mvCMS28amZFT9
	rZR50QeJPIo1UF1AbqYDnhTfka7Bavb3i+q1LnCKVx+q8KYx68AKm9JCF1gqF3bQUc63upPsp5W
	uM0mzhE5hVWptj5a0kbbRyO4pBA+NJAPne0sZQL8EUBOnnuER3PQKQ38Ax0dSzvTBWLIPVovn7T
	YlxtFuZ89t5gakHYtYRmFaCaZaxH0wRL2D7/1e+8rznaNJPqezYI7Co4qkfOCjFDMnwtXTTzlAl
	R5jCAZSvGBelAjSlJcAl+Pc9m73+6MM9USQBNZ0AbyN0T4rA=
X-Google-Smtp-Source: AGHT+IECqiDZzuBM1Py+ovvAtJ/BufPA/xN2pM0u0YOxFUEFZUGGbSxMQOZDROS/ufqDSQZ0lprfhg==
X-Received: by 2002:a17:902:d58c:b0:235:f298:cbb3 with SMTP id d9443c01a7336-23dee1e84c4mr160698155ad.18.1752459249241;
        Sun, 13 Jul 2025 19:14:09 -0700 (PDT)
Received: from daerolee-Swift-SF316-51.. ([49.142.96.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4345e6bsm81331175ad.192.2025.07.13.19.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 19:14:08 -0700 (PDT)
From: DaeRo Lee <skseofh@gmail.com>
X-Google-Original-From: DaeRo Lee <skseofh@naver.com>
To: will@kernel.org
Cc: alexandru.elisei@arm.com,
	james.morse@arm.com,
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
Date: Mon, 14 Jul 2025 11:14:00 +0900
Message-Id: <20250714021400.631762-1-skseofh@naver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aHQQiJr2xLe9KotP@willie-the-truck>
References: <aHQQiJr2xLe9KotP@willie-the-truck>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_191410_127506_FCCDB866 
X-CRM114-Status: UNSURE (   6.89  )
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

