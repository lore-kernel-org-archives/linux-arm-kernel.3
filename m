Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E49C44515
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 17:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q2L2wpVvjQnpFjcjvsMBn9WiAReQKULlZAY6h8Pahm0=; b=Gvyw/Wrxh7V2cXWpdAAhWDjuUU
	UGEe6hnlrJlx529ON6imJElEznAk+6rtTvFctE9DKmm6Ln3uHc+bx4h43iRR6ybTCzvSv3qBVVwWc
	RTT0yzejpk+hJX6fKWCtTJAKlrsQgmJviQiGcMW44NDgYkwWKu4yb5vAjKuQyHzMJozwxelDgUODb
	criVETB6v09MJhBm7V2/a3s5F4Mq5wXsqE7W+ABTUPIXh6sglezOxBruTymTlvojSp0CvpapWvQAk
	sZV0GgnCAC4uDWLeji6eEyJ+cGtLCjJBPay9rUopYaxppxQDsbYXwxexK2nkMF4XV4sJpirWQpbU6
	oU6O+NLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPyZ-00000000HwM-0j9l;
	Thu, 16 Jul 2026 17:34:23 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPyW-00000000Hve-3pjA;
	Thu, 16 Jul 2026 17:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784223261; x=1815759261;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=LdUVk/NYwiBLxejC3EguQWO9elJf87/PL/iYCAtTcfo=;
  b=JpWcxAJKluwxyzE/qCDFc9p8umLSSvduD5GoIqQNBlwLZd8PgBTEdPmp
   87ySbTmrQ7vo2G4IhPuO7/rHJvGQyCQQXiX4bOaIv56l2sg+s7VzCb681
   rvL6XPZDO/zvue9CgqPcwavTThqxvmKnDb1Izy9GqBnXLhupS40zO7QMH
   m+NqJb3oOyLPgrwX6LT24jGUJaKGUmVTFYsS1zKTVR9nPTmcIvOoglQf+
   tep2EmM4VSd1GJelsHtLt3WZXwk1Dx+gnpR8I1Vjohd0PsJmbKPZQBYJL
   q0IjhCkA4PNA2bHpOowfMMjoCJXfPNo8FVFLrUSPNoCq+ZAmgt4AJd1BE
   g==;
X-CSE-ConnectionGUID: 6xLsh8u8SxmVoau4XXKhwQ==
X-CSE-MsgGUID: ZoH1ssypS/aJn/tLXqUJSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="85009574"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="85009574"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 10:34:20 -0700
X-CSE-ConnectionGUID: G088pS9JRWCNCTzsqTnKsA==
X-CSE-MsgGUID: jHS8gdqYTkewW49IH6KeVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; 
   d="scan'208";a="260157517"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.26])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2026 10:34:14 -0700
Date: Thu, 16 Jul 2026 20:34:11 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v5 10/16] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
Message-ID: <alkWE-bQ9gGIXIJj@ashevche-desk.local>
References: <20260715085348.3457359-1-wenst@chromium.org>
 <20260715085348.3457359-11-wenst@chromium.org>
 <aleKQKH2V-ck-SX6@ashevche-desk.local>
 <CAGXv+5Ed9Cn-NeHiXJ58er7NJs1P2ZUMrjqYac-gSky-TNV8Lw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5Ed9Cn-NeHiXJ58er7NJs1P2ZUMrjqYac-gSky-TNV8Lw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_103420_961472_09336E91 
X-CRM114-Status: GOOD (  23.90  )
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

On Thu, Jul 16, 2026 at 06:02:38PM +0800, Chen-Yu Tsai wrote:
> On Wed, Jul 15, 2026 at 9:25 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> > On Wed, Jul 15, 2026 at 04:53:40PM +0800, Chen-Yu Tsai wrote:

...


> > >       fwnode_handle_put(dev_fwnode(dev));
> > > +     /* usb_hub_create_port_device() could leave an error value */
> > > +     if (!IS_ERR(port_dev->pwrseq))
> > > +             pwrseq_put(port_dev->pwrseq);
> >
> > Hmm... I would rather make pwrseq_put() NULL and error pointer-aware, so
> > it will be no-op in such cases. But I think Bart has his own opinion about
> > this.
> >
> > >       kfree(port_dev->req);
> > >       kfree(port_dev);
> > >  }
> >
> > >               put_device(&port_dev->dev);
> > > +             hub->ports[port1 - 1] = NULL;
> > >               return retval;
> > >       }

...

> > > int usb_hub_create_port_device(struct usb_hub *hub, int port1)
> >
> > > +     port_dev->pwrseq = usb_hub_port_pwrseq_get(port_dev);
> > > +     if (IS_ERR(port_dev->pwrseq)) {
> > > +             retval = dev_err_probe(&port_dev->dev, PTR_ERR(port_dev->pwrseq),
> > > +                                    "failed to get power sequencing descriptor\n");
> > > +             goto err_put_kn;
> >
> > OTOH, how pwrseq can be non-NULL and at the same time port be created?
> 
> I assume by non-NULL you mean returning an error?
> 
> device_register(&port_dev->dev) is called some lines above this.
> 
> usb_port is weird in that usb_hub_create_port_device() does a bunch
> of stuff that is normally done in a driver's probe function. However
> usb_port's driver is just a stub driver add for userspace compatibility
> reasons. See commit d99f6b4130877 ("usb: rename usb_port device objects").
> 
> So at this point the usb_port device has been added to the driver model.
> Or we can just zero out port_dev->pwrseq instead? I guess that is cleaner
> than having some weird check in the release function.

So, why do we need to assign the error pointer to the field directly then?
Make a local variable and assign it if and only if there is no error pointer
in it. Would it work?

-- 
With Best Regards,
Andy Shevchenko



