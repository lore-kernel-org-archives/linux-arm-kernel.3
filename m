Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0294C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 05:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbzQq012R+ejKYv+RlREDKeINIqzcTFsS8nbpKDjfuY=; b=nmuiEGU12/D9C8Wj4cI81lXdb8
	CPuc59jBksAQsf5J5ZFvszu0dw3xIN06gj+n8GmB1ABTFgk/lTN7yYmougUcvIFBiBuDh7WlgJO2U
	zWX/lpLGaoJIG94MZxaN8oaU0qbMHZZ1wWj2cx7kQrD5bTw9uSVRWJxBlZQAn2p3cnkLyxThtU8uG
	uLNAwOjz6cHqGI64IWDGdHCI3gWIh2A857Yl5z+rOOK/TWCxE68zMj1qTse3lzL1rENRWv1xLidft
	uthJ0ZouoKqVkIxQcAZOLznu7sLRP0mI+PuzQumVB+ow2sZRyQE+O19VEhtS+++r1FnMka7irDM1q
	xAXImEgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Lgv-00000005F3o-1RzZ;
	Tue, 15 Sep 2026 05:26:49 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Lgt-00000005F3R-25sz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 05:26:48 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-8692a8568e9so2142505b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 22:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789450006; x=1790054806; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbzQq012R+ejKYv+RlREDKeINIqzcTFsS8nbpKDjfuY=;
        b=fXkwS4RSv717uWFti7XuZUycPKo1dHbwSpE6/mD34KG15wbmCeCgnwGeiDzjomL3h2
         ctGIaD7CXMUzw+BHZfxp5XA++dsFpJ5JD+u2agdtK5NaziIlP9Ejp9dGyaPW1r4S1LgR
         bPCGB4m45ht9KB2Nc1wcIGXwZq1t6tB5r3JSkFtRv2e0vOYKJcbI1p69KoX1Hl+ybQ/9
         fYZjoT1z3HjRLDqqeT3rG4U8TwgUNc592Lvvx+tR9t7c2Hdx/j6kB3wZmwNWsk1lnuz8
         JU9zMxGjqGXsj1r+A9bKRDNUbDcQU2X4hwuy2bUC6JUHREBdz7U3yuXNGctN24h6oTh7
         cI9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789450006; x=1790054806;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vbzQq012R+ejKYv+RlREDKeINIqzcTFsS8nbpKDjfuY=;
        b=uzoHGOFTvwAzXNFO7G1Ok0bta9g1U8tJw3WmwAXrRYv/2OKJAStlLTrJBHVG9i+RHn
         VsNzFUyqbT6tkIMW0XERmEw/AXomW1X8/RSiE4uEhViZ0lpJbt/O3cN9MZYsmI+WC85z
         qCMNR63XVCnavvJSGT23em5od+CJSSPB0QYyMbVKGpeT4CKGbqNB7Xu1TNK1qDC6YSQ1
         iUlVh4kPxv3lbuTLH/j9x5ydkrczIHfPFbhUE7cZGywAU3SkZCDWfivnyyjgy+EZ52xY
         l3INF3BfwHjZyBEbniu3ukvIlMOf3N0ORF1lyjK8gbrxPwCpclcKu5C/Q9JSRA0aZj3q
         bLNA==
X-Forwarded-Encrypted: i=1; AKwUvByvVQizFam5kElSG6D6F+lOR1eCzCgVjBZlWE4W1pGRMLWqwKSad4wqGR0fVnVhB+/vCmyWN/+LK3HzWtwZMbWn@lists.infradead.org
X-Gm-Message-State: AFuF++mj4QtEeY15RUqRIkD7Wpf0qK2g9fR4yIxL/I7LpVJaTKP0DUab
	/fI3fad9+hiz+9X3GB94TuXFC2kW42mcaVTyCcblHlGmyn6owW2uANT7
X-Gm-Gg: AYBFou2N185hgzj7FgHSXVC6IgafwFfVAo1d6YNbmQDX8Ek/PsNpJ8zHelfQUkC5ST+
	/7iZud8mF96VnVtyBV/3aOO70mLqqV5ECmhKidDLXwd18jirVJWo0YwuEk8QhhOh1J0v8FnNt/V
	+aIU+N+Jwl2sry/9Ytbs02x8nCypTfXZ1B9m9bxwwrVcbK1x1rBkofYHvXYOoN6k3ClH6ED3gYA
	IsPo8guN0TrpQDuTRHLqyyVvo9c/FlXm6Qh2+Bt9hYvekJo0Ws2Y16JhCdn4epV8LqAA8bGMtj9
	tTaTmeUx/zBpWjek8dWiyiG8eCVvjNGObRtkvtA+rUPnIIiV7u931WTZb/gQdHc2j25/8If2G7w
	2xbEQZvF+vMncj2oMW032Jiz5KTSemPyY2Ub1pDzqmqOomAJWDMgEV73iBUbsHxlDp/pc6exm9j
	wfrEM9dHGGn4oOmObzaBY67eJYV+4lpj0cmN7F5iCLV7rMIkv+ANAxlhCEdB20UCiiZiOBaeUIS
	ua8TaM8WdPUYKvO4g476QoynMWEAjyy3IkSgSHIYyG/83UoxU8qc2w=
