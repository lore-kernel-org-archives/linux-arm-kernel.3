Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D646C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 10:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AT1CnXLkiA949eHbI3N4NRZADoe17hbbQAYuiZp/Zhw=; b=OVaJQAq66YQj2K0MQeTlUNmf6x
	Q9rK0MmpKXJEv6BC8Yp3H0Ag14M9xLGFVp8g+qDACA/tZH7/LIMzn71DCaGc5wdGDS/qsSp+EzUU7
	ZoQ6fuZQ6P3U/87BSRg4fPv41AoWnwzA+ZrPnVjIU1Jnh/ciXf4OdBhKfOnqDGc1V5la+e9NJhtbt
	q1w1DFJIEOdrbyrusGABbZOnZORPOpDhNgX7NjQwmXDoG8nZvPzEQj9kGSL6OjBbnkuPmmF7hCPeT
	roh1Z03Hw4c9tluYKBU7Wf02Bx90KEmFDlcp2FhW1FDIazFt2A8YMqCRQxg/SWeYLRwifTl+epDlv
	f/Z2S3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGvt-0000000Ax8A-0WQ5;
	Thu, 03 Jul 2025 10:12:45 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXGrs-0000000AwcB-3uYP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 10:08:38 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-450cf214200so44905115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 03:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751537315; x=1752142115; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AT1CnXLkiA949eHbI3N4NRZADoe17hbbQAYuiZp/Zhw=;
        b=eecEEsJ3JWSfZr7nmbueBj12+6Gh1XG2c3Ezqn4qLLIXjmAgmDReQtUQKe3BC2mmYp
         yZlWSfdJ8lQwqG8IZiqTvT9P4cbenh79Mo3ZCShHzbHOrKYEeNYyrd/5S56ieVaInqna
         +b3Pg2F8CTLuaK6vbkFmikXt7UQ3omctygPAHiLoByzWuQPOBEQ+EvC9Ftpmd39kD1pG
         dOjlYSXfmP1zPOjyB0kNGFt3asIsbIfyWV3xUj1z2x1iGfIuZy3oUxZ0BKGTIHGKGfoW
         Ajoif/ojFAx0BV4bLp8rCyWG9yzhkyOlY72BcplFctHVVIkE9kCDkClvBVnJfJ+6HUnp
         osbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751537315; x=1752142115;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AT1CnXLkiA949eHbI3N4NRZADoe17hbbQAYuiZp/Zhw=;
        b=HqXZqWDLX/AtWRg2VvF5G649+VGY6smNp5SASaZ4yU4QYPruxK62xeTjOh82rz8Bou
         WPfmWGStHvf9/nnkkSISPbYtC7Opo5YWVcXw48ijyySdDuWBQA7YQK7jHmX8ZDtqZRwb
         sxJRT3WY3nzd04VAFOcyP70HPgV7r18aug2Qedi7ubOJqQ7A9X65y71Ux9bqeumZzHAO
         UGXoYuDZ+WnkjwRJj5aTMie9z4jQ6U+PZLp4Ghug4O5Ygf+4EyseSuRcpeno8YqltPod
         a5jT9xxlN1IwFqyzdEck2HCxBR3dgBQW+ZgmogEtbzqdwr9wIOwY0aGuZs0xOOSIAlUL
         sO0A==
X-Forwarded-Encrypted: i=1; AJvYcCUtpuONbNqdPSwoGeGw+ImW5H2k4447e1HjfgyUmZlcd/FG98goN4/0E+wbjqNnJwJEalUiKAvThTz8AdYy6h4z@lists.infradead.org
X-Gm-Message-State: AOJu0YwJTahnvB3sMUjVmkVQOdrCrqsAYPaT7DZlOaYXS0BE9xjEsHjf
	2nRCiSpfzHCrpApFyH2j2dBGldngUhiD2ghXgk0q4l6tx3hIS/b+qJ0X
X-Gm-Gg: ASbGncvaE0x09gJE2CuUhmE6/HZz+0wkLongu33vX1uW2o1LcY2ZPCDFmXTRJr8LjSV
	n6krJ0kZSkceiPq37trKaysrVPzng/Xh6Z6SNIHKmraGKxu3Gzik7mMX3GJpiO9rwaGbDEuQehy
	t0cJUItAo2Z8qW6hfNVlb4ClrV1+JPmSeg4cbuvi2HqFlATLB8O/BZhZZogn85bisvTgjjI5++E
	TqF46RRWSlkk8YNH8HNjBNvh+cRq/3IMBrHXJT5Mp62oU0Ci7vIME+rSn9A6+WSwWiQKX/uH+Ep
	fmLWKG8/v+ktNqrdAoSOBTpKYvkzghnThF0kKWjTTqD+ymtUvn9dtYZ7B7+5r8LZdBQzybrRk4K
	SMIzFXfb+TZfbkkG1CZQSTIgXH9ZOllu5pkYg+oY1b7ORir3GQa6NffV2aqM=
