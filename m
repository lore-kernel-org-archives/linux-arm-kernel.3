Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6CC4CFC29E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 18:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gf/8Pk7Wi+5ZKHSgJ1cayHET+i6n5m5sIz+x1glR7jY=; b=nrSLxrcBtEu4dh7PetdPUQRy6V
	3tbZQVq7bWgME6FXPl9u6DMRDo1cnnGVYP/wr7u7rOgGsOJc9sI/hmCcgYoRwGGpCqxw6gztYlH7p
	xAdxyGd30FTrMk746bWDezNOHIO/PGYtFM7NyPqY4eqqZ19keneIq2ceK3rdAN9TM0vlyd1lOQMVN
	731+jJelCxTitilbhcZx4mNRh7CcZRJlfu0XNxxURS8Ad1f4e76+jhCfXPkWe2Vpwhv0Qip8ag+Bb
	1+HGmDwB1dtd4LNNPmHFugk8KSldBJLYnu0OTDRranai+yWRs4a7R2N3Zg6z9YC3JgWiQsv9C99fD
	n+cvymVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMWJL-00000008sOD-11hc;
	Fri, 21 Nov 2025 18:56:47 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMWJI-00000008sNr-1REV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 18:56:45 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-297f48e81b8so35509605ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Nov 2025 10:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763751403; x=1764356203; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gf/8Pk7Wi+5ZKHSgJ1cayHET+i6n5m5sIz+x1glR7jY=;
        b=mYFUueL2RjgkGCtOtXXEbUY8urJENJgS58MHjDQmr2KMFW/XlzbAe+/OIVfTYxWi1p
         V0Xo/sMpdNl14d0TJkmg1bMcOGE1vpyU/zTwbQo8VEt9Vm+R/u958HMHnY2FnZbPqq6d
         7mBmGi7iAin3MC1p/CVt6XChzadb8Fga5fTfFyDQ53K9yZQKLX00ieqEGr5G06ZUfWjJ
         edUj5EjUBsJkxnHLQRKpLRS5sUn0dz79Y3H1GLmR+d1Mzk3PIzPZune8aaEWyiGiT5lO
         2CuCiyDlLoLN3KCJ+8+ivSpSUuCDd8G7ishiKKLtlNUIfRV2wgwTkBgZCjoNerffFIDV
         TZ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763751403; x=1764356203;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gf/8Pk7Wi+5ZKHSgJ1cayHET+i6n5m5sIz+x1glR7jY=;
        b=uVmouPPWuTBSWSYCGBYiKtMZWxrKUe0IVGZsuM4d/hjc/C8iAIKW/CTFe0XxOVPwVs
         tRUcNQmgKscAgKplVtV5rKgLdy+NgO6YtNxpgGUg5ff4hiOOjetsDx89JFSE6rRDVND6
         rrKusF4YJ9pOzOL8eFP/zkxIQfBpXzG8vcMVZo2I/L0xL7sYeosBgvzEaOnUHAvfuy0i
         7MHbq3sjR50DiLAQEagLW5O8PmF6mr9vb4Wp54dcID3GSLxggriVw1bBEl7ykCQzjH3e
         eOU3tr8YS57haOLW+A4+kDcGuAVmdZAO2ODalyp+6FIr06yLt6b23pSRGEs0GxUkujSA
         ehaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVF/IrifVgII6OjQ/7n5NvidSoIWzFZvsuGM6NxPKpS4b74QgUiU9nRQINLHTou/KgxEabCtvI5F3UbnPgWUfYf@lists.infradead.org
X-Gm-Message-State: AOJu0YxTIQvvlX1ipoSlkfN8UVRf7/PVbPCnRzQZPLku+2NUaOptcydY
	JPy9MF6pheBO1USYVY1qPr2ngVR9sJiDEVBQd826idh5jd0Yt2nK1BCGS7lPh1bQsv9PUz0viHn
	3eqd4jQ==
X-Google-Smtp-Source: AGHT+IGl6lVP4k6Ffz1FVATVkFbVRdK/+fQjLr4mrrmG1VOjxZCvjJw3L3ZKENAl8ILCy7qu+uQ9S2crdpg=
X-Received: from plhv10.prod.google.com ([2002:a17:903:238a:b0:298:3543:5212])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:11cd:b0:298:639b:a64f
 with SMTP id d9443c01a7336-29b6beee840mr49422585ad.6.1763751403034; Fri, 21
 Nov 2025 10:56:43 -0800 (PST)
Date: Fri, 21 Nov 2025 10:55:37 -0800
In-Reply-To: <20251028225827.2269128-1-jmattson@google.com>
Mime-Version: 1.0
References: <20251028225827.2269128-1-jmattson@google.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
Message-ID: <176375118181.288827.8430542805047208308.b4-ty@google.com>
Subject: Re: [PATCH v2 0/4] KVM: selftests: Test SET_NESTED_STATE with 48-bit
 L2 on 57-bit L1
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	"Pratik R. Sampat" <prsampat@amd.com>, James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_105644_407034_46E8020A 
X-CRM114-Status: GOOD (  10.94  )
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

On Tue, 28 Oct 2025 15:30:38 -0700, Jim Mattson wrote:
> Prior to commit 9245fd6b8531 ("KVM: x86: model canonical checks more
> precisely"), KVM_SET_NESTED_STATE would fail if the state was captured
> with L2 active, L1 had CR4.LA57 set, L2 did not, and the
> VMCS12.HOST_GSBASE (or other host-state field checked for canonicality)
> had an address greater than 48 bits wide.
> 
> Add a regression test that reproduces the KVM_SET_NESTED_STATE failure
> conditions. To do so, the first three patches add support for 5-level
> paging in the selftest L1 VM.
> 
> [...]

Applied to kvm-x86 selftests, thanks!

[1/4] KVM: selftests: Use a loop to create guest page tables
      https://github.com/kvm-x86/linux/commit/ae5b498b8da9
[2/4] KVM: selftests: Use a loop to walk guest page tables
      https://github.com/kvm-x86/linux/commit/2103a8baf5cb
[3/4] KVM: selftests: Change VM_MODE_PXXV48_4K to VM_MODE_PXXVYY_4K
      https://github.com/kvm-x86/linux/commit/ec5806639e39
[4/4] KVM: selftests: Add a VMX test for LA57 nested state
      https://github.com/kvm-x86/linux/commit/6a8818de21d2

--
https://github.com/kvm-x86/linux/tree/next

