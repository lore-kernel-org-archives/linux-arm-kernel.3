Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3A85C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xq+z5Rkg98S3scIWDNq5WxGtnS/EofIxpErOXF4wRE=; b=OarXfd85KDGtZd3n0UWy+0d9V1
	IxW2M3gp/wvrJbbDHFGhRir84vSdDi4bQbDpIfvLGuXgJcxcan3RJSNJpRHrLZA4kXVh5YBA3ysx4
	gT7WwqTh4lGDHRHg+ioVz7u+sWRf/rZIy/grSYIWfI2uWkl0ocbxadIqxYag/JyHBq7+HF84ar63C
	OahxiKDS3dHfRAAfQXMk4R43ondm7W2K4/1nGxK+mEYxamdTwtpbX9n+9VmI5PL64LP9Dc8/9vp+Z
	zG06BtA6R40ZwL1vV4jc5nf+FHYFekqD2fJ4cgft9Rk0W8WRi5IN1xnH5NiResGGfEnChH6YjYCn/
	/w4bWTaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mW5-0000000BdCI-1qEJ;
	Thu, 24 Sep 2026 16:41:49 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mW2-0000000BdBa-3BxM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:41:48 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so307445e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 09:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790268105; x=1790872905; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4xq+z5Rkg98S3scIWDNq5WxGtnS/EofIxpErOXF4wRE=;
        b=TT86AcMU/553MDwLBMitV5ko7wn5MG8kGV+gIdTURNk9TmRg52+zqcroIUBa8QcCba
         6EqMfvvPuF+QWWIOgrF8idBIrCzBoNGTQCL6u3dccJyDeKWAP7CnZCeBz6lkgxA3HXSw
         dyr/bA6J2yiDixpsxCqPPDtRHhUHMLyDXczdXn1I7UCM/iStQz4ZRItul5HefGjUINeR
         laRhKJho1ClbVoiIG8HorqPO6Z4rosyzKy6yGBJbF2dFUtP0/2tGcTghcyznJ2iEklF/
         +W3NM0Kal/slBQ5qUlQDfR0v5qOVuIrQgV5js7Qx1GahmxfrtuTYEoJie9IpxD0ACcN/
         nWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268105; x=1790872905;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4xq+z5Rkg98S3scIWDNq5WxGtnS/EofIxpErOXF4wRE=;
        b=FqohqhaOYsyeEmhdb+O33elCVm8M9Y9UXQL3Ae9L2jhjQrJSm7IFVctAM34YpytakF
         wp2SXQJieFEkbXW1/XBi2rJN4L+EwUGloVP22p52ksU0LfwSqGX08woA9fC6crLy+RdM
         QUKIaRT/NqIPqIQ4mpTG3HiRfI21EEzNqcYhAzsMd1pDEsUSYmmZ4k8MwBJxjTPMWPe6
         /wICuvNw52VXNUfsAKvn/04PnCtufdpW55H4cDo9Z39/ckxYb577E7Ys8v7M3ui54dSq
         vYikPS66JbLUZfu1pQAQQN8K8uF6VCkHf6othjMXIRgr/TwAUACIhRumIVkR+b1gPQZ2
         Sgpw==
X-Gm-Message-State: AFuF++nYPGkwNvIXIMI5DltmKgQ1gIHXty0qAI0sj32PnBPCdrhA9Ilj
	5K/eVSSsKc0FkcCbf3IYF0VPXWtI/h46x1SFbH6sR9lgoswWiJ5W+ptgfZ5Ip6jqgJo=
X-Gm-Gg: AYBFou3ayTPd+byHoKiRe7KJs14VSB4u9XYb44vB0etQjsZL4nPf77RALC7Z6aQJJW9
	Z79QcqKSDuzjmLZrfOAEolCxwjbwSex8Wzl7gtlshFHXAGp+opdzGE2/bvEL4BPHrm5ke/ti6it
	AjAtNE4LW74zhleLjVS6SwltjHMc9H8FdO69M0MXGQiqr++6v8iKqWezIwiGNXsICdT9nIaFck2
	JvL6zGqyMj4KniD8EnNVehF7ZFHZpOg6TR1zMu6EkmxoLvjT3VzflyeM+rhmasxfF/gmiqq9ln5
	9OGJZUzi6prLLnlvBYsdp/9pBtOk+7sJgxeER1jzVu3zu42gvx59SGdrzXxfkH0sqSzCG3WKIJz
	X+4XQDBg1E6WrejIgM8OZfi0fc6bMSdR6b+fM1qdPqv+Fn0W8xVNaI+yGnS6WPcrB1qmPgp88Ac
	usaQZ8/ardIgBhhpiplVKpYhHhN7bYN4W4YU2bsPBm2l9ZZ8y73Sh7JqfuuzkVilhzpalu5mK0d
	Hb02J0gjEiK7awNPw==
X-Received: by 2002:a05:600c:1c25:b0:49f:ce78:3561 with SMTP id 5b1f17b1804b1-49fe66f19demr59231595e9.18.1790268104562;
        Thu, 24 Sep 2026 09:41:44 -0700 (PDT)
Received: from dev-ag ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5b9f253sm89780515e9.1.2026.09.24.09.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:41:43 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,  qinjian@cqplus1.com,  robh@kernel.org,
  krzk+dt@kernel.org,  conor+dt@kernel.org,  linux@armlinux.org.uk
Subject: Re: [PATCH v4 0/6] arm: sunplus: add Tibbo LTPP3G2 board support -
 withdrawn
In-Reply-To: <20260924152844.81705-1-ag@ffroot.co.za> (Andrew Gaylard's
	message of "Thu, 24 Sep 2026 17:28:38 +0200")
References: <20260924152844.81705-1-ag@ffroot.co.za>
User-Agent: mu4e 1.12.14; emacs 30.2
Date: Thu, 24 Sep 2026 18:41:39 +0200
Message-ID: <sa67bkavby4.fsf@dev-ag>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_094146_935282_94F7F5C7 
X-CRM114-Status: UNSURE (   9.21  )
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

Andrew Gaylard <ag@ffroot.co.za> writes:

>  - Patch 3: add device tree nodes for SP7021 peripherals that have
>              drivers (PWM, watchdog, eMMC), plus a label on the
>              gpio-leds node so board DTS files can override it.
>              Also: move memory@0 to the DTSI (512MB is fixed in the
>              SP7021 package), and remove unused board-specific pinmux
>              nodes (emac_pins, sdcard_pins) from the DTSI.

Apologies reviewers, sashiko-bot found an issue with patch 3:
some of the changes were not described in the commit-message.

Please don't review this series, I'll send v5 with this fixed shortly.

-- 
Andrew

