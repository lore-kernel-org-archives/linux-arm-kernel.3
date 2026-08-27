Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3D7DC61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 13:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZcqJsOk8WyALrofDgPKRhkK8TJsmoKsFAfVulwjePPE=; b=pbvcroEUrseOLUCV2nKRGcLf6N
	3AUpSCNn7RRqcr8Iz9wrqkvGpSJB0OlpgAgIWwl31X/8g4PLJ2/+DJ3SAyE9tOxpIILpGi1H5HI9r
	0btDC+Tfn4t/7kGR05T7WZXcePBAK7V1/CCXpPvY01oiq82wjBgRLCvsC8INB5v+v5QfCjdqGkZK+
	gnX9UrJtBcdvIcysiIlJBvoDfuzWC24b/v0VI2raRA1mPVGFaj6NQTyE4GFePgtppDBsQ38f6rRQP
	ua26VJjCbh9m62ZAqBtnxi5ruHpQmPUypuos0jEQYaE6IOrlHtvO3pLqiB6y6VbpXyuXr6VRl9K6S
	PfCFy+5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaUS-000000045fx-2Uga;
	Thu, 27 Aug 2026 13:50:00 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaUQ-000000045f5-0iVx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 13:49:59 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso943511a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 06:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787838597; x=1788443397; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZcqJsOk8WyALrofDgPKRhkK8TJsmoKsFAfVulwjePPE=;
        b=lXaq4qF6T9qs2yBkjszQlUGwnUllCxe26+FO9RJSAD/+p+xKbQMFvhltBBrn5iq2Rt
         aqsowSM9EBwHbsThFXiz4xoOYkfqn4Bbgu/odcbRYv22V7eOaQ+d6pNkUdcMTZluVN6+
         xVjX61qPT2Vb0lZXBpsSf4PZgzyKuL5G0phr4xZuRLqqBn0Bvr0mcj2SEuquy6CsdVy5
         YexlBgTyGbts/wYifMW8cZeW4setcH8EBBPdLyu94WYQLX4dapRfVp5S76Vy5ANFLW4T
         H5pexHvHE6sOmfArl8JqKi6iC/xXR5Jt2PFTY4FhWlLPt4t5KGiICYqC71tEP4Cf+h7n
         eOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787838597; x=1788443397;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZcqJsOk8WyALrofDgPKRhkK8TJsmoKsFAfVulwjePPE=;
        b=jeQYMvln0pkzT2HluvDFClm1+ptMevFLmT0/dtDnDoi2ozzFTZZ2z6UQ62APi6BA8j
         ek3oGFpmUxqB0i4kXtM8VHAAnyqj74zqM/v79hkqTy4GuTf2ejgtt4GNWR26deA2CXHG
         JYa/BjMSsqyCS+HkxPDJxYiQdmeCm8wh9G7wSOTMbSOLxb8KSz7cKQGk8YQ3K6Lic3KS
         csdsoFWHe3dUdczmjrqG/FbOOh2C6uHQqyQKOrnq9xEnRv2MFdgzWSfxn9WzrcqvcUQf
         gG8zps7WoApL2SvH463pBYOmXSKcTVMSjsoPNtIVng1RCT1b55vXpwV//V5lLIrmK7cG
         uWkA==
X-Forwarded-Encrypted: i=1; AHgh+RrWnWqxivNdWIjYjJZuGj5GzWdKu1cKyo6Qza/ScmaXQXNrS1L077skwLQ/4bioSlz6TKmDU23xkN3+hR0ccNRc@lists.infradead.org
X-Gm-Message-State: AFuF++lwPC/sTWpIc+QPudoutB389hlfcW71TvZVVta4/Qz57pl3zEMl
	cp+KTO+DPxbTALynpk9WSOKAE3cLdi9EVRvut/pXsNFuiFhHbxqt3LYp
X-Gm-Gg: AR+sD10c5gEEM0koJ/K/eGzSbHK0t0ebZgKX4B3rpoWX/NMXBIlmgTppltY4RrxNnva
	znu8Zkein8/DqmiLSaNxwxTQuPHoX7+8Cgih+9Io1svfvKSGlBvgbnmh56ADKaXuI37nmeW/g+A
	9jM/PsKh/IECPQ906DpqiWWL+gDFZsy9UN/rpjB82UE+qgg6yRlDGqQylksCOo4STlifrw60noV
	9n042WyhHz3criiyPlGKa5FQf0nt8bQaPsLHAJG8C+b9yXIx7Sc6wCZnnD219B08vVuFTJJYqgl
	4B7c7uLaNh7CwYrwxQo/KS/T18dl6l3qwe6SNh+AhC2gYm0qgPisTIBq5k2mXf7uKR/JnndGRYx
	HLBLkgopDESbIQKrwBEFR2wRlyHq0ZsUQcLPmtvLT535lHQ0AaT62MR9zWxeYYhKVBuaL+2zPEK
	u5RMKLACowsCEbTwwVeCGFywAXqvsZJo+ykBtfQis5EgkbnNb6wE3KBkZYNCkUtPUR/BQLNiZQt
	A==
X-Received: by 2002:a17:90b:3949:b0:38e:4114:d8c7 with SMTP id 98e67ed59e1d1-3966cde3f0amr31804223a91.0.1787838596310;
        Thu, 27 Aug 2026 06:49:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd55a4sm2941117a91.7.2026.08.27.06.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:49:55 -0700 (PDT)
Date: Thu, 27 Aug 2026 06:49:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aiden Isik <aidenisik@member.fsf.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: watchdog: samsung-wdt: Add
 exynos5515-wdt compatible
Message-ID: <a7290d71-53f3-45fc-b9f9-f7982bc15b8b@roeck-us.net>
References: <20260821-for-next-lucky7-watchdog-v4-0-d070cee5009f@member.fsf.org>
 <20260821-for-next-lucky7-watchdog-v4-1-d070cee5009f@member.fsf.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-for-next-lucky7-watchdog-v4-1-d070cee5009f@member.fsf.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_064958_214478_6D414FEA 
X-CRM114-Status: GOOD (  12.34  )
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

On Fri, Aug 21, 2026 at 04:14:49PM +0100, Aiden Isik wrote:
> From: Aiden Isik <aidenisik@member.fsf.org>
> 
> Add a dt-binding compatible for the Exynos5515 watchdog timer.
> 
> This watchdog requires a syscon phandle, and the cluster index should
> *not* be specified, as that does not make sense on the Exynos5515 SoC
> (due to it only having a single core cluster).
> 
> Signed-off-by: Aiden Isik <aidenisik@member.fsf.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

