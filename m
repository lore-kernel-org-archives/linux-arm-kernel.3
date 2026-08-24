Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D585C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 03:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vn5Grfq8EKmTmGxngrxWU6AOn5Yz/bW9/raAibSSbKY=; b=iBiYyfqOLkW/vJJea3c2lg4J00
	/eDy2hrHYtKkfZ0Ib/5tmGetvUvlPS+xIi/VlQbu7H31svB3ofFjX46Kwx0kMO34hIvbUIv7v79hc
	GC6LjfR1F4r1VwF37e4+dm5wQRZLvw/Msr4Gs+DlpUboECXme+j6v6CknybroDqqZRnYNsLFsINd1
	nI8kLq2UcWZaPkDTHTOSdtQn04Lk1VuODxlPj6wdUndXOUe3Faapnzm+TjYEj23tLrmJT0cKV0PSB
	jFRHSAh/S1t3VOS3rmvI2spQgCcwAiEn65Mih+XFbxYFHRXRKPFRFt6g7GsGLTNsiGROgJSApoECK
	Uc93RJIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyLKx-0000000FrXK-2Dyl;
	Mon, 24 Aug 2026 03:27:03 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyLKv-0000000FrWd-0htK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 03:27:02 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-84a652535dcso1599175b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 20:27:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787542020; cv=none;
        d=google.com; s=arc-20260327;
        b=RDfc3tP4P1CrpAQxsiCoYCrzuCkQJOTAH8GloYVTYCSrq7e5Fr/rledU6mC3T25isq
         KsEhAvh0hCcLJGziEP553DbpNEqGhyFVO+RNMkjEZv3en6X7ZBtyXta6QH4ZcFk5ZJQL
         Uss6QBO7HyXlXk0gXH3EH5q+saYPmKCGVqcix/zv1YnKDo1wWvG+emAJDvXyJE/68zM+
         X8obx1cKfxn3bdCJki/Jb7AuqpWdb75qL0bxhYNJ/lwYDrwpndV5myDOsNHfR2tp9hnK
         uD2I4mfVkXmf7AVNT1ugqOKhtrzFZjjkX0tIgXyUvYMm3YsqW6CME+zPH9W6QLv/+5WQ
         +jkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Vn5Grfq8EKmTmGxngrxWU6AOn5Yz/bW9/raAibSSbKY=;
        fh=emyLYTQypQi+1DLkmknSD4/T7IMyC/vRYMoRvPgTUGc=;
        b=TNJhs8Iq7pu+BgyJe99BgqRRpWbe1ATWEF69NlDxhg2HK+TjQPUwDhtMeJvocCiUJI
         Xrck0MXYJSiRltr/XE0Ay+jGJpN/q9Q0Aanm8tTt/PTDJiVPE2vQgdRwd3Pa8mhFMMDE
         vAPLdWx1ODDFVkGmVmeYEWwJYKLc3DNqb+DetSLFyhly2Ci8T095QOXfjB5F55YbX9eI
         2SF4WM/YsRWSFV6DoeyEWB15gFm9aHKBCxm/g9vtx8oJnk4gv4OZ/plFHbcd8RBxPOlH
         hyC7sW3ZdlkMkpyHIW1uWzNnovP40fIoximRaiKGMtXzYXoJzallZiKg+bT9sovEl8tZ
         s1Dw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787542020; x=1788146820; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vn5Grfq8EKmTmGxngrxWU6AOn5Yz/bW9/raAibSSbKY=;
        b=eD44r7ZFEXvYfTmsXpFaVzNVSwIOKF9SRLW+9sg0orVUBE/U1476+DHEuKj/G7+MwX
         QYjSIyDcTMaQZKAqqX7gAvAWnqADuwEYjPCCkiHhqV6AMKO6RMxHZgYLnc6KXafIe5IP
         8Js1/JvK/V4Ws3y7nP/ThmuDjK3LrXd+X5N7l8q8rdVyeLndZ+84Zq1WIYkLFuHlxlL3
         agg1sta7ST1r191rWCRNCdG9aJnISVP1mF1yUqBPzQ/Cvc2ntDgK6RvtkoegUaR1Efwd
         N+5Y4mUHCLVtmUAD4aHy3hCUXjX4TKehwP+CoIEG9dxR78ypA9xOKy904F1RV6BFTP3Z
         TexA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787542020; x=1788146820;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vn5Grfq8EKmTmGxngrxWU6AOn5Yz/bW9/raAibSSbKY=;
        b=jfqhVsWr+YF654iHbx5uuw8XO0cSgu4bPeMM9qCeKV0bVhBuHuTFkVzs100S8oCpvp
         DRhqI2xWEJiOU7d8T+PZWYL4MCusppND3kOOlxKqWhJjL/0OLqWlLo+nOaN7ss4MYVRm
         fC2sDwYo/9FHW0fsR9Q8gUBT9qff53QIqUsHZI7+rhqe3wb1UMVcyGik9yTpsDCsj/4l
         yZ21F1Kf9ow1NVjKYCzCFG6wq+uOabBki3OexqvkVqPekrmlPSFlz4rRV/N0K0BQG4Uu
         A6Ng+OTbBMfoMzGf8ssgXTZq3ZWWHqnZNjUI+c0UsbQ/7XUiRv36IpoydXTPzzX1kmgX
         qDvA==
