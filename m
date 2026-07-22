Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E80BC44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 12:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTaDFtvYba+0BY3a5BGkT5Gc+0ou3yxmeYhSlSYsXDE=; b=xK84veydIxXfPUeUYtclPX8aNO
	3X7+tD+trklIoBSvzVawyb92kzZ2/6W/hvmvBsyR4v4iHm5KhyyVMoOhzx+maEAcDBm+cp0ewawdW
	eJTpmabizFwrxMG7BCeVl+JGShky9d3cgnPGL+yS9tMojuuq3PIK9JZnd7HRz4fClHWGkYqdwPqf6
	Ln9vLZDe4IxK37/PvjfvUOzBoR6CEnMdzDCOhRb3lwham40BQef8xmJZ091QCefry8xBRkk8y5Vkd
	nFcBj1f0qZ/ZsaPMoDT1PvKDjMqVJ9T0xpl1fjRQjcpZqnOb/PP90EFsDRGsL9mOXuSSIdJWF0Uzk
	zdF+caEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVys-0000000BlCu-0Af3;
	Wed, 22 Jul 2026 12:23:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVyp-0000000BlC9-2DXT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 12:23:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784722998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bTaDFtvYba+0BY3a5BGkT5Gc+0ou3yxmeYhSlSYsXDE=;
	b=JC9c3dfk/uWAoJ3nTitEUAxX0ars4tBLbDAdZBYHER7MvZg+gjydyZSHfwh2aJZ6uPHhW5
	nzOLGj9bXoM0gaQGJ0yTKdaE7tgEtrWTh6vsuhYJkCKRMUyQ9yADJdBXCa011pXAl/CWV7
	iDE/YI0lwbuQBbXXqlcdHqo1MOnulNk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-48CEYWXzNl2KgqhS7DhxTg-1; Wed, 22 Jul 2026 08:23:16 -0400
X-MC-Unique: 48CEYWXzNl2KgqhS7DhxTg-1
X-Mimecast-MFC-AGG-ID: 48CEYWXzNl2KgqhS7DhxTg_1784722996
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f0ed4fe79aso328343836d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 05:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722996; x=1785327796;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTaDFtvYba+0BY3a5BGkT5Gc+0ou3yxmeYhSlSYsXDE=;
        b=WDV6KNhtG6wlV0XZY0l6meUfJWiSM08ILaFtMhrYZe88P+AgxePflnRr5VkHEzvFV0
         +aFUNvivUluruaTeS3wZ3VcGoj00oyCcIhZkuSRCJhcpdbLn7tAN4EOXzAhW+0/AVWhP
         DnOPWzr6Sbz8QcsUFgd/g4cl0etp6+D4B1hUcngfoFvfvYPGlfTBd5Bn4MOqLFAK90N2
         vC+OBOyxkZUAX258UlqjUf3iNrzSwkD/3W0CEAQxDQAwVwfRLAzuMGUiIA6zE2qfNZGC
         /HmDg/tH7YkwoxB0BE8QLfGPlWRLKn1FKtHE6WKze6HbLOFGTRtdRT2PTY37ecYlNd7L
         FqMw==
X-Forwarded-Encrypted: i=1; AHgh+RrSYz1L/GtPwXBpM9QfkV3He8gDw5VmYxr03koZIx/+JtCYFbtHsnw7BK38ODkbwAgQqxqeiDq//MWACVKlBU4z@lists.infradead.org
X-Gm-Message-State: AOJu0YyfUVtEuD7aZsKmGP2eV06G5UlpKxcNFCelfxJaYvOxMCgorJmT
	jcIYsmEMi6pomhK8CJX81aexLIMCRNTeaeGMblUQ4+Vk3NeQvuP+SxB5nVP8FwrqYAGGwdD4j/c
	NrDq+ZHuIfI6FbiPf9r0Tqd32ZtiGC+tERgFnEmiJoN+jirzuaEnMmWynVS/ASFt/qKNUOl7qUr
	ix
X-Gm-Gg: AR+sD10jfPVJCLd8ffwgEqg/PaH4ZZ1PWGUZlSxcBgoK7u7kbVVxcGM6DXiLaAyhVIq
	xKD3BxkvgusRzxQFLoFdmkt9YK8SSEXHFpRy8CmXFQwUQndM+ad4uu1gDsktWiJEmGjPLlZ2wpZ
	N75b+CNyhTlTr8VNu4ysRWPGLXhgF3rAUYT7m8uQlvlraJEGrLPdtNdNqk46kEkYPClvCu4rVlC
	yXxwol0CpjtF2bIgxAZ8FrOSlw1YdtetVyc18qS0HDS3wv1Iv8+G5scFhfe0XYw1EFoXkyEVp1p
	dQf6NsIx9d8phawsv0mZ3E2YmTPYkSj7SvdCbOm6oqLh6ZYpIcBk5SCWayALRdO2bGws/pFPrNV
	RVovo0MtvbvJSbQc7zSk8lmpwEpREM9fHmBg=
X-Received: by 2002:a05:6214:5095:b0:906:2b80:4684 with SMTP id 6a1803df08f44-9077831647cmr253619006d6.3.1784722995986;
        Wed, 22 Jul 2026 05:23:15 -0700 (PDT)
X-Received: by 2002:a05:6214:5095:b0:906:2b80:4684 with SMTP id 6a1803df08f44-9077831647cmr253618666d6.3.1784722995525;
        Wed, 22 Jul 2026 05:23:15 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907bffe6994sm7978246d6.35.2026.07.22.05.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:23:14 -0700 (PDT)
Date: Wed, 22 Jul 2026 08:23:13 -0400
From: Brian Masney <bmasney@redhat.com>
To: Joakim  Zhang <joakim.zhang@cixtech.com>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v10 2/4] clk: cix: add sky1 audss clock controller
Message-ID: <amC2MY4QaCfCBdm-@redhat.com>
References: <20260720051505.1252774-1-joakim.zhang@cixtech.com>
 <20260720051505.1252774-3-joakim.zhang@cixtech.com>
 <al_vGXIW2bP8uGJ5@redhat.com>
 <SEYPR06MB6226C74C33B3EE124E3E0F2C82C12@SEYPR06MB6226.apcprd06.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SEYPR06MB6226C74C33B3EE124E3E0F2C82C12@SEYPR06MB6226.apcprd06.prod.outlook.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sjCEiTj675CNtVxyXHKW-gjMN88XN2Xbx8kieLcnRyw_1784722996
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_052319_643779_763992FB 
X-CRM114-Status: GOOD (  11.78  )
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

Hi Joakim,

On Wed, Jul 22, 2026 at 01:45:52AM +0000, Joakim  Zhang wrote:
> > > +static void sky1_audss_clk_gate_disable(struct clk_hw *hw) {
> > > +     sky1_audss_clk_gate_endisable(hw, 0);
> > 
> > pm_runtime_put ?
> 
> No. Runtime PM is handled by CCF: rpm_enabled is set when the provider has PM enabled before registration, and clk_prepare() (as well as set_rate/set_parent) already calls pm_runtime_resume_and_get() on the provider. That runs our runtime_resume before clk ops touch the CRU, so extra get/put in the clk_ops would be redundant. Doing get/put in .enable/.disable would also be wrong because those callbacks can run in atomic context and must not sleep.

OK yes I forgot about that. Yes, I see it now and agree it's not needed
in the driver.

I think do the two other minor cleanups I mentioned and I think this driver
is good, at least from my vantage point.

Brian


