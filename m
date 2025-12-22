Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A898E67495
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 17:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0f4fyk4zQd9fdm0CypX1izzvghVD+Nvn4s4UeRXutpY=; b=bOb8kUyQ+RXNj4U0q/4Y5b66Wq
	ZuzjOL+ZeXdNHaZGzqmPxC0dHzxhZvE5LljDkLOoIpN6G/BdlfCVKdO7tlNIlQyRdjw3mhMgspEwQ
	ARF2RZmajbShDQeI7BPDgXtQJjNopTghTKhfw9JS6SQ4hEfzUr7GKJ6YONwQ+loJ1plmLqbeiiXy1
	+AN5A6nVxx0nyKwRuWWULfMOT6hsQBKOrcOkfztx4p6xr4WJ3KwQoPzPSCYdZM3Y9qMSKZJw99d/p
	ztMHUGnH/otFXhYaEkYa3RXAzFY1bllNIWtTvyP0znf6yYso4kjdVFyNvE3K63I4EjR1B9poMZ/QG
	Cezhr6HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXjGS-0000000Dzyx-2c1o;
	Mon, 22 Dec 2025 17:00:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXjGQ-0000000DzwK-1fNW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 17:00:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766422803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0f4fyk4zQd9fdm0CypX1izzvghVD+Nvn4s4UeRXutpY=;
	b=DynX/JLywm7WGzHdQeYUDFRE67wpzJImZS2RNXAvPtjf3hAcKq1y+ZsxJELoCwnv8V10DX
	W4seGhz+4taPvZrRd+H9dvyRUPrp4xF5UB2tgBwPNhkrmMjAw3lZD9zPqQn2YRCwPoZaoj
	/FsiHyjw+advtHQBisYYqyRH9WwP7Uc=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-ZJ2GQDbTNVSIbTyB6CgyZQ-1; Mon, 22 Dec 2025 12:00:01 -0500
X-MC-Unique: ZJ2GQDbTNVSIbTyB6CgyZQ-1
X-Mimecast-MFC-AGG-ID: ZJ2GQDbTNVSIbTyB6CgyZQ_1766422801
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b24383b680so1374612685a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 09:00:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766422801; x=1767027601;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0f4fyk4zQd9fdm0CypX1izzvghVD+Nvn4s4UeRXutpY=;
        b=FJF3hDDTuWofCGgS0veuIkx6kFoCan7coF+Txfpx3eT2WB8BdqdoUi7vch8tcYeRXW
         92aa5RHjdzNCYBaSaurkL8d2AtRWNdBcsvCDrTyEP2wx1+v6y9+iz9226V4dNtq+PAwS
         mbb1aL23D9lJ2xEksmmVqmLTwRztYjusnqU+XSS6ormuzcMFaP5+qmToG+svz8A5TVCM
         srFKlrfntFMvUDpDDNpWz/k+K4PwVsw91f51rniJ4nwfDYa3Y7UQQuF/Xp2KAWAn2MgY
         fuys1FMxUTBrLyadaryCYjif/LfoVgQ9djgBCujh0gen5lFb8BD0UpZuEpah/gna6yId
         3uGg==
X-Forwarded-Encrypted: i=1; AJvYcCV5QuaulDXNPL+/dLs1Xbbomh7eR/IpnqAycND4vZh1+0REOsvoEXhXwm0sd1uKSaHsvSE/fbWwqeYaL/vervvP@lists.infradead.org
X-Gm-Message-State: AOJu0YwlAVGwB8/enMRi1/cqmBPFOFJnz3P6xhZabgbHYOxlcksBr85X
	4Uvfkyp0s4ZyHCGis3tDd9uGIK9xcWRXOPBnwO2fWN6ucsKKgi3Jj3PQmQFI6hXJ5Ybz21KCnOE
	F6vWq7bah7MX+QZ5Qm6TGivSWk/DLIYZNy6tIV/wOcchc3o8m227HQ3rFHFM/JJ10FeQT1q3AyI
	QG
