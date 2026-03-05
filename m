Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCF7F33A85
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 15:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3OmpzvQpYMJXClO5qkjGcMYeXJMiSrkcfp4KTo3+tdE=; b=pZfiagneCmNvocEp+M5/xXGqlt
	ni3r6un/yzXndga/b5iT0lJ4SN1n5L5aelF9XJ6VpB2mJVQZoL+tAfaF1RAMJf8d6JRFWR4weiNpc
	X+Cd939bSa+pFDzOTH1UQzWYem3sQdUuuD2uABmRnZX62elh3s9jS53XJrkHtxgUD3CvHNywMXTHP
	cBTUkOPcSgdC8y5dU2JCZLkz4H5z93x5tU0I3YGc3AEejqYWxtFT9FsaIyE/CDKFBvxG3jv3NdUIU
	G00PUaPvcP7YQQtG07UR3dTK3OPaIwxZ9xyjdijzFIbhAdHz+KXIhCwCoXKfvYcbYaNDQUWl7ilEx
	Bxe0eU8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAKp-000000025eI-0oYa;
	Thu, 05 Mar 2026 15:09:55 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyAKm-000000025ds-2pc9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 15:09:54 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-65faaa8b807so5594068a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 07:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772723390; x=1773328190; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3OmpzvQpYMJXClO5qkjGcMYeXJMiSrkcfp4KTo3+tdE=;
        b=SFp07vmzMApPrrWJpSOztloZvUibv4oHEPzoTLoRAdx4J913+VYdUiWP/+MIp5fO6l
         A0H6YCnMK032l5dr7KNlRWWAjZxfS7gf6VxyP91WZJCDE61UCRxl3hzEGbMVO0SpPrGw
         ezl4CYKgDC9NQCSdZV+MTHZvwJVKOT8OjD82O9LCD6/W8DjvISXU+Ut/xwRKaKNnngId
         8EyhBqsi3g6LKMwNt72UXM9WjbpsfDAf8t7HYBhYn10UyZXqjfVza5zwGhbcyuh/qIUz
         dr926PVVp0gAiRpSoYQsEEE/KYDR+hjWfHwP7BnR7uwc+1cip+U41358ugZOMl/dSwxx
         8lFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772723390; x=1773328190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3OmpzvQpYMJXClO5qkjGcMYeXJMiSrkcfp4KTo3+tdE=;
        b=oLtEtdQFQvPXbp/nU2mus79PuAJKPcu4Lmc84YW/gA7FXraqXonKDRLI+qwQ1Q2sPh
         7d7sZq2o2cwfJb40VQ523eJkRFXIG4naZ3ljDas6qm/V6PH3XIDTGoD9DIkNERWTx2xA
         5XW+AxPw0G7CsqB7qDCrwCiY5Cr30b/Y451WpR+9csIGQpXpfHsSdS/8j6lVKjO1JpUN
         B7+sZEZSIeN3tlxDE3Zne5nkas8ple3Kw0s8NyDsjJHkzvW3JF26W+1x9MkG7Rgt1YdF
         nNigy9eS9VHBYhmnfFxBQZoBREJJ8cvsl9HmjSrYVnOzpYEMXoS7pw1JGOD8Rf85mulX
         2yUw==
X-Forwarded-Encrypted: i=1; AJvYcCVjLHBPDFpwjIlUn/IFYpQZ37OLotbLDek+qlzpREWKj2fEdVeMBfDdii7Tf9QxCelBN6qkmo/CgK7w3Y3yJqeu@lists.infradead.org
X-Gm-Message-State: AOJu0Yykc3g1nozctNm2rTIrA6a3CL7Q8ubP7FwUXoqM6aQzpj3AtKA5
	MOMVtWE8iVuSoUhlzN9R7s4n3D0z+Bg2BYCqcPdjrKy+c4hIvqNXaUhQsxisVYUFw/w=
X-Gm-Gg: ATEYQzwt6zU5H4DBxhxnPVJIgBVTp048s1Lo+2f3yWj195GWwniivy5UMbHMI78TGAW
	sHFGwqpgfHlgX5NKizJ+JjUptd2/wKHE+9CIeaQx7Wfk+G/3VTIaR6R915aEip7BRyyAycD3Dp7
	MI06x4GK7xBZyl0E+mbqoDA0z7ZRgsA5LQTZUVSVq+QbAsOi7TEVWKDHP6JP6KUcTZqf3PFvlkH
	2JSApnsP4mZDHItLnhNT8j7jwH/6TpwHTZOXx3OzYwE1y4uB7Aw7aSOGs4PeACEh+/ILIfXme56
	ZJ2Ew+MeCHcJ66w2m3O4jpd2hbupFaHo5G28t3e/rGNwknCnZF2JjwDhLjbdi1scv6uG1SACQN9
	pEA1FEqyEjVVT5PebOnbn4OseG1o4P4D+CVkfdmduQuHsrAepN6SOUe/01YNfGXl2ftCWHODz0U
	YJD/m3ySXtX6WzLqcuUI90WImhdGym
X-Received: by 2002:a17:907:3f8a:b0:b8f:87a9:27b5 with SMTP id a640c23a62f3a-b93f1432d73mr412111666b.41.1772723390403;
        Thu, 05 Mar 2026 07:09:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b941f016ef9sm26138366b.39.2026.03.05.07.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 07:09:50 -0800 (PST)
Date: Thu, 5 Mar 2026 18:09:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com
Subject: Re: [PATCH] firmware: arm_scmi: Fix NULL dereference on notify error
 path
Message-ID: <aamcu-f14DZNJzw5@stanley.mountain>
References: <20260305131011.541444-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305131011.541444-1-cristian.marussi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_070952_732695_9D195E6C 
X-CRM114-Status: GOOD (  13.04  )
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

On Thu, Mar 05, 2026 at 01:10:11PM +0000, Cristian Marussi wrote:
> Since commit b5daf93b809d1 ("firmware: arm_scmi: Avoid notifier
> registration for unsupported events") the call chains leading to the helper
> __scmi_event_handler_get_ops expect an ERR_PTR to be returned on failure to
> get an handler for the requested event key, while the current helper can
> still return a NULL when no handler could be found or created.
> 
> Fix by forcing an ERR_PTR return value when the handler reference is NULL.
> 
> Fixes: b5daf93b809d1 ("firmware: arm_scmi: Avoid notifier registration for unsupported events")
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

I feel a bit bad about this.  I saw this as a Smatch warning last August
but I somehow marked it as a false positive.  :/

regards,
dan carpenter

