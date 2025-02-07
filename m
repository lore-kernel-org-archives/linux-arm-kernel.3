Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFD0C02199
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 14:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JmM/iQkbvbBvv7fXX70IILA144cHjP/mqwSWag+vGNY=; b=TezRhseMiKSnEWqnE1Gf9NkDmP
	Fry8woefrpOFz4Po5h13Fg2AYi8H65lJ8eWGdY3ed/utJpAHr7yepJIqWwYi6crGvtXx4k8y2kTxa
	iBof+5g6nPqwnudLEO13AW2ZcHjISpan/FsFJyKh5f2HerULAcYiZowY0n5AosyOXwvz0DWLhHpIk
	u3cPm64fTQMKJVyPAE1GfzOiLwWWt2/J8PcbVDMfjZGefGKFqUC++cxdiyiJ+tIihApv/w6wLjHbF
	2RShYAjyoh9wgceIWjmwSuECNN24oF0U/CfdRBtM9m3B3xXEK8flnIdHtHnNZXLF0WFdFGcbELA+1
	aV38u4hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPm5-00000009yNy-3s15;
	Fri, 07 Feb 2025 14:56:09 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPkh-00000009y4W-2Njd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 14:54:45 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5dcee17a6a5so2602109a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Feb 2025 06:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738940081; x=1739544881; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JmM/iQkbvbBvv7fXX70IILA144cHjP/mqwSWag+vGNY=;
        b=sov54HDUSmASSs4FeDXuOZqtRrGKVI0AsfUL4RXeiud3B7RMCDcCUJwasA8GCJB3JZ
         q1AghfR/080l8ntLWu0IrhLrIj3iHEiQgCRNH5/mqpzgwv3CASICnvIj2lIfg0tj6QCq
         0hgRGukQqmvdOA3QvQjTPHmdGpQW+CB+JhCV0OfBBJ6tkWzTfLU+y9pl5GPmVhKo8Ksf
         g3ZFRwF4o4jF/s8/7QdKNaOfAU4P+/NJwNZhHKiHugdpYvYupU3OH+9OjGDZ251tOqss
         EggDgEEzxHFGDOgKiEs+m4Gt8uV4BUjTkBUUs7Hgbb78cba0VjD85E2+4ZOEsJ/bWV2i
         wjuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940081; x=1739544881;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JmM/iQkbvbBvv7fXX70IILA144cHjP/mqwSWag+vGNY=;
        b=saDu6qAJsf+S/ZKzKtcbcby5pqboFTmASH1mqYf2YQ4kvhoWnlB961R7nGFmboPURc
         oRk4YzamTlAQ1EPdggMkW1GanOfkUCMo2kOc8YfqR31/E/J7/Jg1T6cES0nQ5SZHZQJd
         FvUdJ8mEfKSm0LxufqRPw3couHCDetrPid3XHMXhkmkpb+Nxv2j/Rcoh0OBmHAOlL06c
         Aa0fkiUJlvUg3ev+JqSWxeCSa1mQbFA+Hj4mQy7ycRfjg6/Hyts8K0ZwoTku6ckYdLUF
         iRRi7IQwl4SAmzfdevsy2oeiqZxpuMmw1vzVbbAvVx8h3wzqTodiRTNZEjclcvnmPEem
         HjoA==
X-Forwarded-Encrypted: i=1; AJvYcCVHIxru+/mtxVanS+QFwdsB2bus09ORVDaaagLgf8qo43+VamjDRQybQwIPEbfqsrWCp/dBegMV3VjbzayaKhKE@lists.infradead.org
X-Gm-Message-State: AOJu0YwL05XwekJ/xkzPASp8ZX24MagtLATV5y51WKa1f81Y/mFqmHAe
	dwvvkBEFI6BoH3Ump2Y6NHcPz1X6i9X+DEVjks3fLIxBk3oAuwoSa9hI7DaAIEuLG80+V9KzeC6
	6CTfXAQ==
X-Google-Smtp-Source: AGHT+IHcnN2p00NsIVJ/Tco7clKqry81fiAhoeHRLb1kPa5FchoYCPasviVPCLtY7RbBfUFKTgyinTclnwgX
X-Received: from ejer10.prod.google.com ([2002:a17:906:9ca:b0:aa9:1d5b:da39])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:9719:b0:aae:b259:ef63
 with SMTP id a640c23a62f3a-ab789b27dddmr445128366b.34.1738940081474; Fri, 07
 Feb 2025 06:54:41 -0800 (PST)
Date: Fri,  7 Feb 2025 14:54:36 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250207145438.1333475-1-qperret@google.com>
Subject: [PATCH 0/2] Fixes for pKVM NP-guest support
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_065443_604498_2397910E 
X-CRM114-Status: GOOD (  10.02  )
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

Hi all,

Here are two patches to deal with a race between the handling of
permission faults and MMU notifiers with pKVM that I found by
inspection. Specifically, pKVM gets thoroughly confused when it doesn't
find a page mapped in its relax_perm path, while standard KVM deals
with that trivially thanks to the -EAGAIN special case in
user_mem_abort(). The second patch addresses the problem by simplifying
the implementation of multiple pKVM hypercalls, which also has the nice
side effect of improving locking by not taking the global host stage-2
lock as much.

Patches based on 6.14-rc1, tested in qemu on on Google Pixel 6.

Thanks!
Quentin

Quentin Perret (2):
  KVM: arm64: Improve error handling from check_host_shared_guest()
  KVM: arm64: Simplify np-guest hypercalls

 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 73 +++++++++++++++------------
 1 file changed, 40 insertions(+), 33 deletions(-)

-- 
2.48.1.502.g6dc24dfdaf-goog


