Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C688EA4E18
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PJQJNNM+4DO9CQxRQrJTKsiJbgSUIZ685yVxcgsm7ic=; b=jgRpaguOtqhgGJi0vOGXZ6X+Wd
	Dhxsbrm/YlT/Vcimd6sBAE9GyjoCrljHWh12SSDJnaN9Rcc2vN7LsYCIuX9vX40EnXJSULqi7GwfY
	S6RqLaOww0faPGsW1oJjAVTVOqyUB3RO9yqrgP1AvUWCDw5TI85OHr4SlJYxArVZa3hRlFA+PbDWv
	E0MKNHWk+0r5kiPs72EmjqQWf7gb8Q8uWUQ8NP8kXHriDpeuWoBrPhOeGuxgqqXEbkLaRFnsOo6kh
	CXzKELz9IBeUmnZnWCVVGpGPACIYzQlWZM1fWhgLIrJjOeXNoqGli/+bl3lnIKCiMXu5Mvzrb484/
	p+Rdsr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4pF-0000000DIfT-37AO;
	Mon, 02 Mar 2026 15:04:49 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4pE-0000000DIf8-0iNu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:04:49 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2bdecd00ebdso7501796eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 07:04:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772463887; x=1773068687; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJQJNNM+4DO9CQxRQrJTKsiJbgSUIZ685yVxcgsm7ic=;
        b=EYSa8kUhWexxfw9ofqYIulC5EqlRzQ0m8y9bn5E+msV1bNduiIKKQpzQ6MLf6KVnk0
         Js4+3c/ETSob//35FsljpEND+3slKFLyUGjVQLn/kY4yVI0DeffHFalIUtK9sYeoSk69
         ZB6Dtei+Vr2tKT+mhnj+unu6IrM+KDlkMlH/VNVQ6ocBCk6wwcvSGsHNSPh83daMiofD
         JFfSjKBzzz3sZ0a9WF4X46nAeVBYX0WBbGDSH8jMEhrib1ON7NXsVm3f3hmlMouqfRRe
         c36bnYwO/teyV6Bp3QvzWjXaiamL9FIpxhuwv3Taaslhk4lTJaa0FM/Bx5lDpm7AfXOS
         LG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772463887; x=1773068687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PJQJNNM+4DO9CQxRQrJTKsiJbgSUIZ685yVxcgsm7ic=;
        b=XtnPuU91q58zbLwXv15RRommaz7QnhmIYnbUuV3KUlbqHAlVd4BESs4eqS9vnbnKcQ
         NF1Akj24CkbUyWle0DxxtXCMdqk35bSA5VHxHCuqF1ZghV03HWPslwTOf7wLWT9jIN68
         jlz+uHB43RIdrZpHaBc8ll2ixgs9iB+JvsUBmDkJ0bOfVsG+bXJZDjloNvoGX5/KL8zs
         xqJWwdhlm45JvCeH6zQONjRKBnOZMSm8wU35eXRiLP3VXXDWe9F/dz/R4z/+v6ccg6K4
         KTvLwWKg5lcmK97TTreT1wink7GOj/+ekpy1UuLAdanUzQqyg1p0vAZQYFPzjIT//cxb
         gBUg==
X-Forwarded-Encrypted: i=1; AJvYcCUmRsYdnX1hlarTof0f4/7EUYSUZo9nsc2g+qMAN5GZcTH1oxtfxmhHGlAv8lR5qYXrL5KLJf20hhbJigrLVh61@lists.infradead.org
X-Gm-Message-State: AOJu0YzXYevFe3WpVJmGKKKwvl9Un5kG/8eo4MK95f5XwdM5Su47SM7Z
	63AcxjIU6cPYV2LwAfoy38h6X70MllXaGpUKnKRCpp8yGwTL2t9kQB/m
X-Gm-Gg: ATEYQzwg+HzMTerLcYTrzcsMCc7o/Qxm+AzKXg0Jns6A/VYM0PgWLl33MHrgj7zLji0
	G7aZx0qkdGXk32dQjiKwXZbf93CMFiAkoJQmMS4ZJGTnX4RcVAqHwQ8M3kv7Hs98+lc4520Muut
	wPHVINc0mV/NOB5OgjWuOXy9Gq7cylX3beEnFWQ/Yo1p25VgtQn12Pz5TXvqGSw6JTzV2xQaB7l
	IiQRU8ZjXUWApqKtqOUipOa2YBPBbv65HKfHguVoIk7tlp+eHgcRV/U5mMIXg2E7drOXrTHW9IL
	K7PjoDgrNjNSEaIUH3HbMfuXKchAZUe6erDS4yyLfvEuAJE/DTpga5qjBk06O1XrBi6UQ+pLoN6
	UFIGdhkOyZR7e9bvYfb+lDb4VFtzJycOM5Dqs20ghcBczel/ciXOvXfFQ+l+Ymm0Cy3f/td7hfg
	8V3X6M1b2DLTeIHelRs/fNSdCLjCpWC4gaw8ZB
X-Received: by 2002:a05:7300:f194:b0:2be:142f:d48a with SMTP id 5a478bee46e88-2be142fd895mr1194048eec.27.1772463886899;
        Mon, 02 Mar 2026 07:04:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1f23c01sm10987949eec.16.2026.03.02.07.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:04:46 -0800 (PST)
Date: Mon, 2 Mar 2026 07:04:45 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <mwalle@kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 7/7] dt-bindings: hwmon: sl28cpld: Drop sa67mcu
 compatible
Message-ID: <917915df-3a4a-4cc0-b41f-106b5933db20@roeck-us.net>
References: <20260302122540.1377444-1-mwalle@kernel.org>
 <20260302122540.1377444-8-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302122540.1377444-8-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_070448_350782_235E33CC 
X-CRM114-Status: GOOD (  10.25  )
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

On Mon, Mar 02, 2026 at 01:24:52PM +0100, Michael Walle wrote:
> I was just informed that this product is discontinued (without being
> ever released to the market). Pull the plug and let's not waste any more
> maintainers time and revert commit 0f6eae86e626 ("dt-bindings: hwmon:
> sl28cpld: add sa67mcu compatible").
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Applied.

Guenter

