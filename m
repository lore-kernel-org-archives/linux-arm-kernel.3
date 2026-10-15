Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FBECC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 13:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fatwg6Ql10eF4yUkxnXRufoS1VKiolsiumheXDiVcQ=; b=DQsTv4bao/Vxse7Cpeov5bdKNv
	ezIiTyL119YsunS8eLmQOujrtDk4wM86DhV2HE2axMtHFbq900FrXoxHFIcj7Oi3wuIkCZP9kbEcS
	HnQd+eGISnRi4I2HHvwKXGZbi05Tashy9TsnE7N+bUIkJ86ZCpbSt7Hziros6DEUceBTn85LbsZNb
	tq4wRzE4GYE1lNkpEnaumMCt1TZBMp6s1FHXb3F6vxEaOvvOQjcnD0MjiUz+88keqOh8p4DklPU86
	ka9A87L+cEvhSdZT6A9p6nFlKVnpXEk8XWQ1wSGx4KAOPUh6b7bPZEJBom7nh2sxMEw0psqn89lEM
	W0KbOnUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLSS-00000000FXZ-4ANx;
	Thu, 15 Oct 2026 13:25:21 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHLSQ-00000000FWk-1Qqv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 13:25:19 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48afe75f055so433791f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 06:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792070716; x=1792675516; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0fatwg6Ql10eF4yUkxnXRufoS1VKiolsiumheXDiVcQ=;
        b=f5ukXwtgO0X02wQWvowvNp+qZASPhPWbB5b5ZDyEDo34nOGs4zIkKUW1PHC2rE8v14
         MyX636r7wPNdoMqe6Mvj0UEOniWZLDAwffMVYrOmmGw5g8/vHbs45t+96IEj8SPPh4IJ
         /hodpp5kU6Z1o+m2Q6836yqdCQi3T0KULjQlo10OpFhfD92EEZIL6ar3utsXNsLMJyry
         mgx29K+VYrU2YH8DAfsXvtWoAGY0Jc3Wu1YGD4mE72X+N0Qs5Nwzlw/sdYDFN5lnXDSi
         b+YlLy/vE+VFaip0Q2p0eKKp6f3NZWO9H07611XbP7EqZ31dP440TlhK5oCglV9nfRQw
         Njxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070716; x=1792675516;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fatwg6Ql10eF4yUkxnXRufoS1VKiolsiumheXDiVcQ=;
        b=WtY/nrN5qkoZ/Bpw3U5G0NaRt1yzc5wiYhJC1HD2mJyaIm/2FTC/QxDBv9Ig62GxUu
         HkaHeAfHR0dVj8JZqMUmJrpUlquH7373oR9ZCB4E2+Hwvk9sRfNLvyKwG7JfLtD9pgKa
         h05R/lJKI+2yjCzdnulcHIBDqATdU9zkumyeVzvdYJ3GIMqZSSMzcAIF86AjLNNrzPY+
         Eh4ZNS+usluvQECmb0AzWXG9uKtz/+A6XeHxT+0gEPjJw9AFBwQdALvjTTKaXALTRBqL
         KKkI5SBFotfPhDuLQt9jORm1Il0JD5tCp3DL/vqJngvBnuUB9bDlTBCTNNCF75sIeNdj
         13Ow==
X-Forwarded-Encrypted: i=1; AKwUvByEWLw8qkg5MgR6M79QOZrFQgDPuPZMpaWW2w7QIU5UjLuNP98oLxG2Hvm9ipAof4kulWFgBmXb8KJ/z4o7Y74q@lists.infradead.org
X-Gm-Message-State: AFq9FYIlPFHeBtsupv/pMma1u+PCEM66frVqCvPmmr0gf6DMEsmw+I95
	j3c81aXdWP1DVcNAy1nbr0dgj+5iPdEr6tBu59EgRhnKBOE56tEzxkmu
X-Gm-Gg: AYBFou3zNCw9qhJ8xT+03DRtJWBBjD6GwQYvvyJY/WN2kUDaXIFOhMMiyBd1N6hAK7C
	d/Xv4tyyAg+5N9qwapwAS9fGtLLsflgRYo26Ai56FTBzRmkACVjShJsGNc9Zu2rWAGsnqaUetkz
	9YtHOzlNA3Mi6iEgUFLpLy8yE3kqg/DHSKX55q63XKUiLgsQ3Xd+V1xR7zaagVB4rbiEVB9enGn
	jTlsccPnRctcKapCBFnC1kElZGtbit6qLSfDwVRMYXX1EPij/J6aN2vy6cotA8G3t27FLlPJ24v
	brS3t1ioEUreRA5usx+TKtz5x2N/aAPwr5UxLzwPgHjb3w4x+3X4fKuzIA6JFdu0Esml7br+L2B
	O9tWwIXc8xyBWs64XjbkHagt3IEDlLJWHD8+kEuVPge6/rIEmnL2yg1cxF6YwWnITFV5H9lsbd4
	VaUrHXh/BkETqthqYg1OIhOmERbCEw6hSyG7cdyzx/qp13o7MIjcrxqUJCrsHADSyvx3rfmNCw+
	K3nY9w6q8n/xkpZIuRWUPOnZ5PKw7AOwiLOdT/0pdqWriG3L4oaGSuAxQ==
X-Received: by 2002:a05:6000:4549:b0:48d:facb:5939 with SMTP id ffacd0b85a97d-48dfacb5b8fmr147377f8f.8.1792070715607;
        Thu, 15 Oct 2026 06:25:15 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de09693c7sm23470807f8f.4.2026.10.15.06.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 06:25:15 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>,
 Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 02/11] irqchip: Add Cortina Systems CS75xx peripheral
 interrupt controller
In-Reply-To: <87tsmndu0p.ffs@fw13>
References: <20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com>
 <20261013-b4-cs75xx-s2-v3-2-181bb0d23f4c@gmail.com> <87tsmndu0p.ffs@fw13>
Date: Thu, 15 Oct 2026 16:25:06 +0300
Message-ID: <179207070645.418589.10399440167204506807@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_062518_398346_BB7B1CF6 
X-CRM114-Status: GOOD (  12.22  )
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

On Thu, Oct 15 2026 at 14:32, Thomas Gleixner wrote:
> On Tue, Oct 13 2026 at 09:07, Fil Dunsky via B4 Relay wrote:
>> +static int __init cs75xx_intc_init(struct device_node *np,
>> +				   struct device_node *parent)
>
> No line break required. You have 100 characters. Please fix that all
> over the place.

Done for the next version, the declaration and the calls in the init
function are on one or two lines now.

> Other than that this looks good.

Thanks for the review. The next version will come after v7.4-rc1, with
the interrupt controller as a series of its own (binding and driver),
split from the GPIO, I2C and watchdog patches.

Fil


