Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C253D262B2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 06:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9uWl3rdprKmYKIlm9cQ5xrT6yJK0T/GUFytUde5C6o=; b=e5PmP95E7CZplGed0KaJDPa/9v
	h16Jg6+dycFZJzqPixvivlOJI9Kq+xIQijykr1Oat92252NLSdGi00EUj2Sm7b6ly6Xkqr/+H/ZdE
	CEe4gwinJKbP4bqssZNEWigXyAgmZ7OCmhpjIE8mTcBjlNWcF79AKWTcidaGMlgxjyJecWSsk+OPW
	wL6lcWsNk/mkbnAKXpjRnc8zElBxc9CZvyw9n+ZLpEs2yV8gbdttT8Oo+NeqL9vt1VkpwJDa+Q8P7
	2fgtCts8zpwlzMUzeBJOcLI7lK80iefujjTS3sZj7vTW5dsKkkVzsaDwXGof8Ig+l0xOOBSpCvsr8
	5q7unL5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viRhf-00000004wgv-2UOg;
	Wed, 21 Jan 2026 06:28:31 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viRhc-00000004wgF-2IJ7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 06:28:30 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-34c708702dfso3376264a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Jan 2026 22:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768976907; x=1769581707; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S9uWl3rdprKmYKIlm9cQ5xrT6yJK0T/GUFytUde5C6o=;
        b=jKuzh4jFVS+qejbYjs1x19mXJKnrcX+d2myt8K8wwHiy0vH1+EkeA575p7Rz66iDGn
         5pqGSalsXk1R95g88sORj874dDhe61hIMAMSFKXQpxfSs+efNoENm90Poz1plxgG8DUk
         nWA4XNHaUDj3ntT7gzKOXva5YGcb9CRi02GW9zDz3fQOAqM6NNbaV/vrdNWwhTdpVIRd
         Quc9ZYjn591jFHUix7uNKdfDOQtybaa9AKbBPqmh9PE5DJLWtD8kUokCxxAF1XPIObxP
         XTOLqhSG8M6houe+GnPEhjhe0vasnkqdvhPLFi4JYaqTeU2SGQXQ6vB3CduKB4Cl/dqd
         15RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768976907; x=1769581707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9uWl3rdprKmYKIlm9cQ5xrT6yJK0T/GUFytUde5C6o=;
        b=gkaETNQhep4/szdOUktceUlJChvBgwKzUNZ8CmbPI3VY/pLNZR6yRa2VrwM96fKNqh
         eikKoxFnyx8fXJAkSFOHbp5DmZtqbys6wNXN0RyXzk1JMEYAZ8JKV/aVUnGvqliY9rR+
         TVWefAbvq1WO5hCEL/I89IZISBHBLURkpiSmLaEK6iFMwvfQ0x+LUOWLyCAM+3v5XqAD
         YCRUEsZTs8gMcuZyo6C+k3VTZvkog+6LYRJBy6AArjqFjcu7VKei6AhrjBCnrTbLTmJ2
         hUNCLO4IFR1ELRKDVtcYDOsgSmsw98HqWGg/BkgZhXLyv0iDbpWpqm7GL7UnSV6pJNVd
         qldA==
X-Forwarded-Encrypted: i=1; AJvYcCV7LevklXGkI4kl30id4FIxlrUykgXx/IOIdUFb61zE+VaAwP3HlmqSQONqKR4gAgX/H9yPyTPx3eUr5Ywk4el5@lists.infradead.org
X-Gm-Message-State: AOJu0YzVPON2DDvYvmtmPBeBeazZwosGnG8Fg7CKfY2snJIrSmoXg4qK
	OxbwqjuscoeBx2lCnPFV78CRNKIG30/xmVnTN/t7E8Yyo7BCGCyHejoNROX2mOavfrk=
X-Gm-Gg: AZuq6aKBZwMcKUc7JxKHJBEru2kTBQoxhNFiCYymnoXfYHNuGh3SJCo2MiD/ju3P9NM
	KOTva8wCaY84G0PYAldq4YrUpw0zTR7WKAz0AYMLF/eMO8S7W/XzMq6LRoKZhr3Q2b3eb7aPaU1
	brQyyAqo9WUtfPHTSGYltfsuBx7uN7LHKCuv6jn/JCdo5vy6dDzUP/XuVJwhsmlBr2XFYZcR0Pv
	RupQf63abuGrIexbwPpyeepFxFA7GRaPAu64240mhSd5fhQsE1NCoqZB10qelLAARsnAIjh6Gtn
	6D1cUURGmfkjQX2cinqLv9N6GY7hXm94C3WoB7wATk1DG6RS5dwBk9ZRGbHYcXoDKz3fwYt4FxT
	cc1CCULYxZFhlB7gyQKBdWoWdv1LpQTccXV3xtMS4tY/9w3DuE974OINifLBkXSs3EhRIzRoM8D
	GbB6QtHLdG9NI=
X-Received: by 2002:a17:90b:1e09:b0:34a:a1c1:90a0 with SMTP id 98e67ed59e1d1-35272fbe02amr13383022a91.28.1768976906418;
        Tue, 20 Jan 2026 22:28:26 -0800 (PST)
Received: from localhost ([122.172.80.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352c403b7e4sm3875019a91.6.2026.01.20.22.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 22:28:25 -0800 (PST)
Date: Wed, 21 Jan 2026 11:58:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dhruva Gole <d-gole@ti.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kendall Willis <k-willis@ti.com>, Sebin Francis <sebin.francis@ti.com>, Bryan Brattlof <bb@ti.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/3] cpufreq: ti: Add support for AM62L3 SoC
Message-ID: <yjpk2duxzham3ky7bvsu3majkjlypkvnc23dsxenfx4ykejpcp@uuohmp63qhwk>
References: <20260120-am62l-cpufreq-v3-0-8c69b80168a3@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-am62l-cpufreq-v3-0-8c69b80168a3@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_222828_624630_B505D0FA 
X-CRM114-Status: GOOD (  14.24  )
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

On 20-01-26, 17:17, Dhruva Gole wrote:
> Hello,
> 
> This series adds CPU frequency scaling support for the TI AM62L3 SoC.
> 
> The AM62L3 is a low-power, low-cost SoC from Texas Instruments. This
> series enables cpufreq support by:
> 1. Adding the SoC to the cpufreq-dt-platdev blocklist to prevent the generic driver from probing.
> 2. Extending the ti-cpufreq driver to support AM62L3 speed grading by reading the efuse.
> 3. Updating the device tree with the necessary operating points and clock configurations.
> 
> Tested on AM62L3 EVM [1]
> 
> [1] https://gist.github.com/DhruvaG2000/6dcceb80cf7bbd1e624ec210532538cb
> 
> Signed-off-by: Dhruva Gole <d-gole@ti.com>

I should be applying only patch 1 and 3 ?

-- 
viresh