X-Forwarded-Encrypted: i=1; AHgh+Rq03uqONeUUUEUUN1y6Ih+e6bOkAMj/wG3/c1tyjsOZPKDZN+igp5ext1EXgi6rA5ar1RQOCuOQwRgUT2HAYwsa@lists.infradead.org
X-Gm-Message-State: AFuF++lIVjxV7hMuoBGwttfdVfV/zFqaGU34TPGx0bbFOqFSF9GqMQox
	GuL/AcMZYDbN0zrqNVJsy+eHX1Y85VilXokrVj7zibb0kueZf3wFSDvaYcqDXMaeXxUEG5DYUEx
	BwO1Gbj3iC2j8W2jYGjPBWmxHV6iBOEI=
X-Gm-Gg: AR+sD11zdMEjjq4bkjfiIzaSyA25A9qMYv3Z0bO+UIggayhLBHdziTeyaafXq9XRlzw
	4AO7KBAbEA4uqwzGH4Vtm4bnxbs6HuL1Y3o8/fDi8Fjc6tn1GIMr39fWiCDJc8WEbbY9S/HVZmt
	tnBW9cWbqNqKpptb1RtZJR/1d9jsvGgvZgkmGJ8Nhs+A1MLvvYAaaOHfOWbOUIG/meiip6pzPtQ
	U/Q0i3lVE+Vs/0APjsaQ+wFHqg0YBPxocoGqPcyt/re+MxYB2blCSOhJ651KZZeK5qJAg+Vmihf
	uq3+YA0FKe18DwT3gA/LEaOKiXPw9HuyJBavEFQ3w6A54zWpOIaTQLC7b7p2RC0wneEG2yNBJ/N
	ZyBMwW9d5OTklsqEKM6uc96mFpVFCVGomIJWrxjzX/qT7gS5LtWaftAtzFTA4J/Fvt4E=
X-Received: by 2002:a05:6a00:3690:b0:84f:d7e4:3404 with SMTP id
 d2e1a72fcca58-8520be6fd22mr25781730b3a.11.1787542019751; Sun, 23 Aug 2026
 20:26:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260821123249.41527-1-phucduc.bui@gmail.com> <20260821123249.41527-4-phucduc.bui@gmail.com>
 <e225c560-eae8-4487-be66-f624e5e215ee@amd.com> <CAABR9nHwTFFGVS3Y0MXsBx2ubtexaZ6hqcZYQ5au1UjxEjb+qQ@mail.gmail.com>
In-Reply-To: <CAABR9nHwTFFGVS3Y0MXsBx2ubtexaZ6hqcZYQ5au1UjxEjb+qQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 24 Aug 2026 10:26:48 +0700
X-Gm-Features: AcwNN1VJLv--eX-5_gqjLRJ9ip4awutmgtchqsVq-gwKiv10BUXsapFpjJ8kMAI
Message-ID: <CAABR9nFqr38hmWtKnFyNNAPUoKoWQA=33tS9crNLyO+tUMVFtQ@mail.gmail.com>
Subject: Re: [PATCH net v4 3/3] net: xilinx: axienet: Fix IRQ error handling
To: "Gupta, Suraj" <suraj.gupta2@amd.com>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Michal Simek <michal.simek@amd.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_202701_241579_EFA7B7F7 
X-CRM114-Status: GOOD (  13.56  )
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

Hi Paolo,  Radhey, Gupta.

> >
> > ENOMEM is a slightly misleading errno for "IRQ not found" on the OF path
> > -EINVAL/-ENXIO would be more accurate. Since we are here, better to
> > correct that also.
> >
>
> Thanks for pointing this out. I agree that -ENOMEM is misleading here.
> I'll address this separately.
>

I initially planned to make a separate series for fixing the returned
error codes,
but I think it is better to include those changes in this series.

I would also like to withdraw this series from net and resend it to
net-next after August 31.
Since there have been no reported issues and these were found through
code review,
I think net-next is more appropriate.

Best regards,
Phuc

