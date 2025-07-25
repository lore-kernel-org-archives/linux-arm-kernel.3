Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3519AC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 15:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jRIpv6z9xuIyFwnKQ1z6FnAeGn2PYDaQhA6EKMmoaPM=; b=v+8z7k154u7uK7ivewZC62lF2D
	nNizjQBN932eUFrQUnbD43DzpHeNdAEJ1zPFYn3Odh6RbpMcWpsANi6+3iLD7PbNLyASx/C0YDyP5
	F8jRB+2qa+h8P7BAMyoGixH3NgVGixmOCFhCV1cWeXOJrNZ+QnddE/N+PqglfbHcsbzY91gQKGde3
	IZTchEffN3+vA2+OfJOhYZwC5MR/pvC2Ob+o2lj6ust2awmlfhn3fh3Z6C624GOKk66MZN519694L
	SOcKoHVNt3vo44q6AW/43HcQ9wQRtKJRlTgW/UsxXfGRm2j8IrorBHQV0XSoRRbStzElPoIrcSrUt
	+dilgxgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJvq-0000000A3wF-2lGQ;
	Fri, 25 Jul 2025 15:01:58 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJtM-0000000A3Qd-1Qdh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 14:59:25 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-234b133b428so17782355ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 07:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753455563; x=1754060363; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jRIpv6z9xuIyFwnKQ1z6FnAeGn2PYDaQhA6EKMmoaPM=;
        b=fwhrBqpAOh7ZZl6iXZzd0ovtpJFsPq7H/hE+gtEfXNkx5GKAYBobklSjr8fk3EFMq8
         skEqX+SuTQRugg1iPmW+bjidQG5lSnSASlh4WHzUc2ZrUQgSdTgefCPaVoK1ximWHovO
         a+eSFdY3j1RtiqHjjhAYfg+VnjNCBPsatpR8lEIhfADJ8xtoLLsq1pYbdyoe+a26vsYE
         bzzkTkTuDBTDBLEwntVMlEYjZmaBrl/JIxFaioRgF4tNKiFzeS4u3Yjc/Bq49woDZzVi
         Ri5Bb0/NXkd2V6zdmmhWnnjMJ7Epf+dN//3Azz/lmBRPlTFs1MP/+O2ESz0SboDQnm0r
         3Jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753455563; x=1754060363;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jRIpv6z9xuIyFwnKQ1z6FnAeGn2PYDaQhA6EKMmoaPM=;
        b=NnhNngIwji+YhlQX/fUxYr+0DfbuY9R6aZPeq1mvDTTzOJ+kTz8kZEkeaZkVNJYhOJ
         K84bFsry18dBo+qkTEFrhncWLVHrMMinyLzuUWF144FmhzTmvXx7Zz+bvGy9N4KyeRN9
         7FlhReOkiw859F7cyhfwsTaQeJ3kK28irroPTONTmAbbO/g1eJhcYVvhn3paMXncIguo
         LRN43bxGMXdLdA4aqI2jHWDeU9hxaY90FifHwIQ5HtzcozfPqUxy/aCzu5Bqx7MbNbVR
         hnMhQFX5SZaHYnzK6cXLpMMwF47sMwkiZ57xYtt7ViON+t/YQ9R1Z7nW3ynS2RNaEMNU
         Kh8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcLdhKcaQV+cYHJW14r0IUBDpcnXG0+zi/S/szGXRddR0f5UuaNMhMQa8SfxYIqsIN98q9kPb9jrujZadnEKd1@lists.infradead.org
X-Gm-Message-State: AOJu0YwEAI7b1nAOMz7Z6dnOZVjdaxC1haz77styD9gBqU/ffpyORwXQ
	tlnAhX4Tmj47L+NK0/4ThRH1nfoKzRgejaQRL4y9KacUqw7YZ5czxvGpe0mYMqSGGYIX4AGDFY6
	xEuMxNA==
X-Google-Smtp-Source: AGHT+IGcNpmnHIDt5vuDnKz4Z5PQxOcekjZoRgAfUDL4gv7HZdu2LOA9zo/e7zk1ZSljYpL2Zb35pa8dzKg=
X-Received: from plbmf3.prod.google.com ([2002:a17:902:fc83:b0:235:160a:76e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:41c1:b0:235:e8da:8d6
 with SMTP id d9443c01a7336-23fb3050a7cmr38030205ad.2.1753455562745; Fri, 25
 Jul 2025 07:59:22 -0700 (PDT)
Date: Fri, 25 Jul 2025 07:59:21 -0700
In-Reply-To: <20250724235144.2428795-3-rananta@google.com>
Mime-Version: 1.0
References: <20250724235144.2428795-1-rananta@google.com> <20250724235144.2428795-3-rananta@google.com>
Message-ID: <aIObyUg77Um6VB45@google.com>
Subject: Re: [PATCH 2/2] KVM: arm64: Destroy the stage-2 page-table periodically
From: Sean Christopherson <seanjc@google.com>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Mingwei Zhang <mizhang@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_075924_378263_033EC3C3 
X-CRM114-Status: UNSURE (   5.70  )
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

Heh, without full conext, the shortlog reads like "destroy stage-2 page tables
from time to time".  Something like this would be more appropriate:

  KVM: arm64: Reschedule as needed when destroying stage-2 page-tables

