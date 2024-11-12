Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E41D2D42BB5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 17:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5c6OWgQF/ejcqVQp7h08DgprnfycsFPIP9B8O7D4XkA=; b=Sp+8guFyewmQZEeFp1cfF+OJYv
	h4CzBx1AeTowS5j7p9NsqZqyXE5x9aTcB7zsDGlyaSh3FDHBaMSYWnQoihPqvT3nTDeM31FwYgT+I
	7+xIDAPjvyvCOB8VvHk+W7WrCQqlAD6KTLH3NGHqLZaRt0q/TgCYcM9linXWRhTnZHj3J8MUkmYZS
	IH7bw43BquyVfO4eo5ooPqp/sNSxsrChnNG8kvucBOXQbRN5X+q2Tj1d4hYfAY01TWaiblH8ZtvY8
	nnNXQN4+LrYu/B05ecVraeQVVpDJ5HsTs2ic+9l5uOojJjQ6odq1b3AXOPhZvk7evIXsYMe+10sO3
	4YQws39g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAupq-00000004Ogg-3fKp;
	Tue, 12 Nov 2024 17:37:50 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuQG-00000004Iub-0Tl0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 17:11:25 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-720e94d36c8so5887878b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 09:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731431482; x=1732036282; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5c6OWgQF/ejcqVQp7h08DgprnfycsFPIP9B8O7D4XkA=;
        b=JbhY7AnqM0qeOGQ8+haVdCHchXusfSi7c1cO+ehLucl8CvGDDXBQKKGoWqqnFYNFmI
         olvGxiqTrPVGxQpwj56OkMQ/MVFr3HPr3rKoWNFtgf4lomCmht7TkVCbGpnybtahMdwa
         QOrMSrw4I7jUK6/tqwi9q6rZVAqJWiDSCIvOhI6/Vr6MqkbQQedxN4vHUIUNglDtkU8w
         eXZOney5TQ9O0qo9FD0WHWTFP7v9xTCutrMhk+NKpPKoo3uMqSb44t+mcsixAIuAMUkD
         hMzrlQ/5dbwJzxLB8IiCUTUnPgH4Jdp02yz8vrgZ1dR9xeVBPgECfWpU7KRJlHthgBnW
         t2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731431482; x=1732036282;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5c6OWgQF/ejcqVQp7h08DgprnfycsFPIP9B8O7D4XkA=;
        b=sRAPJFZscELwElU+GjDADTNwL1rXm2tI22su1gNFDV1Yc9JB6X1qdiEaThgRm5qp1D
         HFxZpWPUur9mtE1/uqJ0PLKVFxUQLm0SQfvTdcqktjXe2rmqH9eyevcUzTMbkUYCUYI+
         a+HvKugKXzCkfqOWpyeh+tCFHTbcrS/jsCOHibtd4d9Ge+bci46EaFQ6vTMYUjfHW3ER
         g/NtL6qoJGg4dsxor5lXdQQEHjFeUbGnt0o914eQHgTgYUSG4w03im4jcHNFnE4W3/K7
         LPCkK6p+0rekD7KQdAQc1821SXYe0SKeZC203erSYRTYVSjIKUiI9XfL80HrTAgmSfJz
         NXMg==
X-Forwarded-Encrypted: i=1; AJvYcCXB285ckiMWnYM3a/jdIU/uOsh1nnfEvISOg3sF7bonk1mwnB6QmPGjjpWYSZMvrJRARbvjwDDIOxO9WRvWVz6R@lists.infradead.org
X-Gm-Message-State: AOJu0YyfShEw9ZoteKthMBsZ70M6+ebUZHhm7HO8bZBAE1R6VYlqzJQ3
	pJZX1zIAZgI2LpQ4sD8O3zHMaynaZZdms+FaCFsBmOzcysAoblTQ
X-Google-Smtp-Source: AGHT+IEB0XmDsy3B10i2uTRC8VzGGRmiDyjY6Ju3LHYSB2QDsh3LoZZxlsq6FBHih7bSCohEPX+QNw==
X-Received: by 2002:a05:6a20:3944:b0:1d9:19bc:9085 with SMTP id adf61e73a8af0-1dc234afb33mr26913887637.14.1731431482453;
        Tue, 12 Nov 2024 09:11:22 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a189e3sm11424545b3a.136.2024.11.12.09.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 09:11:21 -0800 (PST)
Date: Tue, 12 Nov 2024 09:11:20 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 2/3] hwmon: tmp108: Add support for I3C device
Message-ID: <860c243a-f6db-44dd-bbba-d4c01dc7f9ac@roeck-us.net>
References: <20241112-p3t1085-v4-0-a1334314b1e6@nxp.com>
 <20241112-p3t1085-v4-2-a1334314b1e6@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112-p3t1085-v4-2-a1334314b1e6@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_091124_336857_AF7AC4B1 
X-CRM114-Status: GOOD (  11.16  )
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

On Tue, Nov 12, 2024 at 11:52:00AM -0500, Frank Li wrote:
> Add support for I3C device in the tmp108 driver to handle the P3T1085
> sensor. Register the I3C device driver to enable I3C functionality for the
> sensor.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied.

Thanks,
Guenter

