Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5CFCA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 04:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efFkaQFetsAOpWM7VNvA0yYFgrxZuGTjrhnbsOnuNRI=; b=gZO3qz/5w04SxsiMq5aiQ52Irz
	8gQidpZNairu7QtZSNJ3AcMVk896ZnHKT4Fg4i+XSQVbD7Y5sh0QEn2TWG25GTtxLa3X/QX6w3iyh
	OhogDh9CkjdDrATCyndB7tq8M2uiRFsEEKMkYyxnpSRolrEEZwkRwo+/zGJHy8yB3FYOxkK3eLHZ/
	HejfL/FCLB4/+6DLCrTfOHIaZS6IogHyG0CSvKqrWte8WqIGSBJVa/7xWAAhvru/pMRHxej12FyIp
	GLr3+pjTqioX3H5XtWrvXkyZdHzZ30wfBYNC/f5csWmjQ3H1W9Q5NDrIOLvcgiQMsY1HGGCY7NEu3
	tBdO6K8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG7Vc-00000009dfR-0Kns;
	Mon, 12 Oct 2026 04:19:32 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG7VZ-00000009dem-2cek
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 04:19:31 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-353804b591eso2511200eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 21:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791778768; x=1792383568; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=efFkaQFetsAOpWM7VNvA0yYFgrxZuGTjrhnbsOnuNRI=;
        b=jUBO3N9uH0yWW2bO2Dpo8Vi7h/BJQHKkLOys9R+dWodUHMybEd050cSNlcXS8eWsQk
         bvZWihsyCVXp4iCEudIh4kZBbXC8U1Nz03vjRFEuEsMMPsoXgL4dLLBpZ9VEQviR3yOL
         C46la7FVPXJ+COYZ9QD5i74xNvZZuC3Ba56ps8yzm+yP1pMNxAvUG4s9IuYZT6BfqeEz
         zJR68s5uXXsKsAdShSVRoKMbdzXe0WzkeRcR/GOGASjjlH1OAMHwdmqy5QbK36531Cty
         Dk6gFA49QDJbd0J0Vp/+F0k/lRd/E2+K0CspsTPXF8XfqGWQH6/FlOcxQNLnuiGjwBdB
         YAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791778768; x=1792383568;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=efFkaQFetsAOpWM7VNvA0yYFgrxZuGTjrhnbsOnuNRI=;
        b=uBfS6RffwLwpVttoJjsW4pNubNXybugv0isJuPG+m70uocN4zATZzgBg/4nJCfpNVb
         7cejdeLNATbIHxypOjzQRx6GOn802obEC5xOc2n7UhVEkVAwTaB9PyaapElNIL+GV+0s
         dXIk/iAlqzaKeqXghcCk+aAXQOFLZVR3mYGDALhDJNRBQA29lxhNd9QOa1qmlS2cTFeD
         GE19CY4yv4yLALQbiEebFO5mX8grhCuSn5jDtZIYVTeLWhsojKPa6RkIINhLkx0CdZkG
         nIaO7Xl4X/BEgf0k89u3kJkXZcAQhD/xHPnFIZVCxiwdCdHVHIRt8tTjQ44RSAPtJqEw
         ALNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzp1TmWb0T1dBEH8gXbGQQVUu++3NMilHGyDj4eaX6pIa6oYszkpkGoUAZp/bN/PO810ZnsugYJb2WVyNiumKKQ@lists.infradead.org
X-Gm-Message-State: AFq9FYJxhtmnd8Pg62gLhk40xDalT2pqxsaC7jRJN28+7d6gkk0+lqzl
	SJJJn/IS0z7sBFgJJgDJq8aV8H+lmtM+01Ng6kyKpu3ClNe9LP+I1Tf47zdXpPvs17E=
X-Gm-Gg: AYBFou3JHVrzZympxu7Rm50TAWKNbbDUOpWg5E7OWJZbeqUMePzl0wbnA09e0wo8Fg4
	UcKcxwQeMFpqXiK8CebTBXmCcMJmWZof8j85yN5hyzkKB1T5bAt4ITv8HmJBmaqvBuafFXrJNSp
	ospMUtt4gqaIyVfEwLF3NYBVvwqJQJO8+fqm0sbDotHmWzy228QDnHOz9X6aGNJmp4zB9Va53hg
	R4KAvESZa6s6KxRokFKTQYq9tinE9wVD/Cj8cLaEZmioE1yGV430w7fQ6Fh6cz53qQOIGuh10Bk
	4uB3r1ve5M2w2TwBtWE0aXveqxTbrbkbNw3l1od79wh1jeRKOEWVAgUeY9JZcz53M/OPpobWTKI
	bz66O+AtwBiezOWROXVJ9LfaLpfZKTD/8eHKYYPD7ymDPxW0MmVUzghdPqUeoyH+uK8ZAePHOZN
	pWdWz7o9d8v+uUFzDLZ/30aJqzXyvris4NJlwJLVeLLV8G6GJpqcCI1p8Y5+CpUHYQv6MuZI6V
X-Received: by 2002:a05:7023:a47:10b0:14c:1f57:3e86 with SMTP id a92af1059eb24-16a5f5ddf6bmr11356001c88.47.1791778767995;
        Sun, 11 Oct 2026 21:19:27 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becefdsm25739266c88.7.2026.10.11.21.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:19:27 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:49:24 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Roman Vivchar <rva333@protonmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/2] cpufreq: mediatek: Suspend at the opp-suspend
 OPP, and mark one on MT8173
Message-ID: <asxfzG7bNohf-gcB@vireshk-B250M-D3H>
References: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-0-ba13f826eae1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-0-ba13f826eae1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_211929_689693_F0C7E504 
X-CRM114-Status: GOOD (  17.31  )
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

On 09-10-26, 14:44, Ryan Brue wrote:
> mediatek-cpufreq has no .suspend callback, so each cluster enters system
> sleep at whatever OPP the governor last chose. On the Amazon Fire HD 10
> (2017), an MT8173 tablet that is not upstream yet, entering
> suspend-to-RAM with both clusters at their highest OPP (2106 and
> 1703 MHz) measured 63.5 and 63.6 mA, against 52.0 and 52.0 mA with this
> series. Those are 15-minute windows of the PMIC's coulomb counter,
> alternating with and without the change; one count is about 2.9 mA.
> Earlier, on the board's previous firmware path, s2idle drew 210-232 mA
> against 158 mA.
> 
> Patch 1 takes the suspend frequency from the OPP table's opp-suspend
> entry, as cpufreq-dt does, rather than always using the lowest OPP. That
> keeps it opt-in per SoC: this driver also runs mt2701, mt7622, mt8183,
> mt8186 and others I cannot test, and no MediaTek table has opp-suspend
> today, so they are unchanged. Patch 2 marks the lowest OPP of both MT8173
> clusters.
> 
> Patch 2 also reaches elm, hana and the EVB, which I cannot test either.
> What they get is a switch to 507 MHz in cpufreq_suspend(), which runs
> before any device is suspended, so the regulators it needs should still
> be up. cpufreq_suspend() also runs from device_shutdown(), so reboot and
> power-off switch first as well; on the tablet, reboot -f still resets in
> 1.4 s.
> 
> Patch 2 does nothing without patch 1 and is harmless on its own, so the
> two can go through the cpufreq and MediaTek trees independently.

Applied. Thanks.

-- 
viresh

