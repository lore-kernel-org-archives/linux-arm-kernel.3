Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8C2C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 16:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGJa78Wq53wOh7pi/p5kq4kFJLRExrNSMcJZ7tCQjOo=; b=eOZnAmojnw7SJ5MGzJWCdt3RtD
	UKu2FVx1x8RC/uPa9mvPBWrKhxiptI0ucvcLueY/hqsJM/kBiY27WIM98BbFBSiObUMu5afuhs2zs
	qOGWh2upUv2pjbuH23IfTJom9mib1mnQJlTNxVW7JSCIUjF2vLPyETNdE0gvEXuIGs7WVvDlLKwjl
	0gUcs6epYJiBGa/xwmCYIgK0j+ljoQC7+wF65SRZSOQyAoGdFi6LwQ4Cie8sv8nG/Fw7xZ1iDOAZ2
	8wM3Yclq5fjjn/dpa9QXD3sWEphBfROQKNAdYcIVvssC/rao7VOdxrDlNJGUYaXulvawK5Kx4y6CJ
	h4c5VSYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDR3s-00000004NPu-0p1W;
	Fri, 09 May 2025 16:59:00 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOiT-00000003whj-20hA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:28:46 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so2163345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 07:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746800924; x=1747405724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGJa78Wq53wOh7pi/p5kq4kFJLRExrNSMcJZ7tCQjOo=;
        b=GHJonGsNVKL50fv3QC5rjYpQCG71u/In6/09+2RmbChHQ+g/DyG0IhBPb+DOxLVzs0
         pi+8VsNgI1LYqf9sHQuOiKxtdFvxB3HgZQEd2HuW01HfnKrfdjpYcfOkdTp6r0RG9pQ9
         lYuhGdBkJLDchUnGTB7klfkaLyhfbqmrUWEzEefSLbia2X0Wc2Jk/Q8QxGJ94GtPePGc
         085Dguek1xQGb8lUP9ub+RHFjd+9hlx3ExtneCNz+v1xDMuM8RFylUfUnWxgjEgFFWmH
         lywbOJLSeZlj5DbqEvPQudbWFvI5QWO5b5VvEbjakJPpUQeSVYBKef7kV4ijowzxpW76
         S8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746800924; x=1747405724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vGJa78Wq53wOh7pi/p5kq4kFJLRExrNSMcJZ7tCQjOo=;
        b=SaCr6jS/lAXiGCbsRXtvxMgePx05rlvyffpddjSyKlQNgrHLHiNtvx4GxCpTZNUjfA
         KJYxaUUe1YazpBWDK9queNPYdDQ7Z4KC378NxzVoCqY1ypsRDoszIbPRCRu7g/sabxtw
         TNlJ6Bw74+hgGyU+8r/KBSHNkInuf7YenMNhmOgiEcBsDXcUIp94KWlFotHazo7FOqX2
         vx2Q8kUhzvyRl/KykAvauYaM2voU8hxUoGDvuaC+YG1JQtYy95uQwbrcwWdyLiF4TM5O
         7Oh+tPYaYsmiaWC5OlTM9zGWLsPjQw1vRQG4WcrUqtqjOAAor7P6MxW3xzsY744lrIDk
         31Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUmSbLoS/18HaftoMaaB5UbuVzxSFA/yPho9EoGhVHXfAhOr3/PccfJPZTz83T6nl80nEVltklturG0YnA+b+Pb@lists.infradead.org
X-Gm-Message-State: AOJu0YyU6m9p3UfWHK3RZPtw7J5OjQPI86y8sIe/z+bkK3LrGOANnc7M
	LCcG1aR5247P0CsgZb1R5/2Z5IYiDLwi/u0fjowWzG/ddMrBiQKC2yWh09AB9bE=
X-Gm-Gg: ASbGncuO+6K8+E4AkDHx4L72tePtomOG07HroJlCQWefdqOMOPRu6ZUrRyW1yINQu9H
	clB/B5ObkUqaid2fZ9CUO2ld9NJZPjiZzXvtwhopH5hoeoF+HMPpH225RSxeq7fdlvcXFPJBnl0
	quPvTsNIBQQqUC0EqbnXFNLlCT7k0rtv6ShxIY0DGZK2rl9rAz37zRJ/kjqd39Wubf2LeMtGJnJ
	atJN/skNx87tQjdLLR2TPf5OMv2etaDJQYgyUS0yQe/vznhAgKdT323meTzcsRuXM5tLK9wZZQI
	38R0VkkPhStigsXE9VfH9B/lSauGe5joeJdWcjkqIYU/Fh6uvA==
