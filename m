Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8CCCD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Jun 2026 13:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1gzIf8fgHb7Ze/dJb/40ZOzqNvNSD6l3yJqC/XWnEI=; b=yTLEuuPgSwXJkTv+XYawpML58k
	fVUU4AbTHSrukx+Kq/Kj4qOb2xDqjja9CAMnUlc4LwcdFXwwMkbI4i5OTqqPY95LWjYGoOlfD+j0y
	vmBfbObUZ4eajI1l7q94yQCYnlHtEzC9Ev5GlUvKiaAz712B/VGBM5dGWSIomjEkW1jMcxTOy8TnO
	UMQrgAZYrJoN+7+6mE8QjD6kTeBpJ46LFIcNy+B+ZsVGvYfIVOcDJwFKqWfB/bDCSUQS9/ZC9IeT+
	wWzKkRfRU6o0sMc6bJ2okWQR1mej6G0aXok0PVI4xN58yNgReCJQvDK5gxQl7x2Aj7oPxB7IDLQ4x
	pepnLXnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wavUQ-00000003Ncd-3PGr;
	Sat, 20 Jun 2026 13:12:02 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wavUN-00000003NcG-3cFc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Jun 2026 13:12:01 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso32340865ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 20 Jun 2026 06:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781961118; x=1782565918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1gzIf8fgHb7Ze/dJb/40ZOzqNvNSD6l3yJqC/XWnEI=;
        b=EXAw0kpeYZMCjcCsrnxPwpJbqNvVHOqMMxP4JpTB8iAMbDpXMF+7LqWkrQzJfLf+sS
         M45/vlCNfE4ZzRjKPv5D5sXq74LdZY9SiqH+X/sUu75+0OrhcKWw/D5zGNzu7IK4i4jw
         +sFoyCXpy5Ogfes4iJkIllkZjk206V8WVCTiUkbppIRnb3SbJqkibe3kytL3zcMgTZUt
         c8djwMlUCNsBznOzaBzIa7mWqdgUjHz1gTqrvN2fKKX8otMDlh2P+tSbwc/i7e8Tg6Fo
         F/oHV59xBQVdP5fq6NIgaOnRLi+SPGWTKPh5Umk1esYtZgvczp76OM7MzPCk1zfAmMgn
         ewUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781961118; x=1782565918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f1gzIf8fgHb7Ze/dJb/40ZOzqNvNSD6l3yJqC/XWnEI=;
        b=k/SNA5uqMk3SL7MMgGblNjSQIvq455mBuVYcCY1N1NnZc/rwn8iQBpKuTjAMykJW+I
         iskOJz2fG7uvMujev2Z2SObkkJ6ZNPQ3nFrHM2dnPex6GjFIrrk6FY2XviHBU+7UiV8V
         yTTBbeK86USF3tAO+exmRHi0rWtLvJkzf2H0mtQUQvjceJFy46gv8dselXLcb+wTMGbE
         bae5mZJdOKuuJmxHFOiEjBPDi+1CCUonrYANLGHzXQP4bB/ejfkmbheXH0SPfZXU/9r4
         SGqCVCCf6lZ5EsjpmnldwlnTiJKDC4TWpkZI3jaqq5+jnEAsU6jcmlw3RkhTkASJAfIE
         sIrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/5Xd0cjTRZg8t/2QDo8fI0Ev3fUqmZCfxjrlIrrTLoHE+L/ypqrRQwRnXFQqAYKJr5YxrWG2seM6I0M6Yvf/AT@lists.infradead.org
X-Gm-Message-State: AOJu0Yyier+HL10j9lZL1wGneUS2J03MjYGfW5mUrv8JGu7k1G5x/gRm
	vqe6Wj6KfE3yymTc6f+grEknfdJ+xaBVtLOhYF3IxlCUNxzNP6V/x42X
X-Gm-Gg: AfdE7cneeLrP8nBHzfHnehn34ipIUz1IatvXp+IKHTCyjtIr8riUg0OsfsWKhzboWha
	vmG0o+YF3vd/4ySzqA1daMWgMSGVTmPJzZSExDF1jVX5T8Qtzn9X8bxy/ujevRrvT3S4zYGQEdy
	ncWmkpXbUnbCr3rohl246Ijr0gXEqd7n8WlepoDJCUJTy6nXnl18XN8Iqir4Gkmx0vhX/r07e5G
	O1STTxJKrC4ylNgzIjUD/HiGFAVq7Q9+1DbijNdYQVjsbJYpmYcW19UzvoJmnFkTbvCLK5/cyGn
	0wgeXs2nUKnNGw9muaxB8RVx6d7sN5auenC1QIDXwF92G7ZMPmxuDzyh463WK+SX0AyONC/Q9HD
	YVZw4pJtg0cB6OHbGFheqk9FhUoovM7A2LL9t4G9KlAHKcTI0w3278+w5LuPJZWDBiPxXxKXC/w
	H6DzK0mbVS73Ih3FbHqqfXtvJrTg/fkSyH9ltctTRTv/0bIQ==
X-Received: by 2002:a17:903:234c:b0:2bf:356f:4e0c with SMTP id d9443c01a7336-2c725ba685amr74009065ad.1.1781961118146;
        Sat, 20 Jun 2026 06:11:58 -0700 (PDT)
Received: from LAPTOP-97G9G880.domain.name ([106.222.202.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c743bfea46sm23206645ad.69.2026.06.20.06.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 06:11:57 -0700 (PDT)
From: Karthikeyan KS <karthiproffesional@gmail.com>
To: andrew@codeconstruct.com.au
Cc: joel@jms.id.au,
	andrew@aj.id.au,
	Kees Cook <kees@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v6] soc: aspeed: lpc-snoop: Fix usercopy overflow in snoop_file_read
Date: Sat, 20 Jun 2026 13:11:50 +0000
Message-ID: <20260620131150.184838-1-karthiproffesional@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
References: <033f2657ae6a94ad13d22f717a2900afb75d892d.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260620_061159_932890_30CF9586 
X-CRM114-Status: UNSURE (   8.91  )
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

On Wed, 2026-06-17 at 13:10 +0000, Andrew Jeffery wrote:
> Can you confirm you have tested on hardware a backport of this
> patch to your BSP kernel?

Not until yesterday, done now. Backported the fix to
the BSP kernel (5.4.x) on the AST2600 BMC where the original failure
was observed. Tested under continuous host reboot cycles with concurrent
userspace reads on /dev/aspeed-lpc-snoop0. no panic, no usercopy
splat. Same workload on the unpatched BSP reproduced reliably.

Thanks,
Karthikeyan

