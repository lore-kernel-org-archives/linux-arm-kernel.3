Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBB7C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 14:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3zAK75b8ZUtjKJXv+z/knfiDKVadFa2L6rKVWPT2qQc=; b=gnL485jKfn8Sk7urJrwlOgY16H
	59b3TyULXuEPamMfBq5F8rsfwcyQZIFM/ICHAZr67oyFwr5EH6hx7f5ehXt5INqzN+XHR7/DP0fHa
	jgJpy/cHEghBNL2+jXGvQRjXCUrqMWKNRGnAn/G0x+kFf/1tsRDyHM8xd30WJzmnZso+L7AEpIrLo
	0jdJtcdAMVq7Kqn0SjDhlpQ14LXHCS//gSyLThcWu/nrlTvs0BvRNuDu/vpACfTklNBl3IcaNnNxp
	oy817YGDIf7W3u3vHKBC52aHDbcak78X5a5I5q2ap7kCgIs9cUCGqkZfnRL+aZblB5B5ENR89ry3D
	y4LHNtdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuWLY-00000000q3W-445j;
	Thu, 13 Aug 2026 14:23:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuWLV-00000000q36-1LT9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 14:23:51 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-495437bb891so9203825e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 07:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1786631026; x=1787235826; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zAK75b8ZUtjKJXv+z/knfiDKVadFa2L6rKVWPT2qQc=;
        b=eQmW33/1sMvks/tJGNoE2ZG+/LatA7voWlx1cp9JjGU03IdsA40N/TALbdJ15ZiA2k
         hgTMoiakHxN2uZh6rlZ0qls0TUw+bDPEaEtsHNPV+UFZSBTf206nY2vRrZOiSBnV+KvX
         HYcN6NUMpslLfFH3BDPk4OcCMnURxxkDXnaJ2+uuTmhR/qJjFBu85apxK1vwhp8lKp6G
         2sY4f4RgDCurq659pOnsNloTH898PJ+iDCzCgfZv+sGljK1hQ7nXbNUVQ+yCrfHgSy8B
         uhOr3xqn25Dk7hyX6c0gBvP/X60h1v027e/av+OpYEPZt1h3XFSAdABTYTWYktRKAHCc
         7FLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786631026; x=1787235826;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3zAK75b8ZUtjKJXv+z/knfiDKVadFa2L6rKVWPT2qQc=;
        b=UsrnmJvbl/j8kiAeJcCipuAGP78lbdo/qmm4C5cvuUNF/eFWuOhrnBwJCtbet8lyYH
         vbuKrRoPP90UfKvduR8OKg5knU2sfqa1FmRvvgl1Fmxq3DtErHsN3aL8CkgP1hx3FQIc
         slU4UjYcC+d0XnuMN9OODyYV1n0SNN3Ay0nj4l2jfzaQ8HxXwlIEFVk5O11MSQOYGKvU
         ZqkJkRRW4Vtu/wjJejZTWUL/2M5II+VYfbSYWk2ONKC4M2V73Looq1XkxqN2AYpaA6Tc
         oCc7Y77hFHxXIQPr65KOe6UD1lFCZnavTretoXl+M5zokp+opU+32HiMQNijYSLqUzT/
         0nUA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1yiUMWoBMn7CbISa0uVfDsAHcFBMEAgESF9OJmuvP44grDw8NSy9uHo4+wu6QVK27Fg7pDpkNEG/DvjQ99BVi@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn/ziZsVvgof1BJAVLqD9JOFQ8DjpYCsh/lbzP6Z8R0o9wzDSK
	7jDYO7KSJ3rE71CAmvIDfFKYI0Wf8gEOjAsrKWtsL9Em1ZWb64iDIRsVQz3DCMvQkU4=
X-Gm-Gg: AR+sD12FRzRm/kMGz65XJut9Dr14vQ+muSrWYx0+IX2sYIP9TocsFhDS3lQG9P/vhd+
	HzF4nT0frM26tWcEd3Cr7jLYs7jguZrhsTlpaTok69AzEPQELs4/kPyBanabhTSsbhY1jAyFR1N
	m9MYYUF/OUhRPWLgyNM3ok+I7ZnbLVxm7fLq8rJW2hGwzYwmfSbOqzeqeG7bDcutNlo8iy+g5NJ
	MSSTjiy9/sRmH9cICOVPt8xRog9Fzmz+iB2uEY29EGOT23piDeUtTbLTo/kwwFMRt7QfQ80s5Tw
	1MqGBE0tLwPNScUKjX1fCicRnLZQRhELmcvKFC0RoHXt20A/I+xZR9dBz8WDId8KmlZCIWXgAv6
	r2/XtLjayBecqZVw03F6AWZ5mupzk1xwude/XkgUyFUISyZ1gFIDR43RRYHBHThOHeB4vWs+pvq
	kXDxZ/tQDKrLWJl9mdOGO/r8qwWitvXG1hexgAOi1mWjCV3NMmKA6eyD/kKPp/6alIE0DpWRzBt
	AV0ey6g1SqT5YVpgAXyfJXu9lX4W6+Sm16GapxJLRFr6Q8rXaLN
X-Received: by 2002:a05:600d:6409:10b0:499:84fc:4548 with SMTP id 5b1f17b1804b1-49984fc45c0mr29737445e9.5.1786631026583;
        Thu, 13 Aug 2026 07:23:46 -0700 (PDT)
Received: from ?IPV6:2a01:599:447:e518:cc7c:e59e:1489:db94? ([2a01:599:447:e518:cc7c:e59e:1489:db94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981e2e266sm51262395e9.2.2026.08.13.07.23.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 07:23:46 -0700 (PDT)
Message-ID: <15d1ced4-2400-477b-800d-fdcca80559bc@9elements.com>
Date: Thu, 13 Aug 2026 16:23:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/6] soc: mfd: add ASPEED AST2600 PCIe BMC device
 driver
To: =?UTF-8?Q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, lkundrak@v3.sk,
 devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, lee@kernel.org, =?UTF-8?Q?Gr=C3=A9goire_Layet?=
 <git@gregoirelayet.com>, andrew@lunn.ch, jacky_chou@aspeedtech.com,
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com,
 linux-serial@vger.kernel.org, mfd@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1785932211.git.gregoire.layet@9elements.com>
 <51db5e5bb5bf44dd5ab893b8d547291f04e1d3c7.1785932211.git.gregoire.layet@9elements.com>
 <178609182923.193353.7287772568467157519.b4-review@b4>
 <CAFi2wKZdJ3LxJVDqC2K79T0JhoOOWSj=ZmL9pB+Lka_aXDXatQ@mail.gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <CAFi2wKZdJ3LxJVDqC2K79T0JhoOOWSj=ZmL9pB+Lka_aXDXatQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_072350_129760_414B22E9 
X-CRM114-Status: UNSURE (   8.82  )
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

On 8/10/26 12:36 PM, Grégoire Layet wrote:
>> But you're adding the UART devices here which now means that the core driver is
>> doing more than MSI interrupt init.
> 
> I might have misunderstood but this is creating the UART device by
> using the 'serial8250' driver.

You're right :face_palm: I haven't had enough coffee when I reviewed it.

Sorry for the confusion!

Tan



