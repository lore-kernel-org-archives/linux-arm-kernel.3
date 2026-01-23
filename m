Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62317D778AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 19:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:In-Reply-To:References:From:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRzQmM1lz2CLbIKhXyUz8czg2mNynwC1/VV/UsQgqnQ=; b=SPK+wUVPe6xdi5/ccTuXRPCPcx
	4Z26tVf7Dov1EihRdodocrGXRG8zro3gx909nOyMkdop3SimcHyRwwkh8KhmmP5fFI+AAQgZvz8nw
	/Myh5Rqw6aHN9LxUjsRsdWaaouLiA0ddh+8JrKpmcB6swIs+W/I0kUFetTjqVGgIJwcjY+JxtQF7f
	UwaqH52LmEmuObf8gbTYKnWfMDxLHwPrLVZ+U0+DtuLM7pxcSS9HJUB39PWBHFTZ5wBy0XOIzZDr7
	5BeoGD72K0O6Q1s46E6+aPfjKyXoKNoi0wvg4DiJAiP4YPUtRw7+T4KayJHk2cOm7ncrUh+HNSm3f
	LEdjN3PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjNGS-00000009Rlq-2nug;
	Fri, 23 Jan 2026 19:56:16 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjNGP-00000009RlR-2VA5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 19:56:15 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-78fba1a1b1eso43471007b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 11:56:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769198172; cv=none;
        d=google.com; s=arc-20240605;
        b=gJXODvxAF2bbf32PiZeKmyZrgEZ2nS7YUEtiWP0LS7JdkQsm2h3YiWSWlW/9EwFthd
         +XKw3VFvIcXZ/pjhzMv1vvBayCBFuQnb6Dr2LrgcUhsJJhETmmu5mWI87vaNmJElat2A
         Sqivw35r1g3YEV2st8hXZ8NMXkFjbBZipqo0psp0asbrXGqzSuD+G0/q0VIy4Lt6T+bs
         cm1UnWCxO3fe2Y1nxHRTM3yHqKtH6IDhiOhl2CoRnShCBeGNjXR3dhY1unqEepfjQA6Z
         c6H+Lc15rax4l0GJ/6QW+nJVgd/X5yQl39jfg0+eLMKR4zrmRdYbdxSFMPG57+MPPrYz
         Byyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:references:from
         :mime-version:dkim-signature;
        bh=pRzQmM1lz2CLbIKhXyUz8czg2mNynwC1/VV/UsQgqnQ=;
        fh=ZQDm2xrLg7oO0MEJrLNkeOdRRr+xpYxsKbuZEdzlRbg=;
        b=iS9RhQjG/xFp6lx6jmCLnVFSJX4NpbEVAksDqufBghcnAF19Con5egv2hCGZI59NAy
         xNNQ22KzTF2GMXS9W20LKnA9LDyRJF9Na4rQrSNMyjXCdE+WrB0soM98Dha+W3W9duZA
         ZTa2SLdGnt7CwJcMRNNzcWcrZFoxTxRE1C4RTntamw1FTFgexTgd2InoMhI6SoU4qcQW
         b+S6aM4Ms6lux941fWX6K8OHoMBgo9E6lYS98MjCrIvgj+xIgGFeXUB0eWFg+KzBbTTO
         Db9Dzm/+aujR/uOQGBPUfzMQKyjgHHWoxu2NURB7W8Uo3/9TJsA5Alt4VWQjezrb1z4i
         5IuA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1769198172; x=1769802972; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:in-reply-to:references:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pRzQmM1lz2CLbIKhXyUz8czg2mNynwC1/VV/UsQgqnQ=;
        b=b+jVvYoFEBrzPEIzbn39cXTf6T+7ZyaUCzUlf0T2xNUjuB/Oh0YlD0qnrrHI99qzuq
         Z7YWpSMplf+tWmOfLdKWchiu72Sg+Es+JPncngc+tVjfp8y5AIPfYAsitcyQ1jrLfLzc
         CN9uPL5dgX8FwAwxg1bmMD5LJj2Sf4YYa0AG0NA6zTnXUzocaNOeyig6hTcKKJmhHR3z
         OswUQZQW7fbC1HdBmL8pY0p6PlYaH4U6EAQ9qip3FP7zSMEqKRUMPOmrmLB3KS8BImZ2
         fsipvRJzseq+lfYtn6vvSGU+Di1kvthyBe8qulmG/BYDvYEzIzZb7Z5ugdXU6tzam2Sn
         0g6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769198172; x=1769802972;
        h=cc:to:subject:message-id:date:in-reply-to:references:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRzQmM1lz2CLbIKhXyUz8czg2mNynwC1/VV/UsQgqnQ=;
        b=ZQoi1oZeGwJRU4BUEoyZBd3ZstnInZE+z87iZ418OMXz5e+Y65RoSntrlDbUr24fJl
         R+THnNLjuSsAhtUce9OcB3ZgHZ2rB2xxip6F68MMOfiqv3/VcNkBb/x4fa1Cm0S8nABu
         7o8CMNt3Ly+gDwJaANQuA4Few/ObeIoWdVIFKWW0ukM7AJxE/3SGTn39MGhxi3GsCRQp
         YWlav7wCweqSBKPFqFNDQhtjJ7RFP6U1lqmtIXWurlN91+qPhrjaozfLE7oaIiwIEa+J
         IfNp4FLOkHT3GN2J5U7aJ0mhGL0fjDmb4IYQ81GEEQ3wUFo8cI0hxOZymzWuJCalRZNe
         rpqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBsuRD93ebo10GmUuMw9TVToM6y2zYDSrBMfSPqVRzr3fqZmNWtDRY4CgRom3HY6jnR1MLFT4QPCtBF3pplHTq@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6boWxZIXgjhecxpjCuphS0u5UOVElyAMZk0W4v60QgRWSXQrd
	tlpLT+nFt9Q5DLmeeYPg51gLuJPivOKC+DM2D+qI9B7jqYLRWB8zFA3vgx+26M/l9yHKiMswnpv
	tCIokffqsvZBzD8LRbBIBSO6lMUjQgcqk3b9rTgeTkQ==
