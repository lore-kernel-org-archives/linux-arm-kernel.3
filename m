Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E49C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 07:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hQYBSbI5ZDykG/tHrbEEtWawqAnT4ZwcW8GfIYLRIEU=; b=KKnxbHxMqe+HV/8ozFpo441Ayd
	yo3omOdOYCSPhTeE1n1hvcU1km8PZ/DJcu7AOycWJGabe5TvoqlCgycdf3XHGL4eTll+U0wSjoBfB
	obQiYOgcvd+8Yiv7HA9E3Ir9fLVsD16PA81X4K9tDAk96pFu2EZrNuim+/Q3NoWbk8gbAWuOXKC5n
	+Y+cWzDhh3vigw/3tiRkPhkWSSZqMV+1qNr/mketZbjTWujfX1D47xSGP2xQXAS1NCsSw1hOKjN+r
	q1OHDeo9bzoJfb67aas1UnC6YBlnaxhZYmZI9t8wPSpRglUviJGENHTifdQHrFh68mBkVAgVVR7iS
	K3pYGKEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kE0-00000008bhe-3ANx;
	Wed, 16 Sep 2026 07:38:36 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6kDv-00000008bhC-3KWV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 07:38:33 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-90cdfe57a3aso5642816d6.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 00:38:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789544310; cv=none;
        d=google.com; s=arc-20260327;
        b=OSyWrLgNTmPBMMb+9O5N/6hIUBj2yPciyNJreFMI4vm7MEIlwR0WaVBCQjHWGveTVO
         ckU7fwHZEbXtJSz3OCDH0z/6Ns6TLLASJF+9VMKY1hTNr3Wg3s3zHCae35Y2a2zGIH9X
         8Od5Ez+4DSXr1TTpn99wGoT+hQinL0pbf8ckuaKq3GMv10iH45pDPJ0m5/3eR+0627k+
         jNRGGczsEmvZEQtybv49fC6nCDmLmC1scxS4MOM0JodE/HaSRjvXp1MZz5gtn1MHjtlp
         158/zmvQgCZhx0CCNVHJ7B1X59tFCm3lgiXBKkxL3mo7Wqx2fAnTHystya4j6Dg9sS3j
         QlCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hQYBSbI5ZDykG/tHrbEEtWawqAnT4ZwcW8GfIYLRIEU=;
        fh=+em7za2C4VUMR4PV3DyE+DYhRdxUpCtP/90bU9W0h24=;
        b=d/WyyMPmQM0D4dxNb7rBMMfuh23f9pRrnS0ch1hIizT2y6/dEjCknRxSIegJkYI3SA
         ZIyWZn0s4o2ycs02CTW1vmNcAUUM2GXbeiDTQKvOr3bSyDBKD8AQNZxyRVRtbk+chQUw
         B6/8JbcLTud2JAKQufGvdFPVgu1OTLHCpHjyZ5/bFm/5vVTZQky73lONsfSWhXAIZxrp
         z2ZnZHmXvY4TmjhAXhu3BIGJAmSoUZfZRr9HbVkSoe9tjKc74dElYaDCezijDdxuKMOO
         oKr/CFLf4pIDegqLkMhK++SQwxJa7HIK3GOgNmzkbbG21ypbFWOEU9tTj5hMQwkoM1Gq
         r0pQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789544310; x=1790149110; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hQYBSbI5ZDykG/tHrbEEtWawqAnT4ZwcW8GfIYLRIEU=;
        b=e/Yl81HBDDMwxDNqi1FSmjikxNBreaVDOmQnAS1ywNUN/nJqn3G/unFd6F07NSDqr0
         63rDTzd9sRaplDdJOdpYRbFu0+ROvr/CZUZVxliCgh+0rDU6O8Kw2cxMuBJDpoY358wR
         R5WT6ay0rMFP41Etezn/rZT5E6I99GpLXb8k7QjjTUwHHZFNSKE9+dJEffo92CFKfSwp
         O1e3q6HCXCjSHK5VsW/t7cCAFYgdr2kpgBIIhjTkewr6gvi8MINOWkVrPAIPWgDFOdAS
         qk7IVQshlisEzKNwSnm1OwLcznQu2vYsj3wtfdfN+Qes/urNz7oWQQmyqh7/ajYuMvNM
         Lf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789544310; x=1790149110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hQYBSbI5ZDykG/tHrbEEtWawqAnT4ZwcW8GfIYLRIEU=;
        b=tvcwbXevPv9jDZ73sA7X52MbvGnY7IP/2ohfjqw8hxErw8C1k+X+qE8w8IyU3xhsZv
         hty37Hzroa3AJHt6X5QZRP8mCN+HSzzAEpMywFePMLdUV9FAc6oTHhPr4YfYElPAys5c
         sWc30yD9upReV9s2T49TNWBn3EfyQ+6Faws7BjvyqgnAQ36FR8b8tyzGxeSeETpZXl8r
         OMEzWvS1b3CQWpJHnX5KKoJtKozJjLJ7jLWbvyyrEzVM9qaapAng/powQbuB1Sjw0ka9
         d0+1ysErv13imYXA4XYplegPudWHnsKaZ5g3pTuKN8B0lyR2VIX0xrm3x8Ndya66klrL
         lI6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzsPZx7y4IDGdgjG+dpebDn8NfF/+s9JoM7uQscbJ3iUhVgmmHFxyk8HhamerMYHaHx3/kxvYgDFWzfrxpLuadN@lists.infradead.org
