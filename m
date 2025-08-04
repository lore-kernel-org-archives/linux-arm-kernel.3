Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB457C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 18:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZVlhV6ndThCFd4+zGJNIWInZ4a60Ev1vYWmuIdzmJ4=; b=FN9QwYJcXcvz7/nGUogLG3TpJW
	vW0OTH3J9XptmxVjMsAKlLaNG32y9FS1qUzQHSkMewxCScKYO9vzynRzPwncGpMg5wNyY2F7tW64Y
	w9iFTpUaSUycksPnK2D/HMf6KqTuaq7n35m2D5XuC0ZQSRfzp4fTrRnMGBLxR7X8cAAem1oKwbfxI
	BcbKDuvkMoSag5ja594mcVI3qOD8EgVNfKBY66iEeBAqYg6F5+58tved8zDBfAojZGZzT5RYl5S4i
	7rGvIs34hRv0Hk9ckJxxMGu3lrOSd7EZ63Xz8jhgsWt33oZA397G0MwitmVXwhP80nhu/tmoYswtX
	kwtCaOnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uj00a-0000000BAbD-1f2m;
	Mon, 04 Aug 2025 18:34:04 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uizy1-0000000BASC-1gnN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 18:31:26 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b115fb801bcso6465514a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Aug 2025 11:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754332284; x=1754937084; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZVlhV6ndThCFd4+zGJNIWInZ4a60Ev1vYWmuIdzmJ4=;
        b=yNEJw04nP701nA2AsybblJk3Pit2eqpZOxZmByFf1RozNUyHaefbubgv+eZ3ZT/x3V
         JzGmlAODAhoGXtWzjgJoWRmDW57XtBKQ3HgxYzA4Ky4BuQpBAK2mLfOqnM7O338z8uSV
         ZxqUpAH5Fgf1Nl1THq8RqCrmDKIGqnPsgq4W1gMyoeRTqO+RsI9lYfFO6ggirhe6IHJ0
         hCZdiv5ytnzqo/Jz2Cc/SOcjVnCOr2cFbSbIbFqQWH2JWtSiqGqUrx7xg8S9+8Y9tjrE
         r7RuxMXnf0WdgYB8b7bt7ffGPr+0ewFxvgoIC25dYQgZUcxBwvAMO2Aoe71ib33IQ83o
         1WLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754332284; x=1754937084;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ZVlhV6ndThCFd4+zGJNIWInZ4a60Ev1vYWmuIdzmJ4=;
        b=Vp/Ze9n4/cvZuKpyUl+0OaTwM7HCCXkbN8ovWN0MXxnsexotcIavlusyyD7pm+Bi6d
         rv77fgA8JQTiu4s3U0QEIHsZaYgfmL2vddVoDKa/Z2+UeSoZB5lX/toQxPEbZWjz8FIb
         fjGLrAsTUncr+HGGmUcjb1l4ETvizEwKtkIn+72jF1NeeC60mldl9LXkM2ibAkkuvd9c
         yRPkwjTf+AAk4b19/ZQPFpYdk10NJ1+aJYyFkf3vKqxh4Tra/gA922DYTKymR1BByv93
         UaRC/2Xy2Uv3Elw5DT/XgQGAdaVnwaH8tE6es0VtBT5G7iguKmAIVrrbbHkb4mOiI0it
         iPew==
X-Forwarded-Encrypted: i=1; AJvYcCVpKOtxMez5IaziEBNK7dHc6fr4lOjIatmucjhdKvfg6JS0N2NKrhzt8MAg85Mq85IzG21fEr1SaPRLAFyKJGMf@lists.infradead.org
X-Gm-Message-State: AOJu0YySEqAeL77GzgSbBbReZubxvhITYHU1ojWs6VTJ6HnAx1xYYG4j
	YugziPEtdy5XAEXqMiTOs5DH5Vnny952JslAFXL9f0NHrnSQQViOKjUSJatSkFKTTkhfLcbcE+s
	cqJ2gnYelvQ==
X-Google-Smtp-Source: AGHT+IHWBu3VQz8pzZ+1rcfbz3HxJNSMQP0rdBf6OTWgijBCozRjoOUWrc/UH4pOKHcnDrH55Kq6u4Oao4QE
X-Received: from plgw17.prod.google.com ([2002:a17:902:e891:b0:23f:fded:852b])
 (user=jyescas job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d506:b0:240:52c8:2556
 with SMTP id d9443c01a7336-24247023afamr130598435ad.39.1754332283728; Mon, 04
 Aug 2025 11:31:23 -0700 (PDT)
Date: Mon,  4 Aug 2025 11:31:21 -0700
In-Reply-To: <67a54f31-e568-427a-8fc8-9791fd34e11b@redhat.com>
Mime-Version: 1.0
References: <67a54f31-e568-427a-8fc8-9791fd34e11b@redhat.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250804183121.2892827-1-jyescas@google.com>
Subject: [RFC PATCH] mm/page_alloc: Add PCP list for THP CMA
From: Juan Yescas <jyescas@google.com>
To: david@redhat.com
Cc: akash.tyagi@mediatek.com, akpm@linux-foundation.org, 
	angelogioacchino.delregno@collabora.com, hannes@cmpxchg.org, 
	jackmanb@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-mm@kvack.org, matthias.bgg@gmail.com, mhocko@suse.com, 
	surenb@google.com, jyescas@google.com, kaleshsingh@google.com, 
	tjmercier@google.com, isaacmanjarres@google.com, vbabka@suse.cz, 
	wsd_upstream@mediatek.com, ziy@nvidia.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_113125_433493_7F235383 
X-CRM114-Status: UNSURE (   8.99  )
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

Hi David/Zi,

Is there any reason why the MIGRATE_CMA pages are not in the PCP lists?

There are many devices that need fast allocation of MIGRATE_CMA pages,
and they have to get them from the buddy allocator, which is a bit
slower in comparison to the PCP lists.

We also have cases where the MIGRATE_CMA memory requirements are big.
For example, GPUs need MIGRATE_CMA memory in the ranges of 30MiB to 500MiBs.
These cases would benefit if we have THPs for CMAs.

Could we add the support for MIGRATE_CMA pages on the PCP and THP lists?

Thanks




