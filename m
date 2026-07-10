Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 222BEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+MWbCokPTStTF6K3o/n9mLY1swhOIwy1qGT/piGGytA=; b=aFfsjsT6beSJZaTcBjCOg59xzb
	gl3Bn9FkEV/VfIfKxPt9KfiqlDVH/DtjCQc0N9HfXuzWZ737TUNR+0eb7JQMIIlS8lhJ9f0mfG82n
	qAYDY+Gu3mGPcJEJMYqd15S3PJnsA4FeZvjk3Im56oCd14UQPrEvVjDyTgyJcxRFUywO2DqFpOw9T
	k7MNFcEqeYiRkbhT4J4K0Z9wzhvv9plFWGRNw6vd0L2h1b6qAPEQDfw2Kyx13jTVI3R/ercxroHZT
	Dlqq6fECVlqDsIBi0MmL7Tvh86n+AM7Kzy/H0gvhRMNXOJqgi1dXT3J7n23KcgE/4dC1Q1VAzlx+9
	e8PpnsGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8LX-00000004gd9-2bGr;
	Fri, 10 Jul 2026 10:20:39 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8LV-00000004gcn-0N9j
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 10:20:38 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2cad4170e8eso8057805ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 03:20:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783678836; cv=none;
        d=google.com; s=arc-20260327;
        b=KBUv5abPF1IdhrYFTdZX5IpEGlTdZS6RpJjrS1wJcJklnoieCr0NUKW3KZ0ow8YkwL
         UUZAHwREll4M769E59lEBfiVazRIYS7jpC28mupkBySkJpg9YFuhVYJzgLH3s9zXnHKB
         IAm7aQj5imTs/GaqhGZWh6Z3MTG1t7uLD7RlfTLIjJfaGP03oIpq7HaM0OYR/ImWxbH7
         lyULbYM87JwUSmEM69QYURmvim4EwDDBvyuCwU95l3CJibBbKPIekRSiJ6Y4jTxWydEt
         jYB8AIXNsupxpSWxHiHWHgalOC4/Jmsjl0WDJuR/Up669BFTnWr+a0Lmet2BsjoEOuMS
         CPPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+MWbCokPTStTF6K3o/n9mLY1swhOIwy1qGT/piGGytA=;
        fh=e6rXi0l+WFnW9g+KZpAX+T51xrUchWm7CDWu7v6i3uM=;
        b=UWSPROeWaAEb9WNI+r+iEOf53YdL7VvTk3GJpLC3rLCEIaJfuMOEHksa+VHUeL0vu0
         1NhEmCdKMXBrRob8wYirujPuDfwlTD/+FEa5ZXTfna54JLavuSi4+9pY378VexhgfHea
         sAXJljUfsy1s48XeW1lvuNZC9eAhVBFJlYQqDPI6YWla9CSjj3/a4h4tkxSBtCWub/sn
         4nYmwD0Eqg+0ODq5qvB5DQsK3ISMxtpLxj1L0sWCucBboPiwzwvVPP2WVB97bfO9uxvI
         FRohlEDi5KoOQ2RcikPOoCCrN+kEr4TXzMN4CvBJoYrE058F9NncIAjkK6thcdxCKCfF
         Fxsg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783678836; x=1784283636; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MWbCokPTStTF6K3o/n9mLY1swhOIwy1qGT/piGGytA=;
        b=Suk8leY5H2m3UXCvuc7cqaGelgekrz+qC18bR2Cl145kuYJmnj1onBfnmM5ZW30Tqu
         zK7F37bJjtSDkkSnlXSu6bU8B8mOdQhFcP+seCQOVdzM2dI/qa0iaOnx0HqOcbVmF8rz
         i3LTP5vNU5jPi6LrZeeN7/m52VB9JU8/v3+OF2Fqy3wEx1PMysXTVhlds7FtzUOfthtd
         yY4kO2rUTjlEvPf5T8PhtGDcYBnDyg2PyjZvpl2l7HixkHu0jx1NI9YAtNsfHfOgn5/Z
         7yNbFhgpS0tbG7mQw/ZweH2/M5BjuvRoZkcYRaKmj+QLr3on5C5JPXfZJkTKawEvHOEm
         cA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678836; x=1784283636;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+MWbCokPTStTF6K3o/n9mLY1swhOIwy1qGT/piGGytA=;
        b=W+oyhFIuuNe2lcyPh8XkEMCP7RfoG08GpU+9MWwEmIYnQqsVSKd01Wt50VsDDWajZm
         N9odcKuEWWbbvYCyxZZ6Q1q6a+BTLVUEQuqyfvr6LwBaTUld0sWhbbRkLYYX17ux7EOO
         gvhIjo9rot6EvHHIzrcBe/sXHGox64dn9GAVjHuhiz8Kbylj7Emo5JsF1IVWHlZyOsLE
         J3h0aqylR9eu7NeBbRL4OuLC1czhJY3+5xxpi8KnjpjMBUBklaz2oD6hGqQho6x9I5Kj
         isMbqXFlsWm3J2JZ0+U8deMO96x6KlskoqiSe9NU5zzovhthgFcCHmMN7tPUMmmcZIky
         emYw==
