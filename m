Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB91CE8B37E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 23:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCOjNNMnUuznv6tosNTA/iIRiTXu2wBeg3Ia+sthXnc=; b=MkcFqxCFZC03779hVBsm10y000
	PuoKC2lYcEh8uzP9f17Qoq+IIgW5lHJ0TIYGYi2OIgdA2d2mlcDYa8gxioF+wfiYywXkErkqdgKAX
	NFUMOiw5EnvDM/X/hfuqH9C97eAJkou1/IM/syePURjA9GP0DBOpWiNErBSEJ2IUs/0ZvXOfln+p6
	zuf6mHbeZm+Mz+IOibLqv9n2vfU2CX/PjICcypo9KocRa3qvu1lX2HZLOCrJoThS7i/XzXbs+Xe4R
	kF6uGHSQTKYISP9JiJLvyHAV00ZrjyO5CsmD7/B1ApnpS7+0Ghmu/nlObQQHh8mdFWcHDCbqSojur
	QgPGqZug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPZq-00000007Xfj-1DUl;
	Tue, 03 Feb 2026 23:12:58 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnPZn-00000007XfG-3FGy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 23:12:57 +0000
Received: by mail-pf1-x444.google.com with SMTP id d2e1a72fcca58-8230c2d3128so3343337b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 15:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770160374; x=1770765174; darn=lists.infradead.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hCOjNNMnUuznv6tosNTA/iIRiTXu2wBeg3Ia+sthXnc=;
        b=npyuiFMTUKA+MYfdP0Wg8DQFyb6VdF1UiurYJf0deiHIH/LbARARdZMNPYdjVHONZC
         ISzwCWWyYQVNgrgiD1Hh5ql8/TROE/12EZuQkvIIP0ZECvi+rVsMnh5fb+ArXtyjeGrH
         qnNa+8WQk+/akoyCjAl/uc8GUKEBJ6NxPnNC7QuRJ+Hl+8/34OCP0rEYqTH1wz/lpRYk
         Mjbd0hycM0abipRyx5Fu1pttcWVdNhdHiXN0urCQwx94HZ/Ye5a4sJf2NG4+WSRVlFXB
         fY8v/nVa8gGJ197P5v/AYDSP1RTWT9IFVVr2LvSuJOzhYIwTSUncqFEG94hXAdCg0NKo
         a4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160374; x=1770765174;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCOjNNMnUuznv6tosNTA/iIRiTXu2wBeg3Ia+sthXnc=;
        b=wSnvCjYoFW0Czmxi3rwLrFKuPW+6Wd6iUDj5Ini9mnvu2L/oCNLQNGlDnUUwiejazB
         37XwP9YDIKVWRRla0yN/tZtNS4RoM0d+yzPDKkMBgUvsQGtuRlkYAfOrlygLQd5tgD8G
         eKXHU+Q5WH6wRq4u9hYl4CMcXbRO/onkqULTuiCx6iAnwhIsYOYfF8MbpngZjc4QNCth
         hNTKpOfXyIqIRC32pP177/+Y77hMP9IXoT7BEdy4e1XSXDsA84H77k/j3YPxn3liacYS
         T5o3Y99OVWyAN1s2otWhHOQfxpIPvaRcdPIfcIpPTokzEA9D96p6Ek+UYazSRLz3Ynb2
         8jaw==
X-Forwarded-Encrypted: i=1; AJvYcCU8j3aADoKd89xIJwj9Pnggmoa4GgpVzxaKBiczGiUnI1lpPi/Qf26aE+I2BAkVyQwIcGpOU6AHstOGTJXWqvoJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxGgs+YwwIkeUdgCACTaiO90GztFF6ecF3IYe4h0jM31hMdpU7I
	h5Zb4MtYitMUmoC70h+rxv+a4M8J8nvbMjD6GLRgey4vBe3q/QCPwaf132Y+sjo2HDI=
X-Gm-Gg: AZuq6aLcGkZh8yXZ+BrLtZ2yUyGsCZsfakZoppFyF7ok+75m1+oPMfIh/b6PVGUvQFS
	bZG4jIonKVaGZ0cje6x93ugEzDz8D2JRDbmU4nBLg7l+CPbQaLhvpSIPC4QctMBCWTNUa2wDlAq
	guHs28T/AgJxom26u5fOoMw1wHy8ckaPoWACAUCLAcUeE0VyVHmQJiLOyK5It9q6Ww77ErpUUqR
	xYXlIqn8Mg+7wcLQCwmTKdLwMW/2zubJZ7C8RmQ6BEYnM3ZyTnHK7wKcft4B5EjNpjMDMX8zh/U
	OTtoA8LTPwcYuvB3uQawWXFx+VrchnnlHQv4yfHaLTvQCoUILOtDBio4efWU3TKhP6akeOHpDzs
	Eck0/9DbwJ0xulMdsta3IrrO7Q05zCnFai3njK1v2tAEWWnZYE6dBQOhbUT9UDn2pSPCfajjXHU
	lYUwKrnMeK4pwR9N/O4Gg=
