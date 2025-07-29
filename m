Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1AFC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 23:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LS+T/y+NsOpuW4oCoWoDJ8akduRknfqoGYJRkz33V1U=; b=ZS7VYvbIDJUi3dKeN+qVGKY/mU
	RdOXvRf7KeyYNYMnTFv055QTwg9M/GcxKar7re22JuLspbjIfery6kK5wOrLIiRSQbD6i4xiKIL+8
	+6QejX/m1mSaHdDIOzY4af2agYxxtAlgneyp8g/SyvfSW3UwFXr1hDPJ/bnsHL4q5UfAO0u6bENEf
	bdj/Qc1+n4sml0vT/isXZhLTPmwZZnKz2cGhsDyrSjQTPeA67OzMPSYVcLUJ/aSt/1oeLLXJgOyfM
	szi2tePqdy/QQXnKJjGFv8ymJIBbcUKAn2my51upmB0SjQmcMMBJUVbsU4Fz7hvs7pGdfPNgrB0pD
	ljXR98EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtPs-00000000G8q-3vi5;
	Tue, 29 Jul 2025 23:07:28 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtEO-00000000DkJ-1tID
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 22:55:37 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2400b28296fso40080465ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 15:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753829735; x=1754434535; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=LS+T/y+NsOpuW4oCoWoDJ8akduRknfqoGYJRkz33V1U=;
        b=sxVMQfAWOS99XllrDlskyF727Kz8Seo0nQycbZYz4HiXkJn657WJx/dcknKOCzx2g+
         M9u0c4PveYqzRd9oOSvAaWNrBsVKtjqTOX7KSn19v/L9njDG7GJwSXe5+L203bXULgyE
         TESoIUfuZCllrI+9XULcgnoe2pmwQy+fGrp0NpXYBBGRo0uHlQGuz9LY56X7j8dZrCLq
         41hdEYlUn4QcEtXQekHgQqVJ8iCKHQ9OOOcXINpmHltHK+K5w2KR2C+ETrJyFF0df/Cx
         oVxspDvMf7zIbgQN4GSM+gjtHzkdZQVR/8EAkgPq5QtghAo3Il7PpEl+yDDdUKHuYMO/
         HuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753829735; x=1754434535;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LS+T/y+NsOpuW4oCoWoDJ8akduRknfqoGYJRkz33V1U=;
        b=MkS8TbeCfuKF9a39ZSXCHz66Agv7XT4FaRdBEXNQvx+3GiIW/5H+MkcRDiU42LHwbR
         dFrXP9W/YEk1Iv/VpxnFlbtNEqmsYnVgmcYnkBL5DfjxjUB1C80zf0LoCq6eoux138la
         vddgXBTTR9+sizpzh56raT3iIg8183bJfRVfCLIbQnh5d0bfBbH4n1ynf1PqO6yj9NMD
         K8vGxz2ojKIbW2R/VTY6ITprshlXX+/f9tu1lHn6HiTbkdizOQZUECadHGyP1adw9W5x
         ykjnroEpehGEnAzvhKcGFfXKO/bjcaDW0hF9Ce0bi8BOtkB6MHN5iXISHHMzxjwT93EL
         cRzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXs3uys28VxMJGRlYrLrg5bwcuoBsrX5t/vBlvuAO5pDNzHN08MH03TVxvta79PvTHqjqC6J2sMqWlRzDu9idNI@lists.infradead.org
X-Gm-Message-State: AOJu0YyI/T6dRjh78PJOArW7lek8ym8bP5tqf+3PORb5RJ0bPPzZMMF0
	BZiPL9dPY9O9y088Jp/16GIYD5RdS+HmTC6n6jE/+RXjJMvPgqY/NRQz9KM5ELRrw9HYA52tMeM
	Aj4SCoA==
X-Google-Smtp-Source: AGHT+IHpmI5t9q8abNBgRyh5X76Xt5TR0J+JP8kdnFD/iZ18CSlsLse7XJRB4ca0uWJ63xXXHrffCkBn52o=
X-Received: from plbnb8.prod.google.com ([2002:a17:903:15c8:b0:23e:3914:f342])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e890:b0:224:910:23f0
 with SMTP id d9443c01a7336-24096b3d823mr14938045ad.49.1753829734856; Tue, 29
 Jul 2025 15:55:34 -0700 (PDT)
Date: Tue, 29 Jul 2025 15:54:34 -0700
In-Reply-To: <20250729225455.670324-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729225455.670324-4-seanjc@google.com>
Subject: [PATCH v17 03/24] KVM: x86: Select KVM_GENERIC_PRIVATE_MEM directly
 from KVM_SW_PROTECTED_VM
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Xiaoyao Li <xiaoyao.li@intel.com>, 
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Tao Chan <chentao@kylinos.cn>, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_155536_488695_C2B43464 
X-CRM114-Status: GOOD (  10.89  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Now that KVM_SW_PROTECTED_VM doesn't have a hidden dependency on KVM_X86,
select KVM_GENERIC_PRIVATE_MEM from within KVM_SW_PROTECTED_VM instead of
conditionally selecting it from KVM_X86.

No functional change intended.

Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 9895fc3cd901..402ba00fdf45 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -46,7 +46,6 @@ config KVM_X86
 	select HAVE_KVM_PM_NOTIFIER if PM
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_GENERIC_PRE_FAULT_MEMORY
-	select KVM_GENERIC_PRIVATE_MEM if KVM_SW_PROTECTED_VM
 	select KVM_WERROR if WERROR
 
 config KVM
@@ -84,6 +83,7 @@ config KVM_SW_PROTECTED_VM
 	bool "Enable support for KVM software-protected VMs"
 	depends on EXPERT
 	depends on KVM_X86 && X86_64
+	select KVM_GENERIC_PRIVATE_MEM
 	help
 	  Enable support for KVM software-protected VMs.  Currently, software-
 	  protected VMs are purely a development and testing vehicle for
-- 
2.50.1.552.g942d659e1b-goog


