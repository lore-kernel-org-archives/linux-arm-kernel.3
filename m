Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC14C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w/3GNXQSGCY34ByWxnrlCAFhsDJSzJ5v9o2W5RmLNQI=; b=2PomjALQY95X7FdDNX12/c7Hln
	nd5kuJHN5RsHbU6NSTWdIWXROhNLIXujMmXRFwoatP9Mfk13EWOVUJtpUM8nutbOGKVgaDy6qdZ/1
	oNPOG+zGJB8lG1di4Hpwgd1E1uLlSizw5N0kEgpLjBzNutlnpGWufPmR8hEIw1iTFQ2yje4AgPWXI
	2tiktNejRs8Lw395gOWyOzVvG0biE+AWBvGrmb1P8drzt1QodT8G8pBUS/7KVfOXZja1SBul/DCbN
	/D9B1EvDEYDGJv+y0AmCDeU15+PBc+iGCmuR7Qc72PJ0iNRIdYnqtAQT1fo8AI/ctqvCP0ssea6AZ
	4/5i1AnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2X1g-00000002lYk-02WK;
	Fri, 04 Sep 2026 16:44:28 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2X1c-00000002lXw-1mdl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 16:44:26 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-9103228ef53so13527416d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 09:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788540263; x=1789145063; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w/3GNXQSGCY34ByWxnrlCAFhsDJSzJ5v9o2W5RmLNQI=;
        b=b7dAybaXKgKyN5btegm/dY1wPQ8dEEUL5MVQmCk/6hNSuMD9FWNNVY/lkbrmcOFwpz
         lZheptkqa0xbCi0f2C7os/P5uaylVa3WLsfmhDKemCIRz9XE7GnN+kwkM2MapipR2q30
         JxraZxEJRh57l11SpdF57J1AYR58Nyzn0O48srhzX3cQtfC+wbJ7GUdBRH7h3HV0mWA5
         hC3J4ly9moYuJO+A0i4ywBADtt/Ew2fHm9PdpkTFdBFHKiHk9arPfxhUxAvXNM5MSMK8
         Qe9d5ZqYhSPNCwXZN6o4YjhDoywatjs0lmWeGgDS1RVqLs4/XYedZTGB3nXK5Hzx+1yE
         kh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788540263; x=1789145063;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/3GNXQSGCY34ByWxnrlCAFhsDJSzJ5v9o2W5RmLNQI=;
        b=k0T2Lpq/0hiML/4VcFpJzlNa/FxdBpzQwH7oJKL/24MUMLC0/2awB95IMkLy3E3zqc
         rKYh7uSWKnO3pEoO9pSYQZcCjtrr5dURkd3G4cnqx9YNJLFcjliBDXqKW+gUjabr3goA
         R0OfIi8orIyxJJqEgkUf7GJG5FLKkrPXGJceH913igdcebKYRHPhLBLj7NCh1BofqqYq
         wtebinR8JJQF5HeMNzsz2tWFMe8BQH/2vfMTwsLQsyLHhx4tJ6+dPJUBYw5Azuuuj23n
         VqLlo0ww7vJGzSSrzGwGb0+xdJ5x88OExs4iDWy+N9D/GmCguEs03XJs1/yzYT0SD7+n
         Syyg==
X-Forwarded-Encrypted: i=1; AKwUvBxlKTZKK6qNGPJLwartkDdaaU0LAjkEq4Izjpf1CYtzLhhDtGB7YCLc4DmfldvVO4UyewculOjGqoKrULvKnZBk@lists.infradead.org
X-Gm-Message-State: AFuF++nSRxOqtRtwAm7LaUg0wW8ITbOt+uUZ+BshM2WgpTV/uPmGdKLB
	Z2mnaAgZ0G5mXE7gPOpfYEaDiIrUxVU1nIfeY38nk9pzi7yoDe5XR6/fmCyImTpytQ==
X-Gm-Gg: AYBFou3YBI8uJbADH6eRmwbxhlRwqgUJN0bJ2eNhkIMJyXWkkgvTsHFSqg3BRn++XjF
	6+22nKocp3trPUWEzAiJZ9d4K0m1qTfBWYY3Vshrq+TmnTS6xdgjZE5YoncKNo4VGWYyh4hsSva
	mLGgAQNmEza+/A0tG4LFqBtO3rjrfydEDc0y9HJi/knjwadFfOL6tG1slFsbHr2h3sPpz25wmwu
	WWy3kWA0wXq8sL/SRuJb1f+DCCYqXm/peXxfzdDGp8kIErzLLMpKXuoK04VsHUtsBA4Wf8Ka7Px
	oiw+opNaOp/jBhoFyo2kbYnefFEWc26BcWwXupW3d81APnHts4caYCv2/eFV/GWzfLxmBZRThtt
	98jKQCIkrxIzXdg7IKCCrKr76fmWDS2EHZLVYXLcmIJDxMBBhWVtu6F3e3HXfkBDXD9AQody9qs
	Ky31YiNXzfYj8uN8c3i2MV2nei0PULrWWa/XQO3P5KL3TpDZvuYtWGFuBEju4x1A==
X-Received: by 2002:a05:6214:3003:b0:910:3d6e:ed46 with SMTP id 6a1803df08f44-9103f0db656mr78478096d6.31.1788540263010;
        Fri, 04 Sep 2026 09:44:23 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040646d64sm24672736d6.14.2026.09.04.09.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:44:22 -0700 (PDT)
Date: Fri, 4 Sep 2026 12:44:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v8 08/16] usb: hub: Pass |struct usb_port*| to
 usb_port_is_power_on()
Message-ID: <c3740c4f-6ae8-4c6e-8f80-105f1607ef55@rowland.harvard.edu>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-9-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904084158.1341550-9-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_094424_470590_8CB5072D 
X-CRM114-Status: GOOD (  14.45  )
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

On Fri, Sep 04, 2026 at 04:41:47PM +0800, Chen-Yu Tsai wrote:
> usb_port_is_power_on() currently takes |struct usb_hub*|, but only needs
> it to tell if the hub/port is SuperSpeed or not.
> 
> In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
> state tracking field in |struct usb_port|. Either structure can be used
> to identify whether a port/hub is SuperSpeed or not, as the field in
> |struct usb_port| is inherited from the hub:
> 
>     port->is_superspeed = hub_is_superspeed(hub)
> 
> Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
> |struct usb_port*| so a subsequent change can use it.

Minor complaint (not referring to anything you're doing here): 
port->is_superspeed really should have a better name, more like

	port->is_superspeed_capable

or

	port->is_usb3.

As it stands, the name is ambiguous.  It might refer to the speed of 
devices that the port could connect to, or it might refer to the speed 
of the device the port is currently connected to.

Alan Stern