X-Gm-Gg: AZuq6aKPmwG90V/5qLbKUKT17MKw9qiCL2cq90fTx/K6BqM1JX9Q5tkm7Y3Hgk6q9GY
	wXIiEI63nEFre23chRN+eb8/d7SbV7UVUsKxPcdULaV2+kD0/KbDAj9Gv7zEoO45Hn6guC1kg9F
	RgOr7PKJkI4graGYcmwqZx8H0Qy7XqLEo4jnLkKyPks/gUgkhDzXd4RvF8Q540bVasVDD1TjD1G
	/OXek7YwsLv9x5hWacevtDe2ymNluPAk0JBWCQmjCOmiyzovqni5Q7enkz4ssCT2RAZdaoM
X-Received: by 2002:a05:690c:6c91:b0:787:badd:4f with SMTP id
 00721157ae682-7942a82216emr57835217b3.17.1769198171795; Fri, 23 Jan 2026
 11:56:11 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Jan 2026 11:56:10 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 23 Jan 2026 11:56:10 -0800
Mime-Version: 1.0
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: aerc 0.21.0
References: <20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai>
 <20260123-i2c-xiic-v3-1-eb7cd4254dfb@nexthop.ai> <df9e1a39-3928-491a-920f-fd45120d8024@lunn.ch>
In-Reply-To: <df9e1a39-3928-491a-920f-fd45120d8024@lunn.ch>
Date: Fri, 23 Jan 2026 11:56:10 -0800
X-Gm-Features: AZwV_QhUfRUwIxUyrcfux8-cCvxAaxEfux0jZWXnZ-3_tfujqzHxVqC7g82XeGk
Message-ID: <CAGYn4vw55SPn4vKuYwM1nTgpzdExtEuv1H3JNkx0XngBd6mjYg@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] i2c: xiic: make the clock optional
To: Andrew Lunn <andrew@lunn.ch>, abdurrahman@nexthop.ai
Cc: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_115613_673661_7E4CCE13 
X-CRM114-Status: GOOD (  10.59  )
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

On Fri Jan 23, 2026 at 7:20 PM UTC, Andrew Lunn wrote:
> On Fri, Jan 23, 2026 at 08:02:44AM +0000, Abdurrahman Hussain via B4 Relay wrote:
>> From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>>
>> The xiic driver is designed to operate without explicit clock configuration
>> when clocks are not specified in the firmware. This functionality is
>> already implemented in xiic_setclk(), which performs an early return when
>> either i2c_clk or input_clk are zero:
>>
>> This condition is satisfied when clocks are missing, as clk_get_rate(NULL)
>> returns zero, allowing the driver to rely on hardware-configured timing.
>
> https://elixir.bootlin.com/linux/v6.18.6/source/Documentation/devicetree/bindings/i2c/xlnx,xps-iic-2.00.a.yaml#L42
>
> The binding indicates the clock is required. You need to update the
> binding to match the code.
>
> 	Andrew

Absolutely! Let me take care of it in v5. Will add the doc change before the
code changes.

Abdurrahman

