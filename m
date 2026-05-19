Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E817FCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V0uXNBPWEICurSaeD4MWEpMYBS3113b02AXnGrWCKxQ=; b=Y1NMcuGJ5kfhBMi4oN7LSNaAAy
	kiusu+lX8a2qQy9BuUSbunrLn3EFQy0c9z0q6nPQ/gLBr+cRS9E3dFnZgoyAkz1zghz8uOYxLTJ8B
	WblEGVtLlcQPy7IwZtViQEBpCbmVN0rZOtJrTWP+Vjc17I9oEpH43Fl+HA6OE2q8lTwJM6Kd83L1d
	CWIY2mBOGH1RwF5+zDH/Dw5XX9iJnaFDMP/W6D1MAA65S15DTxgCTSZJQP5xvOkucRd6xpBZZ4lO/
	D6y5RzlvfRAyJbBNW/4CydsGclb7YpaC949LPds7czwovpLrALAjOYPQ3oD/iCcqMPjkOTX5C+eAF
	kigbRAVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLni-00000001u7B-2zNg;
	Tue, 19 May 2026 14:52:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLng-00000001u6g-0JLQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:52:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779202323;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V0uXNBPWEICurSaeD4MWEpMYBS3113b02AXnGrWCKxQ=;
	b=YDZmUa2cYebIuKFkxXomwZ6pb4RXgnjbikk0I/OsJ0OrTM1RfzAHYPP1mrl1s8cV9Q3UHi
	dahpaTkFKJXc8OI3ejMY+YBdNWOaRF6sHe0eBF34eDMJxqkLwJxSGa0jmZGiXWjBAJeYqN
	XBsI5e1ZJwoZctshNs5rTydyNUO99Fc=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-znD2AMyINUuAfF9AftvyOw-1; Tue, 19 May 2026 10:52:01 -0400
X-MC-Unique: znD2AMyINUuAfF9AftvyOw-1
X-Mimecast-MFC-AGG-ID: znD2AMyINUuAfF9AftvyOw_1779202321
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7cfea0b5cb7so9121177b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 07:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779202320; x=1779807120;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V0uXNBPWEICurSaeD4MWEpMYBS3113b02AXnGrWCKxQ=;
        b=jOKhAS/APOgywYWmQdqqmWuotLRMoSNM1YjFYBafyL/BSesWJAwADEItC8g4tqGrLL
         ThjVzuXzhS1O+Lr29cYuzqzJVu6nsUZ90fuA/vC2wr3qQiZTKXuju2+TaZ7z86ylIJGb
         5/s0oa3FzjY5umvT5fbAwuwzSyGZMZhDlviuDS4dfAQ4AyfGslz+/37GMQg9KA79qP1H
         7xhiWfFCTanGvb9a0u/SjWGODBSxJZdaxgdg13j7HCdJ1rHkSCYmzMkVPlFa7JVjmJhL
         Ey7wcTbBi+dDi87pb0YDgKs72PIK0Qhnh2w73iH8gtClWNKA8K741xM19vkcXzWuwOgz
         qTzQ==
X-Forwarded-Encrypted: i=1; AFNElJ83mYYUFiFmEpfRbbQuUO1JBON6VFIr6sfVeVg42dmV9mKBpREaTtDwUdX9kwS+c3HeaqzXRSByvVL3hNSejcqi@lists.infradead.org
X-Gm-Message-State: AOJu0YwMOKYu3rM9OKzK7aJGVA00Js1cUURGa02dSq25Rwt9dEFQGbrh
	5l0zfWE79jKFAzvEle2jzXSrj9rmLdEJ/d0kcHjK2dhDV2EDPWqFu6TmpAKlUeMU1Dx/Ievtzpv
	BC9V0lVp5Rm8pI96MOBQme6Ycu9KPUdJWI88aJP1unk5YAAw5UagG8F3O6vmKNvzbPuzgyQWTyx
	ux5aueOc4H
X-Gm-Gg: Acq92OEqYmwLCxkmKAWs/L3bFQVTJJXG517LIkBMKI3Jk4icyw6fJOJGXrh9aYyuZW7
	4JoI1z5X7fSHOfnS6GS9kEfJjxALZrNfynnILm+9lPfpfDrTZenDtOHuyEv+Ka/kuDSVuWqAZSJ
	snQPKL0cZHR7k0MJG/psRgNwQ7PIl2Hp4cMg/FFUL7HtnPZKqq0YN+s8AkRVoYSfEiCI8ehOxBW
	m4IC4guxEvCnp5mSnVxii4RK1zmy0I8edaaAByfrSidzTL5O2Y4VZ6NnKtzi8RMGASZ4fZcKg4v
	CzBtneUDRTaNDWXeRsyizOqA5qMOFwC3Thy4HL8HXJ1GVIlGax6VgTGE7cScTgEte3ocBP19q4b
	QCXrpGbC0NX8lZQQCpsVzTHId1G3xyJNTPoTITraCaJFeiHrUGGgXA1fB
X-Received: by 2002:a05:690c:4424:b0:7b3:852d:eed8 with SMTP id 00721157ae682-7c95a66e7damr198299297b3.20.1779202320561;
        Tue, 19 May 2026 07:52:00 -0700 (PDT)
X-Received: by 2002:a05:690c:4424:b0:7b3:852d:eed8 with SMTP id 00721157ae682-7c95a66e7damr198299007b3.20.1779202320032;
        Tue, 19 May 2026 07:52:00 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c97absm38128667b3.8.2026.05.19.07.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:51:59 -0700 (PDT)
Date: Tue, 19 May 2026 10:51:57 -0400
From: Brian Masney <bmasney@redhat.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, ychuang3@nuvoton.com,
	schung@nuvoton.com, yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: nuvoton: ma35d1: fix ignored div_u64 return
 values in PLL freq calculation
Message-ID: <agx5DSrHkmKeEejN@redhat.com>
References: <20260513055626.1070533-1-a0987203069@gmail.com>
 <20260513055626.1070533-2-a0987203069@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260513055626.1070533-2-a0987203069@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tozsBeT4POmMxVo5M-z2s_I4VBLJZWMQK5KYiADlbDw_1779202321
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_075204_181875_65E6035A 
X-CRM114-Status: GOOD (  10.57  )
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

On Wed, May 13, 2026 at 01:56:24PM +0800, Joey Lu wrote:
> div_u64() does not modify its argument in place; the return value must
> be assigned.  Both ma35d1_calc_smic_pll_freq() and ma35d1_calc_pll_freq()
> called div_u64() and discarded the result, leaving pll_freq holding the
> undivided product and thus returning a frequency orders of magnitude too
> high.
> 
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Signed-off-by: Joey Lu <a0987203069@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


