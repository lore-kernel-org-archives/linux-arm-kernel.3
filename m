Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F14C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 17:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mRtVMgZ55zLMGI/NlOCcgv9aGOQgHktJls4Rai2LzFE=; b=Qn56RMnfa7d27iSuFTdTIf2qf9
	yynohWkirhsuWXZTL54RhTu6iEjFt556cONNyo8d/n0Xxtiw6Mwb88/pex+UInTYNrWVi3QVMXymA
	42WW+UiKUbZ8lEGcoUqWJ7PRZIU91X268UKVRQ2QgRaklgOysMmSdf4oLhSlLVCnUxTT2MUaKO7gu
	o9wA9OEq+QCnk2aBKHZ0irRwsJpJh9hqq3WP0y3l7P4xy1KWtBjkvkiUFoQEhaTaMyNd2EhdNWbGb
	xjtnczPcRdtJt2SzPGbCwFlF+T0Jq5jZ9wNcCBnZ/2mH3aiuGjmJdONdxODG+GLyONyAPSV0MrFCf
	Mv06M12g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqF1I-0000000Bgmg-3AuS;
	Thu, 06 Mar 2025 17:28:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEvw-0000000Bg2E-1R5C
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Mar 2025 17:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mRtVMgZ55zLMGI/NlOCcgv9aGOQgHktJls4Rai2LzFE=; b=ZiKDlKId5r3q24YKmDjAvzyVP+
	Yt2NfJUPiNTwlH+/b2wCkLUT1OA4fhEzrexz0BRHO6nlTxwNtKnFfk7XWG69wlyxg0wS1GRf60pTH
	EMzMv8dtFILWE7gqf1gDsljyRendt91WZbZzjdvQMyogQRNKJ6AcCWrdy7DD+wxvw/s+C5oni4PlJ
	D32Ml4LUletoEK8EaUo+UwWEwx0/LGLHwT1M1QIZIyYva3gkTNclhvk6/EFTDPTMxGP0q3UlADg6w
	EhQMMtt6IgCr4laKH3DYpoz44AxCpB/I1+rp/KTrjzlq5BlexN/W7in1jyJnuFhvCNgdQzSPh6luX
	KoxQ+8kw==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEvt-00000001B9w-0TkL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 17:22:55 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-223f4c06e9fso18897575ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 09:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741281770; x=1741886570; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mRtVMgZ55zLMGI/NlOCcgv9aGOQgHktJls4Rai2LzFE=;
        b=bE7X8N2V5j5zlWoZcqbwOiqYP4xSJnkTNcnkAhC/XOhmdkps1OYBYrXu3WsPki4ctQ
         xGBfFlYKTPqGJl00N8gGFTBxFRlyR8kzdhZzb/oSVhMhGA0KvElLQX36Jo95UxRcGa1J
         NgJ+zfZ/omHwKStVD6ZcRrdoKnuwH4GLH8b/ldBLWe0LyF7C5PGNiCZxJXg3OPMQSKOB
         CbtqT2hBV+BhBYR6wHS21dDBhR4ztNy1P8Hy+tB+jqExfosZH2BGAH+OWq8gO4IGxbVR
         PWyn7YV6k8CD95bbMeY08iH5JczS6kupZgWsPqyGhrtktAMxdqDLVjWX25IjgVCh4/fW
         yjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741281770; x=1741886570;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mRtVMgZ55zLMGI/NlOCcgv9aGOQgHktJls4Rai2LzFE=;
        b=E2tdpoqQdhMOCwUMXj7sn00IAKHvLm9JJNAQUxJmHWsLeJSA7Wz81cpgapWRQEHnJR
         remd4RVuUTfqIDwIzjM4JakzkXJA05BNbxmTAgzoVgzFgJ5r4wyD55+aqLRVisWaYJU8
         IU69RgJ1kOK0itWUysNWM94s7y1Sbyt7FwhwEkSqIlZCqJ8sgCsPRvluQuxHf7N4LniB
         SWEGgxJqsQrxWPaC7LJrVyNjgZfCyyhFbJ6/EMvxP6XiwwBy6b+yl0772apEhHqvVUXu
         hUMUs2DMBd6nhwENkJ7f+FLXRVjj0gTSelL27hg4ItRBzf4O3xf8RWaacPojJ7qc/vrB
         CXjg==
