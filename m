Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A18C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 10:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qekOjTKAbV3bYAHV0cqmxxGdYf6A7xrJOKm4lVlExn4=; b=LKXri7XMBLXHg+DmEUHfwwv0bC
	BgnuA1zujD2RXIMhi93GpLCCK+zx3kr96IhU8/BviB0Pi1neWOCcT/Zx8N7gYAZPXOC4tfzsNQuCz
	mgjrZyTTEIrwYSQM7QDCPeAF0+5Wl/Dk3nkaWXPdoclOuJNSU3lMoBmLSBYxvafUgNYmVXa7tD3/t
	ItxCJ0BcW6jLulK1EWL9Zb4eEATPpQbQtkQFujGjEtH8zdrpR9oKaacE/vOsMlH5jQ39zY/CRtnU6
	tfQZRxx2KBqEMhbhDFu3mrqQLSXFQWLcp27K98/gsFex+OVqKK+duFURBvHYyoluLizoCpx4++GUC
	/npiGQyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tD2-00000008muM-2sFF;
	Tue, 08 Sep 2026 10:37:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3tD0-00000008mtT-49Xe
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 10:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=qekOjTKAbV3bYAHV0cqmxxGdYf6A7xrJOKm4lVlExn4=; b=aXNB89Af1qvX6Np3V848FOIC7R
	vyXWYdcJS8ZmpDskYSQO374w8j6bu1k+GjJibx9YlxZPHZoxZ0MgHOj9FeYmcttexOU+fQtZhcOPH
	ZGLNlmOr1uc9jQoZ9NdoLtmiPqrhWEY77ndK1sp+j6rcsXy+8MwC7qaKFrpZ1+0wZuX79u2tAG5Bl
	nBJ55tVmNfp8rU2s06Pb+oQ5NqBbP1QOdW3KlDxwwNkLybche2EFqyQpdPBC19Je+p0TLoZ2RijT9
	ot13Oj29ThFo7Ki9vW6Sc0UkPJfJEs04TYeKKX2E4YNBJ3EQkVKKq0m9ixNsHjqXN3T9EozrIVD6i
	x6TvfjFg==;
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3tCy-0000000HHkr-1F9j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 10:37:46 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2db1ca06b03so3628145ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 03:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788863861; x=1789468661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qekOjTKAbV3bYAHV0cqmxxGdYf6A7xrJOKm4lVlExn4=;
        b=WJgsIC0AxMsoovkqPegw9uSXz4eAAxI+s2SdqArTCoW2x2Lb4yrFm2ZCENxlM3UU6m
         QggD+D9GQDdPSnZVNpOr/F+Fh8SnHvP4IfdcETkI7DFQFN8pl8QXb76Ya7klvIA9ffQX
         6Ite0S3XMiy88Dz7Auc5EEO5+V1vG31FPlagfSRxIZXVfL5p7NrPnBx/piPcS6I5jDdU
         COD5FDDFzzXng57HSLOYU9uvlCPut7jf57G9RRyN6QxAigDbbU5XcZBCQ1ZS9I1bx1nS
         NjYSIx81INkMsvs1ntIOW3GNg/5hrLkHnT3I0Kp10cV8eCTfSkslYawbnjX2OfpHLlg4
         GOqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788863861; x=1789468661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qekOjTKAbV3bYAHV0cqmxxGdYf6A7xrJOKm4lVlExn4=;
        b=IAnicl7rlAKU3yjnHTisPKcNL3JxjuHAgCUTvxjdNv4ibwUwlYkSFhPfvbHa4BLvZy
         k/tKUoJjHRc8Xl7HiRjmipsx4t4oM/HGr2W9VSeps04lxpaoxllLosvcbnX9TbyGUVqd
         3jLZI3fCRm7rvcU6pSBskK2grqk2iuQZzf9YBtaRdmA8qw9adYuJOzMPQ+6AbNI/jt0G
         24wZ4yHD25X/XjJzWawJMD49HXV/gCSVF9iCE0ao8PJO9WHIj3iHOeIewNXtAjJNMbni
         hsmri90wPNZrrm/EyGFrcpecpIV9/eXRjBUjL+Xmis9AAHDGOoWeN5dgIhYJYV+LyDOk
         51fQ==
X-Forwarded-Encrypted: i=1; AKwUvBwA6uOoBeJOpRPOjzfhhGU9dd0dS8ACMSHO1FUB92JvbifIb7oNzWCreRNeG5hG4gZP3uBrObf5a3vMMhPzSc3m@lists.infradead.org
X-Gm-Message-State: AFuF++m81EJHsjfXzZ6kHK5gvBLD1/zE8KAJjrtgV8QJkdRyjbfFQqVd
	RKdDPcmA/LQ9tYuvfXMjCY5T/nsGLpqYbjO0dRYFMc38/0KBBpP5J32C
X-Gm-Gg: AYBFou2M+um/28qsYxtsqGhEEhXkd04rBIgV9VngO3cngRBJEV15QeceSx+1ao2Rc/S
	K23KCmwHXTRSHxwJrF15jJBKiGUXZ8o/fK7g94W/ocSD9K5je2oNSSdvr8CmA04aRgFzJTOzsDZ
	FUGT6DcQc6ZExnuBnpDQiKg3gblk8jjQ+qPQxDrC5HM4RPMqvl03GZ/pcEz+H8FwGarWautCRTa
	MDiqBwuJlxF/r/OtJ46BQ0BwrK/GgONfu5JSGFcJggWkuzI2+0ennj77hDPP5aHLZ/xovH5Rc8U
	jufmLT9gMrZvgwnR6gKtZJKyVQSjrGwAX/dTRIV6JWj6ERZfGYNEx0BOCS9opdzJz1UQDn2x6Ia
	FjyhVv9YKy+4wHT3a3ApCNE6YdI3N/TTPQ3v3GmD6eXsnHI7cU1K3aCjo/OMGDOrXXmeZ41oCEP
	7cBDFRBh/0bACRuX/I9aDfridT0VJqKjNCMcDwmzekGGHJqzd2iKqYUlYbC5BFV3JQSmq2VowGP
	vHjZMelHbenxjUWmD33VhqP8BC7KZq9Xw2FuWGfcYPUrOGyJjw1
X-Received: by 2002:a17:902:fda5:b0:2d8:d4cf:fe47 with SMTP id d9443c01a7336-2db70292fb6mr58987095ad.13.1788863861471;
        Tue, 08 Sep 2026 03:37:41 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae4b5bsm57362155ad.77.2026.09.08.03.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:37:41 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Tue,  8 Sep 2026 18:37:36 +0800
Message-ID: <20260908103736.236803-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720102222.251179-1-a0987203069@gmail.com>
References: <20260720102222.251179-1-a0987203069@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_113744_490997_684B7D55 
X-CRM114-Status: UNSURE (   9.56  )
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

Gentle ping on this series, it's been about a month since v4 with no
further comments.

Patch 1 (dt-bindings) already carries Krzysztof's Reviewed-by from v3,
unchanged since. Patches 2/3 (arm64 dts, phy driver) haven't had any
review since v1 -- could I get a look, or is something blocking?

Thanks,
Joey

