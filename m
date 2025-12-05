Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545FBD2F7D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 10:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lt2ss1bB/XUliiBno4usPmY/kV/OVOTzpKQ0/U9jwdA=; b=OhRWyPTAbErQkWu3McaOjceqTN
	Tyx7O38rbyaq7AmO9+8BJRXqu+z3GP8+VdofWZQA48tk1PuaO0Z82xnAEReGWMuaI8Ug2AHR5p6yp
	BJO42BMOYxhUVtnKukR0s+HLosYu6pL03eRn7oYs04/HWK9H31n4romA+VZ7G3TNrBWzUlgh/6mGj
	nUdviLxvM8hFg8BPInaPyOpbPZgHvOijoocinRj9NLYQCII+vAt5wf3mRZEqKozmBn8SY0x2lWhQi
	UYnZbvfUok+ZI8WTMs4StolZlCfUpTmg6FiRZo7XgjkgoN+/3snnxhLRK7LuTwEwkq+41LtuWB2qM
	ROuVeP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRTB2-00000009Oit-0ZeC;
	Fri, 05 Dec 2025 10:36:40 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRTAz-00000009OiP-3fCz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 10:36:39 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-641977dc00fso2560922a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 02:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764930995; x=1765535795; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lt2ss1bB/XUliiBno4usPmY/kV/OVOTzpKQ0/U9jwdA=;
        b=cQQAVFzDsDt3QqgklgjbTXG/TzXqxC19+oGoi6HJknAC1cCW5Y5MPSwYMhkYX2xZVg
         1IynnZ0flP0m27Wk2DNPxVfM6E1Db1X/ogXMNRCH6su6x5LZvkfiOOoIx05U6Ml8qttF
         DbfBYN3EzxxbgfU0jbN/TV3zCBxvM3YjUvcPwewTtFsaQed6N+3WCiAltq4daSUlDIyL
         R01NDIK3ONBHr4q0hfTpmbTAvr5eZy++Q6FpcY9ww83Z17E1/GHgwg+bl1oXI1qmjCvN
         xQIFWlsxfLB5Ms+GiuIV/qyhLukAbFGErp6v76yTq+MNTfjgx3zPV+oaaDs+/BlbTEO/
         6R5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764930995; x=1765535795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lt2ss1bB/XUliiBno4usPmY/kV/OVOTzpKQ0/U9jwdA=;
        b=rj9ttuikJfBLAmSpvr55/4CBLeJods0OmC+jzLtQHmksREBAlle/UANg6kgQpT1hqa
         kqtMa0OnfRaChiXiSMIBr2nCqfDq9AWeArgBky2w6+bv7WGTNoX7tbD1lMsfE8c5T6Tm
         MzV3W/BA0U1M9dyA+S0ooRLn/pUdrmyiilxrosSClVrmxXbXYycN/pue32Tfxqb+44Nc
         E9IN3sv8+27VMdqW84jZyUrb2adVaEpsTYwjO1Iw2yq8UWRTZNitluDq8t62Usl5/6wf
         R96dk0Mrpr+s6pNTJXqp1kUHoGFH3DH62B/voy1doOjgBhNSAXOSylP/N+ciiX+p2w27
         d3yg==
X-Forwarded-Encrypted: i=1; AJvYcCUYICqhubN3WVwUjfZj9l1Gaj7pRkMuQNNrXSz+wNs0Sy5IHVvnuotWnlQMqQfgRHlqndLj6j7UY5reOBlOWDQy@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn3iJa1knULsgRra2wi/nGMj+WoYrMxMQqi3ssMYMs4Zk/Q+/5
	mAp1HlRPQ84fRGQevXXgDh5ylyLxxV9VqL6cgOcg/pCQDQehBAVO4qNAQBUEKr9Prq8JbKDkqyW
	pZMGxJw7k3J5ug0KnotiItV+I5iBGdfA=
