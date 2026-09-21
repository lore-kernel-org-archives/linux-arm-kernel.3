Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B04C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 18:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BaAO/JTedLrIStDBlrZRjwux1WdgbCnv3+4CtQ+5po=; b=dKt5w/TH7ylvaDgSFjpfYk5wJb
	LQAJ2uOptMJGHhoTDwdHE8d2KrZrlsSSOy1YBCSi/5DWJTUPOzJuKckq7H18Xz2jNUi89D9mFQCHt
	AF5+I54ODYhncZeeYudEs5IazOoPRPIvAsXQ/lFE9MqMApdoUtZyeEaW3wMiis46eMSTtXKrTFR24
	rUAOGR1tcgvSDfd0Ny1UvySrrMr/iVLSs7MQOc3BvNA/vZetSyVeOKxdLb1Wpvgl6SA5TDZoOKfcZ
	J4JFZmv2f3G5/+EU+oyYY2dOIdffJZXhu9yyRXJYdkvy1pfK2XyVudktLlvxHjHieS71EY6R+UjZx
	Kp4fP8GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ioN-0000000384L-0PhG;
	Mon, 21 Sep 2026 18:32:19 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ioK-0000000383x-3f89
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 18:32:17 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2dd77300825so34317165ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 11:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1790015536; x=1790620336; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8BaAO/JTedLrIStDBlrZRjwux1WdgbCnv3+4CtQ+5po=;
        b=VzlFUnHtgpRCHbOsKXpHq6JFY2CLqxF2xLIpBlAiPluMKtuvFVCXru4dn95CQ4A2EZ
         m0IY4WyOvNp4D7KMnQHoXbz5LVusTBExspT1Dd2fJ4/V818bpMguQJM6v+m1J4OzJhxl
         Pa//9fI70eEB5ad56r9oPfQLPH0IGeY9Nzgp+OPJM/ba/San/j8EebjT1BgctueVXcbn
         6f4C0EuBHtWBKlQs5xoFlEb/NPdOZvwHv6Qk1t8YbQ6B++qZ49ypvfc74Zx+bbDQyKyU
         bydi+iXdoXysq7O5wOUgbVrAXstgtsKwmBIqU/ZtiOPcxZ51XUOeXnU3Uwf8D1y9W0+X
         1X5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015536; x=1790620336;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8BaAO/JTedLrIStDBlrZRjwux1WdgbCnv3+4CtQ+5po=;
        b=FA2d5DQyfBYcK/JDh4CB6cLNDFyhK/QMY3ebeb4YffZbW+YJk52RKwv0VXx4xMhFuN
         kvNHnt8cOYX4nxWuAuMpRdZAAoQCDXr9x+4HlRof0T6GZjZkT7aNdXf2XlhzZNySgdV5
         +MxjXyU24+oi8DD157m+FeDx+4F0EyefV5V9RVIXJjAALQ3N8Z5jkJrYW4oPOSeqdz5c
         zwWnsw1i4AhcnR1zZu6rcbmLrI2nHCIiF1kceLuxDSKEq2y+rR7hjY2wuJVIlTA/LGbc
         muB1KO6lo/rafHTOzUiQAxYnuRFiTj7M+2n9W4Cy3WKAyacnMAugZI/QKggH1pBVfEtg
         +21w==
X-Forwarded-Encrypted: i=1; AKwUvByE7cUrsa8HJgJFWFQ2jmYdkPpeuVNVumjF4dlZOx7L/GJqTgrUoWEVbSqJcvibeacfdUFHq28PnGvRhk4zscLr@lists.infradead.org
X-Gm-Message-State: AFuF++mZpJC3bEZvJmenwyy7yRWTmjWM08oby+767nIQEh4h27pFm1Fw
	+CJcd76uvBUoQ3OmhxWTlrCepGpkZsJ+/uYm6z6gtL6Z8FQ2uQo0N+u8GHdG4RcjUQI=
X-Gm-Gg: AYBFou2HDFxN4CvA54sCEthcam1/W2N1xHmoeuGbT+Oh5OSgCKJLYv0hxS9G0S90773
	auKjKRllL7BVFMrGyx3p4WNP2fML0tSaktZgegTru/q6xpYTqwExPcyfuhutIlIUkluD0jHNSNQ
	Yht5Tig9Oy1eGrnGBZbF52fCAqCR++JP1nJvZs1yioBneAK0o3xxAqVXW5S6xB9hYtdMTq7SI7v
	LxCD2N0H00ZwD8vPZ3vAO4rQZG/65vyv12kKBwnrpGVyfE8cSnN0Au9lAU4cf54KHJVd65riNQi
	DBaqhghoX4p07LllqUPma9F414UmYLL5+I1kYnlrKpB0/pPV0dyLd2O+k004xWMjXA+fFZ6vKAC
	gq2omBbWDBbtqPzCENtqNH+JZWU5TSqVXovQmPr43Mz7cH2StTgbB1QinHHkLI5s05JowLzecSF
	zfNvIw7z6P+APJrPnotuPxi9yYJrTQpX0ePsTwZAHom93RTkfBhx7c9gjxuBHamA1YdMHEgH4=
X-Received: by 2002:a17:90b:3a43:b0:39e:6c68:c778 with SMTP id 98e67ed59e1d1-39e6c68ca12mr11774403a91.46.1790015535822;
        Mon, 21 Sep 2026 11:32:15 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144da432647sm32883863c88.5.2026.09.21.11.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 11:32:15 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 11:32:13 -0700
Message-Id: <DLL7JS0LKL6X.1F7SU76VO5XVK@nexthop.ai>
Subject: Re: [PATCH v7] i2c: xiic: restore non-managed runtime PM to fix clk
 WARN flood
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Cc: "Michal Simek" <michal.simek@amd.com>, "Andi Shyti"
 <andi.shyti@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0
References: <20260821-i2c-xiic-restore-runtime-pm-teardown-v7-1-954e06765144@nexthop.ai> <DLBBXHXIVHZL.BIOFL7T9OAM7@nexthop.ai> <aqJQ8Qm_nhBaWR-s@ashevche-desk.local>
In-Reply-To: <aqJQ8Qm_nhBaWR-s@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_113216_935659_4F2BA6DD 
X-CRM114-Status: GOOD (  16.55  )
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

On Wed Sep 9, 2026 at 11:40 PM PDT, Andy Shevchenko wrote:
> On Wed, Sep 09, 2026 at 08:51:33PM -0700, Abdurrahman Hussain wrote:
>> On Fri Aug 21, 2026 at 6:12 PM PDT, Abdurrahman Hussain wrote:
>
>> Gentle ping on this one. It has been quiet since v7 went out on Aug 21.
>>
>> Andy, v4 onwards switched to request_threaded_irq()/free_irq() with the
>> explicit free in the probe error path and in remove(), per your comment =
on
>> v3. Does that address your concern, or is there anything else you would
>> like changed?
>
> Seems okay to me.
>
>> Andi, this is a regression fix for 50c63491ff26 (the devres conversion),
>> and the WARN fires on every unbind/rmmod of the driver, so it would be
>> good to get it into 7.2 or early 7.3 fixes if the patch looks OK to you.
>
> v7.2 is already released, so v7.3-rcX is the best you can get.
>
>> Happy to respin if anything is still open.

Andi, ping on this one.

It is a regression from my own 50c63491ff26 ("i2c: xiic: switch to
devres managed APIs"), which landed in v7.1, so both v7.1 and v7.2 WARN
on every unbind/rmmod of the driver. Andy was happy with v7 [1].

Could you take it for 7.3 fixes?

Abdurrahman

