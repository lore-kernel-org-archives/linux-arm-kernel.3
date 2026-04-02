Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859FFCC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 08:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=elSSYXaQiu0A5lBgM08eBjafoWyayI5FV2gno1nTSlQ=; b=DK/BWf+g6sO1xPdOF1C1LCbh95
	jVfqsEm4CJmE+x8vuxffykAhqSPxKbuqCzczQ4cEZwMUFAl+bUGWat20vmepqKShXn9O5vNn0iHk/
	wdmJZyNRPkB8KDqoKlkioRyvAmenJiA7XoAlXuB33qpfVFY3VKfRC5KXy4a2WT9rQK/lwFuOjSvjr
	4VT81C8hUX6mg2fNvxLDx1QyIbnGsLqvI7kQHO7jmU1Hl1fFYkVrzC1EeSb5eA6S7pa5usSDU+5i1
	M9vpP8UOSFhnmTXxWuXIcBzIJcdYXc/k4kOcqiz8v9tcZFuAudqA5XJaOro9gUQUziT2ScSx+RAvk
	O1gSam3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Dgc-0000000HCYc-20Ry;
	Thu, 02 Apr 2026 08:45:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Dga-0000000HCY4-2tsC
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 08:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=elSSYXaQiu0A5lBgM08eBjafoWyayI5FV2gno1nTSlQ=; b=iksdMgfI/sRVBB2oHgElvrzCyy
	PzN00E5DDSp1JTfz8D4lW4u581dc8YCooUxGj2apabPVbFcgSOGS3cNbErymWNiT5JtVvZxGAT8TD
	oEYZ70tNgnVd4CUpWrCQM4ZzQKhnFkABatjOuzoO66nn0c927FiMOfd9m0VUZcQon0FHVyt0gOAwq
	mj4gqov/XelkCN5ROE+nv3gYcZ0Jwa76LDcJ4NAnq7ENKaSsyvianGV+6KpDLLGDbFz2PbhEeX95s
	Nypc1KCQc28V6BCTZ38kknfs4bRBalwqnwHPDW+vp6Q0yWD3vjASJB2nqBHoA3K687072HLYd7Kom
	Ar5QrdUg==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8DgV-000000023Nw-15w0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 08:45:54 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso8464615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 01:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775119549; x=1775724349; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=elSSYXaQiu0A5lBgM08eBjafoWyayI5FV2gno1nTSlQ=;
        b=XCI0i90CRuheaB85thuG2/miEiFIwM/Majd0uYdIzfgkiVGqXDZlV55S3ayHJYhh33
         L10NpMJFZJt1fTPsXJYePdBB2efHjAdUxhPRg5b3OAUxmw0qbZT4qsJljBtwG+bOS4nI
         mPAYXBdWXHgYqBw1ukbKT7iHBU2+EQCVWTT3Ey0cz2P79ENQNqop4XEEZyyN5ISTz/tn
         0/K3XvHq8F4M8k6zMy+gGjaOLqqi66wOU8LKk7GKMrrKzBQY+IXWIsEO9uh3vVzEv/ri
         Zf/kki86zreBhVuC9+WreD3/JCBaa2biTIFqge8ZibPcAAvTaFP1NS88bQqi9lsBiOPg
         UCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775119549; x=1775724349;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=elSSYXaQiu0A5lBgM08eBjafoWyayI5FV2gno1nTSlQ=;
        b=Ekia/6fAUeyDpnMltWjl2IgtHl0aCFsTOBm7DnO8mWSRL6SAPnrPjYxAzNmBcdw9jT
         EdxopY8iYudzQL8YZmrXlTTE0l29d3xFSaWJA/HgUkDJTxAVLBOFwc9A2FyDWx9BD9D1
         L76Z/sp6KYIinSXt+ojvL11zMxWJ2w6mD8GTVAjWsyrgNxnL4kQXUpEm6G5oOzXY4mmo
         oRUro9JLov7D51xspTtrQhYM0+kZ9AVsZTNR7MMBgayBHHsMfcMjhxTT+pmZ51Weu442
         CmnCY7oRnq/NOcDJ+cQHR1mLUqrCTNcHmew9IcMTU6mJN4vlvSYnPVnHDgTe8Ov8gjOP
         TlcA==
X-Forwarded-Encrypted: i=1; AJvYcCXFjm16mQIwYqGgPrUtrSGiey9RbuPIkUdjycunbV8FwEAj69MzaJLnbgWO5cOnZ6eyg9Xd8yHq0KSx5EmQ4miL@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5Dzmkpc+w/z3XwhT184e9o7ELLDTGGk58pxVjxqjHK8fqk4Mf
	XLjlLgp+h2anyDF5DkvfNps8sYPjoPIMBSwjLnRhW7mkyUgXYz77JmAGk56FW4SaVLY=
X-Gm-Gg: ATEYQzwfHX03IB9MxQytzCH32yeJy93VfInYtYfjPS0Wkvv82mvZa96MeJjvx727Ygb
	chWww0P7JxGWlw4AL8L4c+aTAzJ5SBQwpuwh5F3vDjarGzxSCSSQq9lzStPqndQcOTOYUbhTitn
	InMJF8g3ADiCWXeaubjicxbbWU0QoGulokD1lgJf/67OQre8zkqSboQcJVJtLiqAbtXRJ/75JMO
	tGm3djMR8/p9Q6h39bp3xAGZW1XMvly6yeOpdpqRHp/g05kXvt0RdjIiMfQrN8pv3cD4ur8t6U+
	+cDwYcJlRfOjMRufF6ll4qkveGJxoFGSaQiOFCIzJyhb0vy3MXcuxHgdDVI6GMJt3NW9IeQkiWs
	0WdEWLOSjh7jrEHYp6JEpkuyoJxBfBavOkGGhFd5fvp6YHSFyaMvt+kQXkxL6gvHLvyqKAz/zA9
	LMBxBTtuvo/AC6GvI9D0xGwCQ7LEySJXc=
X-Received: by 2002:a05:600c:8903:b0:485:4533:9c47 with SMTP id 5b1f17b1804b1-48883595155mr86661735e9.22.1775119549263;
        Thu, 02 Apr 2026 01:45:49 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a63c963sm55395375e9.4.2026.04.02.01.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 01:45:49 -0700 (PDT)
Message-ID: <d9c714fa-988c-4b0d-b756-c6e7a40da587@linaro.org>
Date: Thu, 2 Apr 2026 11:45:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Exynos850 APM-to-AP mailbox support
To: Alexey Klimov <alexey.klimov@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_094552_616764_0AEFA025 
X-CRM114-Status: UNSURE (   7.69  )
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

Hi!

On 4/2/26 5:20 AM, Alexey Klimov wrote:
> This patch series introduces support for the APM-to-AP mailbox on the

If AP initiates the communication and APM responds, shouldn't this be called
AP-to-APM mailbox?

Cheers,
ta