X-Google-Smtp-Source: AGHT+IETajEME0XqnHpss2XyhqyS6HlcQReH+pyyCGg3rACxCGSi8imadxWYD1Y3lB2jG1a6lNtKbw==
X-Received: by 2002:a05:6000:43c9:b0:3a5:2599:4178 with SMTP id ffacd0b85a97d-3b32bbd689cmr1357777f8f.19.1751537314773;
        Thu, 03 Jul 2025 03:08:34 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bac51bsm22609605e9.39.2025.07.03.03.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:08:33 -0700 (PDT)
Date: Thu, 3 Jul 2025 12:08:30 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org
Subject: Forcing devices into idle
Message-ID: <rlzpjdsg6cbgxc553j6m25ysb6tyldy4lnxsjjn4hdzv7rszpp@y6rfcrbjfook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z5seqlr4kwwbvdcx"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_030836_970519_74E97AF6 
X-CRM114-Status: GOOD (  17.38  )
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


--z5seqlr4kwwbvdcx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Forcing devices into idle
MIME-Version: 1.0

Hi Rafael, all,

I've been looking at adding support for VPR on Tegra. This is a special
type of protected memory (video protection region) and since it can be
used for potentially large video frames, it can grow fairly large. For
certain devices, this is prohibitively large, so the VPR needs to be
resizable at runtime.

One of the prerequisites for runtime resizing of the VPR is that certain
devices need to go into idle mode. Essentially they need to be suspended
before the VPR resize and resumed after.

Instead of adding some custom API to achieve this, I was hoping I could
use the PM framework for this. I can hook up devices with VPR using DT
properties, and using the reserved memory infrastructure I can get
access to all the necessary struct device:s for the devices that are
impacted by this.

Unfortunately, I can't seem to find a good way to force devices into an
idle mode using the existing APIs. I've had some success by running
pm_runtime_put_sync() and pm_runtime_get_sync() before and after the
resize on these devices, but that feels wrong, since these APIs are more
targeted at being called from the owning drivers themselves.

Any thoughts on how to solve this? Is the pm_runtime_{put,get}_sync()
method acceptable? If not, are there other alternatives to achieve the
same thing that I'm not aware of? Would it be useful to add a new set of
APIs to force devices into an idle state (which could be semantically
different from runtime suspend)? Or is this all too specific for any
kind of generic API?

Thanks,
Thierry

--z5seqlr4kwwbvdcx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhmVpoACgkQ3SOs138+
s6H8eA/8DKYXM8Q4NfN3Dy4sm+8suSuldzrTG2nzdVrJS7jjhpg6iBam0X/tYTvz
xUfL8LCp6jllqzMZJw9RNyiX+oavicZVGoFoAeg/AcrlFRUzLjbHwEvLllg52R8c
+AjbncteyFTszrmUoEwrpy+dq0JtQuItUOcQPhFV2ULjsVux4NcWMusgRdQEmzjY
b1YJ8MMYo8Rr2iX0zQs0+v12sJuS6IYA6+rn6tmGIzUehAlrsKGHcGLcxk4k8+d6
fhEbDH+DKescqZ05F1mLbQs4qVwQcLVnN/2nuJw2C0P4Nm5f2xgj4FyWs3+VUfRF
bQ7cmXSmx6irZsWe9VJqKWJ6AEcJ/zkAL/acjt4dtFFMls20DDixjP4lJcbsqxfd
sG5J/w21r64fw2oAYE+sWg9agvfKBf3q39VPDw6nK7AneQv63o3Jgnh3OOS65WVy
lqFT4NcsOHayGNeoMlzFOKblkY6yvMqCJ7iAFR3FVYc+jpmKaTyuuESsX6+g2r3a
KKUjyf9nCP5RvEG8/mJiaEFJgZQDMenciUTyfPrYXWY2eQfCgL1jKmMW/Cp3Gs2Q
Jkjv1t7DElIor4KIUFT3NwZy6K5T/CcR6YQRPFhpfDGU3NvZYb4wxy9xBE4kGN51
L06NpjjfQZQSCNSJH/0EKyv3yoA8KXcCPFQgIevMCTh4+/31M0I=
=gwc0
-----END PGP SIGNATURE-----

--z5seqlr4kwwbvdcx--