X-Received: by 2002:a05:6a00:420c:b0:855:eb7b:5804 with SMTP id d2e1a72fcca58-86f8314fd92mr12578546b3a.4.1789450005819;
        Mon, 14 Sep 2026 22:26:45 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b287c06d9sm5675699b3a.15.2026.09.14.22.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 22:26:45 -0700 (PDT)
Message-ID: <b8a8a65b-e302-4747-bc90-4920fc48795a@gmail.com>
Date: Tue, 15 Sep 2026 13:26:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: nuvoton: ma35d1: Use clk_hw pointers as mux parents
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Jacky Huang <ychuang3@nuvoton.com>
Cc: Shan-Chun Hung <schung@nuvoton.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, stable@vger.kernel.org
References: <20260813-perso-ma35d1-upstream-clk-v1-1-e78e5e6172ea@bootlin.com>
 <87o6e0nfe4.fsf@bootlin.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <87o6e0nfe4.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_222647_567391_0A66D513 
X-CRM114-Status: GOOD (  19.66  )
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

>> The MA35D1 clock provider registers its muxes with parent data
>> structures filling .fw_name. This is not the ideal approach since that
>> would require a massive amount of internal clock names declaration in
>> the DT. Since the DT does not play the game of exposing all these names,
>> none of the parent lookups performed when instantiating the muxes
>> succeed. As a result, these muxes get registered as root clocks, leading
>> to a sadly flat clock tree and no frequency assigned to most of the
>> peripheral clocks:
> Jacky, this is an actual fix which is a month old now, the SPI
> controller (and maybe other blocks as well) does not work without this
> patch. Would you mind giving this a bit of feedback?
>

Hi Miquel,

Thanks for working on this clock parent conversion and for testing the
MA35D1 hardware.

While reviewing the conversion against the existing clk_parent_data
tables and section 6.5 of the MA35D1 TRM, I noticed an existing issue in
the WDT/WWDT clock definitions.

The original driver contains valid parent names:

     "pclk3_div4096"
     "pclk4_div4096"

For example:

     static const struct clk_parent_data wdt1_sel_clks[] = {
             { .index = -1, },
             { .fw_name = "lxt", },
             { .fw_name = "pclk3_div4096", },
             { .fw_name = "lirc", },
     };

The TRM lists PCLK3/4096 and PCLK4/4096 as valid selectable parent
clocks for the WDT/WWDT blocks.

However, the new conversion changes these entries to -1:

     static const int wdt1_parent_idx[] = {
             -1, LXT, -1, LIRC
     };

This loses a valid hardware parent. I understand that the current
driver does not register corresponding clocks, so this is an existing
driver issue that became visible during this conversion.

Would it be possible to cover this in the series? One possible
implementation would be to add a preparatory patch that registers these
fixed-factor clocks before converting the WDT/WWDT parent tables:

     hws[PCLK3_DIV4096] =
             ma35d1_clk_fixed_factor(dev, "pclk3_div4096",
                                     "pclk3", 1, 4096);

     hws[PCLK4_DIV4096] =
             ma35d1_clk_fixed_factor(dev, "pclk4_div4096",
                                     "pclk4", 1, 4096);

The corresponding clock IDs should be appended to
include/dt-bindings/clock/nuvoton,ma35d1-clk.h without renumbering any
existing IDs, for example:

     #define PCLK3_DIV4096  236
     #define PCLK4_DIV4096  237
     #define CLK_MAX_IDX   238

The WDT/WWDT parent tables could then preserve the original mappings,
for example:

     static const int wdt1_parent_idx[] = {
             -1, LXT, PCLK3_DIV4096, LIRC
     };

This could be submitted as patch 1/2, with the parent conversion as
patch 2/2, although please use your judgement on the final patch
organisation.

The other parent_idx definitions and their ordering match the existing
clock parent tables.
I have also tested this version on an MA35D1 board, and the clock
parent conversion appears to work correctly for the peripherals I
tested.

Thanks again for working on this.

Best regards,
Jacky Huang