X-Google-Smtp-Source: AGHT+IEKYVR9f4KNy2kwsH3spQ+bStFwlfaO9+nceNqCzdyx5f265pzrXCR2cXu644nD++9/3pxs5A==
X-Received: by 2002:a05:600c:1c8f:b0:439:a1c7:7b3a with SMTP id 5b1f17b1804b1-442d6d18d31mr10683505e9.1.1746800923692;
        Fri, 09 May 2025 07:28:43 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ae10sm31255865e9.37.2025.05.09.07.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 07:28:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: qiang.zhao@nxp.com,
	leoyang.li@nxp.com,
	nathan@kernel.org,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Tom Rix <trix@redhat.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] soc: fsl: qe: remove unused qe_ic_from_irq function
Date: Fri,  9 May 2025 16:28:35 +0200
Message-ID: <174680087395.258053.1870729490363422870.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20230320125202.1721775-1-trix@redhat.com>
References: <20230320125202.1721775-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=883; i=krzysztof.kozlowski@linaro.org;
 h=from:subject:message-id; bh=fiZTHDyBdOc6qfmbBDJJ1y69SYbch4R9Dh77RsKvT8o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHhETObKRcExebKUkbIaGQ4dCmp1cl7Z+eKzDU
 2FxOq4jCDyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaB4REwAKCRDBN2bmhouD
 12MFD/wKZlS5qkHWc9CUedyRVM+E7ub1Lod6PaAbk/31coox5iWvBj94XuurnOuKMUXmcfwl7rF
 +zIRQNJFPjPjkwOpJRjTwPg9vWktDjbBwQN5R64ChJnZt8N3aG2g6LGgFE/0YCOfJFzUVg8ZBFt
 62ZO1fWQod3iFD1Zu3PcjmwYvTaf+VjfI3VGUZvNHJaaHLA9OQjxzJ3ntJdV26Nf1yHtEYPWV7/
 FMHZjDxKHK0YbtTSDXeNg490LGK+pTCreHLrmjbYMkw6dz+RlV69hHcqkKzY9cZm/9wZeOs2okZ
 eG7gn/v7oAxxTESLh3rXiggeQ2P33lfAL9XVQz4dnqd+7QERPpUx64aDciyg2L42a2UQea0qA46
 W3XbvX2k9qDz1FM2bo6UNGsIi3SO/6eVgQT/4pP3+EPQcpLXjeIXWFABGWub4gabk4sNNyhzkiX
 XZ2hdozSp+Qf4G1PgSPe8YGgegbvavAT06TMWaZvmBCcIKj8W8u+ozmC6+8KVJAdNs2L8Hq1fOe
 akJTeH9uzGd7Ycd0pjjUh87ndgOeTHaIuDpoVNjEa7Mv7i6pyj8SkcOMi7I8ZyzOzxhPWKh1EIg
 qKU5+wwCNXNv2I9wmnTh6z29IndiEPrwcJQe+IGqjf917f6nKyC1AAWkPXU/nAhTXKZGgHiMUNe D03zhhwT7Or58DQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_072845_520161_1B7B7846 
X-CRM114-Status: UNSURE (   9.38  )
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


On Mon, 20 Mar 2023 08:52:02 -0400, Tom Rix wrote:
> clang with W=1 reports
> drivers/soc/fsl/qe/qe_ic.c:235:29: error: unused function
>   'qe_ic_from_irq' [-Werror,-Wunused-function]
> static inline struct qe_ic *qe_ic_from_irq(unsigned int virq)
>                             ^
> The use of this function was removed with
> commit d7c2878cfcfa ("soc: fsl: qe: remove unused qe_ic_set_* functions")
> 
> [...]


Commit from 2021:
https://lore.kernel.org/all/1619002613-18216-1-git-send-email-jiapeng.chong@linux.alibaba.com/

did not apply, but this applies.

I am annoying hitting this warning on every W=1 build, so:

Applied, thanks!

[1/1] soc: fsl: qe: remove unused qe_ic_from_irq function
      https://git.kernel.org/krzk/linux-dt/c/d47f1233374597c348696c3da2142cc92a36fc90

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

