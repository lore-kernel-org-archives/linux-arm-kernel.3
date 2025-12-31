Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 649D5EEB573
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 23:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWy1gXyOOWYNnYUBz6Zo1eDM/lnD8SOnC63pK454g8g=; b=seoUhj4T+dUyalCCTIHlXN/JPO
	/hZBD0sSO2k3TT5cUJHP4Mp4hBHMxCYgiJTZaT/zm7bJZ/LFh9gVHPmUFdfUsFqRNzlOXkNpkqCKF
	BVUDgD1TNA2JUFXPL2aaAIXbqqt6nnjUw+8k5OFqW0jUYS+Y/mZdRsKQJH6pVgFL/ZFp9+VU+gQJV
	faP5fH+4tITYvkWzQgIO2RS1ZTO1Z3HEwzO48slGoltURi/JsbnBq34qHqFbdAzSOAZQE/a5hiJK7
	6ze5RgIL4tqGAS8IG/xtAplnjdw+6KFU3RKwgKpMY+lcPQcj/99nqYSlOrx1ODZ3n9WPh4KIqkNax
	X7TdEK8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb5oi-00000006QWh-2Uhx;
	Wed, 31 Dec 2025 23:41:24 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb5of-00000006QWC-1go5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 23:41:22 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7aa2170adf9so8241504b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 15:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767224480; x=1767829280; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BWy1gXyOOWYNnYUBz6Zo1eDM/lnD8SOnC63pK454g8g=;
        b=D023eVkgXGZvGe7+Dd1MgrrU7qc7q6WKNI7J0O1V9DSs8OqCNY2eaXsqRHSiaotX01
         Jjik1kVonjwTwgoR+jaw9RJC6yD+Z1WzW8cGzBUNTKBJD5vOgHC0Zd7u9+37vbP0qHFU
         ImzrjsprBX6gQclYsUNYv5+d91Rdr9s3k8Zeth8shxYMqDNf4MTCsxRWNpxw7/m2Q8Jx
         Xsw2mwyEa69ZCzcj6L25KnNmm8gMAvf42ekC75KLTRiL/Wlm3QNNV0uhnmVk2jOu4pFN
         lMZJcPfx5c0OMS4cLCVE7/cv5bqRIKcgs/HiM0KQrU3Yf0fEGWvcSWLHcB8wpgWUjAGk
         EI7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767224480; x=1767829280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BWy1gXyOOWYNnYUBz6Zo1eDM/lnD8SOnC63pK454g8g=;
        b=cU/+v4XkRZNdvlbHLjfP1ad2AWR9rqHVlOR8JqTe2TQIAjNwFxICtEp9pkTCSaQiBG
         WJzWM+HUxWIxdavLPqvH7ftJbpT0mwbuuQxpuS6lWW1UURv74EBlbpRmG4jxB56PKEIw
         NDbPNDq/5pEr8wN2mjKZVaV16k4nOXPfUuEgCmWPAvhYYUz+FVch7z5DCJ/1a8H0XnTM
         IU4Sc5Qg3nMEF2Xm/j+HEEtJCE8vcRHHxyDhNDLwwCADn7oRsSQlijHN8pPWwq7bqjAw
         MxjtEM7/vYhp32dis2rGRVYI9HpOIkxCYMKhU9M+SMXSlxN8E6fX1bVx7BVMIP7yDn9i
         RbZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAo3s8uJ2WftYhmAkQzRAFPilYAqvauhxcKPHXeEU+vdFVmEYpZAupTrKgGYaIXGk6D2kcXVVOX4LbzWPBaId/@lists.infradead.org
X-Gm-Message-State: AOJu0YxcNF52xU860gPlWjxAx+4mMf645qP2lHvnk2vvCiqsCXdqM4Dx
	q2R7ky7nYgelQrSrvwa9ik4dSRbzT9MO1BqhGzHIjiGII/5OlgeQNsrOefQj+Q==
X-Gm-Gg: AY/fxX7tqMlPbmacDo2TRr7M2r7y7d8wEGXu978kh+t6cFfh5X1S0etrUpY4VaDyT34
	Rj+GOUF6VrT7Fjqz/KZlYk1+d3evHkqAtjN7JlYQAvMN1tl51KzdSuntLWCL3NpSs0jP6s+TvqY
	ZetW9nG0+gad6oU0L6LPQ/3zF0Z9TPzmZXpoYUuXiUisZ9WsMZ8qwfMz3aBFd/qrKCuCeLYsUdC
	npHc4yJcDX/JuTgkmxExinB342XUpCYZZTyvSt64Mn7SJuHLw+MurzBHKXoodfWNA1Tr0TPaBeE
	XoBzwl75/vK0q5pBr2g/nV/nwJfbvwVRR/t3I0XqIiney/lb05s03dMcsHMPryeka9g3PG9jr3b
	/bj5GxeeUzkewtniBdbqiB1aVLh2NjFw9RzQkxOyt46NNmsQBXxMd6au+IuAzplgFnzWPzxQfPv
	hAOTkJJ3/5diAKQ2QyM7IECqsk
X-Google-Smtp-Source: AGHT+IHdS1XCFIF/s+R2MzEjCr3KsXQm81WSnRd7sNkVOMb7Y4hp3EFixXPpBvYYArS7H/0Gwn6dbQ==
X-Received: by 2002:a05:7022:3b8d:b0:119:e55a:9bfa with SMTP id a92af1059eb24-121722b46d6mr35420452c88.22.1767224480383;
        Wed, 31 Dec 2025 15:41:20 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c058sm143562327c88.11.2025.12.31.15.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 15:41:19 -0800 (PST)
Date: Wed, 31 Dec 2025 15:41:18 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nandor Han <nandor.han@gehealthcare.com>
Cc: wim@linux-watchdog.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] watchdog: imx2_wdt: Allow to continue in low power
 mode
Message-ID: <ee2771f2-539d-4bb2-adc1-663e39488148@roeck-us.net>
References: <20251229145000.421426-1-nandor.han@gehealthcare.com>
 <20251229145000.421426-2-nandor.han@gehealthcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229145000.421426-2-nandor.han@gehealthcare.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_154121_464549_B659F89A 
X-CRM114-Status: GOOD (  11.21  )
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

On Mon, Dec 29, 2025 at 04:49:59PM +0200, Nandor Han wrote:
> By default, the driver suspends the watchdog in low power modes (STOP
> and DOZE). In some situations this is not desired.

Following up on Krzysztof's comment to the devicetree patch:
Assuming the watchdog is in low power mode while the system is
suspended, it is all but impossible to imagine what those situations
might be. A reset by watchdog after the system is suspended simply
does not make sense. A system which must not go into suspend mode
must not be permitted to go into suspend mode to start with, or in
other words suspend mode must not be enabled to start with on such
systems.

Guenter

