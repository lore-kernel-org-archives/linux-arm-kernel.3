Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E037C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 19:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aIYysQO98VqTcpcnjxQ9HD3CfclEuBh0khiFG9kEwR8=; b=uf0/CgaBQqyi/bE41CrPQMd38o
	CCTXvJcMmoArOl9Huk0Wz4De+tyRPZWgc7bFyauPnW09PHCpAzwtt2m4fHo50CZngjusfgtvdz0/6
	Uxmr9cvO/HbgpFfZ7LOtpfipO5RXt45ALvLKBv9UyP3zbfpiiCjh0bfkIzy2fdNy7ldE0RvnLefBR
	2UsMBfNb22LoNet74NcPxGY4IoCbTeiOmA0IywVtbS4BMB2cmKLqvPO1ds7BSn7wVhvfacr1OLmsh
	iyX4lZQiFRpL/VoMy/RIhxUloIlPzsDWUmZeYBvIvyCXjsf7bsRJxL7vihoHpTU+HoLRyCJqmy2zI
	VYvi/EmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtVqa-0000000FUC2-0Dc9;
	Fri, 20 Feb 2026 19:07:28 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtVqW-0000000FUBV-3mko
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 19:07:26 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43621bf67ceso1605518f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Feb 2026 11:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771614443; x=1772219243; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aIYysQO98VqTcpcnjxQ9HD3CfclEuBh0khiFG9kEwR8=;
        b=AuedkED6nkzad3CG7uerQAZi51vhsNv1cTGix2WQoQjlLXugimNBYc2LY+cHx9juH/
         +rvYFXhHcnjv9GhufGy4Nqd30Rk1zK/z1kFFS0OxpJInYV4VKftpPk8kXhvTs0Ju87+U
         JizSpNB8FqfoYFYRE25L80d4/akzuUqdH7rv0CU3B9+hTmrLRF1gnUlP68qd0UH1F7Mx
         +cvSf41vy64D0LdMnHBbuWvBbXUslEbVWJycc73uebaMwntQ16a7JRMAbioh/YoJ3dav
         I/KEcDpfI/MDYoNA5vJixQN18RSAjY+iPwCknsKBmY17LUS4+as2x464DN6Xas9+6kW0
         WWEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771614443; x=1772219243;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aIYysQO98VqTcpcnjxQ9HD3CfclEuBh0khiFG9kEwR8=;
        b=ZBXbTg1yx1N7cXn5V0qESxaBy1Ki/eUH7WZm8701v/c6O+2LQB6lJ5jYDFae9d1KcE
         Ck0XuHPJPgL7yenN477qNIo80g89Q/SIV+/Kpv1IVaGagHwlyrtFnrofCAVY0cfUSO1g
         Er+JXfjDOaKodK8gZI+nvJTVugEIvhC7BzZUeejsl+cFJsm1qubOLOg78UMCbocgCZCH
         jwb+hzVHyp3I5Ge7TPYJNgFgGqPYCUvsflt9xwwL3QWlWh9XJnHM9sl2JKoRbQhvPDm5
         DHc4G5H9XFuPzVj/9R2wwspXOI/7uBMkS9aT3eitrUObQQ7Zo9UpKf5esDCwr3BayM3N
         ZdFA==
X-Forwarded-Encrypted: i=1; AJvYcCWTpILBJ2y7M3yS86p/VeBiFQOT0V+DPjIolFCII6xkM1nBgBn9XaM9hWp5Zr0oR1fnVkialkCzZ8e6mBibYyK2@lists.infradead.org
X-Gm-Message-State: AOJu0YzdCestL8dgaNnQW5wUrz/Zgc6hXQiaI8OSpcvyFY1qCtFEhlPg
	57tJBT5Ny4xopsLd0+7X/Y/j/20K9SnZPKfiG4gVc+BftuVkfpCXk/Xd
X-Gm-Gg: AZuq6aKaKeTG/Eg5oENay8NObAoZjS5ssRNYWz4b16MszfXJghtdA116YBfeqPUZmlQ
	cP+t4xWg6M5HeI56TxegXNhJ9rqzMDjTpFsgRg6mf6QzgT6r3HgFVSxsxn22rpP6y4/pqjAX8y4
	A/m6woIPNOilIOfdCxU/RyQF9DEQT3oKyzUbNLohakIaAXK7RyRT6UmoPapsdBpfpnpnrNz/3db
	tBQbdFF7KHSVyJUcYYjrhaOVyUtNs75+wa2SKEQ0ryKzAPQhG7Ne9FgOcoBtBts4XTACEIC3Iou
	QHbPgU4POvCRADN3m0Lk3L1vO6KxlShZfZ8AYYK1dTWFUyXcBryc/kvIzckFMQS5Doj/BeevavN
	WcbR7Qv6yKIlBkWfmq/7DJH98IimsoEkDYVyTykiM6fQT8VpbdMRbxUP4+QNsJ1GvWSUHunZRQF
	/Mo1ZOmQTmiKS2EsHy1B5MUqjCxQ3DZ9HU9Qz0zyCUAxBfSMA1axpmTDD0TEKD4a0=
X-Received: by 2002:a05:6000:2f83:b0:431:a0:7dea with SMTP id ffacd0b85a97d-4396f181aa5mr1830793f8f.40.1771614442895;
        Fri, 20 Feb 2026 11:07:22 -0800 (PST)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00485sm83600f8f.9.2026.02.20.11.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 11:07:22 -0800 (PST)
Message-ID: <39d36f25-abf6-41e1-8762-d9de38891a2b@gmail.com>
Date: Fri, 20 Feb 2026 20:07:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: ehci-orion: remove optional PHY handling code
 remnants
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260220-ehci-orion-drop-phy-handling-v1-1-01abd9f168cc@gmail.com>
 <875x7rsf03.fsf@bootlin.com>
Content-Language: hu
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <875x7rsf03.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_110725_002074_7541A3A7 
X-CRM114-Status: GOOD (  14.28  )
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

Hi Miquel,

2026. 02. 20. 14:47 keltezéssel, Miquel Raynal írta:
> Hi Gabor,
> 
> On 20/02/2026 at 14:27:02 +01, Gabor Juhos <j4g8y7@gmail.com> wrote:
> 
>> Since the USB core code handles the generic USB PHYs automatically, the
>> optional PHY handling code has been removed from the 'ehci-orion' driver
>> entirely by commit e04585184dcf ("usb: ehci-orion: avoid double PHY
>> initialization"). However, the devm_phy_optional_get() call has been kept
>> so the driver still gets the PHY even though it is not used for anything
>> in the driver.
>>
>> Drop the remaining code, and also remove the 'phy' member of the
>> 'orion_ehci_hcd' structure to simplify the code.
>>
>> Fixes: e04585184dcf ("usb: ehci-orion: avoid double PHY initialization")
> 
> The fixes tag makes no sense here, this is pure cleanup. I do not
> remember if this was needed or not, it is probably safe to drop today.

I have checked the code in v5.1, and the phy is not used there either.
Nevertheless, you are right, this is a cleanup rather than a fix. I will send a
v2 without the Fixes tag.

Thanks,
Gabor

