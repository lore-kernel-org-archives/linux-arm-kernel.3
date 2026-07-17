Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0C2C44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 15:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uiFJW7yDa7Q593qaNVa5df8mhuriHuxHGUsJACa+pQU=; b=vKt4Q2lkMlEFR6L9KYOAxi5ntp
	6h3yUvkOpntLsg4WPmXmy+WfShTCTowrTPytopju3si+N6uEvWDruUeDuh5OmfkggGJjlCLjn5oo8
	JZHkM0OA2FwN4YWJqOPOh1DHbBb6aDdan06WhmvaJa7wgMWI22hmCXErqAtAOq8pBkVa5eP4XbpBq
	2+8G+t+UB+mAvgsCKEmc/Nvr5hQ0bcOWnuAGTYok0w00IwZV9XIy0sAF39/FckHGx63M0DhybjL+P
	/t7HF+7h1IcjN96hH45Uq6gwHdRpDvhSkxcyIy7RP4WKpLoD+6AXJtoxJ95tfjioH2CZerFebjdcm
	AbDpg+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjal-00000002UBC-3K01;
	Fri, 17 Jul 2026 14:31:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkjaj-00000002UAg-0Omb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 14:31:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784298661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uiFJW7yDa7Q593qaNVa5df8mhuriHuxHGUsJACa+pQU=;
	b=dt6HE0zcyJd1FzVvI1F6nqYq0Lxbf0RoXlJUPZy1TLrMeie1+bhwejEgJEvK89BR4QJLNU
	AP3q0FJ0fMkGyrKceVLddQPbKTM1v18Wf+ge2vhe3ZJUh95ZGSYVf1IeB94U1eaC7l5ANy
	wE3H71DHMPLE69t4RZXIPUUV34+1rC4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-w4CJtdYXMGmmNpZPpspNtA-1; Fri, 17 Jul 2026 10:31:00 -0400
X-MC-Unique: w4CJtdYXMGmmNpZPpspNtA-1
X-Mimecast-MFC-AGG-ID: w4CJtdYXMGmmNpZPpspNtA_1784298660
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c26012cd0so136179151cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 07:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298660; x=1784903460;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uiFJW7yDa7Q593qaNVa5df8mhuriHuxHGUsJACa+pQU=;
        b=sQcU6yQJSdUCxmIXfoengEUx1yRPF05WCesE/imQvBit3Vrks29XRzlSlUlpes6NdY
         DzyKdB1tYOm64VDesUBX/EHGtyxVwNZwbxXcSB0yKHfYEcPfulZtQ7znTRIBeG9VYLqF
         XffaiMBHnYBJuUOtzWZ+FJMrlAjV7I+BQaGVAGdFFcTaBNUhB3uIhOLwUilYXd0tG120
         tKtPChBUbT+CPDvaje7vxRsuQTg1/34KR/EC5znKpR6pwOasRLY6KG6YGY2HK+8ywBEc
         HMPM8H+jIrnw3JENsGG4Ks/onDfyxaho9ZA8DMHA9QMVFqmSIoIPIzqa1oAzVGYTtHv/
         jDTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq6A5kf4mvYEi/AOUjFXhzxEfsA6CxM5b/pRkLgGmfzEocmz2eDWeZKkjMvSX6Vb4C82qfgAO7cNC8qiAmLeFQb@lists.infradead.org
X-Gm-Message-State: AOJu0YxZFyv85v71HW3CX3frV8ZUQNS0ZmDIO2obNeEC+8R5v4xrLL7y
	Zlix4J/lrlk5bgAN2Yl+zMFITJ7POEHxNZ0GYVp9fShIGD3RxyNr5sNWP9yq5I0Ck8RnnHM0flc
	S0HtaSIJaBNG+WDsDHZQePFKEjLN/3clisOGbU3WPf+yBz4vF+IkdfF2ItHCw3vE3LWT1jvsFod
	Li
X-Gm-Gg: AfdE7cnOc1XTrLgRFQ9rfJ642UP6mMHiiPznlON9dubrOJRE9naym2UAVyQl1NsSoxQ
	ekq4zQoJK1OATXoCCKFAbt5b7dyzhuTEdPG3WpaorsoXYh99jO0yXAHmWl9jJA9QRjqJpgi08xG
	imyjxhRQpgVVi4g6eJF//jNV9JCmhOUQa1AI3nbSJhkS3sganIT6rtNnh7svflBGg4rIgDVtVqM
	Wwb+9OcHmRe9lQn2m9Ba/A7mDSk8zuOKz7ofSpAZa1LAWDoKCXw2laMRxtt46pg+NrXswcoWWNB
	2/kzlnUNChds6/BPg1pOqJoJOIaT0Ks1H8Q/Xk8jOwL2ND502DXZetNEB6B1UCV5QLuWG3wkFsm
	ICVt7nmmI0zQk+l4h5Nv28ZA28hjdpMh82Ec=
X-Received: by 2002:ac8:59d4:0:b0:51b:ff45:bc82 with SMTP id d75a77b69052e-5213daa1d49mr25658921cf.54.1784298659437;
        Fri, 17 Jul 2026 07:30:59 -0700 (PDT)
X-Received: by 2002:ac8:59d4:0:b0:51b:ff45:bc82 with SMTP id d75a77b69052e-5213daa1d49mr25658361cf.54.1784298658914;
        Fri, 17 Jul 2026 07:30:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52149a3ce4fsm13091681cf.0.2026.07.17.07.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:30:57 -0700 (PDT)
Date: Fri, 17 Jul 2026 10:30:55 -0400
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
Subject: Re: [PATCH v9 2/4] clk: cix: add sky1 audss clock controller
Message-ID: <alo8n8NmiB_8l7PL@redhat.com>
References: <20260709120125.3997078-1-joakim.zhang@cixtech.com>
 <20260709120125.3997078-3-joakim.zhang@cixtech.com>
 <allvw2ZiiyX5SGIk@redhat.com>
 <SEYPR06MB6226BD151ABBB192AEC53BA482C62@SEYPR06MB6226.apcprd06.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <SEYPR06MB6226BD151ABBB192AEC53BA482C62@SEYPR06MB6226.apcprd06.prod.outlook.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 59AjXCK1oYldMVcP0b0Latybb3evTk7iwwPIRpSTWVQ_1784298660
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_073105_205373_940B6FF7 
X-CRM114-Status: GOOD (  17.33  )
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

On Fri, Jul 17, 2026 at 09:47:28AM +0000, Joakim  Zhang wrote:
> > -----Original Message-----
> > > +static void sky1_audss_clk_remove(struct platform_device *pdev) {
> > > +     struct device *dev = &pdev->dev;
> > > +
> > > +     if (!pm_runtime_status_suspended(dev))
> > > +             pm_runtime_force_suspend(dev);
> > > +
> > > +     pm_runtime_disable(dev);
> > 
> > I am fairly certain that remove() is called before the devm handlers are
> > invoked. The clocks will be shutdown, but there's a window where they are still
> > visible to consumers. I think you should use
> > devm_add_action_or_reset() so that the cleanup is called in the expected order.
> Agreed. remove() runs before devres_release_all(), so force_suspend() tears down the hardware while the OF clock provider is still visible. I'll move the runtime PM cleanup into a devm_add_action_or_reset() registered before the clocks/provider, and drop it from remove().

I don't know which email client you are using but you should fix your
client so that the text in your response wraps at 80 characters. Also
add a newline between what you are quoting and your response since it
also makes things much nicer to read in the archive.

Brian


