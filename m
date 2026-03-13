Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC33E105F784
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJRcXswX+CrYt/o0aKBfx45D2DsndeMiZyfcaVrP8O8=; b=He8nfAmu4H6zuVVmk1lbEQryaf
	ahbeX9UFn+dh9AH1quhYp4lVMk1aARUW8paAUV1fEdnL1SbGmkfmwyCxC/9Eymz0uD2MRihVkdWHj
	/liEnI3H8NdWIR5j57xk8QdvBdogTVBxvaxHaJE/+dOl6a9zUnEznQZyfaTIL4tTq1macBSxBqJIJ
	UtfZwqf6z2dQlUcQUvcMBxca8yoe48n9aWTEx9GfInBQ5XkOEdk8Fn+/bTes6UGzzSSFjwIRkB8yg
	ROSou8w/uH96FYn2W+YODKGvPOdcF3cT1FrfajTaSBH1PwzwaadlaxArddOFIz5krI2TKpiuY5lmL
	bzjUCEmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yqO-0000000HOFz-0OzP;
	Fri, 13 Mar 2026 09:30:08 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yqL-0000000HOFK-2FGB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773394206; x=1804930206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ClY2wRaESVURRmRqKK2FcwN9QyfCcetyXgPPPCHz0Rw=;
  b=iT/cob3ik5s9UWlzsDNhCdZ7IRs92zdAig+4B5FKomGophqnVLM973h7
   WuXN2WIYHOWVKwitsdXYPh0gLZRmRs6H7kSFW4VmoE8PkxAx9a/keCnCz
   IBNjaAD9t2ElLqBHXKJcVQWRxsfOdoLt7YCcBo49dzXrCtqdTNwBLQq2o
   daH3q5sssWVDSwXJ0ijW5PfEJ2Vrh4DlnRE6aW6QWMTWIPIzsa6T1MlX3
   nFJjwEXuz7b7FG/LaA728apegyzE/clDUn/i9bh98/ZlUvnQdlFI5MfYM
   I/kadQ9EpT1LxyQJu7LBhVpo25uC/0LAHApXKd5TrdmsNWFk6rnvhl0kr
   w==;
X-CSE-ConnectionGUID: zC53lq91S6a7L/elrsM+fg==
X-CSE-MsgGUID: fk6pgOqpRwWjyatinb2/PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74380772"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74380772"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 02:30:05 -0700
X-CSE-ConnectionGUID: YbLZYZgbS5qp7ng0VxytMA==
X-CSE-MsgGUID: 2Z5y++EfR/aJlHbErsrYhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="226068259"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.246])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 02:29:53 -0700
Date: Fri, 13 Mar 2026 11:29:51 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Tomas Borquez <tomasborquez13@gmail.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Alisa-Dariana Roman <alisa.roman@analog.com>,
	Peter Rosin <peda@axentia.se>,
	Marius Cristea <marius.cristea@microchip.com>,
	Matteo Martelli <matteomartelli3@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Benson Leung <bleung@chromium.org>,
	Jyoti Bhayana <jbhayana@google.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	Mariel Tinaco <Mariel.Tinaco@analog.com>,
	Janani Sunil <janani.sunil@analog.com>,
	Ariana Lazar <ariana.lazar@microchip.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Shi Hao <i.shihao.999@gmail.com>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Gwendal Grignou <gwendal@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Kurt Borja <kuurtb@gmail.com>, Waqar Hameed <waqar.hameed@axis.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	chuguangqing <chuguangqing@inspur.com>,
	Erikas Bitovtas <xerikasxx@gmail.com>,
	=?iso-8859-1?Q?M=E5rten?= Lindahl <marten.lindahl@axis.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH] cleanup: uintptr_t to unsigned long
Message-ID: <abPZD-fLDYzE2WRc@ashevche-desk.local>
References: <20260313013435.25731-1-tomasborquez13@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313013435.25731-1-tomasborquez13@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_023005_614285_03BA3D8E 
X-CRM114-Status: GOOD (  14.80  )
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

On Thu, Mar 12, 2026 at 10:34:35PM -0300, Tomas Borquez wrote:
> Linus has been explicit that uintptr_t should not be used in the kernel.

And it's all usually about new code. The shuffling _existing_ code is a churn.
This churn has to be agreed upfront. (That's what Jonathan's mail is, so
you need to have two links and proper message.)

> The iio_chan_spec_ext_info struct uses uintptr_t for the private field
> and in its read/write function pointer signatures. Jonathan Cameron noted
> this should be cleaned up in one go across all users [1].
> 
> Update the struct definition in iio.h and backend.h, along with all
> drivers implementing or using iio_chan_spec_ext_info callbacks.
> 
> No functional change intended.

> [1] https://lore.kernel.org/linux-iio/20260111122034.174c754c@jic23-huawei/
> 

This should be Link tag. And to the original email.

> Suggested-by: Jonathan Cameron <jic23@kernel.org>

We don't accept wrongly prepared patches.
NAK.

...

>  drivers/iio/adc/stm32-dfsdm-adc.c             |  4 ++--
>  drivers/iio/afe/iio-rescale.c                 |  4 ++--
>  drivers/iio/amplifiers/hmc425a.c              |  4 ++--
>  drivers/iio/chemical/sunrise_co2.c            |  8 ++++----
>  .../cros_ec_sensors/cros_ec_sensors_core.c    |  4 ++--
>  drivers/iio/common/scmi_sensors/scmi_iio.c    |  2 +-
>  drivers/iio/dac/ad3530r.c                     |  4 ++--

Besides that, it's much better to group them one per subfolder: adc, dac,
et cetera. Currently this even spams tons of people who do not want to
be spammed.

Take your time and become familiar with the process before sending a proper
version of this.

-- 
With Best Regards,
Andy Shevchenko



