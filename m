Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445EEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 18:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vsSwgqydI0TUTd1LdM/qdllikjjCJsaJszfdOZPreSE=; b=yxj2qoYM9KXYR3ZUS8KdtJ1W/w
	NfAWFRcdFZdhJfLkysDiPnfPsBUTO/Ey6BTOOtJmi9eRoA9M0qHDb5QaK6TZNws594wuleAHmmVH0
	uQdIge6tQIQ7k+38TEST3VqFs5SXDHVssl3QZrQW1DwiaTlFqm6R1mUYl4mj8mPVvqOSRRg/thxup
	RYANE1ad04B7m/ykcndJRhpRTfqpK/47dPR3y0kGAQavR4zYXU+WzDiCQ217bGhnk7Og+Mm036ndO
	TIjxrdU5Uh8I4IVmKHadM2KsXP+1KHPj+6chxW9jSpA7QdboTEhwZVE+0BfGJELZ/+aDhqA7GcRs2
	bNtVqIdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiR0-00000007h3n-2Chw;
	Fri, 03 Jul 2026 18:16:18 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiQy-00000007h3H-2B5b
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 18:16:17 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4728c12ba97so517017f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 11:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783102574; x=1783707374; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vsSwgqydI0TUTd1LdM/qdllikjjCJsaJszfdOZPreSE=;
        b=MA+63PfXHY6yD/8v39vLZDGuR9YasKGBMdNwYtrqfXcC6/BLVOd8iBvcLlo2ckDf3S
         hW26tRm4cGQqitu/xVHrp5f3JTBhIt+zmEz95SLtnFc/GVCEHCuH3ssSZUESuhmuZJ+O
         Q3gEdwyg4wbsE04zmJt5JSPoIa3PyBwCKhG9JK95PDABCLDcD8mVVxp71hNsHV2E+wti
         NCCU6AYfr8LrSGUYp+TxM0MNpnTEsbpnWbsyA+X6RfoXxCz5BhMmRcH234l8nWsMO65o
         zc3WM99O18QSJdgw+1nY/eCeuRlkYvePTKOFLw+N/onw2ftIShWL+N826mOGGJrorVtQ
         tGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783102574; x=1783707374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsSwgqydI0TUTd1LdM/qdllikjjCJsaJszfdOZPreSE=;
        b=criiWtms/ispfu1msG7tznpBCPulDUyQbIv4whPuK1nXVVLq4gWX0WMRKf9wmSMqW2
         459OsVsozewUKXxhyd5LaiwFJr4GXuxLnUHfZoRuHZPVw7G397P5msIzPwqIEqzgWpQZ
         nx+1Bt/qYrGyichxhmEeAeDGLcGJy0DjruPefXR225PS0RQOzuAsiES77KYRs2U7k8n0
         V0nP5r+gzPpWl/BCktflgLbKLChqDlvVOfEWx6cSDj5sDJm10d6Q+ne4s6Y9hQ5dBvUd
         TKz0FGk/v+eCqQuQdvV974qqpQwZgBqpUs5iOMuH4mGEsn/gQioFM2fuEIJ+H3T1NpNk
         g9Og==
X-Forwarded-Encrypted: i=1; AHgh+Rrb5o8Evjfb4aejX/EpliclKi9CXbJ/gIbINlCDBCYJKKv4w2/M3LUffyj/w56hMX5QTx4BPZhjlZ7bYChrTkA4@lists.infradead.org
X-Gm-Message-State: AOJu0YyqwfjtzaQnEys6jq5yE5+i0rQHNdX93j+DEpcBLRaazyaxUKOu
	iMXHx8wNGrenAnZNkutxL+3Xsp4WaEke4Aqe0IvtAiiTlbrFhrmU2HK3
X-Gm-Gg: AfdE7clebZWxy8+kt3kf1Geii/urf/lphj3bL8X2yTnHaD9k2szPUW2TVV0kB3zxEun
	mU0MGd9f9lQAl7tNp613aFddKghuhR6D2QB1jH7mPmbwSKFMSnP+9hH6X7s2+7FCdP3JMLbRv4k
	Vhf7a4GkpH+EfHrsZtCYp5zOqlWB341ysR5D6Dvm0N+Drz6BLsdyDUZFWP8juguj4tGdCyaLPNl
	dAwXxBAQKMC1trihEWJo/IBiX8pk22dbpBCqO0BwpdkByiWj23goCNEd7aTdr0yg91oZ3iDSapK
	+pRokaMWLyL/md7BN/3I/Y+sTQ/G0JwbUMU+OnzQ8cTxK25L3fLseGilVSdOeV+cBVUuT6KYMwY
	UHn0+T6HBWKQ8rwwKv6FiCib2QX9WlcOFSHxhMjQXndaRWEWy0kl+gYyT6N24h6ot/LkglwzEg+
	wrpah/6svfCCOImlR/+pNuJSVytEdZubT0X1I0AELonLhMJi6nEUzVmGx1Pa8K1MsNQZScSmwBT
	tAwqVTh
X-Received: by 2002:adf:f3c8:0:b0:470:a7d8:75f5 with SMTP id ffacd0b85a97d-47aab77041emr390229f8f.42.1783102574577;
        Fri, 03 Jul 2026 11:16:14 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm1195806f8f.3.2026.07.03.11.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 11:16:13 -0700 (PDT)
Message-ID: <92264294-afe8-4752-9f22-2b633373b288@gmail.com>
Date: Fri, 3 Jul 2026 19:16:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 14/15] barrier: add tests for
 smp_cond_load_*_timeout()
To: Ankur Arora <ankur.a.arora@oracle.com>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, bpf@vger.kernel.org
Cc: arnd@arndb.de, catalin.marinas@arm.com, will@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org, mark.rutland@arm.com,
 harisokn@amazon.com, cl@gentwo.org, ast@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, memxor@gmail.com, zhenglifeng1@huawei.com,
 xueshuai@linux.alibaba.com, rdunlap@infradead.org,
 david.laight.linux@gmail.com, broonie@kernel.org, joao.m.martins@oracle.com,
 boris.ostrovsky@oracle.com, konrad.wilk@oracle.com, ashok.bhat@arm.com
References: <20260702013334.140905-1-ankur.a.arora@oracle.com>
 <20260702013334.140905-15-ankur.a.arora@oracle.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260702013334.140905-15-ankur.a.arora@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_111616_568816_844F214D 
X-CRM114-Status: UNSURE (   7.92  )
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

Hi Ankur,

On 7/2/26 02:33, Ankur Arora wrote:
> +config BARRIER_TIMEOUT_TEST
> +	tristate "KUnit tests for smp_cond_load_relaxed_timeout()"
> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  Builds KUnit tests that validate wake-up and timeout handling paths
> +	  in smp_cond_load_relaxed_timeout().
> +
> +	  Say N if you are unsure.

Could you follow the kunit documentation for the kconfig entry:
Documentation/dev-tools/kunit/style.rst

Specifically, these two guidelines:
1. "be named CONFIG_<name>_KUNIT_TEST: where <name> is the name of the
test suite."
2. be visible only if CONFIG_KUNIT_ALL_TESTS is not enabled.

- Julian Braha

