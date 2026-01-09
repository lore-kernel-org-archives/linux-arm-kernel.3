Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBAFD1A61E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 13:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAHdzldBZjYq7dI8/tRp/QYhozZ+J1rZYVzx9jOFMEc=; b=5FfdtIZF0yQiLA+bqPkfX48uT3
	NiyBjgEC09TpRJXDpu9ZH7lNKCVR9E120pYIilLFyoHR2vrNA3k6BaZ2xtVrfhiLrfReb/AjtLMBI
	KnWtltpFHZhDHwVsNiOhqfQz8+ujufs6xHjVfcJWltwoFNVuSweLbz3rqaEgXSbhiVbh6JTjecXdS
	yLjbqo+YL55qQZhItsnC9QNurBasPJ3RLLEPfkELIlLzBqekUnTtPQFt6OW02w/zM0RHfHYtO+AH8
	4oX6ihKCgS4TmatCi0PoB/WtrPeVtNCCEDSahvk1OwSeU2eSUitraYynzahb9iqOa52EJMsr805cl
	4tSMJAnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veCKi-00000002L22-0lqN;
	Fri, 09 Jan 2026 13:15:16 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veCKf-00000002L1X-2e3m
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 13:15:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767964513; x=1799500513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MJStCIZmQ7PngNhFtsuW1zFBiSqzPLcTWAfWV/VvXr8=;
  b=l+0C2vgSJOR1hBBs9V1UxAbRbescW/aW0zaVquQK97z0PK51t79AQKxl
   suxXNzoadJcPkuUy+63CZ+mZdMpnMafmIk/ObITBiO66jzeZUtD0S39nG
   mi6zAAVM0Z5KyYNbesQ6/PT0eXBzZexLb2hTdGQH/PeS+qyAIAsoob2zG
   t0nM9r1umYHXxuZtckdatIg9MkcmY0pMnoJBSJrFkRsMC4eMTyOE4TNhl
   pXGqR4DI9BUfMuUGUzGK3daTzmZUJsooAgcdoqmLZ4arr7z4MgJBWoqu7
   k2/JjJMqLbckJKjYQo5+WvHjrGwdGL8g4yfwexxDlDKOZVrtDDzcH+q9b
   w==;
X-CSE-ConnectionGUID: IlnRjnlmQJiO2aQcg5vBDg==
X-CSE-MsgGUID: lnMeaqG7SKyuHlsMM1UOUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="71920546"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="71920546"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 05:15:11 -0800
X-CSE-ConnectionGUID: 08MobHMCRUqmHqgXvw+L8g==
X-CSE-MsgGUID: Yah7IGNCQyidLxn0wPz3gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="203384669"
Received: from khuang2-desk.gar.corp.intel.com (HELO kuha) ([10.124.223.90])
  by fmviesa006.fm.intel.com with SMTP; 09 Jan 2026 05:15:05 -0800
Received: by kuha (sSMTP sendmail emulation); Fri, 09 Jan 2026 15:14:44 +0200
Date: Fri, 9 Jan 2026 15:14:44 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: amitsd@google.com
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Badhri Jagan Sridharan <badhri@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
Subject: Re: [PATCH v3 5/5] usb: typec: tcpm/tcpci_maxim: deprecate WAR for
 setting charger mode
Message-ID: <aWD_RIPp1ULH9St1@kuha>
References: <20251227-max77759-charger-v3-0-54e664f5ca92@google.com>
 <20251227-max77759-charger-v3-5-54e664f5ca92@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-max77759-charger-v3-5-54e664f5ca92@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_051513_692600_2B379BFE 
X-CRM114-Status: GOOD (  13.43  )
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

Hi,

> +	if (source) {
> +		if (!regulator_is_enabled(chip->vbus_reg))
> +			ret = regulator_enable(chip->vbus_reg);
> +	} else {
> +		if (regulator_is_enabled(chip->vbus_reg))
> +			ret = regulator_disable(chip->vbus_reg);
> +	}

It looks like you have to do one more round, so can drop the
regulator_is_enabled() checks and just always enable/disable it
unconditionally.

        if (source)
		ret = regulator_enable(chip->vbus_reg);
	else
		ret = regulator_disable(chip->vbus_reg);

I don't think you need the check in any case, but if I've understood
this correctly, you should not use that check when the regulator does
not support that check because then the API claims it's always
enabled. So I guess in that case "if (!regulator_is_enabled())" may
not work as expected, and you may actually be left with a disabled
regulator. This may not be a problem on current platforms, but who
knows what happens in the future.

thanks,

-- 
heikki

