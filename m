Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9502DC55162
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 16:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XjO18nbJbiIjdwy1Ooeo07xeKl9j1Vrh8YDkz9Zjps4=; b=SHbnCMHNeloleLma5VtytzQQdN
	Fb/5keWn9z1sgkh/B7w6U9veuvxEyZIzJj1bPJ/rMfU5HjWdMiP/WjWGj2Wdjb0PXlnFy2dGTZJPx
	D341+YgO1Wd5UMjyawASl0oqKg8MUlR9lT9cVj9GHTW8zJROHiG+ktjXvJzJc773HotGKxjjLeEaK
	/dQbt87x/mep79f5hMoUrGUb9hRXtf9RzUDaBOsHgFRx6ALI6UJiU0Sl0xGNZ2LoOTvx+BKQYfc0z
	9M+hKpHjD9/WP/Y0/rO0+j7/Gre+7P2wYZC1qb0mi5YZeRTzwo0MfuGCKA+cgittobNh4Ziwzp/tj
	2U+prQCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTfZ-0000000B02H-2Phz;
	Thu, 30 Jul 2026 16:31:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpTfX-0000000B01v-1dwo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 16:31:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785429098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XjO18nbJbiIjdwy1Ooeo07xeKl9j1Vrh8YDkz9Zjps4=;
	b=IlmkquUb6Od1dUnK8+FhDu5Snsk5Yp+gWKs7yeafv8KOgyZjYUA5H1cB6PJ3FFuexEZgAQ
	Hz5H6SaJ13z8RttbT0MfyY3VLcmdC6Y6sMqQoD1oKvdAXRcbUkpvSSpNbiMkcPptIqa/nq
	HH4rZkJjAWW8hgsaVJkcj4UQ79DlLR4=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-uLzuvkSzPU22zifjXdRNSg-1; Thu, 30 Jul 2026 12:31:36 -0400
X-MC-Unique: uLzuvkSzPU22zifjXdRNSg-1
X-Mimecast-MFC-AGG-ID: uLzuvkSzPU22zifjXdRNSg_1785429096
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6688d64bf53so4542436d50.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 09:31:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429096; x=1786033896;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XjO18nbJbiIjdwy1Ooeo07xeKl9j1Vrh8YDkz9Zjps4=;
        b=L5Ft0D9WmnU0i1S+CmAkeZIDVZ+FtmHfFITXexmTpX04LxBe+cXwmAeSEAbjVdILZN
         zIWMvffzav/+klbV0LPLoI8hgXOIv6HdjLBJWajTIUNibiJehBmlweWx6RbTX4mIrHjP
         OZapwqX9BNbkIUFKQb4Oi7sheph5QVmtMr06PSb3ZT4L1Soc8li8fjMk4NYxUnSMIVOE
         QfakqvVKyzS8rMECdT3AXwba0GvWL7vw/2JLrqVDKC69sp/X2SS5MsFFBhfDcRR/jkYe
         P3TIUqSP2HrkgX1ssEKtUZaZLHr6q7HYR8hh/kLrZTvvbmmoFQHPMh66RkuxtZP26Yxm
         hjHA==
X-Forwarded-Encrypted: i=1; AHgh+RpWZvAlzCmZBFIt+bAApmIXL2vanaoUFDXN6xDFJOSbnulmfEjm3YE1vWeueo9WMNewtB4SHyn3+PFR/e/Oj7Jo@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg9AgDsF5pc4I1gQ1JekN8IyDoWAqoRux9FDSaLR5LsbUPnB8l
	bMIsA3EY6fdV+slziR0TWsli6WTPTg6bDXKRCnoWwYZeejHSLzp7gVVShYu3gD0eAFBty8yem1V
	ea8DK4lLlSSMyOS0G5SXBNFPvR0Qm9dKhGXujf2eM1GIRnEXkl2hcc/r9rqz6mXJ6lN/SsIYd57
	Gc
X-Gm-Gg: AR+sD10/49gvrSxGmEzdzkLQp2KIegjFwJDo7/9h0l3XD5vBcBkcnLIhKb6hUoOqrk4
	Iv8zVNt50hGbVUxCOltSCnh9VI+19RmYUaqioiZgLaTVbC7EQVRSWHHho2TWEFHRhdZi7848Pyn
	QGb5PmoBQVQ4Ojsi4l1CdOt99/JcoSYsJRPofTUxY/LOKqFadjT7NmP940fe6jgwREqxs5KQAdt
	uLdokRgrvqkkqIwnEwIbeIMcdaAmLdLldE6DERokCqup5boS7toALKEfOQ70Lmcp6Em+eFtH4Er
	9M+EV3R2lu+q0sJHQFCyB5VhuvsaZcobxvBdPpOfXGA8ZCmF9p2VnyNOkQFMWtDyukyNOrR0P9E
	uVBmJZ9XLH97BBKI/xRy4MNvxsaNPpugmYhM=
X-Received: by 2002:a05:690e:4809:b0:667:e8a3:ebd4 with SMTP id 956f58d0204a3-6693a328de2mr569815d50.4.1785429095935;
        Thu, 30 Jul 2026 09:31:35 -0700 (PDT)
X-Received: by 2002:a05:690e:4809:b0:667:e8a3:ebd4 with SMTP id 956f58d0204a3-6693a328de2mr569786d50.4.1785429095425;
        Thu, 30 Jul 2026 09:31:35 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6692c8e57f2sm1632516d50.13.2026.07.30.09.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:31:34 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:31:31 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v11 05/11] clk: realtek: Add support for phase locked
 loops (PLLs)
Message-ID: <amt8Y84Z0O3ZEVnk@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-6-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260728142806.1954638-6-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zqdd141Kb4OTusIJ5ylkoi65a9FNTc6OzwKMdtpoIic_1785429096
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_093139_525702_7DE98935 
X-CRM114-Status: UNSURE (   9.70  )
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

On Tue, Jul 28, 2026 at 10:28:00PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Provide a full set of PLL operations for programmable PLLs and a read-only
> variant for fixed or hardware-managed PLLs.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