X-Gm-Gg: ASbGncsurGxMGpo3EhUnhJ81CErcDN5CCDS2B52PXKyuqXOp/ZVot+5rzvX/9sMJmnW
	OPfSPhYQZgX/AVv8Z4srWo6NihdHj45I28DMMEZtJu03DP8mLo8Ui667gGC7lyh8U628toQux8x
	+qn/xTHeBhdkloEz8q+ikEEkWKlulahM7qZeTRgj5yVixQsbzIPFJgDvn4N8xnTsQMvxlGc663g
	7dpGcXVG0QohOLl885D6Y4SuJXdHNkHokNJOuP1p+AQnI5AnoC7KVtSGfNHSEPqdFWHnNAh
X-Google-Smtp-Source: AGHT+IE+rG3U3UyeuHcB+l8KPCjR+GqvN76/IPOhH7l8IWCpoZ+EK9JYRVYvfqJw76f9AXd9IglIk7Wq1kXQQvRqLnk=
X-Received: by 2002:a05:6402:1e8a:b0:640:e78f:f34f with SMTP id
 4fb4d7f45d1cf-6479c3f6469mr8666759a12.10.1764930995213; Fri, 05 Dec 2025
 02:36:35 -0800 (PST)
MIME-Version: 1.0
References: <aRW4PpPjVw1-melm@pluto> <20251123163557.230530-1-a.shimko.dev@gmail.com>
 <20251204-slick-granite-chameleon-58ebc2@sudeepholla>
In-Reply-To: <20251204-slick-granite-chameleon-58ebc2@sudeepholla>
From: Artem Shimko <a.shimko.dev@gmail.com>
Date: Fri, 5 Dec 2025 13:36:23 +0300
X-Gm-Features: AQt7F2qG7F-3Lpc3xir1O-ytYSXmkO7JGeFDlJh_AWq3WNjYJ0rXmgUc-Vv3SZU
Message-ID: <CAOPX747pTsnTzKnaai-ytnmcf6reraTTSk+mssvHri4GMhCsOA@mail.gmail.com>
Subject: Re: [PATCH v4] firmware: arm_scmi: refactor reset domain handling
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: cristian.marussi@arm.com, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_023637_981256_9826E359 
X-CRM114-Status: GOOD (  31.71  )
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

On Thu, Dec 4, 2025 at 7:26=E2=80=AFPM Sudeep Holla <sudeep.holla@arm.com> =
wrote:
>
> On Sun, Nov 23, 2025 at 07:35:57PM +0300, Artem Shimko wrote:
> > Improve the SCMI reset protocol implementation by centralizing domain
> > validation and enhancing error handling.
> >
> > Add scmi_reset_domain_lookup() helper function to validate
> > domain ids and return appropriate error codes. Refactor all
> > domain-specific functions to use this helper, ensuring consistent
> > error handling throughout the reset protocol.
> >
> > Suggested-by: Cristian Marussi <cristian.marussi@arm.com>
> > Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
> > ---
> >
> > Hi Cristian,
> >
> > Thank you for suggesting! If it works for you I'll try to improve the o=
thers protocols.
> >
> > It was tested on my board in QEMU and on real hardware.
> > The functionality didn't break, and peripherals that are reseted via SC=
MI work correctly.
> >
> > As an example, I can provide DMA test results (as one of the processor =
units dependent on SCMI reset).
> >
> > [    2.559040] dw_axi_dmac_platform 1000nda0.nda_dma_0: DesignWare AXI =
DMA Controller, nda channels
> > [    2.569265] dw_axi_dmac_platform 1000nda0.nda_dma_1: DesignWare AXI =
DMA Controller, nda channels
> > [    2.580601] dw_axi_dmac_platform 1000nda0.nda_dma_2: DesignWare AXI =
DMA Controller, nda channels
> >
> > # echo 2000 > /sys/module/dmatest/parameters/timeout
> > # echo 1000 > /sys/module/dmatest/parameters/iterations
> > # echo dma0chan0 > /sys/module/dmatest/parameters/channel
> > [   95.917504] dmatest: Added 1 threads using dma0chan0
> > # echo 1 > /sys/module/dmatest/parameters/run
> > [  101.931372] dmatest: Started 1 threads using dma0chan0
> > [  102.731009] dmatest: dma0chan0-copy0: summary 1000 tests, 0 failures=
 2508.42 iops 19706 KB/s (0)
