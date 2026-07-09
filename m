Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD3FC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0io07SKI9Zq4iIODgABtJrQ9iS+xBoIqqRbw2Q3fX6U=; b=PTRJQjwsqK3tTZir01bfYjBbzc
	YHwKgLGzS07tAIg5yvTOxBV1pKSBDY9jCkd39JlSqK5s3cccdzph8cuJIPtY+s3MdimdyQXRUgRK6
	KHcguj6HVa07cFVn4fa9c2Tx6zYV1Yh738kh4chI/lI1wpcFryeT2g8ZGIqAFnVEMngN7o101AdJ8
	P9UWs6+WdjhIa52WotIUlF1uh6uUtdr5qQvxM48IJTXGRV94nivGF3LQ0NtZP+FHKqjKkrUbgyQC+
	WFcRI4sekiqFdogfvlMuLmKtEQml5QMrsOqHia/dnXdR6xHL7iFWVIheZ0WRYQdDLaK2rmix7hyur
	AbcGeuSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whonz-00000002YbT-3ljt;
	Thu, 09 Jul 2026 13:28:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whonv-00000002YaE-3oFu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 13:28:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783603718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0io07SKI9Zq4iIODgABtJrQ9iS+xBoIqqRbw2Q3fX6U=;
	b=GYvcDDYlHJOkLP67Ka8TxBloIvsChLLBIOPB5hF2f3ZLtOhH2J7o9UIoXnxIUSYxEJiO1k
	1KbSFaZSJ6R2DE8C5On4ytMzkGb+BPh32C+ZidmUHv681uczi9AtaAQsAJroJG3oirc2mQ
	jcqytS17iwHRhQap5lWQIaFBDe995CI=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-DLl3uYawOyW5LEWPHIzbIA-1; Thu, 09 Jul 2026 09:28:36 -0400
X-MC-Unique: DLl3uYawOyW5LEWPHIzbIA-1
X-Mimecast-MFC-AGG-ID: DLl3uYawOyW5LEWPHIzbIA_1783603716
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6650f57ffa8so2436280d50.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 06:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783603716; x=1784208516;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0io07SKI9Zq4iIODgABtJrQ9iS+xBoIqqRbw2Q3fX6U=;
        b=PQOxbkiH4cWjtY0onDH0hGTpyyM8qMzFhUWSWTznFp3ZOaCDcjQf2i1fLvM8Ft0Ah4
         VczGjf3b42dtl9iYYSaJpWovJ+6khi+4EyZ02Z2T1V9xg+tWM5hZ5w573RNT2AhyBAzB
         icSIa1P6KjGUXvGkmPY4q1NtNUWxN/CPrs2/0OPvfIdNoWJ5FAKKTzWONBfceIEle3xc
         x/joyiVMWwYFZsyevln1he0WPL5M8WdMR9QR3PcNnY5+53+vtPW7huHynYafcjpkxSdb
         hlCktPmZUPf+rsmecXVrMFmR1E3MyN0IShm3UqQ6BoJ/PiUqxeyP8SfZw/PcQxBMtOGt
         J1Pg==
X-Forwarded-Encrypted: i=1; AHgh+RqDfa9Xo3+Zk/vC5pvUs4hhXW0dDgvguFIYk44/+JV3rSPmj692SxPdH9WEkad6WolfVg06BVC2lLL1WucYy0l0@lists.infradead.org
X-Gm-Message-State: AOJu0YyT8tUHzICGctz8uf8Dhng3pIanVpOrAF2QbW1y+P1TVDEDgyrI
	GhPttTf7T2gUethtVosa4jRXnW5DMIRdRh2HIMfhCrRu5sdXLZSz7WLpz4BRP8M+o/C8heBDvE/
	bKCYQ+bJKmnPn4TNqy3CCLIW46VllcUUChrcOiIZJo39su4jjQTCNfqq8di9jw4GU2HCXb25txY
	0O
X-Gm-Gg: AfdE7ck9IDAC02qEbbRjMqCKYf/aEUzu0XnpmSa7bChxuxbdNC3lsFtLHukW7X9NGQj
	xAIFD8j0pm/vkenznRH4/ceG1IfP5FHZseO8KAkNW0x7Ev26Uwy9iw+MLF8PJAMgryLEzJAFfQZ
	UaVOmgXTP6l/m8Antm2F3fxZb75ucWUfmy7F8Dp7mh0KFYcGtgeob+Nsn4WnMCoJ3qxhEe6ot4Z
	V1sJ2+XxI92w47JuUsrXMvGn/dzIJUy+2fQSY9wL1CRlXx/9mB8/PrD7CaXRDtGuotjunxI9JPv
	N8xxp1yK0MFV3nGLRnOX0dv+kj/eRs0rTGd9R0VUspAuZef16wD+zBhUJj+dssGzggfzE2H5ctI
	EKCXkmhsJpiWsr5JFAJzSA4BOWon/uFHuTWHatCnfyed8lg==