X-Gm-Message-State: AFuF++kycpmnhaxyvq01zvXNndX7EaT/HYf0Y3UpgkzbrHt1uu0HRjWk
	FjZfMbns+I54HWE10DGu5Jq4B50jnS303eij726wdx7Wl9nqU0A+Q2SFJ7inuZxssvde5ZJv80F
	i+ZRJ0LF9nrhArb88Dzov0WFRrvFVTPIg5ts+tF+yig==
X-Gm-Gg: AYBFou1NEW2UA6qLD0tTguy6wgve0R+AwQ5Gh9KQwq51zMAp8yQQ+sxD92AVOP9dFUk
	W9dBpVoSqQt4DJrLhdaAGsI5Ybnjw8SbxJPrsFQR3mIevYIn6/UZn390FRP7VzWFa6BwOJSZX/h
	niNb7o1bjJvDOnb4Phs6OtT4X7PHAs6iOruXxnFseW+WET704Xte4xeFCAw/9d0FyTdNb8NFwbS
	udiXTF1fNB9AS6XVMMaoAiY2EvLIDR2broa6MzwuGEtnwKBi+bI3ScNSodr6l+FzJKo9GNCDIr4
	6QTh/nWyFjpMueOhnaXofRhRH2vrDaauJk3ylvD0v2x+I/F0qLN4ZfSsRFmVmPyjYFu4SAU0Mb0
	6rFNntpbt6Epn
X-Received: by 2002:a05:6214:500c:b0:910:6ffd:a941 with SMTP id
 6a1803df08f44-9123d721985mr29575576d6.5.1789544309746; Wed, 16 Sep 2026
 00:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260907-acpi-dma-v2-0-0ffe4a007992@thegoodpenguin.co.uk>
 <20260907-acpi-dma-v2-3-0ffe4a007992@thegoodpenguin.co.uk> <aqlzjZigicrtyh7o@lizhi-Precision-Tower-5810>
In-Reply-To: <aqlzjZigicrtyh7o@lizhi-Precision-Tower-5810>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 16 Sep 2026 08:38:17 +0100
X-Gm-Features: AcwNN1Vn5ljoRLzFV2GiG-9S0jHlKDZRzXLPscawH2jK-lpFtONtbul3vK317do
Message-ID: <CAA6zWZ+tBBWdsZFGySWFsRKFq-FYy36QAYVQtUOPZ4GVGDYudA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dma: qcom: use named initializers for acpi_device_id
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_003832_096530_450BE10D 
X-CRM114-Status: UNSURE (   7.77  )
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

> Please update subject, correct tag is dmaengine
>
> dmaengine: qcom: ....
>
> Frank

I checked the history of all files touched in this series and all
existing commits are tagged with the dmaengine tag=E2=80=94I'll have to
correct all of them. Usually the tag/list name matches the in-tree
directory name, which caused my confusion. Thanks.

