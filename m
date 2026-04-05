Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4F2E63FFF
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 00:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:In-Reply-To:Message-ID:Cc:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=igv1X0Jh9R3lolDJfbtFzOBAbeGQ8wEXL4Lx+psSqc0=; b=1BHTJewOG+N2dfd3wBu6dUjH9Q
	PR/YrDEqEri/Pk+DfVutJ6X66TC6MImJ+qsDyNl5xNfUBujV1TlqDCrQ6q1qKsvAQeAoyLvLlDTIz
	gXVxRK4y45SnWg5jlE/DdxzMpSW0AxB9OEmaoHTH8C1W+qYE7JGJpa59//i8EbSCcU25WINCWXLGm
	J0jk7fbvZk7aARpzXrbtmOqq88jXidpX6yoXgiQCwPlwBz/RNJ1dQShVKWjelElQO9kslvd38tc+F
	aNqrDEYUlo09WdFyRjppp1zhFDeZL0JWONgCdgLFLltj/djDZZ8ocuGh3Eqb+I/8Kru4QWXVmTXsX
	PMmYpqQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9BpK-00000003rad-13nt;
	Sun, 05 Apr 2026 00:58:58 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9BpH-00000003ra2-2fn6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 00:58:56 +0000
Received: by mail-pj1-x1041.google.com with SMTP id 98e67ed59e1d1-354a18c48b5so2533277a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Apr 2026 17:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775350734; x=1775955534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=igv1X0Jh9R3lolDJfbtFzOBAbeGQ8wEXL4Lx+psSqc0=;
        b=KltLKZ1Xx63TeeuNWAs0yyJ3vahQLtOzuutogfpFvuxEiFK+SQvLCPMVrFeYQAUptH
         ZqGBIRE3SU1Y9oLldwV279tFDnxct576Y5eZjgovlfE+WYRwH8wjLw9vwJ3WhNt6ib1J
         IJFJxxa/ctMFfaY3EaV+jnA6j1M6NecfhhXjwZn93Q/qV0ErVv6uj7KHZXvIVcbrTsL/
         WLvZbuNlBoLQ+Vf6+0zEKcaCsLrl4XTsHOZFKSyObOxRIV0Z39iNe4/VnqFl3cfQOZTU
         zS7LTibLUP38I9g6rV9f52e3Nns+HMNrgWWS3K5+4EO3eVXDGsuGK4kza3CfvT+0UBX1
         abiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775350734; x=1775955534;
        h=content-transfer-encoding:mime-version:subject:in-reply-to
         :message-id:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igv1X0Jh9R3lolDJfbtFzOBAbeGQ8wEXL4Lx+psSqc0=;
        b=CMe9DEyGc8iTPdPf4tWzk4HMz5eIpRpkUSuQihkxh7rjP9ExZTm8GNwbAiqTtTefVq
         f8Z/TJ3ntqL9cbjFwxkdxaJ2FwUyt+/MUE8HBUY8V6R8qtymFWhmOvD8Omd+WiGIKYph
         4J24qd7WogTs9UqiJEmTHcyBOLSqnrGuLwXJZ5XUt+ydcRxTTefkovEu3iUF71q9KIji
         2SKufl2BbHmHa7CGGTOQzPHcgnvstzvQbluHEZxPIYPTxZMOSRlhciMSQZCHAD9S3VLw
         tagvW7dzqMXZUJEbVJ3Vu4NCKkFbRezsD6UPnQ0CCls827KtQ3R2b8gSQux5Widr2pGA
         ZLhw==
X-Forwarded-Encrypted: i=1; AJvYcCV2FsjSEyx4chO9pTNk7zdMdCyNtrc6rrII6TI/rzh9pMF1NbOYtVlIGPzAtu1WjiOIxrX3LKvcK+Zis9XS3ode@lists.infradead.org
X-Gm-Message-State: AOJu0YyBzSv62gkk4WJp/uqOGcHfUZRzeno5UoZoly82tLO84N7Q2ybt
	kooYTuibhxKPPhawSuPGP0KLAH8CYWltjCMojbHytVnxw9ZjVSQc/hSM
X-Gm-Gg: AeBDiesp3qkRryVgmzNAKgsM3OABpADDYnmkQfp9OvDh64VIHP3aLO9iBwC7JIbEL7A
	gleKdLhvhq5cC01w8cfLUwn7V6bVsh5xU3C6UkU3tGZfrygoqnFkzH8ht0biRJ3kck1FtY/XzD0
	hl7Yzogvs51LxMQdEPDPKYfw3KMDAB/qJPTi0zCz+Wd+TqryIIEUf5wnmVjPTa9F2pba+Ez87dL
	M/GXGwcxRHqdz8m/xkb3xv6eTUUjUA1hGO60HiBXewlWMdk9WhfMWLYKLCZwSlki5rYeFq6yO5T
	pLJme2PzNJ1SJaw250FlpLrm0fr+OCNJLwf/YA7PTvn7xp2I/at4LSzye03wu1WHg4cfyrt8QAN
	UW0iJ0e4kswIs/t23Jk63tQj8U6irFKx76J75pluZaew5wvmAmev3Znr4bafRyZCpWZ3Xb/MDiE
	SHInagul2qn7aRq9fZaRjQl0Q=
X-Received: by 2002:a17:90b:3d4d:b0:35b:aca5:db39 with SMTP id 98e67ed59e1d1-35de67ee6bemr7012077a91.9.1775350734065;
        Sat, 04 Apr 2026 17:58:54 -0700 (PDT)
Received: from [127.0.0.1] ([142.91.102.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6860cfbsm2876078a91.6.2026.04.04.17.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2026 17:58:53 -0700 (PDT)
Date: Sun, 5 Apr 2026 08:58:41 +0800
From: zhang <zhangweize9@gmail.com>
To: joonwonkang@google.com
Cc: angelogioacchino.delregno@collabora.com, jassisinghbrar@gmail.com,
	jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org, matthias.bgg@gmail.com,
	stable@vger.kernel.org, thierry.reding@gmail.com
Message-ID: <8710cb76-78e7-4e7f-8be8-0f059b9cb0ac@gmail.com>
In-Reply-To: <20260404124428.3077670-1-joonwonkang@google.com>
Subject: Re: [PATCH v3 1/2] mailbox: Use per-thread completion to fix wrong
 completion order
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Correlation-ID: <8710cb76-78e7-4e7f-8be8-0f059b9cb0ac@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_175855_685854_17016373 
X-CRM114-Status: UNSURE (   6.69  )
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

Hi! Joonwon Kang.

I just looked at the content of your email, and I think we can design a resource priority scheduling system with 70% and 30% priority allocation. The specific idea is as follows:

During task execution, each task can be tagged. Important tasks can be allocated to the 30% of resources, while the remaining 70% can be used to run low-load and repetitive pipeline tasks.

The specific algorithm can be written as follows: reserve 30% of the runtime space for the system's critical processes. For the remaining 70% of non-critical processes, a judgment can be made: if resource usage exceeds 70%, the excess processes are marked with a priority deferred tag and run only when resources are freed up.

-- 

the-essence-of-life

