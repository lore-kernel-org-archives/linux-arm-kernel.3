Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C842FCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 19:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eJklgM7Ntm5BMtyc/cSU8HBd9g8djuSELpTKH6fZV4k=; b=wrWAPJCQ+SNvxgGngtys/65nTT
	QTVIXifBI3+BHrU6lB3eqyaDvFNSFyd0OsVocuJwV+9zh8PIHYEVQdTIBbkWYuALHkEosKhRp936n
	1GEfeAmnYkDT+vZ6tntknH3OwKZ72rlValUxoKjcTqhS60qrc6HOAQ+yvUosOkGklHT+3fHhtsyxI
	Azbk1zcYSwblM+BonQugM+Adw9x1HLHjUWFu3YHiIZipIOkPcBP4WQA4kxOlpt6BlpQwenEQvZeH5
	KPB8xvqqcBAT6wOhiFhzXwsuhNuG2hXCabzSHX9hP20P6SLljUm1aoPRdvSpdMiryQ2m/18jN1w0S
	3L85dG6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uri6T-00000002xKT-0rUS;
	Thu, 28 Aug 2025 19:16:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urfsT-00000002K4C-1VsL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 16:53:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756400012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eJklgM7Ntm5BMtyc/cSU8HBd9g8djuSELpTKH6fZV4k=;
	b=i+6OGS0lKSujK9oKhLS1GI6npiZcCBMuXaro8SpUeCUc1NkrrI1t1UUR4uNLs2MkFtAmTy
	caAIEpK82PRSSM/0JROfWxtwhhtERPMhaGXEvFcKBRxqWrqxpumRHvj02jUTXlgAOG+hE7
	vqLR2tvd0KOQ5G08uzHFZnsdIrY2Tu4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-8Ry0RMHNP8GxobTbcEzrng-1; Thu, 28 Aug 2025 12:53:31 -0400
X-MC-Unique: 8Ry0RMHNP8GxobTbcEzrng-1
X-Mimecast-MFC-AGG-ID: 8Ry0RMHNP8GxobTbcEzrng_1756400011
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7fa717ff66bso190201285a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 09:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756400011; x=1757004811;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJklgM7Ntm5BMtyc/cSU8HBd9g8djuSELpTKH6fZV4k=;
        b=Zwoh+qkxk9+YB7tuS/Qk0JDkk76QYqA3/H3eYFK+OT1gEXZYjmSVAx1saZsYAoOUtD
         xA56HUNCaWpA72xgF8ipXEhqcnUxCC8ALdJ1P5WCM8vhjLS9lonCefONoFc+R0KZvluo
         g7852T2iFcLt6wMgDRz9/CI6D/XUCiKye4anXnywmV2pOqA40HVpEdS6Y6/Nr50dXocZ
         zE7pFxPYwZ9M9a+83HL3TaaXBfy8db56qUc25qJqhlxZTNFxO53QEARlqu8tEIUZIRL+
         hFoza5SdImgXePejpuwcoNl2pE+lX3UPpZgAMD1gbJrqnw0OChW1pTek552XtfSKJh8Q
         hp7A==
X-Forwarded-Encrypted: i=1; AJvYcCV2VcYPx15mq8fUraUpdxW9DiTSFMDVYvgVN9YEwUn4EyX3Moz7M43Z30ul8oRgPkzMB4zyg5ldlkOmAb1DqJ19@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+WI2lp25vge0ZDBRRfIdPQfGJkRdfW14CGuRQG672h1oIbl/x
	ecE4DTgS8I80Xd/fs7VzjsNTEq+NMhjdPHhWtvUG7PtWoC7g+gZmizYOIK/mW6rWRqPRos8n5Uh
	PQB90JPQM9dVWyyXu1eL/TISe2jGF8LeV9CjOWYg6v/Hl0KAPS/YmwjNJ6vb4Umg7uCNUIOetzd
	nw
X-Gm-Gg: ASbGncsAsMSodtTDymK9UXB0lLOimU5KvkaQLNH7jBYXcAkZ+otzv/o4EnBWnJx1JRA
	OGtoeM7Lc+LLm7ppLrdmx7fRMevo0JeTG7NgPcB7etOBbl78wPvKKOoOVx03NSy5ECzKNdY4v1E
	KszrmpJp48BqIJfahafrWnPdAbm/sSuPkao+joPwhvJHaRrh3T/fG4lI2lCUvlSadAeD/gBbMcS
	micORFl570y2MZiPUlfERH54ylAS53cMF7Etkrt7zZ+jKm4lgi6ZXDJSv2rbw6F866Pxb1dlB7X
	lpPFFgueV9XuonnGdU0na8mBBaC34ZUzFcX2Xoy20wn90y6jR/QKFOUmgIrWbQh4ni1sSFse/Zv
	Kd3mc8XW+ZkOh2ycIWfo=
X-Received: by 2002:a05:620a:1a0f:b0:7f3:d274:a318 with SMTP id af79cd13be357-7f3d274a41cmr1467899085a.45.1756400010718;
        Thu, 28 Aug 2025 09:53:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmWvmcBXzR5JVgeu8M2Tdex9HOUc2fcKiwnULMHR1EAqpd8F04fKPVsKpKvSeoVzTgNpi7Yg==
X-Received: by 2002:a05:620a:1a0f:b0:7f3:d274:a318 with SMTP id af79cd13be357-7f3d274a41cmr1467896485a.45.1756400010374;
        Thu, 28 Aug 2025 09:53:30 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc1484a7a8sm12294685a.43.2025.08.28.09.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:53:29 -0700 (PDT)
Date: Thu, 28 Aug 2025 12:53:27 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ryan.Wanner@microchip.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 02/32] clk: at91: pmc: Move macro to header file
Message-ID: <aLCJh_tDnTl83Vtg@x1>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <6776f06473d3be71882ef938a4314947f565e26f.1752176711.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
In-Reply-To: <6776f06473d3be71882ef938a4314947f565e26f.1752176711.git.Ryan.Wanner@microchip.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V5TkI-uVyx9ozxQB4x1dfrHtqD2kgTPDTHszYA6bB8o_1756400011
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_095333_555792_27376FB1 
X-CRM114-Status: UNSURE (   9.72  )
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

On Thu, Jul 10, 2025 at 01:06:55PM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Move this macro to the header file as it is used by more than one driver
> file.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