X-Gm-Gg: AY/fxX6X3jfqxFouYNMEss4hKQv2R8ZZspdo5yJPbMrF2E+OELVrZTnFTHZyIjml18H
	5ciVYhp51inrqezCiSyIiZiExx02tEioHG7asMzvTYPRwGl/HNSh9BV+05g4PkEErKcwJtCd7AC
	JEgkan8UM5bwKV4j3xYyoqh7DyhESmrrzJkzqXiIGQq6aQ24uoviTN5OWQBHmUuyrBkyRjxmOvl
	QKn8ZmMcGKTSXoa+UYk2pzxLesXUqmuZ/5J6UNXNhYN+vUsWfjjJh/4PpZQRprj1rf1Jp8sO/0S
	ZqpcWXqr6Dc0ojC5UhBXoAuv1RL3T8WLIxJUF3MbgW24NuWCwv18Q13iMYnHFuXQlgG4Wc9nnhQ
	wBRp+4ZI9dCIZNxUlJ3Q6Pw7O8w9gdlVPrru7/7x2HYcY
X-Received: by 2002:a05:620a:691a:b0:8a3:22d7:6ca3 with SMTP id af79cd13be357-8c08f66c311mr1952381185a.31.1766422801414;
        Mon, 22 Dec 2025 09:00:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEAXWK3aLK/w4OobjiC8eVjtvAbAxtwT1W5l5sKLlnUZ5at1LIDG+lvn7LFEDMGYJA0qFTMJw==
X-Received: by 2002:a05:620a:691a:b0:8a3:22d7:6ca3 with SMTP id af79cd13be357-8c08f66c311mr1952376385a.31.1766422800985;
        Mon, 22 Dec 2025 09:00:00 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997addd5sm86399716d6.33.2025.12.22.08.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 09:00:00 -0800 (PST)
Date: Mon, 22 Dec 2025 11:59:56 -0500
From: Brian Masney <bmasney@redhat.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Mo Elbadry <elbadrym@google.com>,
	Rom Lemarchand <romlem@google.com>,
	William Kennington <wak@google.com>,
	Yuxiao Zhang <yuxiaozhang@google.com>,
	"wthai@nvidia.com" <wthai@nvidia.com>,
	"leohu@nvidia.com" <leohu@nvidia.com>,
	"dkodihalli@nvidia.com" <dkodihalli@nvidia.com>,
	"spuranik@nvidia.com" <spuranik@nvidia.com>
Subject: Re: [PATCH v15 3/3] clk: aspeed: add AST2700 clock driver
Message-ID: <aUl5DPMq8jC1xjRu@redhat.com>
References: <20251010072540.666673-1-ryan_chen@aspeedtech.com>
 <20251010072540.666673-4-ryan_chen@aspeedtech.com>
 <TY2PPF5CB9A1BE64DCD487138F3BAC4FD34F2FCA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <TY2PPF5CB9A1BE64DCD487138F3BAC4FD34F2FCA@TY2PPF5CB9A1BE6.apcprd06.prod.outlook.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FwgUmtjUHy9QAB0lgVwoEYP6_5wl4sIJnycKmYMzqVA_1766422801
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_090006_518817_F068C768 
X-CRM114-Status: GOOD (  17.14  )
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

Hi Ryan,

On Mon, Oct 27, 2025 at 06:24:59AM +0000, Ryan Chen wrote:
> Hello Stephen,
> 	Will this be accepted in clk-next?

Given that aspeed is a SoC vendor, and you already have multiple clk
drivers, I think at this point your best bet is to do what the other SoC
vendors currently do. I think you should:

- Create a new subdirectory drivers/clk/aspeed/
- Move the existing aspeed clk drivers into this subdirectory, and
  update the Makefiles / Kconfigs as appropriate.
- Add a new entry to the MAINTAINERS file for the aspeed clk drivers.
  You probably also want to have that entry cover the reset driver,
  and any other aspeed-specific drivers as well.
- Post that patch set. Include this new clk driver as a separate patch
  in that series. Feel free to CC me to the series and I'll review it
  for you.
- After it's reviewed, wait a week or two, and send Stephen a 
  'GIT PULL' using git request-pull. I can help you with the workflow
  if needed.
  
  One important detail is that you want to base your branch for the GIT
  PULL on the lowest common denominator, which is usually the latest rc1
  from Linus. So even if Linus is at rc5, try to base yours on rc1, unless
  there's some issue, and you need to document why. Stephen should get the
  merge to newer rcX branches from Linus, and not you.

When you send a PULL to Stephen, you can use 'b4 am' to assemble the
contents of your branch. When I sent him a PULL a few months ago, I
included the b4 commands that I used.

https://lore.kernel.org/all/aL8MXYrR5uoBa4cB@x1/

If he accepts the pull, you'll still need to post your patches to the
clk mailinglist, and have them reviewed on list. Folks from aspeed
should do that review publicly on the list.

Brian


