Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC57CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aRj4gWuvSe9KJNF2HvWgOVVCeMpYCcJ3nSN/Zd2LcHQ=; b=mn5fYU1oxyy0K5tzbJYDrXI+9v
	W5aSbtyNVgUvaBf2phWXjNMLXi4mO0HRpqawmwyIo+RuQn5QXUvv40GZ5UtAPhZfIcB0WiS/w/+Lr
	+WwoNhqqUCXUb/Ks7snK+o+xyJOjZ2KXRJ2OkLR/hpd1QsxbP6EEZatLhQtGfzN44RAMwB9oER3cJ
	Rw6+4MSgDrluMgMzH99if3MlGxYxxMGRd1IZT5JcfISuPiXi+ZBd6baatQEjFqnCfRJE5B1wVfipr
	t86UzyGiLwGrfjlEA2c5hse4wkVrGXAPL13kVi6z87KLr7c91AmUpLonSUQLTr2NDKEWhz/w/xj4m
	aS7yxzPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSat-00000002kMu-2jQA;
	Fri, 22 Aug 2025 14:18:15 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKuj-00000001eZT-26s1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 06:06:14 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so1703156b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 23:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755842772; x=1756447572; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aRj4gWuvSe9KJNF2HvWgOVVCeMpYCcJ3nSN/Zd2LcHQ=;
        b=k7BGRKat6whcwf9LcCL2aqlZIcIgwCW2jVeWBxnhFIcyVHZDFFtCCbOt6tYijYE9i/
         EOVlnhslqxdMXc8kKBIzFXnJycdfgqeNOAOP5mEhUrrLVJWoCBDf50hbvJ2DLFcVjH6u
         5dSe0NsKmW4C8YjjsZcGbT0MDhqM45nBYHf5OcN3tkDoqkkNOmPSOQfNZKoZF0YznBuX
         c8zTq3KC0/zRPX7P4dO+s9xBRU0H815BMP41+mvdPm8c2zGozpOJd8qaLwsT2f69vPg9
         h8bYNNR+fimggSrtoh8JFjWNa9EhZ1vYiH098ujA2U1D/P7Bemj26v71+lhLhcAOoxd5
         OZMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755842772; x=1756447572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aRj4gWuvSe9KJNF2HvWgOVVCeMpYCcJ3nSN/Zd2LcHQ=;
        b=qkXBs2DD6qY/uotHl4fSjmd4TCcsawlwtwTOmb6uYPW6sDuK9iNdAir6/iBuhBwlqQ
         hMEHh3ckXDvymhCYQaRtguVpo2rxAWnozwAqPlq4CJ+3vgSOA7uThk4KM9tX29TZDDyO
         GTFp8An9UIFg9CfjJtSmAzibmMrJyBZvE9FWr/k0p6eYHP2ZEwuLzKIIg2x5Vyf4Jm5J
         C/MXrO5VJL25AtSlfYVib+HJF2QPXTzj7qrtuxQVVzmMuOrFVPqfZmsfXwzkUexi8vs1
         GotqqKDwmMY4iGI8RrjqasEuJx/sfNd9BK3jVckbQ0KqkNGRQeBLUS7UbW6JpfpaSf/M
         IgRw==
X-Forwarded-Encrypted: i=1; AJvYcCUO7ukcAuo+PCctgXYdd80JPm0NgeyG8ooroc15P3Qf8j6bFaGw/GKsy1wnnH8ENQshDoze2YYjdXhhsVv/wXlK@lists.infradead.org
X-Gm-Message-State: AOJu0YzgSA+HREWgNEiGEg5V2xdunV46j9uZ2oVZPk49+GPYMCGJkRa0
	ARulgVlk0VdtvA4Y7nQ4dTtWm7Rsi4gVpNyC6QbewJfBAaV8mSQLzi2ICRAzHhZYuTo=
X-Gm-Gg: ASbGncuYeh9IzBi25mX6y5aoYsHskUOU+kvcY26rlpD9DWk01QfFO0O33dHvNwGWtaI
	5XSxmY17I8YoZN5jQghrDpiBtxoDThfdHO28nciU4mi1+wlTNSRitcGbKXICUtaPchcC8X9X8ji
	fhSGCgF1H42+kyOqS5dbPVsUEvn9vY5mHQuzY8odgS9cRSs4V39oHGnUycBP+WtFF5TRObEWCpc
	32r9PnXBEXqWgkWV7FuLyXq6D7a9VpWB7ONyrorPjvODSUwxl1ADf+I1gutEeJY1aXJyA5CQFC7
	2QcThm4wpdAhC2kBeXHgUPQzAWPDq1eYaAuOHajjYuyDXL8xfgwOaZQSUKTzAX5lNZmqfS1doKA
	AlAcfvp6fEAndpvVM6SYm5UHg
X-Google-Smtp-Source: AGHT+IGryQhx7NkdJSDc5m5rZZNOBqLyR8DTgK4iIdr8kRPK/dFFCXNh+UbON3GVXLnVhVtonBLu0g==
X-Received: by 2002:a05:6a20:3ca6:b0:243:78a:829d with SMTP id adf61e73a8af0-24340e4640dmr2844133637.54.1755842772379;
        Thu, 21 Aug 2025 23:06:12 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-325154999f1sm1475868a91.25.2025.08.21.23.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 23:06:11 -0700 (PDT)
Date: Fri, 22 Aug 2025 11:36:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Judith Mendez <jm@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Bryan Brattlof <bb@ti.com>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/3] OPP: Support more speed grades and silicon revisions
Message-ID: <20250822060609.djvsm5nmryit5ypl@vireshk-i7>
References: <20250818192632.2982223-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818192632.2982223-1-jm@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_230613_546777_CD884389 
X-CRM114-Status: GOOD (  11.71  )
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

On 18-08-25, 14:26, Judith Mendez wrote:
> As the AM62x, AM62ax, and AM62px SoC families mature, more speed
> grades are established and more silicon revisions are released. This
> patch series adds support for more speed grades on AM62Px SoCs in
> ti-cpufreq. Also allow all silicon revisions across AM62x, AM62Px,
> and AM62Ax SoCs to use the already established OPPs and instead determine
> approprate OPP application with speed grade efuse parsing.
> 
> Also fix 1GHz OPP which according to device datasheet [0], also supports
> speed grade "O".
> 
> [0] https://www.ti.com/lit/gpn/am62p
> 
> Judith Mendez (3):
>   cpufreq: ti: Support more speed grades on AM62Px SoC
>   cpufreq: ti: Allow all silicon revisions to support OPPs
>   arm64: dts: ti: k3-am62p: Fix supported hardware for 1GHz OPP

Applied. Thanks.

-- 
viresh

