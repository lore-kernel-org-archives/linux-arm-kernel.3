Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D77FCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eh6pXHDb7czykJvkZSECzHtYEJIhB8sIOeQx2+V0+0Q=; b=D/ciqsUzv4cxH7Djwn+zaxneIG
	TajY3d0RUs9qM4GmXt6QSktdlJIQy4vU0SsLIHn9e8uI5gC69vHh3VwDT/zCTPnMR3+UtbN40MxZp
	qzFEdv7or7Gev6C+BBfd4HyJFf9F7gg2Jle46rz2kREzt9y9+93chpQf3uJ4n/acg+IQpiMAKYxa8
	rEHxYPVUE8LNuHOijoWJkwqO6y7b9VJo3o6fyz1kz9HOQ9H+QAxSPqt9/5KuUMndyXfkIs1PHptKG
	rq/Be7f2xWUlst3hCXIuPLHxkQ8eYtax4nYdUiq/0Fz4eWpgIaafVyPQJSQgozO4/DcGVKn3U/HJ2
	MfdQYhlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ8l-0000000HGfb-1q4k;
	Tue, 02 Sep 2025 12:29:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNMv-0000000GOe7-3CI9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:32:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-45b7c5292caso1872545e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 02:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756805520; x=1757410320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eh6pXHDb7czykJvkZSECzHtYEJIhB8sIOeQx2+V0+0Q=;
        b=coDW0u5hHQO/Vhm5+7kd20utQsBIMknzsDwngUqbaH9YTdmUpPWmt7MklmM0iGVjiy
         cHRFNNiQxg5qlSer3P+IHiGHp9BpA2WdWxLnzQSUmrQ29TyY2YdGB48PXh7lzX+umsIN
         q7nflh0bhxc/WghZJ1E/7nNK8Ei4nNP0/PtKkGxMN5pfZIvgXH3E0+YrLiW3U7lBRP+e
         Wl2c6Vve8NUFd0P+GIAg/LedV3zCcJ3lVqAcBhIvoA9BrX8Gi0/CC+RL8OLeHJeSuCVx
         UFhKGEHT5Y5xd8TqWtM18djFw/BrusVcS50uriistp+8ABlwqvHPlotGW1PKMBydklba
         qTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756805520; x=1757410320;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eh6pXHDb7czykJvkZSECzHtYEJIhB8sIOeQx2+V0+0Q=;
        b=r0oHwGAUBZ0MCAP0bX/STa2PedLH2Ua4pZYuredg5/8cvYWKJ7aZ9p02mNY7h4Ksok
         t3UqhNg7Sq8o/Yk6iL7aCuLXCXBtvl5ZlgOm/ZCSy6rHmA4x2940HvUXbDvkDU9HynJv
         jlfis6SyWm0O226fjoa8pFUqNRhgoBncuORd3k/pjh8nwkTfDy5F6iUxwdDIh73onRRc
         BPib8rA8nc96D79aZKKxVKg6M65UL/H9lm2WP3xjHhlHIfn0Pz+sNWKgrAlouplAbAhB
         AIUmsJrWPZHZCq8eeOnnoQCyL7ksqfk33uwc27T0mnShkrFotX68ljN8tijXZPymMr6k
         bUqA==
X-Forwarded-Encrypted: i=1; AJvYcCXkXnH82v90HwfEhas8eHYVD3FTp+Sv3KCHQkpPWhsVRNltOMadFZ2msMW4nu/4vhNlKOGVLFy+f5znn4xJYFuo@lists.infradead.org
X-Gm-Message-State: AOJu0Yza7AL40ezbPCC7gnKsqKvAsR8jsnhphFWm98k56l2B8/IK+CEA
	lcxPl8IQvEc+vIn98+GQvyCpSDXVt3wthd7kYY46fT+ODqmxsqXjlxc4189y7lqhwOU=
X-Gm-Gg: ASbGnctInjpBiGqRXIPcV1/tSz1nXdPDb7DUDWRFAk+TcAG/+3oMFbzZu6WhPlBqOD2
	taKR1BlFFtBBvtY4I/gHjJPKPoPDn/5/7mDnkjTUAbZQtc924LzlrvuLOri26TSSPcUjI1l7luk
	5LUboStSQY/qgtLkfHZ+ilIswTlpBClheCMWU3Ujyrf0FiHIZHGlbVU68nW1J3PBzEWSbKCNHXb
	Sx1HIpr6z7tHRcG+hTaRW8vzNtihW676R1mEbGgRaNLlsPiBD2LUIjWVWa54zu2OFx2Mp+Z6RvR
	Dhllreegxm3kR/t08Syn0KPPQIFhkIna4qKVn7e4s54ZBHHb+riBXfz9/gCdptzIpg8a3y8FmgL
	5Yf7TPxmyPzh0caON2XvYaqOVE7+2Nt7BSsp60xGC7JuQmCgVLQ==
X-Google-Smtp-Source: AGHT+IE5jYdHUbUS3l29jFR/Jwe1LDiKUmJNFIigz6TfN/+SC34Z3RyjNu1csb1trH6mfuj+fpgVhg==
X-Received: by 2002:a05:600c:444f:b0:459:d7c4:9e14 with SMTP id 5b1f17b1804b1-45b800cecd5mr66503255e9.0.1756805520238;
        Tue, 02 Sep 2025 02:32:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b72c55c1bsm281314925e9.10.2025.09.02.02.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:31:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250830113253.131974-2-krzysztof.kozlowski@linaro.org>
References: <20250830113253.131974-2-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: arm: samsung: Drop S3C2416
Message-Id: <175680551873.122080.16462297851841792228.b4-ty@linaro.org>
Date: Tue, 02 Sep 2025 11:31:58 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_023201_806194_A3478FB7 
X-CRM114-Status: UNSURE (   7.95  )
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


On Sat, 30 Aug 2025 13:32:54 +0200, Krzysztof Kozlowski wrote:
> Samsung S3C24xx family of SoCs was removed from the Linux kernel in the
> commit 61b7f8920b17 ("ARM: s3c: remove all s3c24xx support"), in January
> 2023.  There are no in-kernel users of remaining S3C24xx compatibles.
> 
> 

Applied, thanks!

[1/1] dt-bindings: arm: samsung: Drop S3C2416
      https://git.kernel.org/krzk/linux/c/1557c2eb023d9cdf97b4686fd206048c070d4e70

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