X-Received: by 2002:a05:690e:d48:b0:666:39a8:fb82 with SMTP id 956f58d0204a3-6679f02acb3mr4957924d50.14.1783603716000;
        Thu, 09 Jul 2026 06:28:36 -0700 (PDT)
X-Received: by 2002:a05:690e:d48:b0:666:39a8:fb82 with SMTP id 956f58d0204a3-6679f02acb3mr4957877d50.14.1783603715498;
        Thu, 09 Jul 2026 06:28:35 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66787a49befsm4150627d50.16.2026.07.09.06.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:28:34 -0700 (PDT)
Date: Thu, 9 Jul 2026 09:28:18 -0400
From: Brian Masney <bmasney@redhat.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jyoti Bhayana <jbhayana@google.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 0/2] firmware: arm_scmi: Ensure automatic module
 loading
Message-ID: <ak-h8oPcL69fCUg2@redhat.com>
References: <20260618-scmi-modalias-v2-0-8c7547c1be21@oss.qualcomm.com>
 <8c2a4ae3-95cc-489a-a7a4-90a3ee2597e9@oss.qualcomm.com>
 <20260709-spicy-fiery-squid-6eec1d@sudeepholla>
 <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <dae4deba-7e5f-434e-80ae-89033bdeb793@oss.qualcomm.com>
User-Agent: Mutt/2.3.2 (2026-04-26)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BbiHt4Tfr-rMMK_FRxSEEv_KP-FBYD-Kchszm2VRYUc_1783603716
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_062840_018319_F1C9D12C 
X-CRM114-Status: GOOD (  36.63  )
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

Hi Hans,

On Thu, Jul 09, 2026 at 03:22:29PM +0200, Hans de Goede wrote:
> On 9-Jul-26 12:10, Sudeep Holla wrote:
> > On Thu, Jun 18, 2026 at 10:31:12PM +0200, Hans de Goede wrote:
> >> On 18-Jun-26 17:56, Bjorn Andersson wrote:
> >>> SCMI drivers such as the Arm SCMI CPUfreq driver are allowed to built as
> >>> modules, but they are then not automatically loaded. Rework the SCMI
> >>> device table alias support to make modpost consume the information from
> >>> MODULE_DEVICE_TABLE(scmi, ...) and allow drivers to be loaded based on
> >>> this information, if known. Also add a protocol-based alias to also
> >>> trigger driver loading when only the SCMI protocol id is known.
> >>>
> >>> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> >>
> >> So I just gave this a test spin and unfortunately it does not work.
> >>
> >> The problem with Fedora's kernel-config / setup is that the
> >> request_module() from patch 2/2 runs from the initramfs, but
> >> the scmi_cpufreq module is only available in the rootfs.
> >>
> >> It does work if I explictly add the scmi_cpufreq module to
> >> the initramfs, then it does get autoloaded.
> >>
> >> We really need some place to put a uevent sysfs attr which then
> >> gets replayed when udev is restarted from the rootfs and then
> >> re-reads all the uevent files as part of its coldplug
> >> enumeration.
> >>
> > 
> > I don't have much knowledge on uevent to provide any suggestions/help.
> > But isn't this a generic requirement ? I mean you could have modules
> > install on the rootfs and not all of them are packed in initramfs ?
> > Just wondering if that works for other modules, we can examine how
> > do they work and what are we missing ?
> 
> scmi is special because the actual devices under /sys/bus/scmi/devices
> only get created when the module with the driver is loaded because
> of some funtion/id mapping requiring info from the driver.
> 
> Patch 2/2 tries to work around this by loading all scmi drivers matching
> the scmi protocol which is known at bus enumeration time, but this only
> works if the actual scmi driver is in the initramfs because this done
> through directly calling modprobe() from the kernel which does not
> get "replayed" when switching to the real rootfs.

Should the SCMI drivers be added to the dracut module here?

https://github.com/dracut-ng/dracut/blob/main/modules.d/70kernel-modules/module-setup.sh#L73

A few years ago we had to add the interconnect drivers to the list for
Fedora.

Brian