X-Received: by 2002:a05:6a20:9185:b0:366:58cc:b74b with SMTP id adf61e73a8af0-393720cfdddmr966865637.21.1770160374489;
        Tue, 03 Feb 2026 15:12:54 -0800 (PST)
Received: from localhost ([71.212.200.220])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6c84c70e08sm321672a12.20.2026.02.03.15.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 15:12:53 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh@kernel.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi
 <cristian.marussi@arm.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, arm-scmi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v5 1/2] pmdomain: core: support domain hierarchy via
 power-domain-map
In-Reply-To: <20260127151735.GA1699112-robh@kernel.org>
References: <20260122-pmdomain-hierarchy-onecell-v5-0-76855ec856bd@baylibre.com>
 <20260122-pmdomain-hierarchy-onecell-v5-1-76855ec856bd@baylibre.com>
 <20260127151735.GA1699112-robh@kernel.org>
Date: Tue, 03 Feb 2026 15:12:53 -0800
Message-ID: <7hjywtzaiy.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_151255_812626_FFC8CA09 
X-CRM114-Status: GOOD (  20.24  )
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

Rob Herring <robh@kernel.org> writes:

> On Thu, Jan 22, 2026 at 05:14:00PM -0800, Kevin Hilman (TI) wrote:
>> Add of_genpd_[add|remove]_subdomain_map() helper functions to support
>> hierarchical PM domains defined by using power-domains-map
>
> power-domain-map. No 's'.
>
>> property (c.f. nexus node maps in DT spec, section 2.5.1).
>> 
>> This enables PM domain providers with #power-domain-cells > 0 to
>> establish subdomain relationships via the power-domain-map property,
>> which was not previously possible.
>> 
>> These new helper functions:
>> - uses an OF helper to iterate to over entries in power-domain-map
>> - For each mapped entry: extracts child specifier, resolves parent phandle,
>>   extracts parent specifier args, and establishes subdomain relationship
>> - Calls genpd_[add|remove]_subdomain() with proper gpd_list_lock mutex protection
>> 
>> Example from k3-am62l.dtsi:
>> 
>>   scmi_pds: protocol@11 {
>>       #power-domain-cells = <1>;
>>       power-domain-map = <15 &MAIN_PD>,  /* TIMER0 */
>>                          <19 &WKUP_PD>;  /* WKUP_TIMER0 */
>>   };
>> 
>>   MAIN_PD: power-controller-main {
>>       #power-domain-cells = <0>;
>>   };
>> 
>>   WKUP_PD: power-controller-main {
>>       #power-domain-cells = <0>;
>>   };
>> 
>> This allows SCMI power domain 15 to become a subdomain of MAIN_PD, and
>> domain 19 to become a subdomain of WKUP_PD.
>
> One concern I have here is generally *-map is transparent meaning when 
> you lookup <&scmi_pds 15>, &MAIN_PD is returned as the provider. It's 
> also possible to have a map point to another map until you get to the 
> final provider. The only way we have to support both behaviors is the 
> consumer has to specify (i.e. with of_parse_phandle_with_args_map() vs. 
> of_parse_phandle_with_args()), but the consumer shouldn't really know 
> this detail.
>
> Maybe a transparent map of power-domains would never make sense. IDK. If 
> so, then there's not really any issue since the pmdomain core handles 
> everyone the same way.

I don't really know enough about potential usage of maps to know if
there's ever a usecase for transparent maps.  However, the problem I'm
trying to solve is less about transparent maps, and more about
describing hierarchy in a situation where "leaf" domains of the same
type (e.g. SCMI) can have different parent domains.

When I first proposed this[1], I didn't use a map, but you suggested I
try using a map[2].  So I'm not sure if I misunderstood what you
proposed, or if now that you see it implemented, you're second guessing if
the map is the right approach.

Kevin

[1] https://lore.kernel.org/r/20250528-pmdomain-hierarchy-onecell-v1-1-851780700c68@baylibre.com
[2] https://lore.kernel.org/r/20250528203532.GA704342-robh@kernel.org