X-Forwarded-Encrypted: i=1; AHgh+RqC3116rDIJ/xXLqxtpIO5fuqsJB7KZZnJBl47f673/HQswl8TybIvfUFxXHpFT38TsWK5bQKBCKyDrg70Y021k@lists.infradead.org
X-Gm-Message-State: AOJu0YzPJGqjyx3lpWMTl6urkzH4H7VWnmJE36CGMJyjbL15kHkP57d4
	sVLOMa8wEy6awOWO+8OGkLf50pHGJrD09yHXDSYYIp3Fv9XNtK42XU9L1gZbWlCJ/YCOEZONY7z
	MIMuW4JYZvLl4JrKrqmM28fg2hCjsBMI=
X-Gm-Gg: AfdE7cm8Z000dOd+RK/lIHmaj353lXUHsG/LvCGhGkisA3py+uOAoN7DqzxSZb/7Wdm
	w854/Ow0PwPkMsQSsqFQ4fuTBeISxEdWHsBLdDdP6PY8CcP0ZjxTlKlAtlvuior4WyVKf8OBu4l
	M79O1V9Ty5fvQYT+Wk0z3nqRZEr0LgjeGxvdC4fj/Iy6IxXFIgYyZEGbNGvhyRGqndaRK7kPW56
	hO7lGKRyK0e7quaxb22/vXkJi21KSmyM6tHOUKs+5T04WlLLCCzKinPCMEWY5P2aNirMTCLFQWj
	MEm0kDxH7ba6HnQQIH1+iAWyHqQ=
X-Received: by 2002:a17:902:d2c9:b0:2ca:bba:b35c with SMTP id
 d9443c01a7336-2ccea464ea7mr120043665ad.31.1783678836086; Fri, 10 Jul 2026
 03:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260710050223.14266-1-phucduc.bui@gmail.com> <20260710050223.14266-3-phucduc.bui@gmail.com>
 <a84c3eb1-7ac5-44a8-95cb-e33175e78ee9@amd.com> <CAABR9nFFMMk6i_sjKGjt4t-_QZF_hu2gBPRNK8c-GfhyKdVP8A@mail.gmail.com>
 <da6e74cd-05d7-4ba8-aa75-e186ed8a49cf@amd.com>
In-Reply-To: <da6e74cd-05d7-4ba8-aa75-e186ed8a49cf@amd.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 10 Jul 2026 17:20:24 +0700
X-Gm-Features: AVVi8CdxCM56PJDr2W__GlgaLeg2BqVlA5pLfATLqiG_GVjxauf9_BTAOmIf3Us
Message-ID: <CAABR9nFjjen2KaxnC7tt+Ud4O1_gm6WUSEj-=aQzS3KHPVaDyQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_spdif: Use dev_err_probe() and
 drop redundant error handling
To: Michal Simek <michal.simek@amd.com>
Cc: Vincenzo Frascino <vincenzo.frascino@arm.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_032037_131803_65A2A3EA 
X-CRM114-Status: GOOD (  11.83  )
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

Hi Michal,

Thanks for the clarification.

>
> I am not saying it is wrong. I am just saying that it should be likely handled
> as separate change/patch to address this issue.
>

I'll split it into a separate patch and send a v2 shortly.

Best regards,
Phuc

