Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75B4EEEC1C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 22:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMvcHOsvbeq/KIs3IJ0EOSwRJPyItWeiXV1rTu2E8c4=; b=03RU9tQ3kQbQen5oeD14dQRhnj
	rN2rRGgxmyW4H+/KrkevZLMT8XvQQTQM/f6YRqTzBJIFAOyqkHuOeJUGhSubgPXZBR32xYKsQ1CWc
	YqfYZAxZHzGxgf2Ma5sw5YeCO84mikPCu4BR4f/bWoMDYohEwScxAtvMtJnHdyW1vIXxUdKJKZBPK
	GFEVwGtXMp7j3UnYbuoV3PVE/5NZM3CRYVlscPmDd2vqAP+U0ZDz+1sIWgYl5LH9l+Pgbhei4mRma
	nrDbI/rmRp9IGctV1x+mNtGobEYVBmSObYpoqRSdncBb/vv+LBY79a3A/O1tijLMQji4w5NoR0tfQ
	u/ex9jFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRHF-00000007beL-3y9D;
	Thu, 01 Jan 2026 22:36:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRH3-00000007bcr-0urk
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Jan 2026 22:36:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QMvcHOsvbeq/KIs3IJ0EOSwRJPyItWeiXV1rTu2E8c4=; b=hn2EuXDLBf+BuVzqHk9KkFyAAv
	JiREkCoJSIoeqokAfAfLX0DRGvqeoDTx5p3bTxufeeq7YGhVm8jWPpUDTmZ0xKJLCq7Az1tiYiqxA
	T74aUuzSK00gm6AQJvp5bcs0LQi3w0L9xc0tJdI7KxxaQ/WzVfnMv8WSvSAgDXG8KniD4TXcLxjF3
	4knDZz9zvwHxv8/MSG6p/JgSqWbKnLyhMtTi3ERPshxr+zRf2KaUMpnfMksxnWm8cz1XgJUwzaeha
	dWDFyMDpGxdejTUUJy0hESRPwEKb5F54T4B8ZGXwf+fbS/mgFRp9xbhhflgiOMR3EvS93KmqSuAQg
	7E3XvkxA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbRGw-00000005QYk-01A8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 22:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B6F944453
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Jan 2026 22:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552ECC19421
	for <linux-arm-kernel@lists.infradead.org>; Thu,  1 Jan 2026 22:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767306952;
	bh=QMvcHOsvbeq/KIs3IJ0EOSwRJPyItWeiXV1rTu2E8c4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iPFW2OjkDUHTshzwy5iZrPT9cuPNdw7BLkUBetmleByjNDVFJI0R5NI77lzRdn0Zg
	 1OSOSGsHWWBN7i0ybcyrvT+L0f795oGsXzbeIOS/3T9yULI2Cvg+3SOXEvNV8BykWa
	 XyyUQfCJoCL+s2bMBfQECwQt1eGAfVlwaH7pUrwvu0X4iq1Qx1IhJIecwGZkVsn1b1
	 XJ9/TFtOd+i8aAlSvEW4IaYX1GbP5PcNEFPkJ8Pd5b/Gkyqaz79M8zTVByL4Fc9TFj
	 MuL5L4/s0+aL5+VYtsvjqny+PUZEWtQUIzNE69tkAahD/Gdo/6BykV5XfjjdvzZjPX
	 DElUuHmIx9MYA==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-644795bf5feso10128170d50.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 14:35:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXpVbJNYf4UVtIGUwoe6X5JuVyDjZXduiTRGtkXNU9ghmsOjKO/vI+nOkm19r7mnIrCSyCIsQ27wI19kTH+mVQ7@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzok/jMIzP84BKVy9rBRdT3fOSTXTB61hfFBSCNZm5OYM8f6sg
	olZwnwPvPVMHbBtZIskqlUG6xGCpnW6ZSys9T5abYXfw2WcSEqo1prj+bc6cZ8f3sTAGnkd4M8r
	4/DKrC47cv3Ewv2XGwfzgYgNE5wnAQUo=
X-Google-Smtp-Source: AGHT+IEbScPl11Wd17XFYMap12LvzWfJ4p/Vjq8yPw63OOIA+tKxG0Z0war/aoElpBRNBkuJ5ynYi3FD1FVnyPhQPxM=
X-Received: by 2002:a53:e01b:0:b0:644:6c45:4ee9 with SMTP id
 956f58d0204a3-6466a8c4e2emr24775256d50.39.1767306951744; Thu, 01 Jan 2026
 14:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20251219-gpio-of-match-v2-0-5c65cbb513ac@oss.qualcomm.com> <20251219-gpio-of-match-v2-2-5c65cbb513ac@oss.qualcomm.com>
In-Reply-To: <20251219-gpio-of-match-v2-2-5c65cbb513ac@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Jan 2026 23:35:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLnfDotbsE8fz_xFK4RhbAUO_PXrDECgT9mgnCO3Ek92UQ@mail.gmail.com>
X-Gm-Features: AQt7F2rgsNyQ_sXrUoBKmwhd6vUxSgOicBOQWjF3aplz2un6xPpf3QX8VXVj1OM
Message-ID: <CAD++jLnfDotbsE8fz_xFK4RhbAUO_PXrDECgT9mgnCO3Ek92UQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] gpio: creg-snps: Simplify with of_device_get_match_data()
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_223559_869748_DB0B28F3 
X-CRM114-Status: UNSURE (   9.13  )
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

On Fri, Dec 19, 2025 at 11:12=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Driver's probe function matches against driver's of_device_id table,
> where each entry has non-NULL match data, so of_match_node() can be
> simplified with of_device_get_match_data().
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

