Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F33C02197
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 07:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8ws3eogQ75UF4XPAfpmrJb1OdBIIOKRn93Q6XsSWXQ=; b=RjE6vsF/ma0wVT568JCNG4pQxL
	w1hZHkWY150IBWIp/y8yEdMAHLNUqs+uQwFbYMHGjbDmtrx8xntwpYX3n1NzvXy65mkKwGEasYtc8
	cDHlaZo0+jivBcZ/1LU0LYSWCli6kyf4l6fXK/+blKOi9lqJt9lbAhIfE7oKgPGlwZejAN3LlMp4+
	OQyw1Ava967sEhblIs4XsIAiR1iZRS02myfsp/zrQ4VAq3/2VXeofaqHCw/4M+Z61JWGxb/Mtgow3
	4z49Af+xbskYnzRlo43+hmDUNLRBkAidF3fiGaAlLVGvC9r9IabW9Kj7ZJhPzdrJSCadhSu5U6/HA
	l5mw0Ovw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZPk-00000002THM-2m9Z;
	Wed, 05 Feb 2025 07:01:36 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfZON-00000002T44-1j6M
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 07:00:12 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21f200014f1so1232535ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 23:00:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738738810; x=1739343610; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+8ws3eogQ75UF4XPAfpmrJb1OdBIIOKRn93Q6XsSWXQ=;
        b=va0Q9HNsX3gl+akZ5T0aDuRDLWeeVnIL7GtJt9ZLTEW4mkvr56an7K6xrTmMCjKg3e
         0fgRlAY5uQfOvQP6KUdA93OelglUnv/TouTqaD4uu52WadmPdhsPF9OCsEjtcxmU2vZL
         jsbQHOkmGNRhOMcRlPCEbP1T3AENjsh2e5g5933umBLWXehPHcgaxOm935KD7yjZchL0
         pSBhBrCsrzBDJfpHvSq+SbFIrYenzD8EpfPCcDeBMNfAGjex2T9eqEMCNSwByFczn2Pk
         RLgr1xrTlpodsJdwR9YKy+xVcDjOmZ6HbuGhYw40QrgxKHCwA317JBoK5LiOUpKomsx0
         4Urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738738810; x=1739343610;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8ws3eogQ75UF4XPAfpmrJb1OdBIIOKRn93Q6XsSWXQ=;
        b=KyzjNDed8Tu69gV33JMPXJQBmzuUS8e0ahC2FwMZF2BVQQxWql8pZuVX9nVWMu7Yt7
         qevh/2qV9MjBj81fMoDRDFAN21g4t6wZUewmDVLjOp/RTleTy0Bu1wZ3KFhX8u/uiwh0
         F4G/JKuOte0rMYcWznsxwCvP6QAiLyNwbaUtwUftsrWK1/elnX6lHGTUsmEv7uDGpUKI
         KK9kcBLkNMCSFz56XWiUIsO4qN9KA3o/QXaKYOyYQgrOXn5dVaIbqiZ736uuDmPurnVH
         7htpJOuP8paIqDuFv+nrglGZQ0GbdPFHCiRigr0lDnEXZ7j8aiqkELMUum7wpEplnVl5
         8v0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtcU/QUVPgdxt9WS6nsNdjIGmQQITisAW2Thfyn4famv66CKs9IM6bu0+fDVPbNyR3khsOkVhaoXA7lJLYU4He@lists.infradead.org
X-Gm-Message-State: AOJu0YwR09cS2KtWiV59cHm3uA3fc6THRHqb7vuBizWRY3BG3Y/vy7hZ
	/e4FmMi83Hcbo8N8J2c0Tf3ek4J1WoY4oUgs/u9cpKSvX8nnPxK1tznTNQDBxbg=
X-Gm-Gg: ASbGnctbZLcDnoAcgp68c6Zky7hfHWjIZjDutXJzzvNfzgDEUzFsirmWtcqS90KxDQu
	0B7xe32ej2bx61bodheDoNbfb3Tn9YkhWBgjOT9B3tjdRZMfRRZCSR1QEpBGnFAXy6wYD1jsR2Z
	k//uXWKSlfwq02OgQEFwuS8sOMN0j5JYeCctQGtS8IrE2bqcqYSp8cx3Bhfzs0xenJdLFvitIfV
	sMPPnTU4jAP3QRMLuNh6eQz/E7ugA3I7xthcrDd79ODUFRDSGLPQpqar1k6ZyRt1z9mErSCOHlT
	5FNcfy3hnqnH4jKKaA==
X-Google-Smtp-Source: AGHT+IFcBfowwoWBH0FBPbI4cZlw9NudpkT74gZC6XMMWGu1ebXPwbrRqUXqsIP4PMl1f/5/sfi3NQ==
X-Received: by 2002:a05:6300:668a:b0:1e1:94ee:c37a with SMTP id adf61e73a8af0-1ede883b7b3mr3096336637.15.1738738810041;
        Tue, 04 Feb 2025 23:00:10 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba380sm11638732b3a.118.2025.02.04.23.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 23:00:09 -0800 (PST)
Date: Wed, 5 Feb 2025 12:30:06 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Beata Michalska <beata.michalska@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, ionela.voinescu@arm.com,
	sudeep.holla@arm.com, will@kernel.org, catalin.marinas@arm.com,
	rafael@kernel.org, sumitg@nvidia.com, yang@os.amperecomputing.com,
	vanshikonda@os.amperecomputing.com, lihuisong@huawei.com,
	zhanjie9@hisilicon.com, ptsm@linux.microsoft.com
Subject: Re: [PATCH v10 1/4] cpufreq: Allow arch_freq_get_on_cpu to return an
 error
Message-ID: <20250205070006.zpslntq6nwo73o4u@vireshk-i7>
References: <20250131162439.3843071-1-beata.michalska@arm.com>
 <20250131162439.3843071-2-beata.michalska@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250131162439.3843071-2-beata.michalska@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_230011_462784_6C22FDED 
X-CRM114-Status: UNSURE (   9.94  )
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

On 31-01-25, 16:24, Beata Michalska wrote:
> Allow arch_freq_get_on_cpu to return an error for cases when retrieving
> current CPU frequency is not possible, whether that being due to lack of
> required arch support or due to other circumstances when the current
> frequency cannot be determined at given point of time.
> 
> Signed-off-by: Beata Michalska <beata.michalska@arm.com>
> Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

