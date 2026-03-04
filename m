Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7D2EDEC03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 04:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDBrUhFaFc7wQVcSeZc1Bi9PtbigcT50WYnul0mkrvw=; b=oOV1lq6gyfL5R/Og5HpejAHEhU
	XATzmc2oRp8VyX+3HngkS0RVd+4VqcqFOG9ug9/VSsWV0eizSlhIEfcHR/VyXpEt2xM08vKFqhYFK
	5jgHw1iNqOXktwBEpNTNt8JiikvWJeiq7I/eoZ6fEX3jg1Ai1T8l27k5CjJKWOwLVmPLAgqGJW7QR
	XLPPubHnMA/OceipfO/bIWF7m9dWFzkERwDYchY02f9yM1YfGVWy+GTCIXH7h4FnC7I5a4wQH/0bf
	dEIsAz2ZHYihOlCuzyN8omOUUGpngvGNGJ+jZw3nPYCSt4GPQq+WKvIzWSYal8TC/5Fzt+zQQQf0q
	jqXOSWfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxeKQ-0000000GSUi-2NUQ;
	Wed, 04 Mar 2026 04:59:22 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxeKO-0000000GSUM-2DSv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 04:59:21 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-2be19f05d7dso4637895eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 20:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772600359; x=1773205159; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EDBrUhFaFc7wQVcSeZc1Bi9PtbigcT50WYnul0mkrvw=;
        b=iGKs9L5Pt0g4XGBlNCf20RBWiHuAVEc4xs82acw/RSMKaKmAPZTnHtAFR2od68Q9Q5
         suIhETAvYGCBy8x1QMPgRPouqxMtFycpcV1oBBvKdMTnIslpu2xuPzeYopM/8Bcc4dSm
         ql0T0Y7XTzIvMVuA+S2bzWvFk/5OQTSr2W18rH4s6lGRUwCO5H/FG3829LLBq77j48x7
         s1uaERFs37dPEnKoiLCg8lBgSXnVc5aPtmnQaMLwizeWGLSb07o/XumF58EZ3mxsORgQ
         QQOW5mP+00sU6kBmc63+YteyWmrBFqxmjER5OZaRm8fLL3llAqcvstXH4/s+zlvn+36B
         +7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772600359; x=1773205159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDBrUhFaFc7wQVcSeZc1Bi9PtbigcT50WYnul0mkrvw=;
        b=bKPiM8eJHTFN2+M6LOqNXfb4gB6ZfgPeXaGvziDHQCTZn1gfTCCMMFjMVNT7BYnAjV
         cxu/RtiGi4tg2hcd5nLwXpT2o0fUGxxmfKoSAPOh6XpHcF3LUlt019Z2W8vv7kuCsvCl
         BovbX6OI1drCJ5K4bPRzZ3is6jXr8H+oxIFQWDbvWMBX/GIseGLArGaM49mAKptoA30v
         000ujb+9BmcEmuUXjILjp02ZMzWiCeCfl6wrDN3PjjvV6p5NQW7wXFM3svs7hhmvWRy2
         6zQ78JGLLxuT2+hu9Rdduyxl/IkRc8SmNjnSbnYQwKi3U0I29u0OIwwMcxVczVgcTCx5
         jYzg==
X-Forwarded-Encrypted: i=1; AJvYcCWQgA6Lt1Fs1vZQnXg2kQpcm2oF5Hu8UheB7MLRMNl+EiCUAy+tEu5FQO6V3RoowmpADgRLKM5GRN1j3ctLA5B2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi+QS+r8X/Wa1EpKVkYRF05bx6/XwpPcKdJHSc92Z15eZp88WK
	wazKUHXq6TkAOUxX/17PCS8pomc+h4YMIbJV6N5IiFCsNpRIzABYUCKC
X-Gm-Gg: ATEYQzzbU/JFlZO/S8X9mIl19hwQ6M0o5mtju2s9zhtwkx4p8S5dkOYIM3ass2fcH3v
	kV+JSq/T8gEH/fHafmCZzq0jomF6eAtCvqBiNo80UD4GntrcJBCLO+FC5BRazlHCESMmWJ0oGwW
	mwGu/oaB+yhQ43p+rHbX5l09m1Hn+Bpw6lYCTt1zg40L4QkKtH8hz3UsKKGeZhzCH0/mdlXYkN5
	wm9csoCs+D/5nCARrA+4KOEwD8grIKkHTFIuL76szUGxWfCHY7fXZMzp/pVLmdMHi41sZ6Ul3QR
	sOGtnRIW9hbUuwJgoxkReoxO7E4TyNErZ00hohUZus6dGrkgwdZ080+K4+W0zdY7XUmWdZTVR+i
	AjM8/A010wHyTPzmtVPmgnVKieRohUlrjWcW9Bi6Nb1Wo31+YDmeQcz504SMTalzYH1D+iGLuaf
	Fii3/dC1dWceAejsHwtFmOTRZ98ONR2fRz4yUcM+D1xFPCoQ9RYeq7xu7cJWEnJpus
X-Received: by 2002:a05:7300:a887:b0:2bd:b961:7e8b with SMTP id 5a478bee46e88-2be310975famr422928eec.24.1772600358821;
        Tue, 03 Mar 2026 20:59:18 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:a048:d9ec:d217:7d59])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be1ce921dasm3981312eec.10.2026.03.03.20.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 20:59:18 -0800 (PST)
Date: Tue, 3 Mar 2026 20:59:15 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 03/10] Input: stmfts - abstract reading information from
 the firmware
Message-ID: <aae7zuSkAgNaciUK@google.com>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-3-22c458b9ac68@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-stmfts5-v1-3-22c458b9ac68@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_205920_574109_D86D6489 
X-CRM114-Status: UNSURE (   9.83  )
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

On Sun, Mar 01, 2026 at 06:51:17PM +0100, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Improves readability and makes splitting power on function in following
> commit easier.
> ---

Missing signed-off-by...

Thanks.

-- 
Dmitry

