Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B19CCFD640
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 14:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPpS2fnpM+6YueRvKfiaJ+0mjmZ9bEndFXFtCoDO1IQ=; b=adeW5FAy+uzdqIsQfjB6H2UxhA
	f5hy6bjU/Jt/tklGtM/ONYbMqZZ+aLQ5/4OEBYNzTRwtYo9oMtVkqNoh9pUonk82hw9J3rtmgn403
	/BB+DStU+0T6VW7TOrt0/CnX7i1TbUwOCOLJHZA15kvENJbISWJjHZvQJUIUyRvgSdxlXEXqb3SHD
	+JLY5FQVzOCZZrjK/ZEphV1v3LmccdaTZ37RRCpdDsAkcdVMb009XkAkFJrPrFmO1c7weNs3JdMSP
	lorkwTqMgfcsfi0tsDa0F856IsmhJh/P/pzV38Cpm/QyXOPoytmpdjqCE2a+6+yax9QXT8iOH+y0i
	LUnI5lnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUBI-0000000F3Pg-1Qwc;
	Wed, 07 Jan 2026 14:06:36 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUBF-0000000F3Nu-2RVD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 14:06:35 +0000
Received: by mail-wm1-x342.google.com with SMTP id 5b1f17b1804b1-47d5e021a53so15628735e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 06:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767794792; x=1768399592; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uPpS2fnpM+6YueRvKfiaJ+0mjmZ9bEndFXFtCoDO1IQ=;
        b=l9yN7MEmkV1826E5/bWehpvL7d95EESgW/u1dQU70ycl/34UW35XOlAHpKQ53HZj+N
         3VDNt7itVcqB37YaY6tc7rQ8HfyRCjC2x10L8e6fdaNUQdb+MZU30aM9jjXwNCvoF2HY
         KDtRvtq0lL57dwJKLA2ns1IJRf1gskj58PrFauU+QgWk3puooy+YBLPswmXU3LKDrNaX
         LwjD4Sx/0l8rLd2sQ1Y6HHen/kFnzDMhxZ+MX3xxelLKQgV7ztYay9LB0PmvgLCGMtic
         kmtMU6X/tCB07dJbII7At8adTUVNgCkB0WoT5E+82ZiudWsS9z0ytGa/tdi3aXvkjN9h
         8LWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767794792; x=1768399592;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uPpS2fnpM+6YueRvKfiaJ+0mjmZ9bEndFXFtCoDO1IQ=;
        b=f5MqF5WgVJPPVR05CD472Dk7XMWjuw6ek6iIqW8qktLOU/C2vCy56zwfWihXoCOHcg
         HMBuAOO9jscdYiK/9rzDxFsdUdxHqwn0/NvzdBwCPQJ1xtXNv2JADqVAjtTzEqOqwzLc
         eBYB/sCJImLlumauANR4ZrkzXjibdo2kdr3jSOo92sBygDsyr6FMk86CA5fuoTPV5YtL
         BiDGTNDHhPu8VS7ZYFgejhQcpRIrWF4Q+JW8yN3VyI/iQZ7RQdXi2dBK0GGdJGJA5Jhu
         TA6EbRXcEKqF36aYeLvXp3BVUXhI3xPij97+GRg+3pKulYPS5nRUuQgJgWNsndxCUeFL
         D/Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXtd488CL/m0yqdtLCnEhZ+d0h0+lpGSSe//Q5CIh6ZXmjePyiQexuHTnjfeDhzRgZ1yRHYTiXo3egE/dHQol+6@lists.infradead.org
X-Gm-Message-State: AOJu0YzkSx77cDv3Wc6fQZAOrvc3Mw7rkzgEKuJeQqDULJ6V75VjOi13
	itgPDuTMlGzeZ3s78KPq0guSTV47d93aV/nfXGT11HBFi6LI9gnCAximMQs2vW/fw34=
X-Gm-Gg: AY/fxX7RXjkb0XdctdfDiWq3UsNMNCvIwLNp4uw19EPBx5gjWSHsaXjVHiymwMllM3j
	urGjQYvqmkYtJWetKvr8NKEshasvMVXcXcaQJHCGA7JR0u8oMf6fbr5Wgm5qd0u4BhY2zv9bFYo
	fiNnq6YCekkdFOI007rfJc2u9JFt3+dFA8q+TUsad56GeI4r6nryfKzJt7LUd+AlTl5kjcMea+k
	G/znOiUhTqqin6Ra/ZEw5m09Vmv0XJmkaBqvm+fXXum3M1J7npLINRyiTw36BBOmhHLLD9bWKGg
	FFyU6sGmWRjFwnYeFeb2R7K27YYsUkqWB7/EV9z39dTL2SJEIZ4ZtQ2meEyoi9LOcDRK9G5WN2E
	AZKPC1YQDZiFp84iwIpLAqqD1/ItgD1O/E6twCA0tlh6WDyxDzNxOwQpc7abEmkIevExh2DMOmG
	pg7oi/7R3iMKBMCYO1rdfnhFiw3OHIkss=
X-Google-Smtp-Source: AGHT+IFKKkF2rQrNfKVm0xBIrXitMatKB3NKMQ4oAhrZw28JMRyqxQxPGMYW7R/yZLTYz1Z5w5dWTw==
X-Received: by 2002:a05:600c:a08:b0:479:3a86:dc1f with SMTP id 5b1f17b1804b1-47d84b41012mr26925205e9.37.1767794791482;
        Wed, 07 Jan 2026 06:06:31 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f41eb3bsm102686685e9.7.2026.01.07.06.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:06:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251223152510.155463-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251223152510.155463-3-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: amlogic: Use hyphen in node names
Message-Id: <176779479041.1564227.9998045080717551889.b4-ty@linaro.org>
Date: Wed, 07 Jan 2026 15:06:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_060633_646085_E3331A3B 
X-CRM114-Status: GOOD (  11.59  )
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

Hi,

On Tue, 23 Dec 2025 16:25:11 +0100, Krzysztof Kozlowski wrote:
> DTS coding style prefers hyphens instead of underscores in the node
> names.  Change should be safe, because node names are not considered an
> ABI.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.20/arm64-dt)

[1/2] arm64: dts: amlogic: Use hyphen in node names
      https://git.kernel.org/amlogic/c/125c3ceadfe02cd4917c5e0bb6707b37870449f2
[2/2] arm64: dts: amlogic: Use lowercase hex
      https://git.kernel.org/amlogic/c/7bcbedd64ecf5624583140faebfdb0e2e2f6b43e

These changes has been applied on the intermediate git tree [1].

The v6.20/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