> >
> > And vice versa:
> >
> > 1. Confirmed that the DMA module is non-functional without a proper res=
et via SCMI.
> > Disabling the reset logic causes a system crash on first access to its =
registers.
> >
> > 2. Requesting a non-existent reset domain:
> >
> > [    2.463400] dw_axi_dmac_platform 1000nda0.nda_dma_0: error -EINVAL: =
Failed to deassert resets
> > [    2.472091] dw_axi_dmac_platform 1000nda0.nda_dma_0: probe with driv=
er dw_axi_dmac_platform failed with error -22
> > [    2.482911] dw_axi_dmac_platform 1000nda0.nda_dma_1: error -EINVAL: =
Failed to deassert resets
> > [    2.491553] dw_axi_dmac_platform 1000nda0.nda_dma_1: probe with driv=
er dw_axi_dmac_platform failed with error -22
> > [    2.502256] dw_axi_dmac_platform 1000nda0.nda_dma_2: error -EINVAL: =
Failed to deassert resets
> > [    2.510735] dw_axi_dmac_platform 1000nda0.nda_dma_2: probe with driv=
er dw_axi_dmac_platform failed with error -22
> >
> > --
> > Regards,
> > Artem
> >
> > ---
> > ChangeLog:
> >   v4: Add Suggested-by tag
> >
> >  drivers/firmware/arm_scmi/reset.c | 59 ++++++++++++++++++++-----------
> >  1 file changed, 39 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/firmware/arm_scmi/reset.c b/drivers/firmware/arm_s=
cmi/reset.c
> > index 0aa82b96f41b..9854a3016d13 100644
> > --- a/drivers/firmware/arm_scmi/reset.c
> > +++ b/drivers/firmware/arm_scmi/reset.c
> > @@ -100,6 +100,7 @@ static int scmi_reset_attributes_get(const struct s=
cmi_protocol_handle *ph,
> >
> >  static int
> >  scmi_reset_domain_attributes_get(const struct scmi_protocol_handle *ph=
,
> > +                              struct reset_dom_info *dom_info,
>
> Instead of changing this, ...
>
> >                                struct scmi_reset_info *pinfo,
> >                                u32 domain, u32 version)
> >  {
> > @@ -107,7 +108,6 @@ scmi_reset_domain_attributes_get(const struct scmi_=
protocol_handle *ph,
> >       u32 attributes;
> >       struct scmi_xfer *t;
> >       struct scmi_msg_resp_reset_domain_attributes *attr;
> > -     struct reset_dom_info *dom_info =3D pinfo->dom_info + domain;
> >
>
> ... You can just follow the pattern you have done everywhere else in this
> change like:
>
> struct reset_dom_info *dom_info;
>
> dom_info =3D scmi_reset_domain_lookup(ph, domain);
> if (IS_ERR(dom_info))
>         return PTR_ERR(dom_info);
>
> Any particular reason for not doing that ?

Hi Sudeep,

Based on perf.c, I added this pattern only to functions that can be
called externally with an invalid domain value.
Therefore, I decided it would be better to change the signature of
scmi_reset_domain_attributes_get (similar to
scmi_perf_domain_attributes_get from pref.c)
to ensure consistency across drivers when working with domain numbers.

If you believe this pattern should be used in
scmi_reset_domain_attributes_get, I'll send you the next version of
the patch.

Thank you very much for reviewing my changes =3D)

Regards,
Artem