X-Forwarded-Encrypted: i=1; AJvYcCW+3YV8I5b2Ifm6EfINrcQRoWafe6uj29MsvXrgxdHivuI8WuFNnbM1sEHDtaJXwVoze3UDtHA0yldpQmfc79Ll@lists.infradead.org
X-Gm-Message-State: AOJu0YxVIjOdzGWNw0jDwSjBwxZ/rO7WVbPQ5Wy4h6LIUpM/v6I+sT7H
	nJ8tvrUWzkpIWkEAUCwhbMSiyzPtE3PICkZK5HfKopW0HUpbJP5L
X-Gm-Gg: ASbGncslxnJl+MjHAMsPiR0FZR7dGcFAsyc1dbfveXvqVT26ecTOL0Fr2untZ/kbVin
	tp2EKhgrPF+Y8jRXrT6NxQhlTwvH49ls1wPNpQ7zMosn1cNRNKPGp/Y8r1w4Zi478w8K6APhSfC
	42ISHvvRvpD8IiVm5t/qfe64NrvqGq8M5iLPjz1MPPylnypiAiLWea8L9hhNoogULhNgANHASw7
	fJq+O1Y+wW+uXhNmuGQV+g7ZaTg6yDCAemIb47fh9iDQS4kgESFMIZgTZ0StoQ51dbhgOhP4AuH
	V+P5d0yq21GsVi4hb/PWcppGylRHGv3mqMvNsZwOZGSdOLH4624yldcitA==
X-Google-Smtp-Source: AGHT+IH26VxHQcLOQhDT0ENeuoRX0h2QLaU456Pm5UWb84f30oMCU5DkYbKfP44zoaE1dDrw9v5TnA==
X-Received: by 2002:a17:902:e845:b0:215:a56f:1e50 with SMTP id d9443c01a7336-22426fd8a0cmr4582335ad.8.1741281769817;
        Thu, 06 Mar 2025 09:22:49 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410aa4f83sm15011285ad.217.2025.03.06.09.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:22:49 -0800 (PST)
Date: Thu, 6 Mar 2025 09:22:47 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: George Cherian <gcherian@marvell.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
	"wim@linux-watchdog.org" <wim@linux-watchdog.org>,
	"jwerner@chromium.org" <jwerner@chromium.org>,
	"evanbenn@chromium.org" <evanbenn@chromium.org>,
	"krzk@kernel.org" <krzk@kernel.org>,
	"mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
	"thomas.richard@bootlin.com" <thomas.richard@bootlin.com>,
	"lma@chromium.org" <lma@chromium.org>,
	"bleung@chromium.org" <bleung@chromium.org>,
	"support.opensource@diasemi.com" <support.opensource@diasemi.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"andy@kernel.org" <andy@kernel.org>,
	"paul@crapouillou.net" <paul@crapouillou.net>,
	"alexander.usyskin@intel.com" <alexander.usyskin@intel.com>,
	"andreas.werner@men.de" <andreas.werner@men.de>,
	"daniel@thingy.jp" <daniel@thingy.jp>,
	"romain.perier@gmail.com" <romain.perier@gmail.com>,
	"avifishman70@gmail.com" <avifishman70@gmail.com>,
	"tmaimon77@gmail.com" <tmaimon77@gmail.com>,
	"tali.perry1@gmail.com" <tali.perry1@gmail.com>,
	"venture@google.com" <venture@google.com>,
	"yuenn@google.com" <yuenn@google.com>,
	"benjaminfair@google.com" <benjaminfair@google.com>,
	"maddy@linux.ibm.com" <maddy@linux.ibm.com>,
	"mpe@ellerman.id.au" <mpe@ellerman.id.au>,
	"npiggin@gmail.com" <npiggin@gmail.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"naveen@kernel.org" <naveen@kernel.org>,
	"mwalle@kernel.org" <mwalle@kernel.org>,
	"xingyu.wu@starfivetech.com" <xingyu.wu@starfivetech.com>,
	"ziv.xu@starfivetech.com" <ziv.xu@starfivetech.com>,
	"hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
	"mhiramat@kernel.org" <mhiramat@kernel.org>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Subject: Re: [EXTERNAL] Re: [PATCH v4 1/2] watchdog: Add a new flag
 WDIOF_STOP_MAYSLEEP
