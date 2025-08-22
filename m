Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B076ECA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S420RL60CZZdB1VzGp1TEQ2bkpwHaqIWzRVn6C44bUk=; b=j9dfCMTQck9MzHGeV0oB7r9Oe6
	FDfOCwxTggIENrBNItuGE2zuKG2RWZT3SoOq7wupmF5uT433BTodYObGbSsrLJoQxArGaGN/tU1KS
	VzAAv5tlfxlVHvBD4vDiyetGVOWaaxeP+YAsqN3UkzN1tVO3d0XBROj097KTzL9GybCyv4SSnuHqZ
	CjaU2D5MMA3UngD+iHwnjiCnNwGua8bWDzdZckqjfgeIe5ajfsNgudKj+9BmooeWUGOPpM9f9+zH6
	51G58nhqYJoZw8B5QyB9iIzTFWV70uK7kkNszZNJ0vfXU69Em/SVj963vAU8l2/NGMCBFaNDa7dMy
	9hzm9+RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphpd-000000044PI-2vp4;
	Sat, 23 Aug 2025 06:34:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRmv-00000002cWu-0hh9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755869195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=S420RL60CZZdB1VzGp1TEQ2bkpwHaqIWzRVn6C44bUk=;
	b=SNHiryKhrs4yOH1sRJC6zLERBlUPXS6GHM78r2u+YoqdAI01rya6s9rQAwKI5nvMCzLQfQ
	q0b9EjJbRCmXtGakWfyAra8lv1IOnHL4Z1g0VqTkTAF5y/bggQxJR95hXtbxKr9sHBNBD7
	5QyMrO7f/qqFIa6KWeMPqeO/GPJqjvc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-zRpJFLx-NG6qlHRQxLVn0w-1; Fri, 22 Aug 2025 09:26:34 -0400
X-MC-Unique: zRpJFLx-NG6qlHRQxLVn0w-1
X-Mimecast-MFC-AGG-ID: zRpJFLx-NG6qlHRQxLVn0w_1755869194
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b28434045aso85051991cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 06:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869194; x=1756473994;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S420RL60CZZdB1VzGp1TEQ2bkpwHaqIWzRVn6C44bUk=;
        b=XRb5myT3S6/D4A+xUWH++CH9Mc1OubanzyhGNy9zBInsSOG4LU3f2/rMBKSupnu1Cc
         yXQ5CUNDKISGuzV/mo0gb3yNeiViSLfNx/bHbQH0fBtSBeU9Z4S4S0vqprvPA48buQwL
         EuLqxH5rXMuXk3cXU9LlADJjD+lmhYBSDIBrA7Pp2fkUaELa6C3GKPvdz+cDNQpuNGYu
         qDNnW24aikiBtSfsauHn+TcpQHmwxyPwrJyW82DUlBtbYXPzaruuZZ5njLjjt/Uc6DC5
         6dAba2q90/Mq4nlL5wuoB2wPMBhYVvlYwGnTvKqJ6xj7MM1XymMx8xisL+zPCUOytTAS
         c0iw==
X-Forwarded-Encrypted: i=1; AJvYcCUDyITn0ULhqvPgATLdx9X6boyHoM0hsQ3pTaelHQT4n9d5hTYF+Ge8WSB4qihbn5XlFZrXpFQFe8/fEIoim7gJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwteDsHGVtrllsYthx1SyooYUt2YkRdiIbnFkQV5oxT6xUhJGaJ
	oa3BNcKrIQYyGJf++aHOHsAzKIrN0hdwXigfySEs6pE3SpmjHEZQXPv3OIWy0Ixz09i5SHOB1AX
	IfJ8f9SdB305cQKbshIvdr5hkMqc8vSxaoj31sMmIIEsAuopt7ntDlf3wWOj2kmG6rGJs4IwT+X
	sO
X-Gm-Gg: ASbGncucRDuNwx+DI1m9Sdnhyyq6Pz8vagbvdH4yhYwI788AwJciAjSlIgi5QtWtMx9
	oTQQ/fmnTRitQWRQNNE0X3VBrU/DS4kgASYbxgH8i1sRPMWIPomF5ivIg1PZMGfUqhvOKG5cPbG
	lnHXCiBJhH7+IaacDsUyvyLKkBAnb6lehR2rXhcn6zZQqhnRqCRe9AqeWD+EcHv+sUwauDSRib4
	tUg9x2ojE41qGJ25+VWtjPF2sH4V878nln0q9Fx17mOSHqjkvVX8WjaBBMHTKe8XC0YGHijFEvZ
	6wuzxqTRiasCxQ8LCICupcdW6dzTFASLw+AaZq42UF5cM9dsT7npKXkEnV808VV//gg6aTmFrwZ
	1sw3K7hH2LRkW1xnvr1k=
X-Received: by 2002:a05:622a:1f10:b0:4ae:b1c9:85ff with SMTP id d75a77b69052e-4b2aaa7dfe9mr37005151cf.2.1755869193844;
        Fri, 22 Aug 2025 06:26:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHUHzR1DMxxA6MQlfrHhbtm3IrPOrR8xfmuEXbXSQpLFypKCHoC/yBGvnM/QYtIjFKFdfpwA==
X-Received: by 2002:a05:622a:1f10:b0:4ae:b1c9:85ff with SMTP id d75a77b69052e-4b2aaa7dfe9mr37004721cf.2.1755869193335;
        Fri, 22 Aug 2025 06:26:33 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11de15ebcsm120303891cf.46.2025.08.22.06.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:26:32 -0700 (PDT)
Date: Fri, 22 Aug 2025 09:26:31 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] clk: Sort include statements
Message-ID: <aKhwBxLdOH7R73BJ@x1>
References: <20250814035317.4112336-1-wenst@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20250814035317.4112336-1-wenst@chromium.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I4GKv95EeYJwQR0YIOo-Wo-YMNqigA7TplHcjhDnNKc_1755869194
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_062637_273049_E0582270 
X-CRM114-Status: GOOD (  15.65  )
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

On Thu, Aug 14, 2025 at 11:53:15AM +0800, Chen-Yu Tsai wrote:
> The clk core has its include statements in some random order.
> 
> Clean it up before we add more.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/clk/clk.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index b821b2cdb155..2eb63d610cbb 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -6,21 +6,21 @@
>   * Standard functionality for the common clock API.  See Documentation/driver-api/clk.rst
>   */
>  
> +#include <linux/clk/clk-conf.h>
> +#include <linux/clkdev.h>
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
> -#include <linux/clk/clk-conf.h>
> -#include <linux/module.h>
> -#include <linux/mutex.h>
> -#include <linux/spinlock.h>
> +#include <linux/device.h>
>  #include <linux/err.h>
> +#include <linux/init.h>
>  #include <linux/list.h>
> -#include <linux/slab.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
>  #include <linux/of.h>
> -#include <linux/device.h>
> -#include <linux/init.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/sched.h>
> -#include <linux/clkdev.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>

Reviewed-by: Brian Masney <bmasney@redhat.com>

Just a note that vim will sort the four linux/clk* includes at the top
slightly differently, however I like what you have better.


