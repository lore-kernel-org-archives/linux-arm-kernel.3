Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92544C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 21:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=5kGN5o/zEXQARF41Fe2bQKp8S/R/99G74XpkHYXo/DQ=; b=niglC/X1keqFXG
	1YjLwfLdiRAN6P3J/DaNgBQgqlEkc1ufc52juu/g9mp7qX8miW6S5/vW3yOZwO0BjrNLVAk0vOS0o
	AYOP+d9LdSE/cBhtl+YweFLB02V3P4REnWN9aKpReZSEKW9SVbOKaFihWgb8QqFUWZ0VHtBGWmlRa
	KZeu7DHQKvVyakqjP4rGWonLBFdvm1nmmDKqV35R6n93DlH6scCRNr9V0D9bObVvzJBWWoljWN7z0
	p/w0Y5YUeLe+UyZ8Oei5t7toHhLtOypyu85WruQTu/896EKrW4kkEtvt+iRgV8qYWTTsbUZkmIMe5
	u/anbhNOVr8Tx6TMaksQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqvo-0000000De16-1XcJ;
	Mon, 06 Jul 2026 21:32:48 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgqvm-0000000De0Y-0Pdb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 21:32:47 +0000
Received: by mail-oi1-x24a.google.com with SMTP id 5614622812f47-495b4a78694so4959416b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 14:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783373564; x=1783978364; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5kGN5o/zEXQARF41Fe2bQKp8S/R/99G74XpkHYXo/DQ=;
        b=drBoet51doKl4fUpr3cJu1kX0hJYzxyBICrecR2XocbfCR0Wv0pieF4bxPPkDSXQE/
         F1mwpnf2ZsYkQQLMglWGITAvDpgsNgIx10M4dT6QZjQhqNqfSz8IfvJB45uqypoM3oC5
         bXk0xT+UyCYh6eGE3WL2vV4A/T76QvqRtn1GB/4Lr5g4hJ1YSj7ZOx6zLvgfpz8QZOGX
         Bk+R7WZ5+bqnh7vHlXYDht4WqMYz/vSMoqpejr8xX/nhl5jIaTvRSTst5PI+EHKzad/y
         B/FWhYE5mA7jcJO6DXZjfp9oeiF3Q0xYYRqXYeWNXL6iTwbQNAjASSdP5ohqCrN7ZGTE
         7B8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783373564; x=1783978364;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5kGN5o/zEXQARF41Fe2bQKp8S/R/99G74XpkHYXo/DQ=;
        b=XUHdsewktMFQ66g8r9M1TVZyh6TWA6THTCZi3DlNB1Grq9t9kuCxX0bDlAD1n2C4dB
         UiVgGFvTtJ8DtI+sjPvtA1nPFIEOjTJ+WIprAkAc/BQratjOfoa9DOipCTePFPqJ3v07
         vfMU4hCQ0lvqVkZASSCOrFZrjWYC3lGUpghxFr07I3tfTGopM3Wir6z8ipPvuw7OaKHv
         5g8nN0mp3a9JIP9SAvqtabILNNx7yfTc6rtBExSfocdbVC/yXzxe/Yb+ZtaR8J2b5h6l
         pAUOzVTzLNtQ3cENRKzGnKSfm2n3Mr+2VcjHRX/K4FqKqT/fRnlxYHOTsFKxTsU6tDmY
         ecVA==
X-Forwarded-Encrypted: i=1; AFNElJ8wjR2LtAa5J17Mjjc1Cgo50cFNw0fLe2c5jiwpGUSi5Du2Q9Cc+v0odv31D5bmpRP58Hwr4I+Icvnevn9Pkv3R@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu4Q5uu68TWGxCqKkcgiQ/McJHIlBf3ro6JuQJlnv21FUdXX3f
	wbgG3hKDaHbE84oy0D8naZdJe9UEvfQXoXUuQo6RJg08Q8IaZT8zdSMvma2Bh6JAuX/jRwo+UR+
	FvOysxUPAKJp/sbvsNVHyl9Tmkw==
X-Received: from ilb17-n2.prod.google.com ([2002:a05:6e02:5311:20b0:503:5897:39ce])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:4fea:b0:497:da7f:179e with SMTP id 5614622812f47-49fde9fed6amr1716488b6e.38.1783373564250;
 Mon, 06 Jul 2026 14:32:44 -0700 (PDT)
Date: Mon, 06 Jul 2026 21:32:43 +0000
In-Reply-To: <stable-reply-arm64-vhe-66-20260701193800@kernel.org> (message
 from Sasha Levin on Wed,  1 Jul 2026 20:38:35 -0400)
Mime-Version: 1.0
Message-ID: <gsntmrw36byc.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH 0/5] Backport ARM64 VHE boot fixes to 6.6.y
From: Colton Lewis <coltonlewis@google.com>
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, sashal@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, james.morse@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mizhang@google.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_143246_139536_394D9FB2 
X-CRM114-Status: UNSURE (   8.54  )
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

Hi Sasha, thanks for reviewing.

Sasha Levin <sashal@kernel.org> writes:

>> This series backports VHE CPU boot fixes to the 6.6.y stable branch.

>> These fixes are already present in the 6.12.y stable branch (and
>> newer), but are missing in 6.6.y. They are required to enable booting
>> L1 guests with nested virtualization enabled (kvm-arm.mode=nested).

> Ugh, yes, the sha1s don't make sense.

> While respinning, please also consider whether upstream 3855a7b91d42
> ("KVM: arm64: Initialize SCTLR_EL1 in __kvm_hyp_init_cpu()") should
> join the series.

That's a small commit so it shouldn't be any trouble to add it.


> --
> Thanks,
> Sasha