Message-ID: <925869a6-7563-459b-b42b-b7b9b8ea0b0a@roeck-us.net>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
 <irmewriceyzxr6jvbiao5vqrvelpftbjalmheodx5w63zi6k2y@dg3wlvs6zryd>
 <PH8PR18MB538122CE6706872B8A836A94C5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
 <7ac2b8db-22c7-4168-b1b7-4f9f0ab10531@pengutronix.de>
 <28a711e5-b2cb-4d5f-bb78-259a01cd4bcc@roeck-us.net>
 <PH8PR18MB53812FCAE180303E5D434275C5CA2@PH8PR18MB5381.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH8PR18MB53812FCAE180303E5D434275C5CA2@PH8PR18MB5381.namprd18.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_172253_219928_6C7CB515 
X-CRM114-Status: GOOD (  26.41  )
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

On Thu, Mar 06, 2025 at 12:18:20PM +0000, George Cherian wrote:
> Hi Guenter,
> 
> I am summarizing the topics we discussed in multiple threads here.
> 
> >>On 3/5/25 03:01, Ahmad Fatoum wrote:
> >> Hi George,
> >> Hi Guenter,
> >> 
> >> On 05.03.25 11:34, George Cherian wrote:
> >>>> why is armada_37xx_wdt also here?
> >>>> The stop function in that driver may not sleep.
> >>> Marek,
> >>>
> >>> Thanks for reviewing.
> >>> Since the stop function has a regmap_write(), I thought it might sleep.
> >>> Now that you pointed it out, I assume that it is an MMIO based regmap being used for armada.
> >>> I will update the same in the next version
> >> 
> >> Failure to add WDIOF_STOP_MAYSLEEP when it's needed can lead to
> >> kernel hanging. Failure to add an alternative WDIOF_STOP_ATOMIC
> >> would lead to the kernel option being a no-op.
> >> 
> >> I think a no-op stop_on_panic (or reset_on_panic) is a saner default.
> >> 
> >
> >Agreed. Also, I like WDIOF_STOP_ATOMIC more than the WDIOF_STOP_NOSLEEP
> >I had suggested in my other response.
> 
> 1. Instead of blacklisting drivers as WDIOF_STOP_MAYSLEEP, the option will an opt-in.
> 2. This may not be WDIOF_STOP_AOMIC, instead would be a generic flag not limited to STOP
>     operation. May be WDIOF_OPS_ATOMIC (OPS include - .start, .stop, .set_timeout, .ping)

I don't see a value in this because AFAICS atomic operation is only needed when
stopping the watchdog. At least in theory, some watchdogs might need to sleep
for other functions, but not for the stop operation. Please provide a rationale.

> 3. Remove the kernel command line option (stop_on_panic) and have a generic reset_on_panic.
> 4. reset_on_panic=60 (by default )  meaning on a panic the wdog timeout is updated to 60sec
>      or the clamp_t(reset_on_panic, min, max_hw_heartbeat_ms).

Default should be the current behavior, that the watchdog keeps running with the
configured timeout.

> 5. if reset_on_panic=0, it means the watchdog is stopped on panic.

If we need both a panic timeout and the ability to disable the watchdog entirely
on panic, there should be two parameters - one to select the watchdog timeout
on panic, and one to disable the watchdog entirely on panic. If there is only
one parameter, it should be the watchdog timeout on panic, with ==0 meaning
"keep the configured timeout" (i.e., the current behavior).

Thanks,
Guenter

